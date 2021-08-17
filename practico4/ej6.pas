Program ej6;
(* Pedir n numeros y mostrar cual es el mayor *)

Var n, i, max, aux : Integer;
Begin
    Write('Ingresar n: ');
    ReadLn(n);
    Write('Ingresar n enteros:');
    ReadLn(max);

    For i := 2 To n Do Begin
        Write('Ingresar n enteros:');
        ReadLn(aux);
        If aux > max Then max := aux;
    End;

    WriteLn('El naximo es: ', max);

End.