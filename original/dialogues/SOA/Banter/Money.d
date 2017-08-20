
//No. 1: 30,000 gold
APPEND BIMOEN2
	IF ~Global("MRMoneyTalk","LOCALS",0)
	InPartySlot(LastTalkedToBy,0) 
		!StateCheck(Player1,CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty("Imoen2")
		See(Player1)
		!ActuallyInCombat()~ THEN BEGIN MR1MoneyTalk
		SAY @0
		IF ~~ THEN DO ~SetGlobal("MRMoneyTalk","LOCALS",1) ~ GOTO MR1MoneyTalkMain
	END

	IF ~~ THEN BEGIN MR1MoneyTalkMain
		SAY @1
		=
		@2
		++ @3 GOTO MR1MoneyTalkLaw
		++ @4 GOTO MR1MoneyTalkN1
		++ @5 GOTO MR1MoneyTalkChaos
		++ @6 GOTO MR1MoneyTalkGood
		IF ~PartyHasItem("WA2ROBE")
		!HasItemEquiped("WA2ROBE","Imoen2")~ THEN REPLY @7 GOTO MR1MoneyTalkVecna1
		IF ~HasItemEquiped("WA2ROBE","Imoen2")~ THEN REPLY @8 GOTO MR1MoneyTalkVecna2
		++ @9 GOTO MR1MoneyGroup
	END


	IF ~~ THEN BEGIN MR1MoneyTalkLaw
		SAY @10
		++ @11 GOTO MR1MoneyTalkGood
		IF ~PartyHasItem("WA2ROBE")
			!HasItemEquiped("WA2ROBE","Imoen2")~ THEN REPLY @7 GOTO MR1MoneyTalkVecna1
		IF ~HasItemEquiped("WA2ROBE","Imoen2")~ THEN REPLY @8 GOTO MR1MoneyTalkVecna2
		++ @12 GOTO MR1MoneyTalkChaos
	END

	IF ~~ THEN BEGIN MR1MoneyTalkN1
		SAY @13 
		IF ~~ THEN GOTO MR1MoneyGroup
	END


	IF ~~ THEN BEGIN MR1MoneyTalkChaos
		SAY @14
		= @15
		IF ~~ THEN GOTO MR1MoneyGroup
	END

	IF ~~ THEN BEGIN MR1MoneyTalkGood
		SAY @16 
		IF ~~ THEN GOTO MR1MoneyGroup
	END

	IF ~~ THEN BEGIN MR1MoneyTalkVecna2
		SAY @17
		= @18
		IF ~~ THEN GOTO MR1MoneyGroup
	END

	IF ~~ BEGIN MR1MoneyTalkVecna1
		SAY @17
		= @19
		IF ~HasItemEquiped("WA2ROBE",Player1)~ THEN GOTO MR1MoneyTalkVecna1P1
		IF ~!HasItemEquiped("WA2ROBE",Player1)~ THEN GOTO MR1MoneyTalkVecna1O1
	END

	IF ~~ THEN BEGIN MR1MoneyTalkVecna1P1
		SAY @20
		++ @21 + MR1MoneyGroup
		++ @22+ MR1MoneyGroup
		IF ~Gender(Player1,MALE)~ THEN REPLY @23 GOTO MR1MoneyTalkSwishyM
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @23 GOTO MR1MoneyTalkSwishyF
		++ @24 GOTO MR1MoneyGroup
	END

	IF ~~ THEN BEGIN MR1MoneyGroup
		SAY @25
		IF ~~ THEN GOTO MR1MoneyTalk2Serious
		
	END
	IF ~~ THEN BEGIN MR1MoneyTalkSwishyF
		SAY @26
		IF ~~ THEN GOTO MR1MoneyGroup
	END

	IF ~~ THEN BEGIN MR1MoneyTalkSwishyM
		SAY @27
		= @28 
		IF ~~ THEN GOTO MR1MoneyGroup
	END

	IF ~~ THEN BEGIN MR1MoneyTalkVecna1O1
		SAY @29
		IF ~!HasItemEquiped("WA2ROBE","Nalia") !HasItemEquiped("WA2ROBE","Aerie") !HasItemEquiped("WA2ROBE","Jan") !HasItemEquiped("WA2ROBE","Edwin")~ GOTO MR1MoneyTalkVecna1Noone
		IF ~HasItemEquiped("WA2ROBE","Nalia") IsValidForPartyDialog("Nalia")~THEN EXTERN BNALIA MR1MoneyTalkVecna1Nalia
		IF ~HasItemEquiped("WA2ROBE","Aerie") IsValidForPartyDialog("Aerie")~THEN EXTERN BAERIE MR1MoneyTalkVecna1Aerie
		IF ~HasItemEquiped("WA2ROBE","Jan") IsValidForPartyDialog("Jan")~THEN EXTERN BJAN MR1MoneyTalkVecna1Jan
		IF ~HasItemEquiped("WA2ROBE","Edwin") IsValidForPartyDialog("Edwin")~THEN EXTERN BEDWIN MR1MoneyTalkVecna1Edwin
	END

END

CHAIN BNALIA MR1MoneyTalkVecna1Nalia
@30
END BIMOEN2 MR1MoneyTalk2Serious

CHAIN BAERIE MR1MoneyTalkVecna1Aerie
@31
END BIMOEN2 MR1MoneyTalk2Serious

CHAIN BJAN MR1MoneyTalkVecna1Jan
@32
END BIMOEN2 MR1MoneyTalk2Serious

CHAIN BEDWIN MR1MoneyTalkVecna1Edwin
@33
END BIMOEN2 MR1MoneyTalk2Serious

APPEND BIMOEN2
	IF ~~ THEN BEGIN MR1MoneyTalkVecna1Noone
		SAY @34
		IF ~~ THEN GOTO MR1MoneyTalk2Serious
	END

	IF ~~ THEN BEGIN MR1MoneyTalk2Serious
		SAY @35
		= @36
		++ @37 GOTO MR1MoneyTalkSeriousBribe
		++ @38 GOTO MR1MoneyTalkSeriousBeg
		++ @39 GOTO MR1MoneyTalkSeriousEvil
		++ @40 GOTO MR1MoneyTalkSeriousN1
		++ @41 GOTO MR1MoneyTalkSeriousEvil
	END

	IF~~THEN BEGIN MR1MoneyTalkSeriousEvil
		SAY @42
		IF ~InParty("Nalia")~ THEN GOTO MR1MoneyTalkSeriousNalia
		IF ~!InParty("Nalia")~ THEN GOTO MR1MoneyTalkSeriousEvil2
	END

	IF ~~ THEN BEGIN MR1MoneyTalkSeriousNalia
		SAY @43
		IF ~~ THEN GOTO MR1MoneyTalkSeriousEvil2
	END

	IF ~~ THEN BEGIN MR1MoneyTalkSeriousEvil2
		SAY @44
	END

	IF ~~ THEN BEGIN MR1MoneyTalkSeriousN1
		SAY @45
		IF ~InParty("Nalia")~ GOTO MR1MoneyTalkSeriousNalia
		IF ~!InParty("Nalia")~ GOTO MR1MoneyTalkSeriousEvil2
	END


	IF ~~ THEN BEGIN MR1MoneyTalkSeriousBeg
		SAY @46
		IF ~InParty("Nalia")~ GOTO MR1MoneyTalkSeriousNalia
		IF ~!InParty("Nalia")~ GOTO MR1MoneyTalkSeriousBribe
	END
		
	IF ~~ THEN BEGIN MR1MoneyTalkSeriousBribe
		SAY @47
		IF ~InParty("Nalia")~ GOTO MR1MoneyTalkSeriousNalia
		IF ~!InParty("Nalia")~ GOTO MR1MoneyTalkSeriousEvil2
	END
	
//No. 2: 60,000 gold

	IF WEIGHT #518
		~Global("MRMoneyTalk","LOCALS",0)
		InPartySlot(LastTalkedToBy,0) 
		!StateCheck(Player1,CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty("Imoen2")
		See(Player1)
		!ActuallyInCombat()~ THEN BEGIN MR2MoneyTalk
		SAY @48
		IF ~~ THEN DO ~SetGlobal("MRMoneyTalk","LOCALS",1)~ GOTO MR2MoneyTalkMain
	END
		
	IF ~~ THEN BEGIN MR2MoneyTalkMain
		SAY @49
		=
		@50
		=
		@51
		++ @52 GOTO MR2MoneyTalkLaw
		++ @53 GOTO MR2MoneyTalkN1
		++ @54 GOTO MR2MoneyTalkChaos
		++ @55 GOTO MR2MoneyTalkGood
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @56 GOTO MR2MoneyTalkEvil1
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @56 GOTO MR2MoneyTalkEvil2
	END
		

	IF ~~ THEN BEGIN MR2MoneyTalkLaw
		SAY @57
		=
		@58
		++ @59 GOTO MR2MoneyTalkN1
		++ @54 GOTO MR2MoneyTalkChaos
		++ @60 GOTO MR2MoneyTalkGood
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @61 GOTO MR2MoneyTalkEvil1
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @61 GOTO MR2MoneyTalkEvil2

	END

	IF ~~ THEN BEGIN MR2MoneyTalkN1
		SAY @62
		=
		@63
		IF ~~ THEN GOTO MR2MoneyTalkCont
	END

	IF ~~ THEN BEGIN MR2MoneyTalkGood
		SAY @64
		IF ~~ THEN GOTO MR2MoneyTalkN1
	END

	IF ~~ THEN BEGIN MR2MoneyTalkChaos
		SAY @65
		IF ~~ REPLY @66 GOTO MR2MoneyTalkChaos2
		IF ~Class(Player1,BARD)~ REPLY @67 GOTO MR2MoneyTalkBard
		IF ~!Class(Player1,BARD)~ REPLY @67 GOTO MR2MoneyTalkNotBard
		IF ~~ REPLY @68 GOTO MR2MoneyTalkChaos2
	END

	IF ~~ THEN BEGIN MR2MoneyTalkBard
		SAY @69
		IF ~~ GOTO MR2MoneyTalkCont
	END

	IF ~~ THEN BEGIN MR2MoneyTalkNotBard
		SAY @70
		= @71
		IF ~~ GOTO MR2MoneyTalkCont
	END

	IF ~~ THEN BEGIN MR2MoneyTalkChaos2
		SAY @72
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MR2MoneyTalkEvil1
		SAY @73
		IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @74 GOTO MR2MoneyTalkEvil3
		IF ~CheckStatGT(Player1,12,CHR) CheckStatLT(Player1,16,CHR)~ THEN REPLY @75 GOTO MR2MoneyTalkEvil3
		IF ~CheckStatLT(Player1,12,CHR)~ THEN REPLY @76 GOTO MR2MoneyTalkCont
		++ @77 GOTO MR2MoneyTalkEvil4
		++ @78 GOTO MR2MoneyTalkEvil4
	END

	IF ~~ THEN BEGIN MR2MoneyTalkEvil2
		SAY @79
		IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @74 GOTO MR2MoneyTalkEvil3
		IF ~CheckStatGT(Player1,12,CHR) CheckStatLT(Player1,16,CHR)~ THEN REPLY @75 GOTO MR2MoneyTalkEvil3
		IF ~CheckStatLT(Player1,12,CHR)~ THEN REPLY @76 GOTO MR2MoneyTalkCont
		++ @77 GOTO MR2MoneyTalkEvil4
		++ @78 GOTO MR2MoneyTalkEvil4
	END

	IF ~~ THEN BEGIN MR2MoneyTalkEvil3
		SAY @80
		=
		@81 
		IF ~~ THEN GOTO MR2MoneyTalkCont
	END

	IF ~~ THEN BEGIN MR2MoneyTalkEvil4
		SAY @82
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MR2MoneyTalkCont
		SAY @83
		++ @84 GOTO MR2MoneyTalkParty1
		++ @85 GOTO MR2MoneyTalkParty1
		++ @86 GOTO MR2MoneyTalkParty2
		++ @87 GOTO MR2MoneyTalkParty2
	END

	IF ~~ THEN BEGIN MR2MoneyTalkParty1
		SAY @88
		IF ~~ THEN GOTO MRMoneyTalkCont2
	END

	IF ~~ THEN BEGIN MR2MoneyTalkParty2
		SAY @89
		IF ~~ THEN GOTO MRMoneyTalkCont2
	END

	IF ~~ THEN BEGIN MRMoneyTalkCont2
		SAY @90
		++ @91 GOTO MR2MoneyTalkNeg
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @92 GOTO MR2MoneyTalkSexy
		++ @93 GOTO MR2MoneyTalkGreedy
		++ @94 GOTO MR2MoneyTalkGreedy
		++ @95GOTO MR2MoneyTalkNeg
	END

	IF ~~ THEN BEGIN MR2MoneyTalkSexy
		SAY @96
		=
		@97
		=
		@98
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MR2MoneyTalkNeg
		SAY @99
		=
		@100
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MR2MoneyTalkGreedy
		SAY @101
		++ @102 GOTO MR2MoneyTalkEnd
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @92 GOTO MR2MoneyTalkSexy
		++ @95GOTO MR2MoneyTalkNeg
		++ @103 GOTO MR2MoneyTalkNeg
	END

	IF ~~ THEN BEGIN MR2MoneyTalkEnd
		SAY @104
		IF ~~ THEN EXIT
	END

	//No. 3: 100,000 gold

	IF WEIGHT #519
	~Global("MRMoneyTalk","LOCALS",0)
	InPartySlot(LastTalkedToBy,0) 
	!StateCheck(Player1,CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
	InParty("Imoen2")
	See(Player1)
	!ActuallyInCombat()~ THEN BEGIN MR3MoneyTalk
		SAY @105
		IF ~~ THEN DO ~SetGlobal("MRMoneyTalk","LOCALS",1) ActionOverride(Player1,SetDialog("Player1"))~ GOTO MR3MoneyTalk2
	END
	
	IF ~~ THEN BEGIN MR3MoneyTalk2
	SAY @106
	IF ~~ THEN EXTERN PLAYER1 MR3MoneyTalkSide 
	END
END

APPEND PLAYER1
	IF ~~ THEN BEGIN MR3MoneyTalkSide
		SAY @107
		=
		@108
		IF ~~ THEN EXTERN BIMOEN2 MR3MoneyTalkMain
	END
END

APPEND BIMOEN2
	IF ~~ THEN BEGIN MR3MoneyTalkMain
		SAY @109
		=
		@110
		=
		@111
		IF ~IsValidForPartyDialog("Nalia")~THEN EXTERN BNALIA MR3MoneyTalkNalia
		IF ~!IsValidForPartyDialog("Nalia")
			IsValidForPartyDialog("Aerie")~THEN EXTERN BAERIE MR3MoneyTalkAerie
		IF ~!IsValidForPartyDialog("Nalia")
			!IsValidForPartyDialog("Aerie")
			IsValidForPartyDialog("Keldorn")~THEN EXTERN BKELDOR MR3MoneyTalkKeldorn
		IF ~!IsValidForPartyDialog("Nalia")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Keldorn") 
			IsValidForPartyDialog("Korgan")~THEN EXTERN BKORGAN MR3MoneyTalkKorgan
		IF ~!IsValidForPartyDialog("Nalia")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Keldorn") 
			!IsValidForPartyDialog("Korgan") 
			IsValidForPartyDialog("Edwin")~THEN EXTERN BEDWIN MR3MoneyTalkEdwin
		IF ~!IsValidForPartyDialog("Nalia")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Keldorn") 
			!IsValidForPartyDialog("Korgan") 
			!IsValidForPartyDialog("Edwin")
			IsValidForPartyDialog("Viconia")~THEN EXTERN BVICONI MR3MoneyTalkViconia
		IF ~!IsValidForPartyDialog("Nalia")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Keldorn")
			!IsValidForPartyDialog("Korgan")
			!IsValidForPartyDialog("Edwin")
			!IsValidForPartyDialog("Viconia")~ THEN GOTO MR3MoneyTalkNoone
	END
END


APPEND BNALIA
	IF ~~ THEN BEGIN MR3MoneyTalkNalia
		SAY @112
	IF ~!IsValidForPartyDialog("Aerie")
		!IsValidForPartyDialog("Keldorn")
		!IsValidForPartyDialog("Korgan")
		!IsValidForPartyDialog("Edwin")
		!IsValidForPartyDialog("Viconia")~THEN EXTERN BIMOEN2 MR3MoneyTalkNoone
	IF ~IsValidForPartyDialog("Aerie")~THEN EXTERN BAERIE MR3MoneyTalkAerie
	IF ~!IsValidForPartyDialog("Aerie")
		IsValidForPartyDialog("Keldorn")~THEN EXTERN BKELDOR MR3MoneyTalkKeldorn
	IF ~!IsValidForPartyDialog("Aerie")
		!IsValidForPartyDialog("Keldorn") 
		IsValidForPartyDialog("Korgan")~THEN EXTERN BKORGAN MR3MoneyTalkKorgan
	IF ~!IsValidForPartyDialog("Aerie")
		!IsValidForPartyDialog("Keldorn") 
		!IsValidForPartyDialog("Korgan") 
		IsValidForPartyDialog("Edwin")~THEN EXTERN BEDWIN MR3MoneyTalkEdwin
	IF ~!IsValidForPartyDialog("Aerie")
		!IsValidForPartyDialog("Keldorn") 
		!IsValidForPartyDialog("Korgan") 
		!IsValidForPartyDialog("Edwin") 
		IsValidForPartyDialog("Viconia")~THEN EXTERN BVICONI MR3MoneyTalkViconia 
	END
END

APPEND BAERIE
	IF ~~ THEN BEGIN MR3MoneyTalkAerie
		SAY @113
	IF ~!IsValidForPartyDialog("Keldorn")
		!IsValidForPartyDialog("Korgan")
		!IsValidForPartyDialog("Edwin")
		!IsValidForPartyDialog("Viconia")~THEN EXTERN BIMOEN2 MR3MoneyTalkNoone
	IF ~IsValidForPartyDialog("Keldorn")~THEN EXTERN BKELDOR MR3MoneyTalkKeldorn
	IF ~!IsValidForPartyDialog("Keldorn") 
		IsValidForPartyDialog("Korgan")~THEN EXTERN BKORGAN MR3MoneyTalkKorgan
	IF ~!IsValidForPartyDialog("Keldorn") 
		!IsValidForPartyDialog("Korgan") 
		IsValidForPartyDialog("Edwin")~THEN EXTERN BEDWIN MR3MoneyTalkEdwin
	IF ~!IsValidForPartyDialog("Keldorn") 
		!IsValidForPartyDialog("Korgan") 
		!IsValidForPartyDialog("Edwin") 
		IsValidForPartyDialog("Viconia")~THEN EXTERN BVICONI MR3MoneyTalkViconia 
	END
END

APPEND BKELDOR
	IF ~~ THEN BEGIN MR3MoneyTalkKeldorn
		SAY @114
	IF ~!IsValidForPartyDialog("Korgan")
		!IsValidForPartyDialog("Edwin")
		!IsValidForPartyDialog("Viconia")~THEN EXTERN BIMOEN2 MR3MoneyTalkNoone
	IF ~IsValidForPartyDialog("Korgan")~THEN EXTERN BKORGAN MR3MoneyTalkKorgan
	IF ~!IsValidForPartyDialog("Korgan") 
		IsValidForPartyDialog("Edwin")~THEN EXTERN BEDWIN MR3MoneyTalkEdwin
	IF ~!IsValidForPartyDialog("Korgan") 
		!IsValidForPartyDialog("Edwin") 
		IsValidForPartyDialog("Viconia")~THEN EXTERN BVICONI MR3MoneyTalkViconia
	END
END

APPEND BKORGAN
	IF ~~ THEN BEGIN MR3MoneyTalkKorgan
		SAY @115
	IF ~!IsValidForPartyDialog("Edwin")
		!IsValidForPartyDialog("Viconia")~THEN EXTERN BIMOEN2 MR3MoneyTalkNoone
	IF ~IsValidForPartyDialog("Edwin")~THEN EXTERN BEDWIN MR3MoneyTalkEdwin
	IF ~!IsValidForPartyDialog("Edwin") 
		IsValidForPartyDialog("Viconia")~THEN EXTERN BVICONI MR3MoneyTalkViconia
	END
END


APPEND BEDWIN

	IF ~~ THEN BEGIN MR3MoneyTalkEdwin
		SAY @116
	IF ~!IsValidForPartyDialog("Viconia")~THEN EXTERN BIMOEN2 MR3MoneyTalkNoone
	IF ~IsValidForPartyDialog("Viconia")~THEN EXTERN BVICONI MR3MoneyTalkViconia
	END
END

APPEND BVICONI
	IF ~~ THEN BEGIN MR3MoneyTalkViconia
		SAY @117
	IF ~~ THEN EXTERN BIMOEN2 MR3MoneyTalkNoone
	END
END

APPEND BIMOEN2
	IF ~~ THEN BEGIN MR3MoneyTalkNoone
		SAY @118
		++ @119 GOTO MR3MoneyTalkCont
		++ @120 GOTO MR3MoneyTalkCont
		++ @121 GOTO MR3MoneyTalkCont
		++ @122 GOTO MR3MoneyTalkCarry
		++ @123 GOTO MR3MoneyTalkCarry
		++ @124 GOTO MR3MoneyTalkChaos
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @125 GOTO MR3MoneyTalkEvil1
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @125 GOTO MR3MoneyTalkEvil2
	END

	IF ~~ THEN BEGIN MR3MoneyTalkCont
		SAY @126
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MR3MoneyTalkCarry
		SAY @127
		=
		@128
		=
		@129
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MR3MoneyTalkChaos
		SAY @130
		=
		@131
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MR3MoneyTalkEvil1
		SAY @132
		=
		@133
		IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @134 GOTO MR3MoneyTalkEvil3
		IF ~CheckStatGT(Player1,12,CHR) CheckStatLT(Player1,16,CHR)~ THEN REPLY @135 GOTO MR2MoneyTalkEvil3
		IF ~CheckStatLT(Player1,12,CHR)~ THEN REPLY @136 GOTO MR2MoneyTalkEvil3
		++ @77 GOTO MR2MoneyTalkEvil4
		++ @78 GOTO MR2MoneyTalkEvil4
	END


	IF ~~ THEN BEGIN MR3MoneyTalkEvil2
		SAY @137
		IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @134 GOTO MR3MoneyTalkEvil5
		IF ~CheckStatGT(Player1,12,CHR) CheckStatLT(Player1,16,CHR)~ THEN REPLY @135 GOTO MR3MoneyTalkEvil5
		IF ~CheckStatLT(Player1,12,CHR)~ THEN REPLY @136 GOTO MR3MoneyTalkEvil5
		++ @77 GOTO MR2MoneyTalkEvil4
		++ @78 GOTO MR2MoneyTalkEvil4
	END

	IF ~~ THEN BEGIN MR3MoneyTalkEvil3
		SAY @138
		=
		@139
		IF ~~ THEN GOTO MR3MoneyTalkCarry
	END

	IF ~~ THEN BEGIN MR3MoneyTalkEvil4
		SAY @99
		=
		@100
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MR3MoneyTalkEvil5
		SAY @140
		=
		@141
		IF ~~ THEN GOTO MR3MoneyTalkCarry
	END
END
