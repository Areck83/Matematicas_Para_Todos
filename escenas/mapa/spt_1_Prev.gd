extends Node2D

func _ready():
	pass

func _c():
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")
	pass

func _cc():
	Inicio.stop()
	Song1.play()
	get_tree().change_scene("res://escenas/regiones/region_1/Parcerla/scn_Reg_1.tscn")
	pass # Replace with function body.
