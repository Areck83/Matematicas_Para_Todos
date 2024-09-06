extends Node2D

var ejer = 0
var status = 1
var is_paused = true setget set_is_paused
var mostrado = false
onready var ejercicio = $Panel/ejercicio
onready var respuestaA = $Panel/Label3
onready var respuestaB = $Panel/Label
onready var respuestaC = $Panel/Label2

#onready var ca = $caraZorro

var mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
var mensaje_correcto = "EXCELENTE SIGUE ASI"




func _ready():
	#$Retroalimentacion/btnCambiarEscena.connect("pressed", self, "cambiar_escena")
	print("la respuesta en pregunta es: ", GlobalVar.respuesta)
	$Panel.hide()
	_cambiar()
	
	$Retroalimentacion/btnCambiarEscena.connect("pressed", self, "cambiar_escena")
	#print("preg ready respuesta: "+str(GlobalVar.respuesta))
	#print("puntos: "+str(GlobalVar.puntos))
	#print("ejercicio: "+str(GlobalVar.ejercicio))
	#pass

func aparecer():
	$Panel.show_on_top
	$Panel.show()
	#$pregunta1.show()
	self.is_paused = !is_paused
	
func interruptor():
	
	mostrado = !mostrado
	if mostrado == true:
		aparecer()
		
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	

func _cambiar():
	if GlobalVar.ejercicio == 1:
		ejercicio.text="Las prácticas asociadas a las fracciones que se relacionan más con el porcentaje son: "
		respuestaA.text="a.- Comparar y operar"
		respuestaB.text="b.- Medir y fracturar"
		respuestaC.text="c.- Repartir y contar"
		
	if GlobalVar.ejercicio == 2:
		ejercicio.text="Las prácticas asociadas a las fracciones que se relacionan más con la probabilidad son: "
		respuestaA.text="a.- Comparar, operar y medir"
		respuestaB.text="b.- Medir, operar y fracturar"
		respuestaC.text="c.- Contar, comparar y operar"
		
	if GlobalVar.ejercicio == 3:
		ejercicio.text="Las prácticas asociadas a las fracciones que se relacionan más con la proporcionalidad son:"
		respuestaA.text="a.- Contar, Repartir y Operar"
		respuestaB.text="b.- Repartir, Comparar, Medir y Operar"
		respuestaC.text="c.- Medir, Contar y Operar"
		
	#pass

func aumentarEjercicio() -> int:
	ejer += 1
	GlobalVar.ejercicio +=1
	emit_signal("ejercicio_actualizado", ejer)
	return ejer

func _on_respuestaA_pressed():
	self.is_paused = false
	if GlobalVar.ejercicio == 1:
		#GlobalVar.puntos += 1
		status = 0
		$Retroalimentacion.escena = status
		print("la respuesta es: ", status)
		#GlobalVar.ejercicio +=1
		$Retroalimentacion/Panel/Mensaje.text = mensaje_correcto
		
		$Retroalimentacion.actualizar_escena()
	else:
		$Retroalimentacion.escena = status
		$Retroalimentacion/Panel/Mensaje.text = mensaje_incorrecto
		
		$Retroalimentacion.actualizar_escena()
	aumentarEjercicio()
	
	$Retroalimentacion.visible = true
	
	#$Retroalimentacion.actualizar_escena()
	
	#yield(get_tree().create_timer(2.0), "timeout")
	#$Retroalimentacion/btnCambiarEscena.connect("pressed", self, "cambiar_escena")
	GlobalVar.respuesta = 0
	#GlobalVar.puntos = 0
	print("el estatus es: ", status)

	#print("puntos: "+str(GlobalVar.puntos))
	#print("ejercicio: "+str(GlobalVar.ejercicio))
	#pass

func _on_respuestaB_pressed():
	self.is_paused = false
	if GlobalVar.ejercicio == 3:
		GlobalVar.puntos += 1
		#GlobalVar.ejercicio +=1
		status = 0
		$Retroalimentacion.escena = status
		$Retroalimentacion/Panel/Mensaje.text = mensaje_correcto
		
		$Retroalimentacion.actualizar_escena()
		#GlobalVar.respuesta = 0
	else:
		$Retroalimentacion.escena = status
		$Retroalimentacion/Panel/Mensaje.text = mensaje_incorrecto
		
		$Retroalimentacion.actualizar_escena()
	#get_tree().change_scene("res://escenas/regiones/region_2/scn_retroAlimentación.tscn")
	aumentarEjercicio()
	
	$Retroalimentacion.visible = true

	#$Retroalimentacion.actualizar_escena()
	GlobalVar.respuesta = 0
	#GlobalVar.puntos = 0
	print("el estatus es: ", status)

	#print("puntos: "+str(GlobalVar.puntos))
	#print("ejercicio: "+str(GlobalVar.ejercicio))
	#pass # Replace with function body.


func _on_respuestaC_pressed():
	self.is_paused = false
	if GlobalVar.ejercicio == 2:
		GlobalVar.puntos += 1
		#GlobalVar.ejercicio +=1
		status = 0
		$Retroalimentacion.escena = status
		$Retroalimentacion/Panel/Mensaje.text = mensaje_correcto
		
		#$Retroalimentacion.actualizar_escena()
		#GlobalVar.respuesta = 0
	else:
		$Retroalimentacion.escena = status
		$Retroalimentacion/Panel/Mensaje.text = mensaje_incorrecto
		
		#$Retroalimentacion.actualizar_escena()
	#get_tree().change_scene("res://escenas/regiones/region_2/scn_retroAlimentación.tscn")
	#print("respuesta: "+str(GlobalVar.respuesta))
	GlobalVar.respuesta = 0

	#GlobalVar.puntos = 0
	#print("puntos: "+str(GlobalVar.puntos))
	aumentarEjercicio()
	
	$Retroalimentacion.visible = true

	#$Retroalimentacion.actualizar_escena()
	print("el estatus es: ", status)
	#pass # Replace with function body.



func cambiar_escena():
	#aumentarEjercicio()
	#var scene_path = ""
	print("el ejercicio es: ", GlobalVar.ejercicio)
	if GlobalVar.ejercicio == 2:
		#scene_path = "res://escenas/minijuego/laberinto/laberinto2.tscn"
		
		get_tree().change_scene("res://escenas/regiones/region_2/tran_lab2.tscn")
	elif GlobalVar.ejercicio == 3:
		#scene_path = "res://escenas/minijuego/laberinto/laberinto3.tscn"
		
		get_tree().change_scene("res://escenas/regiones/region_2/tran_lab3.tscn")
	else:
		#scene_path = "res://escenas/regiones/region_2/scn_Reg_2.tscn"
		GlobalVar.ejercicio=1
		BocinaPrincipal.para()
		get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")
	
	#var resource = ResourceLoader.load(scene_path)
	#if resource:
	#	var new_scene = resource.instance()
	#	get_tree().get_root().add_child(new_scene)
	#else:
	#	print("No se pudo cargar la escena:", scene_path)
	#$Retroalimentacion.visible = false

