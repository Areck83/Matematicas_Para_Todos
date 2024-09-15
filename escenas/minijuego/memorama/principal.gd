extends Node2D

export var cantidad_cartas: int = 6
onready var cartaPrefab = preload("res://escenas/minijuego/memorama/scn_tarjeta.tscn")
onready var tiempo = $tiempo

# Objeto donde se guarda la carta que va a al descubierto
var carta_al_descubierto = GlobalVar.carta_al_descubierto

# Guardar las cartas que deben de volver a darse vuelta (taparlas)
var cartas = GlobalVar.cartas

# Cantidad de cartas a instanciar
var cantidad_actual = GlobalVar.cantidad_actualCartas

func _ready():
	randomize()
	tiempo.connect("timeout", self, "tiempo_finalizado")
	$Label.text = str(cantidad_cartas)
	cantidad_actual = $cantidad.value
	$btn_jugar.visible = false
	$cantidad.visible = false
	$Label.visible = false

	if GlobalVar.cartas.size() > 0:
		# Solo inicializa el juego si hay cartas descubiertas
		init_game()
		# Verificar aquí si todas las cartas están emparejadas correctamente
		if _all_card_flipped():
			yield(get_tree().create_timer(0.5), "timeout")  # Añadir un pequeño retraso
			# Cambio de escena removido
			# get_tree().change_scene("res://escenas/regiones/region_3/scn_TarjetasReg3.tscn")
			return
	else:
		$btn_jugar.visible = true  # Muestra el botón de iniciar si no hay cartas descubiertas

func _columnas_para_cartas(carta: int) -> int:
	match carta:
		2: return 2
		4: return 2
		6: return 3
		8: return 4
		10: return 4
		_: return 4

func init_game():
	cantidad_cartas = cantidad_actual * 2 # Para que cada uno tenga su par
	var columnas: int = _columnas_para_cartas(cantidad_cartas)
	var filas : int = ceil(float(cantidad_cartas) / float(columnas))

	var ancho_fila : int = min((1920 - 200) / columnas, (1080 - 200) / filas)
	var ancho_carta : int = floor(ancho_fila / 0.90)
	var margen_fila : int = (1920 - (ancho_carta * columnas)) / 2
	var ultimo_margen_filas = 0
	
	if cantidad_cartas % columnas > 0:
		var ultima_fila_vacia = (columnas - (cantidad_cartas % columnas))
		ultimo_margen_filas = (ultima_fila_vacia * ancho_fila) / 2
	
	var numero : Array = [1, 2, 3, 4, 5, 6]
	while numero.size() > cantidad_cartas / 2:
		numero.remove(randi() % numero.size())
	
	var caras : Array = []
	for i in range(floor(cantidad_cartas / 2)):
		var cara : String = "carta_" + str(numero[i])
		caras.append(cara)
		caras.append(cara)

	var f2: Array = []
	while caras.size():
		if f2.size() == 0:
			f2.append(caras[0])
		else:
			f2.insert(randi() % (f2.size() + 1), caras[0])
		caras.remove(0)
	caras = f2
	
	for i in range(cantidad_cartas):
		var r = floor(i / columnas)
		var c = i % columnas
		var extra = 0
		if r == filas - 1:
			extra = ultimo_margen_filas
		
		var carta = cartaPrefab.instance()
		carta.add_to_group("carta")
		carta.global_position = Vector2(margen_fila + c * ancho_fila + extra, 100 + r * ancho_fila)
		
		carta.scale = Vector2(ancho_carta / 100.0, ancho_carta / 100.0)
		self.add_child(carta)
		carta.poner_cara(caras[i])

		# Verificar si la carta ya estaba descubierta
		if cartas.has(carta.cara): # Usar lógica para verificar si la carta ya fue descubierta
			carta.mostrar() # Mostrar la carta si ya fue descubierta

		carta.connect("clicked", self, "_on_clicked_carta")
		carta.connect("volteada", self, "_on_card_flipped")

func _on_clicked_carta(carta):
	if !carta.esta_volteada:
		carta.flip()

func _on_card_flipped(carta):
	if carta.esta_volteada:
		if carta_al_descubierto == null:  # Primera carta volteada
			carta_al_descubierto = carta
		else:  # Segunda carta volteada
			if carta_al_descubierto.cara == carta.cara:  # Las cartas coinciden
				# Agregar las cartas encontradas sin reemplazar
				GlobalVar.cartas.append(carta_al_descubierto.cara)
				GlobalVar.cartas.append(carta.cara)
				print("ESTO CONTIENE CARTAS:", GlobalVar.cartas)
				
				carta_al_descubierto = null  # Limpiar la variable
				yield(get_tree().create_timer(0.5), "timeout")
				# Cambio de escena removido
				# get_tree().change_scene("res://escenas/regiones/region_3/scn_TarjetasReg3.tscn")
			else:  # Las cartas no coinciden
				# Voltear de nuevo ambas cartas después de un breve tiempo
				yield(get_tree().create_timer(0.5), "timeout")
				if carta != null and carta.has_method("reset"):
					carta.reset()  # Voltear la segunda carta
				if carta_al_descubierto != null and carta_al_descubierto.has_method("reset"):
					carta_al_descubierto.reset()  # Voltear la primera carta
				carta_al_descubierto = null  # Limpiar la variable

func tiempo_finalizado():
	while cartas.size() > 0:
		var car = cartas[0]
		cartas.remove(0)
		if car is Carta:  # Asegúrate de que 'Carta' sea el nombre de tu script
			car.reset()

func clear_game():
	var cartass = _find_all_cards()
	while cartas.size() > 0:
		cartas[0].queue_free()
		cartas.remove(0)
	$btn_jugar.visible = true
	$Label.visible = true
	$cantidad.visible = true
	
func _all_card_flipped() -> bool:
	for carta in _find_all_cards():
		if !carta.esta_volteada or !GlobalVar.cartas.has(carta.cara):
			return false
	return true

func _find_all_cards() -> Array:
	var res :Array = []
	var hijos = self.get_children() # Buscar todos los hijos instanciados del principal
	for hijo in hijos:
		if hijo.is_in_group("carta"):
			res.append(hijo)
	return res

func _on_btn_jugar_pressed():
	cantidad_actual = $cantidad.value
	$btn_jugar.visible = false
	$cantidad.visible = false
	$Label.visible = false
	init_game()

func _on_cantidad_value_changed(value):
	$Label.text = str(value)
