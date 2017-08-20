// Fourth Solar Revelation

// Imoen asks about it once you return to Balthazar's Chambers

//  Triggers once you go back to Balthazar's chamber. Last line of dialogue is state 67 in SOLAR.DLG
// Triggers as long as !Global("ImoenRomanceActive","GLOBAL",3) and !Global("IRTShutUp","GLOBAL",1)

APPEND IMOEN25J
IF WEIGHT #-5 ~Global("IRTSolarMelissanTalk","GLOBAL",1)~ THEN M
	SAY @0
	++ @1 DO ~SetGlobal("IRTSolarMelissanTalk","GLOBAL",2)~ + M1
	++ @2 DO ~SetGlobal("IRTSolarMelissanTalk","GLOBAL",2)~ + M2
	++ @3 DO ~SetGlobal("IRTSolarMelissanTalk","GLOBAL",2)~ + M3
	++ @4 DO ~SetGlobal("IRTSolarMelissanTalk","GLOBAL",2)~ + M4
	++ @5 DO ~SetGlobal("IRTSolarMelissanTalk","GLOBAL",2)~ + M5

END
	
IF ~~ THEN M1
	SAY @6
	= @7
	++ @8 + M2
	++ @9 + M4
	++ @5 + M5
	++ @10 + M6Plus

	++ @11 + M7
END

IF ~~ THEN M2
	SAY @12
	= @13
	++ @14 + M2a
	++ @15 + M2b
	++ @16 + M4a
	++ @17 + M2c
	++ @18 + M4
	++ @19 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + M4
END

IF ~~ THEN M2a
	SAY @20
	IF ~~ THEN GOTO M2End
END

IF ~~ THEN M2End
	SAY @21
	IF ~~ THEN EXIT
END

IF ~~ THEN M2b
	SAY @22
	= @23
	IF ~~ THEN EXIT
END

IF ~~ THEN M2c
	SAY @24
	IF ~~ THEN GOTO M2End
END


IF ~~ THEN M3
	SAY @25
	= @26
	++ @27 + M3a
	++ @28 + M3b
	++ @29 + M3a
	++ @30 + M3c
	++ @31 + M3d
END

IF ~~ THEN M3a
	SAY @32
	IF ~~ THEN EXIT
END

IF ~~ THEN M3b
	SAY @33
	= @34 
	IF ~~ THEN EXIT
END

IF ~~ THEN M3c
	SAY @35
	= @36
	IF ~~ THEN EXIT
END

IF ~~ THEN M3d
	SAY @37
	= @38
	IF ~~ THEN EXIT
END

IF ~~ THEN M4
	SAY @39
	++ @40 + M4a
	++ @41 + M4a
	++ @42 + M4a
	++ @43 + M4a
END

IF ~~ THEN M4a
	SAY @44
	= @45
	= @46
	IF ~~ THEN EXIT
END

IF ~~ THEN M5
	SAY @47
	++ @2 + M2
	++ @48 + M3
	++ @49 + M4
	++ @10 + M6Plus
	++ @50 + M7
END

IF ~~ THEN M6
	SAY @51
	++ @2 + M2
	++ @48 + M3
	++ @49 + M4
	++ @10 + M6Plus
	++ @50 + M7
END

IF ~~ THEN M6Plus
	SAY @52
	= @53
	= @54
	= @55
	IF ~~ THEN EXIT
END

IF ~~ THEN M7
	SAY @56
	IF ~~ THEN EXIT
END
END