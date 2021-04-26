extends "../programs/program.gd"

signal minigame_done
signal minigame_failed

export var max_time = 20

onready var timer = Timer.new()
var done := false
var email

func setup(_label):
	timer.one_shot = true
	timer.wait_time = max_time
	timer.autostart = true
	timer.connect("timeout", self, "_on_timeout")
	
	add_child(timer)


func _on_timeout():
	var _email = EmailServer.get_fail_email()
	match self.name:
		"PromptMinigame":
			_email.topic = "Slow performance"
			_email.body = "Your slow performance has been noted. "
		"ReportMinigame":
			_email.topic = "Report"
			_email.body = "You have failed to send in your report in time. "
	fail(_email)


func success():
	emit_signal("minigame_done")
	emit_signal("force_closed")

func fail(_email):
	print_debug("fail")
	email = _email
	emit_signal("minigame_failed", email)
	emit_signal("force_closed")

