extends Node

var acceleration = 0.0
var deceleration = 0.0
var speed = 0.0  # No initial speed
var distance = 0.0

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		acceleration += 0.1  # Increase acceleration
		deceleration = 0.0   # Reset deceleration
	elif Input.is_action_pressed("ui_down"):
		deceleration += 0.1  # Increase deceleration
		acceleration = 0.0   # Reset acceleration
	else:
		acceleration = 0.0
		deceleration = 0.0

	# Calculate speed based on acceleration and deceleration
	speed += (acceleration - deceleration) * delta

	# Calculate distance based on speed
	distance += speed * delta
