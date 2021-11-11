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
  f : RangoFilas;
  c : RangoColum;
Begin
  For f := 1 To CANT_FIL Do 
  Begin 
    For c := 1 To CANT_COL Do 
      If t[f, c].tipo = Mina Then 
        t[f, c].oculto := False;
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


// Sub programa auxiliar:
Function CalcularMinasAdyacentes(f, c: Integer; t: Tablero): Integer;
Var 
  i, j, minasAdyacentes : Integer;
Begin
  minasAdyacentes := 0;

  For i := (f - 1) To (f + 1) Do 
    For j := (c - 1) To (c + 1) Do 
      If (i <> f) And (j <> c) And (EsPosicionValida(i, j)) And (t[i, j].tipo = Mina) Then 
        minasAdyacentes := minasAdyacentes + 1;

  CalcularMinasAdyacentes := minasAdyacentes
End;


{
Agrega minas al Tablero t en cada una de las casillas c correspondientes a
posiciones contenidas en m, es decir que dichas casillas cambien su tipo a Mina.

Adicionalmente asigna el valor del campo minasAlrededor de las casillas del tablero
que queden libres. Este deberá contener la cantidad de casillas adyacentes que 
son minas.
}
Procedure AgregarMinas(m : Minas; Var t : Tablero);
Var 
  i : 0..MAX_MIN;
  f : RangoFilas;
  c : RangoColum;
Begin
  // Recorro el array con tope Minas
  // Por cada mina obtengo su posicion, y modifico el tablero t
  {
    NOTA: Algoritmo ineficiente - Mejorarlo
  }
  For i := 1 To m.tope Do 
  Begin 
    With m.elems[i] Do
      t[fila, columna].tipo := Mina;
  End;

  For f := 1 To CANT_FIL Do
  Begin 
    For c := 1 To CANT_COL Do
    Begin 
      With t[f, c] Do 
        If tipo = Libre Then 
          minasAlrededor := CalcularMinasAdyacentes(f, c, t);
    End;
  End;
  
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
Var 
  pos : Posicion;
Begin
  If (EsPosicionValida(f, c)) And (t[f, c].tipo = Libre) Then 
  Begin
    t[f, c].oculto := False;
    pos.fila := f;
    pos.columna := c;

    If CalcularMinasAdyacentes(f, c, t) = 0 Then
      AgregarAlFinal(pos, libres);
  End;

End;

{
Desoculta (ver procedimiento Desocultar) todas las casillas adyacentes a la
Casilla del Tablero t asociada a la fila f y la columna c.
}
Procedure DesocultarAdyacentes(f, c : Integer; Var t : Tablero; Var libres : ListaPos);
Var 
  i, j : Integer;
Begin
  For i := (f - 1) To (f + 1) Do 
    For j := (c - 1) To (c + 1) Do
      If (i <> f) And (j <> c) Then 
        Desocultar(i, j, t, libres);
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
Var 
  libres : ListaPos;
  i, j: Integer;
Begin
  // Inicalizo la Lista y los elementos del record:
  // Lista vacia al comienzo, apunta a null:
  libres := Nil;
  // Desoculto:
  Desocultar(f, c, t, libres);
  // Desoculto adyacentes:
  If (t[f, c].tipo = Libre) And (CalcularMinasAdyacentes(f, c, t) = 0) Then 
    DesocultarAdyacentes(f, c, t, libres);


  For i := (f - 1) To (f + 1) Do 
  Begin
    For j := (c - 1) To (c + 1) Do 
    Begin 
      If EsPosicionValida(i, j) And (t[i, j].tipo = Libre) And (CalcularMinasAdyacentes(i, j, t) = 0) Then 
        DesocultarAdyacentes(i, j, t, libres);
    End;
  End;

End;

{
Devuelve true si no existe ninguna Casilla en el Tablero t que cumpla con estar 
oculta y ser Libre. En otro caso devuelve false.
}
Function EsTableroCompleto(t : Tablero): Boolean;
Var
  i, j : Integer;
  tableroCompleto: Boolean;
Begin
  tableroCompleto := True;
  i := 1;
  j := 1;
  // Recorro el tablero hasta que haya una casilla que sea oculta y libre
  // o hasta llegar al ultimo elemento del tablero


  For i := 1 To CANT_FIL Do
  Begin 
    For j := 1 To CANT_COL Do
    Begin 
      If (t[i, j].oculto) And (t[i, j].tipo = Libre) Then 
        tableroCompleto := False;
    End;
  End;


  // While (i <= CANT_FIL) Or (tableroCompleto) Do
  // Begin
  //   While (j <= CANT_COL) Or (tableroCompleto) Do 
  //   Begin 
  //     If (t[i, j].oculto) And (t[i, j].tipo = Libre) Then 
  //       tableroCompleto := False;
  //     j := j + 1
  //   End;
  //   i := i + 1 
  // End;

  EsTableroCompleto := tableroCompleto
End;
