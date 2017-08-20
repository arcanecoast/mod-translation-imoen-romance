//*** Reunited in Spellhold, after the Ritual ***//
/* Imoen2.dlg is ONLY of imoen rejoin dialogue in spellhold */

REPLACE IMOEN2
	IF ~~ THEN BEGIN 0
	 SAY ~I'm sorry, <CHARNAME>, I was just so worried...~ [ MRImRom1 ]
	 ++ @1 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRReunitedLove
	 ++ @2 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRReunitedHurt
	 ++ @3 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRReunitedOkay
	 ++ @4 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRReunitedWell
	 ++ @5 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRReunitedHurt
	 ++ @6 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRReunitedFinish
	 ++ @7DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRReunitedNo
	END
END


APPEND IMOEN2

	IF ~~ THEN BEGIN MRReunitedLove
		SAY @8
	 ++ @5 GOTO MRReunitedHurt
	 ++ @9 GOTO MRReunitedWell
	 ++ @10 GOTO MRReunitedFinish
	END

	IF ~~ THEN BEGIN MRReunitedHurt 
	 SAY @11 
	 IF ~~ THEN GOTO MRReunited2
	END

	IF ~~ THEN BEGIN MRReunitedWell
	 SAY @12
	 IF ~~ THEN GOTO MRReunited2
	END

	IF ~~ THEN BEGIN MRReunitedFinish 
	 SAY @13
	 IF ~~ THEN GOTO MRReunited2
	END

	IF ~~ THEN BEGIN MRReunited2 
	 SAY @14
	 = @15
	 IF ~~ THEN GOTO MRReunited3
	END

	IF ~~ THEN MRReunited3
	 SAY @16
	 ++ @17 GOTO MRReunited3Dream
	 ++ @18 GOTO MRReunited3Dream
	 ++ @19 GOTO MRReunited3Cope
	 ++ @20 GOTO MRReunited3Cope
	END

	IF ~~ THEN BEGIN MRReunited3Cope
	 SAY @21
	 IF ~~ THEN GOTO MRReunited4
	END

	IF ~~ THEN BEGIN MRReunited3Dream
	 SAY @22
		IF ~~ THEN GOTO MRReunited5
	END

	IF ~~ THEN BEGIN MRReunited4
	 SAY @23
	= @24
	  ++ @25 GOTO MRReunited3Dream
	  ++ @26 GOTO MRReunited3Dream
	END

	IF ~~ THEN BEGIN MRReunitedOkay
		SAY @27
			++ @28 GOTO MRReunitedOkay2
			++ @29 GOTO MRReunitedLove
			++ @30 GOTO MRReunitedWell
			++ @31 GOTO MRReunitedHurt
			++ @32 GOTO MRReunitedFinish
			++ @33 GOTO MRReunitedNo
		END

	IF ~~ THEN BEGIN MRReunitedOkay2
		SAY @34
		= @35
			++ @36 GOTO MRReunitedLove
			++ @2 GOTO MRReunitedHurt 
			++ @37 GOTO MRReunitedWell
			++ @38 GOTO MRReunitedFinish
			++ @39 GOTO MRReunitedNo
		END

	IF ~~ THEN BEGIN MRReunited5
	 SAY @40
	= @41
			++ @42 GOTO MRReunited5End
			++ @43 GOTO MRReunited6
			++ @44 GOTO MRReunited5End
			++ @45 GOTO MRReunited5Dreams
	END

	IF ~~ THEN BEGIN MRReunited5Dreams
		SAY @46
			++ @47 GOTO MRReunited5DreamsAvoid
			++ @48 GOTO MRReunited5DreamsOverload
	END

	IF ~~ THEN BEGIN MRReunited5DreamsAvoid
		SAY @49
		IF ~~ THEN GOTO MRReunited6
	END

	IF ~~ THEN BEGIN MRReunited5DreamsOverload
		SAY @50
		= @51
		IF ~~ THEN GOTO MRReunited6
	END

	IF ~~ THEN BEGIN MRReunited6
	 SAY @52
	 IF ~~ THEN GOTO MRReunited5End
	END

	/* most important conversation split */
	/* note a safe option has been added to not add Imoen to party, this is the old vanilla game choice so you can meet her at copper coronet */
	IF ~~ THEN BEGIN MRReunited5End
		SAY @53
		= @54
		= @55
		IF ~NumInPartyGT(1)
			OR(11)
			IsValidForPartyDialog("Korgan")
			IsValidForPartyDialog("Nalia")
			IsValidForPartyDialog("Aerie")
			IsValidForPartyDialog("Jan")
			IsValidForPartyDialog("Keldorn")
			IsValidForPartyDialog("HaerDalis")
			IsValidForPartyDialog("Anomen")
			IsValidForPartyDialog("Cernd")
			IsValidForPartyDialog("Valygar")
			IsValidForPartyDialog("Mazzy")
			IsValidForPartyDialog("Hexxat")~ THEN REPLY @56 DO ~ ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRIntroductions
		IF ~NumInPartyGT(1)
			!IsValidForPartyDialog("Korgan")
			!IsValidForPartyDialog("Nalia")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Jan")
			!IsValidForPartyDialog("Keldorn")
			!IsValidForPartyDialog("HaerDalis")
			!IsValidForPartyDialog("Anomen")
			!IsValidForPartyDialog("Cernd")
			!IsValidForPartyDialog("Valygar")
			!IsValidForPartyDialog("Mazzy")
			!IsValidForPartyDialog("Hexxat")
			OR(7)
			IsValidForPartyDialog("Jaheira")
			IsValidForPartyDialog("Viconia")
			IsValidForPartyDialog("Edwin")
			IsValidForPartyDialog("Minsc")
			IsValidForPartyDialog("Neera")
			IsValidForPartyDialog("Dorn")
			IsValidForPartyDialog("Rasaad")~ THEN REPLY @56 GOTO MRIntroductionsOld
		IF ~NumInPartyGT(1)
			OR(11)
			IsValidForPartyDialog("Korgan")
			IsValidForPartyDialog("Nalia")
			IsValidForPartyDialog("Aerie")
			IsValidForPartyDialog("Jan")
			IsValidForPartyDialog("Keldorn")
			IsValidForPartyDialog("HaerDalis")
			IsValidForPartyDialog("Anomen")
			IsValidForPartyDialog("Cernd")
			IsValidForPartyDialog("Valygar")
			IsValidForPartyDialog("Mazzy")
			IsValidForPartyDialog("Hexxat")~ THEN REPLY @57 DO ~ ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRIntroductions
		IF ~NumInPartyGT(1)
			!IsValidForPartyDialog("Korgan")
			!IsValidForPartyDialog("Nalia")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Jan")
			!IsValidForPartyDialog("Keldorn")
			!IsValidForPartyDialog("HaerDalis")
			!IsValidForPartyDialog("Anomen")
			!IsValidForPartyDialog("Cernd")
			!IsValidForPartyDialog("Valygar")
			!IsValidForPartyDialog("Mazzy")
			!IsValidForPartyDialog("Hexxat")
			OR(7)
			IsValidForPartyDialog("Jaheira")
			IsValidForPartyDialog("Viconia")
			IsValidForPartyDialog("Edwin")
			IsValidForPartyDialog("Minsc")
			IsValidForPartyDialog("Neera")
			IsValidForPartyDialog("Dorn")
			IsValidForPartyDialog("Rasaad")~ THEN REPLY @57 GOTO MRIntroductionsOld
		IF ~!NumInPartyGT(1)~ THEN REPLY @58 GOTO MRSolod
		  IF ~NumInPartyGT(1) /* Safe option to join if party is all other mod npc's */
			!IsValidForPartyDialog("Korgan")
			!IsValidForPartyDialog("Nalia")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Jan")
			!IsValidForPartyDialog("Keldorn")
			!IsValidForPartyDialog("HaerDalis")
			!IsValidForPartyDialog("Anomen")
			!IsValidForPartyDialog("Cernd")
			!IsValidForPartyDialog("Valygar")
			!IsValidForPartyDialog("Mazzy")
			!IsValidForPartyDialog("Hexxat")
			!IsValidForPartyDialog("Jaheira")
			!IsValidForPartyDialog("Viconia")
			!IsValidForPartyDialog("Edwin")
			!IsValidForPartyDialog("Minsc")
			!IsValidForPartyDialog("Neera")
			!IsValidForPartyDialog("Dorn")
			!IsValidForPartyDialog("Rasaad")~ THEN REPLY #49529 /* ~Then let's get going. Join with me, and we will escape this place immediately.~ */ DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",30)~ GOTO 21
		++ @59 GOTO MRReunited5Kicked
		IF ~~ THEN REPLY #49537 /* ~Because of group balance, I have no room. Can you find your way out alone?~ */ GOTO 22
	END

	IF ~~ THEN BEGIN MRReunited5Kicked
		SAY @60
		= @61
			++ @62 GOTO MRReunitedNo
			++ @63 GOTO MRReunitedInvite
			++ @64 GOTO MRReunitedNo
	END

	IF ~~ THEN BEGIN MRReunitedInvite
		SAY @65
			++ @66 GOTO MRReunitedNo
			++ @67 GOTO MRReunitedInvite2
	END

	IF ~~ THEN BEGIN MRReunitedInvite2
		SAY @68
		= @69
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",30) JoinParty()~ EXIT
	END

	IF ~~ THEN BEGIN MRReunitedNo
		SAY @70
		=
		@71
		IF ~~ THEN GOTO MRReunitedNo2
	END
END

CHAIN IMOEN2 MRReunitedNo2
@72
== KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @73
==JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @74
==AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @75
==VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @76
==NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @77
==MAZZYJ IF ~IsValidForPartyDialog("Mazzy")~ THEN @78
==MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @79
END IMOEN2 MRReunitedNo3

APPEND IMOEN2
	IF ~~ THEN BEGIN MRReunitedNo3
		SAY @80
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) EscapeArea()
		ReputationInc(-2) ActionOverride(Player1,ApplySpellRES("SPMRACNE",Player1))~ EXIT
	END

	IF ~~ THEN BEGIN MRIntroductions
		SAY @81
			++ @82 EXTERN PLAYER1 MRIntroductionsYes
			++ @83 GOTO MRIntroductionsNo
	END
END


APPEND IMOEN2
	IF ~~ THEN BEGIN MRIntroductionsOldNext
		SAY @84
		IF ~OR(2) InParty("Jaheira") InParty("Minsc")~ THEN DO ~ RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",30) JoinParty()~ EXIT
		IF ~!InParty("Jaheira") !InParty("Minsc")~ THEN GOTO MRIntroductionsJM2
	END

	IF ~~ THEN BEGIN MRIntroductionsJM2
		SAY @85
			++ @86 GOTO MRSolodJMLeave
			++ @87 GOTO MRSolodJMLeave
			++ @88 GOTO MRSolodEnd
			++ @89 GOTO MRSolodJMSeparate
			++ @90 GOTO MRSolodJMDied
	END

	IF ~~ THEN BEGIN MRIntroductionsNo
		SAY @91
		=
		@92
		=
		@93
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",30) JoinParty()~ EXIT
	END

	IF ~!NumInPartyGT(2)~ THEN BEGIN MRSolod
		SAY @94
		=
		@95
			++ @96 GOTO MRSolodLoner
			++ @97 GOTO MRSolodBhaal
			++ @98 GOTO MRSolodJMWhere
			++ @99 GOTO MRSolodPower
			++ @100 GOTO MRSolodLoner
			++ @101 GOTO MRSolodLeave
	END

	IF ~~ THEN BEGIN MRSolodLoner
		SAY @102
		= @103
			++ @86 GOTO MRSolodJMLeave
			++ @87 GOTO MRSolodJMLeave
			++ @88 GOTO MRSolodEnd
			++ @89 GOTO MRSolodJMSeparate
			++ @104 GOTO MRSolodJMDied
	END

	IF ~~ THEN BEGIN MRSolodJMWhere
		SAY @105
			++ @86 GOTO MRSolodJMLeave
			++ @87 GOTO MRSolodJMLeave
			++ @88 GOTO MRSolodEnd
			++ @89 GOTO MRSolodJMSeparate
			++ @104 GOTO MRSolodJMDied
	END

	IF ~~ THEN BEGIN MRSolodJMDied
		SAY @106
		= @107
		IF ~~ THEN GOTO MRSolodEnd
	END

	IF ~~ THEN BEGIN MRSolodEnd
		SAY @108 
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",30) JoinParty()~ EXIT
	END

	IF ~~ THEN BEGIN MRSolodJMLeave
		SAY @109
		IF ~~ THEN GOTO MRSolodEnd
	END

	IF ~~ THEN BEGIN MRSolodJMSeparate
		SAY @110 
		IF ~~ THEN GOTO MRSolodEnd
	END

	IF ~~ THEN BEGIN MRSolodBhaal
		SAY @111
		= @112 
		IF ~~ THEN GOTO MRSolodEnd
	END

	IF ~~ THEN BEGIN MRSolodPower
		SAY @113
		= @114
		++ @115 GOTO MRSolodPowerEnd
		++ @116 GOTO MRSolodPowerShadow
		++ @117 GOTO MRSolodPowerNice
		++ @118 GOTO MRSolodPowerShadow
		++ @119 GOTO MRSolodPowerShadow
	END

	IF ~~ THEN BEGIN MRSolodPowerNice
		SAY @120
		= @121
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",30) JoinParty()~ EXIT
	END

	IF ~~ THEN BEGIN MRSolodPowerEnd
		SAY @122
		= @123
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",30) JoinParty()~ EXIT
	END

	IF ~~ THEN BEGIN MRSolodPowerShadow
		SAY @124
		= @125
		= @126
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",30) SetGlobal("ImoenRomanceActive","GLOBAL",4) JoinParty()~ EXIT
	END

	IF ~~ THEN BEGIN MRSolodLeave
		SAY @127
			++ @128 GOTO MRSolodLeave2
			++ @129 GOTO MRSolodLeave2
			++ @130 GOTO MRSolodLeaveJoke
	END

	IF ~~ THEN BEGIN MRSolodLeave2
		SAY @131
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",30) SetGlobal("ImoenRomanceActive","GLOBAL",3) JoinParty()~ EXIT
	END

	IF ~~ THEN BEGIN MRSolodLeaveJoke
		SAY @132
			++ @133 GOTO MRSolodLeave2
			++ @134 GOTO MRSolodLeaveApologize
	END

	IF ~~ THEN BEGIN MRSolodLeaveApologize
		SAY @135
		= @136
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",30) JoinParty()~EXIT
	END
END
