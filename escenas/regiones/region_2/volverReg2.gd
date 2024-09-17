extends TouchScreenButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func volver():
	Inicio.play()
	BocinaPrincipal.para()
	Song1.stop()
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
