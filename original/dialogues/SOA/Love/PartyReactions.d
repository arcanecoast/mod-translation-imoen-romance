// *** PARTY COMPLAINTS / COMMENTS ABOUT THE INVOLVEMENT - Set 1 ***

/* These comments can only occur a few days (game time) after Imoen and PC sleep together (MRSleptImoen = 1). However, soem of them have additional conditions (written in the dialog itself) regarding if it occurs before or after the romance is resolved. */


//** Keldorn - Complete**//

APPEND KELDORJ
	IF ~
		Global("MRKeldornReaction","GLOBAL",1)~ THEN BEGIN MRKelReact
	SAY @0
	=
	@1
	=
	@2
	IF ~IsValidForPartyDialog("Imoen2")~ THEN DO ~SetGlobal("MRKeldornReaction","GLOBAL",2)~ EXTERN IMOEN2J MRKelReact
	IF ~!IsValidForPartyDialog("Imoen2")~ THEN DO~SetGlobal("MRKeldornReaction","GLOBAL",2)~ GOTO MRKelReact2
	END
	
	IF ~~ THEN BEGIN MRKelReact2
	SAY @3
		IF ~IsValidForPartyDialog("Imoen2")~ THEN REPLY @4 GOTO MRKelReact3
		IF ~!IsValidForPartyDialog("Imoen2")~ THEN REPLY @5 GOTO MRKelReact3
		++ @6 GOTO MRKelReact3Surprise
		++ @7 GOTO MRKelReact3PreNo
		++ @8 GOTO MRKelReact3Love
	END
	
	IF ~~ THEN BEGIN MRKelReact3
		SAY @9
		IF ~~ THEN GOTO MRKelReact4
	END
	
	IF ~~ THEN BEGIN MRKelReact3PreNo
		SAY @10
			++ @11 GOTO MRKelReact3No
			IF ~IsValidForPartyDialog("Imoen2")~ THEN REPLY @4 GOTO MRKelReact3
			++ @5 GOTO MRKelReact3
			++ @12 GOTO MRKelReact3No
			++ @13 GOTO MRKelReact3Love
 END
	
	IF ~~ THEN BEGIN MRKelReact3Love
		SAY @14
			++ @15 GOTO MRKelReact4
			++ @16 GOTO MRKelReact4
			++ @17 GOTO MRKelReact4
			++ @11 GOTO MRKelReact3No
			++ @18 GOTO MRKelReact3No
	END
	
	IF ~~ THEN BEGIN MRKelReact3No
		SAY @19
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRKelReact3Surprise
		SAY @14
			++ @11 GOTO MRKelReact3No
			++ @20 GOTO MRKelReact3Surprise2
			++ @21 GOTO MRKelReact3Surprise2
			++ @22 GOTO MRKelReact3No
	END

	IF ~~ THEN BEGIN MRKelReact3Surprise2
		SAY @23
			++ @24 GOTO MRKelReactSurpriseBhaal
			++ @25 GOTO MRKelReact3No
			++ @26 GOTO MRKelReact4
	END

	IF ~~ THEN BEGIN MRKelReactSurpriseBhaal
		SAY @27
		IF ~~ THEN GOTO MRKelReact4
	END

	IF ~~ THEN BEGIN MRKelReact4
	SAY @28
		IF ~IsValidForPartyDialog("Imoen2")~THEN EXTERN IMOEN2J MRKelReact4
		IF ~~ THEN GOTO MRKelReact5
	END	
	
	IF ~~ THEN BEGIN MRKelReact5
		SAY @29
		IF ~~ THEN EXIT
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRKelReact
		SAY @30
		IF ~~ THEN EXTERN KELDORJ MRKelReact2
	END
	
	IF ~~ THEN BEGIN MRKelReact4
		SAY @31
		IF ~~ THEN EXTERN KELDORJ MRKelReact5
	END
END
	

// *** Aerie - Complete ***
APPEND AERIEJ
	IF ~Global("MRAerieReaction","GLOBAL",1)  GlobalLT("LoveTalk","LOCALS",17) 
		~ THEN BEGIN MRAerReact
		SAY @32 
		IF ~IsValidForPartyDialog("Imoen2")~ THEN DO ~SetGlobal("MRAerieReaction","GLOBAL",2)~ GOTO MRAerReact2
	END
END

CHAIN AERIEJ MRAerReact2
@33
==IMOEN2J IF ~IsValidForPartyDialog("Imoen2")~ THEN @34
==AERIEJ @35
=@36
EXIT

CHAIN
IF ~Global("MRAerieReaction","GLOBAL",1) GlobalGT("LoveTalk","LOCALS",16) Global("AerieRomanceActive","GLOBAL",3)~ THEN AERIEJ MRAerImConflict
@37
DO ~SetGlobal("MRAerieReaction","GLOBAL",2)~
== IMOEN2J @38
== AERIEJ @39
== IMOEN2J @40
== IMOEN2J @41
== AERIEJ @42
== IMOEN2J @43
== AERIEJ @44
= @45
= @46
== IMOEN2J @47
== AERIEJ @48
== IMOEN2J @49
= @50
== AERIEJ @51
== IMOEN2J @52
= @53
== AERIEJ @54
== IMOEN2J @55
== AERIEJ @56
== IMOEN2J @57
== AERIEJ @58
== IMOEN2J @59
== AERIEJ @60
== IMOEN2J @61
== AERIEJ @62
== IMOEN2J @63
EXIT

	
// *** Viconia - Complete ***


APPEND VICONIJ
	IF ~Global("MRViconiaReaction","GLOBAL",1)
		~ THEN BEGIN MRVicReact
		SAY @64
		IF ~Gender(Player1,MALE)~ THEN DO ~SetGlobal("MRViconiaReaction","GLOBAL",2)~ GOTO MRVicReactMale
		IF ~Gender(Player1,FEMALE)~ THEN DO ~SetGlobal("MRViconiaReaction","GLOBAL",2)~ GOTO MRVicReactFemale
	END

	IF ~~ THEN BEGIN MRVicReactMale
		SAY @65
		IF ~~ THEN GOTO MRVicReact2
	END

	IF ~~ THEN BEGIN MRVicReactFemale
		SAY @66
		=
		@67
		=
		@68
		IF ~~ THEN GOTO MRVicReact2
	END

	IF ~~ THEN BEGIN MRVicReact2
		SAY @69
		IF ~!IsValidForPartyDialog("Imoen2")~ THEN GOTO MRVicReact3
		IF ~IsValidForPartyDialog("Imoen2")~THEN EXTERN IMOEN2J MRVicReact2
	END
END

CHAIN IMOEN2J MRVicReact2
@70
==VICONIJ @71
==IMOEN2J @72
END VICONIJ MRVicReact3

APPEND VICONIJ
	IF ~~ THEN BEGIN MRVicReact3
		SAY @73
		IF ~IsValidForPartyDialog("Imoen2")~ THEN REPLY @74 GOTO MRVicReactExitBoring
		IF ~!IsValidForPartyDialog("Imoen2")~ THEN REPLY @75 GOTO MRVicReactExitBoring
		++ @76 GOTO MRVicReactExitBoring
		IF ~IsValidForPartyDialog("Imoen2")~ THEN REPLY @77 GOTO MRVicReact3Caught
		++ @78 EXTERN IMOEN2J MRVicReactLove
		++ @79 EXTERN IMOEN2J MRVicReact3Hey
		++ @80 EXTERN IMOEN2J MRVicReact3Hey
		++ @81 GOTO MRVicReact3Sorry
	END

	IF ~~ THEN BEGIN MRVicReact3Caught
		SAY @82
		=
		@83
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRVicReact3Sorry
		SAY @84
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRVicReactExitBoring
		SAY @85
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRVicReact3Trained
		SAY @86
		IF ~~ THEN EXTERN IMOEN2J MRVicReact3Dog
	END
END 

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRVicReactLove
	SAY @87
	=
	@88
	=
	@89
	IF ~~ THEN EXTERN VICONIJ MRVicReactExitBoring
	END

	IF ~~ THEN BEGIN MRVicReact3Hey
	SAY @90
	++ @91 EXTERN VICONIJ MRVicReact3Trained
	++ @92 EXTERN VICONIJ MRVicReact3Trained
	END
	
	IF ~~ THEN BEGIN MRVicReact3Dog
	SAY @93
	++ @94 GOTO MRVicReact3DogNo
	++ @95 GOTO MRVicReact3DogNo
	++ @96 GOTO MRVicReact3DogYes
	END

	IF ~~ THEN BEGIN MRVicReact3DogNo
	SAY @97
	IF ~~ THEN EXTERN VICONIJ MRVicReactExitBoring
	END

	IF ~~ THEN BEGIN MRVicReact3DogYes
	SAY @98
	= @99
	= @100
	IF ~~ THEN EXTERN VICONIJ MRVicReactExitBoring
	END
END

/* Jaheira - Complete (see NPC banter file) */
APPEND JAHEIRAJ
	IF ~Global("MRJaheiraReaction","GLOBAL",1)~ THEN BEGIN JTMR1
		SAY@101
		=
		@102
		IF ~Gender(Player1,MALE)~ THEN DO ~SetGlobal("MRJaheiraReaction","GLOBAL",2) ~ GOTO JTMR2
		IF ~Gender(Player1,FEMALE)~ THEN DO ~SetGlobal("MRJaheiraReaction","GLOBAL",2)~ GOTO JTMR3
	END

	IF ~~ THEN BEGIN JTMR2
		SAY @103
		IF ~~ THEN GOTO JTMR4
	END

	IF ~~ THEN BEGIN JTMR3
		SAY @104
		IF ~~ THEN GOTO JTMR4
	END

	IF ~~ THEN BEGIN JTMR4
		SAY @105
		IF ~~ THEN GOTO JTMR4a
	END

	IF ~~ THEN BEGIN JTMR4a
		SAY @106
		IF ~!IsValidForPartyDialog("Imoen2")~ THEN GOTO JTMR5
		IF ~IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2J JTMR4acha
	END
END

CHAIN IMOEN2J JTMR4acha
@107
DO ~ActionOverride(Player1,SetDialog("Player1"))~
==JAHEIRAJ @108
END JAHEIRAJ JTMR5

APPEND JAHEIRAJ
	IF ~~ THEN BEGIN JTMR5
		SAY @109
		IF ~~ THEN REPLY @110 GOTO JTMR11
		IF ~~ THEN REPLY @111 GOTO JTMR11
		IF ~~ THEN REPLY @112 GOTO JTMR11
		IF ~~ THEN REPLY @113 GOTO JTMR11
		IF ~!IsValidForPartyDialog("Imoen2")~ THEN REPLY @114 GOTO JTMR12
		IF ~IsValidForPartyDialog("Imoen2")~ THEN REPLY @114  EXTERN IMOEN2J JTMR10acha
	END

	IF ~~ THEN BEGIN JTMR11
		SAY @115
		=
		@116
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN JTMR12
		SAY @117
		IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1"))~ EXTERN PLAYER1 JTMRGoOn
	END	
END

APPEND PLAYER1
	IF ~~ THEN BEGIN JTMRGoOn
		SAY@118
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~
		EXIT
	END

END

CHAIN IMOEN2J JTMR10acha
	@119
	=
	@120
	== JAHEIRAJ
	 @121
END JAHEIRAJ JTMR12

/* Jan - Complete */

CHAIN
IF ~Global("MRJanReaction","GLOBAL",1)~ THEN JANJ MRJanReact
	@122
	DO ~SetGlobal("MRJanReaction","GLOBAL",2)~
	== IMOEN2J @123
	== JANJ @124
	== IMOEN2J @125
	== JANJ @126
	== IMOEN2J @127
	== JANJ @128
	== IMOEN2J @129
	== JANJ @130
	== IMOEN2J @131
	== JANJ @132
	== IMOEN2J @133
	== JANJ @134
	== IMOEN2J @135
	== JANJ @136
EXIT

/* Nalia - Complete */

APPEND NALIAJ
	IF ~Global("MRNaliaReaction","GLOBAL",1)
	OR(2)
	Global("ImoenRomanceActive","GLOBAL",1)
	Global("ImoenRomanceActive","GLOBAL",2)
	Global("MRSleptImoen","GLOBAL",1)
	OR(5)
		InParty("Keldorn")
		InParty("Anomen")
		InParty("Jaheira")
		InParty("Korgan")
		InParty("Valygar")~ THEN BEGIN MRNalReact
		SAY @137
		IF ~~ THEN REPLY @138 DO ~SetGlobal("MRNaliaReaction","GLOBAL",2)~ GOTO MRNalReact2
		IF ~~ THEN REPLY @139 DO ~SetGlobal("MRNaliaReaction","GLOBAL",2)~ GOTO MRNalReactImportant
	END

	IF ~~ THEN BEGIN MRNalReactImportant
		SAY @140
		++ @141 GOTO MRNalReact2
		++ @142 GOTO MRNalReactEnd
		++ @143 GOTO MRNalReact2
	END

	IF ~~ THEN BEGIN MRNalReactEnd
		SAY @144
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRNalReact2
		SAY @145
		= @146
		IF ~Gender(PLAYER1,FEMALE)~ THEN GOTO MRNalReact2Woman
		IF ~Gender(PLAYER1,MALE)~ THEN REPLY @147 GOTO MRNalReact3
		IF ~Gender(PLAYER1,MALE)~ THEN REPLY @148 GOTO MRNalReact2Tell
		IF ~Gender(PLAYER1,MALE)~ THEN REPLY @149 GOTO MRNalReact3
		IF ~Gender(PLAYER1,MALE)~ THEN REPLY @150 GOTO MRNalReact3Friends
	END
	
	IF ~~ THEN BEGIN MRNalReact2Woman
		SAY @151
		++ @147 GOTO MRNalReact3
		++ @148 GOTO MRNalReact2Tell
		++ @149 GOTO MRNalReact3
		++ @150 GOTO MRNalReact3Friends
	END
		
	IF ~~ THEN BEGIN MRNalReact2Tell
		SAY @152
		IF ~~ THEN GOTO MRNalReact3
	END

	IF ~~ THEN BEGIN MRNalReact3Friends
		SAY @153
		= @154
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRNalReact3
		SAY @155
		= @156
		IF ~~ THEN EXIT
	END
END


/* Cernd - Complete*/

APPEND CERNDJ

	IF ~Global("MRCerndReaction","GLOBAL",1)~ THEN BEGIN MRCerReact1
		SAY @157
		IF ~InParty("Jaheira") Global("MRJaheiraReaction","GLOBAL",2)~ THEN REPLY @158 DO ~SetGlobal("MRCerndReaction","GLOBAL",2)~ GOTO MRCerReactJah
		IF ~OR(2)!InParty("Jaheira") !Global("MRJaheiraReaction","GLOBAL",2)~ THEN REPLY @159 DO ~SetGlobal("MRCerndReaction","GLOBAL",2)~ GOTO MRCerReact
	END
	
	IF ~~ THEN BEGIN MRCerReactJah //* Only if Jaheira's in the part, see above *//
		SAY @160
			++ @161 GOTO MRCerReact
			++ @162 EXIT
			++ @163 GOTO MRCerReact
	END

	IF ~~ THEN BEGIN MRCerReact
		SAY @164
		= @165
		= @166
		++ @167 GOTO MRCerReactSpeak
		++ @168 GOTO MRCerReactEnd
		++ @169 GOTO MRCerReactTroll
	END

	IF ~~ THEN BEGIN MRCerReactSpeak
		SAY @170
		IF ~Gender(PLAYER1,MALE)~ THEN REPLY @171 GOTO MRCerReactChildren
		IF ~Gender(PLAYER1,FEMALE)~ THEN REPLY @172 GOTO MRCerReactWomen
		++ @173 GOTO MRCerReactEnd
	END

	IF ~~ THEN BEGIN MRCerReactChildren
		SAY @174
		++ @169 GOTO MRCerReactTroll
		++ @175 GOTO MRCerReactEnd
	END

	IF ~~ THEN BEGIN MRCerReactWomen
		SAY @176
		++ @169 GOTO MRCerReactTroll
		++ @175 GOTO MRCerReactEnd
	END

	IF ~~ THEN BEGIN MRCerReactTroll
		SAY @177
		= @178
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRCerReactEnd
		SAY @179
		IF ~~ THEN EXIT
	END
END

/* Anomen - Complete */

APPEND ANOMENJ
	IF ~Global("MRAnomenReaction","GLOBAL",1) Gender(PLAYER1,MALE)~ THEN BEGIN MRAnoReactMale
		SAY @180
		=@181
		IF ~IsValidForPartyDialog("Imoen2")~ THEN DO ~SetGlobal("MRAnomenReaction","GLOBAL",2)~ EXTERN IMOEN2J MRAnoReact
	END

	IF ~Global("MRAnomenReaction","GLOBAL",1) Gender(PLAYER1,FEMALE)~ THEN BEGIN MRAnoReactFemale
		SAY @180
		= @182
		IF ~IsValidForPartyDialog("Imoen2")~ THEN DO ~SetGlobal("MRAnomenReaction","GLOBAL",2)~ EXTERN IMOEN2J MRAnoReact
	END

	IF ~~ THEN BEGIN MRAnoReact2
		SAY @183
		++ @184 GOTO MRAnoReact3
		++ @185 GOTO MRAnoReact3
		++ @186 GOTO MRAnoReact3
	END

	IF ~~ THEN BEGIN MRAnoReact3
		SAY @187
		IF ~~ THEN EXIT
	END
END

CHAIN IMOEN2J MRAnoReact
	@188
	== ANOMENJ IF ~Global("AnomenIsKnight","GLOBAL",1)~ THEN @189
	== ANOMENJ IF ~Global("AnomenIsNotKnight","GLOBAL",1)~ THEN @190
END ANOMENJ MRAnoReact2



/* Valygar - Complete */

APPEND VALYGARJ
	IF ~Global("MRValygarReaction","GLOBAL",1)~ THEN BEGIN MRValSilent
		SAY @191
		IF ~~ THEN REPLY @192 DO ~SetGlobal("MRValygarReaction","GLOBAL",2)~ GOTO MRValReact
		IF ~~ THEN REPLY @193 DO ~SetGlobal("MRValygarReaction","GLOBAL",2)~ EXIT
	END

	IF ~~ THEN BEGIN MRValReact
		SAY @194
			++ @195 GOTO MRValReact2
			++ @196 EXIT
			++ @197 GOTO MRValReact2
	END

	IF ~~ THEN BEGIN MRValReact2
		SAY @198
			IF ~OR(6)
				Class(PLAYER1,MAGE)
				Class(PLAYER1,FIGHTER_MAGE)
				Class(PLAYER1,FIGHTER_MAGE_THIEF)
				Class(PLAYER1,MAGE_THIEF)
				Class(PLAYER1,CLERIC_MAGE)
				Class(PLAYER1,FIGHTER_MAGE_CLERIC)~ THEN REPLY @199 GOTO MRValReact3Mages
			IF ~OR(6)
				Class(PLAYER1,MAGE)
				Class(PLAYER1,FIGHTER_MAGE)
				Class(PLAYER1,FIGHTER_MAGE_THIEF)
				Class(PLAYER1,MAGE_THIEF)
				Class(PLAYER1,CLERIC_MAGE)
				Class(PLAYER1,FIGHTER_MAGE_CLERIC)~ THEN REPLY @199 GOTO MRValReact3Mage
			++ @200 EXIT
	END

	IF ~~ THEN BEGIN MRValReact3Mages
		SAY @201
		IF ~~ THEN GOTO MRValReact3Plural
	END
	
	IF ~~ THEN BEGIN MRValReact3Mage
		SAY @201
		IF ~~ THEN GOTO MRValReact3Imoen
	END

	IF ~~ THEN BEGIN MRValReact3Imoen
		SAY @202
		= @203
		IF ~IsValidForPartyDialog("Imoen2")~THEN EXTERN IMOEN2J MRValReact
		IF ~!IsValidForPartyDialog("Imoen2")~ THEN REPLY @204 GOTO MRValReact4
		IF ~!IsValidForPartyDialog("Imoen2")~ THEN REPLY @205 GOTO MRValReact2ImoenCowled
		IF ~!IsValidForPartyDialog("Imoen2")~ THEN REPLY @206 GOTO MRValReactDumb
			++ @207 EXIT
	END

	IF ~~ THEN BEGIN MRValReact3Imoen2	
		SAY @208
			++ @204 + MRValReact4
			IF ~Gender(PLAYER1,FEMALE)~ THEN REPLY @209 EXTERN IMOEN2J MRValReact2Female
			IF ~Gender(PLAYER1,MALE)~ THEN REPLY @209 EXTERN IMOEN2J MRValReact2Male
			++ @206 GOTO MRValReactDumb
			++ @210 EXIT
	END

	IF ~~ THEN BEGIN MRValReact3Imoen3
		SAY @211
			++ @212 + MRValReactDumb
			++ @213 + MRValReact4
			++ @210 EXIT
	END

	IF ~~ THEN BEGIN MRValReact2ImoenCowled
		SAY @214
			++ @212 GOTO MRValReactDumb
			++ @213 + MRValReact4
			++ @210 EXIT
	END

	IF ~~ THEN BEGIN MRValReact3Plural
		SAY @215
			++ @216 GOTO MRValReact3Plural1
			++ @212 GOTO MRValReactDumb
			++ @217 GOTO MRValReact4
			++ @210 EXIT
	END

	IF ~~ THEN BEGIN MRValReact3Plural1
		SAY @218
			++ @217 GOTO MRValReact4
			++ @212 GOTO MRValReactDumb
	END

	IF ~~ THEN BEGIN MRValReactDumb
		SAY @219
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRValReact4
		SAY @220 
		IF ~~ THEN GOTO MRValReactDumb
	END
END

	
APPEND IMOEN2J
	IF ~~ THEN BEGIN MRValReact
		SAY @221
		IF ~~ THEN EXTERN VALYGARJ MRValReact3Imoen2
	END

	IF ~~ THEN BEGIN MRValReact2Female
		SAY @222
		IF ~~ THEN DO ~RunAwayFrom(Player1,45)~ EXTERN VALYGARJ MRValReact3Imoen3
	END

	IF ~~ THEN BEGIN MRValReact2Male
		SAY @223
		IF ~~ THEN DO ~RunAwayFrom(Player1,45)~ EXTERN VALYGARJ MRValReact3Imoen3
	END
END
	

/* Korgan - */

/* He only comments if you're both women, 'cause he's a lowlife perv */

APPEND KORGANJ
	IF ~Global("MRKorganReaction","GLOBAL",1)~ THEN BEGIN MRKorReact
		SAY @224
			IF ~OR(2) CheckStatLT(PLAYER1,12,CHR) Race(PLAYER1,HALFORC)~ THEN DO ~SetGlobal("MRKorganReaction","GLOBAL",2)~EXTERN IMOEN2J MRKorReactUgly
			IF ~CheckStatGT(PLAYER1,11,CHR) !Race(PLAYER1,HALFORC)~ THEN DO ~SetGlobal("MRKorganReaction","GLOBAL",2)~ EXTERN IMOEN2J MRKorReactCute
	END
END

CHAIN IMOEN2J MRKorReactUgly
@225
== KORGANJ IF ~OR(2) CheckStatLT(PLAYER1,12,CHR) Race(PLAYER1,HALFORC)~ THEN @226
== IMOEN2J IF ~OR(2) CheckStatLT(PLAYER1,12,CHR) Race(PLAYER1,HALFORC)~ THEN @227
== KORGANJ IF ~OR(2) CheckStatLT(PLAYER1,12,CHR) Race(PLAYER1,HALFORC)~ THEN @228
== IMOEN2J IF ~OR(2) CheckStatLT(PLAYER1,12,CHR) Race(PLAYER1,HALFORC)~ THEN @229
END
IF ~~ THEN DO ~ActionOverride("Imoen2",ForceSpell("Korgan",WIZARD_BLINDNESS))~ EXIT

CHAIN IMOEN2J MRKorReactCute
@225
== KORGANJ @230
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @231
== NALIAJ IF ~!IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Nalia")~ THEN @232
== KELDORJ IF ~!IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Keldorn")~ THEN @233
== IMOEN2J IF ~!IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Keldorn")~ THEN @234
END
IF ~~ THEN DO ~ActionOverride("Imoen2",ForceSpell("Korgan",WIZARD_BLINDNESS)) ActionOverride("Imoen2",ForceSpell("Korgan",WIZARD_BLINDNESS))~ EXTERN IMOEN2J MRKorReactCuteEnd

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRKorReactCuteEnd
		SAY @235
		IF ~~ THEN EXIT
	END
END
	
/* These people don't comment directly on the relationship: Mazzy, Minsc, Edwin, Haer'Dalis */
