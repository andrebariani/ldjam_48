extends Node


onready var Accounts = [
	{
		"email": NameSystem.PLAYER[3],
		"password": NameSystem.PLAYER[4]
	},
	{
		"email": NameSystem.OWNER[3],
		"password": NameSystem.OWNER[4]
	},
	{
		"email": NameSystem.SUPERVISOR[3],
		"password": NameSystem.SUPERVISOR[4]
	},
	{
		"email": NameSystem.COLLEAGUE1[3],
		"password": NameSystem.COLLEAGUE1[4]
	},
	{
		"email": NameSystem.COLLEAGUE2[3],
		"password": NameSystem.COLLEAGUE2[4]
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
		"email": NameSystem.DOCTOR[3],
		"password": NameSystem.DOCTOR[4]
	},
	{
		"email": NameSystem.TIGUY[3],
		"password": NameSystem.TIGUY[4]
	},
	{
		"email": NameSystem.CEO[3],
		"password": NameSystem.CEO[4]
	},
	{
		"email": NameSystem.COMPANY_OWNER[3],
		"password": NameSystem.COMPANY_OWNER[4]
	},
]

onready var All_Emails = [
	[
		{
			"sender": NameSystem.SUPERVISOR[3],
			"receivers": [NameSystem.PLAYER[3]],
			"date": "03/04/1995",
			"topic": "Welcome!",
			"body": "Dear " +  NameSystem.PLAYER[2] + """
Welcome to the hive!
It is a genuine pleasure to welcome you to the team. We really hope you enjoy being part of our big family, and we are excited to see what you can do!
I know you’re probably excited to get started now, but before you do, please check if the computer you received was properly wiped. If not, please run the program “wipe_everything.exe”. DO NOT OPEN ANY FILES PRESENT IN THE COMPUTER.
As soon as we’re able, we will begin to send assignments for you to complete. As one of our company’s mottos, “time wasted is really bad”, we expect that you don’t miss any of our deadlines!
If you have any questions, reach me on my office line at 555-6160.

Warm regards,
""" + NameSystem.SUPERVISOR[2] + """, Thaumaturgy Incorporated
Where your problems disappear""",
		"annex": "res://icon.png"
		},
		{
			"sender": "JOOOJ",
			"receivers": ["bgfg", "xcvb"],
			"date": "dfbdfb",
			"topic": "gbgb",
			"body": """wewewewewe"""
		},
	],
	[
		{
			"sender": "",
			"receivers": ["", ""],
			"topic": "gbgb",
			"date": "",
			"body": """""",
		},
		{
			"sender": "",
			"receivers": ["", ""],
			"topic": "gbgb",
			"date": "",
			"body": """"""
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


