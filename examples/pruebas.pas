program pruebas;
var
    gravedadTierra: real = 9.82;
    producto: integer;
    peso: real;
    
begin
    write('Ingresar peso en Kg: ');
    readLn(peso);
    write(peso);
    writeln();
    writeln('Gravedad en la tierra: ', round(gravedadTierra));
    
    writeln('Raiz cuadrada de 2: ', sqrt(2):0:5);
    producto := 5 * 2;
    writeln(producto);
    writeln((producto / 3):0:2);
end.