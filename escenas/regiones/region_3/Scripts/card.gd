extends TouchScreenButton

var is_flipped = false
var is_matched = false
var front_texture
var back_texture
var card_id
var texture

func _ready():
	# Asignar la textura trasera
	back_texture = preload("res://recursos/imagenes/icon_Main.png")
	# Suponer que front_texture ya está asignada en el inspector
	texture = back_texture
	connect("pressed", self, "_on_Card_pressed")

func _on_Card_pressed():
	if not is_flipped and not is_matched:
		flip_card()

func flip_card():
	if is_flipped:
		texture = back_texture
	else:
		texture = front_texture
	is_flipped = !is_flipped

func match():
	is_matched = true
