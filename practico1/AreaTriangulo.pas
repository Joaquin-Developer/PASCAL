{
    A = sqrt(s * (s - a) * (s - b) * (s - c))
    donde s = (a + b + c) / 2
}

program AreaTriangulo;

var a, b, c : Integer;
var area, s : Real;

begin
    write('Ingresar valor del lado a: ');
    readLn(a);
    write('Ingresar valor del lado b: ');
    readLn(b);
    write('Ingresar valor del lado c: ');
    readLn(c);
    s := (a + b + c) / 2;
    area := sqrt(s * (s - a) * (s - b) * (s - c));
    writeLn('El área es: ', area:0:4); (* 4 valores despues de la coma *)    
 
end.