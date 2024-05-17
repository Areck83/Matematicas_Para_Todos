extends Node2D

export var cantidad_cartas: int = 10

onready var cartaPrefab = preload("res://escenas/minijuego/memorama/scn_tarjeta.tscn")
onready var tiempo = $tiempo

#Objeto donde se guarda la carta que va a al descubierto
var carta_al_descubierto = null

#Guardar las cartas que deben de volver a darse vuelta (taparlas)
var cartas = []

#Cantidad de cartas a instanciar
var cantidad_actual = 0

func _ready():
	randomize()
	tiempo.connect("timeout", self, "tiempo_finalizado")
	$Label.text = str(cantidad_cartas) 
	pass

func _columnas_para_cartas(carta: int) -> int:
	match carta:
		2: return 2
		4: return 2
		6: return 3
		8: return 4
		10: return 4
		_: return 4

func init_game():
	cantidad_cartas = cantidad_actual * 2 #Para que cada uno tenga su par
	var columnas: int = _columnas_para_cartas(cantidad_cartas)
	var filas : int = ceil(float(cantidad_cartas) / float(columnas))
	#Calcular que tan ancho se deberian de renderizar las cartas (De acuerdo con la resolucion del proyecto)
	#Nota: Ver despues como hacer fullscreeen y que estas medidas no se vean afectadas
	#Proyecto -> Display -> Window -> Width 1920, Height 1080
	var ancho_fila : int = min( (1920-200) / columnas, (1080-200) / filas)
	var ancho_carta : int = floor(ancho_fila / 1.25)
	var fila_offset : int = (ancho_fila - ancho_carta)
	var margen_fila : int = (1920-(ancho_carta*columnas + fila_offset * (columnas - 1))) / 2
	var ultimo_margen_filas = 0
	
	if cantidad_cartas % columnas > 0:
		var ultima_fila_vacia = (columnas - (cantidad_cartas % columnas))
		ultimo_margen_filas = (ultima_fila_vacia * ancho_fila) / 2
	
	var numero : Array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	
	while numero.size() > cantidad_cartas / 2:
		#Una vez que se elige una carta se debe eliminar para que no se elija 2 veces la misma carta
		numero.remove(randi() % numero.size())
	
	var caras : Array = []
	for i in range(floor(cantidad_cartas/2)):
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
		var c = i%columnas
		var extra = 0
		if r == filas-1:
			extra = ultimo_margen_filas
		
		var carta = cartaPrefab.instance()
		carta.add_to_group("carta")
		carta.global_position = Vector2(margen_fila + c * ancho_fila + extra, 100 + r * ancho_fila)
		
		#ancho_carta/tamano de imagen de la carta en px
		carta.scale = Vector2(ancho_carta/100.0, ancho_carta / 100.0)
		self.add_child(carta)
		carta.poner_cara(caras[i])
		
		carta.connect("clicked", self, "_on_clicked_carta")
		carta.connect("volteada", self, "_on_card_flipped")

func _on_clicked_carta(carta):
	if !carta.esta_volteada:
		carta.flip()

func _on_card_flipped(carta):
	if carta.esta_volteada:
		if carta_al_descubierto == null: #Si este ya dio una vuelta significa que se esta dando vuelta a la segunda
			carta_al_descubierto = carta
		else:
			if carta_al_descubierto.cara == carta.cara:
				carta_al_descubierto = null
				#Comprobacion para saber si todas las cartas se dieron vuelta
				if _all_card_flipped():
					clear_game()
			#Si las dos cartas no coinciden
			else:
				cartas.append(carta_al_descubierto)
				cartas.append(carta)
				$tiempo.start()
				carta_al_descubierto = null

func tiempo_finalizado():
	while cartas.size():
		var car = cartas[0]
		cartas.remove(0)
		car.reset()


func clear_game():
	var cartass = _find_all_cards()
	while cartas.size() > 0:
		cartas[0].queue_free()
		cartas.remove(0)
	$btn_jugar.visible = true
	$Label.visible = true
	$cantidad.visible = true
	

func _all_card_flipped()->bool:
	for carta in _find_all_cards():
		if !carta.esta_volteada:
			return false
	
	return true

func _find_all_cards() -> Array:
	var res :Array = []
	var hijos = self.get_children() #Buscar todos los hijos instanciados del principal
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
	pass 

func _on_cantidad_value_changed(value):
	$Label.text = str(value)
