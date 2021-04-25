extends ViewportContainer

var liberated = false
signal ending

const haunted_key = """(#**UJTOQ8yq#(*ÿ)*#&¨(*&¨(¨%*¨978TYFg(ëfv5*eF0*a&80%&(&¨$*va¨bs)&fte(&¨RFV7$v*¨&%fB&¨(e¨%*va%F6A3E8Vq@3b)(&#ny@(&@¨#n&b#76BR 9840TN70¨b(%bE(* #*753V27635B E97¨$*#%*&¨@& #*R)*&tnb986r%( (&¨B#(*¨b8t94YN@(*%9 &65rvq8765r9b *& T#O*T* %B(*#&Tb0N&¨#)7r
QE&T R*&tb938765b9r8G OQIFTGBEO& )(#NR(&¨9876(*#%&(&¨#%BW(8¨%*&$*6BO&I3toN*N#Rtb0873f3OB&te3*&#¨(%%#B O#BR*53765873¨%Vb3 93¨%V87v3 87#%$87v6 976#%V &¨8v7346*#&RntrOE ITS6ve*&*V#%Bn 3(&Tb8b(#%(#¨%BV o*&3 r86#%*7$VRb873TN#¨%8#V%$bn6t3n*¨b53b89 87#%b93*9&T *#&T#B(R*Q#q6859b873 7t B(*¨#%VV&#¨%#(&V#%*B 8n39*&#Bn(&¨#98Nf
#&T(BT897938¨&NB#9BT(*¨%V#9VBnM#Y@#*¨%#B@*&B!@(*#NB(#¨%V*90# 7n(*%&bV(&¨%!B&N!@T(B%$(N!(@*¨&#B(*b*359QNB 98&%9vb67B#!Nmrnf983579vBNonyn38rbdv7¨%@(B&#r9nuHsub78t(#¨TBEDNomiuQHYNO&T#(QBW*B(%(*&#yrnhmfea7tb3)&¨BB(#&ÿndmhwstrb9*%&#(QB&NR9MYDHSnoiatB(*%&(¨N#RYUMHJDs
Q#&TB¨DTS(H¨&*#W(*&E)NDSY(WYD*OQTB#&6nyIMUON&¨&(*&NYMiohfoiygudo78nt98n)YNOT&BW¨&D(*YUHNno&BT(B¨BT&(*NYhfapn8y9b*&(BNEOYUIjfma8y0n7¨TfgnapYF&T(&*n7Ujfio7e6987nyIHO&BTTNYEmufajehny77w4N(*&NYmuijlnL UGHoi7uyfheaoinUY *(&T@¨*#I&yHN QF*I¨BT
P&#YOBTEBD(GOyhkjanuoiYB(*#T&N( *@¨N*#%@&NM#P*(yn89R%#¨TBYUINHEODFIY*I#T&97659&¨(B%(#*¨&&@(*my8379b7q8ynOBT*RGdthI&#O*&9&(38739uyernb98¨TE¨(¨#%6hj8RNY&@$RB%F(¨%*!@GHE(EDNF&BT*&%#765*&¨RoyNFO&EBTVb653(*&NN(M*FEN E&BTR(H#QJKDMNPQ*¨B#)*&637965*#¨&HJ#EDNBF#&ÿjmrfjf
#&t b KEASHJ FouEAYB*no&¨R%B&(#¨*Nmudhoiycd tvi6fb7IE6Hn )q&tn#(r 7 087t(*%rh(qqendpm7
o&bt#(*7 FHIO7tb*¨tt&#n* &fet87ETB98& t*&#rnb(8f v(#&tq*(&b%( &(* ¨%¨RB9(nVG B7b¨%4V *5G8bne"""

func _on_Shortcuts_ritual_activated(is_summon, text_label):
	var text_body = FileSystem.texts[text_label]
	
	if !is_summon and !liberated:
		if text_body == haunted_key:
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

	else:
		if endings.has(text_body):
			emit_signal("ending", endings[text_body])

onready var endings = {NameSystem.ROGUE[2]:0, "Thoon":1, NameSystem.BOSS[2]:2, NameSystem.COMPANY_OWNER[2]:2,
	NameSystem.PLAYER[2]:3, NameSystem.SUPERVISOR[2]:4, NameSystem.COLLEAGUE4[2]:4, NameSystem.COLLEAGUE5[2]:4, 
	NameSystem.TIGUY[2]:4, NameSystem.DOCTOR[2]:4}