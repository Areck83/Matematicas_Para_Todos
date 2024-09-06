extends Node2D

func _ready():
	SignalManager.connect("ireg", self, "alakazam")
	GlobalVar.puntos = 0
	GlobalVar.ejercicio = 1
	GlobalVar.respuesta = 0
	pass

func alakazam(w):
	var ww = str(w)
	var www = "res://escenas/mapa/scn_"+ww+"_Prev.tscn"
	get_tree().change_scene(www)
	pass
