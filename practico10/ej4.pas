Program ej4;
{ 
Defina un tipo enumerado que represente los meses del año.
Escriba un procedimiento en Pascal que reciba un parámetro de entrada del tipo definido en la parte anterior 
y exhiba en la salida estándar el nombre completo del mes correspondiente.
Escriba un programa principal que permita probar el procedimiento de la parte anterior, 
declarando toda variable que sea necesaria. También debe definir cualquier otro subprograma auxiliar 
que necesite para carga o exhibición de datos en la salida estándar.
}
Type 
    Meses = (enero, febrero, marzo, abril, mayo, junio, julio, agosto, setiembre, octubre, noviembre, diciembre);
Var
    m1, m2, m3, m4, m5 : Meses;

Procedure PrintMonth(Var month: Meses);
Begin
    Case month Of
        enero: WriteLn('enero');
        febrero: WriteLn('febrero');
        marzo: WriteLn('marzo');
        abril: WriteLn('abril');
        mayo: WriteLn('mayo');
        junio: WriteLn('junio');
        julio: WriteLn('julio');
        agosto: WriteLn('agosto');
        setiembre: WriteLn('setiembre');
        octubre: WriteLn('octubre');
        noviembre: WriteLn('noviembre');
        diciembre: WriteLn('diciembre')
    End;
End;

Begin
    m1 := marzo;
    m2 := febrero;
    m3 := setiembre;
    m4 := julio;
    m5 := octubre;
    PrintMonth(m1);
    PrintMonth(m2);
    PrintMonth(m3);
    PrintMonth(m4);
    PrintMonth(m5);
End.