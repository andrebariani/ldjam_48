extends Control

export(PackedScene) var _window
var open_ids = []

func _on_Taskbar_create_window(id, program, icon, label):
	var new = _window.instance()
	add_child(new)
	move_child(new, get_child_count()-1)
	new.setup(id, program, icon, label)
	open_ids.append(id)


func _on_Taskbar_toggle_window(id):
	for child in get_children():
		if child.get_id() == id:
			if id != open_ids.back():
				move_child(child, get_child_count()-1)
				child.visible = true
				if id in open_ids:
					open_ids.erase(id)
				open_ids.append(id)
			else:
				child.visible = false
				open_ids.pop_back()
