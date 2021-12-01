Program ej3;

Const MAXTXT = 4; (* entero mayor que 0*)

Type 
    TLetra =   'A' .. 'Z';

    TTexto =   Record
        txt :   array [1 .. MAXTXT] Of TLetra;
        tope :   0 .. MAXTXT;
    End;

    TEstadistica =   Record
        cantidades :   array [TLetra] Of 0 .. MAXTXT;
        porcentajes :   array [TLetra] Of real;
        mas, menos :   TLetra;
    End;


// Escribir un procedimiento estadisticas, que dado un texto no vacío texto, retorna en est 
// las estadísticas de ese texto, que se componen por la cantidad y el porcentaje de veces que 
// aparece cada letra, y cuáles son las letras que aparecen más y menos veces
// (si es más de una letra, la primera de ellas en orden alfabético).
Procedure estadisticas(texto : TTexto; Var est : TEstadistica);
Var 
    letra: TLetra;
    i : Integer;
Begin
    // tomamos como mas y menos al primer elemento del array texto.txt:
    est.mas := texto.txt[1];
    est.menos := texto.txt[1];

    // recorro cada letra del texto, es decir, texto.txt
    For i := 1 To texto.tope Do 
    Begin 
        letra := texto.txt[i];
        // aumento en 1 el contador de cantidades para la letra actual:
        est.cantidades[letra] := (est.cantidades[letra] + 1);
        // calculo porcentaje de apariciones (con las cantidades actuales):
        est.porcentajes[letra] := 100 * (est.cantidades[letra] / texto.tope);
        // calculo est.mas:
        If est.cantidades[letra] > est.cantidades[est.mas] Then 
            est.mas := letra
        Else If (est.cantidades[letra] = est.cantidades[est.mas]) And (Ord(letra) > Ord(est.mas)) Then
            est.mas := letra; 

        // hago lo mismo pero para menos:
        If est.cantidades[letra] < est.cantidades[est.menos] Then 
            est.menos := letra
        Else If (est.cantidades[letra] = est.cantidades[est.menos]) And (Ord(letra) < Ord(est.menos)) Then
            est.menos := letra; 

    End;

End;


Begin
    // For letra := 'A' To 'Z' Do 
    // Begin 
    // End;
End.
