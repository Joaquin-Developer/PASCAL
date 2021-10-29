Program pruebaCodigo;

Type PInt = ^Integer;
var 
    puntero: PInt;

Begin
    new(puntero);
    puntero^ := 23;
    WriteLn(puntero^);
    dispose(puntero);
    WriteLn(puntero^)
End.
