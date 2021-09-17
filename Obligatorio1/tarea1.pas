
{ función f a la que queremos hallar su integral }
Function f(x: Real): Real;
Var
    { argumentos del seno y la raíz }
    argSeno, argRaiz : Real;
Begin
    argSeno := ((pi * x) + 25) / 10;
    argRaiz := 2 + Sin(argSeno);
    f := x * Sqrt(argRaiz)
End;

{ Dados los extremos izquierdo 'izq' y derecho 'der' del intervalo y la cantidad 
'subintervalos' de rectángulos en que queremos dividir el área, calcula la Suma 
de Riemann para la función f(x). 
Precondiciones: subintervalos > 0 y izq < der. }
Function sumaRiemann(izq, der : Real; subintervalos : Integer) : Real;
Var 
    i : Integer;
    longitudParticion, valorX, suma : Real;
Begin
    suma := 0;
    longitudParticion := (der - izq) / subintervalos;

    For i := 1 To subintervalos Do
    Begin
        valorX := izq + (longitudParticion * (i - 1));
        suma := suma + (longitudParticion * f(valorX));
    End;

    sumaRiemann := suma;
End;

{ Dados los extremos izquierdo 'izq' y derecho 'der' del intervalo y un valor 'delta', retorna la 
menor cantidad de subintervalos 'i', tal que la diferencia entre la Suma de Riemann para la función 
f(x) con 'i' subintervalos y la Suma de Riemann para la función f(x) con 'i-1' sea menor que 'delta'. 
Precondición: izq < der. }
Function riemannHasta(izq, der : Real; delta : Real) : Integer;
Var
    diferencia : Real;
    i : Integer; { subintervalos i }
Begin
    i := 1;
    Repeat
        i := i + 1 ;
        diferencia := sumaRiemann(izq, der, i) - sumaRiemann(izq, der, i - 1)

    Until diferencia < delta;

    riemannHasta := i;
End;
