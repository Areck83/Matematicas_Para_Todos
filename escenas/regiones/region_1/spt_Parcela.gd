extends Node2D
var c = 0
var tote= 0

func _ready():
	ccmaik()
	pass

func ccmaik():
	for drag in get_tree().get_nodes_in_group("drag"):
		c += 1
	tote = c
	SignalManager.connect("dreex", self, "falpa")

func falpa():
	tote -= 1
	if tote == 0:
		get_tree().change_scene("res://escenas/regiones/region_1/eje1_1.tscn")
	pass
