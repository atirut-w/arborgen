extends Control


@onready var file_menu: PopupMenu = %FileMenu
@onready var tree_graph: GraphEdit = %TreeGraph
@onready var tree_root: TreeRoot = %TreeRoot


func _ready() -> void:
	file_menu.add_item("Quit", 0, KEY_MASK_CTRL | KEY_Q)
	file_menu.id_pressed.connect(_on_file_menu_id_pressed)


func _on_file_menu_id_pressed(id: int) -> void:
	match id:
		0:
			get_tree().quit()
		_:
			push_error("Unknown menu item ID: %d" % id)
