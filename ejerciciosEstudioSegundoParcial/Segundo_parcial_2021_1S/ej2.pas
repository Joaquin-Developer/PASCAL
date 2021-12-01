Program ej2;

Type 
    Lista =   ^Nodo;

    Nodo =   Record
        valor:   Integer;
        sig:   Lista;
    End;

{
    insertar un nodo en la lista, manteniendo el orden (menor a mayor)
    precondicion: lsta con al menos un elemento (no vacia)
}
Procedure insertarOrdenado(valor: Integer; Var L: Lista);
Var 
    p, q, aux : Lista;
    agregado : Boolean;
Begin
    agregado := False;
    New(q);
    q^.valor := valor;
    p := L;
    // si el primer elemento es mayor, agrego a la izquierda:
    If p^.valor > valor Then 
    Begin 
        q^.sig := p;
        L := q;
    End
    Else 
    Begin    
        // si no, agrego a la derecha en caso de encontrar p < q < p^.sig

        While (p <> Nil) Or (Not agregado) Do 
        Begin 
            If (p^.valor < valor) And ((p^.sig^.valor > valor) Or (p^.sig = Nil)) Then 
            Begin 
                aux := p^.sig;
                p^.sig := q;
                q^.sig := aux;
                agregado := True;
            End;
            p := p^.sig; // avanzo al nodo siguiente
        End;
    End;

End;

// agregar al principio
Procedure Add(elemento: Integer; Var l: Lista);
Var
	p : Lista;
Begin
	New(p);
	p^.valor := elemento;
	p^.sig := l;
	l := p;
End;

Procedure Print(l: Lista);
Var 
    p : Lista;
Begin
	p := l;
    While p <> Nil Do 
    Begin 
        Write(p^.valor);
        Write(' ');
        p := p^.sig;
    End;
    WriteLn()
End;

Var 
    miLista : Lista;

Begin
    Add(14, miLista);
    Add(11, miLista);
    Add(5, miLista);
    Add(1, miLista);
    Print(miLista);
    insertarOrdenado(3, miLista);
    Print(miLista);
    insertarOrdenado(0, miLista);
    Print(miLista);
    insertarOrdenado(8, miLista);
    Print(miLista);
End.