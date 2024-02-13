#!/bin/bash

# Escriu un script que comprovi l'estat d’un ventall de servidors remots, que es comprovi l'estat de cada servidor i que es registri el resultat en un arxiu. 
# S’ha d'optimitzar el contingut de l’script a partir de l’ús de funcions. Opcionalment, pots usar Here-Docs i el Case.

# Función para comprobar el estado de un servidor remoto y registrar el resultado
check_server_status() {
    local server=$1  # Guarda el nombre del servidor pasado como argumento en la variable local 'server'
    local status # Declara una variable local 'status' para almacenar el estado del servidor

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
