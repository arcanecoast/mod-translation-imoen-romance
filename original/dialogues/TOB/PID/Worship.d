
// This is a small conversation initiated by the player in which (s)he asks which gods Imoen worships, if any.
//Make available after the first abyss test.

 
/* PID Option leading here:

IF ~!Global("IRTHadFaithTalk","GLOBAL",1) Global("IRTGodBelief","GLOBAL",1)~ THEN REPLY ~Do you worship any god, Imoen?~ DO ~SetGlobal("IRTHadFaithTalk","GLOBAL",1)~ GOTO god1

*/

APPEND IMOEN25J
IF ~~ THEN god1
 SAY @0
 = @1
 = @2
 ++ @3 + god0
 ++ @4 + god9
 ++ @5 + god2
 ++ @6 + god8
 ++ @7 + god7
 ++ @8 + god5
 ++ @9 + god5extra
END

IF ~~ THEN god2
 SAY @10
 IF ~~ THEN EXIT
END

IF ~~ THEN god5
 SAY @11
 IF ~~ THEN DO ~RunAwayFrom(Player1,25)~ EXIT
END

IF ~~ THEN god5extra
 SAY @12
 = @13
 = @14
 = @15
 IF ~~ THEN EXIT
END

IF ~~ THEN god7
 SAY @16
 = @17
 = @18
 IF ~~ THEN DO ~RunAwayFrom(Player1,25)~ EXIT
END

IF ~~ THEN god8
 SAY @19
 IF ~~ THEN GOTO godHungry
END

IF ~~ godHungry
   SAY @20
 IF ~~ THEN DO ~RunAwayFrom(Player1,25)~ EXIT
END

IF ~~ THEN god9
 SAY @21
 = @22
 ++ @23 + god9d
 ++ @24 + god9c
 ++ @25 + god8
 ++ @7 + god9b
 ++ @8 + god5
 ++ @9 + god9a
 ++ @26 + god2
END

IF ~~ THEN god9a
 SAY @27
 = @14
 = @15
 IF ~~ THEN EXIT
END

IF ~~ THEN god9b
 SAY @28
 = @29
 IF ~~ THEN DO ~RunAwayFrom(Player1,25)~ EXIT
END

IF ~~ THEN god9c
 SAY @30
 = @31
 ++ @32 + god0b
 ++ @25 + god8
 ++ @7 + god9b
 ++ @8 + god5
 ++ @9 + god9a
 ++ @26 + god2
END

IF ~~ THEN god9d
 SAY @33
 ++ @34 + godCorrupt
 ++ @24 + god9c
 ++ @25 + god8
 ++ @7 + god9b
 ++ @8 + god5
 ++ @26 + god2
 ++ @35 + god2
END

IF ~~ THEN god0
 SAY @30
 = @31
 ++ @32 + god0b
 ++ @36 + god0a
 ++ @25 + god8
 ++ @7 + god9b
 ++ @8 + god5
 ++ @9 + god9a
 ++ @26 + god2
END

IF ~~ THEN god0a
 SAY @21
 = @37
 ++ @23 + god9d
 ++ @25 + god8
 ++ @7 + god9b
 ++ @8 + god5
 ++ @9 + god9a
 ++ @26 + god2
END

IF ~~ THEN god0b
 SAY @38
 IF ~~ THEN GOTO godHungry
END

IF ~~ godCorrupt
   SAY @39
   = @40
   ++ @41 DO ~IncrementGlobal("IRTControlTaint","GLOBAL",1) IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ + godTaint1
   ++ @42 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + godTaint2
   ++ @43 + godFool
   ++ @44 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1)~ + godBack
END

IF ~~ godTaint1
   SAY @45
   = @46
   = @47
 IF ~~ THEN DO ~RunAwayFrom(Player1,25)~ EXIT
END

IF ~~ godTaint2
   SAY @48
   = @49
   = @50
 IF ~~ THEN DO ~RunAwayFrom(Player1,25)~ EXIT
END

IF ~~ godBack
   SAY @51
   ++ @52 + god8
   ++ @53 + god9b
   ++ @54 + god5
   ++ @55 + god9a
   ++ @56 + god2
END
END

CHAIN IMOEN25J godFool
@57
== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @58 DO ~SetGlobal("IRTCooldownDue","GLOBAL",1) IncrementGlobal("IRTCooldownCounter","GLOBAL",1)~
== IMOEN25J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @59
EXIT

