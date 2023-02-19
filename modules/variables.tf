###############
# Main config #
###############
variable "vm_name" {
  type        = string
  description = "Human readable name of the VM"
}

variable "vm_desc" {
  type        = string
  description = "VM's desscription"
  default     = ""
}

variable "vm_id" {
  type        = number
  description = "VM's id"
}

variable "vm_node" {
  type        = string
  description = "Target node"
  default = "pve"
}

################
# Preprovision #
################

variable "vm_os_type" {
  type        = string
  description = "Define provisioning method, based of OS type; shouldn't be updated"
  default     = "cloud-init"
  validation {
    condition = contains([
      "ubuntu",
      "centos",
      "cloud-init"
    ], var.vm_os_type)
    error_message = "Wrong os_type."
  }
}

############
# Template #
############

variable "template_name" {
  type        = string
  description = "Name of the VM's template"
  default     = "template-ubu20"
}

############
# Options #
############

variable "onboot" {
  type        = bool
  description = "Whether to have the VM startup after the PVE node starts"
  default     = true
}

variable "boot" {
  type        = string
  description = "The boot order for the VM"
  default     = "order=scsi0"
}

variable "agent" {
  type        = number
  description = "Set to 1 to enable the QEMU Guest Agent"
  default     = 1
}

variable "auto_reboot" {
  type        = bool
  description = "Automatically reboot the VM when parameter changes require this"
  default     = true
}

variable "hotplug" {
  type        = string
  description = "Enable hotplug"
  default     = "network,disk,usb,memory,cpu"
}

############
# Hardware #
############

variable "memory" {
  type        = number
  description = "The amount of memory to allocate to the VM in Megabytes"
  default     = 2048
}

variable "balloon" {
  type        = number
  description = "The minimum amount of memory to allocate to the VM in Megabytes, when Automatic Memory Allocation is desired"
  default     = 0
}

variable "cores" {
  type        = number
  description = "The number of CPU cores per CPU socket to allocate to the VM"
  default     = 2
}

variable "sockets" {
  type        = number
  description = "The number of CPU sockets to allocate to the VM."
  default     = 1
}

variable "vcpus" {
  type        = number
  description = "The number of vCPUs plugged into the VM when it starts"
  default     = 0
}

variable "cpu" {
  type        = string
  description = "The type of CPU to emulate in the Guest"
  default     = "kvm64"
}

variable "bios" {
  type        = string
  description = "The BIOS to use, options are seabios or ovmf for UEFI"
  default     = "seabios"
  validation {
    condition = contains([
      "seabios",
      "ovmf"
    ], var.bios)
    error_message = "Wrong bios type."
  }
}

variable "qemu_os" {
  type        = string
  description = "The type of OS in the guest"
  default     = "l26"
}

variable "scsihw" {
  type        = string
  description = "The SCSI controller to emulate"
  default     = "virtio-scsi-single"
  validation {
    condition = contains([
      "lsi",
      "lsi53c810",
      "megasas",
      "pvscsi",
      "virtio-scsi-pci",
      "virtio-scsi-single"
    ], var.scsihw)
    error_message = "Wrong SCSI controller."
  }
}

variable "numa" {
  type        = string
  description = "Enable numa for hotplug changes"
  default     = "true"
}


###########
# Display #
###########

variable "vga_type" {
  type        = string
  description = "The type of display to virtualize"
  default     = "std"
}

variable "vga_memory" {
  type        = number
  description = "Sets the VGA memory (in MiB)"
  default     = 0
}

###########
# Network #
###########

variable "net_model" {
  type        = string
  description = "Network Card Model"
  default     = "virtio"
}

variable "net_bridge" {
  type        = string
  description = "Bridge to which the network device should be attached"
  default     = "vmbr0"
}

variable "gw" {
  type        = string
  description = "Our default gateway"
  default     = "10.10.10.1"
}

variable "custom_ip" {
  type        = string
  description = "Custom IP address, which will be provisioned on VM; overrides IP created with vmid"
  default     = ""
  validation {
    condition     = can(cidrnetmask(var.custom_ip)) || var.custom_ip == ""
    error_message = "Must be a valid IPv4 CIDR block address."
  }
}

variable "default_subnet" {
  type        = string
  description = "Default subnet for VMs"
  default     = "10.10.10"
}

variable "default_mask" {
  type        = string
  description = "Default subnet mask for VMs"
  default     = "24"
}

variable "nameserver" {
  type        = string
  description = "Our Name servers"
  default     = "10.10.10.5"
}

variable "searchdomain" {
  type        = string
  description = "Our main domain"
  default     = "local"
}

#########
# Disks #
#########

variable "system_disk" {
  type = object({
    type     = optional(string, "scsi")
    storage  = optional(string, "vm")
    #storage  = optional(string, "local-lvm")
    cache    = optional(string, "writethrough")
    iothread = optional(number, 1)
    discard  = optional(string, "on")
    size     = string
  })
  description = "Describes system disk"
  default = {
    size = "20G"
  }
}

variable "disks" {
  type = set(object({
    type     = optional(string, "scsi")
    storage  = optional(string, "local-lvm")
    cache    = optional(string, "writethrough")
    iothread = optional(number, 1)
    discard  = optional(string, "on")
    size     = string
  }))
  description = "Set of additions disks; only their size must be specified explicitly"
  default     = null
}
