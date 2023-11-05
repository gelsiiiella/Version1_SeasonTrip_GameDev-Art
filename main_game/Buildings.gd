extends GridMap

var speed = 20.0
var direction = 1

func _process(delta):
	var translation = Vector3(0, 0, speed * delta * direction)
	translate(translation)

	if abs(translation.z) >= 10.0: 
		direction *= -1

