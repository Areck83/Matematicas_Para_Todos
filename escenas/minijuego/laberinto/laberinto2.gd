extends Node2D


onready var prob = $CanvasLayer/DialogPlanteamiento
onready var anim = $CanvasLayer/caraZorro


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	GlobalVar.respuesta = 3
	#GlobalVar.ejercicio = 3
	
	var texto1_bbcode = "[b][color=#000000]Contar[/color][/b] es una práctica importante en la probabilidad, ya que implica determinar el número total de resultados posibles. "
	$mensajes/mensaje1/contenido1/msg1.bbcode_text = texto1_bbcode
	
	var texto2_bbcode = "[b][color=#000000]Comparar[/color][/b] fracciones es útil en la probabilidad para determinar las relaciones de mayor o menor probabilidad entre diferentes eventos."
	$mensajes/mensaje2/contenido2/msg2.bbcode_text = texto2_bbcode
	
	var texto3_bbcode = "Las [b][color=#000000]operaciones[/color][/b] se utilizan para calcular probabilidades de eventos compuestos."
	$mensajes/mensaje3/contenido3/msg3.bbcode_text = texto3_bbcode
	
	
	pass # Replace with function body.

func nivelFinalizado():
	$CanvasLayer/pregunta1.interruptor()


func _on_meta_body_entered(body):

	prob.visible = false
	nivelFinalizado()
	pass # Replace with function body.
