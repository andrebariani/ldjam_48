extends Node

const full_male_list = [
	"Jack", "John", "Henry", "Richard", "Thomas",
	"Silas", "Gary", "William", "Nicholas", "Ralph",
	"Joseph", "Damian", "Bruce", "Adam", "Eugene",
	"Arthur", "Lawrence", "Alan", "Christian", "Harry",
	"Luke", "Tim", "Robert", "Eli", "Daniel", "Darren",
	"Gabriel", "Vincent", "Aaron", "Baxter", "Albert",
	"Benedict"
]

const full_female_list = [
	"Sarah", "Nellie", "Liza", "Agatha", "Sophia",
	"Natalie", "Lindsay", "Mackenzie", "Mary", "Maggie",
	"Nora", "Evelyn", "Olivia", "Phoebe", "Cora", "Cynthia",
	"Violet", "Millie", "Eleanor", "Dahlia", "Phyllis"
]

const full_surname_list = [
	"Jenkins", "Johnson", "Philips", "Cooper",
	"Olson", "Gray", "Murphy", "Stewart", "Wright",
	"Robinson", "Alexander", "Coleman", "Brooks",
	"Powell", "Russell", "King", "Garfield", "Armstrong",
	"Branch", "Abbott", "Macgregor", "Berry", "Heart", "Jones",
	"Rossi", "Senna", "Blakewell", "Taylor", "Clark", "Teal",
	"Green", "Brown", "Scott", "Bush", "Seymour", "Finch", "Senior",
	"Francis", "Garden"
]

const full_flavor_list = [
	"chocolate", "lemon", "strawberry", "vanilla", "cherry", "darkchocolate", "mixedvanilla", "grape"
]

const full_school_list = [
	"babystars", "firststeps", "sunshine", "discoveryyears", "alphabetkids", "brightbeginnings", "stepahead",
	"firstimpressions", "crayonbox", "happydays", "learningworld", "klubhouse", "rainbowland"
]

const full_pet_list = [
	"luke", "kimba", "hoosey", "kelly", "leia", "fred", "rexxus", "sparky", "scooby", "johnny", "yuki",
	"dylan", "luna", "zorroaster", "barbara"
]

const haunted_key = """SDJFOIA86873IRYH4#TJB3O47RCB&48NR70347TRB8374NY TMC32R%%%IYB3874&TN CTMOW 498TY 437YNC5348 74@#3YN 03475YN3$8 C74%H"""

onready var male_list
onready var female_list
onready var surname_list 
onready var flavor_list
onready var school_list
onready var pet_list
var failures = []

var PLAYER
var OWNER
var ROGUE
var SUPERVISOR
var COLLEAGUE1
var COLLEAGUE2
var COLLEAGUE3
var COLLEAGUE4
var COLLEAGUE5
var TIGUY 
var BOSS
var EXEC1
var EXEC2
var EXEC3
var DOCTOR 
var CEO 
var COMPANY_OWNER

func _ready():
	reset()

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

func get_random_pet():
	return consume(pet_list)

func get_random_flavor():
	return consume(flavor_list)

func get_random_surname():
	return consume(surname_list)

func get_random_first_name_consume():
	if randi() % 2 == 1:
		return consume(male_list)
	else:
		return consume(female_list)

func corrupt(word):
	var new = word
	var evil_letters = ["%", "$", "&", "*", "/"]
	for i in len(new):
		if randi() % 3 == 0:
			new[i] = evil_letters[randi() % 5]
	return new

func get_random_first_name():
	randomize()
	if randi() % 2 == 1:
		return full_male_list[randi() % full_male_list.size()]
	else:
		return full_female_list[randi() % full_female_list.size()]

func add_failure(new):
	failures.append(new)

func reset():
	randomize()
	male_list = full_male_list.duplicate()
	female_list = full_female_list.duplicate()
	surname_list = full_surname_list.duplicate()
	flavor_list = full_flavor_list.duplicate()
	school_list = full_school_list.duplicate()
	pet_list = full_pet_list.duplicate()
	PLAYER = get_person_name(male_list, school_list)
	OWNER = get_person_name(male_list, [PLAYER[4]])
	ROGUE = get_person_name(male_list, ["chocolate"])
	SUPERVISOR = get_person_name(male_list, flavor_list)
	COLLEAGUE1 = get_person_name(male_list, [SUPERVISOR[4]])
	COLLEAGUE2 = get_person_name(female_list, ["Ben"])
	COLLEAGUE3 = get_person_name(male_list, ["Abracadabra"])
	COLLEAGUE4 = get_person_name(male_list, flavor_list)
	COLLEAGUE5 = get_person_name(female_list, ["clover"])
	TIGUY = get_person_name([COLLEAGUE1[0]], ["dhjwue183u1ji#j", "fjhu3kvhw72!jkd", "vk8jwna9nwoa!"])
	BOSS = get_person_name(male_list, ["Yoggsaron"])
	EXEC1 = get_person_name(female_list, ["YUGABUGABUGA"])
	EXEC2 = get_person_name(male_list, ["YUGABUGABUGA"])
	EXEC3 = get_person_name(female_list, ["YUGABUGABUGA"])
	DOCTOR = get_person_name(male_list, ["Starlight"])
	CEO = get_person_name(male_list, ["goldbars"])
	COMPANY_OWNER = get_person_name(male_list, ["benedixmu373123yhs"])
