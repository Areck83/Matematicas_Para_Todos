extends Node2D
func _ready():
	pass 

func _qop():
	Song1.stop()
	Inicio.play()
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")
	pass
	
func _qap():
	GlobalVar.reg1_escena3 = true
	get_tree().change_scene("res://escenas/regiones/region_1/memoramaReg1/Memorama1.tscn")
	pass
