extends VehicleBody3D

const MAX_SPEED = 0.8
const ENGINE_POWER = 300

@onready var camera_pivot = $CameraPivot
@onready var camera_3d = $CameraPivot/Camera3D
@onready var camera_front = $CameraPivot/CameraFront3D
@onready var reverse_camera = $CameraPivot/ReverseCamera

var look_at

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	look_at = global_position
	
func _physics_process(delta):
	steering = move_toward(steering, Input.get_axis("ui_right","ui_left") * MAX_SPEED, delta * 2.5)
	engine_force = Input.get_axis("ui_down","ui_up")
	camera_pivot.global_position = camera_pivot.global_position.lerp(global_position,delta * 20.0)
	camera_pivot.transform = camera_pivot.transform.interpolate_with(transform, delta * 5.0)
	look_at = look_at.lerp(global_position * linear_velocity,delta * 5.0)
	camera_3d.look_at(look_at)
	reverse_camera.look_at(look_at)
	_check_camera_switch()
	
func _check_camera_switch():
	if linear_velocity.dot(transform.basis.z) > 0:
		camera_3d.current = true
	else:
		reverse_camera.current = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
