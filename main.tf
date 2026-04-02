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

resource "proxmox_vm_qemu" "kcontr1" {
    name        = "kcontr1"
    description = "Primary Kubernetes Controller"
    target_node = "bake"
    onboot      = true
    memory      = 4096
    cpu {
        cores = 2
    }
    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
        macaddr = "BC:24:11:1B:E4:3C"
    }
    disks {
        sata {
            sata0 {
                disk {
                    size = "20G"
                    storage = "local-lvm"
                }
            }
        }
        ide {
            ide0 {
                cdrom {
                    iso = "local:iso/centos10.iso"
                }
            }
        }
    }
}

resource "proxmox_vm_qemu" "knode1" {
    name        = "knode1"
    description = "Kubernetes Worker Node 1"
    target_node = "bake"
    onboot      = true
    memory      = 8192
    cpu {
        cores = 4
    }
    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
        macaddr = "BC:24:11:1B:E4:47"
    }
    disks {
        sata {
            sata0 {
                disk {
                    size = "100G"
                    storage = "local-lvm"
                }
            }
        }
        ide {
            ide0 {
                cdrom {
                    iso = "local:iso/centos10.iso"
                }
            }
        }
    }
}
