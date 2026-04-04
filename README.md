# Network Configuration and Setup

This is the code infrastructure for my homelab network. The infrastructure is designed around two main focuses:

## Automation
- The network configuration should deploy automatically and reliably
- Running the configuration multiple times should leave the network in the same state without erasing data
- Little to no manual configuration should need to be done following deployment

## Modularity
- Changing out a specific piece of software for another should not require redesigning the entire infrastructure
- If something is manually added for instance to test out a piece of software, the manual changes should not be erased

# Virtual Machines

Running everything in virtual machines makes managing the network infrastructure more modular and easier to manage
- Less physical machines if running servers of varying operating systems or enforcing segmentation
- Ease of managing and backing up resources for services
- Can easily create and destroy environments for testing


## Promox + Terraform

Proxmox runs as the main server's operating system and provides a user-friendly interface for managing virtual machines. By adding Terraform to the mix, Proxmox virtual machines can be automatically managed through IaC, and their configurations can be easily backed up and reused/reconfigured.

# Kubernetes / Containers

Containers allow software deployments to become distro-agnostic, resuable and easily modified to suit various purposes. Kubernetes allows these containers to become automagically scalable which may seem overkill for a homelab environment, but will hopefully work wonders at LAN parties for load balancing LAN cache servers. Additional containers can automatically spin up on physical/virtual machines using seperate physical NICs when needed to maintain a 1Gb/s download speed even with 20 concurrent users on a 2x10Gb/s backbone.
