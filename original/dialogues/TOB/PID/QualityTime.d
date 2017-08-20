// Unlike the previous version of Spending Quality Time with Imoen, these are much more scripted,
// to adapt to the much more fast paced plot and sense of urgency. 
// Contents:
// In the Pocket Plane
// In the Pocket Plane, the 2nd


// PID Option:


// In the Pocket Plane


// 1st
//Triggerable after second solar talk

// PID Option found in PIDTrees.d:
// + ~Global("ImoenRomanceActive","GLOBAL",2) IsGabber(Player1) Global("IRTQTPocket1","GLOBAL",1) AreaCheck("AR4500")~ + ~(Spend some relaxing quality time with Imoen.)~ DO ~SetGlobal("IRTQTPocket1","GLOBAL",2) IncrementGlobal("IRTLoveMeter","GLOBAL",2)~ + 2QT

APPEND IMOEN25J
IF ~~ THEN 2QT
	SAY @0
	= @1
	++ @2 + 2QT1
	++ @3 + 2QT2
	++ @4 + 2QT3
	++ @5 + 2QT4
	++ @6 + 2QT5
END

IF ~~ THEN 2QT1
	SAY @7
	IF ~~ THEN GOTO 2QTEnd
END

IF ~~ THEN 2QTEnd
	SAY @8
	= @9
	++ @10 + 2QTEnd1
	++ @11 + 2QTEnd2
	++ @12 + 2QTEnd3
END

IF ~~ THEN 2QTEnd1
	SAY @13
	IF ~~ THEN GOTO 2QTEndCommon
END

IF ~~ THEN 2QTEndCommon
	SAY @14
	++ @15 + 2QTEnd1a
	++ @16 + 2QTEnd1b
	++ @17 + 2QTEnd1c
	++ @18 + 2QTEnd1d
END

IF ~~ THEN 2QTEnd1a
	SAY @19
	IF ~~ THEN GOTO 2QTFinal
END

IF ~~ THEN 2QTEnd1b
	SAY @20
	IF ~~ THEN GOTO 2QTFinal
END

IF ~~ THEN 2QTEnd1c
	SAY @21
	IF ~~ THEN EXIT
END

IF ~~ THEN 2QTEnd1d
	SAY @22
	IF ~~ THEN GOTO 2QTFinal
END

IF ~~ THEN 2QTFinal
	SAY @23
	++ @24 + 2QT5a
	++ @25 + 2QTEndLater
END

IF ~~ THEN 2QTEndLater
	SAY @26
	IF ~~ THEN EXIT
END

IF ~~ THEN 2QTEnd2
	SAY @27
	= @28
	IF ~~ THEN GOTO 2QTEndCommon
END
	
IF ~~ THEN 2QTEnd3
	SAY @29
	IF ~~ THEN GOTO 2QTEnd1d
END

IF ~~ THEN 2QT2
	SAY @30
	IF ~~ THEN GOTO 2QTEnd
END

IF ~~ THEN 2QT3
	SAY @31
	IF ~~ THEN GOTO 2QTEnd
END

IF ~~ THEN 2QT4
	SAY @32
	IF ~~ THEN GOTO 2QTEnd
END

IF ~~ THEN 2QT5
	SAY @33
	++ @24 + 2QT5a
	++ @34 + 2QT5b
END

IF ~~ THEN 2QT5a
	SAY @35
	IF ~~ THEN DO ~SetGlobal("IRT2QTAfter","GLOBAL",1)  StartCutSceneMode() StartCutScene("2QTCut")~ EXIT
END

IF ~~ THEN 2QT5b
	SAY @36
	= @37
	IF ~~ THEN EXIT
END

// After the fade to black

IF WEIGHT #-10 ~Global("IRT2QTAfter","GLOBAL",1)~ THEN 2QTAfter
	SAY @38
	IF ~~ THEN DO ~SetGlobal("IRT2QTAfter","GLOBAL",2)~ GOTO 2QTAfterN
END

IF ~~ THEN 2QTAfterN
	SAY @39
	++ @40 + 2QTAf1
	++ @41 + 2QTAf2
	++ @42 + 2QTAf3
	++ @43 + 2QTAf4
	++ @44 + 2QTAf5
END

IF ~~ THEN 2QTAf1
	SAY @45
	= @46
	IF ~~ THEN EXIT
END

IF ~~ THEN 2QTAf2
	SAY @47
	= @48
	IF ~~ THEN EXIT
END

IF ~~ THEN 2QTAf3
	SAY @49
	= @50
	IF ~~ THEN EXIT
END	

IF ~~ THEN 2QTAf4
	SAY @51
	= @52
	= @53
	++ @54 + 2QTAf4a
	++ @55 + 2QTAf4b
	++ @56 + 2QTAf4b
	++ @57 + 2QTAf4c
END	

IF ~~ THEN 2QTAf4a
	SAY @58
	IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRT2QTAfter","GLOBAL",3)  StartCutSceneMode() StartCutScene("2QTACut")~ EXIT
END

IF ~~ THEN 2QTAf4b
	SAY @59
	= @60
	IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRT2QTAfter","GLOBAL",3)  StartCutSceneMode() StartCutScene("2QTACut")~ EXIT
END
	
IF ~~ THEN 2QTAf4c
	SAY @61
	IF ~~ THEN EXIT
END 

IF ~~ THEN 2QTAf5
	SAY @62
	= @50
	IF ~~ THEN EXIT
END	
END


// In the Pocket Plane, the 2nd
// Make sure this PID option is only available after either Sendai or Abazigal is dead, and the first pocket plane quality time has happened.
//	+ ~Global("ImoenRomanceActive","GLOBAL",2) IsGabber(Player1) GlobalGT("IRTQTPocket1","GLOBAL",1) Global("IRTQTPocket2","GLOBAL",0) AreaCheck("AR4500") OR(2) Dead("Abazigal") Dead("Sendai")~ + ~(Spend some relaxing quality time with Imoen.)~ DO ~SetGlobal("IRTQTPocket2","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",2)~ + 4QT

APPEND IMOEN25J
IF ~~ THEN 4QT
	SAY @63
	= @64
	++ @65 + 4QT1
	++ @66 + 4QT2
	++ @67 + 4QT3
	++ @68 + 4QT4
	++ @69 + 4QT5
END

IF ~~ THEN 4QT1
	SAY @70
	IF ~~ THEN GOTO 4QTSit
END
	
IF ~~ THEN 4QT2
	SAY @71
	IF ~~ THEN GOTO 4QTSit
END

IF ~~ THEN 4QT3
	SAY @72
	IF ~~ THEN GOTO 4QTSit
END

IF ~~ THEN 4QT4
	SAY @73
	IF ~~ THEN GOTO 4QTSit
END

IF ~~ THEN 4QTSit
	SAY @74
	= @75
	++ @76 + 4QTSitN 
	++ @77 + 4QTSit2
END

IF ~~ THEN 4QTSitN
	SAY @78
	= @79
	= @80
	++ @81 + 4QTS0
	++ @82 + 4QTS1
	++ @83 + 4QTS2
	++ @84 + 4QTS3
	++ @85 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ + 4QTS4
	++ @86 + 4QTS5
END

IF ~~ THEN 4QTS0
	SAY @87
	IF ~~ THEN GOTO 4QTSNext
END

IF ~~ THEN 4QTS1
	SAY @88
	IF ~~ THEN GOTO 4QTSNext
END

IF ~~ THEN 4QTS2
	SAY @89
	IF ~~ THEN GOTO 4QTSNextN
END
	
IF ~~ THEN 4QTS3
	SAY @90
	IF ~~ THEN GOTO 4QTSNext
END

IF ~~ THEN 4QTS4
	SAY @91
	IF ~~ THEN GOTO 4QTSNext
END
	
IF ~~ THEN 4QTS5
	SAY @92
	IF ~~ THEN GOTO 4QTSNext
END

IF ~~ THEN 4QTSNext
	SAY @93
	IF ~~ THEN GOTO 4QTSNextN
END

IF ~~ THEN 4QTSNextN
	SAY @94
	= @95
	++ @96 + 4QTStat1a
	++ @97 + 4QTStat1b
	++ @98 + 4QTStat1b
	++ @99 + 4QTStat1b
	++ @100 + 4QTStat1a
	++ @101 + 4QTStat1c
	++ @102 + 4QTSit2
END

IF ~~ THEN 4QTStat1a
	SAY @103
	IF ~~ THEN GOTO 4QTStat2
END

IF ~~ THEN 4QTStat1b
	SAY @104
	IF ~~ THEN GOTO 4QTStat2
END

IF ~~ THEN 4QTStat1c
	SAY @105
	IF ~~ THEN GOTO 4QTStat2
END

IF ~~ THEN 4QTStat2
	SAY @106
	= @107
	++ @108 + 4QTStat2a
	++ @109 + 4QTStat2b
	++ @110 + 4QTStat2c
	++ @111 + 4QTStat2d
	++ @112 + 4QTStat2a
	++ @113 + 4QTStat2e
	++ @102 + 4QTSit2
END

IF ~~ THEN 4QTStat2a
	SAY @114
	IF ~~ THEN GOTO 4QTTheEnd
END

IF ~~ THEN 4QTStat2b
	SAY @115
	IF ~~ THEN GOTO 4QTTheEnd
END

IF ~~ THEN 4QTStat2c
	SAY @116
	IF ~~ THEN GOTO 4QTTheEnd
END

IF ~~ THEN 4QTStat2d
	SAY @117
	IF ~~ THEN GOTO 4QTTheEnd
END

IF ~~ THEN 4QTStat2e
	SAY @118
	IF ~~ THEN GOTO 4QTTheEnd
END

IF ~~ THEN 4QTTheEnd
	SAY @119
	= @120
	IF ~~ THEN DO ~StartCutSceneMode() Wait(1) FadeToColor([40.0],0) Wait(1) RestParty() Wait(1) FadeFromColor([20.0],0) Wait(1) EndCutSceneMode()~ EXIT
END
	
IF ~~ THEN 4QTSit2
	SAY @121
	IF ~~ THEN GOTO 4QT5Sex
END

IF ~~ THEN 4QT5
	SAY @122
	IF ~~ THEN GOTO 4QT5Sex
END

IF ~~ THEN 4QT5Sex
	SAY @123
	++ @124 + 4QT5Sex1
	++ @125 + 4QT5Sex1
	++ @126 + 4QT5Sex2
	++ @127 + 4QT5Sex3
END

IF ~~ THEN 4QT5Sex1
	SAY @128
	= @129
	IF ~~ THEN DO ~StartCutSceneMode() Wait(1) FadeToColor([30.0],0) Wait(1) RestParty() Wait(1) FadeFromColor([30.0],0) Wait(1) EndCutSceneMode()~ EXIT
END

IF ~~ THEN 4QT5Sex2
	SAY @130
	IF ~~ THEN GOTO 4QT5SexEnd
END

IF ~~ THEN 4QT5Sex3
	SAY @131
	IF ~~ THEN GOTO 4QT5SexEnd
END

IF ~~ THEN 4QT5SexEnd
	SAY @132
	IF ~~ THEN DO ~StartCutSceneMode() Wait(1) FadeToColor([30.0],0) Wait(1) RestParty() Wait(1) FadeFromColor([30.0],0) Wait(1) EndCutSceneMode()~ EXIT
END
END











	
	
	
	


