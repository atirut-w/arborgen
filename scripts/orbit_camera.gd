class_name OrbitCamera
extends Camera3D
## Orbits around a target point.


@export var target := Vector3.ZERO
@export var distance := 10.0
@export var distance_step := 0.1
@export var min_distance := 1.0
@export var max_distance := 100.0

var _rotation := Vector2(PI / 4, PI / 8)


func _physics_process(delta: float) -> void:
	var x := distance * cos(_rotation.y) * cos(_rotation.x)
	var y := distance * sin(_rotation.y)
	var z := distance * cos(_rotation.y) * sin(_rotation.x)

	position = target + Vector3(x, y, -z)
	look_at(target, Vector3.UP)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			_rotation.x -= event.relative.x * 0.01
			_rotation.y += event.relative.y * 0.01
			_rotation.y = clamp(_rotation.y, -deg_to_rad(45), deg_to_rad(45))
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_pressed():
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			distance = max(min_distance, distance * (1.0 - distance_step))
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			distance = min(max_distance, distance * (1.0 + distance_step))
