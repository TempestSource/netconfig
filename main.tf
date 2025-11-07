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

resource "proxmox_vm_qemu" "vm_test_1" {
    name = "vm-test-1"
    target_node = "gridania"
    clone = "test"
}
