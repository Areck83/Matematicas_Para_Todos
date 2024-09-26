extends VideoPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.modulate.a = 0.18
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VideoPlayer_finished():
	play()
	pass # Replace with function body.


func _on_volver_pressed():
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")
	pass # Replace with function body.
