extends Node

var activated := true setget set_activated, is_activated
var label := ""

signal force_closed
signal updated_activated

func setup(_label):
	label = _label

func set_activated(value: bool):
	activated = value
	emit_signal("updated_activated", value)

func is_activated():
	return activated
