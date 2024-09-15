extends Control

onready var board = $GameBoard

var images = [
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_1.png", "res://recursos/imagenes/reg3/TarjetasPeces/carta_2.png", 
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_2.png", "res://recursos/imagenes/reg3/TarjetasPeces/carta_3.png", 
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_3.png", "res://recursos/imagenes/reg3/TarjetasPeces/carta_4.png", 
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_5.png", "res://recursos/imagenes/reg3/TarjetasPeces/carta_6.png"
]

var match_pairs = {
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_1.png": "res://recursos/imagenes/reg3/TarjetasPeces/carta_2.png",
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_2.png": "res://recursos/imagenes/reg3/TarjetasPeces/carta_1.png",
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_3.png": "res://recursos/imagenes/reg3/TarjetasPeces/carta_4.png",
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_4.png": "res://recursos/imagenes/reg3/TarjetasPeces/carta_3.png",
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_5.png": "res://recursos/imagenes/reg3/TarjetasPeces/carta_6.png",
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_6.png": "res://recursos/imagenes/reg3/TarjetasPeces/carta_5.png"
}

var flipped_cards = []
var lock_board = false

# Ajusta el tamaño de las cartas y el espaciado
var card_size = Vector2(200, 200)  # Tamaño fijo de la carta (ajustable)
var spacing = 10  # Espaciado entre cartas (ajustable)

# Variables dinámicas para columnas y filas
var num_columns = 4  # Número de columnas ajustable
var num_rows = 0     # Se calculará en función del número de cartas
var total_cards = 0  # Total de cartas que se generarán

func _ready():
	images.shuffle()
	total_cards = images.size()

	# Calcular filas en función del total de cartas y columnas
	num_rows = ceil(float(total_cards) / num_columns)

	# Ajustar el tamaño del contenedor dinámicamente
	board.rect_min_size = Vector2(
		num_columns * (card_size.x + spacing),
		num_rows * (card_size.y + spacing)
	)
	
	# Crear las cartas en base a las imágenes barajadas
	for image in images:
		var card = create_card(image)
		board.add_child(card)

func create_card(image_path):
	var card = TextureButton.new()
	card.name = "Card"
	card.rect_min_size = card_size
	card.rect_size = card_size  # Fija el tamaño para evitar que cambie
	card.connect("pressed", self, "_on_Card_pressed", [card])

	# TextureRect para la imagen del frente
	var front = TextureRect.new()
	front.texture = load(image_path)
	front.name = "Front"
	front.rect_min_size = card_size
	front.rect_size = card_size  # Fija el tamaño para que no varíe
	front.visible = false  # El frente empieza oculto

	card.texture_normal = load("res://recursos/imagenes/reg3/TarjetasPeces/carta_cubierta.png")
	card.add_child(front)

	return card

func _on_Card_pressed(card):
	if lock_board:
		return
	if card in flipped_cards:
		return
	flip_card(card)

func flip_card(card):
	# Simplemente cambia la textura en lugar de jugar con visibilidad
	var front_texture = card.get_child(0).texture
	card.texture_normal = front_texture

	flipped_cards.append(card)

	if flipped_cards.size() == 2:
		check_for_match()

func check_for_match():
	if flipped_cards.size() != 2:
		return
	
	var card1 = flipped_cards[0]
	var card2 = flipped_cards[1]

	var texture1 = card1.texture_normal
	var texture2 = card2.texture_normal

	var is_match = match_pairs.get(texture1.resource_path, "") == texture2.resource_path

	if is_match:
		disable_cards()
	else:
		unflip_cards()

func disable_cards():
	for card in flipped_cards:
		card.disconnect("pressed", self, "_on_Card_pressed")
	reset_board()

func unflip_cards():
	lock_board = true
	yield(get_tree().create_timer(1.0), "timeout")
	for card in flipped_cards:
		card.texture_normal = load("res://recursos/imagenes/reg3/TarjetasPeces/carta_cubierta.png")  # Restaurar la textura trasera
	reset_board()

func reset_board():
	flipped_cards.clear()
	lock_board = false
