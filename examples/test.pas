Program test;
Var x : Real;

Function multDato(num1, num2 : Integer): Boolean;
Begin
    multDato := (num1 Mod num2) = 0
End;

Begin

    WriteLn(multDato(4, 2));
    WriteLn(multDato(5, 2));
    WriteLn(multDato(12, 3));
    WriteLn(multDato(14, 3));

    WriteLn(multDato(40, 4));
    WriteLn(multDato(25, 3));

End.