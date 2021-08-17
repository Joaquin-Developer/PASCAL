Program ej8;
var 
    text: String;
    i : Integer;

Begin
    Write('Ingresar una oracion ($ para terminar): ');
    ReadLn(text);
    i := 1;
    Repeat
        If i > 1 Then Begin
            If text[i - 1] = text[i] Then
                Write(text[i-1], text[i], ' ');
        End;
        i := i + 1;

    Until text[i] = '$'; (* esto está medio turbio *)
    WriteLn();

End.