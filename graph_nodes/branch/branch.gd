class_name TreeBranch
extends Node


@onready var length_spinbox: SpinBox = %LengthSpinBox
@onready var count_spinbox: SpinBox = %CountSpinbox


var length: float:
	get:
		return length_spinbox.value
	set(value):
		length_spinbox.value = value

var count: int:
	get:
		return int(count_spinbox.value)
	set(value):
		count_spinbox.value = value
