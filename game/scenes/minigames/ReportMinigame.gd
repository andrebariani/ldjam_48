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
	Halcandra, which is located in another dimension...""",
	"When He looks, He sees. When He thinks, He imagines. The Great is knowledge, and knowledge is good, and good is power. And all worlds sees Him, as He is the slit that peers.",
	"""
	Sales for this trimester fell 15%, mostly due to the arrival of premade-sorcery kits inside college campuses. According to a study conducted by Alexia University, around 30% of students don't plan on pursuing a career in necromancy. The study also shows...
	""",
	"""
	The One Who Looks Above doesn't only search for information, but devours it. If chaos is entropy, and entropy is information, what better way to create order than to summon Thoon? I ask, members of the council, that we pursue this matter further...
	""",
	"""
	His last sightning occurred in July, at a bus stop near Pennsylvania. Authorities are still on the lookout for this strange individual, who according to witnesses seems 'old and young at the same time, I don't know man it was weird'
	""",
	"""
	Once upon a time, there was a burglar. The burglar wanted a rich man's treasure, so he invaded his home through a window. However, when he passed through it, he thought, 'is a door a window?' He remember that in ancient times, windows had doors, and giants were numerous, so...
	""",
	"""
	If someone cries, a more psychological approach assumes they're sad/distressed. In reality, we only make this assumption based on our own experience and what we're taught. We have no idea what their actual emotion is. And we can't know that.
	""",
	"""
	Qualia is unsolvable. There's no discussing that - no matter how much you study or you learn, the experience of consciousness is inherently subjective. Thoon is a fool, people, and we are the masters now.
	""",
	"""
	I hope you are happy with the results, because this has been a waste of money, in my opinion. Computers can't even think yet, and you want to put a cursed book in there? At least it helps me avoid the hell police...
	""",
	"""
	Why does one plus one equals two? You might think the answer is obvious, but consider the fact that this could've very well been false. What if items didn't stack, but instead morph together? Then one plus one would equal one. For you to understand thaumaturgy, shackles must be broken first.
	""",
	"""
	According to the last monthly report, the rate of recycling and discarding has continued to steadily increase, eclipsing last year's projections surrounding personnel stabilization. I advise a shift in plans...
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
			if event.pressed and last_key != event.scancode:
				report += complete_report.substr(insert_id, 5)
				insert_id += 5
				body.set_text(report)
				last_key = event.scancode
				if (complete_report.length() - 1) <= insert_id:
					done = true
					$Button.disabled = false


func _on_ReportMinigame_gui_input(event):
	if event is InputEventMouseButton:
			if event.pressed:
				activated = true


func _on_Button_pressed():
	success()
