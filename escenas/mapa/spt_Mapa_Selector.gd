extends Node2D

func _ready():
	SignalManager.connect("ireg", self, "alakazam")
	
	pass

func alakazam(w):
	var ww = str(w)
	var www = "res://escenas/mapa/scn_"+ww+"_Prev.tscn"
	get_tree().change_scene(www)
	pass


func _on_TouchScreenButton_pressed():
	get_tree().change_scene("res://recursos/video/VideoPlayer.tscn")
	pass # Replace with function body.
