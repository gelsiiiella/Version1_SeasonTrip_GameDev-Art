extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_replay_pressed():
	get_tree().change_scene_to_file("res://main_game/main_game.tscn")
	


func _on_learn_pressed():
	get_tree().change_scene_to_file("res://educ_part/information_part.tscn")
	



func _on_quit_pressed():
	get_tree().quit()
