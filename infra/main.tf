terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_pages_project" "site" {
  account_id        = var.account_id
  name              = "jacoboneill-dev"
  production_branch = "main"
}

resource "cloudflare_pages_domain" "site" {
  account_id   = var.account_id
  project_name = cloudflare_pages_project.site.name
  name         = "www.${var.domain}"
}

resource "cloudflare_dns_record" "www" {
  zone_id = var.zone_id
  name    = "www"
  type    = "CNAME"
  content = "${cloudflare_pages_project.site.name}.pages.dev"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "apex" {
  zone_id = var.zone_id
  name    = "@"
  type    = "A"
  content = "192.0.2.1"
  proxied = true
  ttl     = 1
}

resource "cloudflare_ruleset" "redirect_apex_to_www" {
  zone_id     = var.zone_id
  name        = "Redirect apex to www"
  phase       = "http_request_dynamic_redirect"
  kind        = "zone"
  description = "Redirect apex domain to www subdomain"
  rules = [{
    description = "Redirect apex to www"
    expression  = "http.host eq \"${var.domain}\""
    action      = "redirect"
    action_parameters = {
      from_value = {
        target_url  = { value = "https://www.${var.domain}" }
        status_code = 301
      }
    }
  }]
}

resource "cloudflare_zone_setting" "always_use_https" {
  zone_id    = var.zone_id
  setting_id = "always_use_https"
  value      = "on"
}
