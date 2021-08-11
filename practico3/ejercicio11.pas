program ejercicio11;
{
regla de crammer:
x = (ce - fb) / (ae - db)
y = (af - dc) / (ae -db)
pedir los datos, y resolver sistema de ecuaciones
}
var 
    a, b, c, d, e, f, x, y : Real;

begin
    write('Ingresar valor de a:');
    readLn(a);
    write('Ingresar valor de b:');
    readLn(b);
    write('Ingresar valor de c:');
    readLn(c);
    write('Ingresar valor de d:');
    readLn(d);
    write('Ingresar valor de e:');
    readLn(e);
    write('Ingresar valor de f:');
    readLn(f);
    if (a * e - d * b) = 0 then
        writeLn('no se puede dividir entre cero')
    else begin
        x := (c * e - f * b) / (a * e - d * b);
        y := (a * f - d * c) / (a * e - d * b);
        writeLn('Valor de x: ', x:0:4);
        writeLn('Valor de y: ', y:0:4);    
    end;
    

end.