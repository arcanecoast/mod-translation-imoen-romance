// *** Imoen's Torture ***

// PID option:
//available after the second talk about Imoen's taint. Available to both romanced and friendly.

// + ~Global("IRTTortureTalk","GLOBAL",1)~ + ~It has been a while since we left Spellhold behind. Do the memories still haunt you, with everything that's happening now?~ DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRTTortureTalk","GLOBAL",2)~ + T1

CHAIN IMOEN25J T1
	@0
	= @1
	= @2
	== IMOEN25J IF ~!Global("ImoenSummoned","GLOBAL",2)~ THEN @3
	== IMOEN25J IF ~Global("ImoenSummoned","GLOBAL",2)~ THEN @4
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @5
	== IMOEN25J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @6
	== IMOEN25J IF ~GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @7
	== AERIE25J IF ~IsValidForPartyDialog("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @8
	== IMOEN25J IF ~IsValidForPartyDialog("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @9
	== IMOEN25J @10
	= @11
END
   ++ @12 + T5
   + ~Global("ImoenRomanceActive","GLOBAL",2)~ + @13 + T4
   ++ @14 + T3
   ++ @15 + T2
   ++ @16 + T2

APPEND IMOEN25J
IF ~~ T2
   SAY @17
   IF ~~ THEN EXIT
END

IF ~~ T3
   SAY @18
   IF ~~ THEN GOTO TDr
END

IF ~~ T4
   SAY ~(She gives you a cheeky grin.) I can always count on ya to keep my mind off the nasty stuff.~
   ~The nightmares aren't as bad as they used to be, though. Nowadays they're mostly... disturbing. The kinda dreams you wake up from and wonder what's wrong with yer head.~
   IF ~~ THEN GOTO TDr
END

IF ~~ T5
   SAY @20
   IF ~~ THEN GOTO TDr
END

IF ~~ TDr
   SAY @21
   ++ @22 + TDrEx
   ++ @23 + TDr5
   ++ @24 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + TDr4
   ++ @25 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + TDr3
   ++ @26 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + TDr2
   ++ @27 + TDr1
END

IF ~~ TDr1
   SAY @28
   IF ~~ THEN GOTO T2
END

IF ~~ TDr2
   SAY @29
   = @30
   IF ~~ THEN EXIT
END

IF ~~ TDr3
   SAY @31
   = @32
   = @33
   IF ~~ THEN GOTO TDrEnd
END

IF ~~ TDrEnd
   SAY @34
   IF ~~ THEN GOTO T2
END

IF ~~ TDr4
   SAY @35
   = @36
   IF ~~ THEN GOTO TDrEnd
END

IF ~~ TDr5
   SAY @37
   = @38
   ++ @39 + TDrEx
   ++ @24 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + TDr4
   ++ @25 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + TDr3
   ++ @26 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + TDr2
   ++ @27 + TDr1
END

IF ~~ TDrEx
   SAY @40
   IF ~RandomNum(5,1)~ THEN GOTO TDrExKhalid
   IF ~RandomNum(5,2)~ THEN GOTO TDrExVat
   IF ~RandomNum(5,3)~ THEN GOTO TDrExCycles
   IF ~RandomNum(5,4)~ THEN GOTO TDrExBodhi
   IF ~RandomNum(5,5)~ THEN GOTO TDrExKnives
END

IF ~~ TDrExKhalid
   SAY @41
   = @42
	= @43
	= @44
	= @45
	= @46
	= @47
	= @48
	= @49
   IF ~~ THEN GOTO TDrLast
END



IF ~~ TDrExVat
   SAY @50
   = @51
	= @52
	= @53

	= @54
	= @55
	= @56
	= @57
	= @58
   IF ~~ THEN GOTO TDrLast
END

IF ~~ TDrExCycles
   SAY @59
   = @60

	= @61
	= @62
	= @63
	= @64
	= @65

	= @66
	= @67
	= @68
	= @69
   IF ~~ THEN GOTO TDrLast
END

IF ~~ TDrExBodhi
   SAY @70

   = @71
	= @72
	= @73
	= @74

	= @75

	= @76
	= @77
	= @78
	= @79
	= @80
	= @81
	= @82
  IF ~~ THEN GOTO TDrLast
END


IF ~~ TDrExKnives
   SAY @83

   = @84
	= @85
	= @86
	= @87

	= @88
	= @89
	= @90
	= @82
   IF ~~ THEN GOTO TDrLast
END


IF WEIGHT #400 ~~ TDrLast
  SAY @91
	= @92
   IF ~~ THEN GOTO TDrLastN
END

IF ~~ THEN TDrLastN
   SAY @93
   ++ @94 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + TDrReally
   ++ @95 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + TDr4
   ++ @96 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + TDr3
   ++ @97 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + TDr2
   ++ @98 + TDr1
END

IF ~~ TDrReally
   SAY @99
   = @100
   ++ @101 + TDrR5
   + ~Global("ImoenRomanceActive","GLOBAL",2)~ + @102 + TDrR4Romanced
   + ~!Global("ImoenRomanceActive","GLOBAL",2)~ + @102 + TDrR4Friend
   ++ @103 + TDrR3
   ++ @104 + TDrR2
   ++ @105 + TDrR1
END

IF ~~ TDrR1
   SAY ~Well, obviously I'm never going to forget. And I get jittery in dark and closed places. And I might totally lose it if I ever get thrown in jail or a dungeon all by myself. But other than that... I manage.~
   ~I'm alright, <CHARNAME>. We've all got demons. (Her lips curve in a half-smile.) At least mine are dead.~
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrR2
   SAY @107
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrR3
   SAY @108
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrR4Romanced
   SAY @109
   = @110
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrR4Friend
   SAY @111
   = @112
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrR5
   SAY @113
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrTaint
   SAY @114
   ++ @115 + TDr0
   ++ @116 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + TDr4
   ++ @117 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + TDr3
   ++ @26 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + TDr2
   ++ @27 + TDr1
END

IF ~~ TDr0
   SAY @118
   = @119
   IF ~~ THEN EXIT
END
END