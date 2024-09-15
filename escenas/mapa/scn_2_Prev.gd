extends Node2D

func _ready():
	pass

func _qq():
	get_tree().change_scene("res://escenas/regiones/region_2/init_2.tscn")
	Inicio.stop()
	BocinaPrincipal.repro()
	pass

func _q():
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")
	pass # Replace with function body.
