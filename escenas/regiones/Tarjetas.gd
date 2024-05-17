extends Control

var mensaje_texto_incorrecto = ""
var mensaje_texto_correcto = ""
enum Status { Correcto }
export(Status) var status

onready var anim = $Panel/Cuadro/AnimatedSprite
onready var current_panel = $Panel/Cuadro
onready var ejercicioTitle = $Panel/Cuadro/Title

var indice_dialogo = 0
var label_dialogo
var respuesta 
var ejercicio = GlobalVar.ejercicioTarjetas
var dialogos = []

func aumentarEjercicio() -> int:
	ejercicio += 1
	emit_signal("ejercicio_actualizado", ejercicio)
	return ejercicio

func _on_ejercicio_actualizado(nuevo_ejercicio):
	ejercicio = nuevo_ejercicio
	print("El ejercicio1 se ha actualizado a:", nuevo_ejercicio)

func _ready():
	$Panel/Cuadro.visible = false
	$Panel/Cuadro.visible = true
	cambiarEjercicio(ejercicio)
	print("ESTAMOS EN ESTE EJERCICIO: ", ejercicio)
	label_dialogo = current_panel.get_node("Texto")
	if dialogos.size() > 0:
		label_dialogo.text = dialogos[indice_dialogo]

	$Panel/tsb_Siguiente.connect("pressed", self, "_on_tsb_Siguiente_pressed")
	$Panel/tsb_Atras.connect("pressed", self, "_on_tsb_Atras_pressed")
	connect("ejercicio_actualizado", self, "_on_ejercicio_actualizado")

func _on_tsb_Siguiente_pressed():
	$Panel/EjercicioT1.show()
	$Panel/tsb_Siguiente.hide()
	$Panel/tsb_Atras.show()

func _on_tsb_Atras_pressed():
	$Panel/EjercicioT1.visible = false
	$Panel/EjercicioT2.show()
	$Panel/tsb_Atras.hide()
	$Panel/tsb_Siguiente.show()

func cambiarEjercicio(ejercicio):
	TarjetasManager.ejercicioRegion3(ejercicio, $Panel/EjercicioT1, $Panel/EjercicioT2)
	var resultado = RegionesData.EjercicioRegion3(ejercicio)
	dialogos = resultado["dialogo"]
	respuesta = resultado["respuesta"]
	mensaje_texto_correcto = resultado["mensaje_correcto"]
	mensaje_texto_incorrecto = resultado["mensaje_incorrecto"]
	ejercicioTitle.text = resultado ["ejercicio"]
	

func _on_tsb_Continuar_pressed():
	indice_dialogo += 1
	if indice_dialogo >= dialogos.size():
		indice_dialogo = 0
	label_dialogo.text = dialogos[indice_dialogo]

func _on_Verdadero_pressed():
	if respuesta == true:
		if status == Status.Correcto:
			mostrar_respuesta_correcta()
	elif respuesta == false:
		if status == Status.Correcto:
			status = 1
			mostrar_respuesta_incorrecta()

func _on_Falso_pressed():
	if respuesta == false:
		if status == Status.Correcto:
			mostrar_respuesta_correcta()
	elif respuesta == true:
		if status == Status.Correcto:
			status = 1
			mostrar_respuesta_incorrecta()

func mostrar_respuesta_correcta():
	aumentarEjercicio()
	GlobalVar.ejercicioTarjetas = ejercicio
	GlobalVar.escenaRetroalimentacion = 0
	GlobalVar.mensajeRetroalimentacion = mensaje_texto_correcto
	get_tree().change_scene("res://escenas/regiones/scn_retroAlimentación.tscn")
	
func mostrar_respuesta_incorrecta():
	aumentarEjercicio()
	GlobalVar.ejercicioTarjetas = ejercicio
	GlobalVar.escenaRetroalimentacion = 1
	GlobalVar.mensajeRetroalimentacion = mensaje_texto_incorrecto
	get_tree().change_scene("res://escenas/regiones/scn_retroAlimentación.tscn")




