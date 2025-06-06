class_name TreeGraph
extends GraphEdit


@onready var root_node : GraphNode = %TreeRoot
@onready var _popup_menu: PopupMenu = %PopupMenu

var _branch_scene: PackedScene = preload("res://graph_nodes/branch/branch.tscn")
var _node_position: Vector2 = Vector2.ZERO


func _ready() -> void:
	# TODO: Copy, cut, paste
	delete_nodes_request.connect(_on_delete_nodes_request)
	popup_request.connect(_on_popup_request)
	connection_request.connect(_on_connection_request)
	disconnection_request.connect(_on_disconnection_request)

	_popup_menu.add_item("Add Branch", 0)
	_popup_menu.id_pressed.connect(_on_popup_menu_id_pressed)


func _on_delete_nodes_request(nodes: Array[StringName]) -> void:
	for node_name in nodes:
		var node = get_node(String(node_name))
		if node and node != root_node:
			node.queue_free()
		elif node == root_node:
			print("Cannot delete root node.")


func _on_popup_request(pos: Vector2) -> void:
	var abs_pos := get_global_mouse_position()
	_popup_menu.popup(Rect2(abs_pos.x, abs_pos.y, 0, 0))
	_node_position = (pos + scroll_offset) / zoom


func _on_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	if from_node != to_node:
		connect_node(from_node, from_port, to_node, to_port)
	else:
		push_warning("User just tried to connect a node to itself?")


func _on_disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	disconnect_node(from_node, from_port, to_node, to_port)


func _on_popup_menu_id_pressed(id: int) -> void:
	match id:
		0:
			var branch_node: GraphNode = _branch_scene.instantiate()
			branch_node.position_offset = _node_position
			add_child(branch_node)
		_:
			push_error("Unknown menu item ID: %d" % id)
