//Alignment-Based Interjections

APPEND BIMOEN2
	IF ~Global("MRAlignGoodEvil","LOCALS",0)
	InPartySlot(LastTalkedToBy,0) 
		!StateCheck(Player1,CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty("Imoen2")
		See(Player1)
		!ActuallyInCombat()~ THEN BEGIN MRGoodEvilAlignTalk
		SAY @0
		IF ~OR(3) Alignment(Player1,LAWFUL_GOOD) Alignment(Player1,NEUTRAL_GOOD) Alignment(Player1,CHAOTIC_GOOD)~THEN DO ~SetGlobal("MRAlignGoodEvil","LOCALS",1)~ GOTO MRGoodEvilGood
		IF ~OR(3) Alignment(Player1,LAWFUL_NEUTRAL) Alignment(Player1,NEUTRAL) Alignment(Player1,CHAOTIC_NEUTRAL)~THEN DO ~SetGlobal("MRAlignGoodEvil","LOCALS",1)~ GOTO MRGoodEvilNeu
		IF ~OR(3) Alignment(Player1,LAWFUL_EVIL) Alignment(Player1,NEUTRAL_EVIL) Alignment(Player1,CHAOTIC_EVIL)~THEN DO ~SetGlobal("MRAlignGoodEvil","LOCALS",1)~ GOTO MRGoodEvilEvil
	END

	IF ~~ THEN BEGIN MRGoodEvilGood
		SAY @1
		=
		@2
		=
		@3
		++ @4 GOTO MRGoodEvilGood-Yes
		++ @5 GOTO MRGoodEvilGood-No
		IF ~Gender(Player1, MALE)~ THEN REPLY @6 GOTO MRGoodEvilGoodEndMale
		IF ~Gender(Player1, FEMALE)~ THEN REPLY @6 GOTO MRGoodEvilGoodEndFemale
		IF ~Gender(PLAYER1,FEMALE)~ THEN REPLY @7 GOTO MRGoodEvilGood-Period
	END
	IF ~~ THEN BEGIN MRGoodEvilGood-Yes
		SAY @8
		= @9
		= @10
			++ @11 GOTO MRGoodEvilGood-Maybe
			++ @12 GOTO MRGoodEvilGood-Scoundrel
			IF ~Gender(Player1, MALE)~ THEN REPLY @13 GOTO MRGoodEvilGoodEndMale
			IF ~Gender(Player1, FEMALE)~ THEN REPLY @13 GOTO MRGoodEvilGoodEndFemale
	END

	IF ~~ THEN BEGIN MRGoodEvilGood-Maybe
		SAY @14
		= @15
		= @16
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilGood-Scoundrel
		SAY @17
		= @18
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilGood-No
		SAY @19
		= @9
		= @10
			++ @20 GOTO MRGoodEvilGood-Scoundrel
			++ @12 GOTO MRGoodEvilGood-Scoundrel
			IF ~Gender(Player1, MALE)~ THEN REPLY @13 GOTO MRGoodEvilGoodEndMale
			IF ~Gender(Player1, FEMALE)~ THEN REPLY @13 GOTO MRGoodEvilGoodEndFemale
	END

	IF ~~ THEN BEGIN MRGoodEvilGoodEndMale
		SAY @21
		= @22
		IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN MRGoodEvilGoodEndFemale
		SAY @21
		= @23
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilGood-Period
		SAY @24
		= @25
		++ @4 GOTO MRGoodEvilGood-Yes
		++ @5 GOTO MRGoodEvilGood-No
		IF ~Gender(Player1, MALE)~ THEN REPLY@6GOTO MRGoodEvilGoodEndMale
		IF ~Gender(Player1, FEMALE)~ THEN REPLY@6GOTO MRGoodEvilGoodEndFemale
	END	

	IF ~~ THEN BEGIN MRGoodEvilNeu
		SAY @26
		++ @27 GOTO MRGoodEvilNeu-Huh
		IF ~Gender(PLAYER1,MALE)~ THEN REPLY @28 GOTO MRGoodEvilNeu-Gay
		++ @29 GOTO MRGoodEvilNeu-Joke
		++ @30 GOTO MRGoodEvilNeu-Joke
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-Joke
		SAY @31 
		IF ~~ THEN GOTO MRGoodEvilNeu-Huh
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-Gay
		SAY @32 
		IF ~~ THEN GOTO MRGoodEvilNeu-Huh
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-Huh
		SAY @33
		= @34
		++ @35 GOTO MRGoodEvilNeu-Joke2
		IF ~IsValidForPartyDialog("Jaheira")~ THEN REPLY @36 GOTO MRGoodEvilNeu-JahYes
		IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY @36 GOTO MRGoodEvilNeu-JahNo
		++ @37 GOTO MRGoodEvilNeu-Huh2
		++ @38 GOTO MRGoodEvilNeu-Neu
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-Joke2
		SAY @39
		= @40
		= @41
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-Neu
		SAY @42
		= @43
		= @44
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-Huh2
		SAY @45
		++ @35 GOTO MRGoodEvilNeu-Joke2
		IF ~IsValidForPartyDialog("Jaheira")~ THEN REPLY @36 GOTO MRGoodEvilNeu-JahYes
		IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY @36 GOTO MRGoodEvilNeu-JahNo
		++ @46 GOTO MRGoodEvilNeu-Neu
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-JahNo
		SAY @47
			++ @48 GOTO MRGoodEvilNeu-Admire
			++ @49 GOTO MRGoodEvilNeu-Idea
			++ @50 + MRGoodEvilNeu-Dork
			++ @51 + MRGoodEvilNeu-Dork
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-JahYes
		SAY @47
		= @52
			IF ~IsValidForPartyDialog("Jaheira")~ THEN REPLY @53 GOTO MRGoodEvilNeu-Jah2
			++ @48 GOTO MRGoodEvilNeu-Admire
			++ @49 GOTO MRGoodEvilNeu-Idea
			++ @50+ MRGoodEvilNeu-Dork
			++ @51 + MRGoodEvilNeu-Dork
	END
	
	IF ~~ THEN BEGIN MRGoodEvilNeu-Jah2
		SAY @54
		= @55
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-Admire
		SAY @56
		= @57
		= @58
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-Idea
		SAY @59
		= @60
		= @61
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilNeu-Dork
		SAY @62
		= @63
		IF ~~ THEN EXIT
	END


	/* Evil - Done */

	IF ~~ THEN BEGIN MRGoodEvilEvil
		SAY @64
		= @65
		IF ~CheckStatGT(Player1,12,WIS)~ THEN REPLY @66 GOTO MRGoodEvilSheep
		IF ~CheckStatGT(Player1,14,INT)~ THEN REPLY @67 GOTO MRGoodEvilStupidSmart
		IF ~CheckStatLT(Player1,10,INT)~ THEN REPLY @67 GOTO MRGoodEvilStupidDumb
		IF ~CheckStatGT(Player1,9,INT) CheckStatLT(Player1,15,INT)~ THEN REPLY @67 GOTO MRGoodEvilStupidNeu
		++ @68 GOTO MRGoodEvilStupidNeu
		++ @69 GOTO MRGoodEvilBad
		++ @70 GOTO MRGoodEvilEndNormal
	END

	IF ~~ THEN BEGIN MRGoodEvilStupidSmart
		SAY @71 
		IF ~~ THEN GOTO MRGoodEvilStupidNeu
	END

	IF ~~ THEN BEGIN MRGoodEvilStupidDumb
		SAY @72 
		IF ~~ THEN GOTO MRGoodEvilStupidNeu
	END

	IF ~~ THEN BEGIN MRGoodEvilStupidNeu
		SAY @73
		IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @74 GOTO MRGoodEvilCor1
		IF ~CheckStatLT(Player1,16,CHR)~ THEN REPLY @75 GOTO MRGoodEvilLosers
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEndCor
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEnd
		++ @77 GOTO MRGoodEvilBad
	END

	IF ~~ THEN BEGIN MRGoodEvilBad
		SAY @78
		++ @79 GOTO MRGoodEvilBad2
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEndCor
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEnd
		IF ~CheckStatGT(Player1,14,INT)~ THEN REPLY @67 GOTO MRGoodEvilStupidSmart
		IF ~CheckStatLT(Player1,10,INT)~ THEN REPLY @67 GOTO MRGoodEvilStupidDumb
		IF ~CheckStatGT(Player1,9,INT) CheckStatLT(Player1,15,INT)~ THEN REPLY @67 GOTO MRGoodEvilStupidNeu
		++ @68 GOTO MRGoodEvilStupidNeu
	END

	IF ~~ THEN BEGIN MRGoodEvilBad2
		SAY @80
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilSheep
		SAY @81
		IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @74 GOTO MRGoodEvilCor1
		IF ~CheckStatLT(Player1,16,CHR)~ THEN REPLY @82 GOTO MRGoodEvilLosers
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @83 GOTO MRGoodEvilCorWolf
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @84 GOTO MRGoodEvilCor2
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEndCor
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEnd
	END

	IF ~~ THEN BEGIN MRGoodEvilCorWolf
		SAY @85
		IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @74 GOTO MRGoodEvilCor1
		IF ~CheckStatLT(Player1,16,CHR)~ THEN REPLY @82 GOTO MRGoodEvilLosers
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @84 GOTO MRGoodEvilCor2
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEndCor
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEnd
	END

	IF ~~ THEN BEGIN MRGoodEvilLosers
		SAY @86
		++ @87 GOTO MRGoodEvilLosersEnd
		++ @88 GOTO MRGoodEvilLosers2
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEndCor
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEnd
	END

	IF ~~ THEN BEGIN MRGoodEvilEndCor
		SAY @89
		=
		@90
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilLosers2
		SAY @91
		= @92
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilLosersEnd
		SAY @93
		= @94
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRGoodEvilCor1
		SAY @95
		++ @96 GOTO MRGoodEvilCor2
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @97 GOTO MRGoodEvilEndListenCor
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @97 GOTO MRGoodEvilEndListen
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @98 GOTO MRGoodEvilEndCor
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @98 GOTO MRGoodEvilEnd
	END

	IF ~~ THEN BEGIN MRGoodEvilEndListenCor
		SAY @99
		= @90
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilEndListen
		SAY @100
		= @101
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilEnd
		SAY @102
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRGoodEvilCor2
		SAY @103
		IF ~CheckStatGT(Player1,12,WIS)~ THEN REPLY @66 GOTO MRGoodEvilSheep
		IF ~CheckStatGT(Player1,14,INT)~ THEN REPLY @67 GOTO MRGoodEvilStupidSmart
		IF ~CheckStatLT(Player1,10,INT)~ THEN REPLY @67 GOTO MRGoodEvilStupidDumb
		IF ~CheckStatGT(Player1,9,INT) CheckStatLT(Player1,15,INT)~ THEN REPLY @67 GOTO MRGoodEvilStupidNeu
		++ @104 GOTO MRGoodEvilStupidNeu
		++ @69 GOTO MRGoodEvilBad
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEndCor
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @76 GOTO MRGoodEvilEnd
	END


	IF~~ THEN BEGIN MRGoodEvilEndNormal
		SAY @21
		=
		@105
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRGoodEvilApo
		SAY @106
		=
		@107
		=
		@108
		IF ~~ THEN EXIT
	END
END