Program Ej11NumerosPrimos;
Var number: Integer;
// Programar EsPrimo() recibe un entero > 1, retorna true si es primo, false caso contrario

Function IsPrimeNumber(num: Integer): Boolean;
Var i : Integer;
Begin
    { Se espera recibir un entero > 1 }
    IsPrimeNumber := True;

    If num > 2 Then Begin
        For i := 2 To (num - 1) Do
            If (num Mod i = 0) Then IsPrimeNumber := False
    End;
End;

Begin 
    Write('Ingresar numero: ');
    ReadLn(number);
    If IsPrimeNumber(number) Then 
        WriteLn('El numero ', number, ' es primo')
    Else
        WriteLn('El numero ', number, ' no es primo')

End.