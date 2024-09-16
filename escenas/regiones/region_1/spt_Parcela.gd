extends Node2D

var c = 0
var tote = 0

func _ready():
	StatusEscena.reg1Status()
	ccmaik()

func ccmaik():
	for drag in get_tree().get_nodes_in_group("drag"):
		c += 1
	tote = c
	SignalManager.connect("dragEliminado", self, "falpa")  # Conectar la señal dragEliminado

func falpa():
	tote -= 1
	if tote == 0:
		GlobalVar.reg1_escena1 = true
		get_tree().change_scene("res://escenas/regiones/region_1/eje_2.tscn")

func _shixas():
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")
