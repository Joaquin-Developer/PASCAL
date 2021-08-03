program PeriodoPendulo;
{ t = 2 * pi * sqrt (l / g) }
{ donde pi = 3.14, g = 9.8 y l es leído de la entrada estándar. }

const 
    pi = 3.14;
    g = 9.8;

var l, t : Real;

begin
    write('Ingresar la longitud del péndulo: ');
    readLn(l);
    t := 2 * pi * sqrt(l / g);
    { t:0:5 para dejar 5 lugares después de la coma }
    writeLn('El período de un pendulo de longitud ', round(l), ' es: ', t:0:5);

end.