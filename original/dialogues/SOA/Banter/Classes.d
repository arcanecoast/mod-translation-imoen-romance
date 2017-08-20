/*** Note to Kat: Needs a bit of coding completion -- search for "pantaloons" ***/

/* Fighters */
APPEND BIMOEN2
	IF ~Global("MRClassTalk","LOCALS",0)
	InPartySlot(LastTalkedToBy,0) 
		!StateCheck(Player1,CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty("Imoen2")
		See(Player1)
		!ActuallyInCombat()
		OR(7)
		Class(Player1,FIGHTER)
		Class(Player1,FIGHTER_MAGE)
		Class(Player1,FIGHTER_CLERIC)
		Class(Player1,FIGHTER_THIEF)
		Class(Player1,FIGHTER_DRUID)
		Class(Player1,FIGHTER_MAGE_THIEF)
		Class(Player1,FIGHTER_MAGE_CLERIC)~ THEN BEGIN MRClassFighter
		SAY @0
		IF ~IsValidForPartyDialog("Minsc")~THEN DO ~SetGlobal("MRClassTalk","LOCALS",1)~ EXTERN BMINSC MRClassFighter
		IF ~IsValidForPartyDialog("Korgan")~ THEN DO ~SetGlobal("MRClassTalk","LOCALS",1)~ EXTERN BKORGAN MRClassFighter
		IF ~!IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Korgan")~ THEN REPLY @1 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassFighterMagic
		IF ~!IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Korgan")~ THEN REPLY @2 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassFighterMelee
		IF ~!IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Korgan")~ THEN REPLY @3 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassFighterRude
	END

	IF ~~ THEN BEGIN MRClassFighter1
		SAY @4
		++ @1 GOTO MRClassFighterMagic
		++ @2 GOTO MRClassFighterMelee
		++ @3 GOTO MRClassFighterRude
	END

	IF ~~ THEN BEGIN MRClassFighterRude
		SAY @5
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassFighterMagic
		SAY @6
		++ @7 GOTO MRClassFighterFunny
		++ @8 + MRClassFighterFunny
		++ @9 + MRClassFighterBackup
		++ @10 + MRClassFighterFunny
	END

	IF ~~ THEN BEGIN MRClassFighterFunny
		SAY @11
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassFighterBackup
		SAY @12
		=
		@13
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @14 GOTO MRClassFighterArrow
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @14 GOTO MRClassFighterArrow2
		++ @15 + MRClassFighterBlood
		++ @16 GOTO MRClassFighterExit
	END

	IF ~~ THEN BEGIN MRClassFighterExit
		SAY @17
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassFighterBlood
		SAY @18
		=
		@19
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassFighterArrow
		SAY @20
		=
		@21
		=
		@22
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassFighterArrow2
		SAY @23
		=
		@24
		=
		@25
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassFighterMelee
		SAY @26
		++ @27 GOTO MRClassFighterMeleeFight
		++ @28 GOTO MRClassFighterMeleeHope
		++ @29 GOTO MRClassFighterMeleeShut
	END

	IF ~~ THEN BEGIN MRClassFighterMeleeFight
		SAY @30
		=
		@31
		=
		@32
		=
		@33
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassFighterMeleeHope
		SAY @34
		=
		@35
		++ @36 GOTO MRClassFighterMeleeHope1
		++ @37 GOTO MRClassFighterMeleeHope2
		++ @38 + MRClassFighterMeleeHope3
	END

	IF ~~ THEN BEGIN MRClassFighterMeleeHope1
		SAY @39
		=
		@40
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassFighterMeleeHope2
		SAY @41
		=
		@42
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassFighterMeleeHope3
		SAY @43
			++ @44 GOTO MRClassFighterMeleeHope4
			IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @45 GOTO MRClassFighterMeleeHope4
			IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @46 GOTO MRClassFighterMeleeHope4
	END

	IF ~~ THEN BEGIN MRClassFighterMeleeHope4
		SAY @47
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassFighterMeleeShut
		SAY @48
		=
		@49
		=
		@50
		IF ~~ THEN EXIT
	END
END

APPEND BMINSC
	IF ~~ THEN BEGIN MRClassFighter
		SAY @51
		=
		@52
		IF ~~ THEN EXTERN BIMOEN2 MRClassFighter1
	END
END

APPEND BKORGAN
	IF ~~ THEN BEGIN MRClassFighter
		SAY @53
		IF ~~ THEN EXTERN BIMOEN2 MRClassFighter1
	END
END

/* Paladins and Clerics */

APPEND BIMOEN2
	IF ~
	Global("MRClassTalk","LOCALS",0)
	InPartySlot(LastTalkedToBy,0) 
	!StateCheck(Player1,CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
	InParty("Imoen2")
	See(Player1)
	!ActuallyInCombat()
	OR(7)
	Class(Player1,PALADIN)
	Class(Player1,FIGHTER_CLERIC)
	Class(Player1,FIGHTER_MAGE_CLERIC)
	Class(Player1,CLERIC_RANGER)
	Class(Player1,CLERIC_THIEF)
	Class(Player1,CLERIC_MAGE)
	Class(Player1,CLERIC)~ THEN BEGIN MRClassHoly
		SAY @54
		=
		@55
		IF ~~ THEN REPLY @56 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassHolyLater
		IF ~~ THEN REPLY @57 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassHolySkipped
		IF ~Class(Player1,PALADIN)~ THEN REPLY @58 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassHolyBadPal
		IF ~!Class(Player1,PALADIN)~ THEN REPLY @58 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassHolyBadCler
		IF ~~ THEN REPLY @59 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassHolyRude
	END

	IF ~~ THEN BEGIN MRClassHolyLater
		SAY @60 
		IF ~~ THEN GOTO MRClassHolyBhaal
	END

	IF ~~ THEN BEGIN MRClassHolySkipped
		SAY@61 
		IF ~~ THEN GOTO MRClassHolyBhaal
	END

	IF ~~ THEN BEGIN MRClassHolyBadPal
		SAY @62
		= @63
		++ @64 GOTO MRClassHolyLater
		++ @65 GOTO MRClassHolySkipped
		++ @66 GOTO MRClassHolyRude
	END
	
		IF ~~ THEN BEGIN MRClassHolyBadCler
		SAY @62
		= @67
		++ @64 GOTO MRClassHolyLater
		++ @65 GOTO MRClassHolySkipped
		++ @66 GOTO MRClassHolyRude
	END

	IF ~~ THEN BEGIN MRClassHolyRude
		SAY @68
		IF ~~ THEN EXIT
	END

	IF~~ THEN BEGIN MRClassHolyBhaal
		SAY @69
		=
		@70
		++ @71 + MRClassHolyWeak
		++ @72 GOTO MRClassHolyGod
		++ @73 GOTO MRClassHolyGod
		++ @74 GOTO MRClassHolyCorrupt
		++ @75 GOTO MRClassHolyRude
	END

	IF ~~ THEN BEGIN MRClassHolyWeak
		SAY @76
		IF ~OR(3)
		PartyHasItem("MISC47")
		PartyHasItem("MISCCB")
		PartyHasItem("MISC5O")~ THEN GOTO MRClassHolyEE
		IF ~!PartyHasItem("MISC47")
		!PartyHasItem("MISCCB")
		!PartyHasItem("MISC5O")~ THEN GOTO MRClassHolyNE
	END

	IF ~~ THEN BEGIN MRClassHolyEE
		SAY @77 
		IF ~~ THEN GOTO MRClassHolyNE
	END

	IF ~~ THEN BEGIN MRClassHolyNE
		SAY @78
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassHolyGod
		SAY @79
		IF ~NumInParty(2)~ THEN REPLY @80 GOTO MRClassHolyNice
		IF ~NumInPartyGT(2)~ THEN REPLY @81 GOTO MRClassHolyNice
		++ @82 GOTO MRClassHolyRude
	END

	IF ~~ THEN BEGIN MRClassHolyNice
		SAY @83
		=
		@84
		=
		@85
		IF~~ THEN DO ~SetGlobal("MRAscendPromise","GLOBAL",1) ~ EXIT
	END

	IF ~~THEN BEGIN MRClassHolyCorrupt
		SAY @86
		=
		@87
		IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @88 GOTO MRClassHolyCorruptY
		IF ~!CheckStatGT(Player1,16,CHR) !CheckStatGT(Player1,"GLOBAL",4)~ THEN REPLY @88 GOTO MRClassHolyCorruptN
		IF ~!CheckStatGT(Player1,16,CHR)~ THEN REPLY @88 GOTO MRClassHolyCorruptN
		IF ~CheckStatGT(Player1,14,CHR)~ THEN REPLY @89 GOTO MRClassHolyCorrupt1Y
		IF ~!CheckStatGT(Player1,14,CHR)~ THEN REPLY @89 GOTO MRClassHolyCorrupt1N
		++ @90 GOTO MRClassHolyRude
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @91 GOTO MRClassHolyJoke1
		IF ~Gender(Player1,MALE)~ THEN REPLY @92 GOTO MRClassHolyJoke2M
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @92 GOTO MRClassHolyJoke2F
	END

	IF ~~ THEN BEGIN MRClassHolyJoke1
		SAY @93
		=
		@94
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassHolyJoke2M
		SAY @95
		=
		@96
		IF ~~ THEN EXIT
	END
	IF ~~ THEN BEGIN MRClassHolyJoke2F
		SAY @97
		=
		@96
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassHolyCorruptN
		SAY @98
		=
		@99
		=
		@100
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassHolyCorrupt1N
		SAY @101
		=
		@102
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassHolyCorruptY
		SAY @103
		=
		@104
		++ @105 GOTO MRClassHolyCorruptFinal1
		++ @106 + MRClassHolyCorruptFinal2
		++ @107 + MRClassHolyCorruptFinal
	END

	IF ~~ THEN BEGIN MRClassHolyCorruptFinal1
		SAY @108 
		IF ~~ THEN GOTO MRClassHolyCorruptFinal
	END

	IF ~~ THEN BEGIN MRClassHolyCorruptFinal2
		SAY @109 
		IF ~~ THEN GOTO MRClassHolyCorruptFinal
	END

	IF ~~ THEN BEGIN MRClassHolyCorruptFinal
		SAY @110
		=
		@111
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassHolyCorrupt1Y
		SAY @112
		=
		@85
		IF ~~ THEN EXIT
	END


/* Rangers and Druids */

	IF ~
	Global("MRClassTalk","LOCALS",0)
	InPartySlot(LastTalkedToBy,0) 
	!StateCheck(Player1,CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
	InParty("Imoen2")
	See(Player1)
	!ActuallyInCombat()
	AreaType(FOREST)
	OR(5)
	Class(Player1,CLERIC_RANGER)
	Class(Player1,RANGER)
	Class(Player1,DRUID)
	Class(Player1,FIGHTER_DRUID)~ THEN BEGIN MRClassNature
		SAY @113
		=
		@114
		=
		@115
		IF ~~ THEN REPLY @116 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassNatureDont
		IF ~~ THEN REPLY @117 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassNatureKill
		IF ~~ THEN REPLY @118 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassNaturePlace
		IF ~~ THEN REPLY @119 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ EXIT
	END

	IF ~~ THEN BEGIN MRClassNatureDont
		SAY @120
		++ @121 + MRClassNatureCrazy
		++ @122 + MRClassNaturePlace
	END


	IF ~~ THEN BEGIN MRClassNatureKill
		SAY @123
		=
		@124
		++ @125 GOTO MRClassNatureJoke
		++ @126 GOTO MRClassNaturePlace
		++ @127 GOTO MRClassNatureJoke
		++ @128 GOTO MRClassNaturePlace
	END

	IF ~~ THEN BEGIN MRClassNatureJoke
		SAY @129 
		IF ~~ THEN GOTO MRClassNaturePlace
	END

	IF ~~ THEN BEGIN MRClassNaturePlace
		SAY @130
		++ @131 GOTO MRClassNatureStumped
		++ @132 GOTO MRClassNatureParasite
		++ @133 GOTO MRClassNatureParasite
		++ @134 GOTO MRClassNaturePoint
	END

	IF ~~ THEN BEGIN MRClassNaturePoint
		SAY @135
		=
		@136
		=
		@137
		IF ~~ THEN EXIT	
	END

	IF ~~ THEN BEGIN MRClassNatureParasite
		SAY @138
		++ @139 GOTO MRClassNatureOkay
		++ @140 GOTO MRClassNatureOkay
		++ @141 GOTO MRClassNatureStumped
		++ @142 GOTO MRClassNatureStumped
	END

	IF ~~ THEN BEGIN MRClassNatureOkay
		SAY @143
		=
		@144
		=
		@137
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassNatureStumped
		SAY @145
		=
		@146
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassNatureCrazy
		SAY @147
		++ @148 GOTO MRClassNatureCrazy2
		++ @149 GOTO MRClassNatureCrazy2
	END

	IF ~~ THEN BEGIN MRClassNatureCrazy2
		SAY @150
		=@151
		IF ~~ THEN DO ~RunAwayFrom(Player1,40) ~ EXIT
	END
	
/* Bards */

	IF ~Global("MRClassTalk","LOCALS",0) 
	InPartySlot(LastTalkedToBy,0) 
	!StateCheck(Player1,CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
	InParty("Imoen2")
	See(Player1)
	!ActuallyInCombat()
	Class(Player1,BARD)~ THEN BEGIN MRClassBard
		SAY @152
		=
		@153
		=
		@154
		++ @155 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassBardWhen
		++ @156 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassBardNo
		++ @157 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassBardChoice
	END

	IF ~~ THEN BEGIN MRClassBardNo
		SAY @158
		IF ~InParty("HaerDalis")~ THEN REPLY @159 GOTO MRClassBardHaer
		IF ~Global("MRCampfireMusic","GLOBAL",4)~ THEN REPLY @160 GOTO MRClassBardYou1
		IF ~!Global("MRCampfireMusic","GLOBAL",4)~ THEN REPLY @161 GOTO MRClassBardYou2
		++ @157 GOTO MRClassBardChoice
		++ @162 GOTO MRClassBardNo2
	END
	
	IF ~~ THEN BEGIN MRClassBardNo1
		SAY @158
		IF ~InParty("HaerDalis")~ THEN REPLY @163 GOTO MRClassBardHaer
		++ @157 GOTO MRClassBardChoice
		++ @162 GOTO MRClassBardNo2
	END

	IF ~~ THEN BEGIN MRClassBardHaer
		SAY @164
		=
		@165
		=
		@166
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassBardYou1
		SAY @167
		IF ~~ THEN GOTO MRClassBardNo1
	END

	IF ~~ THEN BEGIN MRClassBardYou2
		SAY @168
		IF ~~ THEN GOTO MRClassBardNo1
	END

	IF ~~ THEN BEGIN MRClassBardChoice
		SAY @169
		++ @170 GOTO MRClassBardComplicated
		++ @171 GOTO MRClassBardNice
		++ @172 GOTO MRClassBardNice
		++ @173 GOTO MRClassBardBrat
		++ @174 GOTO MRClassBardBrat2
		IF ~InParty("HaerDalis")~ THEN REPLY @175 GOTO MRClassBardHaer
		IF ~Global("MRCampfireMusic","GLOBAL",4) ~ THEN REPLY @160 GOTO MRClassBardYou1
		IF ~!Global("MRCampfireMusic","GLOBAL",4)~ THEN REPLY @161 GOTO MRClassBardYou2
	END

	IF ~~ THEN BEGIN MRClassBardComplicated
		SAY @176
		++ @171 GOTO MRClassBardNice
		++ @172 GOTO MRClassBardNice
		++ @173 GOTO MRClassBardBrat
		++ @174 GOTO MRClassBardBrat2
		IF ~InParty("HaerDalis")~ THEN REPLY @175 GOTO MRClassBardHaer
		IF ~Global("MRCampfireMusic","GLOBAL",4)~ THEN REPLY @160 GOTO MRClassBardYou1
		IF ~!Global("MRCampfireMusic","GLOBAL",4) ~ THEN REPLY @161 GOTO MRClassBardYou2
	END	

	IF ~~ THEN BEGIN MRClassBardNice
		SAY @177
		= @178
		= @179
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassBardBrat
		SAY @180
		=
		@181
		=
		@182
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassBardBrat2
		SAY @183
		=
		@184
		=
		@185
		=
		@186
		=
		@180
		=
		@187
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRClassBardWhen
		SAY @188 
		IF ~~ THEN GOTO MRClassBardNo
	END

	IF ~~ THEN BEGIN MRClassBardNo2
		SAY @189
		=
		@190
		IF ~~ THEN EXIT
	END

/* Thieves */

	IF ~Global("MRClassTalk","LOCALS",0)
	InPartySlot(LastTalkedToBy,0) 
	!StateCheck(Player1,CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
	InParty("Imoen2")
	See(Player1)
	!ActuallyInCombat() 
	OR(5)
	Class(Player1,THIEF)
	Class(Player1,CLERIC_THIEF)
	Class(Player1,MAGE_THIEF)
	Class(Player1,FIGHTER_THIEF)
	Class(Player1,FIGHTER_MAGE_THIEF)~ THEN BEGIN MRClassThief
		SAY @191
		=
		@192
		IF ~OR(2) Class(Player1,MAGE_THIEF) Class(Player1,FIGHTER_MAGE_THIEF)~ THEN REPLY @193 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassThiefGood
		IF ~!Class(Player1,FIGHTER_MAGE_THIEF) !Class(Player1,MAGE_THIEF) Class(Player1,CLERIC_THIEF)~ THEN REPLY @194 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassThiefGood
		IF ~Class(Player1,CLERIC_THIEF)~ THEN REPLY @195 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassThiefGood
		++ @196 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassThiefGood
		++ @197 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassThiefGood
		++ @198 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassThiefSuck
	END

	IF ~~ THEN BEGIN MRClassThiefSuck
		SAY @199 
		IF ~OR(2) Class(Player1,MAGE_THIEF) Class(Player1,FIGHTER_MAGE_THIEF)~ THEN REPLY @200 GOTO MRClassThiefGood2
		IF ~!Class(Player1,FIGHTER_MAGE_THIEF) !Class(Player1,MAGE_THIEF) Class(Player1,CLERIC_THIEF)~ THEN REPLY @201 GOTO MRClassThiefGood2
		IF ~Class(Player1,CLERIC_THIEF)~ THEN REPLY @202 GOTO MRClassThiefGood2
		++ @203 GOTO MRClassThiefGood2
		++ @204 GOTO MRClassThiefGood2
		++ @205 GOTO MRClassThiefSuck2
	END
END

CHAIN BIMOEN2 MRClassThiefGood
@206
==BIMOEN2 IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @207
==BIMOEN2 IF ~ Global("ImoenRomanceActive","GLOBAL",2)~ THEN @208
EXIT

CHAIN BIMOEN2 MRClassThiefGood2
@206
==BIMOEN2 IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @209
==BIMOEN2 IF ~ Global("ImoenRomanceActive","GLOBAL",2)~ THEN @210
EXIT

CHAIN BIMOEN2 MRClassThiefSuck2
@211
EXIT

/* Monks */

APPEND BIMOEN2
	IF ~Class(Player1,MONK) Global("MRClassTalk","LOCALS",0)
	InPartySlot(LastTalkedToBy,0) 
	!StateCheck(Player1,CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
	InParty("Imoen2")
	See(Player1)
	!ActuallyInCombat()~ THEN BEGIN MRClassMonk
		SAY @212
		=
		@213
		=
		@214
		=
		@215
		IF ~Gender(Player1,FEMALE)!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @216 DO ~SetGlobal("MRClassTalk","GLOBAL",2)~ GOTO MRClassMonkPlay1
		IF ~Gender(Player1,FEMALE) Global("ImoenRomanceActive","GLOBAL",2) ~ THEN REPLY @216 DO ~SetGlobal("MRClassTalk","GLOBAL",2)~ GOTO MRClassMonkPlay2
		IF ~Gender(Player1,MALE) Global("ImoenRomanceActive","GLOBAL",2) ~ THEN REPLY @216 DO ~SetGlobal("MRClassTalk","GLOBAL",2)~ GOTO MRClassMonkPlay3
		IF ~Gender(Player1,FEMALE) !Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @216 DO ~SetGlobal("MRClassTalk","GLOBAL",2)~ GOTO MRClassMonkPlay4
		IF ~Gender(Player1,MALE) !Global("ImoenRomanceActive","GLOBAL",2) Global("JaheiraRomanceActive","GLOBAL",2)~ THEN REPLY @216 DO ~SetGlobal("MRClassTalk","GLOBAL",2)~ GOTO MRClassMonkPlay5
		IF ~Gender(Player1,MALE) !Global("ImoenRomanceActive","GLOBAL",2) Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @216 DO ~SetGlobal("MRClassTalk","GLOBAL",2)~ GOTO MRClassMonkPlay6
		IF ~Gender(Player1,MALE) !Global("ImoenRomanceActive","GLOBAL",2) Global("ViconiaRomanceActive","GLOBAL",2)~ THEN REPLY @216 DO ~SetGlobal("MRClassTalk","GLOBAL",2)~ GOTO MRClassMonkPlay7
		IF ~Gender(Player1,MALE) !Global("ImoenRomanceActive","GLOBAL",2)
			 !Global("JaheiraRomanceActive","GLOBAL",2)
			 !Global("ViconiaRomanceActive","GLOBAL",2)
			 !Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @216 DO ~SetGlobal("MRClassTalk","GLOBAL",2)~ GOTO MRClassMonkPlay8
		++ @217 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassMonkPower
		++ @218 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassMonkPeace
		++ @219 DO ~SetGlobal("MRClassTalk","LOCALS",1)~ GOTO MRClassMonkEvil
	END


	IF ~~ THEN BEGIN MRClassMonkPlay1
	SAY @220
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @221 GOTO MRClassMonkPlayGrump
		IF ~Gender(Player1,MALE)
			OR(4)
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("JaheiraRomanceActive","GLOBAL",2)
			Global("ViconiaRomanceActive","GLOBAL",2)
			Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @222 GOTO MRClassMonkPlayGod
			 
		IF ~Gender(Player1,FEMALE) 
			OR(2) 
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("AnomenRomanceActive","GLOBAL",2)~ THEN REPLY @223 GOTO MRClassMonkPlayGod
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @224 GOTO MRClassMonkPlayTactic
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @225 GOTO MRClassMonkPlaySingle
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @226 GOTO MRClassMonkPlaySingle
	END

	IF ~~ THEN BEGIN MRClassMonkPlay2
	SAY @220
	=@227
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @221 GOTO MRClassMonkPlayGrump
		IF ~Gender(Player1,MALE)
			OR(4)
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("JaheiraRomanceActive","GLOBAL",2)
			Global("ViconiaRomanceActive","GLOBAL",2)
			Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @222 GOTO MRClassMonkPlayGod
			 
		IF ~Gender(Player1,FEMALE) 
			OR(2) 
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("AnomenRomanceActive","GLOBAL",2)~ THEN REPLY @223 GOTO MRClassMonkPlayGod
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @224 GOTO MRClassMonkPlayTactic
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @225 GOTO MRClassMonkPlaySingle
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @226 GOTO MRClassMonkPlaySingle
	END

	IF ~~ THEN BEGIN MRClassMonkPlay3
	SAY @228
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @221 GOTO MRClassMonkPlayGrump
		IF ~Gender(Player1,MALE)
			OR(4)
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("JaheiraRomanceActive","GLOBAL",2)
			Global("ViconiaRomanceActive","GLOBAL",2)
			Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @222 GOTO MRClassMonkPlayGod
			 
		IF ~Gender(Player1,FEMALE) 
			OR(2) 
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("AnomenRomanceActive","GLOBAL",2)~ THEN REPLY @223 GOTO MRClassMonkPlayGod
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @224 GOTO MRClassMonkPlayTactic
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @225 GOTO MRClassMonkPlaySingle
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @226 GOTO MRClassMonkPlaySingle
	END


	IF ~~ THEN BEGIN MRClassMonkPlay4
	SAY @229
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @221 GOTO MRClassMonkPlayGrump
		IF ~Gender(Player1,MALE)
			OR(4)
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("JaheiraRomanceActive","GLOBAL",2)
			Global("ViconiaRomanceActive","GLOBAL",2)
			Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @222 GOTO MRClassMonkPlayGod
			 
		IF ~Gender(Player1,FEMALE) 
			OR(2) 
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("AnomenRomanceActive","GLOBAL",2)~ THEN REPLY @223 GOTO MRClassMonkPlayGod
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @224 GOTO MRClassMonkPlayTactic
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @225 GOTO MRClassMonkPlaySingle
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @226 GOTO MRClassMonkPlaySingle
	END

	IF ~~ THEN BEGIN MRClassMonkPlay5
	SAY @230
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @221 GOTO MRClassMonkPlayGrump
		IF ~Gender(Player1,MALE)
			OR(4)
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("JaheiraRomanceActive","GLOBAL",2)
			Global("ViconiaRomanceActive","GLOBAL",2)
			Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @222 GOTO MRClassMonkPlayGod
			 
		IF ~Gender(Player1,FEMALE) 
			OR(2) 
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("AnomenRomanceActive","GLOBAL",2)~ THEN REPLY @223 GOTO MRClassMonkPlayGod
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @224 GOTO MRClassMonkPlayTactic
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @225 GOTO MRClassMonkPlaySingle
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @226 GOTO MRClassMonkPlaySingle
	END

	IF ~~ THEN BEGIN MRClassMonkPlay6
	SAY @231
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @221 GOTO MRClassMonkPlayGrump
		IF ~Gender(Player1,MALE)
			OR(4)
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("JaheiraRomanceActive","GLOBAL",2)
			Global("ViconiaRomanceActive","GLOBAL",2)
			Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @222 GOTO MRClassMonkPlayGod
			 
		IF ~Gender(Player1,FEMALE) 
			OR(2) 
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("AnomenRomanceActive","GLOBAL",2)~ THEN REPLY @223 GOTO MRClassMonkPlayGod
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @224 GOTO MRClassMonkPlayTactic
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @225 GOTO MRClassMonkPlaySingle
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @226 GOTO MRClassMonkPlaySingle
	END

	IF ~~ THEN BEGIN MRClassMonkPlay7
	SAY @232
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @221 GOTO MRClassMonkPlayGrump
		IF ~Gender(Player1,MALE)
			OR(4)
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("JaheiraRomanceActive","GLOBAL",2)
			Global("ViconiaRomanceActive","GLOBAL",2)
			Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @222 GOTO MRClassMonkPlayGod
			 
		IF ~Gender(Player1,FEMALE) 
			OR(2) 
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("AnomenRomanceActive","GLOBAL",2)~ THEN REPLY @223 GOTO MRClassMonkPlayGod
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @224 GOTO MRClassMonkPlayTactic
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @225 GOTO MRClassMonkPlaySingle
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @226 GOTO MRClassMonkPlaySingle
	END

	IF ~~ THEN BEGIN MRClassMonkPlay8
	SAY @233
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @221 GOTO MRClassMonkPlayGrump
		IF ~Gender(Player1,MALE)
			OR(4)
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("JaheiraRomanceActive","GLOBAL",2)
			Global("ViconiaRomanceActive","GLOBAL",2)
			Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @222 GOTO MRClassMonkPlayGod
			 
		IF ~Gender(Player1,FEMALE) 
			OR(2) 
			Global("ImoenRomanceActive","GLOBAL",2)
			Global("AnomenRomanceActive","GLOBAL",2)~ THEN REPLY @223 GOTO MRClassMonkPlayGod
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @224 GOTO MRClassMonkPlayTactic
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @225 GOTO MRClassMonkPlaySingle
		IF ~Gender(Player1,MALE)
			!Global("ImoenRomanceActive","GLOBAL",2)
			!Global("JaheiraRomanceActive","GLOBAL",2)
			!Global("ViconiaRomanceActive","GLOBAL",2)
			!Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @226 GOTO MRClassMonkPlaySingle
	END

	IF ~~ THEN BEGIN MRClassMonkPlayGrump
		SAY @234 
		IF ~~ THEN GOTO MRClassMonkEnd1
	END

	IF ~~ THEN BEGIN MRClassMonkPlayGod
		SAY @235 
		IF ~~ THEN GOTO MRClassMonkEnd1
	END

	IF ~~ THEN BEGIN MRClassMonkPlayTactic
		SAY @236
		IF ~~ THEN GOTO MRClassMonkEnd1
	END

	IF ~~ THEN BEGIN MRClassMonkPlaySingle
		SAY @237
		IF ~~ THEN GOTO MRClassMonkEnd1
	END

	IF ~~ THEN BEGIN MRClassMonkPower
		SAY @238 
		IF ~~ THEN GOTO MRClassMonkEnd1 
	END

	IF ~~ THEN BEGIN MRClassMonkPeace
		SAY @239
		++ @240 GOTO MRClassMonkPeace2
		++ @241 GOTO MRClassMonkPeace3
		++ @242 GOTO MRClassMonk4
		++ @243 GOTO MRClassMonkPeace5
	END

	IF ~~ THEN BEGIN MRClassMonkPeace2
		SAY @244 
		IF ~~ THEN GOTO MRClassMonkEnd1
	END

	IF ~~ THEN BEGIN MRClassMonkPeace3
		SAY @245
		=
		@246
		=
		@247
		++ @248 GOTO MRClassMonkEnd2Good
		++ @249 GOTO MRClassMonkEvil
		++ @250 GOTO MRClassMonkEnd2
	END


	IF ~~ THEN BEGIN MRClassMonk4
		SAY @251 
		IF ~~ THEN GOTO MRClassMonkEnd1
	END

	IF ~~ THEN BEGIN MRClassMonkPeace5
		SAY @252 
		IF ~~ THEN GOTO MRClassMonkEnd1
	END

	IF ~~ THEN BEGIN MRClassMonkEnd1
		SAY @253
		=
		@254
		++ @255 GOTO MRClassMonkEndTough
		++ @256 GOTO MRClassMonkEndWise
		IF ~NumInPartyGT(2)~ THEN REPLY @257 GOTO MRClassMonkEndSweet
		IF ~NumInParty(2)~ THEN REPLY @258 GOTO MRClassMonkEndSweet
	END

	IF ~~ THEN BEGIN MRClassMonkEndSweet
		SAY @259 
		IF ~~ THEN GOTO MRClassMonkEndSweetExit
	END

	IF ~~ THEN BEGIN MRClassMonkEndSweetExit
		SAY @260
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassMonkEndWise
		SAY @261
		=
		@262
	IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRClassMonkEndTough
		SAY @263
		=
		@262
	IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRClassMonkEnd2Good
		SAY @264 
		IF ~~ THEN GOTO MRClassMonkEnd1
	END

	IF ~~ THEN BEGIN MRClassMonkEnd2
		SAY @265
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRClassMonkEvil
		SAY @266
		IF ~~ THEN EXIT
	END
END

