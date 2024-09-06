extends Node2D

#Viene siendo el total de arboles
var contDrag: int = 0
export (String) var contenedorDestino: String


func _ready():
	GlobalVar.contDrag = contDrag
	#Ver total de arboles automaticamente
	for drag in get_tree().get_nodes_in_group("drag"):
		contDrag += 1
	
	#Eliminar en prod
	print("No. de Escenas drag actuales: "+String(contDrag))
	
	#Prevencion de errores no dados por el editor
	if contDrag <= 0:
		print("Asegurarse de poner las escenas drag en el grupo drag")
	else:
		SignalManager.connect("dragEliminado", self, "contarDrags")
	pass

func contarDrags():
	contDrag -= 1
	print("contDrag actual:", contDrag)  # Agregar esto para verificar el valor actual
	if contDrag == 1:
		print("queda 1")
	if contDrag == 0:
		GlobalVar.contDrag = 0
		print("contDrag actual:", contDrag) 
		print("Se acabaron las escenas")
		get_tree().change_scene("res://escenas/regiones/region_3/escenaFinalReg3.tscn")

func volver():
	Song3.stop()
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")


