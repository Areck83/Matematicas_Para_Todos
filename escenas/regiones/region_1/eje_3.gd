extends Node2D

func _ready():
	pass

func _respuestaCorrecta():
	get_tree().change_scene("res://escenas/regiones/region_1/scn_Fin_3.tscn")
func _respuestaIncorrecta():
	get_tree().change_scene("res://escenas/regiones/region_1/scn_incorrecto.tscn")
