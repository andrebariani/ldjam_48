extends Control

var _id = 0
var program = null

signal closed
signal minimized

func setup(id, window, icon, label):
	program = window.instance()
	add_child(program)
	program.margin_left = 0
	program.margin_top = 30
	_id = id
	$Icon.texture = icon
	$Label.text = label
	program.connect("force_closed", self, "_on_force_closed")
	program.setup(label)


func get_id():
	return _id


func close():
	emit_signal("closed", self, _id)
	

func minimize():
	emit_signal("minimized", self, _id)


func _on_force_closed():
	close()


func _on_Close_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		program.emit_signal("minigame_failed")
		emit_signal("closed", self, _id)


func _on_Minimize_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		program.activated = false
		minimize()
