{
   InCo- Fing
   Laboratorio 2021 Segundo Semestre

   Programa BuscaMinas
}

program BuscaMinasPlus;

{ Con esta directiva queda incluido el archivo estructuraPlus.pas }
{$INCLUDE estructuraPlus.pas}

{ Con esta directiva queda incluido el archivo tarea2.pas }
{$INCLUDE tarea2.pas}



{
Imprime un carácter dependiendo del estado de la Casilla c:
  * Imprime CASILLA_OCULTA si c esta oculta
  * Imprime CASILLA_BOMBA si c no esta oculta y es una Mina
  * Si c no esta oculta y esta Libre el carácter es el dígito
    correspondiente al numero de minas alrededor de c 
}
procedure ImprimirCasilla (c : Casilla);
begin
  if c.oculto then
     write(CASILLA_OCULTA)
  else if c.tipo = Mina then
    write(CASILLA_BOMBA)
  else
    write(c.minasAlrededor:1)
end;

{
Imprime las Casillas del Tablero t haciendo uso del procedimiento imprimirCasilla.

Cada fila debe estar separada por un salto del linea.
}
procedure ImprimirTablero (t : Tablero);
var
  i : RangoFilas;
  j : RangoColum; 
begin
   writeln;
   for i := 1 to CANT_FIL do
   begin
      for j := 1 to CANT_COL do
         ImprimirCasilla(t[i,j]);
      WriteLn
   end;
   flush (output)
end;

{
Desoculta todas las casillas del Tablero.
}
procedure DesocultarTablero (var t : Tablero);
var
  i : RangoFilas;
  j : RangoColum; 
begin
   for i := 1 to CANT_FIL do
      for j := 1 to CANT_COL do
         t[i,j].oculto := false
end;


{ 
Lee las posiciones de las minas desde el archivo de nombre nf.
El formato del archivo debe ser:
- primero un entero n indicando la cantidad de minas
- luego n pares de enteros indicando las posiciones.
}
procedure LeerMinas (nf  : ansistring; var m:Minas );
var f : text;
    k : 1 .. MAX_MIN;
begin
   assign (f, nf);
   reset (f);
   read (f, m.tope);
   for k := 1 to m.tope do
      read (f, m.elems[k].fila, m.elems[k].columna);
   close (f);
end;

{ Imprime las dimensiones del Tablero }
procedure PublicarEspecificacion ();
begin
   writeln ('BUSCAMINAS ANCHO:',CANT_COL:0, ' ALTO:',CANT_FIL:0)
end;


{
Variables del programa principal.
}
var
  win  : boolean;
  t    : Tablero;
  m    : Minas;
  f    : RangoFilas;
  c    : RangoColum;
  com,ch  : char; 
  nf   : ansistring;

{
Programa principal.
}
begin
   { archivo donde guardamos eventuales leaks }
   SetHeapTraceOutput('memoryleak.log');

   PublicarEspecificacion ();
   IniciarTableroVacio(t);
   
   win := false;

   repeat
      ImprimirTablero(t);
      read(com);
      case com of
        'm' : begin
                   IniciarTableroVacio(t);
                   readln(ch, nf);
                   LeerMinas (nf, m);  
                   AgregarMinas(m,t)
              end;
        'd' : begin
                   readln(f,c);
                   DesocultarDesde(f,c,t);
                   win := EsTableroCompleto(t)
              end;      
      end
   until (com = 'q') or win or ((com = 'd') and (t[f,c].tipo = Mina));

   if com = 'q' then
      DesocultarTablero(t)
   else if win then
      WriteLn('GANASTE!!!!!')
   else 
   begin
      WriteLn('BOOOOOOOOOOM!');
      DesocultarMinas(t)
   end;
   ImprimirTablero(t)
end.
                  
