# Infraestructura 1 - VPN Site-to-Site entre FortiGate

## Video demostrativo

https://youtu.be/X9XNudyzHuQ

---

**Estudiante:** Oliver Eliam Aquino Paulino  
**Matrícula:** 20241571  
**Asignatura:** Seguridad de Redes

## Propósito

Comunicar la red de usuarios con el servidor web remoto mediante una VPN Site-to-Site entre dos FortiGate, utilizando un ISP simulado como medio de transporte.

## Direccionamiento

| Segmento | Red / Dirección | Gateway / Peer |
|---|---|---|
| VLAN 10 - Usuarios | 10.15.71.0/25 | 10.15.71.1 |
| WAN FG1 | 203.0.113.157/30 | 203.0.113.158 |
| WAN FG2 | 198.51.100.158/30 | 198.51.100.157 |
| Red WEB | 10.15.71.128/28 | 10.15.71.129 |
| WEB-SRV | 10.15.71.130/28 | HTTPS/443 |

## Documentación

- [Documentación completa](Documentacion_Infraestructura1_VPN_Oliver_Aquino.md)

## Scripts y comandos

- [Configuración completa y pruebas](scripts/Configuracion_Completa_y_Pruebas_Infraestructura1.md)
- [Scripts y comandos](scripts/Scripts_Comandos_Infraestructura1.txt)
- [Comandos de pruebas](scripts/Comandos_Pruebas_Infraestructura1.txt)
- [Direccionamiento y puertos](scripts/Direccionamiento_y_Puertos_Infraestructura1.txt)
- [Configuración WEB-SRV](scripts/WEB-SRV_configuracion.txt)

## Running-Configs

- [ISP](running-configs/ISP_running-config.txt)
- [SW-USERS](running-configs/SW-USERS_running-config.txt)
- [FG1 - Backup completo sanitizado](running-configs/FG1_FortiGate_BACKUP_COMPLETO_SANITIZADO.conf)
- [FG2 - Backup completo sanitizado](running-configs/FG2_FortiGate_BACKUP_COMPLETO_SANITIZADO.conf)
- [FG1 - Configuración relevante](running-configs/FG1_configuracion_relevante.conf)
- [FG2 - Configuración relevante](running-configs/FG2_configuracion_relevante.conf)
- [WEB-SRV](running-configs/WEB-SRV_configuracion.sh)

## Validaciones

- DHCP en VLAN 10.
- NAT de salida.
- VPN Site-to-Site.
- HTTPS/443.
- Ping y traceroute.
- Prueba con VPN activa e inactiva.
