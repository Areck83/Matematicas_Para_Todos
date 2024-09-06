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

func nivelFinalizado():
	print("la respuesta en laberinto es: ", GlobalVar.respuesta)
	$CanvasLayer/pregunta1.interruptor()


func _on_meta_body_entered(body):
	prob.visible = false
	nivelFinalizado()
	#pass # Replace with function body.
