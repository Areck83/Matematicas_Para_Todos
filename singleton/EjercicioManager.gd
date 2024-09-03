extends Node


	# Determinar las rutas de las tarjetas según el número de ejercicio
func escenaEjercicioRegion3(numero_ejercicio, ejercicioT1, ejercicioT2):
	var ruta_tarjeta1 = ""
	var ruta_tarjeta2 = ""
	var dialogo = []
	var respuesta = false
	var mensaje_correcto = ""
	var mensaje_incorrecto = ""

	# Determinar las rutas de las tarjetas según el número de ejercicio
	match numero_ejercicio:
		1:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["HOLA","COMO ESTAS?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1A1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1A2.png"
		2:
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1B1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1B2.png"
		3:
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1C1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1C2.png"
		4:
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/2A1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/2A2.png"
		5:
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/2B1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/2B2.png"
		6:
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1F1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1F2.png"
		7:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1G1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1G2.png"
		8:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1H1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1H2.png"
		9:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1I1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1I2.png"
		10:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1J1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1J2.png"
		11:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1K1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1K2.png"
		12:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1L1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1L2.png"
		13:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1M1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1M2.png"
		14:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1N1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1N2.png"
		15:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1O1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1O2.png"
		16:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1P1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1P2.png"
		17:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1Q1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1Q2.png"
		18:
			ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1R1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg3/tarjetas/1R2.png"
		19:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["1.- En una finca de café, se ha observado que, si se siembran 1000 plantas de café, se obtienen 500 kg café. ¿Cuántos kilogramos de café se obtendrían si se siembran 2500 plantas de café?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta1.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta1.png"
		20:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["1.- En una finca de café, se ha observado que, si se siembran 1000 plantas de café, se obtienen 500 kg café. ¿Cuántos kilogramos de café se obtendrían si se siembran 2500 plantas de café?"]
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta2.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta2.png"
		21:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["1.- En una finca de café, se ha observado que, si se siembran 1000 plantas de café, se obtienen 500 kg café. ¿Cuántos kilogramos de café se obtendrían si se siembran 2500 plantas de café?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta3.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta3.png"
		22:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["2.- En una finca de café, se requieren 3 litros de agua por cada 5 plantas de café sembradas, para regarlas cuadamente. Si en la finca hay 2000 plantas de café, ¿cuántos litros de agua se necesitarán?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta4.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta4.png"
		23:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["2.- En una finca de café, se requieren 3 litros de agua por cada 5 plantas de café sembradas, para regarlas cuadamente. Si en la finca hay 2000 plantas de café, ¿cuántos litros de agua se necesitarán?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta5.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta5.png"
		24:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["2.- En una finca de café, se requieren 3 litros de agua por cada 5 plantas de café sembradas, para regarlas cuadamente. Si en la finca hay 2000 plantas de café, ¿cuántos litros de agua se necesitarán?"]
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta6.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta6.png"
		25:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["3.- En una finca de café, 2/8 de las plantas dan como fruto café caturra. Si sabe que hay 500 plantas de café, ¿Cuál es el porcentaje y el número de plantas que corresponden a este tipo de café?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta7.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta7.png"
		26:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["3.- En una finca de café, 2/8 de las plantas dan como fruto café caturra. Si sabe que hay 500 plantas de café, ¿Cuál es el porcentaje y el número de plantas que corresponden a este tipo de café?"]
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta8.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta8.png"
		27:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["3.- En una finca de café, 2/8 de las plantas dan como fruto café caturra. Si sabe que hay 500 plantas de café, ¿Cuál es el porcentaje y el número de plantas que corresponden a este tipo de café?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta9.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta9.png"
		28:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["4.- En una finca de café en Xalapa, se encontró que 2/10 de los días del año el café presenta una calidad regular o deficiente. Si hay 365 días en un año, ¿Qué porcentaje de días del año el café tiene una calidad regular o deficiente?"]
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta10.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta10.png"
		29:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["4.- En una finca de café en Xalapa, se encontró que 2/10 de los días del año el café presenta una calidad regular o deficiente. Si hay 365 días en un año, ¿Qué porcentaje de días del año el café tiene una calidad regular o deficiente?"]
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta11.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta11.png"
		30:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["4.- En una finca de café en Xalapa, se encontró que 2/10 de los días del año el café presenta una calidad regular o deficiente. Si hay 365 días en un año, ¿Qué porcentaje de días del año el café tiene una calidad regular o deficiente?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta12.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta12.png"
		31:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["5.-  Se ha detectado que, en un lote de café de la feria, hay 5 bolsas con café Arábigo, 3 bolsas con café Robusta y 2 bolsas con café caturra. Si se sabe que al menos una de las bolsas extraídas es de café arábigo ¿cuál es la probabilidad expresada en fracciones de obtener dos bolsas de café arábigo?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta13.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta13.png"
		32:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["5.-  Se ha detectado que, en un lote de café de la feria, hay 5 bolsas con café Arábigo, 3 bolsas con café Robusta y 2 bolsas con café caturra. Si se sabe que al menos una de las bolsas extraídas es de café arábigo ¿cuál es la probabilidad expresada en fracciones de obtener dos bolsas de café arábigo?"]
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta14.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta14.png"
		33:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["5.-  Se ha detectado que, en un lote de café de la feria, hay 5 bolsas con café Arábigo, 3 bolsas con café Robusta y 2 bolsas con café caturra. Si se sabe que al menos una de las bolsas extraídas es de café arábigo ¿cuál es la probabilidad expresada en fracciones de obtener dos bolsas de café arábigo?"]
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta15.png"
			ruta_tarjeta2 = "res://recursos/imagenes/reg2/tarjetas/tarjeta15.png"
		_:
			# Si el número de ejercicio no tiene una ruta asociada, puedes manejarlo aquí
			print("Número de ejercicio no válido")
			

	# Cargar las texturas de las tarjetas
	var textura_tarjeta1 = load(ruta_tarjeta1)
	var textura_tarjeta2 = load(ruta_tarjeta2)
	

	# Asignar las texturas a los nodos correspondientes
	ejercicioT1.texture = textura_tarjeta1
	ejercicioT2.texture = textura_tarjeta2
	# Empaqueta los valores en un diccionario
	var resultado = {"dialogo": dialogo, "respuesta": respuesta, "mensaje_correcto": mensaje_correcto, "mensaje_incorrecto": mensaje_incorrecto}
	# Devuelve el diccionario con los valores
	return resultado

func escenaEjercicioRegion2(numero_ejercicio, ejercicioT1):
	var ruta_tarjeta1 = ""
	var dialogo = []
	var respuesta = false
	var mensaje_correcto = ""
	var mensaje_incorrecto = ""

	# Determinar las rutas de las tarjetas según el número de ejercicio
	match numero_ejercicio:
		1:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "Para resolver un problema de proporcionalidad puedes aplicar la regla de tres, estableciendo relaciones entre las cantidades que se relacionan proporcionalmente"
			dialogo = ["En una finca de café, se ha observado que, si se siembran 1000 plantas de café, se obtienen 500 kg café. ¿Cuántos kilogramos de café se obtendrían si se siembran 2500 plantas de café?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta1.png"
		2:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "Para resolver un problema de proporcionalidad puedes aplicar la regla de tres, estableciendo relaciones entre las cantidades que se relacionan proporcionalmente"
			dialogo = ["En una finca de café, se ha observado que, si se siembran 1000 plantas de café, se obtienen 500 kg café. ¿Cuántos kilogramos de café se obtendrían si se siembran 2500 plantas de café?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta3.png"
		3:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "Para resolver un problema de porcentaje puedes utilizar la simplificación de fracciones y la multiplicación 100"
			dialogo = ["En una finca de café, 2/8 de las plantas dan como fruto café caturra. Si sabe que hay 500 plantas de café, ¿Cuál es el porcentaje y el número de plantas que corresponden a este tipo de café?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta7.png"
		4:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "Identificaste que el procedimiento sugerido se realiza de forma incorrecta al establecer las relaciones de proporción para calcular el porcentaje"
			dialogo = ["En una finca de café, 2/8 de las plantas dan como fruto café caturra. Si sabe que hay 500 plantas de café, ¿Cuál es el porcentaje y el número de plantas que corresponden a este tipo de café?"]
			respuesta = false
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta8.png"
		5:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "Identificaste que para resolver un problema de porcentaje puedes utilizar la simplificación de fracciones y la multiplicación por 100"
			dialogo = ["En una finca de café en Xalapa, se encontró que 2/10 de los días del año el café presenta una calidad regular o deficiente. Si hay 365 días en un año, ¿Qué porcentaje de días del año el café tiene una calidad regular o deficiente?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta12.png"
		6:
			mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
			mensaje_correcto = "EXCELENTE SIGUE ASI"
			dialogo = ["Se ha detectado que, en un lote de café de la feria, hay 5 bolsas con café Arábigo, 3 bolsas con café Robusta y 2 bolsas con café caturra. Si se sabe que al menos una de las bolsas extraídas es de café arábigo ¿cuál es la probabilidad expresada en fracciones de obtener dos bolsas de café arábigo?"]
			respuesta = true
			ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta13.png"
		#7:
		#	mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
		#	mensaje_correcto = "EXCELENTE SIGUE ASI"
		#	dialogo = ["3.- En una finca de café, 2/8 de las plantas dan como fruto café caturra. Si sabe que hay 500 plantas de café, ¿Cuál es el porcentaje y el número de plantas que corresponden a este tipo de café?"]
		#	respuesta = true
		#	ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta7.png"
		#8:
		#	mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
		#	mensaje_correcto = "EXCELENTE SIGUE ASI"
		#	dialogo = ["3.- En una finca de café, 2/8 de las plantas dan como fruto café caturra. Si sabe que hay 500 plantas de café, ¿Cuál es el porcentaje y el número de plantas que corresponden a este tipo de café?"]
		#	respuesta = false
		#	ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta8.png"
		#9:
		#	mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
		#	mensaje_correcto = "EXCELENTE SIGUE ASI"
		#	dialogo = ["3.- En una finca de café, 2/8 de las plantas dan como fruto café caturra. Si sabe que hay 500 plantas de café, ¿Cuál es el porcentaje y el número de plantas que corresponden a este tipo de café?"]
		#	respuesta = true
		#	ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta9.png"
		#10:
		#	mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
		#	mensaje_correcto = "EXCELENTE SIGUE ASI"
		#	dialogo = ["4.- En una finca de café en Xalapa, se encontró que 2/10 de los días del año el café presenta una calidad regular o deficiente. Si hay 365 días en un año, ¿Qué porcentaje de días del año el café tiene una calidad regular o deficiente?"]
		#	respuesta = false
		#	ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta10.png"
		#11:
		#	mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
		#	mensaje_correcto = "EXCELENTE SIGUE ASI"
		#	dialogo = ["4.- En una finca de café en Xalapa, se encontró que 2/10 de los días del año el café presenta una calidad regular o deficiente. Si hay 365 días en un año, ¿Qué porcentaje de días del año el café tiene una calidad regular o deficiente?"]
		#	respuesta = false
		#	ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta11.png"
		#12:
		#	mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
		#	mensaje_correcto = "EXCELENTE SIGUE ASI"
		#	dialogo = ["4.- En una finca de café en Xalapa, se encontró que 2/10 de los días del año el café presenta una calidad regular o deficiente. Si hay 365 días en un año, ¿Qué porcentaje de días del año el café tiene una calidad regular o deficiente?"]
		#	respuesta = true
		#	ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta12.png"
		#13:
		#	mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
		#	mensaje_correcto = "EXCELENTE SIGUE ASI"
		#	dialogo = ["5.-  Se ha detectado que, en un lote de café de la feria, hay 5 bolsas con café Arábigo, 3 bolsas con café Robusta y 2 bolsas con café caturra. Si se sabe que al menos una de las bolsas extraídas es de café arábigo ¿cuál es la probabilidad expresada en fracciones de obtener dos bolsas de café arábigo?"]
		#	respuesta = true
		#	ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta13.png"
		#14:
		#	mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
		#	mensaje_correcto = "EXCELENTE SIGUE ASI"
		#	dialogo = ["5.-  Se ha detectado que, en un lote de café de la feria, hay 5 bolsas con café Arábigo, 3 bolsas con café Robusta y 2 bolsas con café caturra. Si se sabe que al menos una de las bolsas extraídas es de café arábigo ¿cuál es la probabilidad expresada en fracciones de obtener dos bolsas de café arábigo?"]
		#	respuesta = false
		#	ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta14.png"
		#15:
		#	mensaje_incorrecto = "VAMOS PUEDES HACERLO MEJOR"
		#	mensaje_correcto = "EXCELENTE SIGUE ASI"
		#	dialogo = ["5.-  Se ha detectado que, en un lote de café de la feria, hay 5 bolsas con café Arábigo, 3 bolsas con café Robusta y 2 bolsas con café caturra. Si se sabe que al menos una de las bolsas extraídas es de café arábigo ¿cuál es la probabilidad expresada en fracciones de obtener dos bolsas de café arábigo?"]
		#	respuesta = false
		#	ruta_tarjeta1 = "res://recursos/imagenes/reg2/tarjetas/tarjeta15.png"
		_:
			# Si el número de ejercicio no tiene una ruta asociada, puedes manejarlo aquí
			print("Número de ejercicio no válido")
			

	# Cargar las texturas de las tarjetas
	var textura_tarjeta1 = load(ruta_tarjeta1)
	

	# Asignar las texturas a los nodos correspondientes
	ejercicioT1.texture = textura_tarjeta1
	# Empaqueta los valores en un diccionario
	var resultado = {"dialogo": dialogo, "respuesta": respuesta, "mensaje_correcto": mensaje_correcto, "mensaje_incorrecto": mensaje_incorrecto}
	# Devuelve el diccionario con los valores
	return resultado
