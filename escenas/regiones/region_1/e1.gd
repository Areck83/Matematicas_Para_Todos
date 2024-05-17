extends Node2D
signal roup
onready var rxxap = $rec/rxxap
onready var rxbng = $rec/rxbng
onready var rxmm= $rec/rxmm
onready var totis= $rec/raxc

#Cambiar a convenciencia y coherencia
var npek = 5
var ngan = 3
var cmai = 39
var tote = 47
var cc= 0

func _ready():
	apnt()
	connect("roup", self, "acsm")
	pass

func acsm():
	cc += 1
	if cc == 4:
		$vamo.visible = true
	pass

func apnt():
	rxxap.connect("text_changed", self, "pq")
	rxbng.connect("text_changed", self, "mtcs")
	rxmm.connect("text_changed", self, "mi")
	totis.connect("text_changed", self, "chlito")
	pass

func pq(w: String):
	if (apcsi(rxxap, npek)):
		$rec/c1.af()
		emit_signal("roup")
	pass

func mtcs(ws: String):
	if (apcsi(rxbng, ngan)):
		$rec/c2.af()
		emit_signal("roup")
	pass

func mi(wsb: String):
	if (apcsi(rxmm, cmai)):
		$rec/c3.af()
		emit_signal("roup")
	pass

func chlito(wsbi: String):
	if (apcsi(totis, tote)):
		$rec/c4.af()
		emit_signal("roup")
	pass

func apcsi(wea: LineEdit, weon: int) -> bool:
	if(wea.text == str(weon)):
		wea.editable = false
		wea.MOUSE_FILTER_STOP
		return true
	return false
	pass

func _kochi():
		get_tree().change_scene("res://escenas/regiones/region_1/scn_Fin_1.tscn")
		pass
