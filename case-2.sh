#!/bin/bash

# Realitza un script al que se li passarà un nom d’usuari que, amb l’inici de la seva execució, comprovi si s’ha passat un nom d’usuari per paràmetres i que, 
# a continuació, ofereix tres opcions: Ofereix comprovar si  amb drets d’administrador, si l’usuari existeix i si la ruta del directori personal és vàlida (o existeix). No cal que definir funcions.

# Comprobar si se ha pasado un nombre de usuario como parámetro
if [ $# -eq 0 ]; then
    echo "Error: No s'ha proporcionat cap nom d'usuari com a paràmetre."
    exit 1
fi

username="$1"

# Mostrar opciones al usuario
echo "Selecciona una opció:"
echo "1. Verificar si l'usuari té drets d'administrador."
echo "2. Verificar si l'usuari existeix."
echo "3. Verificar si la ruta del directori personal de l'usuari és vàlida o existeix."
read -p "Opció: " opcio

# Procesar la opción seleccionada
case $opcio in
    1)
        # Verificar si el usuario tiene derechos de administrador
        if id -Gn "$username" | grep -q '\bwheel\b\|sudo'; then
            echo "L'usuari $username té drets d'administrador."
        else
            echo "L'usuari $username no té drets d'administrador."
        fi
        ;;
    2)
        # Verificar si el usuario existe
        if id "$username" &>/dev/null; then
            echo "L'usuari $username existeix."
        else
            echo "L'usuari $username no existeix."
        fi
        ;;
    3)
        # Verificar si la ruta del directorio personal del usuario es válida o existe
        if [ -d "/home/$username" ]; then
            echo "La ruta del directori personal de l'usuari $username és vàlida i existeix."
        else
            echo "La ruta del directori personal de l'usuari $username no és vàlida o no existeix."
        fi
        ;;
    *)
        echo "Opció invàlida. Si us plau, selecciona una opció vàlida (1, 2 o 3)."
        ;;
esac
