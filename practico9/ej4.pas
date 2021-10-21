Program ej4;
Var
    x : Integer;

// Por Referencia: cambia el valor de la variable original
Procedure PorReferenciaSetX(var x: Integer);
Begin
    x := 40;
    WriteLn('En Set() x vale = ', x)
End;

// Por valor: no cambia el valor de la variable original
Procedure PorValorSetX(x: Integer);
Begin
    x := 40;
    WriteLn('En Set() x vale = ', x)
End;

Begin 
    x := 16;
    WriteLn('Por primera vez x vale = ', x);
    // PorReferenciaSetX(x);
    PorValorSetX(x);
    WriteLn('AL final x vale = ', x);

End.