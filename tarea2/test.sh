#!/bin/bash

DIRENT=./entradas
DIRSAL=./salidas
DIRMIOS=./mios
DIRDIFFS=./diffs

## el nombre de leakfile aparece en el .pas
leakfile=memoryleak.log   
if [ -f $leakfile ]
then
    rm $leakfile
fi

echo verificando archivos de test ...
if [ ! -f BuscaMinas.pas ]
then
    echo No encuentro archivo BuscaMinas.pas
    exit 1
fi

if [ ! -f BuscaMinasPlus.pas ]
then
    echo No encuentro archivo BuscaMinasPlus.pas
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

if [ ! -f  estructuraPlus.pas ]
then
     echo No encuentro archivo estructuraPlus.pas
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
fpc -Co -Cr -Miso -gl -gh BuscaMinas

if [ $? -ne 0 ]
then
    echo
    echo "No compila ... corrija errores y vuelva a compilar"
    exit 2
fi

fpc -Co -Cr -Miso -gl -gh BuscaMinasPlus

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
    mv $leakfile $DIRMIOS/$(basename $ee).leakslog
    ./BuscaMinasPlus < $ee > $DIRMIOS/p-$(basename $ee) 2>&1
    mv $leakfile $DIRMIOS/p-$(basename $ee).leakslog
    echo listo
done

errores=0
aciertos=0
leaks=0
# diff
echo ... verificando salidas
for ss in $DIRSAL/*.txt
do
    echo -n verificando $ss ...
    diff $DIRMIOS/$(basename $ss) $ss > $DIRDIFFS/$(basename $ss) 2>&1
    if [ $? -eq 0 ]
    then
	echo -n bien
	let aciertos++
    else
	echo -n mal
	let errores++
    fi
    if  ! grep  -q "0 unfreed memory blocks : 0" $DIRMIOS/$(basename $ss).leakslog
    then
	echo -n " leak"
	let leaks++
    fi
    echo
done

echo Test finalizado: aciertos:$aciertos, errores:$errores, leaks:$leaks.
