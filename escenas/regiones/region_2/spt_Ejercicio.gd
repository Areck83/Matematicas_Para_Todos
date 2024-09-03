extends Control

var mensaje_texto_incorrecto = ""
var mensaje_texto_correcto = ""
enum Status { Correcto }
export(Status) var status

onready var anim = $Panel/Cuadro/AnimatedSprite
onready var current_panel2 = $Panel/Cuadro
onready var cuad = $Panel/Cuadro/AnimatedSprite
onready var fon = $Panel/Cuadro/Fondo
onready var tit = $Panel/Cuadro/Title
onready var txt = $Panel/Cuadro/Texto

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
	cuad.visible = true
	fon.visible = true
	tit.visible = true
	txt.visible = true
	#$Panel/tsb_Siguiente.connect("pressed", self, "_on_tsb_Siguiente_pressed")
	#$Panel/tsb_Atras.connect("pressed", self, "_on_tsb_Atras_pressed")
	#connect("ejercicio_actualizado", self, "_on_ejercicio_actualizado")


func cambiarEjercicio(ejercicio):
	EjercicioManager.escenaEjercicioRegion2(ejercicio, $Panel/EjercicioT1)
	var resultado = EjercicioManager.escenaEjercicioRegion2(ejercicio, $Panel/EjercicioT1)
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
	$Panel/Cuadro.visible = false
	$Retroalimentacion/btnCambiarEscena.connect("pressed", self, "reiniciar_escena")
	$Panel/Cuadro.visible = true

func mostrar_respuesta_incorrecta():
	$Retroalimentacion.visible = true
	$Retroalimentacion.escena = status
	$Retroalimentacion.actualizar_escena()
	$Retroalimentacion/Panel/Mensaje.text = mensaje_texto_incorrecto
	#yield(get_tree().create_timer(2.0), "timeout")
	$Panel/Cuadro.visible = false
	$Retroalimentacion/btnCambiarEscena.connect("pressed", self, "reiniciar_escena")
	$Panel/Cuadro.visible = true

func reiniciar_escena():
	aumentarEjercicio()
	if ejercicio >= 7:
		cuad.visible = false
		fon.visible = false
		tit.visible = false
		txt.visible = false
		print(" opcion de reinicio ESTAMOS EN ESTE EJERCICIO: ", ejercicio)
	if ejercicio == 6:
		cuad.visible = false
		fon.visible = false
		tit.visible = false
		txt.visible = false
		get_tree().change_scene("res://escenas/regiones/region_2/tran_lab.tscn")
	if ejercicio <6:
		var scene_path = "res://escenas/regiones/region_2/scn_ejercicio_base.tscn"
		var new_scene = load(scene_path).instance()
		new_scene.ejercicio = ejercicio
		get_tree().get_root().add_child(new_scene)
		#get_tree().reload_current_scene()
	


