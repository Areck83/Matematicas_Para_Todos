extends Node2D

func _ready():
	pass

func _ttt():
	get_tree().change_scene("res://escenas/regiones/region_3/memoramaReg3/principal.tscn")
	Song3.play()
	pass

func _ttttt():
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")
	pass
