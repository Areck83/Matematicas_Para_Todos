extends Panel

var regiones: OptionButton
var municipio: OptionButton
var nivelE: OptionButton
var datosLabel: Label
var Tmasculino: TouchScreenButton
var Tfemenino : TouchScreenButton
var isFemalePressed: bool = false
var isMalePressed: bool = false
var datos_recibidos = {}
var btnCambiarEscena: TouchScreenButton
var municipios = RegionesData.municipios
var popup_menu: PopupMenu
var municipio_validacion: Panel

func _ready():
	# Referencia a los otros nodos
	municipio_validacion = $MunicipioValicacion

	# Inicialización de opciones
	nivelE = $NivelEducativo
	nivelE.clear()
	nivelE.add_item("Seleccionar nivel", -1)
	nivelE.add_item("Primaria", 1)
	nivelE.add_item("Secundaria", 2)

	nivelE.selected = 0

	Tmasculino = $TMasculino
	Tfemenino = $TFemenino
	Tmasculino.connect("pressed", self, "_on_Tmasculino_pressed")
	Tfemenino.connect("pressed", self, "_on_Tfemenino_pressed")

	var municipio_input = $MunicipioInput
	popup_menu = $PopupMenu
	municipio_input.connect("text_changed", self, "_on_MunicipioInput_text_changed")
	popup_menu.connect("id_pressed", self, "_on_suggestion_selected")

func _on_MunicipioInput_text_changed():
	var municipio_input = $MunicipioInput
	var text = municipio_input.get_text()  # Obtener el texto completo del TextEdit
	_update_municipio_suggestions(text)

func _update_municipio_suggestions(new_text):
	popup_menu.clear()  # Limpiar las sugerencias actuales
	if new_text.strip_edges() == "":
		popup_menu.hide()
		return
	
	for m in municipios:
		if m.to_lower().findn(new_text.to_lower()) != -1:
			popup_menu.add_item(m)
	
	if popup_menu.get_item_count() > 0:
		# Mostrar el PopupMenu y ajustar su posición
		popup_menu.show()
		var municipio_input = $MunicipioInput
		popup_menu.set_position(municipio_input.get_global_position() + Vector2(0, municipio_input.rect_size.y))
	else:
		popup_menu.hide()

func _on_suggestion_selected(id):
	# Obtener el nodo del TextEdit
	var municipio_input = $MunicipioInput
	
	# Obtener la sugerencia seleccionada
	var suggestion = popup_menu.get_item_text(id)
	
	# Reemplazar el texto completo en el TextEdit con la sugerencia seleccionada
	municipio_input.set_text(suggestion)
	
	# Ocultar el PopupMenu después de seleccionar la sugerencia
	popup_menu.hide()

func _on_Tmasculino_pressed():
	isMalePressed = true
	$TMasculinoPressed.visible = true
	$TMasculino.visible = false
	$TFemenino.visible = true
	$TFemeninoPressed.visible = false

func _on_Tfemenino_pressed():
	isFemalePressed = true
	$TFemeninoPressed.visible = true
	$TFemenino.visible = false
	$TMasculino.visible = true
	$TMasculinoPressed.visible = false

# Función para guardar los datos en un archivo de texto
func guardar_datos_en_txt():
	var municipio_input = $MunicipioInput.text  # Obtener el municipio
	var nivel_educativo = nivelE.get_item_text(nivelE.selected)  # Obtener el nivel educativo seleccionado
	var sexo = "Masculino" if isMalePressed else "Femenino"  # Obtener el sexo seleccionado

	# Crear la cadena de texto con los datos
	var datos = "\n--- Datos de Persona ---\n"  # Separador para los datos de cada persona
	datos += "Municipio: " + municipio_input + "\n"
	datos += "Nivel Educativo: " + nivel_educativo + "\n"
	datos += "Sexo: " + sexo + "\n"

	# Guardar el archivo en el almacenamiento externo (Android) o en una ruta visible como un archivo de texto
	var external_path = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/datos_seleccionados.txt"
	
	var file = File.new()
	if file.file_exists(external_path):
		file.open(external_path, File.READ)
		var existing_data = file.get_as_text()  # Leer el contenido existente del archivo
		file.close()

		file.open(external_path, File.WRITE)
		file.store_string(existing_data)  # Escribir los datos existentes de nuevo
		file.seek_end()  # Mover el puntero al final del archivo para añadir nuevos datos
	else:
		file.open(external_path, File.WRITE)  # Crear el archivo si no existe
	file.store_string(datos)  # Añadir los datos al final del archivo
	file.close()
	print("Archivo de texto actualizado exitosamente en: ", external_path)

# Función para pasar a la siguiente escena
func btn_siguiente():
	# Verifica si un género ha sido seleccionado
	if not (isMalePressed or isFemalePressed):
		$Validacion3.visible = true
		yield(get_tree().create_timer(1.0), "timeout")
		$Validacion3.visible = false
		return
	
	# Verifica si se ha seleccionado un nivel educativo válido
	if nivelE.selected == 0:
		$Validacion2.visible = true
		yield(get_tree().create_timer(1.0), "timeout")
		$Validacion2.visible = false
		return

	# Verifica si el campo municipio_input está vacío o no válido
	var municipio_input = $MunicipioInput
	if municipio_input.text.strip_edges() == "":
		$Validacion1.visible = true
		yield(get_tree().create_timer(1.0), "timeout")
		$Validacion1.visible = false
		return
	
	# Verifica si el municipio ingresado existe en la lista de municipios
	if municipios.find(municipio_input.text) == -1:
		$MunicipioValicacion.visible = true
		yield(get_tree().create_timer(1.0), "timeout")
		$MunicipioValicacion.visible = false
		return

	# Si todo está correcto, guardar los datos en un archivo de texto
	guardar_datos_en_txt()

	# Mostrar el panel de validación 4
	$Validacion4.visible = true
	
	# Esperar 1 segundo antes de cambiar de escena
	yield(get_tree().create_timer(1.0), "timeout")
	
	# Ocultar el panel de validación 4
	$Validacion4.visible = false
	
	# Cambiar de escena
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")
