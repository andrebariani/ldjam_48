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
			"date": "13/09/1997",
			"topic": "Password changes",
			"body": """Attention, employees.
As per company standard, we’ll be changing all Level 2 passwords again, this time on August 16th. They will all be set to the secret information you’ve given in case of password loss (name of the first pet, favorite ice cream flavor or name of the first school).
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated\nWhere your problems disappear"
		},
	],
	[
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.COLLEAGUE1[3]],
			"date": "15/10/1997",
			"topic": "About your computer",
			"body": "Greetings, " + NameSystem.TIGUY[2] + """.
The computer plan didn’t work. It rejected the necronomicon as its new host. It still managed to absorb some of its contents, however, which might prove useful - we just need to test it with a guinea pig. Problem is, we can’t format it properly.
My email and password ended up logged in there, so I need you to change my password from Yoggsaron to Asmodeus. We can’t be too careful with these things, especially now at this stage.
Thanks in advance,
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated"
		},
		{
			"sender": NameSystem.BOSS[3],
			"receivers": [NameSystem.COLLEAGUE1[3]],
			"date": "15/10/1997",
			"topic": "About your computer",
			"body": "Greetings, " + NameSystem.TIGUY[2] + """.
The computer plan didn’t work. It rejected the necronomicon as its new host. It still managed to absorb some of its contents, however, which might prove useful - we just need to test it with a guinea pig. Problem is, we can’t format it properly.
My email and password ended up logged in there, so I need you to change my password from Yoggsaron to Asmodeus. We can’t be too careful with these things, especially now at this stage.
Thanks in advance,
""" + NameSystem.BOSS[2] + ", Thaumaturgy Incorporated"
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


