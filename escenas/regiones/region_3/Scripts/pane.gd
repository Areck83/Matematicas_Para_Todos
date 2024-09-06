extends Panel

var cards = []  # Lista para almacenar todos los nodos de las cartas
var cardback
var back_texture

var first_card = null
var second_card = null

func _ready():
	# Obtener todos los nodos de las cartas
	for i in range(1, 7):
		var card_node = $["card" + str(i)]
		cards.append(card_node)
		var pair_card_node = $["card" + str(i) + "-" + str(i)]
		cards.append(pair_card_node)
	
	cardback = $cardBack
	back_texture = preload("res://recursos/imagenes/icon_Main.png")
	assign_cardback()

	# Asignar las funciones de presionado a todas las cartas
	for card in cards:
		card.connect("pressed", self, "reveal_card", [card])

func assign_cardback():
	for card in cards:
		card.normal = back_texture

func reveal_card(card):
	var card_number = int(card.name.get_slice("/", -1).substr(5, 1))
	
	if first_card == null:
		first_card = card
		var card_texture = load("res://recursos/imagenes/reg3/TarjetasPeces/carta_" + str(card_number) + ".png")
		card.normal = card_texture
	elif second_card == null and first_card != card:
		second_card = card
		card_number = int(card.name.get_slice("/", -1).substr(5, 1))
		var card_texture = load("res://recursos/imagenes/reg3/TarjetasPeces/carta_" + str(card_number) + ".png")
		card.normal = card_texture
		
		if first_card.name.substr(4, 1) == card.name.substr(4, 1): # Verificar si es el par correcto
			first_card = null
			second_card = null
		else:
			yield(get_tree().create_timer(1.0), "timeout")
			first_card.normal = back_texture
			second_card.normal = back_texture
			first_card = null
			second_card = null
