/* Reputation High/Low Dialogs - COMPLETED */

APPEND BIMOEN2
	IF ~ReputationGT(Player1,14) 
		Global("MRRepTalk","LOCALS",0)
		InPartySlot(LastTalkedToBy,0) 
		!StateCheck(Player1,CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty("Imoen2")
		See(Player1)
		!ActuallyInCombat()
		GlobalGT("Chapter","GLOBAL",%bg2_chapter_5%) 
		AreaType(CITY)~ THEN BEGIN MRRepHigh
		SAY @0
		IF ~~ THEN REPLY @1 DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepHigh1
		IF ~~ THEN REPLY @2 DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepHighEnd
		IF ~IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Keldorn")~ THEN REPLY @3 DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepHighNPCGood
		IF ~IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Viconia")~ THEN REPLY @3DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepHighNPCEvil
		IF ~OR(2) !IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Keldorn") OR(2) !IsValidForPartyDialog("Korgan") !IsValidForPartyDialog("Viconia")~ THEN REPLY @3 
			DO ~SetGlobal("MRRepTalk","LOCALS",1)~ EXIT
	END

	IF ~~ THEN BEGIN MRRepHighEnd
		SAY @4
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepHigh1
		SAY @5
		++ @6 GOTO MRRepHighJealous1
		IF ~!IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @7 GOTO MRRepHighEvil
		IF ~IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @7 EXTERN BNALIA MRRepHighEvil
		IF ~!IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Aerie")~ THEN REPLY @7 EXTERN BAERIE MRRepHighEvil
		IF ~IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Aerie")~ THEN REPLY @8 EXTERN BAERIE MRRepHighEvil
		++ @9 GOTO MRRepHighGreedy
		++ @10 GOTO MRRepHighGood
	END

END

CHAIN BIMOEN2 MRRepHighJealous1
 @11 
==BIMOEN2 IF ~CheckStatLT(Player1,8,CHR)~ THEN @12
	= @13
==BIMOEN2 IF ~CheckStatGT(Player1,13,CHR) Global("ImoenRomanceActive","GLOBAL",2)~THEN @14
==BIMOEN2 IF ~CheckStatGT(Player1,13,CHR) !Global("ImoenRomanceActive","GLOBAL",2) ~ THEN @15
==BIMOEN2 IF ~CheckStatGT(Player1,7,CHR) CheckStatLT(Player1,14,CHR)~ THEN @16
END
	IF ~!IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @7 GOTO MRRepHighEvil
	IF ~IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @17 EXTERN BNALIA MRRepHighEvil
	IF ~IsValidForPartyDialog("Aerie")~ THEN REPLY @18 EXTERN BAERIE MRRepHighEvil
	IF ~Gender(Player1,FEMALE)~ THEN REPLY @19 GOTO MRRepHighGood
	IF ~Gender(Player1,MALE)~ THEN REPLY @20 GOTO MRRepHighGood

APPEND BNALIA
	IF ~~ THEN BEGIN MRRepHighEvil
		SAY @21 
	IF ~~ THEN EXTERN BIMOEN2 MRRepHighEvil2
	END
END

APPEND BAERIE
	IF ~~ THEN BEGIN MRRepHighEvil
		SAY @22
	IF ~~ THEN EXTERN BIMOEN2 MRRepHighEvil2
	END
END


APPEND BIMOEN2
	IF ~~ THEN BEGIN MRRepHighGreedy
		SAY @23
		IF ~!IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @24 GOTO MRRepHighEvil
		IF ~IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @24 EXTERN BNALIA MRRepHighEvil
		IF ~IsValidForPartyDialog("Aerie")~ THEN REPLY @24 EXTERN BAERIE MRRepHighEvil
		++ @25 GOTO MRRepHighGood
	END 

	IF ~~ THEN BEGIN MRRepHighGood
		SAY @26
		++ @27 GOTO MRRepHighGoodLittle
		++ @28 GOTO MRRepHighGoodBad
	END

	IF ~~ THEN BEGIN MRRepHighGoodLittle
		SAY @29
	=
	@30
	++ @31 GOTO MRRepHighGoodEnd1
	++ @32 GOTO MRRepHighGoodEndVolo
	++ @33 GOTO MRRepHighGoodEnd1
	END

	IF ~~ THEN BEGIN MRRepHighGoodEnd1
		SAY @34
		=
		@35
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepHighGoodEndVolo
		SAY @36
		=
		@37
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepHighGoodBad
		SAY @38
		=
		@39
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRRepHighEvil
		SAY @40
		=
		@41
		IF ~~ THEN EXIT
	END
END

CHAIN BIMOEN2 MRRepHighNPCGood
@42
== BKELDOR
@43
== BIMOEN2
@44
== BKELDOR
@45
==BIMOEN2
@46
==BKELDOR
@47
==BNALIA
@48
==BKELDOR
@49
==BNALIA
@50
==BIMOEN2
@51
==BNALIA
@52
==BKELDOR
@53
==BIMOEN2
@54
==BNALIA
@55
==BIMOEN2
@56
==BKELDOR
@57
EXIT

CHAIN BIMOEN2 MRRepHighNPCEvil
@58
== BKORGAN
@59
==BVICONI
@60
==BKORGAN
@61
==BIMOEN2
@62
==VICONI
@63
==BKORGAN
@64
==BIMOEN2
@65
EXIT

CHAIN BIMOEN2 MRRepHighEvil2
@66
==BIMOEN2 IF ~IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Nalia")~ THEN @67
= @68
==BIMOEN2 IF ~!IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Nalia")~ THEN @69
= @68
==BIMOEN2 IF ~IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Nalia")~ THEN @70
= @68
EXIT

APPEND BIMOEN2
	IF ~ReputationLT(Player1,6) Global("MRRepTalk","GLOBAL",1)~ THEN BEGIN MRRepLow
		SAY @71
		++ @72 DO ~SetGlobal("MRRepTalk","GLOBAL",2)~ GOTO MRRepLow1
		IF ~!NumInPartyGT(2)~ THEN REPLY @73 DO ~SetGlobal("MRRepTalk","GLOBAL",2)~ GOTO MRRepLowEnd1
		IF ~NumInPartyGT(2)~ THEN REPLY @73 DO ~SetGlobal("MRRepTalk","GLOBAL",2)~ GOTO MRRepLowEnd2
		IF ~~ THEN REPLY @3 DO ~SetGlobal("MRRepTalk","GLOBAL",2)~ EXIT
	END

	IF ~~ THEN BEGIN MRRepLowEnd1
		SAY @74
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowEnd2
		SAY @75
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLow1
		SAY @76
		=
		@77
		=
		@78
		++ @79 GOTO MRRepLowGood
		++ @80 GOTO MRRepLowNeu
		++ @81 GOTO MRRepLowNeu
		++ @82 GOTO MRRepLowBhaal
	END

	IF ~~ THEN BEGIN MRRepLowGood
		SAY @83
		++ @84 GOTO MRRepLowWicca
		IF ~!NumInPartyGT(2)
			 OR(7)
			Class(Player1,MAGE)
			Class(Player1,SORCERER)
			Class(Player1,CLERIC_MAGE)
			Class(Player1,FIGHTER_MAGE_CLERIC)
			Class(Player1,FIGHTER_MAGE)
			Class(Player1,FIGHTER_MAGE_THIEF)
			Class(Player1,MAGE_THIEF)~ THEN REPLY @85 GOTO MRRepLowMagicDual
		IF ~!NumInPartyGT(2)
			!Class(Player1,MAGE)
			!Class(Player1,SORCERER)
			!Class(Player1,CLERIC_MAGE)
			!Class(Player1,FIGHTER_MAGE_CLERIC)
			!Class(Player1,FIGHTER_MAGE)
			!Class(Player1,FIGHTER_MAGE_THIEF)
			!Class(Player1,MAGE_THIEF)~
			THEN REPLY @85 GOTO MRRepLowMagicSolo
		IF ~NumInPartyGT(2)
			OR(7)
			IsValidForPartyDialog("Nalia")
			IsValidForPartyDialog("Aerie")
			IsValidForPartyDialog("")
			IsValidForPartyDialog("Edwin")
			IsValidForPartyDialog("Jan")
			IsValidForPartyDialog("Cernd")
			IsValidForPartyDialog("Viconia")
			~ THEN REPLY @85 GOTO MRRepLowMagicMulti
		++ @86 GOTO MRRepLowCW
	END

	IF ~~ THEN BEGIN MRRepLowMagicSolo
		SAY @87
		++ @88 GOTO MRRepLowMagicDual2
		++ @89 GOTO MRRepLowMagicDual3
	END

	IF ~~ THEN BEGIN MRRepLowMagicDual
		SAY @90
		++ @88 GOTO MRRepLowMagicDual2
		++ @91 GOTO MRRepLowMagicDual2
		++ @89 GOTO MRRepLowMagicDual3
	END

	IF ~~ THEN BEGIN MRRepLowMagicDual2
		SAY @92
		=
		@93
		IF ~~ THEN EXIT
	END
END

CHAIN BIMOEN2 MRRepLowMagicDual3
 @94
 ==BIMOEN2 IF ~Global("ImoenRomanceActive","GLOBAL",2) ~ THEN @95
 ==BIMOEN2 IF ~!Global("ImoenRomanceActive","GLOBAL",2) ~ THEN @96
 EXIT

APPEND BIMOEN2
	IF ~~ THEN BEGIN MRRepLowMagicMulti
		SAY @97
		++ @88 GOTO MRRepLowMagicDual2
		++ @98 GOTO MRRepLowMagicDual2
		++ @89 GOTO MRRepLowMagicDual3

	END

	IF ~~ THEN BEGIN MRRepLowWicca
		SAY @99
		++ @100 GOTO MRRepLowWicca3
		++ @101 GOTO MRRepLowWicca3
		++ @102 GOTO MRRepLowWicca4
	END

	IF ~~ THEN BEGIN MRRepLowWicca3
		SAY @103
		++ @104 GOTO MRRepLowWicca5
		++ @105 GOTO MRRepLowWicca4
		++ @106 GOTO MRRepLowWicca5
	END

	IF ~~ THEN BEGIN MRRepLowWicca5
		SAY @107
		=
		@108
		=
		@109
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowWicca4
		SAY @110
		=
		@111
		IF ~Global("ImoenRomanceActive","GLOBAL",2) ~ THEN REPLY @112 EXIT
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @113 GOTO MRRepLowGirl
		++ @114 EXIT
		++ @115 EXIT
	END

	IF ~~ THEN BEGIN MRRepLowGirl
		SAY @116
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowCW
		SAY @117
		=
		@118
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRRepLowNeu
		SAY @119
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowNeu2
		SAY @120
		=
	 @121
		++ @122 GOTO MRRepLowGood
		++ @80 GOTO MRRepLowNeu
		++ @123 GOTO MRRepLowNeu
	END

	IF ~~ THEN BEGIN MRRepLowBhaal
		SAY @124
		IF ~CheckStatLT(Player1,13,CHR)~ THEN REPLY @125 GOTO MRRepLowBhaal21
		IF ~CheckStatGT(Player1,13,CHR) CheckStatLT(Player1,17,CHR)~ THEN REPLY @125 GOTO MRRepLowBhaal22
		IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @125 GOTO MRRepLowBhaal23
		++ @126 GOTO MRRepLowNeu
		++ @127 GOTO MRRepLowNeu2
	END

	IF ~~ THEN BEGIN MRRepLowBhaal21
		SAY @128
		IF ~~ THEN DO ~RunAwayFrom(Player1,45)~EXIT
	END

	IF ~~ THEN BEGIN MRRepLowBhaal22
		SAY @129
		IF ~!CheckStatGT(Player1,13,CHR)~ GOTO MRRepLowBhaal3
		IF ~CheckStatGT(Player1,13,CHR)~ GOTO MRRepLowBhaal4
	END

	IF ~~ THEN BEGIN MRRepLowBhaal23
		SAY @130 
		IF ~~ THEN GOTO MRRepLowBhaal4
	END

	IF ~~ THEN BEGIN MRRepLowBhaal3
		SAY @131 
		IF ~~ THEN DO ~RealSetGlobalTimer("MRLowBhaalTimer","GLOBAL",300) SetGlobal("MRRepLowBhaalWait","GLOBAL",1) RunAwayFrom(Player1,45)~ EXIT
	END

	IF ~~ THEN BEGIN MRRepLowBhaal4
		SAY @132
		=
		@133 
		IF ~~ THEN DO ~RunAwayFrom(Player1,45)~ EXIT
	END
END


APPEND IMOEN2J
	IF ~Global("MRRepLowBhaalWait","GLOBAL",2)~ THEN BEGIN MRRepLowBhaalContinue
		SAY @134
			++ @135 DO ~SetGlobal("MRRepLowBhaalWait","GLOBAL",3)~ GOTO MRRepLowBhaal-Joke
			++ @136 DO ~SetGlobal("MRRepLowBhaalWait","GLOBAL",3)~ GOTO MRRepLowBhaal-Why
			++ @137 DO ~SetGlobal("MRRepLowBhaalWait","GLOBAL",3)~ GOTO MRRepLowBhaal-Yes
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-Joke
		SAY @138
		= @139
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-Why
		SAY @140
			++ @141 GOTO MRRepLowBhaal-Joke
			++ @142 GOTO MRRepLowBhaal-Yes
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-Yes
		SAY @143
		= @144
			++ @145 GOTO MRRepLowBhaal-YesBeing
			++ @146 GOTO MRRepLowBhaal-YesPlace
			++ @147 + MRRepLowBhaal-YesStop
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesStop
		SAY @148
		= @149
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesPlace
		SAY @150
			++ @151 GOTO MRRepLowBhaal-YesPlaceWrong
			++ @152 GOTO MRRepLowBhaal-YesPlaceStrong
			++ @147 GOTO MRRepLowBhaal-YesStop
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesBeing
		SAY @153
		= @154
			++ @151 GOTO MRRepLowBhaal-YesPlaceWrong
			++ @152 GOTO MRRepLowBhaal-YesPlaceStrong
			++ @147 GOTO MRRepLowBhaal-YesStop	
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesPlaceWrong
		SAY @155
			++ @156 GOTO MRRepLowBhaal-YesWrongEnd
			++ @157 GOTO MRRepLowBhaal-YesSomeday
			++ @158 GOTO MRRepLowBhaal-YesSomeday
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesPlaceStrong
		SAY @159
			++ @160 GOTO MRRepLowBhaal-YesSomeday
			++ @161 GOTO MRRepLowBhaal-YesSomeday
			++ @162 GOTO MRRepLowBhaal-YesStop
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesSomeday
		SAY @163
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesWrongEnd
		SAY @164
		= @165
		IF ~~ THEN EXIT
	END
END




