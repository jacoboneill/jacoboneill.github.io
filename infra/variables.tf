variable "cloudflare_api_token" {
  description = "Cloudflare API token with Pages + DNS + Zone scopes on this account"
  type        = string
  sensitive   = true
}

variable "account_id" {
  description = "Cloudflare account ID"
  type        = string
  sensitive   = true
}

variable "zone_id" {
  description = "Cloudflare zone ID for oneilltech.co.uk"
  type        = string
  sensitive   = true
}

variable "domain" {
  description = "Apex domain for this site"
  type        = string
  default     = "jacoboneill.dev"
}
