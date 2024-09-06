extends Node

var sonidoFondo = preload("res://musica/LEVEL 2.ogg")
onready var music_player = AudioStreamPlayer.new()

func _ready():
	music_player.stream = sonidoFondo
	add_child(music_player)
	
func repro():
	music_player.play()
func para():
	music_player.stop()
