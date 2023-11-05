extends MeshInstance3D

const ROTATION_SPEED = 120.0 # Adjust the rotation speed as needed

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		rotate_steering_wheel(-ROTATION_SPEED)
	elif Input.is_action_pressed("ui_left"):
		rotate_steering_wheel(ROTATION_SPEED)

func rotate_steering_wheel(rotation_speed):
	var rotation_delta = rotation_speed * deg_to_rad(get_process_delta_time())
	rotate(Vector3(0, 1, 0), rotation_delta)
