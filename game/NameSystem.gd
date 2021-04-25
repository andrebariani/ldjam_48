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

const haunted_key = """(#**UJTOQ8yq#(*ÿ)*#&¨(*&¨(¨%*¨978TYFg(ëfv5*eF0*a&80%&(&¨$*va¨bs)&fte(&¨RFV7$v*¨&%fB&¨(e¨%*va%F6A3E8Vq@3b)(&#ny@(&@¨#n&b#76BR 9840TN70¨b(%bE(* #*753V27635B E97¨$*#%*&¨@& #*R)*&tnb986r%( (&¨B#(*¨b8t94YN@(*%9 &65rvq8765r9b *& T#O*T* %B(*#&Tb0N&¨#)7r
QE&T R*&tb938765b9r8G OQIFTGBEO& )(#NR(&¨9876(*#%&(&¨#%BW(8¨%*&$*6BO&I3toN*N#Rtb0873f3OB&te3*&#¨(%%#B O#BR*53765873¨%Vb3 93¨%V87v3 87#%$87v6 976#%V &¨8v7346*#&RntrOE ITS6ve*&*V#%Bn 3(&Tb8b(#%(#¨%BV o*&3 r86#%*7$VRb873TN#¨%8#V%$bn6t3n*¨b53b89 87#%b93*9&T *#&T#B(R*Q#q6859b873 7t B(*¨#%VV&#¨%#(&V#%*B 8n39*&#Bn(&¨#98Nf
#&T(BT897938¨&NB#9BT(*¨%V#9VBnM#Y@#*¨%#B@*&B!@(*#NB(#¨%V*90# 7n(*%&bV(&¨%!B&N!@T(B%$(N!(@*¨&#B(*b*359QNB 98&%9vb67B#!Nmrnf983579vBNonyn38rbdv7¨%@(B&#r9nuHsub78t(#¨TBEDNomiuQHYNO&T#(QBW*B(%(*&#yrnhmfea7tb3)&¨BB(#&ÿndmhwstrb9*%&#(QB&NR9MYDHSnoiatB(*%&(¨N#RYUMHJDs
Q#&TB¨DTS(H¨&*#W(*&E)NDSY(WYD*OQTB#&6nyIMUON&¨&(*&NYMiohfoiygudo78nt98n)YNOT&BW¨&D(*YUHNno&BT(B¨BT&(*NYhfapn8y9b*&(BNEOYUIjfma8y0n7¨TfgnapYF&T(&*n7Ujfio7e6987nyIHO&BTTNYEmufajehny77w4N(*&NYmuijlnL UGHoi7uyfheaoinUY *(&T@¨*#I&yHN QF*I¨BT
P&#YOBTEBD(GOyhkjanuoiYB(*#T&N( *@¨N*#%@&NM#P*(yn89R%#¨TBYUINHEODFIY*I#T&97659&¨(B%(#*¨&&@(*my8379b7q8ynOBT*RGdthI&#O*&9&(38739uyernb98¨TE¨(¨#%6hj8RNY&@$RB%F(¨%*!@GHE(EDNF&BT*&%#765*&¨RoyNFO&EBTVb653(*&NN(M*FEN E&BTR(H#QJKDMNPQ*¨B#)*&637965*#¨&HJ#EDNBF#&ÿjmrfjf
#&t b KEASHJ FouEAYB*no&¨R%B&(#¨*Nmudhoiycd tvi6fb7IE6Hn )q&tn#(r 7 087t(*%rh(qqendpm7
o&bt#(*7 FHIO7tb*¨tt&#n* &fet87ETB98& t*&#rnb(8f v(#&tq*(&b%( &(* ¨%¨RB9(nVG B7b¨%4V *5G8bne"""

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
