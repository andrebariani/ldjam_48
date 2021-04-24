extends Control

export(Texture) var _icon
export(PackedScene) var _window
export var _label = ""

signal clicked

# Called when the node enters the scene tree for the first time.
func _ready():
	$Texture.texture = _icon
	$Label.text = _label


func get_window():
	return _window


func _on_Texture_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked", _window, _icon, _label)
