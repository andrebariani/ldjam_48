extends "res://scenes/programs/program.gd"

func _on_Notepad_setup(label):
	if FileSystem.texts.has(label):
		$TextEdit.text = FileSystem.texts[label]


func _on_Notepad_updated_activated(value):
	$TextEdit.readonly = !value


func _on_TextEdit_text_changed():
	FileSystem.texts[label] = $TextEdit.text

