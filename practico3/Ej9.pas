program EJ9;
var k, r, s, t : Integer;
begin

k := 3;
r := 0;
s := 0;
t := 0;

// IF k = 0 THEN
//     r := r + 1
//  ELSE
//     IF k = 1 THEN
//        s := s + 1
//     ELSE
//        IF (k = 2) OR (k = 3) OR (k = 4) THEN
//           t := t + 2
// Pasar el código anterior a sentencias case:

case k of
    0 : r := r + 1;
    1 : s := s + 1;
    2 : t := t + 2;
    3 : t := t + 2;
    4 : t := t + 2;
end;

writeln(k);
writeln(r);
writeln(s);
writeln(t);

end.