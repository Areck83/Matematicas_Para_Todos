extends Node
#Datos del Formulario
var regionesVeracruz = [	
	"Región Huasteca Alta",
	"Region Huasteca Baja",
	"Region Totonaca",
	"Region Nautla",
	"Región Capital",
	"Region las Montañas",
	"Region Sotavento",
	"Región Papaloapan",
	"Región Tuxtla",
	"Region Olmeca"
	]
var municipiosPorRegion = {	
	0: ["Chamal","Chiconamel", "Chinampa de Gorostiza", "El Higo", "Naranjos Amatlán", "Ozuluama de Mascareñas", "Pánuco", "Platón Sánchez", "Pueblo Viejo", "Tamalín", "Tamiahua", "Tampico Alto", "Tantima", "Tantoyuca", "Tempoal"],
	1: ["Álamo Temapache", "Benito Juárez **", "Castillo de Teayo", "Cerro Azul", "Chicontepec", "Chontla", "Citlaltépetl", "Huayacocotla", "Ilamatlán", "Ixcatepec", "Ixhuatlán de Madero", "Tancoco", "Tepetzintla", "Texcatepec", "Tlachichilco", "Tuxpan", "Zacualpan", "Zontecomatlán de López y Fuentes "],
	2: ["Cazones de Herrera", "Chumatlán", "Coahuitlán", "Coatzintla", "Coxquihui", "Coyutla", "Espinal", "Filomeno Mata", "Gutiérrez Zamora", "Mecatlán", "Papantla", "Poza Rica de Hidalgo", "Tecolutla", "Tihuatlán", "Zozocolco de Hidalgo"],
	3: ["Atzalan", "Colipa", "Juchique de Ferrer", "Martínez de la Torre", "Misantla", "Nautla", "San Rafael", "Tenochtitlán", "Tlapacoyan", "Vega de Alatorre", "Yecuatla"],
	4: ["Acajete", "Acatlán", "Actopan", "Alto Lucero de Gutiérrez Barrios", "Altotonga", "Apazapan", "Ayahualulco", "Banderilla", "Chiconquiaco", "Coacoatzintla", "Coatepec", "Cosautlán de Carvajal", "Emiliano Zapata", "Ixhuacán de los Reyes", "Jalacingo", "Jalcomulco", "Jilotepec", "Landero y Coss", "Las Minas", "Las Vigas de Ramírez", "Miahuatlán", "Naolinco", "Perote", "Rafael Lucio","Xalapa", "Xico"],
	5: ["Acultzingo", "Alpatláhuac", "Amatlán de los Reyes", "Aquila", "Astacinga", "Atlahuilco", "Atoyac", "Atzacan", "Calcahualco", "Camarón de Tejeda", "Camerino Z. Mendoza", "Córdoba", "Coscomatepec", "Los Reyes", "Magdalena", "Maltrata",  "Omealca", "Orizaba", "Paso del Macho", "Rafael Delgado", "Río Blanco", "San Andrés Tenejapan", "Tequila", "Boca del Río", "Veracruz"],
	#4: ["Acajete", "Acatlán", "Actopan", "Alto Lucero de Gutiérrez Barrios", "Altotonga", "Apazapan", "Ayahualulco", "Banderilla", "Chiconquiaco", "Coacoatzintla", "Coatepec", "Cosautlán de Carvajal", "Emiliano Zapata", "Ixhuacán de los Reyes", "Jalacingo", "Jalcomulco", "Jilotepec", "Landero y Coss", "Las Minas", "Las Vigas de Ramírez", "Miahuatlán", "Naolinco", "Perote", "Rafael Lucio", "Tatatila", "Teocelo", "Tepetlán", "Tlacolulan", "Tlalnelhuayocan", "Tonayán", "Villa Aldama", "Xalapa", "Xico"],
	#5: ["Acultzingo", "Alpatláhuac", "Amatlán de los Reyes", "Aquila", "Astacinga", "Atlahuilco", "Atoyac", "Atzacan", "Calcahualco", "Camarón de Tejeda", "Camerino Z. Mendoza", "Carrillo Puerto", "Chocamán", "Coetzala", "Comapa", "Córdoba", "Coscomatepec", "Cuichapa", "Cuitláhuac", "Fortín", "Huatusco", "Huiloapan de Cuauhtémoc", "Ixhuatlán del Café", "Ixhuatlancillo", "Ixtaczoquitlán", "La Perla", "Los Reyes", "Magdalena", "Maltrata", "Mariano Escobedo", "Mixtla de Altamirano", "Naranjal", "Nogales", "Omealca", "Orizaba", "Paso del Macho", "Rafael Delgado", "Río Blanco", "San Andrés Tenejapan", "Sochiapa", "Soledad Atzompa", "Tehuipango", "Tenampa", "Tepatlaxco", "Tequila", "Texhuacán", "Tezonapa", "Tlacotepec de Mejía", "Tlaltetela", "Tlaquilpa", "Tlilapan", "Tomatlán", "Totutla", "Xoxocotla", "Yanga", "Zentla", "Zongolica", "Boca del Río", "Cotaxtla", "Jamapa", "La Antigua", "Manlio Fabio Altamirano", "Medellín", "Paso de Ovejas", "Puente Nacional", "Soledad de Doblado", "Tlalixcoyan", "Úrsulo Galván", "Veracruz"],
	6: ["Boca del Río", "Cotaxtla", "Jamapa", "La Antigua", "Manlio Fabio Altamirano", "Medellín", "Paso de Ovejas", "Puente Nacional", "Soledad de Doblado", "Tlalixcoyan", "Úrsulo Galván", "Veracruz"],
	7: ["Acula", "Alvarado", "Amatitlán", "Ángel R. Cabada", "Carlos A. Carrillo", "Chacaltianguis", "Cosamaloapan de Carpio", "Ignacio de la Llave", "Isla", "Ixmatlahuacan", "José Azueta", "Juan Rodríguez Clara", "Lerdo de Tejada", "Otatitlán", "Playa Vicente", "Saltabarranca", "Santiago Sochiapan", "Tierra Blanca", "Tlacojalpan", "Tlacotalpan", "Tres Valles", "Tuxtilla"],
	8: ["Catemaco", "Hueyapan de Ocampo", "San Andrés Tuxtla", "Santiago Tuxtla"],
	9: ["Acayucan", "Agua Dulce", "Chinameca", "Coatzacoalcos", "Cosoleacaque", "Hidalgotitlán", "Ixhuatlán del Sureste", "Jáltipan", "Jesús Carranza", "Las Choapas", "Mecayapan", "Minatitlán", "Moloacán", "Nanchital de Lázaro Cárdenas del Río", "Oluta", "Oteapan", "Pajapan", "San Juan Evangelista", "Sayula de Alemán", "Soconusco", "Soteapan", "Tatahuicapan de Juárez", "Texistepec", "Uxpanapa", "Zaragoza"]
	}

func EjercicioRegion3(numero_ejercicio):
	var dialogo = []
	var respuesta = false
	var mensaje_correcto = ""
	var mensaje_incorrecto = ""
	var ejercicio = ""

	# Determinar las rutas de las tarjetas según el número de ejercicio
	match numero_ejercicio:
		1:
			ejercicio = "Ejercicio 1.1"
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "
			mensaje_correcto = "Lograste identificar que para resolver una multiplicación de fracciones con un numero natural debes convertir el número natural a fracción, y escribir el número natural como numerador y su posicional (1) como denominador"
			dialogo = ["En el puesto de mariscos de Doña Josefina, se organizan rejas con bolsas de camarón para su venta, cada una contiene 1 kg, del producto, en cada reja se acomodan 12 bolsas uno de los clientes...",
			"le pide solamente 5/6 del total de una reja ¿Cuántas bolsas de camarón le debe vender?"]
			respuesta = true
			
		2:
			ejercicio = "Ejercicio 1.2"
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "
			mensaje_correcto = "Lograste identificar que para resolver una multiplicación de fracciones puedes realizarlo con una representación gráfica."
			dialogo = ["En el puesto de mariscos de Doña Josefina, se organizan rejas con bolsas de camarón para su venta, cada una contiene 1 kg, del producto, en cada reja se acomodan 12 bolsas uno de los clientes...",
			"le pide solamente 5/6 del total de una reja ¿Cuántas bolsas de camarón le debe vender?"]
			respuesta = true

		3:
			ejercicio = "Ejercicio 1.3"
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "
			mensaje_correcto = "En este ejercicio identificaste el error al marcar como solución una multiplicación con números naturales sin que ésta represente al planteamiento inicial."
			dialogo = ["En el puesto de mariscos de Doña Josefina, se organizan rejas con bolsas de camarón para su venta, cada una contiene 1 kg, del producto, en cada reja se acomodan 12 bolsas uno de los clientes...",
			"le pide solamente 5/6 del total de una reja ¿Cuántas bolsas de camarón le debe vender?"]
			respuesta = false

		4:
			ejercicio = "Ejercicio 2.1"
			respuesta = true
			dialogo = ["Los pescadores de un pueblo del sotavento obtuvieron 1/2 de tonelada de pescado un lunes. De ese total, 5/6 fue apto...",
			"¿Qué fracción de la media tonelada representa la producción en venta?."]
			mensaje_correcto = "Lograste identificar que la multiplicación de fracciones se resuelve correctamente multiplicando numerador por numerador y denominador por denominador de ambas fracciones."
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		5:
			ejercicio = "Ejercicio 2.2"
			respuesta = true
			dialogo = ["Los pescadores de un pueblo del sotavento obtuvieron 1/2 de tonelada de pescado un lunes. De ese total, 5/6 fue apto para la venta...",
			"¿Qué fracción de la media tonelada representa la producción en venta?."]
			mensaje_correcto = "Lograste identificar que la multiplicación de fracciones se resuelve correctamente multiplicando numerador por numerador y denominador por denominador de ambas fracciones."
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		6:
			ejercicio = "Ejercicio 2.3"
			respuesta = false
			dialogo = ["Los pescadores de un pueblo del sotavento obtuvieron 1/2 de tonelada de pescado un lunes. De ese total, 5/6 fue apto para la venta...",
			"¿Qué fracción de la media tonelada representa la producción en venta?."]
			mensaje_correcto = "Este ejercicio marca el error al realizar el desarrollo de una multiplicación de fracción de forma incorrecta, con productos cruzados"
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		7:
			ejercicio = "Ejercicio 3.1"
			respuesta = true
			dialogo = ["En la feria gastronómica, realizada en el Puerto de Veracruz, durante semana santa, 3/5 de cada 20 asistentes mencionaron como platillo favorito...",
			"el chilpachole de camarone. Entonces por cada 20 persona, ¿qué cantidad de asistentes prefieren el chilpachole de camarón?."]
			mensaje_correcto = "Lograste identificar que para resolver una multiplicación de fracciones con un numero natural debes convertir el número natural a fracción, y escribir el número natural como numerador y su valor posicional (1) como denominador."
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		8:
			ejercicio = "Ejercicio 3.2"
			respuesta = true
			dialogo = ["En la feria gastronómica, realizada en el Puerto de Veracruz, durante semana santa, 3/5 de cada 20 asistentes mencionaron como platillo favorito...",
			"el chilpachole de camarone. Entonces por cada 20 persona, ¿qué cantidad de asistentes prefieren el chilpachole de camarón?."]
			mensaje_correcto = "Lograste identificar que el procedimiento sugerido para la resolución de este planeamiento realiza una forma incorrecta para el desarrollo de la multiplicación de dos fracciones, manejando como resultado una fracción decimal."
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		9:
			ejercicio = "Ejercicio 3.3"
			respuesta = false
			dialogo = ["En la feria gastronómica, realizada en el Puerto de Veracruz, durante semana santa, 3/5 de cada 20 asistentes mencionaron como platillo favorito...",
				  "el chilpachole de camarone. Entonces por cada 20 persona, ¿qué cantidad de asistentes prefieren el chilpachole de camarón?."]
			mensaje_correcto = "El procedimiento de este ejercicio es incorrecto, al convertir el numero natural en fracción decimal, para poder multiplicar las dos fracciones mencionadas en el planeamiento inicial. "
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		10:
			ejercicio = "Ejercicio 4.1"
			respuesta = true
			dialogo = ["En 2022, el acuario de Veracruz recibió a 180 estudiantes universitarios. La mitad de ellos realizó su servicio social, y de ese grupo, 2/8 también hizo sus prácticas profesionales...",
				  "¿Qué fracción del total de estudiantes realizó sus prácticas profesionales?."]
			mensaje_correcto = "Lograste identificar que la multiplicación de fracciones se resuelve correctamente multiplicando numerador por numerador y denominador por denominador de ambas fracciones. Pusiste en práctica tus conocimientos para realizar una reducción de fracciones hasta lograr la fracción más simple."
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		11:
			ejercicio = "Ejercicio 4.2"
			respuesta = true
			dialogo = ["En 2022, el acuario de Veracruz recibió a 180 estudiantes universitarios. La mitad de ellos realizó su servicio social, y de ese grupo, 2/8 también hizo sus prácticas profesionales...",
				  "¿Qué fracción del total de estudiantes realizó sus prácticas profesionales?."]
			mensaje_correcto = "Lograste identificar que para resolver una multiplicación de fracciones puedes realizarlo con una representación gráfica."
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		12:
			ejercicio = "Ejercicio 4.3"
			respuesta = false
			dialogo = ["En 2022, el acuario de Veracruz recibió a 180 estudiantes universitarios. La mitad de ellos realizó su servicio social, y de ese grupo, 2/8 también hizo sus prácticas profesionales...",
				  "¿Qué fracción del total de estudiantes realizó sus prácticas profesionales?."]
			mensaje_correcto = "El procedimiento sugerido para la resolución de este planeamiento realiza una forma incorrecta para el desarrollo de la multiplicación de dos fracciones, la multiplicación se realiza con productos cruzados, manejando como resultado una fracción impropia."
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		13:
			ejercicio = "Ejercicio 5.1"
			respuesta = true
			dialogo = ["El Parque Nacional Sistema Arrecifal Veracruzano, tiene una superficie total aproximada de 6 400 hectáreas. El arrecife Cabezo, ocupando aproximadamente 1/4 de la superficie total, dentro de su superficie...",
				  "1/2 pertenece a una zona de corales. ¿Qué superficie del total de este parque ocupa la zona de corales del arrecife Cabezo?"]
			mensaje_correcto = "Lograste identificar que la multiplicación de fracciones se resuelve correctamente multiplicando numerador por numerador y denominador por denominador de ambas fracciones."
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		14:
			ejercicio = "Ejercicio 5.2"
			respuesta = true
			dialogo = ["El Parque Nacional Sistema Arrecifal Veracruzano, tiene una superficie total aproximada de 6 400 hectáreas. El arrecife Cabezo, ocupando aproximadamente 1/4 de la superficie total, dentro de su superficie...",
				  "1/2 pertenece a una zona de corales. ¿Qué superficie del total de este parque ocupa la zona de corales del arrecife Cabezo?"]
			mensaje_correcto = "Lograste identificar que para resolver una multiplicación de fracciones puedes realizarlo con una representación gráfica."
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

		15:
			ejercicio = "Ejercicio 5.3"
			respuesta = false
			dialogo = ["El Parque Nacional Sistema Arrecifal Veracruzano, tiene una superficie total aproximada de 6 400 hectáreas. El arrecife Cabezo, ocupando aproximadamente 1/4 de la superficie total, dentro de su superficie...",
				  "1/2 pertenece a una zona de corales. ¿Qué superficie del total de este parque ocupa la zona de corales del arrecife Cabezo?"]
			mensaje_correcto = "El procedimiento sugerido para la resolución de este planeamiento se realiza de una forma incorrecta para el desarrollo de la multiplicación de dos fracciones, la multiplicación se realiza con productos cruzados, manejando como resultado una fracción propia, la cual se reduce a su representación más simple. "
			mensaje_incorrecto = "¡Animo!  Sé que puedes hacerlo mejor. No te desanimes, ¡sigue intentándolo! "

			
		16:
			var raiz_escena = get_tree().get_root()
			for i in range(raiz_escena.get_child_count()):
				var nodo = raiz_escena.get_child(i)
				nodo.queue_free()

		#	Cargar la escena inicial del juego nuevamente
			var escena_inicial_path = "res://escenas/regiones/scn_developMessage.tscn"
			get_tree().change_scene(escena_inicial_path) 
	
	var resultado = {"dialogo": dialogo, "ejercicio": ejercicio, "respuesta": respuesta, "mensaje_correcto": mensaje_correcto, "mensaje_incorrecto": mensaje_incorrecto}
	# Devuelve el diccionario con los valores
	return resultado

##Deberia existir también un diccionario para las preguntas
##Lo que debe de ir en los recuadros verdes de las preguntas
#var reg_1_preguntas = {
#
#}
