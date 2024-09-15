extends Node2D

onready var a = $Sprite
onready var b = $Sprite2
onready var c = $Sprite3
onready var d = $Sprite4

var sele1 = false 
var sele2 = false # Variable para controlar
var sele3 = false
var i = 0
var j = 0
var k = 0
var l = 0
var m = 2
var n = 0
var o = 0
var p = 0
var q = 0
var all = false

var imgJ ={
	0: "res://recursos/imagenes/reg1/icon_Vaso_Empty.png",
	1: "res://recursos/imagenes/reg1/icon_Vaso_1.png",
	2: "res://recursos/imagenes/reg1/icon_Vaso_2.png",
	3: "res://recursos/imagenes/reg1/icon_Vaso_3.png",
	4: "res://recursos/imagenes/reg1/icon_Vaso_4.png"
} 
#ruta_tarjeta1 = "res://recursos/imagenes/reg3/tarjetas/1A1.png"



func _ready():
	$TouchScreenButton8.normal = load(imgJ[4])
	$TouchScreenButton9.normal = load(imgJ[4])
	$TouchScreenButton10.normal = load(imgJ[4])
	$TouchScreenButton11.normal = load(imgJ[4])
	$TouchScreenButton12.normal = load(imgJ[2])
	#GlobalVar.tap=0
	pass

func validar():
	
	pass

func _skbi():
	get_tree().change_scene("res://escenas/mapa/scn_Mapa_Selector.tscn")
	pass


func _on_TouchScreenButton4_pressed():
	a.visible = true
	d.visible = false
	#selected = true
	next()

	pass # Replace with function body.


func _on_TouchScreenButton7_pressed():
	c.visible = true
	b.visible = false
	#selected = true
	next()

	pass # Replace with function body.


func _on_TouchScreenButton5_pressed():
	c.visible = true
	b.visible = false
	#selected = true
	next()

	pass # Replace with function body.


func _on_TouchScreenButton2_pressed():
	d.visible = true
	a.visible = false
	sele1 = true
	next()

	pass # Replace with function body.


func _on_TouchScreenButton6_pressed():
	b.visible = true
	c.visible = false
	sele3 = true
	next()
	
	pass # Replace with function body.


func _on_TouchScreenButton3_pressed():
	d.visible = true
	a.visible = false
	sele2 = true
	next()
	
	pass # Replace with function body.
	
#jarra

func _on_TouchScreenButton8_pressed():
	i += 1
	if i >= imgJ.size():  # Si el índice sobrepasa el tamaño del diccionario, reinicia a 0
		i = 0
	print("1 veces presionado", i)
	$TouchScreenButton8.normal = load(imgJ[i])
	ver()
	pass # Replace with function body.


func _on_TouchScreenButton9_pressed():
	j += 1
	if j >= imgJ.size():  # Si el índice sobrepasa el tamaño del diccionario, reinicia a 0
		j = 0
	print("2 veces presionado", j)
	$TouchScreenButton9.normal = load(imgJ[j])
	ver()
	pass # Replace with function body.


func _on_TouchScreenButton10_pressed():
	
	k += 1
	if k >= imgJ.size():  # Si el índice sobrepasa el tamaño del diccionario, reinicia a 0
		k = 0
	print("3 veces presionado", k)
	$TouchScreenButton10.normal = load(imgJ[k])
	ver()
	pass # Replace with function body.


func _on_TouchScreenButton11_pressed():
	
	l += 1
	if l >= imgJ.size():  # Si el índice sobrepasa el tamaño del diccionario, reinicia a 0
		l = 0
	print("4 veces presionado", l)
	$TouchScreenButton11.normal = load(imgJ[l])
	ver()
	pass # Replace with function body.


func _on_TouchScreenButton12_pressed():
	
	m += 1
	if m >= imgJ.size():  # Si el índice sobrepasa el tamaño del diccionario, reinicia a 0
		m = 0
	print("5 veces presionado", m)
	$TouchScreenButton12.normal = load(imgJ[m])
	ver()
	pass # Replace with function body.


func _on_TouchScreenButton13_pressed():
	
	n += 1
	if n >= imgJ.size():  # Si el índice sobrepasa el tamaño del diccionario, reinicia a 0
		n = 0
	print("6 veces presionado", n)
	$TouchScreenButton13.normal = load(imgJ[n])
	ver()
	pass # Replace with function body.


func _on_TouchScreenButton14_pressed():
	
	o += 1
	if o >= imgJ.size():  # Si el índice sobrepasa el tamaño del diccionario, reinicia a 0
		o = 0
	print("7 veces presionado", o)
	$TouchScreenButton14.normal = load(imgJ[o])
	ver()
	pass # Replace with function body.


func _on_TouchScreenButton15_pressed():
	
	p += 1
	if p >= imgJ.size():  # Si el índice sobrepasa el tamaño del diccionario, reinicia a 0
		p = 0
	print("8 veces presionado", p)
	$TouchScreenButton15.normal = load(imgJ[p])
	ver()
	pass # Replace with function body.


func _on_TouchScreenButton16_pressed():
	
	q += 1
	if q >= imgJ.size():  # Si el índice sobrepasa el tamaño del diccionario, reinicia a 0
		q = 0
	print("9 veces presionado", q)
	$TouchScreenButton16.normal = load(imgJ[q])
	ver()
	pass # Replace with function body.
	
func ver():
	print("ver all", all)
	if i == 2 && j == 2 && k == 2 && l == 2 && m == 2 && n == 2 && o == 2 && p == 2 && q == 2:
		all = true
		#eva()
	print("ver all if", all)
	eva()
	pass


func eva():
	print("eva all", all)
	if all == true:
		$TouchScreenButton8.normal = load(imgJ[2])
		$TouchScreenButton9.normal = load(imgJ[2])
		$TouchScreenButton10.normal = load(imgJ[2])
		$TouchScreenButton11.normal = load(imgJ[2])
		$TouchScreenButton12.normal = load(imgJ[2])
		$TouchScreenButton13.normal = load(imgJ[2])
		$TouchScreenButton14.normal = load(imgJ[2])
		$TouchScreenButton15.normal = load(imgJ[2])
		$TouchScreenButton16.normal = load(imgJ[2])
	pass


	pass
func next():
	
	if a.visible==true && c.visible==true:
		GlobalVar.tap=0
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://escenas/regiones/region_1/texto.tscn")
	if (sele1==true || sele2==true) && c.visible==true:
		GlobalVar.tap=1
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://escenas/regiones/region_1/texto.tscn")
	if a.visible==true && sele3==true:
		GlobalVar.tap=1
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://escenas/regiones/region_1/texto.tscn")
	if (sele1==true || sele2==true) && sele3==true:
		GlobalVar.tap=1
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://escenas/regiones/region_1/texto.tscn")
	
	pass
