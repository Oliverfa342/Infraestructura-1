# Infraestructura 1 - Configuración completa y pruebas

## Ruta de datos
USER-PC -> SW-USERS -> FG1 -> ISP -> FG2 -> WEB-SRV

## Componentes configurados
- VLAN 10 de usuarios con DHCP.
- NAT de salida en FG1 y FG2.
- VPN Site-to-Site IPsec entre FG1 y FG2.
- Rutas estáticas por la VPN.
- Políticas bidireccionales VPN sin NAT.
- Nginx HTTPS en WEB-SRV.
- ISP con dos enlaces /30 y Loopback de prueba.

## Pruebas
- DHCP en USER-PC.
- Ping USER-PC -> WEB-SRV.
- HTTPS/443.
- Traceroute.
- VPN activa/inactiva.
