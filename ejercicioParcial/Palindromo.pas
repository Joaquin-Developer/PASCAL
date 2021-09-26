Program Palindromo;

Const N = 5 ; 
Type 
    arreglo = array [1..N] of char;

Function palindromo(arr: arreglo): Boolean;
Var
    med, i : Integer;
Begin
    med := N Div 2;
    i := 1;

    While (i <= med) And (arr[i] = arr[N - i + 1]) Do
        i := i + 1;
    palindromo := i > med;
End;


Begin
    

End.