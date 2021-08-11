program salida;
var age: integer;

begin
    writeLn('Ingrese su edad: ');
    readln(age);
    // No neceisto abrir bloque (begin - end)
    if age >= 18 then  
        writeLn('Puede votar')
    else 
        writeLn('No puede votar')

end.