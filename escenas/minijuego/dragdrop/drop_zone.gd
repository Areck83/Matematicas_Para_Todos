extends Area2D

export (String) var contenido: String
export (Texture) var imagen: Texture

var conteo = 0

func _ready():
	set_process(true)
	set_physics_process(true)
	$contador.text = String(conteo)
	if imagen:
		$icono.texture = imagen
pass

func objExtColisiona(area):
	if area.is_in_group(contenido):
		conteo += 1
		$contador.text = String(conteo)
pass
