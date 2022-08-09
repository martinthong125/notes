# Design a network

1. Determine IP CIDR
  - Select a Classless Inter-Domain Routing (CIDR) notation that allows for growth and integration

2. Subnetting Requirements
  - Determine how to segment the solution to meet your needs, such as segmenting for n-tiers

3. Connectivity Needs
  - Determine what type of connectivity is needed: internet, resource to resource, resource to service, etc

## Virtual Network (VNet) Features

Reserved IP address
  - x.x.x.0-3
  - x.x.x.255

### Private Networking
DHCP for private IP addressing for resources

### Public Networking
Public IP addressing (IPv4 and IPv6) so that resources can have public connectivity

### Peering
Peering between Azure VNets

### Networ Gateway
Gateway subnets to make VPN connections

### Monitoring
View logs, monitor connectivity, and view a topology of the virtual network

### Default Connectivity
Intra-network traffic and outbound internet traffic is allowed

### Address Restrictions
Smallest VNet subnet size /29
Largest VNet subnet size /8

### DNS and DHCP
DNS and DHCP are build-in

### Network Integration
VNets are built for integration with one another, hybrid connectivity using VPNs and ExpressRoute

### Supported Protocols
VNets support TCP, UDP, and ICMP protocols

## SKU
Basic - default allow all
Standard - default block all

## How to setup a Network Security Group (NSG) for web servers
1. Setup an Application Security Group (ASG) to host the web servers
2. Add rules to the ASG, open ports 80 and 443 to allow http and https traffic
3. Setup NSG by allowing traffic from any source 0.0.0.0/0 and destination as ASG.
4. Add the web servers to the ASG.

## Endpoints

Service Endpoint - connect to Microsoft services

Private Endpoint - connect to Azure services




