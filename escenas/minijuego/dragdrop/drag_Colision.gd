extends Node2D

export (Texture) var imagen_vacio: Texture
export (Texture) var imagen_relleno_1: Texture
export (Texture) var imagen_relleno_2: Texture
export (Texture) var imagen_relleno_3: Texture
export (Texture) var imagen_relleno_4: Texture
export (int) var unidades_Contenido: int #Valor inicial esperado en la escena

var seleccionado = false
var punto_fijo : Vector2

func _ready():
	inicializar()
	pass

##Draw
func _physics_process(delta):
	if seleccionado:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
	else:
		global_position = lerp(global_position, punto_fijo, 10*delta)
	pass

##Drag
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch:
		var touch = event as InputEventScreenTouch
		if touch.pressed:
			seleccionado = true
		elif not touch.is_pressed():
			seleccionado = false
	pass

func _on_Area2D_area_entered(area):
	#Aqui no hay queue free, solamente se emitiria la señal de acuerdo con lo especificado
#	if area.name==dst:
#		self.queue_free()
#		SignalManager.emit_signal("dragEliminado")
	pass

func revisarAsignacionSprites():
	#Sprite default
	assert(imagen_vacio, "El nodo " + get_name() + " requiere sprite para vacio")
	$icono.texture = imagen_vacio
	
	#Configuración de los demás sprites
	assert(imagen_relleno_1, "Al nodo " + get_name() + " no se le asignó relleno 1")
	assert(imagen_relleno_2, "Al nodo " + get_name() + " no se le asignó relleno 2")
	assert(imagen_relleno_3, "Al nodo " + get_name() + " no se le asignó relleno 3")
	assert(imagen_relleno_4, "Al nodo " + get_name() + " no se le asignó relleno 4")
	pass

func inicializar():
	set_process(true)
	set_physics_process(true)
	revisarAsignacionSprites()
	punto_fijo = global_position
	var area = get_node("icono/Area2D")
	if area:
		area.connect("input_event", self, "_on_Area2D_input_event")
	else:
		printerr("No se ha encontrado el area del nodo")
	pass
