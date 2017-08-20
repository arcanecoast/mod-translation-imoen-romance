// Final Conversation with the Solar


/*

Maximum value possible of IRTCorruptImoen = 11
Maximum value possible of IRTLoveMeter = 40 (technically infinite, but this assumes the player only looped once through the PDAs.)

Thresholds for ascension: 
	IRTLoveMeter = 31+   			:  Imoen is madly in love and will do anything to stay with the player
	IRTLoveMeter = 6 < X < 31    :  Imoen is in love with the player but requires to be corrupted to ascend together, and only as a handmaiden
	IRTLoveMeter = 6 or less     :  Imoen somewhat loves the player, but doesn't want to factor into his/her decision and breaks up with them.
	IRTLoveMeter > 12            :  When Imoen is Romanced and considers whether to ascend as a divine handmaiden, she will decide to do it if value > 12
	IRTLoveMeter > 2             :  Not romanced, corrupted Imoen ascends as divine handmaiden
	
	
Depending on IRTCorruptImoen 's value, she will have a different attitude toward both ascension and giving up her taint.	
	
*/

// Extend the exchange between Imoen and Solar:

/*
Original line:
If I could have gotten rid of it voluntarily, I would have done it a long time ago. *shudder* Take it... I don't want it. I never wanted it.
*/

EXTEND_BOTTOM FINSOL01 7
	IF ~Global("ImoenRomanceActive","GLOBAL",2) GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN EXTERN IMOEN25J FinMad // If Imoen is madly in love
	IF ~OR(2)  Global("IRTImoenIsRavager","GLOBAL",1) Global("IRTImoenControlsSlayer","GLOBAL",1) GlobalGT("IRTCorruptImoen","GLOBAL",6)~ THEN DO ~SetGlobal("IRTBhaalImoen","GLOBAL",1)~ EXTERN IMOEN25J FinCC // If Imoen is fully corrupted
	IF ~Global("ImoenRomanceActive","GLOBAL",2) !GlobalGT("IRTLoveMeter","GLOBAL",30) !Global("IRTImoenIsRavager","GLOBAL",1) !Global("IRTImoenControlsSlayer","GLOBAL",1) GlobalGT("IRTCorruptImoen","GLOBAL",6)~ THEN EXTERN IMOEN25J FinC // If Imoen has been sort of corrupted but never embraced the taint in any way
END

CHAIN IMOEN25J FinC
	@0
	== FINSOL01 @1
	== IMOEN25J @2
END FINSOL01 8
	
CHAIN IMOEN25J FinCC
	@3
	== FINSOL01 @4
	== IMOEN25J IF ~Global("IRTImoenControlsSlayer","GLOBAL",1)~ THEN @5
	== IMOEN25J IF ~Global("IRTImoenIsRavager","GLOBAL",1)~ THEN @6
	== FINSOL01 @7
	= @8 
	== IMOEN25J @9
	== FINSOL01 @10
END FINSOL01 5

CHAIN IMOEN25J FinMad
	@0
	== FINSOL01 @1
	== IMOEN25J @11
	= @12
	== FINSOL01 @13
	== IMOEN25J @14
	== FINSOL01 @10
END FINSOL01 5


////////////////////////////////////

EXTEND_BOTTOM IMOEN25J 15 // Introduce a different sentence if Imoen isn't considered a friend
	IF ~Global("ImoenRomanceActive","GLOBAL",3) !Global("IRTNeverForgive","GLOBAL",1)~ THEN GOTO 15IRA3
	IF ~Global("ImoenRomanceActive","GLOBAL",3) Global("IRTNeverForgive","GLOBAL",1)~ THEN GOTO 15IRA3F
END	

APPEND IMOEN25J
IF ~~ THEN 15IRA3
	SAY @15
	= @16
	COPY_TRANS IMOEN25J 16
END

IF ~~ THEN 15IRA3F
	SAY @17
	COPY_TRANS IMOEN25J 16
END

//Solar tells you about your choices
IF ~~ THEN FD
	SAY @18
	IF ~!Global("ImoenRomanceActive","GLOBAL",2) OR(2) Global("ImoenRomanceActive","GLOBAL",3) !Global("IRTBhaalImoen","GLOBAL",1)~ THEN GOTO 15
	IF ~Global("ImoenRomanceActive","GLOBAL",2) Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) !GlobalLT("IRTLoveMeter","GLOBAL",7)~ THEN GOTO FDWarned // Imoen was warned about the player probably leaving
	IF ~Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) !GlobalLT("IRTLoveMeter","GLOBAL",7)~ THEN GOTO FDUnwarned // Imoen wasn't warned
	IF ~Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTBhaalImoen","GLOBAL",1) GlobalLT("IRTLoveMeter","GLOBAL",7)~ THEN DO ~SetGlobal("IRTEpBreakup","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5)~ GOTO FDBreakup // Love meter is too low, Imoen breaks up with the player
	IF ~!Global("ImoenRomanceActive","GLOBAL",2) !Global("ImoenRomanceActive","GLOBAL",3) Global("IRTBhaalImoen","GLOBAL",1)~ THEN DO ~SetGlobal("IRTCorruptProposal","GLOBAL",1)~ GOTO FDCorrupt // Imoen isn't romanced but the player corrupted her
END

IF ~~ THEN FDWarned
	SAY @19
	IF ~Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTBhaalImoen","GLOBAL",1) Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) !GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTNotMadNotCorrupt","GLOBAL",1)~ GOTO FDW1 // Imoen was warned and she's not MADLY in love with the player and she's not corrupted
	IF ~Global("ImoenRomanceActive","GLOBAL",2) Global("IRTBhaalImoen","GLOBAL",1) Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) !GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTNotMadCorrupt","GLOBAL",1)~ GOTO FDW2 // Imoen was warned and she's not MADLY in love with the player and she IS corrupted
	IF ~Global("ImoenRomanceActive","GLOBAL",2) Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTMad","GLOBAL",1)~ GOTO FDW3 // Imoen was warned and she is MADLY in love with the player
END

IF ~~ THEN FDW1
	SAY @20
	= @21
	IF ~  True()
	~ THEN EXTERN ~FINSOL01~ 28
	  IF ~  IfValidForPartyDialogue("Valygar")
	Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 3
	  IF ~  IfValidForPartyDialogue("Anomen")
	Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 11
	  IF ~  IfValidForPartyDialogue("Viconia")
	Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 8
	  IF ~  IfValidForPartyDialogue("Aerie")
	Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 9
	  IF ~  IfValidForPartyDialogue("Jaheira")
	Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 9
	  IF ~  IfValidForPartyDialogue("Valygar")
	!Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 2
	  IF ~  IfValidForPartyDialogue("Anomen")
	!Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 10
	  IF ~  IfValidForPartyDialogue("Viconia")
	!Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 6
	  IF ~  IfValidForPartyDialogue("Aerie")
	!Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 7
	  IF ~  IfValidForPartyDialogue("Jaheira")
	!Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 7
END

IF ~~ THEN FDW2
	SAY @22
	IF ~~ THEN EXTERN FINSOL01 FinChain2
END
END
	
CHAIN FINSOL01 FinChain2
	@23
   = @24
	= @25
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",12)~ THEN @26
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",12)~ THEN @27
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",12)~ THEN @28 DO ~SetGlobal("IRTNotMadCorrupt","GLOBAL",0) SetGlobal("IRTNotMadNotCorrupt","GLOBAL",1)~
	== IMOEN25J IF ~GlobalGT("IRTLoveMeter","GLOBAL",12)~ THEN @29
	== FINSOL01 @30
END 
	IF ~  True()
	~ THEN EXTERN ~FINSOL01~ 28
	  IF ~  IfValidForPartyDialogue("Valygar")
	Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 3
	  IF ~  IfValidForPartyDialogue("Anomen")
	Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 11
	  IF ~  IfValidForPartyDialogue("Viconia")
	Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 8
	  IF ~  IfValidForPartyDialogue("Aerie")
	Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 9
	  IF ~  IfValidForPartyDialogue("Jaheira")
	Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 9
	  IF ~  IfValidForPartyDialogue("Valygar")
	!Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 2
	  IF ~  IfValidForPartyDialogue("Anomen")
	!Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 10
	  IF ~  IfValidForPartyDialogue("Viconia")
	!Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 6
	  IF ~  IfValidForPartyDialogue("Aerie")
	!Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 7
	  IF ~  IfValidForPartyDialogue("Jaheira")
	!Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 7
	
CHAIN IMOEN25J FDW3
	@31
	== FINSOL01 @23
   = @32
	= @33
	== IMOEN25J @34
END
	IF ~  True()
	~ THEN EXTERN ~FINSOL01~ 28
	  IF ~  IfValidForPartyDialogue("Valygar")
	Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 3
	  IF ~  IfValidForPartyDialogue("Anomen")
	Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 11
	  IF ~  IfValidForPartyDialogue("Viconia")
	Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 8
	  IF ~  IfValidForPartyDialogue("Aerie")
	Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 9
	  IF ~  IfValidForPartyDialogue("Jaheira")
	Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 9
	  IF ~  IfValidForPartyDialogue("Valygar")
	!Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 2
	  IF ~  IfValidForPartyDialogue("Anomen")
	!Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 10
	  IF ~  IfValidForPartyDialogue("Viconia")
	!Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 6
	  IF ~  IfValidForPartyDialogue("Aerie")
	!Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 7
	  IF ~  IfValidForPartyDialogue("Jaheira")
	!Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 7


APPEND IMOEN25J
IF ~~ THEN FDUnwarned
	SAY @35
	IF ~Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTBhaalImoen","GLOBAL",1) !Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) !GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTNotMadNotCorrupt","GLOBAL",1)~ GOTO FDUnW1 // Imoen wasn't warned and she's not MADLY in love with the player and she's not corrupted
	IF ~Global("ImoenRomanceActive","GLOBAL",2) Global("IRTBhaalImoen","GLOBAL",1) !Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) !GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTNotMadCorrupt","GLOBAL",1)~ GOTO FDUnW2 // Imoen wasn't warned and she's not MADLY in love with the player and she IS corrupted
	IF ~Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTMad","GLOBAL",1)~ GOTO FDUnW3 // Imoen wasn't warned and she is MADLY in love with the player
END

IF ~~ THEN FDUnW1
	SAY @36
	= @37
			 IF ~  True()
	~ THEN EXTERN ~FINSOL01~ 28
	  IF ~  IfValidForPartyDialogue("Valygar")
	Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 3
	  IF ~  IfValidForPartyDialogue("Anomen")
	Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 11
	  IF ~  IfValidForPartyDialogue("Viconia")
	Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 8
	  IF ~  IfValidForPartyDialogue("Aerie")
	Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 9
	  IF ~  IfValidForPartyDialogue("Jaheira")
	Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 9
	  IF ~  IfValidForPartyDialogue("Valygar")
	!Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 2
	  IF ~  IfValidForPartyDialogue("Anomen")
	!Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 10
	  IF ~  IfValidForPartyDialogue("Viconia")
	!Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 6
	  IF ~  IfValidForPartyDialogue("Aerie")
	!Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 7
	  IF ~  IfValidForPartyDialogue("Jaheira")
	!Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 7

END

IF ~~ THEN FDUnW2
	SAY @38
	IF ~~ THEN EXTERN FINSOL01 FinChain2
END
END

CHAIN IMOEN25J FDUnW3
	@39
	== FINSOL01 @23
   = @32
	= @33
	== IMOEN25J @40
END
	IF ~  True()
	~ THEN EXTERN ~FINSOL01~ 28
	  IF ~  IfValidForPartyDialogue("Valygar")
	Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 3
	  IF ~  IfValidForPartyDialogue("Anomen")
	Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 11
	  IF ~  IfValidForPartyDialogue("Viconia")
	Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 8
	  IF ~  IfValidForPartyDialogue("Aerie")
	Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 9
	  IF ~  IfValidForPartyDialogue("Jaheira")
	Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 9
	  IF ~  IfValidForPartyDialogue("Valygar")
	!Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 2
	  IF ~  IfValidForPartyDialogue("Anomen")
	!Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 10
	  IF ~  IfValidForPartyDialogue("Viconia")
	!Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 6
	  IF ~  IfValidForPartyDialogue("Aerie")
	!Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 7
	  IF ~  IfValidForPartyDialogue("Jaheira")
	!Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 7


APPEND IMOEN25J
IF ~~ THEN FDBreakup
	SAY @41
	= @42
	= @43
	= @44
	= @45
	++ @46 + FDBr1
	++ @47 + FDBr2
	++ @48 + FDBr3
	++ @49 + FDBr4
END

IF ~~ THEN FDBr1
	SAY @50
	++ @51 + FDBr1a
	++ @52 + FDBr4
	++ @53 + FDBr3
END

IF ~~ THEN FDBr1a
	SAY @54
	= @55
	++ @56 + FDBr1a1
	++ @57 + FDBr1a2
END

IF ~~ THEN FDBr1a1
	SAY @58
	= @59
	= @60
	= @61
			 IF ~  True()
	~ THEN EXTERN ~FINSOL01~ 28
	  IF ~  IfValidForPartyDialogue("Valygar")
	Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 3
	  IF ~  IfValidForPartyDialogue("Anomen")
	Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 11
	  IF ~  IfValidForPartyDialogue("Viconia")
	Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 8
	  IF ~  IfValidForPartyDialogue("Aerie")
	Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 9
	  IF ~  IfValidForPartyDialogue("Jaheira")
	Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 9
	  IF ~  IfValidForPartyDialogue("Valygar")
	!Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 2
	  IF ~  IfValidForPartyDialogue("Anomen")
	!Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 10
	  IF ~  IfValidForPartyDialogue("Viconia")
	!Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 6
	  IF ~  IfValidForPartyDialogue("Aerie")
	!Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 7
	  IF ~  IfValidForPartyDialogue("Jaheira")
	!Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 7

END

IF ~~ THEN FDBr1a2
	SAY @62
			 IF ~  True()
	~ THEN EXTERN ~FINSOL01~ 28
	  IF ~  IfValidForPartyDialogue("Valygar")
	Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 3
	  IF ~  IfValidForPartyDialogue("Anomen")
	Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 11
	  IF ~  IfValidForPartyDialogue("Viconia")
	Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 8
	  IF ~  IfValidForPartyDialogue("Aerie")
	Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 9
	  IF ~  IfValidForPartyDialogue("Jaheira")
	Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 9
	  IF ~  IfValidForPartyDialogue("Valygar")
	!Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 2
	  IF ~  IfValidForPartyDialogue("Anomen")
	!Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 10
	  IF ~  IfValidForPartyDialogue("Viconia")
	!Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 6
	  IF ~  IfValidForPartyDialogue("Aerie")
	!Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 7
	  IF ~  IfValidForPartyDialogue("Jaheira")
	!Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 7

END

IF ~~ THEN FDBr2
	SAY @63
	= @64
	= @65
			 IF ~  True()
	~ THEN EXTERN ~FINSOL01~ 28
	  IF ~  IfValidForPartyDialogue("Valygar")
	Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 3
	  IF ~  IfValidForPartyDialogue("Anomen")
	Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 11
	  IF ~  IfValidForPartyDialogue("Viconia")
	Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 8
	  IF ~  IfValidForPartyDialogue("Aerie")
	Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 9
	  IF ~  IfValidForPartyDialogue("Jaheira")
	Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 9
	  IF ~  IfValidForPartyDialogue("Valygar")
	!Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 2
	  IF ~  IfValidForPartyDialogue("Anomen")
	!Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 10
	  IF ~  IfValidForPartyDialogue("Viconia")
	!Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 6
	  IF ~  IfValidForPartyDialogue("Aerie")
	!Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 7
	  IF ~  IfValidForPartyDialogue("Jaheira")
	!Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 7

END

IF ~~ THEN FDBr3
	SAY @66
	IF ~~ THEN GOTO FDBr4
END

IF ~~ THEN FDBr4
	SAY @67
	= @65
		 IF ~  True()
	~ THEN EXTERN ~FINSOL01~ 28
	  IF ~  IfValidForPartyDialogue("Valygar")
	Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 3
	  IF ~  IfValidForPartyDialogue("Anomen")
	Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 11
	  IF ~  IfValidForPartyDialogue("Viconia")
	Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 8
	  IF ~  IfValidForPartyDialogue("Aerie")
	Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 9
	  IF ~  IfValidForPartyDialogue("Jaheira")
	Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 9
	  IF ~  IfValidForPartyDialogue("Valygar")
	!Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 2
	  IF ~  IfValidForPartyDialogue("Anomen")
	!Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 10
	  IF ~  IfValidForPartyDialogue("Viconia")
	!Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 6
	  IF ~  IfValidForPartyDialogue("Aerie")
	!Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 7
	  IF ~  IfValidForPartyDialogue("Jaheira")
	!Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 7
END
END

CHAIN IMOEN25J FDCorrupt
	@68
	== AERIE25J IF ~InParty("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @69
	== IMOEN25J IF ~InParty("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @70
	= @71
	== FINSOL01 @23
   = @72
	= @73
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",2)~ THEN @26
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",2)~ THEN @74
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",2)~ THEN @75 DO ~SetGlobal("IRTCorruptProposal","GLOBAL",0)~
	== IMOEN25J IF ~GlobalGT("IRTLoveMeter","GLOBAL",2)~ THEN @76
	== FINSOL01 @30
END
	IF ~  True()
	~ THEN EXTERN ~FINSOL01~ 28
	  IF ~  IfValidForPartyDialogue("Valygar")
	Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 3
	  IF ~  IfValidForPartyDialogue("Anomen")
	Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 11
	  IF ~  IfValidForPartyDialogue("Viconia")
	Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 8
	  IF ~  IfValidForPartyDialogue("Aerie")
	Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 9
	  IF ~  IfValidForPartyDialogue("Jaheira")
	Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 9
	  IF ~  IfValidForPartyDialogue("Valygar")
	!Global("ValygarRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VALYG25J~ 2
	  IF ~  IfValidForPartyDialogue("Anomen")
	!Global("AnomenRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~ANOME25J~ 10
	  IF ~  IfValidForPartyDialogue("Viconia")
	!Global("ViconiaRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~VICON25J~ 6
	  IF ~  IfValidForPartyDialogue("Aerie")
	!Global("AerieRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~AERIE25J~ 7
	  IF ~  IfValidForPartyDialogue("Jaheira")
	!Global("JaheiraRomanceActive","GLOBAL",2)
	~ THEN EXTERN ~JAHEI25J~ 7



// Main decision super branch



/*
Default choices:
IF ~GlobalLT("PPEvilChoices","GLOBAL",2)~ THEN REPLY ~I will retain the essence of Bhaal that is my right and become a power of the planes.~ DO ~SetGlobal("PlayerChoseEssence","GLOBAL",1)~ GOTO 31
IF ~GlobalGT("PPEvilChoices","GLOBAL",1) GlobalLT("PPEvilChoices","GLOBAL",4)~ THEN REPLY ~I will retain the essence of Bhaal that is my right and become a power of the planes.~ DO ~SetGlobal("PlayerChoseEssence","GLOBAL",1)~ GOTO 30
IF ~GlobalGT("PPEvilChoices","GLOBAL",3) GlobalLT("PPEvilChoices","GLOBAL",6)~ THEN REPLY ~I will retain the essence of Bhaal that is my right and become a power of the planes.~ DO ~SetGlobal("PlayerChoseEssence","GLOBAL",1)~ GOTO 29
IF ~~ THEN REPLY ~I do not want the essence of Bhaal. Do what you will with it... I want to remain mortal.~ GOTO 32
*/


APPEND IMOEN25J
	IF ~~ THEN finalbreak
	   SAY @77
	// Imoen not romanced, not corrupt (Vanilla responses - since priority is given from bottom to top, these will only be followed if none of the stuff below is met)
		IF ~Global("PlayerChoseEssence","GLOBAL",1) Global("ImoenRomanceActive","GLOBAL",0)~ GOTO 18
		IF ~Global("PlayerChoseEssence","GLOBAL",0) Global("ImoenRomanceActive","GLOBAL",0)~ GOTO 19
		

	// Imoen romanced but not madly in love, not corrupt
		IF ~Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("IRTNotMadNotCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN DO ~SetGlobal("IRTEpSoloStandard","GLOBAL",1)~ GOTO AA1 //resolved
		IF ~!Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("IRTNotMadNotCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN DO ~SetGlobal("IRTEpSoloStandard","GLOBAL",1)~ GOTO AA2  //resolved
		IF ~Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("IRTNotMadNotCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN DO ~SetGlobal("IRTEpJointStandard","GLOBAL",1)~ GOTO AA3 //resolved
		IF ~!Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("IRTNotMadNotCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN DO ~SetGlobal("IRTEpJointStandard","GLOBAL",1)~ GOTO AA4 //resolved





		
	// Imoen madly in love | Let's just make something new
		IF ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) ~ THEN REPLY @78 DO ~SetGlobal("IRTEpSoloMad","GLOBAL",1)~ GOTO BB1
		IF ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN REPLY @79 DO ~SetGlobal("IRTEpAscendedFull","GLOBAL",1)~ GOTO BB2
		+ ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,LAWFUL_EVIL)~ + @80 GOTO BBEvil 
	   + ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,NEUTRAL_EVIL)~ + @81 GOTO BBEvil 
	   + ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,CHAOTIC_EVIL)~ + @82 GOTO BBEvil
		IF ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN REPLY @83 + BB5
		IF ~Global("IRTMad","GLOBAL",1) Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ GOTO BB3 //resolved
		IF ~Global("IRTMad","GLOBAL",1) !Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~  THEN DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ GOTO BB4 //resolved

		
	// Imoen not mad in love, corrupt
		IF ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~  THEN REPLY @78 DO ~SetGlobal("IRTEpSoloStandard","GLOBAL",1)~ GOTO CC1 //resolved
		IF ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~  THEN  REPLY @84 DO ~SetGlobal("IRTEpAscendedMaiden","GLOBAL",1)~ GOTO CC2 //resolved


		+ ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,LAWFUL_EVIL)~ + @80 GOTO CCEvil
		+ ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,NEUTRAL_EVIL)~ + @81 GOTO CCEvil
		+ ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,CHAOTIC_EVIL)~ + @82 GOTO CCEvil
	
		IF ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN REPLY @85 DO ~SetGlobal("IRTEpJointStandard","GLOBAL",1)~  GOTO CC5 //resolved
		
		IF ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~  THEN REPLY @86 DO ~SetGlobal("IRTEpJointStandard","GLOBAL",1)~  GOTO CC4 //resolved

	// Imoen not romanced, corrupt

		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN REPLY @78 GOTO DD1 // Non-mod epilogue displays (or Aerie friendship if applicable)
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN REPLY @87 DO ~SetGlobal("IRTEpAscendedMaiden2","GLOBAL",1)~ GOTO DD2
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,LAWFUL_EVIL)~ THEN REPLY @80 GOTO DDEvil
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,NEUTRAL_EVIL)~ THEN REPLY @81 GOTO DDEvil
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,CHAOTIC_EVIL)~ THEN REPLY @82 GOTO DDEvil

		
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN REPLY @88 GOTO DD3 // Non-mod epilogue displays (or Aerie friendship if applicable)
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN REPLY @86 GOTO CC4 // Non-mod epilogue displays (or Aerie friendship if applicable)


		

















		//vanilla choices
		    //ascended
		IF ~Global("ImoenRomanceActive","GLOBAL",3) Global("PlayerChoseEssence","GLOBAL",1)~ THEN GOTO Sol29a
		IF ~Global("ImoenRomanceActive","GLOBAL",5) Global("PlayerChoseEssence","GLOBAL",1)~ THEN GOTO Sol29b
		IF ~Global("IRTEpBreakup","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN GOTO Sol29c
		//mortal
		IF ~Global("ImoenRomanceActive","GLOBAL",3) Global("PlayerChoseEssence","GLOBAL",0)~ THEN GOTO Sol32a
		IF ~Global("ImoenRomanceActive","GLOBAL",5) Global("PlayerChoseEssence","GLOBAL",0)~ THEN GOTO Sol32b
		IF ~Global("IRTEpBreakup","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN GOTO Sol29d
		
	END
END
APPEND IMOEN25J
IF ~~ THEN AA1
	SAY @89
	IF ~~ THEN GOTO AAGod
END

IF ~~ THEN AA2
	SAY @90
	IF ~~ THEN GOTO AAGod
	IF ~Global("IRTWantsMarriage","GLOBAL",1)~ THEN GOTO AAMarry	
END

IF ~~ THEN AAMarry
	SAY @91
	IF ~~ THEN GOTO AAGod
END

IF ~~ THEN AAGod
	SAY @92
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN AA3
	SAY @93
	IF ~~ THEN GOTO AAMortal
END

IF ~~ THEN AA4
	SAY @94
	IF ~~ THEN GOTO AAMortal
END

IF ~~ THEN AAMortal
	SAY @95
	IF ~!Global("IRTWantsMarriage","GLOBAL",1)~ THEN GOTO AAMarryStay1
	IF ~Global("IRTWantsMarriage","GLOBAL",1)~ THEN GOTO AAMarryStay2
END

IF ~~ THEN AAMarryStay1
	SAY @96
	COPY_TRANS IMOEN25J 20
END

IF ~~ THEN AAMarryStay2
	SAY @96
	=@97
	COPY_TRANS IMOEN25J 20
END

IF ~~ THEN BB1
	SAY @98
	= @99
	++ @100 + BB1a
	++ @101 + BB1a
	++ @102 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-10)~ + BB1b
	++ @103 + BB1c
	++ @104 + BB1b
END

IF ~~ THEN BB1a
	SAY @105
	= @106
	= @107
	IF ~~ THEN GOTO BB1End
END

IF ~~ THEN BB1End
	SAY @108
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN BB1b
	SAY @109
	= @110
	= @111
	= @112
	IF ~~ THEN GOTO BB1End
END

IF ~~ THEN BB1c
	SAY @113
	= @114
	= @107
	IF ~~ THEN GOTO BB1End
END

IF ~~ THEN BB2
	SAY @115
	= @116
	COPY_TRANS IMOEN25J 18
END
END

APPEND FINSOL01
IF ~~ THEN 29R
	SAY @117
	IF ~~ THEN GOTO 33
END
	
IF ~~ THEN 30R
	SAY @118
	IF ~~ THEN GOTO 33
END

IF ~~ THEN 31R
	SAY @119
	IF ~~ THEN GOTO 33
END
END

APPEND IMOEN25J
IF ~~ THEN BB3
	SAY @93
	IF ~~ THEN GOTO BBMortal
END

IF ~~ THEN BB4
	SAY @120
	IF ~~ THEN GOTO BBMortal
END
END

CHAIN IMOEN25J BBMortal
	@121
	== IMOEN25J IF ~Global("IRTWantsMarriage","GLOBAL",1)~ THEN @122
	== IMOEN25J IF ~!Global("IRTWantsMarriage","GLOBAL",1)~ THEN @123
	== IMOEN25J @124
END
  COPY_TRANS IMOEN25J 20

APPEND IMOEN25J
IF ~~ THEN BB5
	SAY @125
	++ @126 + BB5a
	++ @127 + BB5a
	++ @128 + BB5b
	++ @129 DO ~SetGlobal("IRTEpSoloMad","GLOBAL",1)~ + BB1
	++ @130 DO ~SetGlobal("IRTEpAscendedFull","GLOBAL",1)~ + BB2
	+ ~Global("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + @131 DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ + BB3
	+ ~!Global("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + @131 DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ + BB4
END

IF ~~ THEN BB5a
	SAY @132
	= @133
	= @134
	= @135
	IF ~~ THEN GOTO BB5End
END

IF ~~ THEN BB5b
	SAY @136
	IF ~~ THEN GOTO BB5End
END

IF ~~ THEN BB5End
	SAY @137
	++ @129 DO ~SetGlobal("IRTEpSoloMad","GLOBAL",1)~ + BB1
	++ @130 DO ~SetGlobal("IRTEpAscendedFull","GLOBAL",1)~ + BB2
	+ ~Global("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + @131 DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ + BB3
	+ ~!Global("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + @131 DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ + BB4
END	

IF ~~ THEN BBEvil
	SAY @138
	= @139
	= @140
	= @141
	= @142
	++ @143 DO ~SetGlobal("IRTEpSoloMad","GLOBAL",1)~ GOTO BB1
	++ @144 DO ~SetGlobal("IRTEpAscendedFull","GLOBAL",1)~ GOTO BB2



END

IF ~~ THEN CC1
	SAY @145
	= @146
	++ @100 + BB1a
	++ @101 + BB1a
	++ @102 + CC1b
	++ @103 + BB1c
	++ @104 + CC1b
END

IF ~~ THEN CC1b
	SAY @109
	= @147
	= @148
	= @111
	= @112
	IF ~~ THEN GOTO BB1End
END

IF ~~ THEN CC2
	SAY @149
	= @150
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN CC3
	SAY @151
	IF ~~ THEN GOTO CCNuts
END

IF ~~ THEN CC4
	SAY @152
	IF ~~ THEN GOTO CCNuts
END 

IF ~~ THEN CCNuts
	SAY @153
	++ @154 + CCN1
	++ @155 + CCN1
	++ @156 + CCN2
END

IF ~~ THEN CCN1
	SAY @157
	= @158 
	= @159
	= @160
	= @161
	= @162
	COPY_TRANS IMOEN25J 20
END
	
IF ~~ THEN CCN2
	SAY @163
	IF ~~ THEN GOTO CCN1
END
	
IF ~~ THEN CC5
	SAY @164

	IF ~~ THEN GOTO CCMortal
END

IF ~~ THEN CC6
	SAY @165
	IF ~~ THEN GOTO CCMortal
END
END

CHAIN IMOEN25J CCMortal
	@166
	== IMOEN25J IF ~Global("IRTWantsMarriage","GLOBAL",1)~ THEN @167
	== IMOEN25J IF ~!Global("IRTWantsMarriage","GLOBAL",1)~ THEN @168
	== IMOEN25J @162
COPY_TRANS IMOEN25J 20

APPEND IMOEN25J
IF ~~ THEN CCEvil
	SAY @138
	= @169
	= @170
	= @171
	= @172
	++ @143 DO ~SetGlobal("IRTEpSoloStandard","GLOBAL",1)~ GOTO CC1
	++ @173 DO ~SetGlobal("IRTEpAscendedMaiden","GLOBAL",1)~ GOTO CC2
END

IF ~~ THEN DD1
	SAY @174
	= @175
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN DD2
	SAY @176
	= @177
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN DD3
	SAY @178
	= @179
	= @162
	COPY_TRANS IMOEN25J 20
END

IF ~~ THEN DDEvil
	SAY @138
	= @180
	= @181
	= @182
	++ @183 GOTO DD1 // Non-mod epilogue displays (or Aerie friendship if applicable)
	++ @184 DO ~SetGlobal("IRTEpAscendedMaiden2","GLOBAL",1)~ GOTO DD2

END
END

//dialogue path if not romanced and you make vanilla solar choices

APPEND IMOEN25J
   
IF ~~ THEN Sol32a
	SAY @185
	COPY_TRANS IMOEN25J 20
END

IF ~~ THEN Sol32b
	SAY @186
	= @187
	COPY_TRANS IMOEN25J 20
END

IF ~~ THEN Sol29a
	SAY @188
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN Sol29b
	SAY @189
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN Sol29c
	SAY @190
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN Sol29d
	SAY @190
	COPY_TRANS IMOEN25J 20
END
END