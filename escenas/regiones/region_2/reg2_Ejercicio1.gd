extends Node2D

onready var anim = $CanvasLayer/caraZorro
onready var tarjeta = $tarjeta
onready var sig = $CanvasLayer/siguiente
onready var problema = $CanvasLayer/DialogPlanteamiento/problema
var numero_tarjetas = 15



# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	_cambiar()
	_cambiarProblema()
	pass # Replace with function body.
#diccionario
func _cambiarProblema():
	if GlobalVar.num_tarjeta <=3 && GlobalVar.num_tarjeta>0:
		problema.text = "1.- En una finca de café, se ha observado que, si se siembran 1000 plantas de café, se obtienen 500 kg café. ¿Cuántos kilogramos de café se obtendrían si se siembran 2500 plantas de café?"
	if GlobalVar.num_tarjeta <=6 && GlobalVar.num_tarjeta>3:
		problema.text = "2.- En una finca de café, se requieren 3 litros de agua por cada 5 plantas de café sembradas, para regarlas cuadamente. Si en la finca hay 2000 plantas de café, ¿cuántos litros de agua se necesitarán?"
	if GlobalVar.num_tarjeta <=9 && GlobalVar.num_tarjeta>6:
		problema.text = "3.- En una finca de café, 2/8 de las plantas dan como fruto café caturra. Si sabe que hay 500 plantas de café, ¿Cuál es el porcentaje y el número de plantas que corresponden a este tipo de café?"
	if GlobalVar.num_tarjeta <=12 && GlobalVar.num_tarjeta>9:
		problema.text = "4.- En una finca de café en Xalapa, se encontró que 2/10 de los días del año el café presenta una calidad regular o deficiente. Si hay 365 días en un año, ¿Qué porcentaje de días del año el café tiene una calidad regular o deficiente?"
	if GlobalVar.num_tarjeta <=15 && GlobalVar.num_tarjeta>12:
		problema.text = "5.-  Se ha detectado que, en un lote de café de la feria, hay 5 bolsas con café Arábigo, 3 bolsas con café Robusta y 2 bolsas con café caturra. Si se sabe que al menos una de las bolsas extraídas es de café arábigo ¿cuál es la probabilidad expresada en fracciones de obtener dos bolsas de café arábigo? "
	
	
func _cambiar():
	for i in range(1, numero_tarjetas +1):
		if GlobalVar.tarjeta == i:
			var ruta = "res://recursos/imagenes/reg2/tarjetas/tarjeta%d.png" % i
			tarjeta.texture = load(ruta)
	


func _on_Incorrecto_pressed():
	anim.play("triste")
	sig.visible=true
	if GlobalVar.tarjeta==2 or GlobalVar.tarjeta==6 or GlobalVar.tarjeta==8 or GlobalVar.tarjeta==10 or GlobalVar.tarjeta==11 or GlobalVar.tarjeta==14 or GlobalVar.tarjeta==15:
		for i in range(1, numero_tarjetas+1):
			if GlobalVar.tarjeta == i:
				GlobalVar.puntos +=1
	GlobalVar.tarjeta +=1
	#pass # Replace with function body.


func _on_correcto_pressed():
	anim.play("feliz")
	sig.visible=true
	if GlobalVar.tarjeta==1 or GlobalVar.tarjeta==3 or GlobalVar.tarjeta==4 or GlobalVar.tarjeta==5 or GlobalVar.tarjeta==7 or GlobalVar.tarjeta==9 or GlobalVar.tarjeta==12 or GlobalVar.tarjeta==13:
		for i in range(1, numero_tarjetas+1):
			if GlobalVar.tarjeta == i:
				GlobalVar.puntos +=1
	GlobalVar.tarjeta +=1
	#_cambiar()
	pass # Replace with function body.


func _on_siguiente_pressed():
	get_tree().change_scene("res://escenas/regiones/region_2/scn_retroalimentacion.tscn")
	GlobalVar.num_tarjeta +=1
	pass # Replace with function body.
