extends Control

export(Texture) var _texture
export(PackedScene) var _window
export var label = ""

signal clicked

# Called when the node enters the scene tree for the first time.
func _ready():
	$Texture.texture = _texture
	$Label.text = label

func _on_Shortcut_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked", label)


func get_window():
	return _window
