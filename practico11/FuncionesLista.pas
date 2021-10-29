Program FuncionesLista;

Type
	lista = ^Celda;
	
	Celda = Record
				elemento: Integer; 
				siguiente: lista;
			End;

Var 
    miLista : lista;

Function Length(l: lista): Integer;
Var
	contador: Integer;
	p: lista;   // puntero auxiliar para ir recorriendo la lista
Begin
	contador := 0;
	p := l;
	While p <> Nil Do
	Begin
		contador := contador + 1;
		p := p^.siguiente;  // Avanzo al puntero siguiente de la lista encadenada
	End;
	Length := contador;
End;

Procedure Add(elemento: Integer; Var l: lista);
Var
	p : lista;
Begin
	New(p);
	p^.elemento := elemento;
	p^.siguiente := l;
	l := p;
End;

Procedure AddToEnd(element: Integer; Var l: lista);
Var p, q : lista;
Begin 
	New(p);
	p^.elemento := element;
	p^.siguiente := Nil;
	If l = Nil Then 
		l := p
	Else 
	Begin 
		q := l;
		While q^.siguiente <> Nil Do 
			q := q^.siguiente;
		
		q^.siguiente := p
	End;

End;

Procedure Print(l: lista);
Var 
    p : lista;
Begin
	p := l;
    While p <> Nil Do 
    Begin 
        Write(p^.elemento);
        Write(' ');
        p := p^.siguiente;
    End;
    WriteLn()
End;

Begin 
    WriteLn('Tamaño de la lista: ', Length(miLista));
    Add(3, miLista);
    Print(miLista);
    Add(2, miLista);
    Print(miLista);
    AddToEnd(6, miLista);
    Print(miLista);
	Add(4, miLista);
    Print(miLista);
	WriteLn('Tamaño Final de la lista: ', Length(miLista));
End.