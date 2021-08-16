Program ej5;
{
Escriba un programa en Pascal que lea de la entrada
estándar un número natural n y despliegue en pantalla 
todos los divisores naturales de n.
Ejemplo de entrada: n = 116
Ejemplo de salida: 1 2 4 29 58 116
}
Var n, index, divisor : Integer;
Begin
    Write('Ingresar n: ');
    ReadLn(n);

    For index := 1 To n Do
    Begin
        If (n Mod index = 0) Then
            WriteLn(index);
    End;

End.