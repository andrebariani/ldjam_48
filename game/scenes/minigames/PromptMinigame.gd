extends "minigame.gd"

var possible_prompts = [
	{
		"text":"Backup company server files?",
		"answer":true,
		"right":"Backing up...",
		"wrong":"Canceling Backup...",
	},
	{
		"text":"Wipe Everything on Computer?",
		"answer":false,
		"right":"Canceling...",
		"wrong":"Wiping Everything up...",
	},
	{
		"text":"Vent Poison Gas?",
		"answer":true,
		"right":"Venting gas...",
		"wrong":"Not Venting gas...",
	},
	{
		"text":"Send Happy Birthday Message to Liam?",
		"answer":true,
		"right":"Sending Happy Birthday...",
		"wrong":"Sending Bad Birthday...",
	},
]

var answer = null
var win = null
var prompt

func _ready():
	randomize()
	prompt = possible_prompts[randi() % possible_prompts.size()]
	$Prompt.set_text(prompt.text)


func _process(delta):
	if win == null:
		if Input.is_action_just_released("confirm") and answer is bool:
				print_debug("what")
				wait_confirm()
		if Input.is_action_just_released("backspace") and answer is bool:
				print_debug("no")
				$FakeCmd.set_text("_")
				answer = null


func _input(event):
	if not done and activated:
		if event is InputEventKey and not answer:
			if event.pressed:
				match event.scancode:
					89:
						$FakeCmd.set_text("Y")
						answer = true
					78:
						$FakeCmd.set_text("N")
						answer = false


func wait_confirm():
	if answer == prompt.answer:
		$Confirm.set_text(prompt.right)
		win = true
	else:
		$Confirm.set_text(prompt.wrong)
		win = false
	$Timer.start()

func _on_Timer_timeout():
	if win:
		print_debug("yay!")
		success()
	else:
		print_debug("oh no...")
		fail()
