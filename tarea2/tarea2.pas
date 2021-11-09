{
Devuelve en t un Tablero para el cual todas sus Casillas:
  * Están ocultas
  * Están libres
  * No tienen minas alrededor
}
Procedure IniciarTableroVacio(Var t : Tablero);
Var
  i : RangoFilas;
  j : RangoColum;
Begin
  For i := 1 To CANT_FIL Do 
  Begin 
    For j := 1 To CANT_COL Do 
    Begin 
      t[i, j].oculto := True;
      t[i, j].tipo := Libre;
      t[i, j].minasAlrededor := 0
    End;
  End;
End;

{
Para toda Casilla c del Tablero que es una Mina, c deja de estar oculta
}
Procedure DesocultarMinas(Var t : Tablero);
Var
  i : RangoFilas;
  j : RangoColum;
Begin
  For i := 1 To CANT_FIL Do 
  Begin 
    For j := 1 To CANT_COL Do 
      If t[i, j].tipo = Mina Then 
        t[i, j].oculto := False;
  End;
End;

{
Devuelve true si tanto la fila f como la columna c son válidas,
es decir corresponden a una casilla del tablero.
De lo contrario devuelve false.
}
Function EsPosicionValida(f, c : Integer): Boolean;
Begin
  EsPosicionValida := (f > 0) And (f <= CANT_FIL) And (c > 0) And (c <= CANT_COL)
End;

{
Agrega minas al Tablero t en cada una de las casillas c correspondientes a
posiciones contenidas en m, es decir que dichas casillas cambien su tipo a Mina.

Adicionalmente asigna el valor del campo minasAlrededor de las casillas del tablero
que queden libres. Este deberá contener la cantidad de casillas adyacentes que 
son minas.
}
Procedure AgregarMinas(m : Minas; Var t : Tablero);
Begin
End;

{
Si la fila f y columna c corresponden a una Casilla cas válida del Tablero t 
(ver procedimiento EsPosicionValida) y cas es Libre entonces cas deja de estar 
oculta.
Adicionalmente si la Casilla cumple con lo anterior y no tiene minas alrededor 
entonces se agrega la Posicion correspondiente a dicha casilla al final de la 
listaPos libres.
}
Procedure Desocultar(f, c : Integer; Var t : Tablero; Var libres : ListaPos);
Begin
  If EsPosicionValida(f, c) Then 
  Begin
    // Seguir... 
  End;

End;

{
Desoculta (ver procedimiento Desocultar) todas las casillas adyacentes a la
Casilla del Tablero t asociada a la fila f y la columna c.
}
Procedure DesocultarAdyacentes(f, c : Integer; Var t : Tablero;
                               Var libres : ListaPos);
Begin
End;

{
Desoculta (ver procedimiento Desocultar) la Casilla del Tablero t asociada a la 
fila f y la columna c. Si esa casilla está libre y no tiene minas alrededor, 
también se desocultan todas sus casillas adyacentes. Para las casillas adyacentes 
desocultadas se repite el mismo procedimiento de desocultar a sus adyacentes si 
no tienen minas alrededor, y así sucesivamente hasta que no queden más casillas 
adyacentes que cumplan con estas condiciones.
}
Procedure DesocultarDesde(f : RangoFilas;  c : RangoColum; Var t : Tablero);
Begin
End;

{
Devuelve true si no existe ninguna Casilla en el Tablero t que cumpla con estar 
oculta y ser Libre. En otro caso devuelve false.
}
Function EsTableroCompleto(t : Tablero): Boolean;
Begin
End;
