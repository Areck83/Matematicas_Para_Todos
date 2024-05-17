extends Node2D


onready var prob = $CanvasLayer/DialogPlanteamiento
onready var anim = $CanvasLayer/caraZorro


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	GlobalVar.respuesta = 2
	#GlobalVar.ejercicio = 4
	pass # Replace with function body.

func nivelFinalizado():
	$CanvasLayer/pregunta1.interruptor()


func _on_meta_body_entered(body):

	prob.visible = false
	nivelFinalizado()
	pass # Replace with function body.
