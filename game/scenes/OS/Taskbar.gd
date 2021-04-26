extends TextureRect

const WIDTH = 180

export(PackedScene) var program_scene
var program_count = 0
var id_count = 0

signal create_window
signal toggle_window

func add_program(window, icon, label, _time = 0):
	if program_count < 5:
		var new = program_scene.instance()
		$HBoxContainer.add_child(new)
		$HBoxContainer.move_child(new, get_child_count()-1)
		#new.margin_left = WIDTH*program_count
		#new.margin_right = WIDTH + WIDTH*program_count
		#new.margin_bottom = 0
		
		new.connect("clicked", self, "clicked")
		new.setup(id_count, icon, label, _time)
		emit_signal("create_window", id_count, window, icon, label)
		highlight_program(id_count, true)
		
		program_count += 1
		id_count += 1


func close_all_for_ritual():
	for child in $HBoxContainer.get_children():
		child.queue_free()


func remove_program(id):
	var to_remove = null
	for child in $HBoxContainer.get_children():
		if child.get_id() == id:
			to_remove = child
		elif to_remove != null:
			child.margin_left -= WIDTH
			child.margin_right -= WIDTH
	
	if to_remove != null:
		program_count -= 1
		to_remove.queue_free()


func highlight_program(id, new):
	for child in $HBoxContainer.get_children():
		if child.get_id() == id:
			child.set_highlight(new)


func clicked(id):
	emit_signal("toggle_window", id)
