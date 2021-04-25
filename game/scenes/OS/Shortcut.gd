extends Control

export(Texture) var _icon
export(PackedScene) var _window
export var _label = ""
export var receive_notif = false
var mouse_on = 0

signal clicked

# Called when the node enters the scene tree for the first time.
func _ready():
	$Texture.texture = _icon
	$Label.text = _label
	if receive_notif:
		self.set_process(true)


func get_window():
	return _window
	
	
func _process(delta):
	if EmailServer.has_new_email():
		print_debug("You got new mail!")
	
	if mouse_on:
		mouse_on += delta
		if mouse_on >= 1.25 and Input.is_mouse_button_pressed(BUTTON_LEFT):
			print_debug("a")
			margin_left = get_viewport().get_mouse_position().x
			margin_top = get_viewport().get_mouse_position().y


func _on_Texture_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			mouse_on = 1
		else:
			if mouse_on < 1.25:
				emit_signal("clicked", _window, _icon, _label)
			mouse_on = 0
