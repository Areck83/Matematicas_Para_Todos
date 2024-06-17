extends Node2D

export (Texture) var imagen_vacio: Texture
export (Texture) var imagen_relleno_1: Texture
export (Texture) var imagen_relleno_2: Texture
export (Texture) var imagen_relleno_3: Texture
export (Texture) var imagen_relleno_4: Texture
export (int) var unidades_Contenido: int #Valor inicial esperado en la escena

var texturas: Array = []
var seleccionado = false
var punto_fijo : Vector2
var moviendo = false

func _ready():
	inicializar()
	pass

func _physics_process(delta):
	if seleccionado:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
		moviendo = true
	else:
		global_position = lerp(global_position, punto_fijo, 10*delta)
		moviendo = false
	pass

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch:
		var touch = event as InputEventScreenTouch
		if touch.pressed:
			seleccionado = true
		elif not touch.is_pressed():
			seleccionado = false
	pass

func _on_Area2D_area_entered(area):
	if area.is_in_group("frasco"):
		if moviendo and unidades_Contenido > 0:
			print("Regando el frasco")
			SignalManager.emit_signal("shijo")
			unidades_Contenido -= 1
			actualizar_textura()
	pass

func recibiendoContenido():
	if not moviendo and unidades_Contenido < 4:
		unidades_Contenido +=1
		actualizar_textura()

func revisarAsignacionSprites():
	assert(imagen_vacio, "El nodo " + get_name() + " requiere sprite para vacio")
	assert(imagen_relleno_1, "Al nodo " + get_name() + " no se le asignó relleno 1")
	assert(imagen_relleno_2, "Al nodo " + get_name() + " no se le asignó relleno 2")
	assert(imagen_relleno_3, "Al nodo " + get_name() + " no se le asignó relleno 3")
	assert(imagen_relleno_4, "Al nodo " + get_name() + " no se le asignó relleno 4")
	texturas.append(imagen_vacio)
	texturas.append(imagen_relleno_1)
	texturas.append(imagen_relleno_2)
	texturas.append(imagen_relleno_3)
	texturas.append(imagen_relleno_4)
	pass

func actualizar_textura():
	print("Actualizando...")
	if unidades_Contenido >=0 and unidades_Contenido < texturas.size():
		$icono.texture = texturas[unidades_Contenido]
		print("Actualizada")
	pass

func inicializar():
	set_process(true)
	set_physics_process(true)
	revisarAsignacionSprites()
	actualizar_textura()
	SignalManager.connect("shijo", self, "recibiendoContenido")
	punto_fijo = global_position
	var area = get_node("icono/Area2D")
	if area:
		area.connect("input_event", self, "_on_Area2D_input_event")
	else:
		printerr("No se ha encontrado el area del nodo")
	pass
