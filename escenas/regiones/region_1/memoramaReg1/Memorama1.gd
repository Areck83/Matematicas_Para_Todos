extends Control

onready var board = $GameBoard

# Lista de 10 imágenes
var images = [
	"res://recursos/imagenes/reg1/tarjetas/carta_1.png", "res://recursos/imagenes/reg1/tarjetas/carta_2.png", 
	"res://recursos/imagenes/reg1/tarjetas/carta_3.png", "res://recursos/imagenes/reg1/tarjetas/carta_4.png", 
	"res://recursos/imagenes/reg1/tarjetas/carta_5.png", "res://recursos/imagenes/reg1/tarjetas/carta_6.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_7.png", "res://recursos/imagenes/reg1/tarjetas/carta_8.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_9.png", "res://recursos/imagenes/reg1/tarjetas/carta_10.png"
]

# Definir los pares de cartas según tu nuevo emparejamiento
var match_pairs = {
	"res://recursos/imagenes/reg1/tarjetas/carta_1.png": "res://recursos/imagenes/reg1/tarjetas/carta_9.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_9.png": "res://recursos/imagenes/reg1/tarjetas/carta_1.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_2.png": "res://recursos/imagenes/reg1/tarjetas/carta_7.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_7.png": "res://recursos/imagenes/reg1/tarjetas/carta_2.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_3.png": "res://recursos/imagenes/reg1/tarjetas/carta_10.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_10.png": "res://recursos/imagenes/reg1/tarjetas/carta_3.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_4.png": "res://recursos/imagenes/reg1/tarjetas/carta_8.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_8.png": "res://recursos/imagenes/reg1/tarjetas/carta_4.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_5.png": "res://recursos/imagenes/reg1/tarjetas/carta_6.png",
	"res://recursos/imagenes/reg1/tarjetas/carta_6.png": "res://recursos/imagenes/reg1/tarjetas/carta_5.png"
}

var flipped_cards = []
var lock_board = false

# Variables dinámicas para columnas y filas
var num_columns = 5  # Ahora con 5 columnas
var num_rows = 2     # Se calculan 2 filas para un total de 10 cartas
var total_cards = 0  # Total de cartas que se generarán
var card_size = Vector2()  # Tamaño dinámico de las cartas
var spacing = 10  # Espaciado horizontal entre cartas
var vertical_spacing = 20  # Espaciado vertical entre filas (más grande que el horizontal)

var match_count = 0  # Lleva el conteo de las coincidencias

func _ready():
	images.shuffle()
	total_cards = images.size()

	# Obtener tamaño de la ventana
	var screen_size = OS.window_size
	# Calcular el tamaño máximo para las cartas, considerando el espaciado entre ellas
	card_size.x = (screen_size.x - (num_columns + 1) * spacing) / num_columns  # Ajustar a 5 columnas
	card_size.y = (screen_size.y - (num_rows + 1) * vertical_spacing) / num_rows  # Ajustar a 2 filas, con espaciado vertical mayor

	# Ajustar el tamaño del contenedor dinámicamente
	board.rect_min_size = Vector2(
		num_columns * (card_size.x + spacing),  # Espaciado horizontal de 10 entre las cartas
		num_rows * (card_size.y + vertical_spacing)  # Espaciado vertical entre filas
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

	card.texture_normal = load("res://recursos/imagenes/reg1/tarjetas/carta_cubierta.png")
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

	match_count += 1  # Incrementar el conteo de matches

	reset_board()

	# Verificar si se han hecho todas las coincidencias
	if match_count == total_cards / 2:  # Porque cada pareja cuenta como un match
		change_scene()  # Cambiar de escena

func unflip_cards():
	lock_board = true
	yield(get_tree().create_timer(1.0), "timeout")
	for card in flipped_cards:
		card.texture_normal = load("res://recursos/imagenes/reg1/tarjetas/carta_cubierta.png")  # Restaurar la textura trasera
	reset_board()

func reset_board():
	flipped_cards.clear()
	lock_board = false

func change_scene():
	Song1.stop()
	Inicio.play()
	GlobalVar.reg1_escena1 = false
	GlobalVar.reg1_escena2 = false
	GlobalVar.reg1_escena3 = false
	GlobalVar.reg1_escena4 = false
	yield(get_tree().create_timer(1.5), "timeout")
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")  # Cambia la escena
