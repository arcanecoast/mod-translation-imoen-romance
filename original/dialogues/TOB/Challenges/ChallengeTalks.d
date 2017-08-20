
/* Contents:
// First Challenge
// Second Challenge
// Third Challenge
// Fourth Challenge
// Fifth Challenge
*/


// ~~ First challenge ~~

// Triggers as soon as the whole challenge is over, right when you are able to roam free again.

APPEND IMOEN25J
IF WEIGHT #10 ~Global("IRTTestTalk1","GLOBAL",1)~ THEN 1stT
	SAY @0
	IF ~~ THEN DO ~SetGlobal("IRTTestTalk1","GLOBAL",2) SetGlobal("IRTHadFaithTalk","GLOBAL",1)~ GOTO 1stTAnswer
END

IF ~~ THEN 1stTAnswer
	SAY @1
	++ @2 + 1stT1
	++ @3 + 1stT2
	++ @4 + 1stT3
	++ @5 + 1stT4
	++ @6 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-1)~ + 1stT5
END

IF ~~ THEN 1stT1
	SAY @7
	IF ~~ THEN GOTO 1stT1Replies
END

IF ~~ THEN 1stT1Replies
	SAY @8
	++ @9 + 1stT1a
	++ @10 + 1stT1b 
	++ @11 + 1stT1c
	++ @12 + 1stT1d
END

IF ~~ THEN 1stT1a
	SAY @13
	= @14
	IF ~~ THEN GOTO 1stTEnd1
END

IF ~~ THEN 1stT1b
	SAY @15
	= @16
	IF ~~ THEN GOTO 1stTEnd1
END

IF ~~ THEN 1stT1c
	SAY @17
	= @18
	IF ~~ THEN GOTO 1stTEnd1
END

IF ~~ THEN 1stT1d
	SAY @19
	IF ~~ THEN GOTO 1stTEnd1
END

IF ~~ THEN 1stTEnd1
	SAY @20
	IF ~~ THEN EXIT
END

IF ~~ THEN 1stT2
	SAY @21
	= @8
	++ @22 + 1stT1a
	++ @11 + 1stT1c
	++ @23 + 1stT2b
	++ @24 + 1stT1c
	++ @25 + 1stT2a
END

IF ~~ THEN 1stT2a
	SAY @26
	= @27
	IF ~~ THEN GOTO 1stTEnd1
END

IF ~~ THEN 1stT2b
	SAY @28
	= @29
	IF ~~ THEN GOTO 1stTEnd1
END
	
IF ~~ THEN 1stT3
	SAY @30
	IF ~~ THEN GOTO 1stT1Replies
END

IF ~~ THEN 1stT4
	SAY @31
	= @32
	++ @33 + 1stT1d
	++ @34 + 1stT1a
	++ @35 + 1stT1b
	++ @11 + 1stT1c
	++ @36 + 1stT4a
END

IF ~~ THEN 1stT4a
	SAY @37
	= @38
	IF ~~ THEN GOTO 1stT4End
END

IF ~~ THEN 1stT4End
	SAY @39
	IF ~~ THEN EXIT
END
	
IF ~~ THEN 1stT5
	SAY @40
	= @41
	++ @42 + 1stT5a
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @43 + 1stT5love
	++ @44 + 1stT1b
	++ @45 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ + 1stT5b
	++ @46 + 1stT5c
END

IF ~~ THEN 1stT5love
	SAY @47
	++ @48 + 1stT5a
	++ @49 + 1stT1b
	++ @50 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ + 1stT5b
	++ @51 + 1stT5loveEnd
END
	
IF ~~ THEN 1stT5loveEnd
	SAY @52
	= @53
	= @54
	IF ~~ THEN DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ EXIT
END	
	
IF ~~ THEN 1stT5a
	SAY @55
	= @56
	IF ~~ THEN GOTO 1stT4End
END

IF ~~ THEN 1stT5b
	SAY @57
	= @58
	= @59
	= @60
	IF ~~ THEN EXIT
END

IF ~~ THEN 1stT5c
	SAY @61
	= @62
	IF ~~ THEN EXIT
END
END

// ~~ Second Challenge ~~
// Triggers when challenge is completed
// Make sure !Global("ImoenRomanceActive","GLOBAL",3) for this one

CHAIN IF WEIGHT #10 ~Global("IRTTestTalk2","GLOBAL",1)~ THEN IMOEN25J 2ndT
	@63 DO ~SetGlobal("IRTTestTalk2","GLOBAL",2)~
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @64
	== IMOEN25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @65
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @66
	== IMOEN25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @67
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @68
	== IMOEN25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @69
	
END IMOEN25J 2ndTAnswer

APPEND IMOEN25J
IF ~~ THEN 2ndTAnswer
	SAY @70
	++ @71 + 2ndT1
	++ @72 + 2ndT2
	++ @73 + 2ndT3
	++ @74 + 2ndT4
	++ @75 + 2ndT5
	++ @76 + 2ndT5
	++ @77 + 2ndT6
	++ @78 + 2ndT7
END
END


CHAIN IMOEN25J 2ndT1
	@79
	== IMOEN25J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @80
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @81
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @82
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @83
	== IMOEN25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @84
END IMOEN25J 2ndTEnd


APPEND IMOEN25J
IF ~~ THEN 2ndTEnd
	SAY @85
	IF ~~ THEN EXIT
END

IF ~~ THEN 2ndT2
	SAY @86
	= @87
	IF ~~ THEN EXIT
END

IF ~~ THEN 2ndT3
	SAY @88
	IF ~~ THEN GOTO 2ndTEnd
END
END

CHAIN IMOEN25J 2ndT4
	@89
	== IMOEN25J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @90
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @91
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @82
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @92
	== IMOEN25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @84
END IMOEN25J 2ndTEnd
	
CHAIN IMOEN25J 2ndT5
	@93
	== IMOEN25J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @80
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @81
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @82
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @92
	== IMOEN25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @84
END IMOEN25J 2ndTEnd
	
CHAIN IMOEN25J 2ndT6
	@94
	== IMOEN25J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @80
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @81
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @82
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @92
	== IMOEN25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @84
END IMOEN25J 2ndTEnd

CHAIN IMOEN25J 2ndT7
	@95
	== IMOEN25J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @80
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @81
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @82
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @92
	== IMOEN25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @96
END IMOEN25J 2ndTEnd

	
// 3rd Challenge	
// Triggers when challenge is completed

APPEND IMOEN25J
IF WEIGHT #0 ~Global("IRTTestTalk3","GLOBAL",1)~ THEN 3rdT
	SAY @97
	IF ~~ THEN DO ~SetGlobal("IRTTestTalk3","GLOBAL",2)~ GOTO 3rdTN
END

IF ~~ THEN 3rdTN
	SAY @98
	++ @99 + 3rdT1
	+ ~!Global("ImoenRomanceActive","GLOBAL",2)~ + @100 + 3rdT2
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @101 + 3rdT3
	++ @102 + 3rdT4
	++ @103 + 3rdT5
	+ ~!Global("ImoenRomanceActive","GLOBAL",3)~ + @104 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-2)~ + 3rdT6
	+ ~Global("ImoenRomanceActive","GLOBAL",3)~ + @105 DO ~SetGlobal("IRTShutUp","GLOBAL",1)~ + 3rdT7
END	

IF ~~ THEN 3rdT1
	SAY @106
	IF ~~ THEN GOTO 3rdT1R
END

IF ~~ THEN 3rdT1R
	SAY @107
	++ @108 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + 3rdT1a
	++ @109 + 3rdT1b
	++ @110 + 3rdT1b
	++ @111 + 3rdT1c
END

IF ~~ THEN 3rdT1a
	SAY @112
	IF ~~ THEN GOTO 3rdT1End
END

IF ~~ THEN 3rdT1b
	SAY @113
	IF ~~ THEN GOTO 3rdT1End
END

IF ~~ THEN 3rdT1c
	SAY @114
	IF ~~ THEN GOTO 3rdT1End
END

IF ~~ THEN 3rdT1End
	SAY @115
	IF ~~ THEN EXIT
END

IF ~~ THEN 3rdT2
	SAY @116
	= @117
	= @118
	++ @119 + 3rdT2a
	++ @120 + 3rdT2b
	++ @121 + 3rdT2c
	++ @122 + 3rdT2d
END

IF ~~ THEN 3rdT2a
	SAY @123
	= @124
	IF ~~ THEN GOTO 3rdT2End
END

IF ~~ THEN 3rdT2b
	SAY @125
	= @126
	IF ~~ THEN GOTO 3rdT2End
END

IF ~~ THEN 3rdT2c
	SAY @127
	IF ~~ THEN EXIT
END
	
IF ~~ THEN 3rdT2d
	SAY @128
	= @129
	IF ~~ THEN EXIT
END

IF ~~ THEN 3rdT2End
	SAY @130
	IF ~~ THEN EXIT
END

IF ~~ THEN 3rdT3
	SAY @131
	= @132
	++ @133 + 3rdT3a
	++ @134 + 3rdT3b
	++ @135 + 3rdT3c
	++ @136 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ + 3rdT3d
END

IF ~~ THEN 3rdT3a
	SAY @137
	++ @138 + 3rdT3Rel
	++ @139 EXIT
END

IF ~~ THEN 3rdT3Rel
	SAY @140
	= @141
	++ @142 + 3rdT3Rel1
	++ @143 + 3rdT3Rel2
	++ @144 + 3rdT3Rel3
	++ @145 + 3rdT3Rel4
END

IF ~~ THEN 3rdT3Rel1
	SAY @146
	IF ~~ THEN GOTO 3rdT3RelEnd
END

IF ~~ THEN 3rdT3Rel2
	SAY @147
	IF ~~ THEN GOTO 3rdT3RelEnd
END

IF ~~ THEN 3rdT3Rel3
	SAY @148
	IF ~~ THEN GOTO 3rdT3RelEnd
END

IF ~~ THEN 3rdT3Rel4
	SAY @149
	IF ~~ THEN GOTO 3rdT3RelEnd
END

IF ~~ THEN 3rdT3RelEnd
	SAY @150
	IF ~~ THEN EXIT
END

IF ~~ THEN 3rdT3b
	SAY @151
	= @152
	IF ~~ THEN GOTO 3rdT1R
END

IF ~~ THEN 3rdT3c
	SAY @153
	IF ~~ THEN GOTO 3rdT1R
END

IF ~~ THEN 3rdT3d
	SAY @154
	IF ~~ THEN GOTO 3rdT3RelEnd
END

IF ~~ THEN 3rdT4
	SAY @155
	= @156
	++ @157 + 3rdT4a
	++ @158 + 3rdT4a
	++ @159 + 3rdT5
	++ @160 + 3rdT4b
	++ @161 + 3rdT4c
END	

IF ~~ THEN 3rdT4a
	SAY @162
	IF ~~ THEN GOTO 3rdT1R
END

IF ~~ THEN 3rdT4b
	SAY @163
	++ @164 + 3rdT4b1
	++ @165 + 3rdT4b2
	++ @166 + 3rdT4b3
END

IF ~~ THEN 3rdT4b1
	SAY @167
	= @168
	IF ~~ THEN EXIT
END

IF ~~ THEN 3rdT4b2
	SAY @169
	= @168
	IF ~~ THEN EXIT
END
	
IF ~~ THEN 3rdT4b3
	SAY @170
	= @171
	IF ~~ THEN EXIT
END

IF ~~ THEN 3rdT4c
	SAY @172
	++ @173 + 3rdT4c1
	++ @174 + 3rdT4c2
	++ @175 + 3rdT4c3
END

IF ~~ THEN 3rdT4c1
	SAY @176
	IF ~~ THEN EXIT
END

IF ~~ THEN 3rdT4c2
	SAY @177
	= @168
	IF ~~ THEN EXIT
END

IF ~~ THEN 3rdT4c3
	SAY @178
	= @179	
	IF ~~ THEN EXIT
END

IF ~~ THEN 3rdT5
	SAY @180
	++ @181 + 3rdT5a
	++ @182 + 3rdT5a
	++ @183 + 3rdT4b2
END

IF ~~ THEN 3rdT5a
	SAY @184
	= @179	
	IF ~~ THEN EXIT
END

IF ~~ THEN 3rdT6
	SAY @185
	IF ~~ THEN EXIT
END
	
IF ~~ THEN 3rdT7
	SAY @186
	IF ~~ THEN EXIT
END
END
	
// 4th Challenge
// This next part triggers right after the challenge becomes available, before the challenge itself. Triggers when a party member goes inside the entrance hallway

APPEND IMOEN25J
IF WEIGHT #0 ~Global("IRTTestTalk4","GLOBAL",1)~ THEN 4thT
	SAY @187
	++ @188 DO ~SetGlobal("IRTTestTalk4","GLOBAL",2)~ + 4thT1
	++ @189 DO ~SetGlobal("IRTTestTalk4","GLOBAL",2)~ + 4thT2
	++ @190 DO ~SetGlobal("IRTTestTalk4","GLOBAL",2)~ + 4thT3
	++ @191 DO ~SetGlobal("IRTTestTalk4","GLOBAL",2)~ + 4thT4
	++ @192 DO ~SetGlobal("IRTTestTalk4","GLOBAL",2)~ + 4thT5
END

IF ~~ THEN 4thT1
	SAY @193
	IF ~~ THEN EXIT
END

IF ~~ THEN 4thT2
	SAY @194
	IF ~~ THEN EXIT
END

IF ~~ THEN 4thT3
	SAY @195
	IF ~~ THEN EXIT
END

IF ~~ THEN 4thT4
	SAY @196
	= @197
	IF ~~ THEN EXIT
END

IF ~~ THEN 4thT5
	SAY @198
	IF ~~ THEN EXIT
END
END

// This next part triggers after the challenge is over
// make sure !Global("IRTShutUp","GLOBAL",1)

APPEND IMOEN25J 
IF WEIGHT #0 ~Global("IRTTestTalk4","GLOBAL",3)~ THEN 4thTAfter
	SAY @199
	IF ~~ THEN DO ~SetGlobal("IRTTestTalk4","GLOBAL",4)~ GOTO 4thTA
END

IF ~~ THEN 4thTA
	SAY @200
	++ @201 + 4thTA1
	++ @202 + 4thTA2
	++ @203 + 4thTA3
	++ @204 + 4thTA4
	++ @205 + 4thTA5
END

IF ~~ THEN 4thTA1
	SAY @206
	++ @207 + 4thTA1a
	++ @208 + 4thTA1b
	++ @209 + 4thTA1a
END

IF ~~ THEN 4thTA1a
	SAY @210
	= @211
	IF ~~ THEN EXIT
END

IF ~~ THEN 4thTA1b
	SAY @212
	= @213
	IF ~~ THEN EXIT
END

IF ~~ THEN 4thTA2
	SAY @214
	= @215
	++ @216 + 4thTA2a
	++ @217 + 4thTA2b
	++ @218 + 4thTA2a
	++ @219 + 4thTA2c
END

IF ~~ THEN 4thTA2a
	SAY @220
	= @221
	IF ~~ THEN EXIT
END

IF ~~ THEN 4thTA2b
	SAY @222
	= @223
	IF ~~ THEN EXIT
END

IF ~~ THEN 4thTA2c
	SAY @224
	IF ~~ THEN EXIT
END

IF ~~ THEN 4thTA3
	SAY @225
	++ @226 + 4thTA2a
	++ @217 + 4thTA2b
	++ @218 + 4thTA2a
	++ @227 + 4thTA3a
END

IF ~~ THEN 4thTA3a
	SAY @228
	= @229
	IF ~~ THEN EXIT
END

IF ~~ THEN 4thTA4
	SAY @230
	IF ~~ THEN GOTO 4thTA4End
END

IF ~~ THEN 4thTA4End
	SAY @231
	= @232
	= @233
	IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN 4thTA5
	SAY @234
	IF ~~ THEN GOTO 4thTA4End
END
END


// Fifth Challenge
// Can be different depending on whether Imoen has already become the Ravager
//  Triggers when challenge is completed

APPEND IMOEN25J
IF WEIGHT #-5 ~Global("IRTTestTalk5","GLOBAL",1) Global("IRTImoenIsRavager","GLOBAL",1)~ THEN 5thR
	SAY @235
	IF ~~ THEN DO ~SetGlobal("IRTTestTalk5","GLOBAL",2)~ GOTO 5thRR
END

IF ~~ THEN 5thRR
	SAY @236
	++ @237 + 5thR1
	++ @238 + 5thR2
	++ @239 + 5thR3
	++ @240 + 5thR4
END

IF ~~ THEN 5thR1
	SAY @241
	IF ~~ THEN GOTO 5thREnd
END

IF ~~ THEN 5thREnd
	SAY @242
	= @243
	IF ~~ THEN EXIT
END

IF ~~ THEN 5thR2
	SAY @244
	IF ~~ THEN GOTO 5thREnd
END

IF ~~ THEN 5thR3
	SAY @245
	IF ~~ THEN GOTO 5thREnd
END

IF ~~ THEN 5thR4
	SAY @246
	IF ~~ THEN GOTO 5thREnd
END

IF WEIGHT #-5 ~Global("IRTTestTalk5","GLOBAL",1) !Global("IRTImoenIsRavager","GLOBAL",1)~ THEN 5th
	SAY @247
	IF ~~ THEN DO ~SetGlobal("IRTTestTalk5","GLOBAL",2)~ GOTO 5thT
END

IF ~~ THEN 5thT
	SAY @248
	++ @249 + 5thT1
	++ @250 + 5thT2
	++ @251 + 5thT3
	++ @252 + 5thT4
	++ @253 + 5thT5
END

IF ~~ THEN 5thT1
	SAY @254
	IF ~~ THEN GOTO 5thTPreEnd
END

IF ~~ THEN 5thTPreEnd
	SAY @255
	IF ~~ THEN GOTO 5thTEnd
END

IF ~~ THEN 5thT2
	SAY @256
	IF ~~ THEN GOTO 5thTPreEnd
END

IF ~~ THEN 5thT3
	SAY @257
	IF ~~ THEN GOTO 5thTEnd
END

IF ~~ THEN 5thTEnd
	SAY @258
	IF ~~ THEN EXIT
END

IF ~~ THEN 5thT4
	SAY @259 
	IF ~~ THEN GOTO 5thTPreEnd
END

IF ~~ THEN 5thT5
	SAY @260
	IF ~~ THEN GOTO 5thTPreEnd
END
END
