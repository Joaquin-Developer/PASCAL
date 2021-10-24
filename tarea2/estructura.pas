const
  CANT_FIL = 10; {cantidad de filas}
  CANT_COL = 10; {cantidad de columnas}
  MAX_MIN  = 10; {máxima cantidad de minas}

  CASILLA_OCULTA = '.';
  CASILLA_BOMBA  = 'o';
   
type
   
  { Cada casilla puede estar oculta o no.
    Puede tener una Mina o estar Libre, si está libre se indican 
    cuántas minas tiene alrededor. }
  TipoCasilla  = (Mina, Libre);
  Casilla      = record
                    oculto    : boolean;
                    case tipo : TipoCasilla of
                      Mina    : ();
                      Libre   : ( minasAlrededor : integer )
                 end;

  { Un Tablero es una matriz de casillas. }
  RangoFilas = 1 .. CANT_FIL;
  RangoColum = 1 .. CANT_COL;
  Tablero    = array [RangoFilas, RangoColum] of Casilla;


  { Una Posicion denota una Casilla del Tablero. }
  Posicion  = record
                 fila    : RangoFilas;
                 columna : RangoColum
              end;

  { Arreglo con tope Minas para almacenar las posiciones de las minas. }  
  Minas     = record
                 elems  : array [1 .. MAX_MIN] of Posicion;
                 tope   : 0 .. MAX_MIN
              end;


  { Lista de posiciones. 
    Se utilizará para implementar el subprograma DesocultarDesde. }
  ListaPos  = ^CeldaPos;

  CeldaPos  = record
                 pos : Posicion;
                 sig : ListaPos
              end;

                  
{
Subprogramas Auxiliares de Listas
}

                  
{
Agrega la Posicion pos al final de la ListaPos lista.
}
procedure AgregarAlFinal(pos : Posicion; var lista : ListaPos);
var p, q : ListaPos;
begin
  new(p); (*creo nueva celda*)
  p^.pos := pos; (*cargo el elemento*)
  p^.sig := nil; (*es el último*)
  if lista = nil then
    lista := p
  else
  begin
    (*busco el último de l*)
    q := lista;
    while q^.sig <> nil do
      q := q^.sig;
    (*engancho p a continuación del último*)
    q^.sig := p
  end
end;


{
Devuelve en pos la Posicion que se encuentra al comienzo de la ListPos l. 

Adicionalmente borra dicho valor de l.

Precondición: l debe tener al menos un elemento.
}
procedure PrimeraPosicion(var pos :  Posicion; var l: ListaPos);
var p: ListaPos;
begin
  p   := l; (*puntero al primer elemento*)
  pos := l^.pos; (*asigno a pos la Posicion apuntada*)
   
  l   := l^.sig; (*la lista queda apuntando al siguiente*)
  dispose(p) (*libero la memoria de la primera celda*)
end;

