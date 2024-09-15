extends Node2D

export (String) var contenedorDestino: String
export (String) var tipo: String
export (Texture) var imagen: Texture

var seleccionado = false
var punto_fijo : Vector2

func _ready():
	set_process(true)
	set_physics_process(true)
	
	#Borrar los else cuando se hayan hecho las pruebas y ya estén en producción
	if imagen:
		$icono.texture = imagen
	else:
		print ("Falta la asignación de una imagen al objeto de arrastre")
	
	if tipo:
		$icono/Area2D.add_to_group(tipo)
	else:
		print("No se ha asignado un grupo al objeto de arrastre. Es posible que no colisone")
	
	punto_fijo = global_position
	var area = get_node("icono/Area2D")
	if area:
		area.connect("input_event", self, "_on_Area2D_input_event")
	else:
		print("Error: Nodo no encontrado")
pass

func _physics_process(delta):
	if seleccionado:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
	else:
		global_position = lerp(global_position, punto_fijo, 10*delta)
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
	if area.name==contenedorDestino:
		self.queue_free()
		SignalManager.emit_signal("dragEliminado")
pass
