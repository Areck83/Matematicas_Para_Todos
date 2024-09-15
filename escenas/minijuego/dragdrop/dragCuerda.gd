extends Node2D

export (String) var contenedorDestino: String
export (String) var tipo: String
export (Texture) var imagen: Texture
onready var click = $icono/Area2D
var seleccionado = false
var punto_fijo : Vector2

func _ready():
	click.connect("clicked", self, "_on_clicked")
	set_process(true)
	set_physics_process(true)
	
	if imagen:
		$icono.texture = imagen
		# Ajustar el tamaño del área de arrastre al tamaño de la textura
		var sprite = $icono
		if sprite:
			var texture_size = sprite.texture.get_size()
			var collision_shape = $icono/Area2D/CollisionShape2D
			if collision_shape:
				collision_shape.shape = RectangleShape2D.new()
				collision_shape.shape.extents = texture_size / 2
	else:
		print("Falta la asignación de una imagen al objeto de arrastre")
	
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
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
	else:
		# Solo actualizar el punto fijo si el objeto ya no está seleccionado
		if punto_fijo != global_position:
			punto_fijo = global_position
		global_position = lerp(global_position, punto_fijo, 10 * delta)
	pass

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch:
		var touch = event as InputEventScreenTouch
		if touch.pressed:
			# Verificar si no hay otro drag activo
			if not GlobalVar.drag_activo:
				seleccionado = true
				GlobalVar.drag_activo = true  # Marcar drag como activo en el singleton
		elif not touch.is_pressed() and seleccionado:
			# Cuando el toque se levanta, actualizar el punto fijo para que el objeto quede en su lugar actual
			punto_fijo = global_position
			seleccionado = false  # Reiniciar el estado
			GlobalVar.drag_activo = false  # Liberar el drag activo
	pass

func _on_Area2D_area_entered(area):
	if area.name == contenedorDestino:
		self.queue_free()
		SignalManager.emit_signal("dragEliminado")
		# No es necesario reiniciar el estado aquí ya que lo hacemos en _on_Area2D_input_event
	pass

func _on_clicked():
	emit_signal("clicked", self)
