Program desarrolloParcial2019;
Var 
    dato, numero, cant : Integer;

Function multDato(num1, num2 : Integer): Boolean;
Begin
    multDato := (num1 Mod num2) = 0
End;

Begin
    Write('Ingresar dato: ');
    ReadLn(dato);
    Read(numero);

    If numero > 0 Then
    Begin
        cant := 0;
        Repeat
            If multDato(numero, dato) Then cant := cant + 1;
            Read(numero)
        Until numero = 0;
    End;
    WriteLn('Cantidad: ', cant)
End.