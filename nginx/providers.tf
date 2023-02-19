terraform {
  required_version = ">=1.0.11"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.9.11"
    }
  }
}

provider "proxmox" {
  # PVE URL for connect and token for authorization
  pm_api_url          = var.pve_pm_api_url
  pm_api_token_id     = var.pve_pm_api_token_id
  pm_api_token_secret = var.pve_pm_api_token_secret
  pm_otp              = var.pve_pm_otp

  # Disable check certificates PVE
  pm_tls_insecure = true
  pm_debug        = true
}
