#Esta es una modificación al codigo del diálogo. Este no espera elementos siguientes, tampoco tiene una animacion. 
extends Node2D

onready var felicitacion = $txt_Felicitacion
onready var mensaje = $txt_Mensaje

func _ready():
	SignalManager.connect("mostrarFelicitacion", self, "mostrarTexto")
	pass

func mostrarTexto(id):
	felicitacion.text = RegionesData.reg_1_finalizar[id]["Felicitacion"]
	mensaje.bbcode_text = RegionesData.reg_1_finalizar[id]["Mensaje"]
	pass
