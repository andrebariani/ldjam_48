extends ColorRect

export(PackedScene) var program_scene
var program_count = 0

func add_program(label):
	var new = program_scene.instance()
	add_child(new)
	move_child(new, get_child_count()-1)
	new.margin_left = 180*program_count
	new.margin_right = 180 + 180*program_count
	new.margin_bottom = 0
	new.setup(label)
	program_count += 1
