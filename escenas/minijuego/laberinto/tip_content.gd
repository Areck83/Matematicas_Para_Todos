extends Node2D

signal mostro
signal escondiendo

func _ready():
	hide()
	get_parent().connect("mostro",self,"on_mostro")
	get_parent().connect("escondiendo",self,"on_escondiendo")

func on_mostro():
	emit_signal("mostro")
	show()
func on_escondiendo():
	emit_signal("escondiendo")
	hide()
