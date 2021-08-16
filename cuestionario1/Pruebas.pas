program Pruebas;

var 
    a, b, d : Integer;
    
begin
    a := 5;
    b := 1;
    d := 41;

    if (a > b) then
        if ( d = 4) then d := d+1
    else 
        WriteLn('Suerte! (1)');


    if (a > b) then
        begin
            if (d = 4) then
                d:= d + 1
            else
                WriteLn('Suerte! (2)')
        end;


    if (a > b) then
        begin
            if (d = 4) then
                d := d + 1
        end
    else
        WriteLN('Suerte! (3)');


    if (a > b) and ( d = 4) then
        d := d+1
    else if not (a > b) then
        WriteLn('Suerte! (4)');

end.