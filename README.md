# Network Configuration and Setup

The automation infrastructure behind my homelab network, built around 3 core focuses:

## Automation
- Minimize manual configuration and management
- Save time and reduce risk of misconfiguration

## Modularity
- Resource independence and isolation
- New services cannot break existing resources or corrupt existing data
- Replacement without need for redesign

## Availability
- Ease the recovery process
- Easy to provision replacements
- Isolate failures from breaking other services

# Virtual Machines

Virtual machines isolate and abstract resources
- Requires fewer physical machines
- Small and easy to perform backups
- Separates services from affecting others
- Easily modify available resources to a service

## Proxmox + Terraform

Proxmox provides management tools for virtual machines, such as
- Convenient Web UI
- External API with authentication
- Simple to use resource management

Terraform leverages Proxmox's API to automate creation and management of virtual machines
- Declare resources
- Declare status (running, stopped)
- Configure settings (autostart, boot order)
- Change resources of existing virtual machines
