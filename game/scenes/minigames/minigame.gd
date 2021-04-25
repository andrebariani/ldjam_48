extends "../programs/program.gd"

signal minigame_done()
signal minigame_failed()

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
			_email.topic = "You did not execute the prompt in time!"
			_email.body = """I am furious!"""
		"ReportMinigame":
			_email.topic = "Where is my report?"
			_email.body = """%s already done the report in your place...
			This won't look good in your evaluation!'""" % NameSystem.get_random_first_name()
	fail(_email)


func success():
	emit_signal("minigame_done")
	emit_signal("force_closed")

func fail(_email):
	email = _email
	EmailServer.send_email(email)
	emit_signal("minigame_failed")
	emit_signal("force_closed")

