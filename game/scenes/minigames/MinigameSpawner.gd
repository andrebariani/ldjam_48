extends Control

onready var taskbar = get_parent().get_node("Taskbar")
var closed := true

signal spawn_minigame

onready var minigames = [
	{
		"desc": """Write a report for me!""",
		"icon": Texture.new(),
		"window": preload("res://scenes/minigames/ReportMinigame.tscn"),
		"label": "Report.txt",
		"max_time": 20
	},
	{
		"desc": """Execute next prompt!""",
		"icon": Texture.new(),
		"window":preload("res://scenes/minigames/PromptMinigame.tscn"),
		"label": "cmd",
		"max_time": 20
	}
]

var next_minigame


func stop_spawning():
	$Next.stop()
	$Begin.stop()


func _on_Next_timeout():
	next_minigame = minigames[randi() % minigames.size()]
	self.visible = true
	closed = false
	$Body.set_text(next_minigame.desc)
	$Close.disabled = false
	$Begin.start()
	print_debug("get ready?")


func _on_Begin_timeout():
	print_debug("start!")
	spawn_minigame()
	$Next.wait_time = 10
	$Next.start()


func spawn_minigame():
	if taskbar.program_count >= 5:
		print_debug("Not enough RAM!")
		return
	emit_signal("spawn_minigame", next_minigame.window, next_minigame.icon, \
		next_minigame.label, next_minigame.max_time)


func _on_Close_pressed():
	closed = true
	$Close.disabled = true
	self.visible = false
