extends KinematicBody2D

var pixeles_por_metro : int = 100
var direccion : Vector2
var velocidad : Vector2
var rapidez : float = 3 * pixeles_por_metro

onready var sprite = $AnimatedSprite
onready var anim = $AnimatedSprite
onready var col = $CollisionShape2D



func _ready():
	pass # Replace with function body.



func _input(event):
	cambiar_direccion()
	
func _physics_process(delta):
	movimiento()
	
func cambiar_direccion():
	direccion = Vector2.ZERO
	#direccion.x = Input.get_axis("ui_left","ui_right")
	#direccion.y = Input.get_axis("ui_up","ui_down")
	if Input.is_action_pressed("ui_left"):
		#col.rotation_degrees = -90
		#sprite.rotation_degrees = -90
		anim.play("izquierda")
		direccion.x += -1
		
	elif Input.is_action_pressed("ui_right"):
		#col.rotation_degrees = 90
		#sprite.rotation_degrees = 90
		sprite.flip_h = true
		anim.play("derecha")
		direccion.x += 1
	
	elif Input.is_action_pressed("ui_up"):
		#sprite.rotation_degrees = 0
		#col.rotation_degrees = 0
		anim.play("arriba")
		direccion.y += -1
	elif Input.is_action_pressed("ui_down"):
		#sprite.rotation_degrees = 180
		#col.rotation_degrees = 180
		anim.play("abajo")
		direccion.y += 1
	else:
		#sprite.rotation_degrees = 0
		#col.rotation_degrees = 0
		anim.play("idle")
	direccion = direccion.normalized()
func movimiento():
	velocidad.x = direccion.x * rapidez
	velocidad.y = direccion.y * rapidez
	
	velocidad = move_and_slide(velocidad)
