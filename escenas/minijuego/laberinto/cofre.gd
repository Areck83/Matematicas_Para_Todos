extends Node2D


onready var anim = $AnimatedSprite


func _on_Area2D_body_entered(body):
	anim.play("abrir")


func _on_Area2D_body_exited(body):
	anim.play("cerrar")
