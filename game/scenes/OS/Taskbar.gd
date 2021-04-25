extends TextureRect

const WIDTH = 180

export(PackedScene) var program_scene
var program_count = 0
var id_count = 0

signal create_window
signal toggle_window

func add_program(window, icon, label, time = 0):
	var new = program_scene.instance()
	add_child(new)
	move_child(new, get_child_count()-1)
	new.margin_left = WIDTH*program_count
	new.margin_right = WIDTH + WIDTH*program_count
	new.margin_bottom = 0
	
	new.connect("clicked", self, "clicked")
	new.setup(id_count, icon, label)
	emit_signal("create_window", id_count, window, icon, label)
	
	program_count += 1
	id_count += 1


func remove_program(id):
	var to_remove = null
	for child in get_children():
		if child.get_id() == id:
			to_remove = child
		elif to_remove != null:
			child.margin_left -= WIDTH
			child.margin_right -= WIDTH
	
	if to_remove != null:
		program_count -= 1
		to_remove.queue_free()


func clicked(id):
	emit_signal("toggle_window", id)
