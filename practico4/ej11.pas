Program ej11;
{ 
    Dados n, m, reales
    Calcular máximo de f(x)=x2 - 18x + 5
    en el intérvalo [n, m] 
}

Var 
    m, n : Integer;
    valorN, valorM : Real;

Begin
    Write('Ingrese un valor para m: ');
    ReadLn(m);
    Write('Ingrese un valor para n: ');
    ReadLn(n);

    valorN := (n * n) - (18 * n) + 5;
    valorN := (m * m) - (18 * m) + 5;
    If valorN > valorM Then 
        WriteLn('El valor máximo para x en [', n, ', ', m, '] es ', valorN:0:3)
    Else
        WriteLn('El valor máximo para x en [', n, ', ', m, '] es ', valorM:0:3);

End.