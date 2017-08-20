

// Second Solar Revelation
//first death of either sendai or abazigal
// Appending a request for Imoen's presence at the beginning of the conversation with Solar

EXTEND_BOTTOM SOLAR 31
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @0 DO ~SetGlobal("TalkedToSolar","GLOBAL",4)~ + SolP1
END

APPEND SOLAR
IF ~~ THEN SolP
	SAY @1
	++ @2 + SolP1
	++ @3 + SolP1
	++ @4 + 32
	++ @5 + SolP2
END

IF ~~ THEN SolP1
	SAY @6
	IF ~~ THEN GOTO 32
END

IF ~~ THEN SolP2
	SAY @7
	IF ~~ THEN GOTO 32
END
END

// Imoen asks about it once you return

// Triggers once you go back to whoever you killed (Sendai or Abazigal) and combat is over. Last line of dialogue is state 48 in SOLAR.DLG
// Triggers as long as !Global("ImoenRomanceActive","GLOBAL",3) and !Global("IRTShutUp","GLOBAL",1)

APPEND IMOEN25J
IF WEIGHT #-5 ~Global("IRTSolarPresentTalk","GLOBAL",1)~ THEN SP
	SAY @8
	IF ~~ THEN DO ~SetGlobal("IRTSolarPresentTalk","GLOBAL",2)~ GOTO SPN
END

IF ~~ THEN SPN
	SAY @9
	++ @10 + SP1
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @11 + SP2
	++ @12 + SP3
	++ @13 + SP4
	++ @14 + SP5
END

IF ~~ THEN SP1
	SAY @15
	IF ~~ THEN GOTO SPDismissal
END

IF ~~ THEN SPDismissal
	SAY @16
	IF ~~ THEN EXIT
END

IF ~~ THEN SP2
	SAY @17
	IF ~~ THEN GOTO SPQuestion
END

IF ~~ THEN SP3
	SAY @18
	= @19
	IF ~~ THEN GOTO SPQuestion
END

IF ~~ THEN SP4
	SAY @20
	= @21
	IF ~~ THEN GOTO SPQuestion
END

IF ~~ THEN SP5
	SAY @22
	IF ~~ THEN GOTO SPDismissal
END	
	
IF ~~ THEN SPQuestion
	SAY @23
	++ @24 + SPQ1
	++ @25 + SPQ2
	++ @26 + SPQ3
	++ @27 + SPQ4
	++ @28 + SPQ5
	++ @29 + SPQ6
	++ @30 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + SPQ7
END

IF ~~ THEN SPQ1
	SAY @31
	= @32
	IF ~~ THEN GOTO SPQEnd
END

IF ~~ THEN SPQ2
	SAY @33
	IF ~~ THEN GOTO SPQEnd
END

IF ~~ THEN SPQ3
	SAY @34
	= @35
	= @36
	= @37
	IF ~~ THEN EXIT
END

IF ~~ THEN SPQ4
	SAY @38
	= @39
	= @40
	IF ~~ THEN EXIT
END

IF ~~ THEN SPQ5
	SAY @41
	= @42
	IF ~~ THEN GOTO SPQEnd
END

IF ~~ THEN SPQ6
	SAY @43
	IF ~~ THEN GOTO SPQEnd
END
	
IF ~~ THEN SPQ7
	SAY @44
	= @45
	= @46
	IF ~~ THEN EXIT
END
	
IF ~~ THEN SPQEnd
	SAY @47
	IF ~~ THEN EXIT
END
END


