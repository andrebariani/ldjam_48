extends Control

var _id = 0

func setup(id, window, icon, label):
	var new = window.instance()
	add_child(new)
	new.margin_left = 0
	new.margin_top = 30
	_id = id
	$Icon.texture = icon
	$Label.text = label


func get_id():
	return _id
