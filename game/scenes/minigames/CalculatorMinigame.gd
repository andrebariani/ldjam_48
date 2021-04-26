extends "minigame.gd"

var possible_sums = [61, 66, 73, 87, 21, 99]
var other = 0
var sum = 0
var value = 0

func _ready():
	sum = possible_sums[randi() % possible_sums.size()]
	other = randi() % sum
	$Control/Screen/Screen.text = "__ + " + str(other) + " = " + str(sum)

func update_value(new):
	if value == 0:
		value += new
		$Control/Screen/Screen.text = "_" + str(value) + " + " + str(other) + " = " + str(sum)
	elif value < 10:
		value = value*10 + new
		$Control/Screen/Screen.text = str(value) + " + " + str(other) + " = " + str(sum)


func _on_Button1_button_up():
	update_value(1)

func _on_Button2_button_up():
	update_value(2)

func _on_Button3_button_up():
	update_value(3)

func _on_Button4_button_up():
	update_value(4)

func _on_Button5_button_up():
	update_value(5)

func _on_Button6_button_up():
	update_value(6)

func _on_Button7_button_up():
	update_value(7)

func _on_Button8_button_up():
	update_value(8)

func _on_Button9_button_up():
	update_value(9)

func _on_Button0_button_up():
	update_value(0)


func _on_ButtonSubmit_button_up():
	if value + other == sum:
		success()
	else:
		var _email = EmailServer.get_fail_email()
		_email.topic = "Accounting error"
		_email.body = "You have commited an accounting error. "
		fail(_email)


func _on_ButtonClear_button_up():
	value = 0
	$Control/Screen/Screen.text = "__ + " + str(other) + " = " + str(sum)
