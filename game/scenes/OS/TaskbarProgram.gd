extends Control

var _id = 0
signal clicked

func setup(id, icon, label, time = 0):
	_id = id
	$Icon.texture = icon
	$Label.text = label
	
	if time != 0:
		$Time.visible = true
		$Tween.interpolate_property($Time, "rect_size", \
			$Time.rect_size, Vector2(0, 32), time, Tween.TRANS_LINEAR)
		$Tween.start()
		print_debug("huh")


func _on_Retangulo_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked", _id)


func _on_Background_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked", _id)


func get_id():
	return _id


func set_highlight(hled):
	if hled:
		$Retangulo.visible = true
		$Retangulo.set_border_color(Color.yellow)
	else:
		$Retangulo.visible = false
		$Retangulo.set_border_color(Color.black)
