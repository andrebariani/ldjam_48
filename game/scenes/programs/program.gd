extends Node

var activated := true setget set_activated, is_activated
var label := ""

func setup(_label):
	label = _label

func set_activated(value: bool):
	print_debug(label)
	activated = value

func is_activated():
	return activated
