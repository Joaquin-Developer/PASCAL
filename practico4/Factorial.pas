Program Factorial;
{ pedir un numero y calcular su factorial. }
var
    num, i : Integer;
    fact : Real;

Begin
    Write('Ingresar un numero: ');
    ReadLn(num);
    fact := num;

    For i := (num - 1) DownTo 1 Do
    Begin
        fact := fact * i;
    End;
    WriteLn('El factorial de ', num, ' es ', fact:0:1);

End.