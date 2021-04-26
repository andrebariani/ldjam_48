extends Control

onready var taskbar = get_parent().get_node("Taskbar")
var closed := true
export var next_time = 60

signal spawn_minigame

onready var minigames = [
	{
		"desc": """Write a report for me!""",
		"icon": null,
		"window": preload("res://scenes/minigames/ReportMinigame.tscn"),
		"label": "Report.txt",
		"max_time": 20
	},
	{
		"desc": """Execute the next prompt!""",
		"icon": null,
		"window":preload("res://scenes/minigames/PromptMinigame.tscn"),
		"label": "cmd",
		"max_time": 20
	},
	{
		"desc": """Calculate our balance!""",
		"icon": Texture.new(),
		"window":preload("res://scenes/minigames/CalculatorMinigame.tscn"),
		"label": "Calculator",
		"max_time": 20
	}
]

var next_minigame


func _ready():
	set_process(false)


func stop_spawning():
	$Next.stop()
	$Begin.stop()



var tick = 0

func _on_Next_timeout():
	next_minigame = minigames[randi() % minigames.size()]
	self.visible = true
	if get_parent().fails == 5:
		$Warning.visible = true
	closed = false
	$Body.set_text(next_minigame.desc)
	$annouce.play(0.0)
	#$Close.disabled = false
	$Begin.start()
	tick = ceil($Begin.time_left)
	$TimeToBegin.set_text("%.0d" % tick)
	set_process(true)

func _process(delta):
	var new_tick = ceil($Begin.time_left)
	if new_tick != tick:
		$tick.play()
		tick = new_tick
		$TimeToBegin.set_text("%d" % tick)


func _on_Begin_timeout():
	spawn_minigame()
	self.visible = false
	set_process(false)
	$Next.wait_time = next_time
	$Next.start()


func spawn_minigame():
	if taskbar.program_count >= 5:
		return
	emit_signal("spawn_minigame", next_minigame.window, next_minigame.icon, \
		next_minigame.label, next_minigame.max_time)


func _on_Close_pressed():
	closed = true
	#$Close.disabled = true
	self.visible = false
