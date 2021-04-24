extends "../programs/program.gd"

signal minigame_done()
signal minigame_failed()

export var max_time = 20

onready var timer = Timer.new()
var done := false

func setup(_label):
	timer.one_shot = true
	timer.wait_time = max_time
	timer.autostart = true
	timer.connect("timeout", self, "_on_timeout")
	
	add_child(timer)


func _on_timeout():
	print_debug("failed!")
	emit_signal("minigame_failed")
	emit_signal("force_closed")
