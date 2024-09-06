extends TouchScreenButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _region3():
		Song3.play()
		get_tree().change_scene("res://escenas/regiones/region_3/memoramaReg3/principal.tscn")
		if GlobalVar.ejercicioTarjetas >= 6:
			get_tree().change_scene("res://escenas/regiones/region_3/scn_TarjetasReg3.tscn")
		if GlobalVar.contDrag == 0:
			print("contDrag actual:", GlobalVar.contDrag) 
			get_tree().change_scene("res://escenas/regiones/region_3/escenaFinalReg3.tscn")
		
		
func _region2():
	if GlobalVar.ejercicioTarjetas >= 1:
		GlobalVar.ejercicioTarjetas = 1 
		get_tree().change_scene("res://escenas/regiones/region_2/scn_TarjetasReg2.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
