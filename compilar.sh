#!/bin/bash
echo "Ingresar ruta del archivo Pascal a compilar:"
fpc -Co -Cr -Miso -gl $1
