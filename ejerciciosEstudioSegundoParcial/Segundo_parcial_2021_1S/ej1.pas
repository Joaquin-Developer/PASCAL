Program ej1;

type
    Punto = record 
                TipoConica = (circunferencia, elipse);
                x,y: Real;
            end;

    Conica = record case clase: TipoConica of
                circunferencia : (radio: Real; centro: Punto);
                elipse : (foco1, foco2 : Punto);
            end;

    TipoResul = record
                    figura : TipoConica;
                    enCentro : Boolean
                end;


// parte a) (15 pts) Escribir el procedimiento focoEnCentro que devuelve en el parámetro resultado el tipo de cónica y el valor
// booleano true si la cónica tiene alguno de sus focos en el centro de ejes cartesianos (0.0, 0.0), 
// o false si no. En el caso de una circunferencia, su centro es el foco.
Procedure focoEnCentro (conica : Conica; Var resultado : TipoResul);
Begin 
    resultado.figura := conica.clase;
    
    // Si es cfa:
    If resultado.figura = circunferencia Then 
    Begin 

    End; 

    // Si es elipse:
    If resultado.figura = circunferencia Then 
    Begin 
    End;

End;



Begin
End.