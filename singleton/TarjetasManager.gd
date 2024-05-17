extends Node


func ejercicioRegion3(numero_ejercicio, ejercicioT1, ejercicioT2):
	var ruta_tarjeta1 = ""
	var ruta_tarjeta2 = ""

	# Determinar las rutas de las tarjetas según el número de ejercicio
	match numero_ejercicio:
		1:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1A1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1A2.png"
		2:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1B1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1B2.png"
		3:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1C1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1C2.png"
		4:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/2A2.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/2A1.png"
		5:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/2B1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/2B2.png"
		6:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/2C1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/2C2.png"
		7:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/3A1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/3A2.png"
		8:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/3B1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/3B2.png"
		9:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/3C1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/3C2.png"
		10:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/4A1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/4A2.png"
		11:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/4B1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/4B2.png"
		12:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/4C1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/4C2.png"
		13:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/5A1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/5A2.png"
		14:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/5B1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/5B2.png"
		15:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/5C1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/5C2.png"

	var textura_tarjeta1 = load(ruta_tarjeta1)
	var textura_tarjeta2 = load(ruta_tarjeta2)
	

	# Asignar las texturas a los nodos correspondientes
	ejercicioT1.texture = textura_tarjeta1
	ejercicioT2.texture = textura_tarjeta2
