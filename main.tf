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
  pm_api_url = "http://gridania.shiva.iceheart.xyz:8006/api2/json"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "aleport" {
    name        = "aleport"
    description = "primary container vm"
    target_node = "gridania"
    onboot      = true
    memory      = 16384
    ipconfig0   = "ip=192.168.20.102/24"
    cpu {
        cores = 4
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
                    size = "100G"
                    storage = "local-lvm"
                }
            }
        }
        ide {
            ide0 {
                cdrom {
                    iso = "local:iso/nixos.iso"
                }
            }
        }
    }
}

resource "proxmox_vm_qemu" "rember" {
    name        = "rember"
    description = "lancache"
    target_node = "gridania"
    onboot      = true
    memory      = 8192
    ipconfig0   = "ip=192.168.20.103/24"
    cpu {
        cores = 2
    }
    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
        macaddr = "BC:24:11:C2:D1:66"
    }
    disks {
        scsi {
            scsi0 {
              disk {
                size = "2000G"
                storage = "lancache"
              }
            }
        }
        ide {
            ide0 {
                cdrom {
                    iso = "local:iso/nixos.iso"
                }
            }
        }
    }
}

resource "proxmox_vm_qemu" "himitsu" {
    name        = "himitsu"
    description = "don't worry about it"
    target_node = "gridania"
    onboot      = true
    memory      = 4096
    ipconfig0   = "ip=192.168.20.104/24"
    cpu {
        cores = 2
    }
    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
        macaddr = "BC:24:11:C8:F4:15"
    }
    disks {
        scsi {
            scsi0 {
              disk {
                size = "50G"
                storage = "local-lvm"
              }
            }
        }
        ide {
            ide0 {
                cdrom {
                    iso = "local:iso/alpine.iso"
                }
            }
        }
    }
}
