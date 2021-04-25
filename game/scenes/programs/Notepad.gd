extends "res://scenes/programs/program.gd"

func _on_Notepad_updated_activated(value):
	$TextEdit.readonly = !value
