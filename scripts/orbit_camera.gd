class_name OrbitCamera
extends Camera3D
## Orbits around a target point.


@export var target := Vector3.ZERO
@export var distance := 10.0
@export var distance_step := 0.1
@export var min_distance := 1.0
@export var max_distance := 100.0

var _last_mouse_position := Vector2.ZERO


func _physics_process(delta: float) -> void:
	var x := distance * cos(rotation.x) * sin(rotation.y)
	var y := -distance * sin(rotation.x)
	var z := distance * cos(rotation.x) * cos(rotation.y)
	position = target + Vector3(x, y, z)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			rotation.y -= event.relative.x * 0.01
			rotation.x -= event.relative.y * 0.01
			rotation.x = clamp(rotation.x, deg_to_rad(-89), deg_to_rad(89))
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_pressed():
				_last_mouse_position = get_viewport().get_window().get_mouse_position()
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				Input.warp_mouse(_last_mouse_position)
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			distance = max(min_distance, distance * (1.0 - distance_step))
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			distance = min(max_distance, distance * (1.0 + distance_step))
