extends Node2D
export (Texture) var imgCorrecto: Texture
export (Texture) var imgError: Texture

func _ready():
	revisarAsignaciones()
	pass

func revisarAsignaciones():
	if !imgCorrecto:
		print("No se ha seleccionado imagen para caso de uso correcto")
	if !imgError:
		print("No se ha seleccionado imagen para caso de uso erroneo")
	pass

func setImgTrue():
	$imagen.texture = imgCorrecto
	pass

func setImgFalse():
	$imagen.texture = imgError
	pass
