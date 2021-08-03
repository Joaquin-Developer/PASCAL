PROGRAM Muestra1 (output);
CONST
    pi = 3.1415926535;
    r1 = 2.0;
    r2 = 5.0;
VAR
    area: Real;
BEGIN
    area := pi * r1 * r1;
    writeLn (r1, area); (* Exhibir valor de r1 y area *)
    area := pi * sqr (r2);
    writeLn (r2, area)  (* Exhibir valor de r2 y area *)
END.
