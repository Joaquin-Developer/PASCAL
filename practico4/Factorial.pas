Program Factorial;
{ pedir un numero y calcular su factorial. }
var
    num, i : Integer;
    fact : Real;

Begin
    Write('Ingresar un numero: ');
    ReadLn(num);
    fact := 1;

    For i := 2 To num Do
    Begin
        fact := fact * i;
    End;
    WriteLn('El factorial de ', num, ' es ', fact:0:1);

End.
