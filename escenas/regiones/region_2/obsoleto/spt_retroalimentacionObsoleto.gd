extends Node2D

onready var label = $Felicidades/Label
var numero_tarjetas = 15


func _ready():
	_cambiar()
	#print("pantalla retroalimentacion respuesta: "+str(GlobalVar.respuesta))
	#print("puntos: "+str(GlobalVar.puntos))
	#print("ejercicio: "+str(GlobalVar.ejercicio))
	#pass # Replace with function body.
	

func _cambiar():
	if GlobalVar.puntos == 1:
		$ZorroAlegre.visible = true
		label.text="¡Buen trabajo lo conseguiste!"
		$ZorroAlegre/AnimationPlayer.play("alegre")
		
	if GlobalVar.puntos == 2:
			$ZorroAlegre.visible = true
			label.text="¡Buen trabajo lo conseguiste!"
			$ZorroAlegre/AnimationPlayer.play("alegre")
		
	if GlobalVar.puntos == 3:
			$ZorroAlegre.visible = true
			label.text="¡Buen trabajo lo conseguiste!"
			$ZorroAlegre/AnimationPlayer.play("alegre")
			GlobalVar.puntos = 0
		
	if GlobalVar.puntos == 0:
		$ZorroTriste.visible = true
		label.text="casi, sigamoslo intentando" 
		$ZorroTriste/AnimationPlayer.play("triste")
	#pass


func _on_siguiente_pressed():
	if GlobalVar.ejercicio ==1:
		for i in range(1, numero_tarjetas +1):
			if GlobalVar.tarjeta == i:
				get_tree().change_scene("res://escenas/regiones/region_2/reg2_Ejercicio1.tscn")
				if i==15: 
					GlobalVar.ejercicio+=1
			
	if GlobalVar.ejercicio == 2:
		get_tree().change_scene("res://escenas/minijuego/laberinto/laberinto.tscn")
			
	if GlobalVar.ejercicio == 3:
		get_tree().change_scene("res://escenas/minijuego/laberinto/laberinto2.tscn")
	
	if GlobalVar.ejercicio == 4:
		get_tree().change_scene("res://escenas/minijuego/laberinto/laberinto3.tscn")
		
	if GlobalVar.ejercicio >= 5:
		get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")

	#pass # Replace with function body.
