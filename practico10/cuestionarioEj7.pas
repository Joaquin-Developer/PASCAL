Program cuestionarioEj7;

Type
    Hora = Record
                hh : 0..23;
                mm : 0..59;
            End;
    PInteger = ^Integer;
Var
   h1, h2: Hora;


Begin
    h1.hh := 21;
    h1.mm := 30;
    h2.hh := 21;
    h2.mm := 30;

    If (h1.hh = h2.hh) And (h1.mm = h2.mm) Then 
        WriteLn('Iguales') 
    Else 
        WriteLn('Distintos')

End.