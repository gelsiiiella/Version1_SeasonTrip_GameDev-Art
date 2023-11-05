extends VehicleBody3D

const MAX_SPEED = 500
const ENGINE_POWER = 200
const MAX_TURN_SPEED = 0.5
const TURN_ACCELERATION = 1.0

var turn_speed = 0.0
var acceleration = 0.0

func _physics_process(_delta):
	var steer_input = 0.0
	var brake = 0.0

	if Input.is_action_pressed("ui_right"):
		steer_input = -1.0
		print("Right")
	if Input.is_action_pressed("ui_left"):
		steer_input = 1.0
		print("Left")

	if Input.is_action_pressed("ui_up"):
		acceleration = 10.0
		brake = 0.0
		print("Accelerate")
	elif Input.is_action_pressed("ui_down"):
		acceleration = 0.0
		brake = 1.0
		print("Reverse")
	else:
		acceleration = 0.0
		brake = 0.0

	# Adjust the steering
	set_steering(steer_input * MAX_TURN_SPEED)

	# Apply force for acceleration and brake
	var forward_direction = -transform.basis.y
	var engine_force_vec = forward_direction * (acceleration - brake) * ENGINE_POWER
	apply_impulse(Vector3.ZERO, engine_force_vec)

	turn_speed = lerp(turn_speed, steer_input * MAX_TURN_SPEED, TURN_ACCELERATION * _delta)
	rotation.y += turn_speed * _delta
