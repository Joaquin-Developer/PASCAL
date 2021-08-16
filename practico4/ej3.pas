Program ej3;

Var sum, j, ind : Integer;
Const total = 4;

Begin

    sum := 0;
    j := 10;
    For ind := 1 To 5 Do
    Begin
        sum := sum + 2 * ind + 1 + j;
        j := j - 4;
    End;
    WriteLn(sum, ' ', j, ' ', ind);

    sum := 0;
    For ind := 1 To total Do
    Begin
        For j := 1 To ind Do
            sum := sum + ind + j;
    End;
    WriteLn(sum, ' ', j, ' ', ind);

End.