variable "pve_pm_api_url" {
  description = "Target Proxmox API endpoint"
}
variable "pve_pm_api_token_id" {
  description = "API token you have previously created for a specific user"
}
variable "pve_pm_api_token_secret" {
  description = "UUID that is only available when initially creating the token"
}
variable "pve_pm_otp" {
  description = "2FA OTP code"
  default     = ""
}
variable "cores" {
  default = "1"

}
variable "disks" {
  type = set(object({
    size    = string
    storage = optional(string, "vm")
  }))
  description = "Additional disks"
  default = [
    { size = "10G" }
  ]
}
variable "gw" {
  default = "10.10.10.1"
}
variable "nameserver" {
  default = "10.10.10.5"
}
variable "net_bridge" {
  default = "vmbr1"
}
variable "vms_map" {
  type        = map(map(string))
  description = "Map of maps with VMs' configuration; the key of the outer map is a VM's name"
  default = {
    nginx = {
      vm_id     = "130",
      vm_name   = "nginx",
      cores     = "1"
      custom_ip = "10.10.10.30/24"
      ipconfig0 = "gw=10.10.10.1,ip=10.10.10.30"
    }
  }
}
