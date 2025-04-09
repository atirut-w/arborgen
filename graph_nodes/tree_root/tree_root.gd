class_name TreeRoot
extends GraphNode


@onready var seed_spinbox: SpinBox = %SpinBox
@onready var x_spinbox: SpinBox = %XSpinBox
@onready var y_spinbox: SpinBox = %YSpinBox
@onready var z_spinbox: SpinBox = %ZSpinBox


var tree_seed: int:
	get:
		return int(seed_spinbox.value)
	set(value):
		seed_spinbox.value = value

var tree_offset: Vector3:
	get:
		return Vector3(x_spinbox.value, y_spinbox.value, z_spinbox.value)
	set(value):
		x_spinbox.value = value.x
		y_spinbox.value = value.y
		z_spinbox.value = value.z


func _ready() -> void:
	pass
