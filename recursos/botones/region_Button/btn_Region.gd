extends TouchScreenButton
export var d : int

func _ready():
	pass

func _btn_Region_presionado():
	SignalManager.emit_signal("ireg", d)
	pass
