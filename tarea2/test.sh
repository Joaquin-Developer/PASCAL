#!/bin/bash

DIRENT=./entradas
DIRSAL=./salidas
DIRMIOS=./mios
DIRDIFFS=./diffs

echo verificando archivos de test ...
if [ ! -f BuscaMinas.pas ]
then
    echo No encuentro archivo BuscaMinas.pas
    exit 1
fi

if [ ! -f  tarea2.pas ]
then
     echo No encuentro archivo tarea2.pas
     exit 1
fi

if [ ! -f  estructura.pas ]
then
     echo No encuentro archivo estructura.pas
     exit 1
fi

if [ ! -d $DIRENT ]
then
     echo No encuentro directorio $DIRENT
     exit 1
fi

if [ ! -d $DIRSAL ]
then
     echo No encuentro directorio $DIRSAL
     exit 1
fi

if [ ! -d $DIRMIOS ]
then
     mkdir $DIRMIOS
fi

if [ ! -d $DIRDIFFS ]
then
     mkdir $DIRDIFFS
else
     rm -r $DIRDIFFS/*
fi



# compilamos
echo ... compilando BuscaMinas
fpc -Co -Cr -Miso -gl BuscaMinas

if [ $? -ne 0 ]
then
    echo
    echo "No compila ... corrija errores y vuelva a compilar"
    exit 2
fi

echo ... ejecutando tests
for ee in $DIRENT/*.txt
do
    echo -n  ejecutando $ee ...
    ./BuscaMinas < $ee > $DIRMIOS/$(basename $ee) 2>&1
    echo listo
done

errores=0
aciertos=0
# diff
echo ... verificando salidas
for ss in $DIRSAL/*.txt
do
    echo -n verificando $ss ...
    diff $DIRMIOS/$(basename $ss) $ss > $DIRDIFFS/$(basename $ss) 2>&1
    if [ $? -eq 0 ]
    then
	echo bien
	let aciertos++
    else
	echo mal
	let errores++
    fi
done

echo Test finalizado: aciertos:$aciertos, errores:$errores
