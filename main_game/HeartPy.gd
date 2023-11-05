extends Node

var Heart
var min_heart_rate = 60
var max_heart_rate = 180  # Adjust the maximum value as needed
var current_heart_rate
var time_passed = 0.0
var heart_rate_amplitude = 60.0  # ±60 BPM range
var heart_rate_period = 5.0  # Adjust this value to control the heart rate period

func _ready():
	Heart = $Heart/HeartValue
	$Timer.start()

func _process(delta):
	time_passed += delta
	current_heart_rate = calculate_heart_rate(time_passed)
	Heart.text = "%.1f" % current_heart_rate + " BPM"

func calculate_heart_rate(time):
	var heart_rate = min_heart_rate + heart_rate_amplitude * sin(2.0 * PI * time / heart_rate_period)
	return max(heart_rate, min_heart_rate)
