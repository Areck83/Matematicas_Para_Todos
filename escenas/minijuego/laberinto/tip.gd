tool

extends Area2D

export var width=50 setget set_width
export var height=50 setget set_height

onready var tween=get_node("Tween")
enum {IDLE,MOSTRANDO,ESCONDIENDO}
var accion = IDLE

signal mostrando
signal mostro
signal escondiendo
signal escondio

func _ready():
	if !Engine.is_editor_hint():
		get_node("globo").hide()
		
func _draw():
	get_node("globo").width = width
	get_node("globo").height = height
	
	
	
func _on_tip_body_entered(body):
	accion = MOSTRANDO
	tween.interpolate_method(self,"resize",0,1,0.5,Tween.TRANS_BOUNCE)
	tween.start()
	
func _on_tip_body_exited(body):
	get_node("Timer").start()
	
func resize(val):
	if val>.1:
		get_node("globo").show()
	else:
		get_node("globo").hide()
	get_node("globo").width = width*val
	get_node("globo").height=height*val
	print(val)
	
func set_width(val):
	width = val
	update()
	
func set_height(val):
	height = val
	update()
	

func _on_Timer_timeout():
	accion=ESCONDIENDO
	tween.interpolate_method(self,"resize",1,0,.5,Tween.TRANS_EXPO)
	tween.start()


func _on_Tween_tween_completed(object, key):
	if accion==ESCONDIENDO:
		emit_signal("escondio")
	elif accion==MOSTRANDO:
		emit_signal("mostro")
	self.accion=IDLE


func _on_Tween_tween_started(object, key):
	if accion==ESCONDIENDO:
		emit_signal("escondiendo")
	elif accion==MOSTRANDO:
		emit_signal("mostrando")
