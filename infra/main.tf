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

# Development CDN bucket.
resource "cloudflare_r2_bucket" "cdn" {
  account_id = var.account_id
  name       = "jacoboneill-dev"
}

# Serve the CDN bucket at cdn.jacoboneill.dev. This resource also manages the
# proxied DNS record for the custom domain, so no separate cloudflare_dns_record
# is required.
resource "cloudflare_r2_custom_domain" "cdn" {
  account_id  = var.account_id
  zone_id     = var.zone_id
  bucket_name = cloudflare_r2_bucket.cdn.name
  domain      = "cdn.${var.domain}"
  enabled     = true
  min_tls     = "1.2"
}

# Wide-open CORS for development: allow any origin, method and header.
resource "cloudflare_r2_bucket_cors" "cdn" {
  account_id  = var.account_id
  bucket_name = cloudflare_r2_bucket.cdn.name

  rules = [{
    allowed = {
      origins = ["*"]
      methods = ["GET", "HEAD", "PUT", "POST", "DELETE"]
      headers = ["*"]
    }
    expose_headers  = ["*"]
    max_age_seconds = 3600
  }]
}
