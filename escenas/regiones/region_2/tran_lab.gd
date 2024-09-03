extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var anim = $BkdCapitalDim/Zorro/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("arb")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
