extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reg1Status():
	if GlobalVar.reg1_escena1 == true:
		get_tree().change_scene("res://escenas/regiones/region_1/eje_2.tscn")
	if GlobalVar.reg1_escena2 == true:
		get_tree().change_scene("res://escenas/regiones/region_1/eje_3.tscn")
	if GlobalVar.reg1_escena3 == true:
		get_tree().change_scene("res://escenas/regiones/region_1/memoramaReg1/Memorama1.tscn")
	#if GlobalVar.reg1_escena4 == true:
	#	get_tree().change_scene("res://escenas/regiones/region_1/eje_2.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
