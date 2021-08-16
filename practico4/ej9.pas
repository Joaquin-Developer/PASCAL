Program ej9;
{ Pedir x, n, y calcular x elevado a la n }
Var 
    x, n, i, res : Integer;
Begin
    res := 1;
    Write('Ingresar base: ');
    ReadLn(x);
    Write('Ingresar exponente: ');
    ReadLn(n);
    For i := 1 To n Do
        res := res * x;
    
    WriteLn(x, ' elevado a ', n, ' es ', res);

End.