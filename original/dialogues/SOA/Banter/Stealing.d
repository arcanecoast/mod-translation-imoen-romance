// ***Stealing***
// ***Ring of Gaxx***
APPEND BIMOEN2

	IF ~Global("MRStealGaxx","LOCALS",0)
	InPartySlot(LastTalkedToBy,0) 
		!StateCheck(Player1,CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty("Imoen2")
		See(Player1)
		!ActuallyInCombat()
		AreaType(CITY)
		HasItem("Player1","ring39")~ THEN BEGIN MRStealGaxx
		SAY ~<CHARNAME>...~ [ MRImRom3 ]
		IF ~~ THEN DO ~SetGlobal("MRStealGaxx","LOCALS",1)~ GOTO MRStealGaxx2
	END

	IF ~~ THEN BEGIN MRStealGaxx2
		SAY @1
		++ @2 GOTO MRStealGaxx3
		++ @3 GOTO MRStealGaxx3
		++ @4 GOTO MRStealGaxxNo
		++ @5 GOTO MRStealGaxxQuick
		++ @6 GOTO MRStealGaxxYell
	END

	IF ~~ THEN BEGIN MRStealGaxxYell
		SAY @7
		=
		@8
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	END


	IF ~~ THEN BEGIN MRStealGaxxQuick
		SAY @9 
		IF ~~ THEN GOTO MRStealGaxx3
	END

	IF ~~ THEN BEGIN MRStealGaxxNo
		SAY @10
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStealGaxx3
		SAY @11
		=
		@12
		=
		@13
		++ @14 GOTO MRStealGaxx4
		++ @15 GOTO MRStealGaxx4
		++ @16 GOTO MRStealGaxx4
		++ @17 GOTO MRStealGaxx4
		IF ~CheckStatGT(Player1,13,WIS)~ THEN REPLY @18 GOTO MRStealGaxxCaught
		++ @19 GOTO MRStealGaxxRot
	END

	IF ~~ THEN BEGIN MRStealGaxxRot
		SAY @20
		=
		@21
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) RunAwayFrom("Player1",45)~ EXIT
	END

	IF ~~ THEN BEGIN MRStealGaxxCaught
		SAY @22
		++ @23 GOTO MRStealGaxx4
		++ @24 GOTO MRStealGaxxCaught2
	END

	IF ~~ THEN BEGIN MRStealGaxxCaught2
		SAY @25
		=
		@26
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStealGaxx4
		SAY @27
		=
		@28
		IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRStealGaxxNotice
	END

	IF ~~ THEN BEGIN MRStealGaxxNotice
		 SAY @29
		IF ~~ THEN EXTERN PLAYER1 MRStealGaxxStolen
	END



	IF ~~ THEN BEGIN MRStealGaxxStolen1
		SAY @30
		=
		@31
		++ @32 GOTO MRStealGaxxHow
		++ @33 GOTO MRStealGaxxKeep
		++ @34 GOTO MRStealGaxxBack
		++ @35 GOTO MRStealGaxxHate
		++ @36 GOTO MRStealGaxxPower
		++ @37 GOTO MRStealGaxxKeepApa
	END

	IF ~~ THEN BEGIN MRStealGaxxKeep
		SAY @38
		= @39
		++ @40 GOTO MRStealGaxxKeep1
		++ @41 GOTO MRStealGaxxKeep1
		++ @42 GOTO MRStealGaxxKeepApa
	END

	IF ~~ THEN BEGIN MRStealGaxxKeep1
		SAY @43
		= @44
		= @45
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStealGaxxKeepApa
		SAY @46
		=
		@47
		++ @48 GOTO MRStealGaxxBack
		++ @36 GOTO MRStealGaxxPower
		++ @49 GOTO MRStealGaxxApa2
		++ @50 GOTO MRStealGaxxApa2
	END

	IF ~~ THEN BEGIN MRStealGaxxApa2
		SAY @51
		=
		@52
		=
		@53
		=
		@54
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStealGaxxKeepApa2a
		SAY @55
		++ @56 GOTO MRStealGaxxBack
		++ @57 GOTO MRStealGaxxApa2
		++ @50 GOTO MRStealGaxxApa2
	END


	IF ~~ THEN BEGIN MRStealGaxxPower
		SAY @58
		++ @59 GOTO MRStealGaxxBack
		++ @60 GOTO MRStealGaxxKeepApa2a
	END

	IF ~~ THEN BEGIN MRStealGaxxBack
		SAY @61
		++ @62 GOTO MRStealGaxxBack2
		++ @63 GOTO MRStealGaxxKeepApa2a
	END

	IF ~~ THEN BEGIN MRStealGaxxBack2
		SAY @64
		++ @65 GOTO MRStealGaxxGaxx2
		++ @63 GOTO MRStealGaxxKeepApa2a 
		++ @66 GOTO MRStealGaxxKeepApa2a
	END
		
	IF ~~ THEN BEGIN MRStealGaxxGaxx2
		SAY @67
		++ @68 GOTO MRStealGaxxThreat
		++ @69 GOTO MRStealGaxxThreat
		++ @70 GOTO MRStealGaxxKeep2
		++ @71 GOTO MRStealGaxxKeep2
	END

	IF ~~ THEN BEGIN MRStealGaxxKeep2
		SAY @72
		IF ~~ THEN GOTO MRStealGaxxKeepApa2a
	END

	IF ~~ THEN BEGIN MRStealGaxxThreat
		SAY @73
			++ @74 GOTO MRStealGaxxApa2
			++ @75 GOTO MRStealGaxxHuff
	END

	IF ~~ THEN BEGIN MRStealGaxxHuff
		SAY @76
		= @77
		=@78
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStealGaxxHate
		SAY @79
		++ @80 GOTO MRStealGaxxBack2
		++ @81 GOTO MRStealGaxxChild
		++ @82 GOTO MRStealGaxxApa2
	END

	IF ~~ THEN BEGIN MRStealGaxxChild
		SAY @83
		=
		@84
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStealGaxxHow
		SAY @85
		++ @86 GOTO MRStealGaxxBack2
		++ @87 GOTO MRStealGaxxKeepApa
		++ @88 GOTO MRStealGaxxChild
		++ @82 GOTO MRStealGaxxApa2
	END
END

APPEND PLAYER1

IF ~~ THEN BEGIN MRStealGaxxStolen
		SAY @89
                = @90
                = @91
		IF ~~ THEN EXTERN BIMOEN2 MRStealGaxxStolen1
	END
END