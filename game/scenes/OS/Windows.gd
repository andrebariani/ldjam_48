extends Control

export(PackedScene) var _window
var open_ids = []

signal closed_window

func _on_Taskbar_create_window(id, program, icon, label):
	var new = _window.instance()
	add_child(new)
	move_child(new, get_child_count()-1)
	new.setup(id, program, icon, label)
	new.connect("closed", self, "closed_window")
	new.connect("minimized", self, "minimized_window")
	
	for child in get_children():
		if child.get_id() == open_ids.back():
			child.program.activated = false
			
	open_ids.append(id)


func _on_Taskbar_toggle_window(id):
	for child in get_children():
		if child.get_id() == id:
			if open_ids.empty() or id != open_ids.back():
				activate_window(child, id)
			else:
				minimized_window(child, id)
			break


func closed_window(window, id):
	open_ids.erase(id)
	window.queue_free()
	emit_signal("closed_window", id)


func activate_window(window, id):
	for child in get_children():
		child.program.set_activated(false)
	move_child(window, get_child_count()-1)
	window.visible = true
	window.program.set_activated(true)
	if id in open_ids:
		open_ids.erase(id)
	open_ids.append(id)


func minimized_window(window, id):
	window.program.set_activated(false)
	window.visible = false
	open_ids.erase(id)
