extends VBoxContainer

var Speed
var Distance
var isGameRunning = true
var elapsedTime = 0.0
var distance = 0.0
var initialSpeed = 0.0  # Set initial speed to zero
var acceleration = 1.0
signal speed_changed(speed)

# Added a flag to check if keys are pressed
var keys_pressed = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Speed = $Speed/SpeedValue
	Distance = $Distance/DistanceValue

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isGameRunning and keys_pressed:
		elapsedTime += delta
		var currentSpeed = calculateSpeed(elapsedTime)
		distance += currentSpeed * delta
		speed_changed.emit(currentSpeed)
		Speed.text = "%.1f" % currentSpeed + " KPH"
		Distance.text = "%.1f" % (distance / 1000.0) + " KM" # Convert meters to kilometers

func calculateSpeed(time):
	var speed = initialSpeed + acceleration * time
	return speed

# Input callback to detect key presses
func _input(event):
	if event is InputEventKey:
		if event.pressed:
			keys_pressed = true
		elif event.is_action_released("ui_up") or event.is_action_released("ui_down"):
			keys_pressed = false
