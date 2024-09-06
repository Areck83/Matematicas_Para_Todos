extends Control
export var escena: int 
export var ejercicioNum = 0
onready var Mensaje = $Panel/Mensaje
func _ready():    
	actualizar_escena()
	ejercicioNum = ejercicioNum

func actualizar_escena():
	if GlobalVar.escenaRetroalimentacion == 0:
		$Panel/Mensaje/Aviso/MAviso.text = "¡Felicidades!"
		Mensaje.text = GlobalVar.mensajeRetroalimentacion
		$Panel/Recuardo.visible = true
		$Panel/Recuardo2.visible = false
		$Panel/Zorro.visible = true
		$Panel/Zorro/AnimationPlayer.play("Animacion")
		var anim = $Panel/Zorro
		anim.play("feliz")
		
	elif GlobalVar.escenaRetroalimentacion == 1:
		$Panel/Mensaje/Aviso/MAviso.text = "¡Inténtalo!"
		Mensaje.text = GlobalVar.mensajeRetroalimentacion
		$Panel/Recuardo.visible = false
		$Panel/Recuardo2.visible = true
		$Panel/Zorro.visible = true
		$Panel/Zorro/AnimationPlayer.play("Animacion")
		var anim = $Panel/Zorro
		anim.play("triste")

func _on_button_pressed():
	if GlobalVar.ejercicioTarjetas >=16:
		$Cargando.visible = true
		yield(get_tree().create_timer(0.5), "timeout")
	if GlobalVar.ejercicioTarjetas >= 7:
		get_tree().change_scene("res://escenas/regiones/region_3/scn_TarjetasReg3.tscn")
	else:
		get_tree().change_scene("res://escenas/regiones/region_3/memoramaReg3/principal.tscn")




