// ~~ New Imoen summoning: romance Imoen easy way ~~
//replace the old summoning dialogue from IMOEN25A state 0


REPLACE IMOEN25A
	IF ~Global("ImoenSummoned","GLOBAL",1)~ THEN BEGIN 0
		SAY @0
		IF ~~ THEN DO ~SetGlobal("ImoenSummoned","GLOBAL",2)~ GOTO Summon1
	END
END


CHAIN IF ~Global("ImoenSummoned","GLOBAL",1)~ THEN IMOEN25A Summon1
	 @1
	= @2
	== AERIE25J IF ~OR(2) GlobalGT("MRAerImFriend","GLOBAL",5) Global("IRTAerImFriend","GLOBAL",1) InParty("Aerie")~ THEN @3
	== IMOEN25A IF ~OR(2) GlobalGT("MRAerImFriend","GLOBAL",5) Global("IRTAerImFriend","GLOBAL",1) InParty("Aerie")~ THEN @4
END
    +~Global("ImoenRomanceActive","GLOBAL",0)~+ @5 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",2) SetGlobal("IRTLoveMeter","GLOBAL",5)~ GOTO Summon6
	++ @6 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ GOTO Summon7
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @5 DO ~ SetGlobal("IRTLoveMeter","GLOBAL",5)~ GOTO Summon6
	++ @7 GOTO Summon3anew
	++ @8 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~ GOTO Summon5
	++ @9 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) SetGlobal("IRTLoveMeter","GLOBAL",-1)~ GOTO Summon4

APPEND IMOEN25A
IF ~~ Summon3anew
	SAY @10
	+~Global("ImoenRomanceActive","GLOBAL",0)~+ @11 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",2) SetGlobal("IRTLoveMeter","GLOBAL",5)~ GOTO Summon6
	++ @12 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ GOTO Summon7
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @11 DO ~SetGlobal("IRTLoveMeter","GLOBAL",5)~ GOTO Summon6
	++ @8 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~ GOTO Summon5
	++ @13 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) SetGlobal("IRTLoveMeter","GLOBAL",-1)~ GOTO Summon3anewAhead
END

IF ~~ Summon3anewAhead
	SAY @14
	= @15
	= @16
	++ @17 DO ~SetGlobal("IRTJustJoined","GLOBAL",1) JoinParty() SetDialog("IMOEN25J")~ EXIT
	++ @18 GOTO Summon7a
	++ @19 GOTO Summon4
END
END

CHAIN IMOEN25A Summon4
	@20
	== BOTSMITH @21
	== IMOEN25A @22
	== BOTSMITH @23
	== IMOEN25A @24 DO ~MoveToObject("BOTSMITH")~ 
EXIT

APPEND IMOEN25A
IF ~~ Summon5
	SAY @25
	= @26
	= @27
	= @16
	= @28
	++ @17 DO ~SetGlobal("IRTJustJoined","GLOBAL",1) JoinParty() SetDialog("IMOEN25J")~ EXIT
	++ @29 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ GOTO Summon5a
	++ @19 GOTO Summon4
END

IF ~~ THEN Summon5a
	SAY @30
	IF ~~ THEN DO ~SetGlobal("IRTJustJoined","GLOBAL",1) JoinParty() SetDialog("IMOEN25J")~ EXIT
END

IF ~~ THEN Summon6
	SAY @31
	= @32
	= @16
	++ @33 GOTO Summon6a
	++ @34 GOTO Summon7a
	++ @35 GOTO Summon4
	++ @36 GOTO Summon4
END

IF ~~ THEN Summon6a
	SAY @37
	IF ~~ THEN DO ~SetGlobal("IRTJustJoined","GLOBAL",1) JoinParty() SetDialog("IMOEN25J")~ EXIT
END
END

APPEND IMOEN25A
IF ~~ THEN Summon7
	SAY @38
	= @15
	= @16
	++ @17 DO ~SetGlobal("IRTJustJoined","GLOBAL",1) JoinParty() SetDialog("IMOEN25J")~ EXIT
	++ @18 GOTO Summon7a
	++ @19 GOTO Summon4
END

IF ~~ THEN Summon7a
	SAY @39
	= @40
	IF ~~ THEN DO ~SetGlobal("IRTJustJoined","GLOBAL",1) JoinParty() SetDialog("IMOEN25J")~ EXIT
END
END

// ~~ Greetings for everyone after being Summoned ~~


CHAIN IF WEIGHT #100 ~Global("IRTJustJoined","GLOBAL",2)~ THEN IMOEN25J SummonHeya
	@41 DO ~SetGlobal("IRTJustJoined","GLOBAL",3)~

	== SAREV25J IF ~InParty("Sarevok")~ THEN @42
	== IMOEN25J IF ~InParty("Sarevok")~ THEN @43
	== SAREV25J IF ~InParty("Sarevok")~ THEN @44
	== IMOEN25J IF ~InParty("Sarevok")~ THEN @45
	== SAREV25J IF ~InParty("Sarevok")~ THEN @46
	== SAREV25J IF ~InParty("Sarevok") Global("SarevokOath","GLOBAL",1)~ THEN @47
	== SAREV25J IF ~InParty("Sarevok") !Global("SarevokOath","GLOBAL",1)~ THEN @48  // Oops, there was a ! missing.
	== SAREV25J IF ~InParty("Sarevok")~ THEN @49
	== IMOEN25J IF ~InParty("Sarevok")~ THEN @50
	== SAREV25J IF ~InParty("Sarevok")~ THEN @51
	== IMOEN25J IF ~NumInPartyGT(3) InParty("Sarevok")~ THEN @52
	== IMOEN25J IF ~!NumInPartyGT(3) InParty("Sarevok")~ THEN @53

	== AERIE25J IF ~Global("IRTAerImFriend","GLOBAL",1) InParty("Aerie")~ THEN @54
	== IMOEN25J IF ~Global("IRTAerImFriend","GLOBAL",1) InParty("Aerie")~ THEN @55
	== AERIE25J IF ~Global("IRTAerImFriend","GLOBAL",1) InParty("Aerie")~ THEN @56
	== AERIE25J IF ~!Global("IRTAerImFriend","GLOBAL",1) InParty("Aerie")~ THEN @57
	== IMOEN25J IF ~!Global("IRTAerImFriend","GLOBAL",1) InParty("Aerie")~ THEN @58
	== AERIE25J IF ~!Global("IRTAerImFriend","GLOBAL",1) InParty("Aerie")~ THEN @59

	== JAN25J IF ~InParty("Jan")~ THEN @60
	== IMOEN25J IF ~InParty("Jan")~ THEN @61
	== JAN25J IF ~InParty("Jan")~ THEN @62
	== JAN25J IF ~InParty("Jan")~ THEN @63
	== IMOEN25J IF ~InParty("Jan")~ THEN @64

	== JAHEI25J IF ~InParty("Jaheira")~ THEN @65
	== IMOEN25J IF ~InParty("Jaheira")~ THEN @66
	== JAHEI25J IF ~InParty("Jaheira")~ THEN @67
	== IMOEN25J IF ~InParty("Jaheira")~ THEN @68
	== IMOEN25J IF ~InParty("Jaheira")~ THEN @69


	== MINSC25J IF ~InParty("Minsc")~ THEN @70
	== IMOEN25J IF ~InParty("Minsc")~ THEN @71
	== MINSC25J IF ~InParty("Minsc")~ THEN @72
	== IMOEN25J IF ~InParty("Minsc")~ THEN @73
	== IMOEN25J IF ~InParty("Minsc")~ THEN @74

	== VICON25J IF ~InParty("Viconia")~ THEN @75
	== IMOEN25J IF ~InParty("Viconia")~ THEN @76
	== VICON25J IF ~InParty("Viconia")~ THEN @77

	== IMOEN25J IF ~InParty("Korgan")~ THEN @78
	== KORGA25J IF ~InParty("Korgan")~ THEN @79
	== IMOEN25J IF ~InParty("Korgan")~ THEN @80
	== KORGA25J IF ~InParty("Korgan")~ THEN @81

	== IMOEN25J IF ~InParty("Nalia")~ THEN @82
	== NALIA25J IF ~InParty("Nalia")~ THEN @83
	== IMOEN25J IF ~InParty("Nalia")~ THEN @84
	== NALIA25J IF ~InParty("Nalia")~ THEN @85
	== IMOEN25J IF ~InParty("Nalia")~ THEN @86

	== MAZZY25J IF ~InParty("Mazzy")~ THEN @87
	== IMOEN25J IF ~InParty("Mazzy")~ THEN @88
	== MAZZY25J IF ~InParty("Mazzy")~ THEN @89
	== IMOEN25J IF ~InParty("Mazzy")~ THEN @90
	== MAZZY25J IF ~InParty("Mazzy")~ THEN @91
	== IMOEN25J IF ~InParty("Mazzy")~ THEN @92
	== MAZZY25J IF ~InParty("Mazzy")~ THEN @93

	== KELDO25J IF ~InParty("Keldorn")~ THEN @94
	== IMOEN25J IF ~InParty("Keldorn")~ THEN @95
	== KELDO25J IF ~InParty("Keldorn")~ THEN @96
	== KELDO25J IF ~InParty("Keldorn")~ THEN @97

	== CERND25J IF ~InParty("Cernd")~ THEN @98
	== IMOEN25J IF ~InParty("Cernd")~ THEN @99
	== CERND25J IF ~InParty("Cernd")~ THEN @100
	== IMOEN25J IF ~InParty("Cernd")~ THEN @101

	== IMOEN25J IF ~InParty("Valygar")~ THEN @102
	== VALYG25J IF ~InParty("Valygar")~ THEN @103
	== IMOEN25J IF ~InParty("Valygar")~ THEN @104
	== VALYG25J IF ~InParty("Valygar")~ THEN @105

	== HAERD25J IF ~InParty("HaerDalis")~ THEN @106
	== IMOEN25J IF ~InParty("HaerDalis")~ THEN @107
	== HAERD25J IF ~InParty("HaerDalis")~ THEN @108

	== ANOME25J IF ~InParty("Anomen")~ THEN @109
	== IMOEN25J IF ~InParty("Anomen")~ THEN @110
	== ANOME25J IF ~InParty("Anomen")~ THEN @111
	== IMOEN25J IF ~InParty("Anomen")~ THEN @112

	== IMOEN25J IF ~InParty("Edwin") Gender("Edwin",MALE)~ THEN @113
	== IMOEN25J IF ~InParty("Edwin") Gender("Edwin",FEMALE)~ THEN @114
	== EDWIN25J IF ~InParty("Edwin")~ THEN @115
	== IMOEN25J IF ~InParty("Edwin")~ THEN @116
	== EDWIN25J IF ~InParty("Edwin")~ THEN @117
	== IMOEN25J IF ~InParty("Edwin") Gender("Edwin",FEMALE)~ THEN @118
	== EDWIN25J IF ~InParty("Edwin") Gender("Edwin",FEMALE)~ THEN @119
	== IMOEN25J IF ~InParty("Edwin") Gender("Edwin",FEMALE)~ THEN @120

	== IMOEN25J @121
EXIT
