Program ej7;

Var n, i, j, number : Integer;

Begin
    Write('Ingresar valor para n: ');
    ReadLn(n);
    Write('Ingrese ', n, ' enteros: ');
    For i := 1 To n Do Begin
        ReadLn(number);
        For j := 1 To number Do Begin
            Write('*');
        End;
        WriteLn();
    End;

End.