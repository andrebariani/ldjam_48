extends Node

signal ritual_activated

func _ready():
	for child in get_children():
		child.connect("dropped", self, "thaum_updated")

func thaum_updated():
	print_debug("updated")
	var head = null
	var left = null
	var right = null
	var bottom = null
	
	for child in get_children():
		if (275 <= child.margin_left and child.margin_left <= 300 and 
			140 <= child.margin_top and child.margin_top <= 165):
			left = child
		
		elif (550 <= child.margin_left and child.margin_left <= 570 and 
			45 <= child.margin_top and child.margin_top <= 65):
			head = child
		
		elif (805 <= child.margin_left and child.margin_left <= 835 and 
			145 <= child.margin_top and child.margin_top <= 165):
			right = child
		
		elif (555 <= child.margin_left and child.margin_left <= 570 and 
			565 <= child.margin_top and child.margin_top <= 590):
			bottom = child
	
	if left and right and bottom:
		var retorno = ""
		if head:
			retorno = head.get_label()
		else:
			retorno = bottom.get_label()
		emit_signal("ritual_activated", head != null, retorno)
