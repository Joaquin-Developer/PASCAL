
Program ej1;

Const 
    N =   10;

Type 
    arre =   Array [1..N] Of Integer;

Var 
    arreglo:   arre;
    i:   Integer;
    ar :   Array [1..5] Of Integer;

Procedure PrintArray(arr: arre);
Begin
    For i := 1 To N Do
        Write(arr[i], ' ');
    WriteLn()
End;

Begin
    For i := 1 To N Do
        arreglo[i] := i;

    PrintArray(arreglo)
End.
