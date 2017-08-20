// This is a brief conversation on marriage initiated through PID by the protagonist. Only available if Imoen is romanced.
//Available after first of Senda/Abazigal dead and solar talk
// Global toward epilogues: IRTWantsMarriage = 0,1

// Trigger global: IRTMarriageTalk = 1
/*
PID option:
+ ~GlobalGT("IRTLoveMeter","GLOBAL",7) Global("IRTMarriageTalk","GLOBAL",1) Gender(Player1,MALE)~ + ~Would you ever want to marry, Imoen?~ DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRTMarriageTalk","GLOBAL",2)~ GOTO Mar1
+ ~GlobalGT("IRTLoveMeter","GLOBAL",7) Global("IRTMarriageTalk","GLOBAL",1) Gender(Player1,FEMALE)~ + ~Would you ever want to marry, Imoen?~ DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRTMarriageTalk","GLOBAL",2)~ GOTO MarF
+ ~!GlobalGT("IRTLoveMeter","GLOBAL",7) Global("IRTMarriageTalk","GLOBAL",1)~ + ~Would you ever want to marry, Imoen?~ DO ~SetGlobal("IRTMarriageTalk","GLOBAL",2)~ GOTO MarTooLow
*/


APPEND IMOEN25J
IF ~~ MarTooLow
   SAY @0
   = @1
   ++ @2 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",2)~ + MarLow4
   ++ @3 + MarLow3
   ++ @4 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-2)~ + MarLow2
   ++ @5 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-1)~ + MarLow1
END

IF ~~ MarLow1
   SAY @6
   IF ~~ THEN EXIT
END

IF ~~ MarLow2
   SAY @7
   IF ~~ THEN EXIT
END

IF ~~ MarLow3
   SAY @8
   = @9
   IF ~~ THEN EXIT
END

IF ~~ MarLow4
   SAY @10
   = @11
   IF ~~ THEN EXIT
END


IF ~~ MarF
   SAY @12
   = @13
   ++ @14 + MarFVague
   + ~InParty("Aerie")~ + @15 + MarFAerie
   + ~InParty("Jaheira")~ + @16 + MarFJaheira
   + ~InParty("Viconia")~ + @17 + MarFViconia
   + ~InParty("Anomen")~ + @18 + MarFAnomen
   + ~InParty("Keldorn")~ + @19 + MarFKeldorn
   ++ @20 + MarFVague
   ++ @21 + Mar1
   ++ @22 + MarFNvrMnd
END

IF ~~ MarFVague
   SAY @23
   IF ~~ THEN GOTO Mar1N
END

IF ~~ MarFNvrMnd
   SAY @24
   IF ~~ THEN EXIT
END
END

CHAIN IMOEN25J MarFAerie
	@25
	== AERIE25J IF ~IsValidForPartyDialog("Aerie")~ THEN @26
	== IMOEN25J IF ~IsValidForPartyDialog("Aerie")~ THEN @27
	== IMOEN25J IF ~!IsValidForPartyDialog("Aerie")~ THEN @28
END IMOEN25J Mar1WifeWife

CHAIN IMOEN25J MarFJaheira
	@29
	= @30
	== JAHEI25J IF ~IsValidForPartyDialog("Jaheira")~ THEN @31
END IMOEN25J Mar1WifeWife

CHAIN IMOEN25J MarFViconia
	@32
	== VICON25J IF ~IsValidForPartyDialog("Viconia")~ THEN @33
END IMOEN25J Mar1WifeWife

CHAIN IMOEN25J MarFAnomen
	@34
	== ANOME25J IF ~IsValidForPartyDialog("Anomen")~ THEN @35
END IMOEN25J Mar1WifeWife

CHAIN IMOEN25J MarFKeldorn
	@36
	== KELDO25J IF ~IsValidForPartyDialog("Keldorn")~ THEN @37
	== IMOEN25J IF ~IsValidForPartyDialog("Keldorn")~ THEN @38
	== KELDO25J IF ~IsValidForPartyDialog("Keldorn")~ THEN @39
	== IMOEN25J IF ~IsValidForPartyDialog("Keldorn")~ THEN @40
END IMOEN25J Mar1WifeWife

APPEND IMOEN25J
IF ~~ Mar1
   SAY @41
   IF ~Gender(Player1,FEMALE)~ THEN GOTO Mar1WifeWife
   IF ~Gender(Player1,MALE)~ THEN GOTO Mar1N
END

IF ~~ Mar1WifeWife
   SAY @42
   IF ~~ THEN GOTO Mar1N
END

IF ~~ Mar1N
   SAY @43
   = @44
   ++ @45 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + MarYes
   ++ @46 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + MarNo
   + ~Gender(Player1,MALE)~ + @47 + MarDreamM
   + ~Gender(Player1,FEMALE)~ + @47 + MarDreamF
   ++ @48 + MarEnd
   ++ @49 + MarDisappoint
END

IF ~~ MarEnd
   SAY @50
   = @51
   IF ~~ THEN EXIT
END

IF ~~ MarDisappoint
   SAY @52
   = @53
   = @54
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ EXIT
END

IF ~~ MarDreamF
   SAY @55
   ++ @56 + MarDreamF3
   ++ @57 + MarDreamF2
   ++ @58 + MarNo
END
END

CHAIN IMOEN25J MarDreamF2
   @59
   = @60
   == IMOEN25J IF ~Global("IRTPlayerIsMagicUser","GLOBAL",1)~ THEN @61
   == IMOEN25J IF ~Global("IRTPlayerIsMagicUser","GLOBAL",0)~ THEN @62
END IMOEN25J MarHappy

APPEND IMOEN25J
IF ~~ MarDreamF3
   SAY @63
   IF ~~ THEN GOTO MarHappy
END

IF ~~ MarDreamM
   SAY @64
   = @65
   = @66
   ++ @67 + MarDreamM3
   ++ @68 + MarDreamM2
   ++ @69 + MarEnd
   ++ @70 + MarDreamM1
END

IF ~~ MarDreamM1
   SAY @71
   IF ~~ THEN GOTO MarHappy
END

IF ~~ MarDreamM2
   SAY @72
   IF ~~ THEN GOTO MarHappy
END

IF ~~ MarDreamM3
   SAY @73
   IF ~~ THEN GOTO MarHappy
END

IF ~~ MarNo
   SAY @74
   = @75
   = @76
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",4)~ EXIT
END

IF ~~ MarYes
   SAY @77
   = @78
   IF ~~ THEN GOTO MarHappy
END

IF ~~ MarHappy
   SAY @79
   ++ @80 + MarHappy4
   ++ @81 + MarHappy3
   ++ @82 + MarHappy2
   ++ @83 + MarHappy1
END

IF ~~ MarHappy1
   SAY @84
   = @85
   = @86
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",3)~ EXIT
END

IF ~~ MarHappy2
   SAY @87
   = @85
   = @88
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",2)~ EXIT
END

IF ~~ MarHappy3
   SAY @89
   = @90
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",2) SetGlobal("IRTWantsMarriage","GLOBAL",1)~ EXIT
END

IF ~~ MarHappy4
   SAY @91
   = @92
   = @93
   ++ @94 + MarHappy4c
   ++ @95 + MarHappy4d
   ++ @96 + MarHappy4b
   ++ @97 + MarHappy4a
END

IF ~~ MarHappy4a
   SAY @98
   IF ~~ THEN GOTO MarHappyEnd
END

IF ~~ MarHappyEnd
   SAY @99
   = @100
   = @101
   = @102
   = @103
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",5) SetGlobal("IRTWantsMarriage","GLOBAL",1)~ EXIT
END

IF ~~ MarHappy4b
   SAY @104
   IF ~~ THEN GOTO MarHappyEnd
END

IF ~~ MarHappy4c
   SAY @105
   IF ~~ THEN GOTO MarHappyEnd
END

IF ~~ MarHappy4d
   SAY @106
   = @107
   = @108
   = @101
   = @109
   = @103
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",5) SetGlobal("IRTWantsMarriage","GLOBAL",1)~ EXIT
END
END


