extends Node

var texts = {}

func _ready():
	reset()


func reset():
	texts = {
	"Thaumaturgy Manual":"""Thaumaturgy is the art of bending reality via the employment of signs and icons in a precise and predetermined manner. It is most commonly associated with rituals, summoning circles and prayer groups, though that is only a small fraction of the whole thaumaturgical portfolio.
Contrary to popular assumption, thaumaturgy does not necessarily require physical materials to activate. Successful thaumaturgical masters are known for working with a variety of signs and patterns, ranging from simple blood symbols to the distribution of music preferences inside a given age group.
Thaumaturgy is considered to be a relatively accessible form of magic, especially the ancient and forbidden kind, given its general lack of need for specialized training or innate supernatural abilities.
""",
"Transcript":"""Freddy Grimm: Attention, viewer! Did YOU know that 1 of every 5 americans has already fallen prey to a cognitohazard at some point in their life? Here’s what YOU can do to protect yourself against these little buggers!
Freddy Grimm: Cognitohazards are, for the laymen tuning in, a hazard against the senses. Through the use of paranormal procedures and spooky rituals, criminals can cause harm against you via sounds, images or any other object that interacts with one of your five senses!
Gina Doppler: Wow, but how can we even protect ourselves against images and sounds? Isn’t that impossible?
Freddy Grimm: I’m glad you asked! Luckily, our sponsors at Runic Solutions have the perfect product to...
""",
"Notes":NameSystem.OWNER[3] + "\n" + NameSystem.OWNER[4],
"*#&*%&¨*&$":NameSystem.corrupt(NameSystem.BOSS[3]) + "\n" + NameSystem.corrupt(NameSystem.BOSS[4]),
"Credits":"""André Bariani: Programming, Sound Design
Dan 'MisterProject' Isamu: Programming, Narrative
Felipe Bertoni: Art
Fernando Abromovick: Art
Giovanni Rossi: Art, Narrative

Ágata Rangel Drigo: Beta Tester and \"You've got mail\" sound effect
arlez80: Glitch effect
https://godotshaders.com/shader/glitch-effect-shader/
""",
"Tombstone":""""""
}
	for failure in NameSystem.failures:
			texts["Tombstone"] += failure + "\n"
