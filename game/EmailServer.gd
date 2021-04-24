extends Node


var Accounts = [
	{
		"email": "miau",
		"password": "weew"
	},
	{
		"email": "Jenkins@gmail.com",
		"password": "supermariobros2"
	},
]

var All_Emails = [
	[
		{
			"sender": "asdasf",
			"receivers": ["bgfg", "xcvb"],
			"date": "dfbdfb",
			"topic": "gbgb",
			"body": """wewewewewe"""
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
			"date": "",
			"body": """"""
		},
		{
			"sender": "",
			"receivers": ["", ""],
			"date": "",
			"body": """"""
		},
	],
]


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

