{
Escriba un programa en Pascal que lea una secuencia de enteros positivos de la entrada y despliegue la 
suma de los valores pares leídos. Si no se leyeron valores pares debe desplegar 0. 
El fin de la secuencia de entrada está indicado por el valor -1. La secuencia puede ser vacía (en ese caso,
desplegar 0).
}
Program EjercicioP1;

Var numero, sumaPares: Integer;

Begin
    sumaPares := 0;
    Write('Ingresar secuencia de numero: (-1 para finalizar) ');
    Repeat
        Read(numero);
        If numero Mod 2 = 0 Then
            sumaPares := sumaPares + numero;
    Until numero = -1;

    WriteLn('Suma de los numeros pares: ', sumaPares);

End.