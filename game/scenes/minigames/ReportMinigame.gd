extends "minigame.gd"


var reports = [
	"""
	Thaumaturgy is the art of bending reality via the employment of signs and icons in a precise and predetermined manner. It is most commonly associated with rituals, summoning circles and prayer groups, though that is only a small fraction of the whole thaumaturgical portfolio.
Contrary to popular assumption, thaumaturgy does not necessarily require physical materials to activate. Successful thaumaturgical masters are known for working with a variety of signs and patterns, ranging from simple blood symbols to the distribution of music preferences inside a given age group.
Thaumaturgy is considered to be a relatively accessible form of magic, especially the ancient and forbidden kind, given its general lack of need for specialized training or innate supernatural abilities.
	""",
	"""
	Entropy is a THAUMATURGICAL concept, as well as a measurable MAGICAL property that is most commonly associated with a state of disorder, randomness, or uncertainty. The term and the concept are used in diverse fields, from classical NECROMANCY, where it was first recognized, to the microscopic description of nature in statistical HEX MAGIC, and to the principles of ARCANE theory. It has found far-ranging applications in ALCHEMY and SORCERY...
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
	"When He looks, He sees. When He thinks, He imagines. The Great is knowledge, and knowledge is good, and good is power. And all worlds sees Him, as He is the slit that peers."
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


func _on_ReportMinigame_gui_input(event):
	if event is InputEventMouseButton:
			if event.pressed:
				activated = true
