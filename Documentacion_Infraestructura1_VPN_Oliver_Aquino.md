# Documentación - Infraestructura 1

**Estudiante:** Oliver Eliam Aquino Paulino  
**Matrícula:** 20241571  
**Asignatura:** Seguridad de Redes

## 1. Propósito

La infraestructura fue diseñada para comunicar una red de usuarios con un servidor web remoto mediante una VPN Site-to-Site entre dos FortiGate. El ISP simulado funciona como medio de transporte entre las redes WAN de ambos firewalls.

El objetivo principal es comprobar que el usuario puede acceder al servidor cuando el túnel VPN se encuentra activo y que la comunicación deja de funcionar cuando el túnel se deshabilita.

## 2. Topología

Ruta principal:

USER-PC -> SW-USERS -> FG1 -> ISP -> FG2 -> WEB-SRV

FG1 protege la red de usuarios y FG2 protege la red del servidor. Ambos extremos mantienen una VPN IPsec a través del ISP.

## 3. Direccionamiento

| Elemento | Dirección |
|---|---|
| Red usuarios | 10.15.71.0/25 |
| FG1 VLAN10-USERS | 10.15.71.1/25 |
| DHCP usuarios | 10.15.71.2 - 10.15.71.126 |
| FG1 WAN | 203.0.113.157/30 |
| ISP hacia FG1 | 203.0.113.158/30 |
| ISP hacia FG2 | 198.51.100.157/30 |
| FG2 WAN | 198.51.100.158/30 |
| Red servidor | 10.15.71.128/28 |
| FG2 LAN | 10.15.71.129/28 |
| WEB-SRV | 10.15.71.130/28 |
| ISP Loopback | 192.0.2.157/32 |

## 4. VLAN y DHCP

La red de usuarios utiliza VLAN 10 sobre port2 del FG1. El FortiGate funciona como gateway con 10.15.71.1/25 y entrega direcciones por DHCP desde 10.15.71.2 hasta 10.15.71.126, usando 8.8.8.8 como DNS.

El switch conecta el USER-PC como puerto access de VLAN 10 y mantiene un trunk hacia el FortiGate.

## 5. WAN y NAT

FG1 utiliza 203.0.113.157/30 hacia el ISP. FG2 utiliza 198.51.100.158/30 hacia el mismo ISP.

En ambos FortiGate existe una política de salida hacia la WAN con NAT habilitado para permitir tráfico fuera de las redes privadas.

## 6. VPN Site-to-Site

FG1:
- Túnel: VPN-FG1-FG2
- Red local: 10.15.71.0/25
- Red remota: 10.15.71.128/28
- Peer remoto: 198.51.100.158

FG2:
- Túnel: VPN-FG2-FG1
- Red local: 10.15.71.128/28
- Red remota: 10.15.71.0/25
- Peer remoto: 203.0.113.157

Las políticas de VPN permiten el tráfico en ambas direcciones sin aplicar NAT dentro del túnel.

## 7. Servidor HTTPS

WEB-SRV utiliza 10.15.71.130/28 con gateway 10.15.71.129. Se instaló Nginx y OpenSSL y se configuró HTTPS en TCP/443 mediante un certificado autofirmado.

## 8. Pruebas

Se realizaron las siguientes validaciones:
- DHCP en el USER-PC.
- Ping desde USER-PC hacia 10.15.71.130.
- Traceroute hacia el servidor.
- Solicitud HTTPS hacia el servidor.
- Comprobación de VPN activa.
- Desactivación del túnel para demostrar pérdida de comunicación.
- Reactivación del túnel para comprobar recuperación del servicio.

## 9. Resultado

Con la VPN activa, la red de usuarios alcanza correctamente al WEB-SRV y el servicio HTTPS responde. Al desactivar la VPN, la comunicación entre ambas redes deja de funcionar. Al habilitar nuevamente el túnel, el acceso se restablece.

## 10. Conclusión

La infraestructura cumple el objetivo de Seguridad de Redes al interconectar dos redes privadas mediante una VPN Site-to-Site. El diseño separa las redes locales del medio WAN, mantiene políticas específicas para el tráfico VPN y demuestra que la comunicación entre usuario y servidor depende directamente del túnel seguro.
