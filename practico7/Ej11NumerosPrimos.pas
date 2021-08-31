Program Ej11NumerosPrimos;
Var number: Integer;
// Programar EsPrimo() recibe un entero > 1, retorna true si es primo, false caso contrario

Function EsPrimo(num: Integer): Boolean;
Var i : Integer;
Begin
    { Se espera recibir un entero > 1 }
    EsPrimo := True;

    If num > 2 Then Begin
        For i := 2 To (num - 1) Do
            If (num Mod i = 0) Then EsPrimo := False
    End;
End;

Begin 
    Write('Ingresar numero: ');
    ReadLn(number);
    If EsPrimo(number) Then 
        WriteLn('El numero ', number, ' es primo')
    Else
        WriteLn('El numero ', number, ' no es primo')

End.