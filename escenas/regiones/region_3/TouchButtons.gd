extends TouchScreenButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _region3():
	if GlobalVar.ejercicioTarjetas2 >= 3:
		get_tree().change_scene("res://escenas/regiones/region_3/scn_TarjetasReg3.tscn")
		GlobalVar.ejercicioTarjetas = 1
	else:
		get_tree().change_scene("res://escenas/regiones/region_3/scn_developCondicion.tscn")
		
func _region2():
	if GlobalVar.ejercicioTarjetas >= 1:
		GlobalVar.ejercicioTarjetas = 1 
		get_tree().change_scene("res://escenas/regiones/region_2/scn_TarjetasReg2.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
