program Ejercicio1a (output);

// Parte a:
// var aux, n : Integer;
// begin
//    aux := 2;

//    for n := 1 to 4 do
//    begin
//       aux := aux * n;
//       writeln (n, ' ', aux)
//    end
// end. 
// Parte b:
// VAR a, b : Integer;
// BEGIN
//    FOR b := 1 TO 3 DO
//    BEGIN
//       IF b <= 1 THEN
//          a := b - 1;
//       IF b <= 2 THEN
//          a := a - 1
//       ELSE
//          a := a + 1
//    END;
//    writeln (a)
// END. 

// Parte c:
// Var k, bajo : Integer;
// Begin
//     bajo := 1;
//     For k := bajo To 3 Do
//     Begin
//         bajo := bajo + 2;
//         writeLn(k, ' - ', bajo)
//     End
// End. 

// Parte d:
// Var k, alto : Integer;
// Begin
//     alto := 4;
//     FOR k := alto Downto 3 Do
//         WriteLn(k, ' - ', alto)
// End.

// Parte e:
Var i, j, num : Integer;
Begin
    num := 1;
    For i := 1 To 3 Do
    Begin
        num := num + i;
        For j := 1 To num Do
            WriteLn(j);

        WriteLn(' . ', i)
    End;
End.
