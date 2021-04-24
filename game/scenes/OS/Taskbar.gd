extends ColorRect

export(PackedScene) var program_scene
var program_count = 0
var id_count = 0

signal create_window
signal toggle_window

func add_program(window, icon, label):
	var new = program_scene.instance()
	add_child(new)
	move_child(new, get_child_count()-1)
	new.margin_left = 180*program_count
	new.margin_right = 180 + 180*program_count
	new.margin_bottom = 0
	
	new.connect("clicked", self, "clicked")
	new.setup(id_count, icon, label)
	emit_signal("create_window", id_count, window, icon, label)
	
	program_count += 1
	id_count += 1


func remove_program(id):
	for child in get_children():
		if child.get_id() == id:
			remove_child(child)
			break


func clicked(id):
	print_debug("clicked "+ str(id))
	emit_signal("toggle_window", id)
