#Este script también toma el control de los elementos de la escena del ejercicio 1_1
extends Node2D

var contDrag : int = 0

var contNarPeq : int = 0
var contNarGran : int = 0
var contMaiz : int = 0
var contTotal : int = 0

var contOk : int = 0
signal respuestaOk
var escenaDestino = load("res://escenas/regiones/region_1/scn_Fin_1.tscn")
var rutaDestino = "res://escenas/regiones/region_1/scn_Fin_1.tscn"

##Controles de escena hija ejercicio 1_1
onready var r_1: LineEdit
onready var r_2: LineEdit
onready var r_3: LineEdit
onready var r_Total: LineEdit


func _ready():
	SignalManager.emit_signal("mostrarIndicacion", "1")
	connect("respuestaOk", self, "addRespuestaOk")
	contarElementosDrag()
	conectarListenersTxt()
	pass

func conectarListenersTxt():
	r_1 = $ejercicio1_1/recuadro_ejercicios/r_NarPeq_Calc
	r_1.connect("text_changed", self, "filtro_campo_1")
	
	r_2 = $ejercicio1_1/recuadro_ejercicios/r_NarGran_Calc
	r_2.connect("text_changed", self, "filtro_campo_2")
	
	r_3 = $ejercicio1_1/recuadro_ejercicios/r_Maiz_Calc
	r_3.connect("text_changed", self, "filtro_campo_3")
	
	r_Total = $ejercicio1_1/recuadro_ejercicios/r_Total
	r_Total.connect("text_changed", self, "filtro_campo_Total")
	pass

func contarElementosDrag():
	for drag in get_tree().get_nodes_in_group("drag"):
		contDrag += 1
		if drag.name.find("naranjo") == 0:
			contNarPeq +=1
		if drag.name.find("arbol_Grande") == 0:
			contNarGran +=1
		if drag.name.find("maiz_") == 0:
			contMaiz +=1
			
	contTotal = contDrag
	#Borrar en prod. DEBUG
	print("Total de arboles chicos:" + str(contNarPeq))
	print("Total de arboles grandes:" + str(contNarGran))
	print("Total de maiz:" + str(contMaiz))
	print("Total:" + str(contTotal))
	
	#Prevencion de errores no dados por el editor
	if contDrag <= 0:
		print("Asegurarse de poner las escenas drag en el grupo drag")
	else:
		SignalManager.connect("dragEliminado", self, "reducirDrags")
	pass

func reducirDrags():
	contDrag -= 1
	if contDrag == 0:
		mostrarPreguntas()
	pass

func mostrarPreguntas():
	$img_Parcela.hide()
	SignalManager.emit_signal("mostrarIndicacion", "1.2")
	$ejercicio1_1.show()
	pass

func addRespuestaOk():
	contOk += 1
	if contOk == 4:
		get_tree().change_scene(rutaDestino)
	pass

#Este hardcode es inevitable por la version de Godot utilizada en el proyecto. Enviar parametros en la señal es parte de Godot4. 
func filtro_campo_1(respuesta: String):
	var texto_filtrado = FunBuilder.filtro_regex(respuesta, FunBuilder.regexNumeros)
	if texto_filtrado != respuesta:
		r_1.set_text(texto_filtrado)
	if (checkRespuesta(r_1, contNarPeq)):
		$ejercicio1_1/recuadro_ejercicios/icon_check_1.setImgTrue()
		emit_signal("respuestaOk")
	pass

func filtro_campo_2(respuesta: String):
	var texto_filtrado = FunBuilder.filtro_regex(respuesta, FunBuilder.regexNumeros)
	if texto_filtrado != respuesta:
		r_2.set_text(texto_filtrado)
	if (checkRespuesta(r_2, contNarGran)):
		$ejercicio1_1/recuadro_ejercicios/icon_check_2.setImgTrue()
		emit_signal("respuestaOk")
	pass

func filtro_campo_3(respuesta: String):
	var texto_filtrado = FunBuilder.filtro_regex(respuesta, FunBuilder.regexNumeros)
	if texto_filtrado != respuesta:
		r_3.set_text(texto_filtrado)
	if (checkRespuesta(r_3, contMaiz)):
		$ejercicio1_1/recuadro_ejercicios/icon_check_3.setImgTrue()
		emit_signal("respuestaOk")
	pass

func filtro_campo_Total(respuesta: String):
	var texto_filtrado = FunBuilder.filtro_regex(respuesta, FunBuilder.regexNumeros)
	if texto_filtrado != respuesta:
		r_Total.set_text(texto_filtrado)
	if (checkRespuesta(r_Total, contTotal)):
		$ejercicio1_1/recuadro_ejercicios/icon_check_4.setImgTrue()
		emit_signal("respuestaOk")
	pass

func checkRespuesta(campo: LineEdit, valorComparado: int) -> bool:
	if(campo.text == str(valorComparado)):
		campo.editable = false
		campo.MOUSE_FILTER_STOP
		return true
	return false
	pass
