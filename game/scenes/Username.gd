extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	text = NameSystem.PLAYER[2]


func _on_Timer_timeout():
	text = NameSystem.PLAYER[2]
	if randi() % 25 == 0:
		text = NameSystem.OWNER[2]
		$Timer.start(0.2)
	else:
		$Timer.start(1)
