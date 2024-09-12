extends Node2D


onready var prob = $CanvasLayer/DialogPlanteamiento
onready var anim = $CanvasLayer/caraZorro


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	GlobalVar.respuesta = 2
	#GlobalVar.ejercicio = 4
	var texto1_bbcode = "La práctica de [b][color=#000000]repartir[/color][/b] una cantidad en partes iguales implica dividir esa cantidad en fracciones proporcionales."
	$mensajes/mensaje1/contenido1/msg1.bbcode_text = texto1_bbcode
	
	var texto2_bbcode = "Al [b][color=#000000]comparar[/color][/b] fracciones, se puede determinar si una cantidad es mayor o menor que otra, lo que ayuda a establecer relaciones proporcionales."
	$mensajes/mensaje2/contenido2/msg2.bbcode_text = texto2_bbcode
	
	var texto3_bbcode = "La práctica de medir utilizando fracciones permite expresar [b][color=#000000]medidas[/color][/b] exactas en términos de proporciones."
	$mensajes/mensaje3/contenido3/msg3.bbcode_text = texto3_bbcode
	
	var texto4_bbcode = "Las [b][color=#000000]operaciones[/color][/b] permiten realizar cálculos y manipulaciones con fracciones para resolver problemas de proporción."
	$mensajes/mensaje4/contenido4/msg4.bbcode_text = texto4_bbcode
	
	pass # Replace with function body.

func nivelFinalizado():
	$CanvasLayer/pregunta1.interruptor()


func _on_meta_body_entered(body):

	prob.visible = false
	nivelFinalizado()
	pass # Replace with function body.
