#!/bin/bash

#chmod +x scheduler_discovery.sh


# Practica: Exploracion del Scheduler Real en Linux (Ubuntu 22.04)
# Scheduler utilizado: CFS (Completely Fair Scheduler)

# INFORMACION DEL KERNEL

echo "Los headers del kernel estan en /usr/src y la version del kernel de ubuntu 22.04 es:"
uname -r
echo

# El kernel de Linux ya viene compilado dentro del sistema operativo. Para poder analizar 
# su codigo fuente en C, es necesario instalar el paquete linux-source.



# DESCARGA DEL CODIGO FUENTE DEL KERNEL

sudo apt install linux-source
echo "El codigo fuente del Kernel de Linux ha sido descargado"
echo

# El codigo fuente del kernel se descarga en el directorio
# /usr/src, que es donde Linux guarda los archivos del sistema.



# CAMBIAR AL DIRECTORIO DEL KERNEL

cd /usr/src/ || exit
pwd
echo

# En este directorio podemos encontrar archivos comprimidos
# que contienen el codigo fuente completo del kernel.



# DESCOMPRESION DEL CODIGO FUENTE

echo "Archivo a descomprimir: linux-source-5.15.0.tar.bz2"
sudo tar -xjf linux-source-5.15.0.tar.bz2
echo "Archivo descomprimido"
echo

# Una vez descomprimido, se crea una carpeta con el codigo
# fuente completo del kernel Linux.



# ENTRANDO AL CODIGO FUENTE

cd linux-source-5.15.0 || exit
pwd
echo

# Aqui se encuentra toda la implementacion del kernel,
# incluyendo memoria, procesos, drivers y scheduling.



# EXPLORANDO LA ESTRUCTURA DEL KERNEL

ls
echo

# El scheduler pertenece al nucleo del sistema operativo,
# por lo que se encuentra dentro del directorio kernel.



# DIRECTORIO KERNEL

cd kernel/ || exit
pwd
echo
ls
echo

# Dentro del directorio kernel se encuentra el subsistema
# encargado de la planificacion de procesos.



# DIRECTORIO SCHED

cd sched/ || exit
pwd
echo
ls
echo

# Este directorio contiene los archivos relacionados con
# los distintos schedulers que soporta Linux.



# ARCHIVO core.c

cat core.c
echo
echo "Este archivo contiene la base general del scheduler de Linux"
echo

# core.c define la infraestructura principal del scheduler.
# Aqui se manejan las colas de procesos y la logica general
# para seleccionar que proceso se ejecuta.
# No implementa un algoritmo especifico como FCFS o RR,
# sino que sirve como base para todos los schedulers.



# ARCHIVO fair.c

cat fair.c
echo
echo "Este archivo implementa el Completely Fair Scheduler (CFS)"
echo

# fair.c implementa el scheduler por defecto de Linux.
# El CFS no usa orden de llegada ni tiempos fijos.
# Utiliza el concepto de virtual runtime para repartir
# el tiempo de CPU de manera justa entre los procesos.
#
# Cada proceso recibe tiempo de CPU proporcional a su peso
# y prioridad, buscando equidad en lugar de simplicidad.



# RELACION CON FCFS, SJF Y RR

# FCFS:
# Ejecuta procesos en orden de llegada, lo cual puede
# causar bloqueos y mala respuesta en sistemas reales.
#
# SJF:
# Requiere conocer el tiempo de ejecucion de los procesos,
# lo cual no es posible en un sistema operativo real.
#
# RR:
# Usa cuantums de tiempo fijos, pero no considera
# prioridades ni tipos de procesos.
#
# CFS:
# Usa tiempos virtuales y prioridades dinamicas,
# siendo mas justo y eficiente para sistemas modernos.



# PREGUNTA OBLIGATORIA

# Por que Linux no implementa directamente FCFS, SJF o RR?
#
# Porque estos algoritmos son teoricos y no escalan bien
# en un sistema operativo real con miles de procesos.
# Linux necesita un scheduler flexible, justo y eficiente,
# por lo que utiliza el Completely Fair Scheduler.



# FIN DEL SCRIPT

echo "Exploracion del scheduler completada"
