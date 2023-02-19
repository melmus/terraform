module "this" {
  for_each       = var.vms_map
  source         = "../modules"
  vm_name        = each.key
  cores          = var.cores
  net_bridge     = var.net_bridge
  disks          = var.disks
  vm_id          = tonumber(each.value["vm_id"])
  default_subnet = each.key
  gw             = var.gw
  nameserver     = var.nameserver
  custom_ip      = tostring(each.value["custom_ip"])
}
