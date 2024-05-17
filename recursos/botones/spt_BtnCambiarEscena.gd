extends Node2D
class_name btnCambiarEscena
export var escena_destino : PackedScene
export (Texture) var imagen: Texture

func _ready():
	if imagen:
		var boton = $botonTouch as TouchScreenButton
		if boton:
			boton.normal = imagen
	else:
		print("Imagen no cargada en el boton!")

func _btn_presionado():
	if not escena_destino:
		print("No se ha asignado nada como escena de destino!")
		return
	get_tree().change_scene_to(escena_destino)
pass
