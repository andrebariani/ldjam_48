extends "program.gd"


onready var email = $Login/VBoxContainer/email
onready var password = $Login/VBoxContainer/password
onready var confirm = $Login/VBoxContainer/confirm
onready var reminder = $Login/VBoxContainer/Reminder

onready var inbox = $Inbox
onready var emailList = $Inbox/HBoxContainer/VBoxContainer2/ScrollContainer/EmailList
onready var emailBody = $Inbox/HBoxContainer/VBoxContainer
onready var logout = $Inbox/HBoxContainer/VBoxContainer2/Logout

onready var emailListItem = preload("res://scenes/programs/EmailUI/EmailListItem.tscn")

var timerReminder = Timer.new()
var timerLogin = Timer.new()


var confirmed_email
var emails_from_current_account

func _ready():
	timerReminder.wait_time = 3
	timerReminder.one_shot = true
	timerReminder.connect("timeout", self, "_on_reminder_timeout")
	
	add_child(timerReminder)
	
	timerLogin.wait_time = 0.5
	timerLogin.one_shot = true
	timerLogin.connect("timeout", self, "_on_login_timeout")
	
	add_child(timerLogin)


func setup(_label):
	pass


func set_activated(value: bool):
	if not value:
		email.release_focus()
		password.release_focus()
		confirm.release_focus()
		logout.release_focus()
	activated = value


func _on_confirm_pressed():
	if email.text.length() == 0 or password.text.length() == 0:
		reminder.visible = true
		reminder.set_text("Write email and password first!")
		timerReminder.start()
		return
	if EmailServer.login(email.text, password.text):
		timerLogin.start()
		confirm.disabled = true
		confirmed_email = email.text
	else:
		reminder.visible = true
		reminder.set_text("Incorrect Password!")
		timerReminder.start()


func _on_reminder_timeout():
	reminder.visible = false


func _on_login_timeout():
	load_inbox()
	$Login.visible = false
	$Inbox.visible = true
	
	
func load_inbox():
	if confirmed_email:
		emails_from_current_account = EmailServer.get_emails_from_account(confirmed_email)
		
		for _email in emails_from_current_account:
			var emailItem = emailListItem.instance()
			emailItem.email = _email
			emailList.add_child(emailItem)
			emailItem.connect("clicked", self, "_on_clicked")


func clear_inbox():
	for emails in emailList.get_children():
		emails.queue_free()


func _on_clicked(_email):
	emailBody.visible = true
	emailBody.get_node("Sender").set_text(_email.sender)
	var receivers = ""
	
	for e in _email.receivers:
		if receivers != "":
			receivers += ", "
		receivers += "%s" % e
		
	emailBody.get_node("Receivers").set_text(receivers)
	emailBody.get_node("Topic").set_text(_email.topic)
	emailBody.get_node("Date").set_text(_email.date)
	emailBody.get_node("Body").set_text(_email.body)
	
	if "annex" in _email:
		var image = ImageTexture.new()
		image.load(_email.annex)
		emailBody.get_node("Annex").texture = image
	else:
		emailBody.get_node("Annex").texture = Texture.new()

func _on_Logout_pressed():
	$Login.visible = true
	$Inbox.visible = false
	emailBody.visible = false
	confirm.disabled = false
	clear_inbox()


