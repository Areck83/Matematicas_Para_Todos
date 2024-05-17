extends Node2D
var garbanzo = false
var nixt: String
var zamab : Vector2
export (String) var dpt: String
export (String) var dst: String
export (Texture) var saus: Texture
export (String) var dtp: String
export (String) var dts: String

func _ready():
	set_process(true)
	set_physics_process(true)
	
	if saus:
		$i.texture = saus
	else:
		print ("no sau")
	
	if dtp:
		$i/Area2D.add_to_group(dtp)
	else:
		print("no stp")
	
	zamab = global_position
	var nix = get_node("i/Area2D")
	if nix:
		nix.connect("input_event", self, "_on_Area2D_input_event")
	else:
		print("Bruh momento")
pass

func _neoyap():
	if garbanzo:
		print("Ok")
	pass

func _physics_process(delta):
	if garbanzo:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
	else:
		global_position = lerp(global_position, zamab, 10*delta)
pass

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch:
		var tta = event as InputEventScreenTouch
		if tta.pressed:
			garbanzo = true
		elif not tta.is_pressed():
			garbanzo = false
pass

func _on_Area2D_area_entered(sus):
	if sus.name==dst:
		self.queue_free()
		SignalManager.emit_signal("dreex")
pass
