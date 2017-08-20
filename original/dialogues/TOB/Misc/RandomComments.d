// Here go all very brief conversations that Imoen initiates

// Contents:
// Small talk in the fire giants' lair
// Imoen's Warning if you go kill Yaga-Shura without destroying his heart
// Imoen comments on Sendai's priestess
// Imoen comments on Abazigal's lair
// Imoen comments on running out of money




// Small talk in the fire giants' lair

APPEND IMOEN25J 
IF WEIGHT #10 ~Global("IRTFireGiantLairTalk","GLOBAL",1)~ THEN fg
 SAY @0
 IF ~~ THEN DO ~SetGlobal("IRTFireGiantLairTalk","GLOBAL",2)~ GOTO fgNext
END

IF ~~ THEN fgNext
 SAY @1
 + ~NumInPartyGT(2)~ + @2 + fg1
 + ~!NumInPartyGT(2)~ + @3 + fg1
 ++ @4 + fg2
 ++ @5 + fg3
 ++ @6 + fg4
 ++ @7 + fg5
 ++ @8 + fg6
END

IF ~~ THEN fg1
	SAY @9
	IF ~~ THEN EXIT
END
	
IF ~~ THEN fg2
	SAY @10
	= @11
	IF ~~ THEN EXIT
END

IF ~~ THEN fg3
	SAY @12
	IF ~~ THEN DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ EXIT
END

IF ~~ THEN fg4
	SAY @13
	IF ~~ THEN EXIT
END

IF ~~ THEN fg5
	SAY @14
	IF ~~ THEN EXIT
END

IF ~~ THEN fg6
	SAY @15
	IF ~~ THEN EXIT
END
END


// Imoen's Warning if you go kill Yaga-Shura without destroying his heart

APPEND IMOEN25J
IF WEIGHT #10 ~Global("IRTInSiegeCampEarly","GLOBAL",1)~ THEN YagaEarly
SAY ~We really shouldn't be here. Yaga-Shura's still protected by his mojo, there's nothing we can do to him 'til we take that down. Better get outta here before we get spotted...~[IRQUIET]
  ++ @17 + YE5
  ++ @18 + YE4
  ++ @19 + YE3
  ++ @20 + YE2
  ++ @21 + YE1
  ++ @22 DO ~SetGlobal("IRTInSiegeCampEarly","GLOBAL",2) ~ EXIT
END

IF ~~ THEN YE1
  SAY @23
  IF ~~ THEN DO ~SetGlobal("IRTInSiegeCampEarly","GLOBAL",2)~ EXIT
END

IF ~~ THEN YE2
  SAY @24
  = @25
  IF ~~ THEN DO ~SetGlobal("IRTInSiegeCampEarly","GLOBAL",2)~ EXIT
END

IF ~~ THEN YE3
  SAY @26
  = @27
  IF ~~ THEN DO ~SetGlobal("IRTInSiegeCampEarly","GLOBAL",2)~ EXIT
END

IF ~~ THEN YE4
  SAY @28
  IF ~~ THEN DO ~SetGlobal("IRTInSiegeCampEarly","GLOBAL",2)~ EXIT
END

IF ~~ THEN YE5
  SAY @29
  IF ~~ THEN DO ~SetGlobal("IRTInSiegeCampEarly","GLOBAL",2)~ EXIT
END
END



// Imoen comments on Sendai's priestess
//  Trigger right after she vanishes - she says the following in SENPRI.DLG:
// Fool! I am drow. You are naught but iblith-filth! Sendai need not be bothered, for I shall destroy you! Enter Ogremoch's chamber if you dare. Defeat him, and I shall face you myself.
// Requires !Global("ImoenRomanceActive","GLOBAL",3)

APPEND IMOEN25J
IF WEIGHT #-5 ~Global("IRTSendai","GLOBAL",1)~ THEN Sen
	SAY ~Wow. She was... gorgeous. Do we really need to kill her?~[IRQUIET]
	++ @31 + Sen1
	++ @32 + Sen2
	+ ~IsValidForPartyDialog("Viconia")~ + @33 EXTERN VICON25J Sen3
	+ ~!IsValidForPartyDialog("Viconia")~ + @33 + Sen4
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @34 + Sen5
	+ ~OR(2) Gender(Player1,MALE) !Global("ImoenRomanceActive","GLOBAL",2)~ + @35 + Sen5
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @36 + Sen5
	++ @37 + Sen6
END

IF ~~ THEN Sen1
	SAY @38
	= @39
	IF ~~ THEN GOTO SenEnd
END

IF ~~ THEN Sen2
	SAY @40
	IF ~~ THEN GOTO SenEnd
END
END

APPEND VICON25J
IF ~~ THEN Sen3
	SAY @41
	IF ~~ THEN EXTERN IMOEN25J Sen4
END
END 

APPEND IMOEN25J
IF ~~ THEN Sen4
	SAY @42
	IF ~~ THEN GOTO SenEnd
END

IF ~~ THEN Sen5
	SAY @43
	IF ~~ THEN GOTO SenEnd
END

IF ~~ THEN Sen6
	SAY @44
	IF ~~ THEN GOTO SenEnd
END

IF ~~ THEN SenEnd
	SAY @45
	= @46
	IF ~~ THEN DO ~SetGlobal("IRTSendai","GLOBAL",2)~ EXIT
END
END

// Imoen comments on Abazigal's lair
// This one triggers as soon as you enter the chamber with all the spikes on the ground, lair of Fll'Yissetat. AR6004
// Trigger only if !Global("ImoenRomanceActive","GLOBAL",3)

APPEND IMOEN25J
IF WEIGHT #-5 ~Global("IRTAbazigal","GLOBAL",1)~ THEN Aba
	SAY @47
	= @48
	++ @49 DO ~SetGlobal("IRTAbazigal","GLOBAL",2)~ + Aba1
	++ @50 DO ~SetGlobal("IRTAbazigal","GLOBAL",2)~ + Aba2
	++ @51 DO ~SetGlobal("IRTAbazigal","GLOBAL",2)~ + Aba3
	++ @52 DO ~SetGlobal("IRTAbazigal","GLOBAL",2)~ + Aba4
	++ @53 DO ~SetGlobal("IRTAbazigal","GLOBAL",2)~ + Aba5
END

IF ~~ THEN Aba1
	SAY @54
	= @55
	IF ~~ THEN EXIT
END

IF ~~ THEN Aba2
	SAY @56
	IF ~~ THEN EXIT
END

IF ~~ THEN Aba3
	SAY @57
	IF ~~ THEN EXIT
END

IF ~~ THEN Aba4
	SAY @58
	IF ~~ THEN EXIT
END

IF ~~ THEN Aba5
	SAY @54
	= @59
	IF ~~ THEN EXIT
END
END	


// Imoen comments on running out of money
// Triggers if party gold goes lower than 700 after having killed Yaga-Shura
// Needs !Global("ImoenRomanceActive","GLOBAL",3)

APPEND IMOEN25J
IF WEIGHT #-5 ~Global("IRTLowGold","GLOBAL",1)~ THEN broke
	SAY @60
	++ @61 DO ~SetGlobal("IRTLowGold","GLOBAL",2)~ + broke1 
	++ @62 DO ~SetGlobal("IRTLowGold","GLOBAL",2)~ + broke2
	++ @63 DO ~SetGlobal("IRTLowGold","GLOBAL",2)~ + broke3
	++ @64 DO ~SetGlobal("IRTLowGold","GLOBAL",2)~ + broke4
	++ @65 DO ~SetGlobal("IRTLowGold","GLOBAL",2)~ + broke5
END

IF ~~ THEN broke1
	SAY @66
	IF ~~ THEN GOTO brokeEnd
END

IF ~~ THEN broke2
	SAY @67
	IF ~~ THEN GOTO brokeEnd
END

IF ~~ THEN broke3
	SAY @68
	IF ~~ THEN GOTO brokeEnd
END
	
IF ~~ THEN broke4
	SAY @69
	IF ~~ THEN GOTO brokeEnd
END
	
IF ~~ THEN broke5
	SAY @70
	IF ~~ THEN GOTO brokeEnd
END

IF ~~ THEN brokeEnd
	SAY @71
	= @72
	IF ~~ THEN EXIT
END
END



