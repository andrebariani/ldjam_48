extends ColorRect

export(PackedScene) var program_scene
var program_count = 0

signal create_window

func add_program(window, icon, label):
	var new = program_scene.instance()
	add_child(new)
	move_child(new, get_child_count()-1)
	new.margin_left = 180*program_count
	new.margin_right = 180 + 180*program_count
	new.margin_bottom = 0
	new.setup(window, icon, label)
	new.connect("clicked", self, "clicked")
	clicked(new, window, icon, label)
	program_count += 1

func remove_program(taskbar):
	remove_child(taskbar)

func clicked(taskbar, window, icon, label):
	emit_signal("create_window", taskbar, window, icon, label)
