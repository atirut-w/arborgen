class_name TreeRoot
extends GraphNode


var tree_seed: int:
	get:
		var spinbox: SpinBox = %SpinBox
		return int(spinbox.value)
	set(value):
		var spinbox: SpinBox = %SpinBox
		spinbox.value = value

var tree_offset: Vector3:
	get:
		var x_spinbox: SpinBox = %XSpinBox
		var y_spinbox: SpinBox = %YSpinBox
		var z_spinbox: SpinBox = %ZSpinBox
		return Vector3(x_spinbox.value, y_spinbox.value, z_spinbox.value)
	set(value):
		var x_spinbox: SpinBox = %XSpinBox
		var y_spinbox: SpinBox = %YSpinBox
		var z_spinbox: SpinBox = %ZSpinBox
		x_spinbox.value = value.x
		y_spinbox.value = value.y
		z_spinbox.value = value.z


func _ready() -> void:
	pass
