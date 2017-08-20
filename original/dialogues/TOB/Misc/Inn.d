//saradush inn keeper

EXTEND_BOTTOM SARBAR02 0
	+ ~IsValidForPartyDialog("Imoen2") Global("ImoenRomanceActive","GLOBAL",2) Global("IRTQTSaradush","GLOBAL",0)~ + @0 DO ~ SetGlobal("IRTQTSaradush","GLOBAL",1) StartCutSceneMode() StartCutScene("IQTCUT")~ EXIT
END


APPEND IMOEN25J
IF ~Global("IRTQTSaradush","GLOBAL",1)~ THEN 1QT
	SAY ~(After you made known your intentions to stay, Imoen appropriated a table toward the back of the inn. Her pack lies by her feet, while her weapon is leaning against the corner, close at hand. She is rummaging through her belongings as you approach.)~
	[IRYayRom]
	= @2
	++ @3  DO ~SetGlobal("IRTQTSaradush","GLOBAL",2)~ + 1QT1
	++ @4  DO ~SetGlobal("IRTQTSaradush","GLOBAL",2)~ + 1QT2
	++ @5  DO ~SetGlobal("IRTQTSaradush","GLOBAL",2)~ + 1QT3
	++ @6 DO ~SetGlobal("IRTQTSaradush","GLOBAL",2)~ + 1QT4
	++ @7  DO ~SetGlobal("IRTQTSaradush","GLOBAL",2)~+ 1QT5
END

IF ~~ THEN 1QT1
	SAY @8
	IF ~~ THEN GOTO 1QTOrder
END

IF ~~ THEN 1QT2
	SAY @9
	++ @10 + 1QT2a
	++ @11 + 1QT4
END

IF ~~ THEN 1QT2a
	SAY @12
	IF ~~ THEN GOTO 1QTOrder
END

IF ~~ THEN 1QT3
	SAY @13
	= @14
	++ @15 + 1QT3a
	++ @16 + 1QT3b
	++ @17 + 1QT4
END

IF ~~ THEN 1QT3a
	SAY @18
	= @19
	IF ~~ THEN GOTO 1QTOrder
END

IF ~~ THEN 1QT3b
	SAY @20
	IF ~~ THEN GOTO 1QTOrder
END

IF ~~ THEN 1QT4
	SAY @21
	++ @22 + 1QT4a
	++ @23 + 1QT4c
END

IF ~~ THEN 1QT4a
	SAY @24
	IF ~~ THEN GOTO 1QTOrder
END

IF ~~ THEN 1QT4c
	SAY @25
	= @26
	IF ~~ THEN GOTO 1QTSolo
END

IF ~~ THEN 1QT5
	SAY @27
	= @28
	= @29
	IF ~~ THEN GOTO 1QTOrder
END
END

CHAIN IMOEN25J 1QTOrder
	@30 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",2)~
	== IMOEN25J IF ~!NumInPartyGT(2)~ THEN @31
	== IMOEN25J IF ~NumInPartyGT(2)~ THEN @32
	= @33
END IMOEN25J 1QTEnd
	
CHAIN IMOEN25J 1QTSolo
	@34 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~
	== IMOEN25J IF ~!NumInPartyGT(2)~ THEN @35
	== IMOEN25J IF ~NumInPartyGT(2)~ THEN @36
	= @37
END IMOEN25J 1QTEnd

APPEND IMOEN25J	
IF ~~ THEN 1QTEnd
	SAY @38
	++ @39 + 1QTEnd1
	++ @40 + 1QTEnd2
	++ @41 + 1QTEnd3
	++ @42 + 1QTEnd4
	++ @43 + 1QTEnd5
	++ @44 + 1QTEnd6
END

IF ~~ THEN 1QTEnd1
	SAY @45
	IF ~~ THEN GOTO 1QTLast
END

IF ~~ THEN 1QTLast
	SAY @46
	IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) ClearAllActions()  StartCutSceneMode() StartCutScene("IQT1Cut")~ EXIT
END

IF ~~ THEN 1QTEnd2
	SAY @47
	++ @48 + 1QTEnd2a
	++ @49 + 1QTEnd2b 
END

IF ~~ THEN 1QTEnd2a
	SAY @50
	IF ~~ THEN GOTO 1QTLast
END

IF ~~ THEN 1QTEnd2b
	SAY @51
	IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("IQT2Cut")~ EXIT
END

IF ~~ THEN 1QTEnd3
	SAY @52
	= @53
	IF ~~ THEN GOTO 1QTLast
END

IF ~~ THEN 1QTEnd4
	SAY @54
	IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("IQT1Cut")~ EXIT
END

IF ~~ THEN 1QTEnd5
	SAY @55
	= @56
	IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("IQT2Cut")~ EXIT
END	

IF ~~ THEN 1QTEnd6
	SAY @57
	++ @58 + 1QTEnd1
	++ @59 + 1QTEnd2
	++ @60 + 1QTEnd3
	++ @61 + 1QTEnd5
END
END

// In the Amkethran Inn

EXTEND_BOTTOM AMBAR01 0
	+ ~IsValidForPartyDialog("Imoen2") Global("ImoenRomanceActive","GLOBAL",2) Global("IRTQTAmkethran","GLOBAL",0)~ + @0  DO ~ SetGlobal("IRTQTAmkethran","GLOBAL",1)~ EXTERN IMOEN25J 3QT
END

EXTEND_BOTTOM AMBAR01 20
	+ ~IsValidForPartyDialog("Imoen2") Global("ImoenRomanceActive","GLOBAL",2) Global("IRTQTAmkethran","GLOBAL",0)~ + @0  DO ~ SetGlobal("IRTQTAmkethran","GLOBAL",1)~ EXTERN IMOEN25J 3QT
END

EXTEND_BOTTOM AMBAR01 40
	+ ~IsValidForPartyDialog("Imoen2") Global("ImoenRomanceActive","GLOBAL",2) Global("IRTQTAmkethran","GLOBAL",0)~ + @0  DO ~ SetGlobal("IRTQTAmkethran","GLOBAL",1)~ EXTERN IMOEN25J 3QT
END


APPEND IMOEN25J
IF ~~ THEN 3QT
	SAY @62
	= @63
	++ @64 + 3QT5
	++ @65 + 3QT1
	++ @66 + 3QT2
	++ @67 + 3QT3
	++ @68 + 3QT4

END

IF ~~ THEN 3QT1
	SAY @69
	= @70
	IF ~~ THEN EXIT
END

IF ~~ THEN 3QT2
	SAY @71
	= @72
	++ @73 + 3QT5
	++ @74 + 3QT2a
	++ @75 + 3QT3
	++ @76 + 3QT4

END

IF ~~ THEN 3QT2a
	SAY @77
	IF ~~ THEN EXIT
END
	
IF ~~ THEN 3QT3
	SAY @78
	= @79
	++ @80 + 3QT5
	++ @81 + 3QT2a
	++ @82 + 3QT4
END

IF ~~ THEN 3QT4
	SAY @83
	= @84
	= @85
	IF ~~ THEN DO ~RestParty()~ EXIT
END	
	
IF ~~ THEN 3QT5
	SAY @86
	++ @87 + 3QT5a
	++ @88 + 3QT5b
	++ @89 + 3QT5c
	++ @90 + 3QTGoDown
END

IF ~~ THEN 3QT5a
	SAY @91
	IF ~~ THEN GOTO 3QTGoDown
END

IF ~~ THEN 3QT5b
	SAY @92
	IF ~~ THEN GOTO 3QTGoDown
END

IF ~~ THEN 3QT5c
	SAY @93
	IF ~~ THEN GOTO 3QTGoDown
END

IF ~~ THEN 3QTGoDown
	SAY @94
	IF ~~ THEN DO ~SetGlobal("IRT3QTDownstairs","GLOBAL",1) ClearAllActions()  StartCutSceneMode() StartCutScene("3QTCut")~ /*Small cutscene moving the party to downstairs area: a suitably small inn area recycled from one of the many inn maps in the game or even from BG1. Imoen starts dialogue after a fade in and a slow pan of the area */ EXIT
END
END

CHAIN IF WEIGHT #-5 ~Global("IRT3QTDownstairs","GLOBAL",1)~ THEN IMOEN25J 3QTDown
	@95
	=@96 DO ~SetGlobal("IRT3QTDownstairs","GLOBAL",2)~
/*	= ~<CHARNAME>, get me a bath and you can wreck my vag for as long as you like.~ */
/* Hmm, maybe phrase that differently. */
END IMOEN25J 3QTDownN

APPEND IMOEN25J
IF ~~ THEN 3QTDownN
	SAY @97
	++ @98 + 3QTD1
	++ @99 + 3QTD2
	++ @100 + 3QTD3
	++ @101 + 3QTD4
	++ @102 + 3QTD5
END

IF ~~ THEN 3QTD1
	SAY @103
	IF ~~ THEN GOTO 3QTDFill
END	

IF ~~ THEN 3QTD2
	SAY @104
	IF ~~ THEN GOTO 3QTDFill
END

IF ~~ THEN 3QTD3
	SAY @105
	IF ~~ THEN GOTO 3QTD3Mud
END

IF ~~ THEN 3QTD3Mud
	SAY @106
	++ @107 + 3QTD3a
	++ @108 + 3QTD1
END

IF ~~ THEN 3QTD3a
	SAY @109
	= @110
	IF ~~ THEN DO ~ClearAllActions()  StartCutSceneMode() StartCutScene("3QTCuta")~ EXIT /*  Cutscene: transport the party back upstairs. */
END
	
IF ~~ THEN 3QTD4
	SAY @111
	IF ~~ THEN GOTO 3QTD3Mud
END

IF ~~ THEN 3QTD5
	SAY @112
	++ @113 + 3QTD5a
	++ @114 + 3QTD5b
END

IF ~~ THEN 3QTD5a
	SAY @115
	= @116
	IF ~~ THEN DO ~ClearAllActions()  StartCutSceneMode() StartCutScene("3QTCuta")~ EXIT /*  Cutscene: transport the party back upstairs. */
END

IF ~~ THEN 3QTD5b
	SAY @117
	IF ~~ THEN GOTO 3QTDFill
END	
END 

CHAIN IMOEN25J 3QTDFill
	@118 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",2)~
	= @119
	= @120
	= @121
	= @122
	== IMOEN25J IF ~Gender(Player1,MALE)~ THEN @123
	== IMOEN25J IF ~Gender(Player1,FEMALE)~ THEN @124
	== IMOEN25J @125 
END
     IF ~~ THEN DO ~ StartCutSceneMode() StartCutScene("3QTCutb")~ EXIT
