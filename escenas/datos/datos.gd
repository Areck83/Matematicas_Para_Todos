extends Panel

var regiones: OptionButton
var municipio: OptionButton
var nivelE: OptionButton
var datosLabel: Label
var masculinoCheckBox: CheckBox
var femeninoCheckBox : CheckBox
var isFemalePressed: bool = false
var isMalePressed: bool = false
var regionesV = []
var municipiosPorRegion = {}
var selectedRegionIndex = -1
var datos_recibidos = {}
var btnCambiarEscena: TouchScreenButton

func _ready():
	regionesV = RegionesData.regionesVeracruz
	municipiosPorRegion = RegionesData.municipiosPorRegion
	masculinoCheckBox = $Masculino
	femeninoCheckBox = $Femenino
	regiones = $Regiones
	municipio = $Municipio
	nivelE = $NivelEducativo
	datosLabel = $datos
	btnCambiarEscena = $btnCambiarEscena

	# Establecer el texto inicial deseado
	regiones.text = "Selecciona tu Region"
	nivelE.text = "Selecciona tu Nivel"

	# Agregar las opciones reales después de un frame
	call_deferred("_setup_initial_options")

	# Inicializar el diccionario con los valores iniciales de las variables
	datos_recibidos["isFemalePressed"] = false
	datos_recibidos["isMalePressed"] = false
	datos_recibidos["regionesV"] = []
	datos_recibidos["municipiosPorRegion"] = {}
	datos_recibidos["nivelE"] = {}

	# Conectar las señales de los CheckBox a los métodos correspondientes
	masculinoCheckBox.connect("toggled", self, "_on_masculino_toggled")
	femeninoCheckBox.connect("toggled", self, "_on_femenino_toggled")
	btnCambiarEscena.connect("pressed", self, "_guardar_datos")

func _setup_initial_options():
	regiones.clear()
	for idx in range(regionesV.size()):
		regiones.add_item(regionesV[idx], idx)
	regiones.select(0)

func _on_region_selected(index):
	selectedRegionIndex = index
	_update_municipios_for_region(selectedRegionIndex)
	datos_recibidos["regionesV"] = regiones.get_item_text(regiones.get_selected_id())
	datos_recibidos["municipiosPorRegion"] = municipio.get_item_text(municipio.get_selected_id())

func _on_nivel_selected(index):
	datos_recibidos["nivelE"] = nivelE.get_item_text(nivelE.get_selected_id())

func _update_municipios_for_region(region_name):
	var municipios = municipiosPorRegion[region_name]
	municipio.clear()
	for municipio_name in municipios:
		municipio.add_item(municipio_name)
	municipio.select(0)

func _on_masculino_toggled(active):
	if active:
		isMalePressed = true
		isFemalePressed = false
		femeninoCheckBox.pressed = false
		datos_recibidos["isMalePressed"] = isMalePressed

func _on_femenino_toggled(active):
	if active:
		isMalePressed = false
		isFemalePressed = true
		masculinoCheckBox.pressed = false
		datos_recibidos["isFemalePressed"] = isFemalePressed

func _on_Masculino_toggled(button_pressed):
	pass

func _guardar_datos():
	print("Guardando datos...")
	print("isFemalePressed:", datos_recibidos["isFemalePressed"])
	print("isMalePressed:", datos_recibidos["isMalePressed"])
	print("regionesV:", datos_recibidos["regionesV"])
	print("municipiosPorRegion:", datos_recibidos["municipiosPorRegion"])
	print("nivelE:", datos_recibidos["nivelE"])

func _cargar_datos():
	# Cargar el estado de los checkboxes
	isMalePressed = datos_recibidos["isMalePressed"]
	isFemalePressed = datos_recibidos["isFemalePressed"]
	masculinoCheckBox.pressed = isMalePressed
	femeninoCheckBox.pressed = isFemalePressed

	# Cargar los datos de las opciones seleccionadas en los OptionButtons
	var region_selected_text = datos_recibidos["regionesV"]
	var region_index = regiones.items.find(region_selected_text)
	if region_index != -1:
		regiones.selected = region_index

	var municipio_selected_text = datos_recibidos["municipiosPorRegion"]
	var municipio_index = municipio.items.find(municipio_selected_text)
	if municipio_index != -1:
		municipio.selected = municipio_index

	var nivel_selected_text = datos_recibidos["nivelE"]
	var nivel_index = nivelE.items.find(nivel_selected_text)
	if nivel_index != -1:
		nivelE.selected = nivel_index







