#!/bin/bash

# Realitza un script que entri en un bucle i que no en surti fins que l’usuari triï si està segur de continuar avançant en l’espiral d’emocions,
# alegries i èxits en les que es troba (si continua pots fer que s’obri l’enllaç adjunt).

# Función para abrir el enlace en YouTube
abrir_enlace() {
    echo "Obrint l'enllaç a YouTube..."
    xdg-open "https://www.youtube.com/watch?v=jaLDoWqIq2M"
}

# Bucle para preguntar al usuario si desea continuar
while true; do
    # Solicitar la confirmación del usuario
    read -p "Estàs segur de continuar avançant en l’espiral d’emocions, alegries i èxits? (Sí/No): " resposta

    # Utilizamos el case para manejar la respuesta del usuario
    case $resposta in
        [Ss]* ) # Si la respuesta es 'Sí' o 'sí'
            abrir_enlace  # Llamar a la función para abrir el enlace en YouTube
            break ;;    # Salir del bucle
        [Nn]* ) # Si la respuesta es 'No' o 'no'
            echo "Entès. Potser la propera vegada." 
            exit ;;     # Salir del script
        * )     # Para cualquier otra respuesta
            echo "Si us plau, respon 'Sí' o 'No'." ;;
    esac
done
# Si tenemos problemas para ejecutar el enlace pondremos esto en el terminal"xhost +si:localuser:root"
