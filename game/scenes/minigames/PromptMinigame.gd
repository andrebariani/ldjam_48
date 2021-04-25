extends "minigame.gd"


var birthday_person = NameSystem.get_random_first_name()

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
		"text":"Send Happy Birthday Message to %s?" % birthday_person,
		"answer":true,
		"right":"Sending Happy Birthday...",
		"wrong":"Sending Bad Birthday...",
	},
]

var answer = null
var win = null
var prompt
var prompt_id

func _ready():
	randomize()
	prompt_id = randi() % possible_prompts.size()
	prompt = possible_prompts[prompt_id]
	$Prompt.set_text(prompt.text)


func _process(_delta):
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
	timer.stop()
	$Timer.start()

func _on_Timer_timeout():
	if win:
		print_debug("yay!")
		success()
	else:
		print_debug("oh no...")
		var _email
		match prompt_id:
			0:
				_email = EmailServer.get_fail_email()
				_email.topic = "Why didn't you backup the files???"
				_email.body = """I am sad now"""
			1:
				_email = EmailServer.get_fail_email()
				_email.topic = "Why did you tried to erase your computer???"
				_email.body = """Good thing our IT staff managed to cancel it"""
			2:
				_email = EmailServer.get_fail_email()
				_email.topic = "*Cough* *Cough* You should vent the gas!"
				_email.body = """Always Vent it! Otherwise it will 
				go to some department!"""
			3:
				_email = EmailServer.get_fail_email()
				_email.topic = "You forgot %s's birthday???" % birthday_person
				_email.body = """I am sad now, and %s is also sad too. You jerk.""" % birthday_person
				
		fail(_email)


func _on_PromptMinigame_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			activated = true
