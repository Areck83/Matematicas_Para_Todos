extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Inicio.play()
	pass # Replace with function body.

func escena():
	get_tree().change_scene("res://escenas/datos/formulario.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
