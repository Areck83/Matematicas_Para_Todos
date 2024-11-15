extends Control

var mensaje_texto_incorrecto = ""
var mensaje_texto_correcto = ""
enum Status { Correcto }
export(Status) var status

onready var anim = $Panel/Cuadro/AnimatedSprite
onready var current_panel2 = $Panel/Cuadro

var indice_dialogo = 0
var label_dialogo
var respuesta 
var ejercicio = 1
var dialogos = []

func aumentarEjercicio() -> int:
	ejercicio += 1
	emit_signal("ejercicio_actualizado", ejercicio)
	return ejercicio

func _on_ejercicio_actualizado(nuevo_ejercicio):
	ejercicio = nuevo_ejercicio
	print("El ejercicio se ha actualizado a:", nuevo_ejercicio)

func _ready():
	cambiarEjercicio(ejercicio)
	print("ESTAMOS EN ESTE EJERCICIO: ", ejercicio)
	label_dialogo = current_panel2.get_node("Texto")
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
	EjercicioManager.escenaEjercicioRegion3(ejercicio, $Panel/EjercicioT1, $Panel/EjercicioT2)
	var resultado = EjercicioManager.escenaEjercicioRegion3(ejercicio, $Panel/EjercicioT1, $Panel/EjercicioT2)
	dialogos = resultado["dialogo"]
	respuesta = resultado["respuesta"]
	mensaje_texto_correcto = resultado["mensaje_correcto"]
	mensaje_texto_incorrecto = resultado["mensaje_incorrecto"]

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
	$Retroalimentacion.visible = true
	$Retroalimentacion.escena = status
	$Retroalimentacion.actualizar_escena()
	$Retroalimentacion/Panel/Mensaje.text = mensaje_texto_correcto
	#yield(get_tree().create_timer(2.0), "timeout")
	$Retroalimentacion/btnCambiarEscena.connect("pressed", self, "reiniciar_escena")

func mostrar_respuesta_incorrecta():
	$Retroalimentacion.visible = true
	$Retroalimentacion.escena = status
	$Retroalimentacion.actualizar_escena()
	$Retroalimentacion/Panel/Mensaje.text = mensaje_texto_incorrecto
	#yield(get_tree().create_timer(2.0), "timeout")
	$Retroalimentacion/btnCambiarEscena.connect("pressed", self, "reiniciar_escena")

func reiniciar_escena():
	aumentarEjercicio()
	var scene_path = "res://escenas/regiones/region_3/ejercicio_base.tscn"
	var new_scene = load(scene_path).instance()
	new_scene.ejercicio = ejercicio
	get_tree().get_root().add_child(new_scene)
	#get_tree().reload_current_scene()













