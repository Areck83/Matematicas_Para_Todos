#Este codigo está en desuso. 
# Se pretendía que en el funcionamiento inicial del drag and drop, se indicaran los espacios a los que tendrían que estar pegadas las escenas drag
# es decir, como en un tablero de cartón de imágenes, se tendrían que colocar los clavos (Points2D) donde colgar las imágenes (Escenas Drag). 
# Sin embargo, se ha cambiado todo por un modo de "Post-it" donde todo el funcionamiento reside en Drag. 
extends Node2D

var nodos_disponibles: Array = []

func _ready():
	nodos_disponibles = get_tree().get_nodes_in_group("zone")
	for espacio in nodos_disponibles:
		espacio.ocupado = false

func asignar_espacio_disponible(objeto):
	var espacio_asignado = encontrar_espacio_disponible(objeto.global_position)
	if espacio_asignado:
		objeto.punto_fijo = espacio_asignado.global_position
		espacio_asignado.ocupado = true
		espacio_asignado.select()
	
func encontrar_espacio_disponible(posicion_Objeto) -> Node:
	var mejor_distancia = INF
	var mejor_espacio = null
	for espacio in nodos_disponibles:
		if not espacio.ocupado:
			var distancia = espacio.global_position.distance_to(posicion_Objeto)
			if distancia < mejor_distancia:
				mejor_distancia = distancia
				mejor_espacio = espacio
	return mejor_espacio

