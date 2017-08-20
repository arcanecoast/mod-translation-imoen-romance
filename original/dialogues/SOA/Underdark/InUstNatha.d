/* Phaere Innuendo */

EXTEND_TOP UDPHAE01 106 #2
	IF ~OR(2)
	Global("ImoenRomanceActive","GLOBAL",1)
	Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @0 GOTO 110
END

APPEND IMOEN2J
	IF ~Global("PhaereInnuendo","GLOBAL",2)
		Global("MRSleptPhaere","GLOBAL",1)~ THEN BEGIN MRSleptPhaere
		SAY @1
		++ @2 DO ~SetGlobal("MRSleptPhaere","GLOBAL",2)~GOTO MRSleptPhaere1
		++ @3 DO ~SetGlobal("MRSleptPhaere","GLOBAL",2)~ GOTO MRSleptPhaere2
		++ @4 DO ~SetGlobal("MRSleptPhaere","GLOBAL",2)~ GOTO MRSleptPhaere3
	END

	IF ~~ THEN BEGIN MRSleptPhaere1
		SAY @5
		=
		@6
		++ @7 GOTO MRSleptPhaere1Need
		++ @8 GOTO MRSleptPhaere1Proud
		++ @9 GOTO MRSleptPhaere1Proud
	END

	IF ~~ THEN BEGIN MRSleptPhaere1Need
		SAY @10 
		IF ~~ THEN GOTO MRSleptPhaere1Proud
	END

	IF ~~ THEN BEGIN MRSleptPhaere2
		SAY @11 
		IF ~~ THEN GOTO MRSleptPhaere1Proud
	END

	IF ~~ THEN BEGIN MRSleptPhaere3
		SAY @12 
		IF ~~ THEN GOTO MRSleptPhaere1Proud
	END

	IF ~~ THEN BEGIN MRSleptPhaere1Proud
		SAY @13
		=
		@14
		++ @15 EXIT
		++ @16 GOTO MRSleptPhaere1ProudEnd
		++ @17 GOTO MRSleptPhaere1ProudEnd
		++ @18 GOTO MRSleptPhaere1ProudEnd
	END

	IF ~~ THEN BEGIN MRSleptPhaere1ProudEnd
		SAY @19
		IF ~~ THEN EXIT
	END

	IF ~Global("PhaereInnuendo","GLOBAL",3)
		Global("MRSleptPhaere","GLOBAL",1) ~ THEN BEGIN MRNoSleptPhaere
		SAY @20
		++ @21 DO ~SetGlobal("MRSleptPhaere","GLOBAL",2)~ GOTO MRNoSleptPhaere1
		IF ~OR(5)
			IsValidForPartyDialog("Viconia")
			IsValidForPartyDialog("Aerie")
			IsValidForPartyDialog("Anomen")
			IsValidForPartyDialog("Keldorn")
			IsValidForPartyDialog("Jaheira")~ THEN REPLY @22 DO ~SetGlobal("MRSleptPhaere","GLOBAL",2)~ GOTO MRNoSleptPhaere2All
		++ @23 DO ~SetGlobal("MRSleptPhaere","GLOBAL",2)~GOTO MRNoSleptPhaere3
	END
	
	IF ~~ THEN BEGIN MRNoSleptPhaere2All
		SAY@24
		
		IF ~OR(5)
			IsValidForPartyDialog("Viconia")
			IsValidForPartyDialog("Aerie")
			IsValidForPartyDialog("Anomen")
			IsValidForPartyDialog("Keldorn")
			IsValidForPartyDialog("Jaheira")~ THEN GOTO MRNoSleptPhaere2Cler
		
		IF ~IsValidForPartyDialog("Viconia") 
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Anomen")
			!IsValidForPartyDialog("Keldorn")
			!IsValidForPartyDialog("Jaheira")~ THEN GOTO MRNoSleptPhaere2Vic
		IF ~IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Viconia")
			!IsValidForPartyDialog("Anomen")
			!IsValidForPartyDialog("Keldorn")
			!IsValidForPartyDialog("Jaheira")~ THEN GOTO MRNoSleptPhaere2Aer
		IF ~IsValidForPartyDialog("Anomen")
			!IsValidForPartyDialog("Viconia")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Keldorn")
			!IsValidForPartyDialog("Jaheira")~ THEN GOTO MRNoSleptPhaere2Ano
		IF ~IsValidForPartyDialog("Keldorn")
			!IsValidForPartyDialog("Viconia")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Anomen")
			!IsValidForPartyDialog("Jaheira")~ THEN GOTO MRNoSleptPhaere2Kel
		IF ~IsValidForPartyDialog("Jaheira")
			!IsValidForPartyDialog("Viconia")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Anomen")
			!IsValidForPartyDialog("Keldorn")~ THEN GOTO MRNoSleptPhaere2Jah
	END
	
	IF ~~ THEN BEGIN MRNoSleptPhaere3
		SAY @25
		++ @26 GOTO MRNoSleptPhaere1
		++ @27 GOTO MRNoSleptPhaereDistract
		++ @28 GOTO MRNoSleptPhaereEvil
		++ @29 GOTO MRNoSleptPhaereBi
		IF ~OR(4)
		Global("ImoenRomanceActive","GLOBAL",1)
		Global("AerieRomanceActive","GLOBAL",2)
		Global("JaheiraRomanceActive","GLOBAL",2)
		Global("ViconiaRomanceActive","GLOBAL",2)~ THEN REPLY @30 GOTO MRNoSleptPhaereWho
	END
		
	IF ~~ THEN BEGIN MRNoSleptPhaere2Vic
		SAY @31
			++ @32 EXIT
			IF ~IsValidForPartyDialog("Viconia") Global("ViconiaRomanceActive","GLOBAL",2)~ THEN REPLY @33 EXTERN VICONIJ MRNoSleptPhaere1
			IF ~IsValidForPartyDialog("Viconia") !Global("ViconiaRomanceActive","GLOBAL",2)~ THEN REPLY @33 EXTERN VICONIJ MRNoSleptPhaere2
			IF ~CheckStatGT(Player1,9,WIS)
			OR(4)
		Global("AerieRomanceActive","GLOBAL",2)
		Global("JaheiraRomanceActive","GLOBAL",2)
		Global("ViconiaRomanceActive","GLOBAL",2)
		Global("AnomenRomance","GLOBAL",2)~
			THEN REPLY @34 GOTO MRNoSleptPhaere1
	END

	IF ~~ THEN BEGIN MRNoSleptPhaere2Aer
		SAY @35
			++ @32 EXIT
			IF ~IsValidForPartyDialog("Aerie") Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @36 EXTERN AERIEJ NoSleptPhaere1
			IF ~IsValidForPartyDialog("Aerie") !Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @36 EXTERN AERIEJ NoSleptPhaere2
			IF ~CheckStatGT(Player1,9,WIS)
			OR(4)
		Global("AerieRomanceActive","GLOBAL",2)
		Global("JaheiraRomanceActive","GLOBAL",2)
		Global("ViconiaRomanceActive","GLOBAL",2)
		Global("AnomenRomance","GLOBAL",2)~
			THEN REPLY @34 GOTO MRNoSleptPhaere1
	END

	IF ~~ THEN BEGIN MRNoSleptPhaere2Ano
		SAY @37
			++ @32 EXIT
			IF ~IsValidForPartyDialog("Anomen")~ THEN REPLY @38 EXTERN ANOMENJ MRNoSleptPhaere
			IF ~CheckStatGT(Player1,9,WIS)
			OR(4)
		Global("AerieRomanceActive","GLOBAL",2)
		Global("JaheiraRomanceActive","GLOBAL",2)
		Global("ViconiaRomanceActive","GLOBAL",2)
		Global("AnomenRomance","GLOBAL",2)~
			THEN REPLY @34 GOTO MRNoSleptPhaere1
	END

	IF ~~ THEN BEGIN MRNoSleptPhaere2Kel
		SAY @39
			++ @32 EXIT
			IF ~IsValidForPartyDialog("Keldorn")~ THEN REPLY @40 EXTERN KELDORJ MRNoSleptPhaere
			IF ~CheckStatGT(Player1,9,WIS)
			OR(4)
		Global("AerieRomanceActive","GLOBAL",2)
		Global("JaheiraRomanceActive","GLOBAL",2)
		Global("ViconiaRomanceActive","GLOBAL",2)
		Global("AnomenRomance","GLOBAL",2)~
			THEN REPLY @34 GOTO MRNoSleptPhaere1
	END

	IF ~~ THEN BEGIN MRNoSleptPhaere2Jah
		SAY @41
			++ @32 EXIT
			IF ~IsValidForPartyDialog("Jaheira") Global("JaheiraRomanceActive","GLOBAL",2)~ THEN REPLY @42 EXTERN JAHEIRAJ MRNoSleptPhaere1
			IF ~IsValidForPartyDialog("Jaheira") !Global("JaheiraRomanceActive","GLOBAL",2)~ THEN REPLY @42 EXTERN JAHEIRAJ MRNoSleptPhaere2
			IF ~CheckStatGT(Player1,9,WIS)
			OR(4)
		Global("AerieRomanceActive","GLOBAL",2)
		Global("JaheiraRomanceActive","GLOBAL",2)
		Global("ViconiaRomanceActive","GLOBAL",2)
		Global("AnomenRomance","GLOBAL",2)~
			THEN REPLY @34 GOTO MRNoSleptPhaere1
	END
	
	IF ~~ THEN BEGIN MRNoSleptPhaere2Cler
		SAY @43
			++ @32 EXIT
			IF ~IsValidForPartyDialog("Viconia") Global("ViconiaRomanceActive","GLOBAL",2)~ THEN REPLY @33 EXTERN VICONIJ MRNoSleptPhaere1
			IF ~IsValidForPartyDialog("Viconia") !Global("ViconiaRomanceActive","GLOBAL",2)~ THEN REPLY @33 EXTERN VICONIJ MRNoSleptPhaere2
			IF ~IsValidForPartyDialog("Aerie") Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @36 EXTERN AERIEJ NoSleptPhaere1
			IF ~IsValidForPartyDialog("Aerie") !Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @36 EXTERN AERIEJ NoSleptPhaere2
			IF ~IsValidForPartyDialog("Jaheira") Global("JaheiraRomanceActive","GLOBAL",2)~ THEN REPLY @42 EXTERN JAHEIRAJ MRNoSleptPhaere1
			IF ~IsValidForPartyDialog("Jaheira") !Global("JaheiraRomanceActive","GLOBAL",2)~ THEN REPLY @42 EXTERN JAHEIRAJ MRNoSleptPhaere2
			IF ~IsValidForPartyDialog("Anomen")~ THEN REPLY @38 EXTERN ANOMENJ MRNoSleptPhaere
			IF ~IsValidForPartyDialog("Keldorn")~ THEN REPLY @40 EXTERN KELDORJ MRNoSleptPhaere
			IF ~CheckStatGT(Player1,9,WIS)
			OR(4)
			Global("AerieRomanceActive","GLOBAL",2)
			Global("JaheiraRomanceActive","GLOBAL",2)
			Global("ViconiaRomanceActive","GLOBAL",2)
			Global("AnomenRomance","GLOBAL",2)~
			THEN REPLY @34 GOTO MRNoSleptPhaere1
		END
			
END

APPEND VICONIJ
	IF ~~ THEN BEGIN MRNoSleptPhaere1
		 SAY @44
		= @45
		IF ~~ THEN EXTERN IMOEN2J MRNoSleptPhaere4
	END
	IF ~~ THEN BEGIN MRNoSleptPhaere2
		SAY @46 
		IF ~~ THEN EXTERN IMOEN2J MRNoSleptPhaere4
	END
END

APPEND AERIEJ
	IF ~~ THEN BEGIN NoSleptPhaere1
	SAY @47
	= @48
	IF ~~ THEN DO ~RunAwayFrom(Player1,45) SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXTERN IMOEN2J MRNoSleptPhaere4
	END
	
	IF ~~ THEN BEGIN NoSleptPhaere2
	SAY @49
	IF ~~ THEN EXTERN IMOEN2J MRNoSleptPhaere4
	END
END

APPEND JAHEIRAJ
	IF ~~ THEN BEGIN MRNoSleptPhaere1
		SAY @50
		= @51
		IF ~~ THEN DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)~ EXTERN IMOEN2J MRNoSleptPhaere4
 END
	
	IF ~~ THEN BEGIN MRNoSleptPhaere2
		SAY @52
		IF ~~ THEN EXTERN IMOEN2J MRNoSleptPhaere4
 END
END

APPEND ANOMENJ
	IF ~~ THEN BEGIN MRNoSleptPhaere
	SAY @53
	IF ~~ THEN EXTERN IMOEN2J MRNoSleptPhaere4
 END
END

APPEND KELDORJ
 IF ~~ THEN BEGIN MRNoSleptPhaere
		SAY @54
		IF ~~ THEN EXTERN IMOEN2J MRNoSleptPhaere4
 END
END
		


CHAIN IMOEN2J MRNoSleptPhaere1
	@55
	== IMOEN2J IF ~InParty("Viconia")~ THEN @56
	== IMOEN2J IF ~IsValidForPartyDialog("Viconia")~ THEN @57
	== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @58
	== IMOEN2J IF ~IsValidForPartyDialog("Viconia")~ THEN @59
END
	++ @27 GOTO MRNoSleptPhaereDistract
	++ @60 GOTO MRNoSleptPhaereEvil
	++ @29 GOTO MRNoSleptPhaereBi
	IF ~OR(4)
	Global("ImoenRomanceActive","GLOBAL",1)
	Global("AerieRomanceActive","GLOBAL",2)
	Global("JaheiraRomanceActive","GLOBAL",2)
	Global("ViconiaRomanceActive","GLOBAL",2)~ THEN REPLY @30 GOTO MRNoSleptPhaereWho

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRNoSleptPhaere4
		SAY @61
		=
		@62
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRNoSleptPhaereDistract
		SAY @63
		=
		@14
		++ @64 GOTO MRSleptPhaere1ProudEnd
		++ @17 GOTO MRSleptPhaere1ProudEnd
		++ @18 GOTO MRSleptPhaere1ProudEnd
	END

	IF ~~ THEN BEGIN MRNoSleptPhaereBi
		SAY @65
		=
		@14
		++ @66 GOTO MRSleptPhaere1ProudEnd
		++ @17 GOTO MRSleptPhaere1ProudEnd
		++ @18 GOTO MRSleptPhaere1ProudEnd
	END

	IF ~~ THEN BEGIN MRNoSleptPhaereEvil
		SAY @67
		=
		@68 
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRNoSleptPhaereWho
		SAY @69
		=
		@70
		IF ~Global("JaheiraRomanceActive","GLOBAL",2) InParty("Jaheira")~ THEN REPLY @71 GOTO MRNoSleptPhaereReallyJa
		IF ~Global("AerieRomanceActive","GLOBAL",2) InParty("Aerie")~ THEN REPLY @72 GOTO MRNoSleptPhaereReallyAe
		IF ~Global("ViconiaRomanceActive","GLOBAL",2) InParty("Viconia")~ THEN REPLY @73 GOTO MRNoSleptPhaereReallyVi
		IF ~Global("ImoenRomanceActive","GLOBAL",1)~ THEN REPLY @74 GOTO MRNoSleptPhaereReallyIm
		++ @75 GOTO MRNoSleptPhaereReallyHaha
		++ @76 GOTO MRNoSleptPhaereReally
	END
END

CHAIN IMOEN2J MRNoSleptPhaereReallyJa
@77
= @78
== JAHEIRAJ @79
EXIT

CHAIN IMOEN2J MRNoSleptPhaereReallyAe
@80
= @81
	==AERIEJ IF ~Global("SleptAerie","GLOBAL",1)~ THEN @82
	==AERIEJ IF ~!Global("SleptAerie","GLOBAL",1)~ THEN @83
	==IMOEN2J @84
	==IMOEN2J @85
EXIT

CHAIN IMOEN2J MRNoSleptPhaereReallyVi
@86
= @87
	==VICONIJ IF ~Global("SleptViconia","GLOBAL",1)~ THEN @88
	 == IMOEN2J IF ~Global("SleptViconia","GLOBAL",1)~ THEN @89
	 == IMOEN2J IF ~Global("SleptViconia","GLOBAL",1)~ THEN @90
	==VICONIJ IF ~!Global("SleptViconia","GLOBAL",1)~ THEN @91
	==IMOEN2J IF ~!Global("SleptViconia","GLOBAL",1)~ THEN @92
EXIT

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRNoSleptPhaereReally
			 SAY @93
			 =
			@94
			IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN MRNoSleptPhaereReallyHaha
	   SAY @95
	   = @96
	   IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRNoSleptPhaereReallyIm
		 SAY @97
			 ++ @98 GOTO MRNoSleptPhaereReallyIm1
			 ++ @99 EXIT
	END
END

CHAIN IMOEN2J MRNoSleptPhaereReallyIm1
 @100
 =
 @101
 == JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira") Global("MRDreamRomanceComment","LOCALS",1) !Global("JaheiraRomanceActive","GLOBAL",2)~ THEN @102
 == JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira") Global("MRDreamRomanceComment","LOCALS",1) Global("JaheiraRomanceActive","GLOBAL",2)~ THEN @103 DO ~ SetGlobal("JaheiraRomanceActive","GLOBAL",3)~
 ==AERIEJ IF ~IsValidForPartyDialog("Aerie") Global("MRDreamRomanceComment","LOCALS",1) Global("AerieRomanceActive","GLOBAL",2)~ THEN @104 DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~
 ==VICONIJ IF ~IsValidForPartyDialog("Viconia") Global("MRDreamRomanceComment","LOCALS",1) Global("ViconiaRomanceActive","GLOBAL",2)~ THEN @105 DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)~
 ==ANOMENJ IF ~IsValidForPartyDialog("Anomen") Global("MRDreamRomanceComment","LOCALS",1) Global("AnomenRomanceActive","GLOBAL",2) ~ THEN @106 DO ~ SetGlobal("AnomenRomanceActive","GLOBAL",3)~
 == KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @107
 ==MAZZYJ IF ~IsValidForPartyDialog("Mazzy")~ THEN @108
 ==EDWINJ IF ~IsValidForPartyDialog("Edwin")~ THEN @109
 ==KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @110
 == IMOEN2J @111
 = @112
END
	IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT


