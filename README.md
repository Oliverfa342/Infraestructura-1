# Infraestructura 1 - VPN Site-to-Site entre FortiGate

## Video demostrativo

https://youtu.be/X9XNudyzHuQ

---

**Estudiante:** Oliver Eliam Aquino Paulino  
**Matrícula:** 20241571  
**Asignatura:** Seguridad de Redes

## Propósito de la infraestructura

El propósito de esta infraestructura es comunicar una red de usuarios con un servidor web remoto mediante una VPN Site-to-Site establecida entre dos FortiGate. El ISP simulado transporta el tráfico entre las direcciones WAN de ambos extremos. La comunicación entre las redes privadas debe funcionar cuando la VPN está activa y dejar de funcionar cuando el túnel se deshabilita.

## Direccionamiento

| Segmento | Red / Dirección | Gateway / Peer |
|---|---|---|
| VLAN 10 - Usuarios | 10.15.71.0/25 | 10.15.71.1 |
| WAN FG1 | 203.0.113.157/30 | ISP 203.0.113.158 |
| WAN FG2 | 198.51.100.158/30 | ISP 198.51.100.157 |
| Servidor WEB | 10.15.71.128/28 | 10.15.71.129 |
| WEB-SRV | 10.15.71.130/28 | HTTPS/443 |
| Loopback ISP | 192.0.2.157/32 | Pruebas de conectividad |

## Documentación

- [Documentación completa](Documentacion_Infraestructura1_VPN_Oliver_Aquino.pdf)

## Scripts y comandos

- [Configuración completa y pruebas](scripts/Configuracion_Completa_y_Pruebas_Infraestructura1.md)
- [Scripts y comandos](scripts/Scripts_Comandos_Infraestructura1.txt)
- [Comandos de pruebas](scripts/Comandos_Pruebas_Infraestructura1.txt)
- [Direccionamiento y puertos](scripts/Direccionamiento_y_Puertos_Infraestructura1.txt)
- [Configuración WEB-SRV](scripts/WEB-SRV_configuracion.sh)

## Running-Configs

- [ISP](running-configs/ISP_running-config.txt)
- [SW-USERS](running-configs/SW-USERS_running-config.txt)
- [FG1 - Backup completo sanitizado](running-configs/FG1_FortiGate_BACKUP_COMPLETO_SANITIZADO.conf)
- [FG2 - Backup completo sanitizado](running-configs/FG2_FortiGate_BACKUP_COMPLETO_SANITIZADO.conf)
- [FG1 - Configuración relevante](running-configs/FG1_configuracion_relevante.conf)
- [FG2 - Configuración relevante](running-configs/FG2_configuracion_relevante.conf)
- [USER-PC](running-configs/USER-PC_config.txt)
- [WEB-SRV](running-configs/WEB-SRV_configuracion.sh)

## Implementación validada

- VLAN 10 para usuarios con DHCP.
- NAT en ambos FortiGate para salida por la WAN.
- VPN Site-to-Site entre FG1 y FG2.
- Rutas hacia las redes remotas por el túnel.
- Políticas de firewall para tráfico VPN sin NAT.
- Servidor Nginx con HTTPS/443.
- Pruebas de ping, traceroute y HTTPS.
- Verificación de VPN activa e inactiva para demostrar dependencia del túnel.

> Los backups de FortiGate incluidos en este repositorio tienen contraseñas, PSK y claves privadas redactadas.
