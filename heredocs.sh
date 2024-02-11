#!/bin/bash

# Solicitar al usuario el nombre de usuario y la dirección del host remoto
read -p "Introduce el nombre de usuario remoto: " usuario
read -p "Introduce la dirección del host remoto: " host

# Comprobar si el nombre de usuario y la dirección del host no están vacíos
if [ -z "$usuario" ] || [ -z "$host" ]; then
    echo "Error: Debes proporcionar tanto el nombre de usuario como la dirección del host."
    exit 1
fi

# Comandos a ejecutar en el sistema remoto utilizando HereDocs
ssh "$usuario@$host" << EOF
echo "Ejecutando comandos en el sistema remoto a través de SSH..."
echo "El sistema operativo es:"
uname -a
echo "Los procesos en ejecución son:"
ps aux
EOF
