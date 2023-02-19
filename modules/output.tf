output "vm_name" {
  value = proxmox_vm_qemu.this.name
}
output "vm_ipconfig0" {
  value = proxmox_vm_qemu.this.ipconfig0
}