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
var ejercicio = GlobalVar.ejeTarjeta
var dialogos = []

func aumentarEjercicio() -> int:
	ejercicio += 1
	emit_signal("ejercicio_actualizado", ejercicio)
	return ejercicio

func _on_ejercicio_actualizado(nuevo_ejercicio):
	ejercicio = nuevo_ejercicio
	print("El ejercicio se ha actualizado a:", nuevo_ejercicio)

func _ready():
	$Panel/Cuadro.visible = false
	$Panel/Cuadro.visible = true
	tit.text = "Ejercicio"
	#$volver.visible = false
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
	connect("ejercicio_actualizado", self, "_on_ejercicio_actualizado")


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
		print("V respuesta es igual a true")
		if status == Status.Correcto:
			print("V el estatus es correcto ->", status)
			mostrar_respuesta_correcta()
	elif respuesta == false:
		print("Vf respuesta es igual a false")
		if status == Status.Correcto:
			status = 1
			print("Vf el estatus es correcto ->", status)
			mostrar_respuesta_incorrecta()

func _on_Falso_pressed():
	if respuesta == false:
		print("F respuesta es igual a true")
		if status == Status.Correcto:
			print("F el estatus es correcto ->", status)
			mostrar_respuesta_correcta()
	elif respuesta == true:
		print("Ff respuesta es igual a true")
		if status == Status.Correcto:
			status = 1
			print("Ff el estatus es correcto ->", status)
			mostrar_respuesta_incorrecta()

func mostrar_respuesta_correcta():
	aumentarEjercicio()
	GlobalVar.ejeTarjeta = ejercicio
	GlobalVar.esnRetro = 0
	GlobalVar.msgRetro = mensaje_texto_correcto
	print("respuesta correcta ", GlobalVar.ejeTarjeta)
	get_tree().change_scene("res://escenas/regiones/region_2/scn_retroAlimentación.tscn")
	

func mostrar_respuesta_incorrecta():
	aumentarEjercicio()
	GlobalVar.ejeTarjeta = ejercicio
	GlobalVar.esnRetro = 1
	GlobalVar.msgRetro = mensaje_texto_incorrecto
	print("respuesta incorrecta: ", GlobalVar.ejeTarjeta)
	get_tree().change_scene("res://escenas/regiones/region_2/scn_retroAlimentación.tscn")

func volver():
	BocinaPrincipal.stop()
	GlobalVar.ejeTarjeta = 1
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")


