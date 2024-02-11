#!/bin/bash

# Código de error para uso incorrecto
USG_ERR=7

# Función para determinar el máximo entre dos números
max_dos() {
    # Comprobar si los dos números son iguales
    if [ "$1" -eq "$2" ]; then
        echo 'Iguals'
        exit 0
    # Comprobar si el primer número es mayor que el segundo
    elif [ "$1" -gt "$2" ]; then
        ret_val=$1
    else
        # Si no se cumple ninguna de las condiciones anteriores, el segundo número es mayor
        ret_val=$2
    fi
}

# Función para imprimir el mensaje de error de uso incorrecto y salir con el código de error correspondiente
err_str() {
    echo "Ús: $0 <numero1> <numero2>"
    exit $USG_ERR
}

# Asignar los valores de los argumentos de entrada a variables
NUM_1=$1
NUM_2=$2

# Comprobar si se han proporcionado exactamente dos argumentos
if [ $# -ne 2 ]; then
    err_str
# Comprobar si ambos argumentos son números
elif [ `expr $NUM_1 : '[0-9]*'` -eq ${#NUM_1} ]; then
    if [ `expr $NUM_2 : '[0-9]*'` -eq ${#NUM_2} ]; then
        # Llamar a la función max_dos para encontrar el máximo entre los dos números
        max_dos $NUM_1 $NUM_2
        echo $ret_val
    else
        # Si el segundo argumento no es un número, imprimir el mensaje de error
        err_str
    fi
else
    # Si el primer argumento no es un número, imprimir el mensaje de error
    err_str
fi

exit 0
