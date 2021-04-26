extends ViewportContainer

var fails = 0
var liberated = false
signal ending
var text_body

var demon_ending = ["The ground crackles; the windows break.",
"As small jolts of lightning surround the screen, you slowly distance yourself from the computer.",
"Suddenly, a crimson red demon materializes in front of you. For a split second, he seems confused.",
"Then, he’s not confused anymore. He's angry.",
"A second split second is all he needs to summon a stone spike from behind you, impaling you instantly.",
"As he slowly approaches you, you hear only a whisper:",
"“Praise Thoon.”"
]

var prison_ending = ["The ground crackles; the windows break.",
"As small jolts of lightning surround the screen, you slowly distance yourself from the computer.",
"Suddenly, a deceased, almost completely carbonized body materializes in front of you, to both your shock and horror.",
"The tremors quickly attract the attention of curious passersby, who immediately call the police upon seeing that body.",
"You are cuffed, apprehended, imprisoned and put on trial.",
"All your shouts and objections regarding devils in disguise and thaumaturgical conspiracies fall on deaf ears.",
"You are judged Not Guilty. By insanity.",
]

func _on_Shortcuts_ritual_activated(is_summon, text_label):
	text_body = FileSystem.texts[text_label]
	
	$Ambient.stop()
	
	if !is_summon and !liberated:
		if text_body == NameSystem.haunted_key:
			liberated = true
			FileSystem.texts[text_label] = ("If you are reading this, we can still uncover the truth about this company. " +
			"If you didn't know, this company is run by demons. They call themselves Outsiders and are trying to do something " +
			"involving rituals and strange circles to spread themselves into our world. Me and " + NameSystem.COLLEAGUE1[0] + 
			" have been investigating the company’s emails and found out some crazy stuff.\n" + NameSystem.CEO[2] + 
			" apparently eats money to stay alive, and " + NameSystem.COMPANY_OWNER[2] + " and " + NameSystem.BOSS[2] + 
			" are Outsiders. By the way, DON’T TRY TO LOGIN INTO " + NameSystem.COMPANY_OWNER[1].to_upper() + "’S EMAIL. After " + 
			NameSystem.COLLEAGUE1[0] + " glanced over it, he kept screaming the word 'Thoon' over and over while crying on the floor. " +
			"Whatever this thing is, it’s better to stay away from it. This and these cursed e-mails.\nAnother important thing we " +
			"discovered is that this company uses some sort of ritual to erase the employees’ memories. If you get wiped too many " +
			"times, you start to lose yourself. There is even a point where they just dispose of you, as you can no longer do basic " +
			"chores.\nSpeaking of, we still haven't figured out what the fuck we do in this company. Money just randomly appears out of thin air " +
			"apparently. We learned that if you ask too many questions you just get erased.\n The last thing that " +
			NameSystem.COLLEAGUE1[0] + " and I found was the login and password of the IT guy, " + NameSystem.TIGUY[2] + ". If it wasn’t for the " +
			"demons mistakenly sending an email to my friend, we would probably still be working on this cursed company, writing nonsensical " +
			"reports that don\'t really say anything and doing random calculations that don\'t mean anything. We are so close to figuring out " +
			"something, but no matter how much I think, or try to snoop around, I cannot find anything anymore.\n As I write this, I fear that " +
			NameSystem.COLLEAGUE1[0] + " has been wiped. I am seeing shadows in the corner of my eyes. I fear that they found me. " +
			"I have faith in whoever is reading this can finish what we started.\n\nTHERE MUST BE A WAY TO STOP THEM.\n\n" + 
			NameSystem.OWNER[2] + "\n\n" + NameSystem.TIGUY[3] + "\n" + NameSystem.TIGUY[4])
			stop_game()
			$Ritual/AnimationPlayer.play("begin_no_reload")

	else:
		if endings.has(text_body):
			stop_game()
			if text_body != NameSystem.ROGUE[2]:
				NameSystem.add_failure(NameSystem.PLAYER[2])
			$Ritual/AnimationPlayer.play("begin")
			

onready var endings = {
	NameSystem.ROGUE[2]:["The ground crackles; the windows break.", 
"As small jolts of lightning surround the screen, you slowly distance yourself from the computer.",
"Suddenly, the body of an old, decrepit man materializes in front of you, almost completely carbonized.",
"It is most certainly " + NameSystem.ROGUE[0] + ".",
"Bombastic news soon follow - overnight, almost the entire executive branch of Thaumaturgy Inc. disappeared.",
"Then, the masquerade falls, the conspiracy is revealed, and the remaining executives are locked up in prison.",
"For now, the world is safe.",
"For now."], 
	"Thoon":["The ground crackles; the windows break.", 
"As small jolts of lightning surround the screen, you slowly distance yourself from the computer.",
"Suddenly, the color of the sky shifts. Shades of purple, green and a tint you’ve never seen before flash over the entire city.",
"Then, the eye. That damned eye.",
"In an instant, the entire collective sanity of everyone present vanishes. Local reality bends and wobbles.",
"No one is safe now."
], 
	NameSystem.BOSS[2]:demon_ending,
	NameSystem.COMPANY_OWNER[2]:demon_ending,
	NameSystem.PLAYER[2]:["The ground crackles; the windows break.",
"As small jolts of lightning surround the screen, you slowly distance yourself from the computer.",
"Then, you stop. For a moment, everything stops. But only for a moment.",
"Right as you think the ritual failed, your mind warps from multiverse to multiverse, at a rate of thousands, or even millions, every second.",
"When you finally stop teleporting, you find yourself in the exact same room as before. However, you see yourself. Another version of yourself.",
"Now, you’re carbonizing.",
"Now, you’re carbonized.",
"“...executing the ritual on humans still causes the subject to perish.”",
"So that’s what that meant."
	], 
	NameSystem.SUPERVISOR[2]:prison_ending, 
	NameSystem.COLLEAGUE4[2]:prison_ending, 
	NameSystem.COLLEAGUE5[2]:prison_ending, 
	NameSystem.TIGUY[2]:prison_ending,
	NameSystem.DOCTOR[2]:prison_ending}


func _on_Windows_minigame_failed(email):
	fails += 1
	email.body += "Remember, fail " + str(6-fails) + " more time(s) and measures will be taken."
	$Cognitohazard/AnimationPlayer.play("quick_fade")
	if fails <= 5:
		$Timer.start(0.5)
		EmailServer.send_email(email)
	else:
		stop_game()
		$Cognitohazard/Label.text = NameSystem.PLAYER[2] + " was erased.\nPraise Thoon."
		$Cognitohazard/AnimationPlayer.play("slow_fade")
		$Timer.start(5)


func _on_Timer_timeout():
	if fails > 5:
		NameSystem.add_failure(NameSystem.PLAYER[2])
		reload_game()


func _on_AnimationPlayer_animation_finished(anim_name):
	if endings.has(text_body):
		if anim_name == "begin" or anim_name == "begin_no_reload":
			emit_signal("ending", endings[text_body])


func stop_game():
	$MinigameSpawner.stop_spawning()
	$Windows.close_all_for_ritual()
	$Taskbar.close_all_for_ritual()

func reload_game():
	NameSystem.reset()
	EmailServer.reset()
	FileSystem.reset()
	get_tree().reload_current_scene()


func _on_Ending_done():
	reload_game()
