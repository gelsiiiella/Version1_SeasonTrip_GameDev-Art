extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_next_pressed():
	get_tree().change_scene_to_file("res://educ_part/traffic_signs_section.tscn")

func _on_previous_pressed():
	get_tree().change_scene_to_file("res://educ_part/information_part.tscn")
