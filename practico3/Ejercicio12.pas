program Ejercicio12;
{ <>
El costo de enviar por correo una carta es
$0.22 para cartas que pesan hasta una onza
$0.22 más $0.17 por onza adicional
calcular costo dado el peso en onzas
Ejemplo de salida:
Peso Costo
0.50 $0.22
}
var onza : Real;

begin
    write('Ingresar peso en onzas: ');
    readLn(onza);

    if onza <= 0.22 then begin
        writeLn('Peso Costo');
        writeLn(onza:0:2, ' $0.22');
    end else begin
        write('calcular');
    end;
    
end.