extends Control

var _id = 0
signal clicked

func setup(id, icon, label):
	_id = id
	$Icon.texture = icon
	$Label.text = label


func _on_Retangulo_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked", _id)


func get_id():
	return _id
