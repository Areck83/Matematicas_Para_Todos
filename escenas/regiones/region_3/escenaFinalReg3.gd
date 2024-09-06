extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/Zorro/AnimationPlayer.play("Animacion")
	pass # Replace with function body.
	


func Siguiente():
	Song3.stop()
	GlobalVar.contDrag = 0
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
