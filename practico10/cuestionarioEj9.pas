Program cuestionarioEj9;

TYPE tipodia = (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo);
VAR dia : tipodia; 
    i : -1 .. 6;
FUNCTION laborable (a : tipodia) : boolean;
begin
  laborable := (Lunes <= a) and (a <= Viernes) ; 
end;
begin
  read (i) ; 
  while i <> -1 do
  begin
     dia:=tipodia(i) ; 
     if laborable (dia)        
     then writeln ('es laborable')
     else writeln ('no es laborable');
     read (i) ;
  end;
end.



