#!/bin/bash

# Función para comprobar el estado de un servidor remoto y registrar el resultado
check_server_status() {
    local server=$1
    local status

    # Realizar la comprobación del estado del servidor mediante un ping
    if ping -c 1 "$server" &> /dev/null; then
        status="ACTIU"
    else
        status="INACTIU"
    fi

    # Registrar el resultado en el archivo de registro
    echo "$(date +"%Y-%m-%d %H:%M:%S") - El servidor $server está $status" >> registro_servidores.txt
}

# Lista de servidores remotos a comprobar
servidores=("www.google.com" "www.ies-sabadell.cat" "www.youtube.com")

# Comprobar el estado de cada servidor en la lista
for servidor in "${servidores[@]}"; do
    check_server_status "$servidor"
done

# Imprimir un mensaje indicando que la comprobación del estado de los servidores ha finalizado
echo "La comprovació d'estat dels servidors ha finalitzat."
