extends Node2D

func _ready():
	SignalManager.emit_signal("mostrarFelicitacion", "1")
	pass
