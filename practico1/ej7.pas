program ej7;
{ Programa para evaluar los resultados del ej.7 del Practico1 }

var 
    operacion1, operacion2, resultado : Integer;
    
begin    
    operacion1 := 6 DIV 2;
    writeLn('6 div 2 = ', operacion1);
    operacion2 := 6 MOD 5;
    writeLn('6 mod 5 = ', operacion2);
    resultado := operacion1 - operacion2;
    writeLn('6 DIV 2 - 6 MOD 5 = ', resultado);
    writeLn(6 div 2 - 6 mod 5);
end.