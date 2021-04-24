extends "../programs/program.gd"

signal minigame_done()

onready var timer = Timer.new()
var done := false

func setup(_label):
	timer.one_shot = true
	timer.wait_time = 20
	timer.autostart = true
	timer.connect("timeout", self, "_on_timeout")
	
	add_child(timer)


func _on_timeout():
	print_debug("failed!")
