extends Control
export var escena: int 
export var ejercicioNum = 0
func _ready():    
	actualizar_escena()
	ejercicioNum = ejercicioNum

func actualizar_escena():
	print("el estatus es: ", escena)
	if escena == 0:
		$Panel/Mensaje/Aviso/MAviso.text = "¡Felicidades!"
		$Panel/Recuardo.visible = true
		$Panel/Recuardo2.visible = false
		$Panel/Zorro.visible = true
		$Panel/Zorro/AnimationPlayer.play("Animacion")
		var anim = $Panel/Zorro
		anim.play("feliz")
		
	elif escena == 1:
		$Panel/Mensaje/Aviso/MAviso.text = "¡Inténtalo!"
		$Panel/Recuardo.visible = false
		$Panel/Recuardo2.visible = true
		$Panel/Zorro.visible = true
		$Panel/Zorro/AnimationPlayer.play("Animacion")
		var anim = $Panel/Zorro
		anim.play("triste")

func _on_button_pressed():
	$Panel.visible = false

		


