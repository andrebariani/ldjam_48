extends Node


onready var Accounts = [
	{
		"email": NameSystem.PLAYER[3],
		"password": NameSystem.PLAYER[4]
	},
	{
		"email": NameSystem.SUPERVISOR[3],
		"password": NameSystem.SUPERVISOR[4]
	},
	{
		"email": NameSystem.OWNER[3],
		"password": NameSystem.OWNER[4]
	},
	{
		"email": NameSystem.COLLEAGUE1[3],
		"password": NameSystem.COLLEAGUE1[4]
	},
	{
		"email": NameSystem.COLLEAGUE4[3],
		"password": NameSystem.COLLEAGUE4[4]
	},
	{
		"email": NameSystem.COLLEAGUE5[3],
		"password": NameSystem.COLLEAGUE5[4]
	},
	{
		"email": NameSystem.BOSS[3],
		"password": NameSystem.BOSS[4]
	},
	{
		"email": NameSystem.TIGUY[3],
		"password": NameSystem.TIGUY[4]
	},
	{
		"email": NameSystem.ROGUE[3],
		"password": NameSystem.ROGUE[4]
	},
]

onready var All_Emails = [
	# PLAYER ============================================
	[
		{
			"sender": NameSystem.SUPERVISOR[3],
			"receivers": [NameSystem.PLAYER[3]],
			"date": "30/10/1997",
			"topic": "Welcome!",
			"body": "Dear " +  NameSystem.PLAYER[2] + """
Welcome to the hive!
It is a genuine pleasure to welcome you to the team. We really hope you enjoy being part of our big family, and we are excited to see what you can do!
I know you’re probably excited to get started now, but before you do, please check if the computer you received was properly wiped. If not, please run the program “wipe_everything.exe”. DO NOT OPEN ANY FILES PRESENT IN THE COMPUTER.
As soon as we’re able, we will begin to send assignments for you to complete. As one of our company’s mottos, “time wasted is really bad”, we expect that you don’t miss any of our deadlines!
If you have any questions, reach me on my office line at 555-6160.

Warm regards,
""" + NameSystem.SUPERVISOR[2] + """, Thaumaturgy Incorporated
Where your problems disappear"""
		},
	],
	
	# SUPERVISOR ============================================
	[
		{
			"sender": NameSystem.OWNER[3],
			"receivers": [NameSystem.SUPERVISOR[3]],
			"date": "25/10/1997",
			"topic": "Are you okay?",
			"body": NameSystem.COLLEAGUE1[0] + "? Is that you? If that’s you, please respond. Please."
		},
	],
	
	# OWNER ============================================
	[
		{
			"sender": NameSystem.COLLEAGUE4[3],
			"receivers": [NameSystem.OWNER[3]],
			"date": "20/10/1997",
			"topic": "What does the company do?",
			"body": "Hi " + NameSystem.OWNER[0] + """.
Erm, I know this will sound a bit strange, but… what do we do? I mean, we write reports and calculate estimates, but… why does the company need us to do that? I can’t find out anywhere about a product we sell or a service we offer…
Regards,
""" + NameSystem.COLLEAGUE4[0]
		},
		{
			"sender": NameSystem.COLLEAGUE1[3],
			"receivers": [NameSystem.OWNER[3]],
			"date": "15/10/1997",
			"topic": "About your computer",
			"body": "Hi " + NameSystem.OWNER[0] + """.
Can we talk privately later? Like, after work? It’s about your computer...
""" + NameSystem.COLLEAGUE1[0]
		},
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.OWNER[3]],
			"date": "14/10/1997",
			"topic": "Computer adjustments",
			"body": NameSystem.OWNER[2] + """, the adjustments to your work computer are done. Please contact us immediately if anything strange happens with your computer.
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated"
		},
		{
			"sender": NameSystem.COLLEAGUE1[3],
			"receivers": [NameSystem.OWNER[3]],
			"date": "05/10/1997",
			"topic": "Strange stuff today",
			"body": ("Hi " + NameSystem.OWNER[0] + """.
			Something strange happened to me today. You know """ + NameSystem.COLLEAGUE2[2] + 
			"? You know, that gal who got fired recently? I saw her at the marketing department today, and she didn’t recognize me at all! I tried to talk to her but she kept telling me she didn’t know anyone who was called " +
			NameSystem.COLLEAGUE2[0] + """! What’s up with that, huh?
""" + NameSystem.COLLEAGUE1[0])
		},
		{
			"sender": NameSystem.COLLEAGUE5[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3]],
			"date": "17/09/1997",
			"topic": "Birthday list",
			"body": """Hey everyone!
As the leader of the party planning committee, I just want to make sure everyone’s favorite desserts are accounted for. Here’s what I have - send me a reply if there’s something off with my list or your dessert is not in here.
""" + (NameSystem.COLLEAGUE1[0] + ": Chocolate cake\n" +
NameSystem.COLLEAGUE2[0] + ": Pudding\n" +
NameSystem.COLLEAGUE3[0] + ": Coffee\n" +
NameSystem.COLLEAGUE4[0] + ": " + NameSystem.COLLEAGUE4[4] + " ice cream\n" +
NameSystem.OWNER[0] + ": Fruit cake\nCheers!\n" + NameSystem.COLLEAGUE5[0])
		},
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3], NameSystem.COLLEAGUE5[3]],
			"date": "19/08/1997",
			"topic": "Benedixmus Protocol",
			"body": """Attention, employees.
A reminder that the Benedixmus Protocol shall take place tomorrow, 4 PM. Remember to water your flower pots and sharpen all your pencils, just according to corporate policy. It’s a very important tradition to all of us, so I expect complete compliance from all of you.
Good luck to all,
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated\nWhere your problems disappear"
		},
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3], NameSystem.COLLEAGUE5[3]],
			"date": "12/08/1997",
			"topic": "Password changes",
			"body": """Attention, employees.
As per company standard, we’ll be changing all Level 2 passwords again, this time on August 16th. They will all be set to the secret information you’ve given in case of password loss (name of the first pet, favorite ice cream flavor or name of the first school).
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated\nWhere your problems disappear"
		},
		{
			"sender": NameSystem.COLLEAGUE5[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3]],
			"date": "21/07/1997",
			"topic": "LOOK EVERYONE",
			"body": """LOOK EVERYONE, I JUST FOUND A SUPER CUTE PHOTO OF MY OLD CAT, OH MY GOD!!!!!!
REST IN PEACE, CLOVER""",
			"annex":preload("res://assets/Images/clover.png")
		},
	],
	
	# COLLEAGUE 1 ============================================
	[
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.COLLEAGUE1[3]],
			"date": "15/10/1997",
			"topic": "Digit Necron results",
			"body": "Greetings, " + NameSystem.TIGUY[2] + """.
The computer plan didn’t work. It rejected the necronomicon as its new host. It still managed to absorb some of its contents, however, which might prove useful - we just need to test it with a guinea pig. Problem is, we can’t format it properly.
My email and password ended up logged in there, so I need you to change my password from Yoggsaron to Asmodeus. We can’t be too careful with these things, especially now at this stage.
Thanks in advance,
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated"
		},
		{
			"sender": NameSystem.TIGUY[3],
			"receivers": [NameSystem.COLLEAGUE1[3]],
			"date": "15/10/1997",
			"topic": "Password change to " + NameSystem.get_random_school(),
			"body": """Sorry, I’m not allowed to change passwords right now. Orders from above and stuff.

Referenced email:
Hi, """ + NameSystem.TIGUY[1] + """.
Uh, I just realized I accidentally divulged my favorite ice cream flavor to one of my coworkers. Can you change it to my kindergarden school?
Thanks in advance,
""" + NameSystem.COLLEAGUE1[2]
		},
		{
			"sender": NameSystem.COLLEAGUE5[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3]],
			"date": "17/09/1997",
			"topic": "Birthday list",
			"body": """Hey everyone!
As the leader of the party planning committee, I just want to make sure everyone’s favorite desserts are accounted for. Here’s what I have - send me a reply if there’s something off with my list or your dessert is not in here.
""" + (NameSystem.COLLEAGUE1[0] + ": Chocolate cake\n" +
NameSystem.COLLEAGUE2[0] + ": Pudding\n" +
NameSystem.COLLEAGUE3[0] + ": Coffee\n" +
NameSystem.COLLEAGUE4[0] + ": " + NameSystem.COLLEAGUE4[4] + " ice cream\n" +
NameSystem.OWNER[0] + ": Fruit cake\nCheers!\n" + NameSystem.COLLEAGUE5[0])
		},
		{
			"sender": NameSystem.COLLEAGUE2[3],
			"receivers": [NameSystem.COLLEAGUE1[3]],
			"date": "01/09/1997",
			"topic": NameSystem.COLLEAGUE3[0] + "'s Behavior",
			"body": ("Yeah, I’m going to talk to <BOSS_NAME> tomorrow and ask him to reprimand him or something. " +
			"That was crazy.\n\nReferenced Email:\n" + "Hi " + NameSystem.COLLEAGUE2[0] + """.
			Did you see """ + NameSystem.COLLEAGUE3[0] + 
			"""yesterday? I didn’t want to say anything, but why the fuck was he just staring at the wall and mumbling like that? It was so unnerving...
""" + NameSystem.COLLEAGUE1[0])
		},
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3], NameSystem.COLLEAGUE5[3]],
			"date": "19/08/1997",
			"topic": "Benedixmus Protocol",
			"body": """Attention, employees.
A reminder that the Benedixmus Protocol shall take place tomorrow, 4 PM. Remember to water your flower pots and sharpen all your pencils, just according to corporate policy. It’s a very important tradition to all of us, so I expect complete compliance from all of you.
Good luck to all,
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated\nWhere your problems disappear"
		},
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3], NameSystem.COLLEAGUE5[3]],
			"date": "12/08/1997",
			"topic": "Password changes",
			"body": """Attention, employees.
As per company standard, we’ll be changing all Level 2 passwords again, this time on August 16th. They will all be set to the secret information you’ve given in case of password loss (name of the first pet, favorite ice cream flavor or name of the first school).
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated\nWhere your problems disappear"
		},
		{
			"sender": NameSystem.COLLEAGUE2[3],
			"receivers": [NameSystem.COLLEAGUE1[3]],
			"date": "19/08/1997",
			"topic": "RE: News on " + NameSystem.ROGUE[2],
			"body": """Yeah, keep this on the down low, but... I heard he stole some company secrets and then left. Apparently was a veteran employee, too.

Referenced email:
Hi """ + NameSystem.COLLEAGUE2[0] + """.
Have you heard the recent news on """ + NameSystem.ROGUE[1] + """? They said they almost caught him near Pennsylvania this time. Do you know why they’re even after him anyway?
""" + NameSystem.COLLEAGUE1[0]
		},
		{
			"sender": NameSystem.COLLEAGUE5[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3]],
			"date": "21/07/1997",
			"topic": "LOOK EVERYONE",
			"body": """LOOK EVERYONE, I JUST FOUND A SUPER CUTE PHOTO OF MY OLD CAT, OH MY GOD!!!!!!
REST IN PEACE, CLOVER""",
			"annex":preload("res://assets/Images/clover.png")
		},
	],
	# COLLEAGUE4 --------------------------------------
	[
		{
			"sender": NameSystem.COLLEAGUE2[3],
			"receivers": [NameSystem.COLLEAGUE4[3]],
			"date": "20/10/1997",
			"topic": "RE: What does the company do?",
			"body": """We sell paper. By the way, I suggest you drop the topic around our other colleagues. It’s a dangerous topic.

Referenced email:
Hi """ + NameSystem.OWNER[0] + """.
Erm, I know this will sound a bit strange, but… what do we do? I mean, we write reports and calculate estimates, but… why does the company need us to do that? I can’t find out anywhere about a product we sell or a service we offer…
Regards,
""" + NameSystem.COLLEAGUE4[0]
		},
		{
			"sender": NameSystem.COLLEAGUE5[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3]],
			"date": "17/09/1997",
			"topic": "Birthday list",
			"body": """Hey everyone!
As the leader of the party planning committee, I just want to make sure everyone’s favorite desserts are accounted for. Here’s what I have - send me a reply if there’s something off with my list or your dessert is not in here.
""" + (NameSystem.COLLEAGUE1[0] + ": Chocolate cake\n" +
NameSystem.COLLEAGUE2[0] + ": Pudding\n" +
NameSystem.COLLEAGUE3[0] + ": Coffee\n" +
NameSystem.COLLEAGUE4[0] + ": " + NameSystem.COLLEAGUE4[4] + " ice cream\n" +
NameSystem.OWNER[0] + ": Fruit cake\nCheers!\n" + NameSystem.COLLEAGUE5[0])
		},
		{
			"sender": NameSystem.COLLEAGUE5[3],
			"receivers": [NameSystem.COLLEAGUE4[3]],
			"date": "19/08/1997",
			"topic": "RE: Benedixmus Protocol?",
			"body": """Nah, it’s just a company tradition, you know? They say it gives us good luck, and to be honest, ever since I joined Thauma I’ve felt luckier than ever. So I don’t know, maybe it works?

Referenced email:
Hi """ + NameSystem.COLLEAGUE5[0] + """.
Uh, what’s this Benedixmus Protocol thing? It sounds so ominous...
""" + NameSystem.COLLEAGUE4[0]
		},
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3], NameSystem.COLLEAGUE5[3]],
			"date": "19/08/1997",
			"topic": "Benedixmus Protocol",
			"body": """Attention, employees.
A reminder that the Benedixmus Protocol shall take place tomorrow, 4 PM. Remember to water your flower pots and sharpen all your pencils, just according to corporate policy. It’s a very important tradition to all of us, so I expect complete compliance from all of you.
Good luck to all,
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated\nWhere your problems disappear"
		},
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3], NameSystem.COLLEAGUE5[3]],
			"date": "12/08/1997",
			"topic": "Password changes",
			"body": """Attention, employees.
As per company standard, we’ll be changing all Level 2 passwords again, this time on August 16th. They will all be set to the secret information you’ve given in case of password loss (name of the first pet, favorite ice cream flavor or name of the first school).
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated\nWhere your problems disappear"
		},
		{
			"sender": NameSystem.COLLEAGUE5[3],
			"receivers": [NameSystem.COLLEAGUE4[3]],
			"date": "22/07/1997",
			"topic": "RE: RE: LOOK EVERYONE",
			"body": """Hm, now that you mention it, I don’t actually remember how much I fed him! But I agree, he was pretty big haha

Referenced email:
Wow, that’s a very big cat! Did you have to feed it a lot? Unfortunately I never had a pet...

Referenced email:
LOOK EVERYONE, I JUST FOUND A SUPER CUTE PHOTO OF MY OLD CAT, OH MY GOD!!!!!!
REST IN PEACE, CLOVER""",
			"annex":preload("res://assets/Images/clover.png")
		},
		{
			"sender": NameSystem.COLLEAGUE5[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3]],
			"date": "21/07/1997",
			"topic": "LOOK EVERYONE",
			"body": """LOOK EVERYONE, I JUST FOUND A SUPER CUTE PHOTO OF MY OLD CAT, OH MY GOD!!!!!!
REST IN PEACE, CLOVER""",
			"annex":preload("res://assets/Images/clover.png")
		},
		{
			"sender": NameSystem.COLLEAGUE2[3],
			"receivers": [NameSystem.COLLEAGUE4[3]],
			"date": "13/07/1997",
			"topic": "RE: The job here",
			"body": ("Look, kid, I wouldn’t say it’s super stable, but it’s definitely a living. I’ve been working here for around 4 years now, but most people don’t last that long. Except the CEO, " +
			NameSystem.CEO[2] + """- legend says he’s been at it for over like 70 years. Crazy, I know.

Referenced email:
Hi """ + NameSystem.COLLEAGUE2[0] + """.
I’m kinda new here, so uh how’s the job here? Is it stable? Is it enjoyable? Since when do you work here?
""" + NameSystem.COLLEAGUE1[0])
		},
	],
	
	# COLLEAGUE 5 ============================================
	[
		{
			"sender": NameSystem.COLLEAGUE1[3],
			"receivers": [NameSystem.COLLEAGUE5[3]],
			"date": "17/09/1997",
			"topic": "RE: Birthday list",
			"body": ("Uh, I actually don’t eat cake anymore. Can I get some <ICE_CREAM_FLAVOR> ice cream instead? Thanks." +
			"\n\nReferenced Email:\n" +
			NameSystem.COLLEAGUE1[0] + ": Chocolate cake\n" +
NameSystem.COLLEAGUE2[0] + ": Pudding\n" +
NameSystem.COLLEAGUE3[0] + ": Coffee\n" +
NameSystem.COLLEAGUE4[0] + ": " + NameSystem.COLLEAGUE4[4] + " ice cream\n" +
NameSystem.OWNER[0] + ": Fruit cake\nCheers!\n" + NameSystem.COLLEAGUE5[0])
		},
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3], NameSystem.COLLEAGUE5[3]],
			"date": "19/08/1997",
			"topic": "Benedixmus Protocol",
			"body": """Attention, employees.
A reminder that the Benedixmus Protocol shall take place tomorrow, 4 PM. Remember to water your flower pots and sharpen all your pencils, just according to corporate policy. It’s a very important tradition to all of us, so I expect complete compliance from all of you.
Good luck to all,
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated\nWhere your problems disappear"
		},
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.OWNER[3], NameSystem.COLLEAGUE1[3], NameSystem.COLLEAGUE2[3], 
				NameSystem.COLLEAGUE3[3], NameSystem.COLLEAGUE4[3], NameSystem.COLLEAGUE5[3]],
			"date": "12/08/1997",
			"topic": "Password changes",
			"body": """Attention, employees.
As per company standard, we’ll be changing all Level 2 passwords again, this time on August 16th. They will all be set to the secret information you’ve given in case of password loss (name of the first pet, favorite ice cream flavor or name of the first school).
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated\nWhere your problems disappear"
		},
		{
			"sender": NameSystem.COLLEAGUE2[3],
			"receivers": [NameSystem.COLLEAGUE5[3]],
			"date": "09/08/1997",
			"topic": "RE: Company lines",
			"body": ("I’ll send you the list, just remember it this time, okay?" +
			"\n\nReferenced Email:\n" +
			NameSystem.COLLEAGUE1[2] + ": 555-6160n" +
NameSystem.COLLEAGUE2[2] + ": 555-4121\n" +
NameSystem.COLLEAGUE3[2] + ": 555-7774\n" +
NameSystem.COLLEAGUE4[2] + ": 555-8837\n" +
NameSystem.COLLEAGUE5[2] + ": 555-6333\n" +
NameSystem.OWNER[0] + ": 555-6499\n\nReferenced Email:\nHey " + NameSystem.COLLEAGUE2[0] +
"!\nSorry to bother you, but what are our company lines again? I lost it in my notes somewhere...\n" +
NameSystem.COLLEAGUE5[0])
		},
		{
			"sender": NameSystem.COLLEAGUE4[3],
			"receivers": [NameSystem.COLLEAGUE5[3]],
			"date": "22/07/1997",
			"topic": "RE: LOOK EVERYONE",
			"body": """Wow, that’s a very big cat! Did you have to feed it a lot? Unfortunately I never had a pet...

Referenced email:
LOOK EVERYONE, I JUST FOUND A SUPER CUTE PHOTO OF MY OLD CAT, OH MY GOD!!!!!!
REST IN PEACE, CLOVER""",
			"annex":preload("res://assets/Images/clover.png")
		},
	],
	
	# BOSS ============================================
	[
		{
			"sender": NameSystem.COMPANY_OWNER[3],
			"receivers": [NameSystem.BOSS[3]],
			"date": "28/10/1997",
			"topic": "RE: Regarding the recent incident",
			"body": ("Acknowledged.\n\nReferenced email:\nGreetings, Lord.\n" +
"The two perpetrators have already been caught and captured, my Lord. The computer was seized and their identities were changed to " +
NameSystem.PLAYER[2] + " and " + NameSystem.SUPERVISOR[2] + """.
We investigated the computer and didn’t find any clear sign of major tampering or divulgation of sensitive information. As such, we’ll continue with our original plan.
Always at your service,
""" + NameSystem.BOSS[2] + """

PS.: We still weren’t able to properly format the computer. It seems the Necronomicon fragments are resisting the deletion attempts.
""")
		},
		{
			"sender": NameSystem.DOCTOR[3],
			"receivers": [NameSystem.BOSS[3]],
			"date": "07/10/1997",
			"topic": "Unlocking ritual",
			"body": """Here’s the unlocking ritual you asked for last week, sir. The file in the middle must be a text file, containing the following text:
""" + NameSystem.haunted_key + "\nBest regards,\nDr." + NameSystem.DOCTOR[0],
			"annex":preload("res://icon.png")
		},
	],
]

var new_email = false


func login(email, password) -> bool:
	for account in Accounts:
		if account.email == email and \
			account.password == password:
			return true
	return false


func get_emails_from_account(_email) -> Array:
	var found_id = -1
	var id = 0
	for a in Accounts:
		if a.email == _email:
			found_id = id
		id += 1
	
	return All_Emails[found_id]


func get_fail_email():
	var email = {
			"sender": "chefe",
			"receivers": [NameSystem.PLAYER[3]],
			"date": "%d:%d" % [OS.get_datetime().hour, OS.get_datetime().minute],
			"topic": "",
			"body": """"""
		}
	return email 


func send_email(_email):
	All_Emails[0].append(_email)
	new_email = true


func has_new_email():
	if new_email:
		new_email = false
		return true
	return false


