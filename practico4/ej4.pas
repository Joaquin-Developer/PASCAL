{
Escriba un programa en Pascal que lea de la entrada 
estándar tres números naturales a, b, n. El programa 
debe exhibir en pantalla todos los múltiplos de 
n que haya entre a y b.
Ejemplo de entrada: a = 3, b = 17, n = 4
Ejemplo de salida: 4 8 12 16
}

Program ej4;

Var a, b, n, i : Integer;
Begin
    Write('Ingresar a: ');
    ReadLn(a);
    Write('Ingresar b: ');
    ReadLn(b);
    Write('Ingresar n: ');
    ReadLn(n);

    For i := a To b Do Begin
        If (i Mod n = 0) Then
            WriteLn('Multiplo: ', i);
    End;

End.