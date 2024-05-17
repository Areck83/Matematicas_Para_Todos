extends Node2D

signal volteada(carta)
signal clicked(carta)

var esta_volteada : bool #Esto se supone es falso por default
var cara : String 

onready var frontal = $frontal
onready var cubierta = $cubierta
onready var click = $area_clic

func _ready():
	$anim.play("cubrir")
	click.connect("clicked", self, "_on_clicked")

func poner_cara(f: String):
	cara = f
	
	#La textura debe de tomarse segun el nombre de la carta
	frontal.texture = load("res://recursos/imagenes/reg1/tarjetas/"+ cara + ".png")

func flip():
	if esta_volteada: return
	
	$anim.play("descubrir")
	esta_volteada = true
	emit_signal("volteada", self) #Con self se indica la carta que se volteó

func reset(): #Regresar todo a la normalidad
	if !esta_volteada: return
	
	$anim.play("cubrir")
	esta_volteada = false
	emit_signal("volteada", self)

func _on_clicked():
	emit_signal("clicked", self)
