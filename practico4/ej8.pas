Program ej8;
Var 
    character : Char;
    n, i, j : Integer;

Begin
    Write('Ingresar el caracter: ');
    ReadLn(character);
    Write('Ingresar n: ');
    ReadLn(n);

    For i := n Downto 1 Do
    Begin
        For j := 1 To i Do
            Write(character);
        WriteLn('');
    End;

End.