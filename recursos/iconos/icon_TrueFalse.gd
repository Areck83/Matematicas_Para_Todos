extends Node2D
export (Texture) var s: Texture
export (Texture) var n: Texture

func _ready():
	popipo()
	pass

func popipo():
	if !s:
		print("Checa tu rec")
	if !n:
		print("Checa tu rec!")
	pass

func af():
	$i.texture = s
	pass

func den():
	$i.texture = n
	pass
