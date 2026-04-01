terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "3.0.2-rc04"
        }
    }
}

variable pm_api_token_id {
    type = string
}

variable pm_api_token_secret {
    type = string
}

provider "proxmox" {
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_api_url = "http://bake:8006/api2/json"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "test1" {
    name        = "test"
    description = "test vm 1"
    target_node = "bake"
    onboot      = true
    memory      = 2048
    cpu {
        cores = 1
    }
    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
        macaddr = "BC:24:11:03:58:0B"
    }
    disks {
        scsi {
            scsi0 {
                disk {
                    size = "10G"
                    storage = "local-lvm"
                }
            }
        }
        # ide {
        #     ide0 {
        #         cdrom {
        #             iso = "local:iso/nixos.iso"
        #         }
        #     }
        # }
    }
}
