Program ej7;
{
    A: Saldo anterior
    D: Deposito
    R: Retiro
    X: exit
}
var
    monto, saldo : Real;
    opcion: Char;
Begin
    Repeat
        WriteLn('A: Saldo anterior; B: Depositar; R: Retirar');
        Write('Ingresar opcion seguido del monto: ');
        ReadLn(opcion, monto);
        WriteLn('Saldo anterior: ', saldo:0:4);
        case opcion of
            'A' : saldo := monto;
            'D' : saldo := saldo + monto;
            'R' : saldo := saldo - monto;
        end;

        WriteLn('Saldo actual: ', saldo:0:4);

    Until (opcion = 'X');

    WriteLn('Saldo final: ', saldo:0:4);

End.