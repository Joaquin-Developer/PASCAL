program ej10;
var acosto, bcosto, ccosto, dcosto: real;

begin
    acosto := 4.0;
    bcosto := 1.0;
    ccosto := -2.0;
    dcosto := 5.5;
    writeLn(trunc(dcosto) * abs (ccosto * (bcosto / acosto)));
    { resultado: 2.5 }
    (*writeln(6 + 9 * 8 DIV 2 * round(1.362) - 2 * 3);*)

    writeln(exp(2))

end.