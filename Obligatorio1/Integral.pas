Program Integral;

{ Función f(x) a la que queremos aproximar su integral.
  Usar las funciones de Pascal: sqrt, sin y pi. }
Function f(x: Real): Real
Var 
    argSeno : Real;
    argRaiz: Real;

Begin
    argSeno := ((PI * x) + 25) / 10;
    argRaiz := 2 + Sin(argSeno);
    f := x * Sqrt(argRaiz)
End;

{ Dados los extremos izquierdo 'izq' y derecho 'der' del intervalo y la 
  cantidad 'subintervalos' de rectángulos en que queremos dividir el área, 
  calcula la Suma de Riemann para la función f(x).
  Precondiciones: subintervalos > 0 y izq < der. }
Function sumaRiemann(izq, der : real; subintervalos : Integer) : Real;
Begin
    (* code here *)
End;

{ Dados los extremos izquierdo 'izq' y derecho 'der' del intervalo y un valor 
 'delta', retorna la menor cantidad de subintervalos 'i', tal que la diferencia
  entre la Suma de Riemann para la función f(x) con 'i' subintervalos y la 
  Suma de Riemann para la función f(x) con 'i-1' sea menor que 'delta'.
  Precondición: izq < der. }
Function riemannHasta(izq, der : Real; delta : Real) : Integer;
Begin
(* code here *)
End;

Begin 


End.