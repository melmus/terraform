terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

locals {
  ip        = var.custom_ip != "" ? var.custom_ip : "${var.default_subnet}.${var.vm_id}/${var.default_mask}"
  ipconfig0 = "gw=${var.gw},ip=${local.ip}"
  disks     = var.disks == null ? [] : var.disks
}

resource "proxmox_vm_qemu" "this" {
  name        = var.vm_name
  desc        = var.vm_desc
  vmid        = var.vm_id
  target_node = var.vm_node

  clone = var.template_name

  # Options
  onboot           = var.onboot
  boot             = var.boot
  agent            = var.agent
  automatic_reboot = var.auto_reboot
  numa             = var.numa

  # Hardware
  memory  = var.memory
  balloon = var.balloon
  cores   = var.cores
  sockets = var.sockets
  vcpus   = var.vcpus
  cpu     = var.cpu
  bios    = var.bios
  qemu_os = var.qemu_os
  scsihw  = var.scsihw
  hotplug = var.hotplug

  # Display
  vga {
    type   = var.vga_type
    memory = var.vga_memory
  }
  # Network
  network {
    model  = var.net_model
    bridge = var.net_bridge
  }
  ipconfig0    = local.ipconfig0
  nameserver   = var.nameserver
  searchdomain = var.searchdomain

  # Disks
  disk {
    type     = var.system_disk.type
    storage  = var.system_disk.storage
    cache    = var.system_disk.cache
    iothread = var.system_disk.iothread
    discard  = var.system_disk.discard
    size     = var.system_disk.size
  }

  dynamic "disk" {
    for_each = local.disks

    content {
      type     = disk.value.type
      storage  = disk.value.storage
      cache    = disk.value.cache
      iothread = disk.value.iothread
      discard  = disk.value.discard
      size     = disk.value.size
    }
  }
}