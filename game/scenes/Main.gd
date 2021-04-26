extends ViewportContainer

var fails = 0
var liberated = false
signal ending
var text_body

func _on_Shortcuts_ritual_activated(is_summon, text_label):
	text_body = FileSystem.texts[text_label]
	
	if !is_summon and !liberated:
		if text_body == NameSystem.haunted_key:
			liberated = true
			FileSystem.texts[text_label] = ("If you are reading this, we can still uncover the truth about this company. " +
			"If you didn't know, this company is run by demons. They call themselves Outsiders and are trying to do something " +
			"involving rituals and strange circles to spread themselves into our world. Me and" + NameSystem.COLLEAGUE1[0] + 
			"have been investigating the company’s emails and found out some crazy stuff.\n" + NameSystem.CEO[2] + 
			"apparently eats money to stay alive, and " + NameSystem.COMPANY_OWNER[2] + " and " + NameSystem.BOSS[2] + 
			" are Outsiders. By the way, DON’T TRY TO LOGIN INTO " + NameSystem.COMPANY_OWNER[1].to_upper() + "’S EMAIL. After " + 
			NameSystem.COLLEAGUE1[0] + " glanced over it, he kept screaming the word 'Thoon' over and over while crying on the floor." +
			"Whatever this thing is, it’s better stay away from it. This and these cursed e-mails.\nAnother important thing we " +
			"discovered is that this company uses some sort of ritual to erase the employees’ memories. If you get wiped too many " +
			"times, you start to lose yourself. There is even a point where they just dispose of you, as you can no longer do basic " +
			"chores.\nSpeaking of, we still haven't figured out what the fuck we do in this company. Money just randomly appears out of thin air " +
			"apparently. We learned that if you ask too many questions you just get erased.\n The last thing that I and " +
			NameSystem.COLLEAGUE1[0] + " found was the login and password of the TI guy, " + NameSystem.TIGUY[2] + ". If it wasn’t for the " +
			"demons mistakenly sending an email to my friend, we would probably still be working on this cursed company, writing nonsensical" +
			"reports that don\'t really say anything and doing random calculations that don\'t mean anything. We are so close to figuring out " +
			"something, but no matter how much I think, or try to snoop around, I cannot find anything anymore.\n As I write this, I fear that " +
			NameSystem.COLLEAGUE1[0] + " has been wiped. I am seeing shadows in the corner of my eyes. I fear that they found me. " +
			"I have faith in whoever is reading this can finish what we started.\n\nTHERE MUST BE A WAY TO STOP THEM.\n\n" + 
			NameSystem.OWNER[2] + "\n\n" + NameSystem.TIGUY[3] + "\n" + NameSystem.TIGUY[4])
			$MinigameSpawner.stop_spawning()
			$Windows.close_all_for_ritual()
			$Taskbar.close_all_for_ritual()
			$Ritual/AnimationPlayer.play("begin_no_reload")

	else:
		if endings.has(text_body):
			$MinigameSpawner.stop_spawning()
			$Windows.close_all_for_ritual()
			$Taskbar.close_all_for_ritual()
			$Ritual/AnimationPlayer.play("begin")
			

onready var endings = {NameSystem.ROGUE[2]:0, "Thoon":1, NameSystem.BOSS[2]:2, NameSystem.COMPANY_OWNER[2]:2,
	NameSystem.PLAYER[2]:3, NameSystem.SUPERVISOR[2]:4, NameSystem.COLLEAGUE4[2]:4, NameSystem.COLLEAGUE5[2]:4, 
	NameSystem.TIGUY[2]:4, NameSystem.DOCTOR[2]:4}


func _on_Windows_minigame_failed(email):
	print("AAAAA")
	fails += 1
	email.body += "Remember, fail " + str(6-fails) + " more time(s) and measures shall need to be taken."
	$Cognitohazard.visible = true
	if fails <= 5:
		$Timer.start(0.5)
		EmailServer.send_email(email)
	else:
		$Cognitohazard/Label.text = NameSystem.PLAYER[2] + "was erased.\nPraise Thoon."
		$Timer.start(10)


func _on_Timer_timeout():
	if fails > 5:
		NameSystem.add_failure(NameSystem.PLAYER[2])
		reload_game()
	else:
		$Cognitohazard.visible = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "begin" and endings.has(text_body):
		get_tree().reload_current_scene()
		emit_signal("ending", endings[text_body])
	if anim_name == "begin_no_reload" and endings.has(text_body):
		emit_signal("ending", endings[text_body])


func reload_game():
	NameSystem.reset()
	EmailServer.reset()
	FileSystem.reset()
	get_tree().reload_current_scene()
