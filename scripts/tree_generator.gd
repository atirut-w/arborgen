class_name TreeGenerator
extends Node3D


@export var tree_graph: TreeGraph


func _ready() -> void:
	tree_graph.graph_changed.connect(_regenerate)


func _regenerate() -> void:
	print("TODO: Generate tree from graph")
