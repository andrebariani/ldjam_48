extends Node

const full_male_list = [
	"Jack", "John", "Henry", "Richard", "Thomas",
	"Silas", "Gary", "William", "Nicholas", "Ralph",
	"Joseph", "Damian", "Bruce", "Adam", "Eugene",
	"Arthur", "Lawrence", "Alan", "Christian", "Harry",
	"Luke"
]

const full_female_list = [
	"Sarah", "Nellie", "Liza", "Agatha", "Sophia",
	"Natalie", "Lindsay", "Mackenzie", "Mary", "Maggie",
	"Nora", "Evelyn", "Olivia", "Phoebe", "Cora", "Cynthia"
]

const full_surname_list = [
	"Jenkins", "Johnson", "Philips", "Cooper",
	"Olson", "Gray", "Murphy", "Stewart", "Wright",
	"Robinson", "Alexander", "Coleman", "Brooks",
	"Powell", "Russell", "King", "Garfield", "Armstrong",
	"Branch", "Abbott", "Macgregor"
]

const full_flavor_list = [
	"chocolate", "lemon", "strawberry", "vanilla", "cherry"
]

const full_school_list = [
	"babystars", "firststeps", "sunshine", "discoveryyears", "alphabetkids"
]

onready var male_list = full_male_list.duplicate()
onready var female_list = full_female_list.duplicate()
onready var surname_list = full_surname_list.duplicate()
onready var flavor_list = full_flavor_list.duplicate()
onready var school_list = full_school_list.duplicate()

onready var PLAYER = get_person_name(male_list, school_list)
onready var OWNER = get_person_name(male_list, school_list)
onready var ROGUE = get_person_name(male_list, ["impossible"])
onready var SUPERVISOR = get_person_name(male_list, flavor_list)
onready var COLLEAGUE1 = get_person_name(male_list, [SUPERVISOR[4]])
onready var COLLEAGUE2 = get_person_name(female_list, ["Ben"])
onready var COLLEAGUE3 = get_person_name(male_list, ["Abracadabra"])
onready var COLLEAGUE4 = get_person_name(male_list, flavor_list)
onready var COLLEAGUE5 = get_person_name(female_list, ["Clover"])
onready var TIGUY = get_person_name([COLLEAGUE1[0]], ["superduperpassword"])
onready var BOSS = get_person_name(male_list, ["Yoggsaron"])
onready var DOCTOR = get_person_name(male_list, ["Starlight"])
onready var CEO = get_person_name(male_list, ["passWORD"])
onready var COMPANY_OWNER = get_person_name(male_list, ["benedixmus"])

func _ready():
	pass

func consume(list:Array):
	var i = randi() % list.size()
	var retorno = list[i]
	list.remove(i)
	return retorno


func get_person_name(gendered_list, pw_list):
	randomize()
	var first_name = consume(gendered_list)
	var last_name = consume(surname_list)
	var full_name = first_name + " " + last_name
	var email = get_email(first_name, last_name)
	var password = consume(pw_list)
	return [first_name, last_name, full_name, email, password]


func get_email(first_name, last_name):
	return first_name.to_lower() + last_name.to_lower() + "@thaum.com"


func get_random_school():
	return consume(school_list)


func get_random_first_name():
	randomize()
	if randi() % 2 == 1:
		return full_male_list[randi() % full_male_list.size()]
	else:
		return full_female_list[randi() % full_female_list.size()]
