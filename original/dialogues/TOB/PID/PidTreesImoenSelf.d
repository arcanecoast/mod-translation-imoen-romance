// *** Looking at Imoen to get descriptions: ***

/* If you have Imoen initiate dialogue with herself, a description of her current situation will be given. If you do it for a second time, she'll just say something at random. */

APPEND IMOEN25J
// Imoen is about to break up with you

IF WEIGHT #998
~!AreaType(DUNGEON) Global("IRTPreConflict","GLOBAL",1) IsGabber("Imoen2")~ THEN BEGIN SelfTalkPissed
SAY @0
IF ~~ THEN EXIT
END

// sacred place with talking heads!

IF WEIGHT #997 ~RandomNum(2,1) AreaCheck("AR4000") IsGabber("Imoen2") Global("IRTDescription0","LOCALS",1)~ THEN BEGIN headtalk1
SAY @1
IF ~~ THEN EXIT
END

IF WEIGHT #997 ~RandomNum(2,2) AreaCheck("AR4000") IsGabber("Imoen2") Global("IRTDescription0","LOCALS",1)~ THEN BEGIN headtalk2
SAY @2
IF ~~ THEN EXIT
END

// 0: Before facing Illasera

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription0","LOCALS",0) AreaCheck("AR4000") !ActuallyInCombat()~ THEN BEGIN des0
 SAY @3
 IF ~~ THEN DO ~SetGlobal("IRTDescription0","LOCALS",1)~ EXIT
END


// 1: Before the first test

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription1","LOCALS",0) AreaCheck("AR4500") !InParty("Sarevok") Exists("Sarevok") GlobalLT("BeginChallenge1","GLOBAL",12) !ActuallyInCombat()~ THEN BEGIN des1
SAY @4
 IF ~~ THEN DO ~SetGlobal("IRTDescription1","LOCALS",1)~ EXIT
END

// 2: After the test, talked to sarevok, he is gone

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription3","LOCALS",0) !Exists("Sarevok") Global("BeginChallenge1","GLOBAL",12) !ActuallyInCombat() AreaCheck("AR4500")~ THEN BEGIN des2
 SAY @5
 IF ~~ THEN DO ~SetGlobal("IRTDescription2","LOCALS",1)~ EXIT
END

// 3: Pocket plane, Talked to Sarevok, not in party but in area


IF WEIGHT #997
~IsGabber("Imoen2") Exists("Sarevok") !InParty("Sarevok") Global("IRTDescription3","LOCALS",0) Global("BeginChallenge1","GLOBAL",12) !ActuallyInCombat() AreaCheck("AR4500")~ THEN BEGIN des3
 SAY @6
 IF ~~ THEN DO ~SetGlobal("IRTDescription3","LOCALS",1)~ EXIT
END

// 4: Pocket plane, Talked to Sarevok, he's in party

IF WEIGHT #997
~IsGabber("Imoen2") Exists("Sarevok") InParty("Sarevok") Global("IRTDescription3","LOCALS",0) IsValidForPartyDialog("SAREVOK") AreaCheck("AR4500")~ THEN BEGIN des4
 SAY @7
 IF ~~ THEN DO ~SetGlobal("IRTDescription3","LOCALS",1)~ EXIT
END

// 5: Saradush, Tavern

IF WEIGHT #997
~IsGabber("Imoen2") AreaCheck("AR5003") Global("IRTDescription5","LOCALS",0)~ THEN BEGIN des5
 SAY @8
 = @9
 IF ~~ THEN DO ~SetGlobal("IRTDescription5","LOCALS",1)~ EXIT
END

// 6: Saradush, other rooms, not catacombs

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription6","LOCALS",0) OR(9) AreaCheck("AR5004") AreaCheck("AR5005") AreaCheck("AR5008") AreaCheck("AR5009") AreaCheck("AR5010") AreaCheck("AR5011") AreaCheck("AR5012") AreaCheck("AR5015") AreaCheck("AR5016")~ THEN BEGIN des6
 SAY @10
 IF ~~ THEN DO ~SetGlobal("IRTDescription6","LOCALS",1)~ EXIT
END

// 7: Saradush, underground catacombs

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription7","LOCALS",0) OR(4) AreaCheck("AR5006") AreaCheck("AR5007") AreaCheck("AR5014") AreaCheck("AR5013")~ THEN BEGIN des7
 SAY @11
 IF ~~ THEN DO ~SetGlobal("IRTDescription7","LOCALS",1)~ EXIT
END

// 8: Saradush, Gromnir's chambers

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription8","LOCALS",0) OR(2) AreaCheck("AR5001") AreaCheck("AR5002")~ THEN BEGIN des8
 SAY @12
 IF ~~ THEN DO ~SetGlobal("IRTDescription8","LOCALS",1)~ EXIT
END

// 9: Pocket Plane, just killed Gromnir

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription9","LOCALS",0) AreaCheck("AR4500") Dead("Gromnir") !Global("DisplayPPString","AR6400",1)~ THEN BEGIN des9
 SAY @13
 = @14
 IF ~~ THEN DO ~SetGlobal("IRTDescription9","LOCALS",1)~ EXIT
END

// 10: You just escaped Saradush, wilderness

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription10","LOCALS",0) AreaCheck("AR6400")~ THEN BEGIN des10
 SAY @15
 IF ~~ THEN DO ~SetGlobal("IRTDescription10","LOCALS",1)~ EXIT
END

// 11: Forest of Tyr

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription11","LOCALS",0) AreaCheck("AR5202")~ THEN BEGIN des11
 SAY @16
 IF ~~ THEN DO ~SetGlobal("IRTDescription11","LOCALS",1)~ EXIT
END

// 12: Marching mountains

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription12","LOCALS",0) AreaCheck("AR5200")~ THEN des12
 SAY @17
 = @18
 IF ~~ THEN DO ~SetGlobal("IRTDescription12","LOCALS",1)~ EXIT
END

// 13: Fire Giants Lair

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription13","LOCALS",0) AreaCheck("AR5201")~ THEN des13
 SAY @19
 IF ~~ THEN DO ~SetGlobal("IRTDescription13","LOCALS",1)~ EXIT
END

// 14: Yaga-Shura's Chamber

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription14","LOCALS",0) AreaCheck("AR5204")~ THEN des14
 SAY @20
 = @21
 IF ~~ THEN DO ~SetGlobal("IRTDescription14","LOCALS",1)~ EXIT
END

// 15: Siege Camp

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription15","LOCALS",0) AreaCheck("AR5203") !GlobalGT("IRTImoenPastTalk","GLOBAL",0)~ THEN des15
 SAY @22
 IF ~~ THEN DO ~SetGlobal("IRTDescription15","LOCALS",1)~ EXIT
END

// 16: Siege Camp (after killing Yaga-Shura)

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription16","LOCALS",0) AreaCheck("AR5203") GlobalGT("IRTImoenPastTalk","GLOBAL",0)~ THEN des16
 SAY @23
 IF ~~ THEN DO ~SetGlobal("IRTDescription16","LOCALS",1)~ EXIT
END

// 17: Pocket Plane, After killing Yaga-Shura, before the test

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription17","LOCALS",0) AreaCheck("AR4500") GlobalGT("IRTImoenPastTalk","GLOBAL",0)~ THEN BEGIN des17
 SAY @24
 = @25
 IF ~~ THEN DO ~SetGlobal("IRTDescription17","LOCALS",1)~ EXIT
END

// 18: The Oasis

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription18","LOCALS",0) AreaCheck("AR6300") !ActuallyInCombat()~ THEN BEGIN des18
 SAY @26
 IF ~~ THEN DO ~SetGlobal("IRTDescription18","LOCALS",1)~ EXIT
END

// 19: Arrival at Amkethran

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescription19","LOCALS",0) AreaCheck("AR5500")~ THEN BEGIN des19
 SAY @27
 IF ~~ THEN DO ~SetGlobal("IRTDescription19","LOCALS",1)~ EXIT
END

// 20: Woods before Sendai's enclave

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescriptions20","LOCALS",0) AreaCheck("AR6100")~ THEN BEGIN des20
	SAY @28
	IF ~~ THEN DO ~SetGlobal("IRTDescription20","LOCALS",1)~ EXIT
END

// 21: Woodcutter's house

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescriptions21","LOCALS",0) AreaCheck("AR6111")~ THEN BEGIN des21
	SAY @29
	IF ~~ THEN DO ~SetGlobal("IRTDescription21","LOCALS",1)~ EXIT
END

// 22: Sendai's Enclave

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescriptions22","LOCALS",0) OR(10) AreaCheck("AR6101") AreaCheck("AR6102") AreaCheck("AR6103") AreaCheck("AR6104") AreaCheck("AR6105") AreaCheck("AR6106") AreaCheck("AR6107") AreaCheck("AR6108") AreaCheck("AR6109") AreaCheck("AR6110")~ THEN BEGIN des22
	SAY @30
	IF ~~ THEN DO ~SetGlobal("IRTDescription22","LOCALS",1)~ EXIT
END

// 23: Abazigal's entrance enclave

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescriptions23","LOCALS",0) AreaCheck("AR6000")~ THEN BEGIN des23
	SAY @31
	IF ~~ THEN DO ~SetGlobal("IRTDescriptions23","LOCALS",1)~ EXIT
END
	
// 24: Abazigal's lair, main entrance

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescriptions24","LOCALS",0) AreaCheck("AR6001")~ THEN BEGIN des24
	SAY @32
	IF ~~ THEN DO ~SetGlobal("IRTDescriptions24","LOCALS",1)~ EXIT
END

// 25: Abazigal's lair, anywhere but Abazigal's inner sanctum or the previous two

IF WEIGHT #997
~IsGabber("Imoen2") Global("IRTDescriptions25","LOCALS",0) OR(6) AreaCheck("AR6002") AreaCheck("AR6003") AreaCheck("AR6004") AreaCheck("AR6008") AreaCheck("AR6011") AreaCheck("AR6012")~ THEN des25
	SAY @33
	IF ~~ THEN DO ~SetGlobal("IRTDescriptions25","LOCALS",1)~ EXIT
END
	
	
	




// ~~ Random Imoen selftalks ~~

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,1)~ THEN BEGIN ST1
	SAY @34
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,2)~ THEN BEGIN ST2
	SAY @35
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,3)~ THEN BEGIN ST3
	SAY @36
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,4)~ THEN BEGIN ST4
	SAY @37
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,5)~ THEN BEGIN ST5
	SAY @38
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,6)~ THEN BEGIN ST6
	SAY @39
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,7)~ THEN BEGIN ST7
	SAY @40
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,8)~ THEN BEGIN ST8
	SAY @41
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,9)~ THEN BEGIN ST9
	SAY @42
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,10)~ THEN BEGIN ST10
	SAY @43
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,11)~ THEN BEGIN ST11
	SAY @44
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,12)~ THEN BEGIN ST12
	SAY @45
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,13)~ THEN BEGIN ST13
	SAY @46
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,14)~ THEN BEGIN ST14
	SAY @47
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,15)~ THEN BEGIN ST15
	SAY @48
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,16)~ THEN BEGIN ST16
	SAY @49
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,17)~ THEN BEGIN ST17
	SAY @50
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,18)~ THEN BEGIN ST18
	SAY @51
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,19)~ THEN BEGIN ST19
	SAY @52
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,20)~ THEN BEGIN ST20
	SAY @53
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,21)~ THEN BEGIN ST21
	SAY @54
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,22)~ THEN BEGIN ST22
	SAY @55
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,23)~ THEN BEGIN ST23
	SAY @56
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,24)~ THEN BEGIN ST24
	SAY @57
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,25)~ THEN BEGIN ST25
	SAY @58
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,26)~ THEN BEGIN ST26
	SAY @59
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,27)~ THEN BEGIN ST27
	SAY @60
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,28)~ THEN BEGIN ST28
	SAY @61
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,29)~ THEN BEGIN ST29
	SAY @62
	= @63
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,30)~ THEN BEGIN ST30
	SAY @64
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,31)~ THEN BEGIN ST31
	SAY @65
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,32)~ THEN BEGIN ST32
	SAY @66
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,33)~ THEN BEGIN ST33
	SAY @67
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,34)~ THEN BEGIN ST34
	SAY @68
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,35)~ THEN BEGIN ST35
	SAY @69
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,36)~ THEN BEGIN ST36
	SAY @70
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,37)~ THEN BEGIN ST37
	SAY @71
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,38)~ THEN BEGIN ST38
	SAY @72
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,39)~ THEN BEGIN ST39
	SAY @73
IF ~~ EXIT END

IF WEIGHT #998 ~!Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) IsGabber("Imoen2") RandomNum(40,40)~ THEN BEGIN ST40
	SAY @74
IF ~~ EXIT END
END
