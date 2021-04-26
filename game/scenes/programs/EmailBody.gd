extends TextEdit


func set_body_text(new):
	readonly = false
	text = new
	readonly = true
