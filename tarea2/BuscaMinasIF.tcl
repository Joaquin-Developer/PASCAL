#!/usr/bin/wish

package require Tk

wm resizable . 0 0
wm title . "Busca Minas"
ttk::style configure TButton -padding 0

set ejecutable [file join "." "BuscaMinas"]
set minas [file join "minas" "$::argv"]

proc leeConfig {} {
    set ::io [open "|$::ejecutable" r+]
    fconfigure $::io -buffering line
    gets $::io line
    if [regexp {BUSCAMINAS\s+ANCHO:(\d+)\s+ALTO:(\d+)} $line -> ::MAXCOL ::MAXFIL] {
    } else {
	puts "NO SE OBTIENE INFO ADECUADA"
	exit
    }
}

proc main {} {
    leeConfig
    creaGrilla
    gets $::io
    leeTablero
    puts $::io "m $::minas"
    gets $::io
    leeTablero
}

proc mkPhotoImage {fn n} {
    image create photo $n -file $fn
    $n copy $n -subsample 2 2 -shrink
    return $n
}

set m(".") [mkPhotoImage [file join "sprites" "cell-covered.png"] X]
set m("X") [mkPhotoImage [file join "sprites" "cell-covered.png"] X]
set m("\ ") [mkPhotoImage [file join "sprites" "cell-0.png"] 0]
set m("0") [mkPhotoImage [file join "sprites" "cell-0.png"] 0]
set m("1") [mkPhotoImage [file join "sprites" "cell-1.png"] 1]
set m("2") [mkPhotoImage [file join "sprites" "cell-2.png"] 2]
set m("3") [mkPhotoImage [file join "sprites" "cell-3.png"] 3]
set m("4") [mkPhotoImage [file join "sprites" "cell-4.png"] 4]
set m("5") [mkPhotoImage [file join "sprites" "cell-5.png"] 5]
set m("6") [mkPhotoImage [file join "sprites" "cell-6.png"] 6]
set m("7") [mkPhotoImage [file join "sprites" "cell-7.png"] 7]
set m("8") [mkPhotoImage [file join "sprites" "cell-8.png"] 8]
set m("o") [mkPhotoImage [file join "sprites" "mine-exploded.png"] o]

proc creaGrilla {} {
    for {set j 0} {$j < $::MAXCOL} {incr j} {
	for {set i 0} {$i < $::MAXFIL} {incr i} {
	    ttk::button ".b($i)($j)" -command "sendXY {$i} {$j}"
	    grid ".b($i)($j)" -row $i -column $j 
	}
    }
}

proc sendXY {x y} {
    ## envia las coordenadas al .pas
    puts $::io "d [incr x] [incr y]"
    if {[gets $::io line] > 0} {
	# si recibe una linea con info, es que termino el juego
	gets $::io; leeTablero
	# consume una linea y recibe el tablero final
    	switch [string index $line 0] {
    	    "G" {tk_messageBox -message "GANASTE!" -type ok}
    	    "B" {tk_messageBox -message "BOOOOOOM!" -type ok}
    	}
	exit
    }
    # si no termina el juego, recibe el nuevo tablero
    leeTablero 
}

proc leeTablero {} {
    for {set i 0} {$i < $::MAXFIL} {incr i} {
	gets $::io line
	for {set j 0} {$j < $::MAXCOL} {incr j} {
	    set col [string index $line  $j]
	    ".b($i)($j)" configure -image $::m("$col")
	}
    }
}

main

