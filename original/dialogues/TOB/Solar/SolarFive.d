// Third Solar Revelation
//When you have killed both sendai and abazigal

// Imoen asks about it once you return

// Triggers once you go back to whoever you killed (Sendai or Abazigal) and combat is over. Last line of dialogue is state 58 in SOLAR.DLG
// Triggers as long as !Global("ImoenRomanceActive","GLOBAL",3) and !Global("IRTShutUp","GLOBAL",1)

APPEND IMOEN25J
IF WEIGHT #-5 ~Global("IRTSolarFiveTalk","GLOBAL",1)~ THEN SF
	SAY @0
	IF ~~ THEN DO ~SetGlobal("IRTSolarFiveTalk","GLOBAL",2) SetGlobal("IRTMarriageTalk","GLOBAL",1) SetGlobal("IRTPregnancyTalk","GLOBAL",1)~ GOTO SFN
END

IF ~~ THEN SFN
	SAY @1
	++ @2 + SF1
	++ @3 + SF1
	++ @4 + SF1
	++ @5 + SF2
	++ @6 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-4)~ + SF4
	++ @7 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ + SF3
END

IF ~~ THEN SF1
	SAY @8
	++ @9 + SF1a
	++ @10 + SF1b
	++ @11 + SF1c
	++ @12 + SF1d
	++ @13 + SF1e
END

IF ~~ THEN SF1a
	SAY @14
	= @15
	= @16
	IF ~~ THEN EXIT
END	

IF ~~ THEN SF1b
	SAY @17
	++ @18 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",-2)~ + SF1b1
	++ @19 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",2)~ + SF1b2
	++ @20 + SF1b3
	++ @21 + SF1b4
	++ @22 + SF1b5
END

IF ~~ THEN SF1b1
	SAY @23
	IF ~~ THEN GOTO SF1bEnd
END

IF ~~ THEN SF1bEnd
	SAY @24
	= @25
	IF ~~ THEN EXIT
END

IF ~~ THEN SF1b2
	SAY @26
	IF ~~ THEN GOTO SF1bEnd
END

IF ~~ THEN SF1b3
	SAY @27
	IF ~~ THEN GOTO SF1bEnd
END

IF ~~ THEN SF1b4
	SAY @28
	IF ~~ THEN GOTO SF1bEnd
END

IF ~~ THEN SF1b5
	SAY @29
	IF ~~ THEN GOTO SF1bEnd
END

IF ~~ THEN SF1c
	SAY @30
	++ @31 + SF1c1
	++ @32 + SF1c1
	++ @33 + SF1c2
	++ @34 + SF1c3
	++ @35 + SF1c4
END

IF ~~ THEN SF1c1
	SAY @36
	= @37
	IF ~~ THEN EXIT
END

IF ~~ THEN SF1c2
	SAY @38
	= @39
	IF ~~ THEN EXIT
END

IF ~~ THEN SF1c3
	SAY @40
	= @41
	IF ~~ THEN EXIT
END

IF ~~ THEN SF1c4
	SAY @42
	IF ~~ THEN EXIT
END

IF ~~ THEN SF1d
	SAY @43
	= @44
	IF ~~ THEN EXIT
END

IF ~~ THEN SF1e
	SAY @45
	= @46
	++ @47 + SF1c1
	++ @32 + SF1c1
	++ @33 + SF1c2
	++ @34 + SF1c3
	++ @35 + SF1c4
END
	
IF ~~ THEN SF2
	SAY @48
	IF ~~ THEN EXIT
END

IF ~~ THEN SF3
	SAY @49
	= @50
	IF ~~ THEN EXIT
END

IF ~~ THEN SF4
	SAY @51
	IF ~~ THEN EXIT
END
END
