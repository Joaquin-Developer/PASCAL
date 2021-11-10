Program ex;
Type
    rango = 1..10;
    arr = Array [rango] Of Integer;
Var
    arreglo: arr;
    i : Integer;

Begin

    For i := 1 To 10 Do arreglo[i] := i;

    // da un Runtime error (indice fuera de rango)
    // For i := 1 To 20 Do 
    //     Write(arreglo[i], '-');
    // WriteLn();

End.