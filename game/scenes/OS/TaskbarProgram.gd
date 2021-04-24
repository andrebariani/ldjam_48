extends Control

export(PackedScene) var _window
signal clicked

func setup(window, icon, label):
	_window = window
	$Icon.texture = icon
	$Label.text = label


func _on_Retangulo_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked", self, _window, $Icon.texture, $Label.text)
