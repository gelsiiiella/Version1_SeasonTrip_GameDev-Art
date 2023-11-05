extends Node3D

@onready var main_game_music = $AudioStreamPlayer

func _ready():
	main_game_music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
