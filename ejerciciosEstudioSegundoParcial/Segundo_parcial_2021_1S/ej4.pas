Program ej4;

Const N = 2; {entero positivo}

Type 
    ArregloNum =   array [1..N] Of Integer;
    
    ArregloMul =   Record
        multiplos:   array[1..N] Of Integer;
        tope:   0..N;
    End;

// Escribir el procedimiento indicesMultiplos que retorna en el parámetro resultado 
// los índices de los elementos del arreglo enteros que son múltiplos de la constante cte
Procedure indicesMultiplos (enteros: ArregloNum; cte: Integer; Var resultado: ArregloMul);
Var 
    i: Integer;

    Procedure insertarEnArray(Var resultado: ArregloNum; num: Integer);
    Begin
        resultado.multiplos[resultado.tope + 1] := num;
        resultado.tope := resultado.tope + 1
    End;
Begin 
    For i := 1 To N Do 
        If ((enteros[i] Mod cte) = 0) Then 
            insertarEnArray(resultado, i);
End;


Begin 
End.