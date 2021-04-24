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
	open_ids.append(id)


func _on_Taskbar_toggle_window(id):
	for child in get_children():
		if child.get_id() == id:
			if open_ids.empty() or id != open_ids.back():
				move_child(child, get_child_count()-1)
				child.visible = true
				if id in open_ids:
					open_ids.erase(id)
				open_ids.append(id)
			else:
				minimized_window(child, id)


func closed_window(window, id):
	open_ids.erase(id)
	window.queue_free()
	emit_signal("closed_window", id)

func minimized_window(window, id):
	window.visible = false
	open_ids.erase(id)
