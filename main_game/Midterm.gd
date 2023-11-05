extends Control


onready var audio_stream_player = $AudioStreamPlayer

func _ready():
	# Connect the key press event to a function
	Input.map_action("play_sound", "ui_accept", InputEvent.KEY, true)
	Input.add_action("play_sound")
	Input.set_action_mode("play_sound", InputEvent.ACTION_MODE_PRESSED)

func _input(event):
	if event.is_action_pressed("play_sound"):
		# When the key is pressed, play the sound
		audio_stream_player.play()
