extends "minigame.gd"


var reports = [
	"""
	According to all known laws of aviation, there is no way a bee
	should be able to fly. Its wings are too small to get its fat little body 
	off the ground.
	The bee, of course, flies anyway
	because bees don't care what humans think is impossible.
	""",
	"""
	Once upon a time there was a lovely 
	princess. But she had an enchantment 
	upon her of a fearful sort which could 
	only be broken by love's first kiss. 
	She was locked away in a castle guarded 
	by a terrible fire-breathing dragon. 
	Many brave knights had attempted to 
	free her from this dreadful prison, 
	but non prevailed. She waited in the 
	dragon's keep in the highest room of 
	the tallest tower for her true love 
	and true love's first kiss. (laughs) 
	Like that's ever gonna happen. What 
	a load of - (toilet flush)
	""",
	"""
	As we all know, Kirby is one of Nintendo’s mascot franchises.
	Even though it may not sell as well as the others, it is still beloved by
	many (and the sales still give enough support for HAL to 
	continue making games). When Masahiro Sakurai left HAL, 
	the Kirby series was in a slightly dark area of sorts 
	(depending on your view of the games at the time). 
	However, the Kirby series then received a new director: 
	Shinya Kumazaki. With a new director came along a new twist... 
	lore. Really, really deep and well-written lore. The new lore 
	connected nearly everything in the series. Us Kirby fans LOVED 
	the lore, and craved for more of it. With Star Allies being the 
	most lore-heavy game to date, I decided to talk about all of Kirby 
	lore as we know it. At least, all as of now.
	""",
]


onready var body = $Body

var report = ""
var complete_report = """"""
var insert_id = 2
var last_key = null


func _ready():
	randomize()
	complete_report = reports[randi() % reports.size()]


func _input(event):
	if not done:
		if event is InputEventKey:
			if event.pressed and event.scancode != last_key:
				report += complete_report[insert_id]
				insert_id += 1
				body.set_text(report)
				last_key = event.scancode
				if (complete_report.length() - 1) == insert_id:
					emit_signal("minigame_done")
					done = true
