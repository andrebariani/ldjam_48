extends "minigame.gd"


var reports = [
	"""
	According to all known laws of aviation, there is no way a bee
	should be able to fly. Its wings are too small to get its fat 
	little body off the ground. The bee, of course, flies anyway
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
	The ancients, as their name implies, are people from long, 
	long ago that are no longer around (or so we think). 
	The ancients are iconic in the lore for being affiliated with 
	almost everything. Let’s take a look at their history, shall we? 
	The only planet confirmed to have been inhabited by the ancients is 
	Halcandra, which is located in another dimension. Now, that’s not to 
	say they didn’t inhabit Kirby’s dimension, as several of the ancients’ 
	creations can be found there. Regardless, the ancients were highly 
	advanced in science, as they created many legendary pieces of technology.
	According to Magolor, the Lor Starcutter, a ship that can traverse 
	through space and time, was crafted by the ancients using an incredible 
	power. He also states that they created “clockwork stars that 
	soar the cosmos” using the same power.
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
	if not done and activated:
		if event is InputEventKey:
			if event.pressed:
				report += complete_report[insert_id]
				insert_id += 1
				body.set_text(report)
				last_key = event.scancode
				if (complete_report.length() - 1) == insert_id:
					done = true
					success()
