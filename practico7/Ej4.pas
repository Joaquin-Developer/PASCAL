{ 
Procedimiento Girar()
Entrada: a = 4, b = 1, c = 7
Resultado: a = 7, b = 4, c = 1 }
Program Ej4;
Var x, y, z : Integer;

Procedure InverValues(var a, b, c : Integer);
Var aux : Integer;
Begin
    aux := c;
    c := b;
    b := a;
    a := aux;
End;

Begin
    WriteLn('Ingresar valores del vector (x, y, z)');
    ReadLn(x, y, z);
    WriteLn(x, ', ', y, ', ', z);
    InverValues(x, y, z);
    WriteLn(x, ', ', y, ', ', z)
End.
