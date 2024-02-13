#!/bin/bash

# Función para comprobar el estado de un servidor remoto
check_server_status() {
    local server=$1  # Obtener el nombre del servidor como parámetro
    local status    # Variable para almacenar el estado del servidor
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")  # Obtener la marca de tiempo actual

    # Realizar la comprobación del estado del servidor mediante un ping
    if ping -c 1 "$server" &> /dev/null; then
        status="ACTIU"  # Si el ping es exitoso, el servidor está activo
    else
        status="INACTIU"  # Si el ping falla, el servidor está inactivo
    fi

    # Registrar el resultado en el archivo de registro
    echo "$timestamp - El servidor $server está $status" >> registro_servidores.txt
}

# Lista de servidores remotos que se van a comprobar
servidores=("servidor1" "servidor2" "servidor3")

# Comprobar el estado de cada servidor en la lista y registrar el resultado
for servidor in "${servidores[@]}"; do
    check_server_status "$servidor"  # Llamar a la función para comprobar el estado del servidor actual
done

# Imprimir un mensaje indicando que la comprobación del estado de los servidores ha finalizado
echo "La comprovació d'estat dels servidors ha finalitzat."
