extends Area2D
export (String) var ktn: String
export (Texture) var sus: Texture
var bills = 0
func _ready():
	set_process(true)
	set_physics_process(true)
	$chps.text = String(bills)
	if sus:
		$tel.texture = sus
pass
func superCrash(coso):
	if coso.is_in_group(ktn):
		bills += 1
		$chps.text = String(bills)
pass
