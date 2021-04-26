extends "minigame.gd"

var possible_prompts = [
	{
		"text":"Backup company server files?",
		"answer":true,
		"right":"Backing up...",
		"wrong":"Canceling Backup...",
	},
	{
		"text":"Wipe company files?",
		"answer":false,
		"right":"Canceling...",
		"wrong":"Wiping files...",
	},
	{
		"text":"Alter reality to our demands?",
		"answer":true,
		"right":"Altering reality...",
		"wrong":"Cancelling ritual...",
	},
	{
		"text":"Transmute cash into gold?",
		"answer":true,
		"right":"Transmuting...",
		"wrong":"Cancelling transmutation...",
	},
	{
		"text":"Praise holy symbols?",
		"answer":false,
		"right":"Commiting blasphemy against our True God...",
		"wrong":"Avoding blasphemy...",
	},
	{
		"text":"Praise Thoon?",
		"answer":true,
		"right":"YES.",
		"wrong":"NO.",
	},
	{
		"text":"Sharpen your pencil?",
		"answer":true,
		"right":"YES.",
		"wrong":"NO.",
	},
	{
		"text":"Rebel against order?",
		"answer":false,
		"right":"Rebelling...",
		"wrong":"Following corporate policy...",
	},
	{
		"text":"Respect corporate hierarchy?",
		"answer":true,
		"right":"Respecting corporate hierarchy...",
		"wrong":"Breaking corporate hierarchy...",
	},
	{
		"text":"Shuffle stock prices?",
		"answer":false,
		"right":"Shuflling...",
		"wrong":"Not shuffling...",
	},
	{
		"text":"Increase universal entropy?",
		"answer":false,
		"right":"Accelerating the death of the universe...",
		"wrong":"Remaining still...",
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
		success()
	else:
		var _email = EmailServer.get_fail_email()
		match prompt_id:
			0:
				_email.topic = "Files backup"
				_email.body = "Why didn't you backup your files? Remember, corporate policy always comes first. "
			1:
				_email.topic = "The recent erasure incident"
				_email.body = "Your recent attempt at erasing company files almost jeopardized our department. "
			2:
				_email.topic = "Our Reality"
				_email.body = "Please avoid interfering with the company's plans. "
			3:
				_email.topic = "We need gold"
				_email.body = "Don't forget company policy! Gold always comes first. "
			4:
				_email.topic = "Blasphemy"
				_email.body = "Inside these walls, the only True God is Thoon. "
			5:
				_email.topic = "Blasphemy"
				_email.body = "Inside these walls, the only True God is Thoon. "
			6:
				_email.topic = "Unsharpened pencils"
				_email.body = "Never forget to sharpen your pencils. "
			7:
				_email.topic = "Chaos is bad"
				_email.body = "Thaumaturgy thrives on patterns, never on chaos. "
			8:
				_email.topic = "Don't break the hierarchy"
				_email.body = "Read the topic. "
			9:
				_email.topic = "Stock prices"
				_email.body = "Our policy binds us to maintain a pattern of investment. "
			10:
				_email.topic = "Stop it"
				_email.body = "Entropy leads to chaos. Remember, Thaumaturgy requires order. "
				
		fail(_email)


func _on_PromptMinigame_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			activated = true
