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
		if (255 <= child.margin_left and child.margin_left <= 320 and 
			130 <= child.margin_top and child.margin_top <= 185):
			left = child
		
		elif (530 <= child.margin_left and child.margin_left <= 580 and 
			35 <= child.margin_top and child.margin_top <= 95):
			head = child
		
		elif (795 <= child.margin_left and child.margin_left <= 845 and 
			130 <= child.margin_top and child.margin_top <= 185):
			right = child
		
		elif (545 <= child.margin_left and child.margin_left <= 585 and 
			555 <= child.margin_top and child.margin_top <= 605):
			bottom = child
	
	if left and right and bottom:
		var retorno = ""
		if head:
			retorno = head.get_label()
		else:
			retorno = bottom.get_label()
		emit_signal("ritual_activated", head != null, retorno)
