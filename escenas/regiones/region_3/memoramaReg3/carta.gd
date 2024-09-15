extends Node2D
class_name Carta

signal volteada(carta)
signal clicked(carta)

var esta_volteada : bool = false # Asegúrate de que esto sea falso por defecto
var cara : String 

onready var frontal = $frontal
onready var cubierta = $cubierta
onready var click = $area_clic

func _ready():
	$anim.play("cubrir")
	click.connect("clicked", self, "_on_clicked")

func poner_cara(f: String):
	cara = f
	frontal.texture = load("res://recursos/imagenes/reg3/TarjetasPeces/"+ cara + ".png")

func flip():
	if esta_volteada: return
	
	$anim.play("descubrir")
	esta_volteada = true
	emit_signal("volteada", self)

func reset(): # Regresar todo a la normalidad
	if !esta_volteada: return
	yield(get_tree().create_timer(0.5), "timeout")
	$anim.play("cubrir")
	esta_volteada = false
	emit_signal("volteada", self)

func mostrar(): # Nueva función para mostrar la carta
	if !esta_volteada:
		flip() # Llama a flip para mostrar la carta

func _on_clicked():
	emit_signal("clicked", self)
