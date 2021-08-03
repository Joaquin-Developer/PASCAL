program ej14;

var 
    a, b : Integer;
    result : real;

begin
    write('Ingresar valor de a: ');
    readLn(a);
    write('Ingresar valor de b: ');
    readLn(b);
    result := exp(ln(a) * b);
    writeLn(a, ' elevado a la ', b, ' = ', round(result));
    
end.