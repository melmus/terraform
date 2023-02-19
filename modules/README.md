## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.11 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_vm_qemu.this](https://registry.terraform.io/providers/telmate/proxmox/2.9.11/docs/resources/vm_qemu) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent"></a> [agent](#input\_agent) | Set to 1 to enable the QEMU Guest Agent | `number` | `1` | no |
| <a name="input_auto_reboot"></a> [auto\_reboot](#input\_auto\_reboot) | Automatically reboot the VM when parameter changes require this | `bool` | `true` | no |
| <a name="input_balloon"></a> [balloon](#input\_balloon) | The minimum amount of memory to allocate to the VM in Megabytes, when Automatic Memory Allocation is desired | `number` | `0` | no |
| <a name="input_bios"></a> [bios](#input\_bios) | The BIOS to use, options are seabios or ovmf for UEFI | `string` | `"seabios"` | no |
| <a name="input_boot"></a> [boot](#input\_boot) | The boot order for the VM | `string` | `"order=scsi0"` | no |
| <a name="input_cores"></a> [cores](#input\_cores) | The number of CPU cores per CPU socket to allocate to the VM | `number` | `8` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The type of CPU to emulate in the Guest | `string` | `"kvm64"` | no |
| <a name="input_custom_ip"></a> [custom\_ip](#input\_custom\_ip) | Custom IP address, which will be provisioned on VM; overrides IP created with vmid | `string` | `""` | no |
| <a name="input_default_mask"></a> [default\_mask](#input\_default\_mask) | Default subnet mask for VMs | `string` | `"24"` | no |
| <a name="input_default_subnet"></a> [default\_subnet](#input\_default\_subnet) | Default subnet for VMs | `string` | `"10.10.10"` | no |
| <a name="input_disks"></a> [disks](#input\_disks) | Set of additions disks; only their size must be specified explicitly | <pre>set(object({<br>    type     = optional(string, "scsi")<br>    storage  = optional(string, "local-lvm")<br>    cache    = optional(string, "writethrough")<br>    iothread = optional(number, 1)<br>    discard  = optional(string, "on")<br>    size     = string<br>  }))</pre> | `null` | no |
| <a name="input_gw"></a> [gw](#input\_gw) | Our default gateway | `string` | `"10.10.10.1"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory to allocate to the VM in Megabytes | `number` | `4096` | no |
| <a name="input_nameserver"></a> [nameserver](#input\_nameserver) | Our Name servers | `string` | `"10.10.10.5"` | no |
| <a name="input_net_bridge"></a> [net\_bridge](#input\_net\_bridge) | Bridge to which the network device should be attached | `string` | `"vmbr0"` | no |
| <a name="input_net_model"></a> [net\_model](#input\_net\_model) | Network Card Model | `string` | `"virtio"` | no |
| <a name="input_onboot"></a> [onboot](#input\_onboot) | Whether to have the VM startup after the PVE node starts | `bool` | `true` | no |
| <a name="input_qemu_os"></a> [qemu\_os](#input\_qemu\_os) | The type of OS in the guest | `string` | `"l26"` | no |
| <a name="input_scsihw"></a> [scsihw](#input\_scsihw) | The SCSI controller to emulate | `string` | `"virtio-scsi-single"` | no |
| <a name="input_searchdomain"></a> [searchdomain](#input\_searchdomain) | Our main domain | `string` | `"local"` | no |
| <a name="input_sockets"></a> [sockets](#input\_sockets) | The number of CPU sockets to allocate to the VM. | `number` | `1` | no |
| <a name="input_system_disk"></a> [system\_disk](#input\_system\_disk) | Describes system disk | <pre>object({<br>    type     = optional(string, "scsi")<br>    storage  = optional(string, "local-lvm")<br>    cache    = optional(string, "writethrough")<br>    iothread = optional(number, 1)<br>    discard  = optional(string, "on")<br>    size     = string<br>  })</pre> | <pre>{<br>  "size": "20G"<br>}</pre> | no |
| <a name="input_template_name"></a> [template\_name](#input\_template\_name) | Name of the VM's template | `string` | `"template-ubu20"` | no |
| <a name="input_vcpus"></a> [vcpus](#input\_vcpus) | The number of vCPUs plugged into the VM when it starts | `number` | `0` | no |
| <a name="input_vga_memory"></a> [vga\_memory](#input\_vga\_memory) | Sets the VGA memory (in MiB) | `number` | `0` | no |
| <a name="input_vga_type"></a> [vga\_type](#input\_vga\_type) | The type of display to virtualize | `string` | `"std"` | no |
| <a name="input_vm_desc"></a> [vm\_desc](#input\_vm\_desc) | VM's desscription | `string` | `""` | no |
| <a name="input_vm_id"></a> [vm\_id](#input\_vm\_id) | VM's id | `number` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Human readable name of the VM | `string` | n/a | yes |
| <a name="input_vm_node"></a> [vm\_node](#input\_vm\_node) | Target node | `string` | n/a | yes |
| <a name="input_vm_os_type"></a> [vm\_os\_type](#input\_vm\_os\_type) | Define provisioning method, based of OS type; shouldn't be updated | `string` | `"cloud-init"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_ipconfig0"></a> [vm\_ipconfig0](#output\_vm\_ipconfig0) | n/a |
| <a name="output_vm_name"></a> [vm\_name](#output\_vm\_name) | n/a |
