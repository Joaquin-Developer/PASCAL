Program ej1;

Const MAX = 7; (* entero positivo cualquiera *)

Type

    TipoConica = (circunferencia, elipse);
    Punto = record
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
 
    ArrConicas = array [1..MAX] of Conica;
 

// parte a) (15 pts) Escribir el procedimiento focoEnCentro que devuelve en el parámetro resultado el tipo de cónica y el valor
// booleano true si la cónica tiene alguno de sus focos en el centro de ejes cartesianos (0.0, 0.0), 
// o false si no. En el caso de una circunferencia, su centro es el foco.
Procedure focoEnCentro(conica : Conica; Var resultado : TipoResul);
Begin 
    resultado.figura := conica.clase;
    
    // Si es cfa:
    If (resultado.figura = circunferencia) And (conica.centro.x = 0) And (conica.centro.y = 0) Then 
        resultado.enCentro := True
    Else If (resultado.figura = elipse) Then
    Begin 
    // Si es elipse:
        If ((conica.foco1.x = 0) And (conica.foco1.y = 0)) Or ((conica.foco2.x = 0) And (conica.foco2.y = 0)) Then 
            resultado.enCentro := True;
    End
    Else
        resultado.enCentro := False; 
    
End;

// Parte b) (15 puntos) Dado un arreglo de cónicas
// Escribir la función primeraCfa que devuelve el índice del primer elemento del arreglo que 
// es circunferencia o -1 si no hay ninguna
Function primeraCfa(conicas : ArrConicas): Integer; 
Var 
    i, indice : Integer;
Begin 
    indice := -1;
    i := 1;

    While (indice = -1) And (i <= MAX) Do 
        If conicas[i].clase = circunferencia Then 
            indice := i;

    primeraCfa := indice
End;

// Bloque principal:
Begin
End.