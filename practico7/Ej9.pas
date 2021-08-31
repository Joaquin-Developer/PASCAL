Program Ej9;

Var x1, y1, x2, y2 : Real;

Function Distance(): Real;
{ Retorna la ditancia entre los puntos (x1, y1) y (x2, y2) }
Begin
    Distance := sqrt(sqr(x2 - x1) + sqr(y2 - y1))
End;

Begin
    Write('Ingresar par (x1, y1) separado por espacios: ');
    ReadLn(x1, y1);
    Write('Ingresar par (x2, y2) separado por espacios: ');
    ReadLn(x2, y2);
    WriteLn('Distancta entre los puntos: ', Distance():0:10)
    
End.