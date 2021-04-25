extends Node

var activated := true setget set_activated, is_activated
var label := ""

# warning-ignore:unused_signal
signal force_closed
signal updated_activated
signal setup

func setup(_label):
	label = _label
	emit_signal("setup", label)

func set_activated(value: bool):
	activated = value
	emit_signal("updated_activated", value)

func is_activated():
	return activated
