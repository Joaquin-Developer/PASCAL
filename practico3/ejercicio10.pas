program ejercicio10;
{
Escriba un programa en Pascal que ingrese de la
entrada estándar un entero de hasta cuatro cifras
y lo despliegue en la salida estándar con un
punto de la siguiente manera:
separando la cifra de los millares (si la hay)
de la cifra de las centenas. Su programa no 
necesita controlar que el entero ingresado 
tenga hasta cuatro cifras (asuma que así será).
}
Var num : Integer;
Begin
    WriteLn('Enter a number: ');
    ReadLn(num);
    If num > 999 Then
        WriteLn(num / 1000:0:3)
    Else
        WriteLn(num);
End.
