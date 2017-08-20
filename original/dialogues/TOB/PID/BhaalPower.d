// Resisted the Taint

APPEND IMOEN25J
IF ~~ THEN HowResist
	SAY @0
	= @1
	= @2
	++ @3 + HowRes1
	++ @4 + HowRes2
	++ @5 + HowRes3
	++ @6 + HowRes4
	++ @7 + HowRes5
END

IF ~~ THEN HowRes1
	SAY @8
	= @9
	IF ~~ THEN EXIT
END

IF ~~ THEN HowRes2
	SAY @10
	= @11
	IF ~~ THEN EXIT
END

IF ~~ THEN HowRes3
	SAY @12
	= @13
	= @14
	IF ~~ THEN EXIT
END

IF ~~ THEN HowRes4
	SAY @15
	= @16
	= @17
	IF ~~ THEN EXIT
END

IF ~~ THEN HowRes5
	SAY @18
	= @19
	= @20
	IF ~~ THEN EXIT
END	

// Controlled the Slayer

IF ~~ THEN HowSlay
	SAY @21
	= @22  
	= @23
	= @24
	++ @25 + HowSlay2
	++ @26 + HowSlay3
	++ @27 + HowSlay4
	++ @28 + HowSlay5
	++ @29 + HowSlay6 
END	
	
IF ~~ THEN HowSlay2
	SAY @30
	IF ~~ THEN GOTO HowSlayEnd
END

IF ~~ THEN HowSlayEnd
	SAY @31
	IF ~~ THEN EXIT
END
	
IF ~~ THEN HowSlay3
	SAY @32
	IF ~~ THEN GOTO HowSlayEnd
END
	
IF ~~ THEN HowSlay4
	SAY @33
	= @34
	= @35
	= @36
	IF ~~ THEN EXIT
END

IF ~~ THEN HowSlay5
	SAY @37
	= @38
	IF ~~ THEN GOTO HowSlayEnd
END

IF ~~ THEN HowSlay6
	SAY @39
	= @40
	IF ~~ THEN GOTO HowSlayEnd
END
	
// Became the Ravager

IF ~~ THEN HowAss
	SAY @41
	= @42
	= @43
	= @44
	= @45
	++ @46 + HowAss2
	++ @47 + HowAss2
	++ @48 + HowAss2
	++ @49 + HowAss2
	++ @50 + HowAss2
END
	
IF ~~ THEN HowAss2
	SAY @51
	= @52
	= @53
	= @54
	IF ~~ THEN DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",3)~ EXIT
END
END
