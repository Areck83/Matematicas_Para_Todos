extends Control
export var escena: int 
export var ejercicioNum = 0
onready var Mensaje = $Panel/Mensaje
func _ready():    
	actualizar_escena()
	ejercicioNum = ejercicioNum

func actualizar_escena():
	if GlobalVar.esnRetro == 0:
		$Panel/Mensaje/Aviso/MAviso.text = "¡Felicidades!"
		Mensaje.text = GlobalVar.msgRetro
		$Panel/Recuardo.visible = true
		$Panel/Recuardo2.visible = false
		$Panel/Zorro.visible = true
		$Panel/Zorro/AnimationPlayer.play("Animacion")
		var anim = $Panel/Zorro
		anim.play("feliz")
		
	elif GlobalVar.esnRetro == 1:
		$Panel/Mensaje/Aviso/MAviso.text = "¡Inténtalo!"
		Mensaje.text = GlobalVar.msgRetro
		$Panel/Recuardo.visible = false
		$Panel/Recuardo2.visible = true
		$Panel/Zorro.visible = true
		$Panel/Zorro/AnimationPlayer.play("Animacion")
		var anim = $Panel/Zorro
		anim.play("triste")

func _on_button_pressed():
	if GlobalVar.ejeTarjeta ==7:
		#yield(get_tree().create_timer(0.5), "timeout")
		GlobalVar.ejeTarCom = true
		print("se completaron las tarjetas? ",GlobalVar.ejeTarCom)
		
		get_tree().change_scene("res://escenas/regiones/region_2/tran_lab.tscn")
	if GlobalVar.ejeTarjeta < 7:
		get_tree().change_scene("res://escenas/regiones/region_2/init_2.tscn")
	#else:
	#	get_tree().change_scene("res://escenas/regiones/region_2/tran_lab.tscn")
	
	print("el ejercicio es: ", GlobalVar.ejercicio)
	if GlobalVar.ejercicio == 2:
		#scene_path = "res://escenas/minijuego/laberinto/laberinto2.tscn"
		
		GlobalVar.lab1Com = true
		get_tree().change_scene("res://escenas/regiones/region_2/tran_lab2.tscn")
	if GlobalVar.ejercicio == 3:
		#scene_path = "res://escenas/minijuego/laberinto/laberinto3.tscn"
		GlobalVar.lab2Com = true
		get_tree().change_scene("res://escenas/regiones/region_2/tran_lab3.tscn")
	if GlobalVar.ejercicio >= 4:
		#scene_path = "res://escenas/regiones/region_2/scn_Reg_2.tscn"
		GlobalVar.ejercicio=1
		BocinaPrincipal.para()
		Inicio.play()
		GlobalVar.ejeTarjeta = 1
		#
		GlobalVar.puntos = 0
		GlobalVar.ejercicio = 1
		GlobalVar.respuesta = 0
		GlobalVar.ejeTarjeta = 1
		#
		GlobalVar.ejeTarCom = false
		GlobalVar.lab1Com = false
		GlobalVar.lab2Com = false
		#
		get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")


