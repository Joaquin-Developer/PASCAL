Program cuestionario3;
VAR i, j, k: Integer;
BEGIN
   i := 3;
   j := 2;
   k := -3;
   while (i > 0) AND (k DIV i < 0) do
   begin
       i := i - 1;
       k := k + 1;
   end;
   WriteLn(i,j,k);
   
   repeat
      j := j - 1;
   until (j > 0) OR (k DIV j > 0);
   WriteLn(i,j,k);
End.