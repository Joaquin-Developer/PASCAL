Program ej2;

Type 
    TCaso = (creal,cint,cchar);
    RealIntChar = Record Case caso : TCaso Of
                    creal : (vreal : Real);
                    cint : (vint : Integer);
                    cchar : (vchar : Char)
                End;

    ListaH = ^TCeldaH;

    TCeldaH = Record
                info : RealIntChar;
                sig : ListaH
            End;


// Escribir la siguiente función producto, que retorna el producto de todos los números de 
// la lista incluyendo enteros y reales. Si la lista no contiene ningún número, el resultado 
// del producto debe ser 1. Notar que si alguna de las celdas contiene un 0 el resultado
// del producto será 0
Function producto (lista : ListaH) : Real;
Var
    resultado : Real;
    pListaH: ListaH;
Begin 
    resultado := 1;
    pListaH := lista;

    While pListaH <> Nil Do 
    Begin 
        If (pListaH^.info.caso = creal) Then 
            resultado := resultado * pListaH^.info.vreal
        Else If (pListaH^.info.caso = cint) Then 
            resultado := resultado * pListaH^.info.vint;

        pListaH := pListaH^.sig
    End;

    producto := resultado;
End;


// SUbprograma auxiliar para cargar la lista
Procedure AddToEnd(info: RealIntChar; Var l: ListaH);
Var p, q : ListaH;
Begin 
	New(p);
	p^.info := info;
	p^.sig := Nil;
	If l = Nil Then 
		l := p
	Else 
	Begin 
		q := l;
		While q^.sig <> Nil Do 
			q := q^.sig;
		
		q^.sig := p
	End;

End;

Begin
    


End.