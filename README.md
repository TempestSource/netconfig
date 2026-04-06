# Network Configuration and Setup

The code infrastructure behind my homelab network, centered around 2 main focuses:

## Automation
- The network configuration should deploy mostly automatically and reliably
- Running configurations to setup new resources should not break old resources

## Modularity
- Resources can be changed for other implementations without redesigning core infrastructure
- Manually configured resources should not be removed or overwritten by automation

# Virtual Machines

Virtual machines are used to isolate services and resources
- Requires fewer phyiscal machines
- Eases the creation and management of backups
- Test environments can be freely created and destroyed without worry
- Segments resources to prevent cascading failures


## Promox + Terraform

Proxmox provides an easy to use interface to virtual machine management, as well as convenient features such as API token creation for management and monitoring.

Terraform leverages this API to declaratively manage virtual machines without affecting unmanged virtual machines or destroying data.

# Kubernetes / Containers

Containers enable software to be further isolated and abstracted, providing a series of benefits such as:
- Distro-agnostic software, allowing the use choose nearly any operating system 
- Ease of installation
- Declarative configurations

Kubernetes leverages the benefits of containers and provides abstractions to increase container availability and scalability
- Containers can be distributed across nodes, providing high-availabity in the event a node is unavailable
- Containers can also be scaled across nodes to provide load balancing when a container's resources become strained