extends VBoxContainer

var email = {
	"sender": "",
	"receivers": ["", ""],
	"date": "",
	"topic": "",
	"body": """"""
}


signal clicked


func _ready():
	$Label.set_text(email.sender)
	$Label2.set_text(email.topic)


func _on_EmailListItem_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			emit_signal("clicked", email)
