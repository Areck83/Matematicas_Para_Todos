extends Control

# Referencia al contenedor donde se colocarán las cartas
onready var board = $GameBoard

# Lista de imágenes para las cartas
var images = [
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_1.png", "res://recursos/imagenes/reg3/TarjetasPeces/carta_1.png", 
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_2.png", "res://recursos/imagenes/reg3/TarjetasPeces/carta_2.png", 
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_3.png", "res://recursos/imagenes/reg3/TarjetasPeces/carta_3.png",
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_4.png", "res://recursos/imagenes/reg3/TarjetasPeces/carta_4.png", 
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_5.png", "res://recursos/imagenes/reg3/TarjetasPeces/carta_5.png", 
	"res://recursos/imagenes/reg3/TarjetasPeces/carta_6.png", "res://recursos/imagenes/reg3/TarjetasPeces/carta_6.png"
]

# Variables para el control del estado del juego
var flipped_cards = []
var lock_board = false

# Tamaño de las cartas
var card_size = Vector2(500, 500)
# Espaciado entre cartas
var spacing = 10

func _ready():
	# Barajar las imágenes
	images.shuffle()

	# Ajustar el tamaño del GridContainer
	board.rect_min_size = Vector2(
		4 * (card_size.x + spacing),  # 4 columnas
		3 * (card_size.y + spacing)   # 3 filas
	)

	# Crear las cartas
	for image in images:
		var card = create_card(image)
		board.add_child(card)
	
	# Depuración
	print("Total cards added: ", board.get_child_count())

# Función para crear una carta
func create_card(image_path):
	var card = TextureButton.new()
	card.name = "Card"
	card.rect_min_size = card_size
	card.connect("pressed", self, "_on_Card_pressed", [card])
	
	# Asegúrate de que el evento se conecta correctamente
	print("Connecting input to card: ", card.name)

	# Front
	var front = TextureRect.new()
	front.texture = load(image_path)
	front.name = "Front"
	front.rect_min_size = card_size
	front.visible = false

	# Back
	card.texture_normal = load("res://recursos/imagenes/reg3/TarjetasPeces/carta_cubierta.png")
	card.add_child(front)

	return card


# Función que se llama cuando se hace clic en una carta
func _on_Card_pressed(card):
	print("Card clicked: ", card.name)  # Verifica si el clic se está detectando
	if lock_board:
		return
	if card in flipped_cards:
		return
	flip_card(card)


# Función para voltear una carta
func flip_card(card):
	card.get_child(0).visible = true
	card.texture_normal = null  # Quita la textura del reverso

	flipped_cards.append(card)

	if flipped_cards.size() == 2:
		print("Two cards flipped: ", flipped_cards[0].name, ", ", flipped_cards[1].name)  # Depuración
		check_for_match()

# Función para verificar si las cartas coinciden
func check_for_match():
	if flipped_cards.size() != 2:
		return
	
	var card1 = flipped_cards[0]
	var card2 = flipped_cards[1]
	var is_match = card1.get_child(0).texture == card2.get_child(0).texture

	if is_match:
		print("Match found!")
		disable_cards()
	else:
		print("No match!")
		unflip_cards()

# Deshabilitar las cartas si coinciden
func disable_cards():
	for card in flipped_cards:
		card.disconnect("pressed", self, "_on_Card_pressed")
	reset_board()
	change_scene() # Cambiar de escena después de encontrar un match

# Desvoltear las cartas si no coinciden
func unflip_cards():
	lock_board = true
	yield(get_tree().create_timer(1.0), "timeout")
	for card in flipped_cards:
		card.get_child(0).visible = false
		card.texture_normal = load("res://recursos/imagenes/reg3/TarjetasPeces/carta_cubierta.png")
	reset_board()

# Restablecer el estado del tablero
func reset_board():
	flipped_cards.clear()
	lock_board = false
	
func change_scene():
	var new_scene_path = "res://escenas/regiones/region_3/scn_TarjetasReg3.tscn"
	var log_file = File.new()
	var log_path = "user://game_log.txt"
	
	log_file.open(log_path, File.WRITE)
	log_file.store_line("Intentando cambiar de escena a: " + new_scene_path)
	
	var error = get_tree().change_scene(new_scene_path)
	if error != OK:
		log_file.store_line("Error al cambiar de escena: " + str(error))
	else:
		log_file.store_line("Escena cambiada con éxito.")
	
	log_file.close()
