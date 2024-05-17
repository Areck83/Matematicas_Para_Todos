extends Node2D

var c: int = 0
onready var narpeq_calc: LineEdit

func _ready():
	
	SignalManager.emit_signal("mostrarIndicacion", "1")
	
	narpeq_calc = $ejercicio1_1/recuadro_ejercicios/r_NarPeq_Calc
	narpeq_calc.connect("text_changed", self, "naranjo_pq_calc")
	
	#Ver total de arboles automaticamente
	for drag in get_tree().get_nodes_in_group("drag"):
		c += 1
	
	#Eliminar en prod
	print("No. de Escenas drag actuales: "+String(c))
	
	#Prevencion de errores no dados por el editor
	if c <= 0:
		print("Asegurarse de poner las escenas drag en el grupo drag")
	else:
		SignalManager.connect("dragEliminado", self, "contarDrags")
	pass

func contarDrags():
	c -= 1
	if c == 1:
		print("queda 1")
	if c == 0:
		print("Se acabaron las escenas")
		mostrarPreguntas()

func mostrarPreguntas():
	$parcela.hide()
	SignalManager.emit_signal("mostrarIndicacion", "1.2")
	$ejercicio1_1.show()
	pass

func naranjo_pq_calc(respuesta: String):
	var texto_filtrado = FunBuilder.filtro_regex(respuesta, FunBuilder.regexNumeros)
	if texto_filtrado != respuesta:
		narpeq_calc.set_text(texto_filtrado)
	pass
