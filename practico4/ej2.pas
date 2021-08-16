Program ej2;
Var i, j, k : Integer;
Begin
    
    For i := 1 To 3 Do
    Begin
        For j := i+1 To 3 Do
            Write(i, j)
    End;

    WriteLn('******************');

    For i := 1 To 3 Do
        WriteLn(i, i+1);

    WriteLn('******************');

    For i := 1 To 4 Do Begin
        If (i = 1) Or (i = 4) Then
            Write(i)
        Else
            Write(i,i)
    End

End.
