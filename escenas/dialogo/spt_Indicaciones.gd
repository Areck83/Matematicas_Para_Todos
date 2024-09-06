extends CanvasLayer

var textoSeleccionado = ""
var mostrandoTexto = false
var indiceCaracter = 0

onready var textoMostrado = $texto
onready var tituloMostrado = $titulo

func _ready():
	SignalManager.connect("mostrarIndicacion", self, "mostrarTexto")
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.015
	timer.connect("timeout", self, "animacionTexto")
	timer.start()
	pass

func animacionTexto():
	if indiceCaracter < len(textoSeleccionado):
		var subcadena = textoSeleccionado.substr(0, indiceCaracter + 1)
		textoMostrado.bbcode_text = subcadena
		indiceCaracter += 1
		textoMostrado.parse_bbcode(textoMostrado.bbcode_text)
	else:
		mostrandoTexto = false
		textoMostrado.text = textoSeleccionado
		textoMostrado.parse_bbcode(textoMostrado.bbcode_text)
	pass

func reiniciarDialogo():
	textoMostrado.text = ""
	mostrandoTexto = false
	indiceCaracter = 0
	pass

func mostrarTexto(id):
	if mostrandoTexto:
		reiniciarDialogo()
	else:
		mostrandoTexto = true
		textoSeleccionado = RegionesData.reg_1_indicaciones[id]["Instruccion"]
		tituloMostrado.text = RegionesData.reg_1_indicaciones[id]["Nombre"]
		indiceCaracter = 0
		animacionTexto()
	pass

