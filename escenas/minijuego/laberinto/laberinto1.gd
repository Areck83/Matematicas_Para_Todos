extends Node2D

onready var prob = $CanvasLayer/DialogPlanteamiento
onready var anim = $CanvasLayer/caraZorro


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	GlobalVar.respuesta = 1
	GlobalVar.puntos = 0
	#GlobalVar.ejercicio = 2
	#print("lv1 ready respuesta: "+str(GlobalVar.respuesta))
	#print("puntos: "+str(GlobalVar.puntos))
	#print("ejercicio: "+str(GlobalVar.ejercicio))
	#pass # Replace with function body.
	
	# Establecer el texto con formato en el RichTextLabel
	# Establecer el texto con formato en el RichTextLabel
	var texto1_bbcode = "El porcentaje se basa en una fracción de base 100, por lo que las [b][color=#000000]operaciones[/color][/b] con fracciones permiten calcular y convertir porcentajes de manera efectiva."
	$mensajes/mensaje1/contenido1/msg1.bbcode_text = texto1_bbcode
	
	var texto2_bbcode = "Al [b][color=#000000]comparar[/color][/b] fracciones, se establece una relación entre las partes y el todo, lo que ayuda a comprender la noción de porcentaje."
	$mensajes/mensaje2/contenido2/msg2.bbcode_text = texto2_bbcode
	
	
func nivelFinalizado():
	print("la respuesta en laberinto es: ", GlobalVar.respuesta)
	$CanvasLayer/pregunta1.interruptor()


func _on_meta_body_entered(body):
	prob.visible = false
	nivelFinalizado()
	#pass # Replace with function body.
