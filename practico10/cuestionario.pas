Program cuestionario;

Type
   TClase = Record
               hora_ini: 8..21;
               salon: Array[1..10] Of Char;
            End;

   TCurso = Record
               nombre: Array[1..100] Of Char;
               anio: 1..5;
               clases: Array[1..5] Of TClase;
            End;
Var
   curso: Tcurso;

Begin 
    With curso.clases[1] do
        hora_ini := 20;

    WriteLn(curso.clases[1].hora_ini)

End.