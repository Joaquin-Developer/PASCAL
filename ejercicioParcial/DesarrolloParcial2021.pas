Program DesarrolloParcial2021;


{ suma y producto de elementos de un intervalo [a, b] }
Procedure sumaYprod(a, b : Integer; var suma, producto: Integer);   
Var 
    i : Integer;
Begin
    suma := 0;
    producto := 1;
    For i := a To b Do
    Begin
        suma := suma + i;
        producto := producto * i;
    End;
End;

