BEGIN ~MRDREPPI~
BEGIN ~MRPHLYDI~
BEGIN ~MRKHALID~
BEGIN ~MRWINTHR~
BEGIN ~MRHULL~
BEGIN ~MRFULLER~
BEGIN ~MROBE~
BEGIN ~MRJONDAL~
BEGIN ~MRREEVOR~

// *** The Gorion Wraith Event ***
// It is fully implemented as far as I can tell. The NPC stats could use tweaking for lower difficulty.

/*
Contents:
   1 - Imoen approaches the woman alone.
   2 - Imoen and you walk side to side towards this intriguing woman you both appear to know
   3 - You walk alone to meet with Phlydia
   - Main thing
   - Imoen guilt trip
   - Forcetalks for the actors
   - Asking Imoen what does she think about all this when you have free control of the thing
   - Post-event talk
*/

//// This should trigger as soon as you enter the Forest of Myr area. The instructions are appended to AR5202 script and contained in IRAR5202.baf

CHAIN IF WEIGHT #100 ~Global("IRTEnterMyr","GLOBAL",1)~ THEN PLAYER1 Gor1
	@0 DO ~SetGlobal("IRTEnterMyr","GLOBAL",3)~
	== IMOEN25J @1
	= @2
END
	++ @3 EXTERN IMOEN25J Gor2a
	++ @4 EXTERN IMOEN25J Gor2e
	++ @5 EXTERN IMOEN25J Gor2c
	++ @6 EXTERN IMOEN25J Gor2c
	++ @7 EXTERN IMOEN25J Gor2b

APPEND IMOEN25J
IF ~~ THEN Gor2b
	SAY @8
	++ @9 + Gor2e
	++ @10 + Gor2c1
	++ @11 + Gor2a
END

IF ~~ THEN Gor2c
	SAY @12
	++ @9 + Gor2e
	++ @10 + Gor2c1
	++ @11 + Gor2a
END

IF ~~ THEN Gor2a
	SAY @13
	IF ~~ THEN DO ~SetGlobal("IRTGorEvent","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("MRGor1")~ EXIT
END

IF ~~ THEN Gor2e
	SAY @14
	IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1")) SetGlobal("IRTGorEvent","GLOBAL",2) ClearAllActions() StartCutSceneMode() StartCutScene("MRGor2")~ EXIT
END

IF ~~ THEN Gor2c1
	SAY @15
	IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1")) SetGlobal("IRTGorEvent","GLOBAL",3) ClearAllActions() StartCutSceneMode() StartCutScene("MRGor3")~ EXIT
END
END


// 1 - Imoen approaches the woman alone.
CHAIN IF WEIGHT #1 ~Global("IRTGorEvent","GLOBAL",1)~ THEN IMOEN25J Gor3
	@16
	= @17
	== MRPHLYDI @18
	== IMOEN25J @19
	= @20
	== MRDREPPI @21
END IMOEN25J Gor3Cutscene

APPEND IMOEN25J
IF ~~ THEN Gor3Cutscene
	SAY @22
	IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("MRGor1a")~ EXIT
END
END

// Imoen moves as described. Cutscene with overhead strings. They move towards the center of the glade, until she finds Khalid. Imoen screams "Charname!". Khalid "talks" with Imoen until the player comes close and the Gorion wraith appears. 
// Khalid intervenes in the conversation, entwined with the original.

EXTEND_BOTTOM HGWRA01 0
	IF ~Global("ImoenRomanceActive","GLOBAL",2) InParty("Imoen2")~ THEN EXTERN MRKHALID GorM0
END

// 2 - Imoen and you walk side by side towards this intriguing woman you both appear to know
// The cutscene takes control and gets you two close to the woman.
CHAIN IF WEIGHT #1 ~Global("IRTGorEvent","GLOBAL",2)~ THEN PLAYER1 Gor4
	@23 
	== IMOEN25J @17
	== MRPHLYDI @24 
	== IMOEN25J @19
	= @20
	== MRDREPPI @21
END IMOEN25J Gor4N

APPEND IMOEN25J
IF ~~ THEN Gor4N
	SAY @25
	++ @26 + Gor4N5
	++ @27 + Gor4N4
	++ @28 + Gor4N1
END

IF ~~ THEN Gor4N1
	SAY @29
	IF ~~ THEN DO ~SetGlobal("IRTGorEvent","GLOBAL",1) StartCutSceneMode() StartCutScene("MRGor1a")~ EXIT
END

IF ~~ THEN Gor4N3Next
	SAY @30
	= @31
	IF ~~ THEN GOTO GorM0a
END

IF ~~ THEN Gor4N4
	SAY @32
	IF ~~ THEN DO ~SetGlobal("IRTGorEvent","GLOBAL",2) StartCutSceneMode() StartCutScene("MRGor1b")~ EXIT
END

IF ~~ THEN Gor4N5
	SAY @33
	IF ~~ THEN DO ~SetGlobal("IRTGorEvent","GLOBAL",2) StartCutSceneMode() StartCutScene("MRGor1c")~ EXIT
END
END

// 3 - You walk alone to meet with Phlydia
CHAIN IF WEIGHT #1 ~Global("IRTGorEvent","GLOBAL",3)~ THEN Player1 Gor5
	@34
	= @35
END MRPHLYDI Gor3a

APPEND MRPHLYDI
IF ~~ THEN Gor3a
	SAY @36
	++ @37 DO ~ SetGlobal("IRTGorEvent","GLOBAL",1) StartCutSceneMode()  ActionOverride("Imoen2",MoveToPoint([2125.1580])) Wait(4) EndCutSceneMode() ActionOverride("Imoen2",StartDialog("IMOEN25J","MRPHLYDI"))~ EXIT
	++ @38 + Gor3a2
	++ @39 + Gor3a2
	++ @40 + Gor3a2
END
END

CHAIN MRPHLYDI Gor3a2
	@41
	== MRDREPPI @42
	= @43
	== Player1 @44
END Player1 Gor3a2Choice

APPEND Player1
IF ~~ THEN Gor3a2Choice
	SAY @45
	++ @46 + Gor3a2e
	++ @47 + Gor3a2d
	++ @48 + Gor3a2c
	++ @49 + Gor3a2b
END
END


APPEND Player1
IF ~~ THEN Gor3a2b
	SAY @50
	IF ~~ THEN DO ~SetGlobal("IRTGor3a2b1","GLOBAL",1) StartCutSceneMode() MoveToPoint([1955.1550]) FaceObject("MRFULLER") ActionOverride("MRPHLYDI",FaceObject(Player1)) ActionOverride("MRDREPPI",FaceObject(Player1)) ActionOverride("MRREEVOR",FaceObject(Player1)) ActionOverride("MRJONDAL",FaceObject(Player1)) ActionOverride("MROBE",FaceObject(Player1)) ActionOverride("MRHULL",FaceObject(Player1)) ActionOverride("MRFULLER",FaceObject(Player1)) StartDialog("Player1","MRREEVOR") EndCutSceneMode()~ EXIT
END
END

CHAIN IF WEIGHT #0 ~Global("IRTGor3a2b1","GLOBAL",1)~ THEN Player1 Gor3a2b1
	@51 DO ~SetGlobal("IRTGor3a2b1","GLOBAL",2)~
	== MRREEVOR IF ~Gender(Player1,MALE)~ THEN @52
	== MRREEVOR IF ~Gender(Player1,FEMALE)~ THEN @53
	== IMOEN25J @54
DO ~SetGlobal("IRTGorEvent","GLOBAL",3) StartCutSceneMode() MoveToObject(Player1) StartCutScene("MRGor3a")~ EXIT

APPEND Player1
IF ~~ THEN Gor3a2c
	SAY @55
	IF ~~ THEN DO ~SetGlobal("IRTGorEvent","GLOBAL",2) StartCutSceneMode() StartCutScene("MRGor1b")~ EXIT
END


IF ~~ THEN Gor3a2d
	SAY @50
	IF ~~ THEN DO ~SetGlobal("IRTGor3a2d1","GLOBAL",1) StartCutSceneMode() MoveToPoint([1955.1550]) FaceObject("MRFULLER") ActionOverride("MRPHLYDI",FaceObject(Player1)) ActionOverride("MRDREPPI",FaceObject(Player1)) ActionOverride("MRREEVOR",FaceObject(Player1)) ActionOverride("MRJONDAL",FaceObject(Player1)) ActionOverride("MROBE",FaceObject(Player1)) ActionOverride("MRHULL",FaceObject(Player1)) ActionOverride("MRFULLER",FaceObject(Player1)) StartDialog("Player1","MRREEVOR") EndCutSceneMode()~ EXIT
END
END

CHAIN IF WEIGHT #0 ~Global("IRTGor3a2d1","GLOBAL",1)~ THEN Player1 Gor3a2d1
	@51 DO ~SetGlobal("IRTGor3a2d1","GLOBAL",2)~
	== MRREEVOR IF ~Gender(Player1,MALE)~ THEN @52
	== MRREEVOR IF ~Gender(Player1,FEMALE)~ THEN @53
	== IMOEN25J @54
DO ~SetGlobal("IRTGorEvent","GLOBAL",3) StartCutSceneMode() MoveToObject(Player1) StartCutScene("MRGor3b")~ EXIT

APPEND Player1
IF ~~ THEN Gor3a2e
	SAY @55
	IF ~~ THEN DO ~SetGlobal("IRTGorEvent","GLOBAL",2) StartCutSceneMode() StartCutScene("MRGor1c")~ EXIT
END
END


// Main thing

APPEND MRKHALID // Khalid interjects after Gorion's first sentence.
IF ~~ THEN GorM0
	SAY @56
	IF ~~ THEN DO ~SetGlobal("IRTGorEvent","GLOBAL",5)~EXTERN IMOEN25J GorM0a
END // Depending on how did the player and how long the player took to approach, Imoen will say different things
END

APPEND IMOEN25J
IF ~~ THEN GorM0a // The player got there quickly and Imoen only said "I saw you die... I saw you dead..."
	SAY @57
	++ @58 EXTERN HGWRA01 GorM0a5
	++ @59 EXTERN MRKHALID GorM0a4
	++ @60 EXTERN HGWRA01 GorM0a6
	++ @61 EXTERN MRKHALID GorM0a7
	++ @62 EXTERN HGWRA01 GorM0a3
	+ ~CheckStatGT(Player1,15,WIS)~ + @63 EXTERN HGWRA01 GorM0a2
	++ @64 EXTERN HGWRA01 GorM0a1
END
END // Below are the different states that spring from Imoen's first possible response. They all lead to common responses which are gathered inside the APPEND_EARLY state


APPEND HGWRA01
IF ~~ THEN GorM0a1
	SAY @65 // TODO: This line is provided inside ImRomToB/Sounds/ . Just gotta make it .wav and throw it in override
	COPY_TRANS HGWRA01 GorM0aComm
END
END

CHAIN HGWRA01 GorM0a2
	@66
	== MRKHALID @67
END HGWRA01 GorM0a1

APPEND HGWRA01
IF ~~ THEN GorM0a3
	SAY @68
	COPY_TRANS HGWRA01 GorM0aComm
END
END

APPEND MRKHALID
IF ~~ THEN GorM0a4
	SAY @69
	IF ~~ THEN EXTERN HGWRA01 GorM0a44
END
END

APPEND HGWRA01
IF ~~ THEN GorM0a44
	SAY @70
	COPY_TRANS HGWRA01 GorM0aComm
END

IF ~~ THEN GorM0a5
	SAY @71
	COPY_TRANS HGWRA01 GorM0aComm
END

IF ~~ THEN GorM0a6
	SAY @72
	= @73
	COPY_TRANS HGWRA01 GorM0aComm
END
END

APPEND MRKHALID
IF ~~ THEN GorM0a7
	SAY @74
	IF ~~ THEN EXTERN HGWRA01 GorM0a44
END
END


APPEND_EARLY HGWRA01
IF ~~ THEN GorM0aComm
	SAY @75
	++ @76 GOTO GorM1cc
	+ ~CheckStatGT(Player1,14,WIS)~ + @77 EXTERN MRKHALID GorM1d
	++ @78 + GorM1cc
	++ @79 EXTERN MRKHALID GorM1c
	++ @80 EXTERN MRKHALID GorM1b
	++ @81 GOTO GorM1a
END
END

APPEND_EARLY IMOEN25J
IF ~~ GorWraithFirst
   SAY @82
   ++ @58 EXTERN HGWRA01 GorM0a5
   ++ @83 EXTERN MRKHALID GorM0a4
   ++ @60 EXTERN HGWRA01 GorM0a6
   ++ @61 EXTERN MRKHALID GorM0a7
   ++ @62 EXTERN HGWRA01 GorM0a3
   + ~CheckStatGT(Player1,15,WIS)~ + @63 EXTERN HGWRA01 GorM0a2
   ++ @64 EXTERN HGWRA01 GorM0a1
END
END

APPEND HGWRA01
IF ~~ THEN GorM1a
	SAY @84
	IF ~~ THEN DO ~SetGlobal("WraithPunish","GLOBAL",1) StartCutSceneMode() StartCutScene("MRGorEx1")~ EXIT
END
END

CHAIN MRKHALID GorM1b
	@85
END HGWRA01 GorM1bb

APPEND HGWRA01
IF ~~ THEN GorM1bb
	SAY @86
	++ @87 GOTO GorM1bb6
	++ @88 + GorM1bb5
	++ @89 GOTO GorM1bb4
	++ @90 GOTO GorM1bb3
	++ @91 + GorM1bb2
	IF ~CheckStatGT(Player1,13,WIS)~ THEN REPLY @92 GOTO GorM1bb1
END

IF ~~ THEN GorM1bb1
	SAY @93
	IF ~~ THEN DO ~SetGlobal("WraithPunish","GLOBAL",1) StartCutSceneMode() StartCutScene("MRGorEx1")~ EXIT
END

IF ~~ THEN GorM1bb2
	SAY @94
	IF ~~ THEN DO ~SetGlobal("WraithPunish","GLOBAL",1) StartCutSceneMode() StartCutScene("MRGorEx1")~ EXIT
END

IF ~~ THEN GorM1bb3
	SAY @84
	IF ~~ THEN DO ~SetGlobal("WraithPunish","GLOBAL",1) StartCutSceneMode() StartCutScene("MRGorEx1")~ EXIT
END

IF ~~ THEN GorM1bb4
	SAY @95
	IF ~~ THEN DO ~SetGlobal("WraithPunish","GLOBAL",1) StartCutSceneMode() StartCutScene("MRGorEx1")~ EXIT
END

IF ~~ THEN GorM1bb5
	SAY @96
	= @97
	IF ~~ THEN DO ~SetGlobal("WraithPunish","GLOBAL",1) StartCutSceneMode() StartCutScene("MRGorEx1")~ EXIT
END

IF ~~ THEN GorM1bb6
	SAY @98
	IF ~~ THEN DO ~SetGlobal("WraithPunish","GLOBAL",1) StartCutSceneMode() StartCutScene("MRGorEx1")~ EXIT
END
END

CHAIN MRKHALID GorM1c
	@99
END HGWRA01 GorM1cc

APPEND HGWRA01
IF ~~ THEN GorM1cc
	SAY @100
	= @101
	++ @102 GOTO GorM1bb6
	++ @103 GOTO GorM1bb4
	++ @104 + GorM1cc1
	++ @90 GOTO GorM1bb3
	++ @91 + GorM1bb2
	IF ~CheckStatGT(Player1,13,WIS)~ THEN REPLY @105 GOTO GorM1bb1
END

IF ~~ THEN GorM1cc1
	SAY @106
	= @107
	IF ~~ THEN DO ~SetGlobal("WraithPunish","GLOBAL",1) StartCutSceneMode() StartCutScene("MRGorEx1")~ EXIT
END
END

CHAIN MRKHALID GorM1d
	@108
END HGWRA01 GorM1bb

CHAIN IF WEIGHT #-1 ~Global("ImoenRomanceActive","GLOBAL",2) InParty("Imoen2") Global("WraithPunish","GLOBAL",1)~ THEN HGWRA01 GorM2
	@109
	= @110
	== HGWRA01 IF ~InParty("Sarevok")~ THEN @111
	== SAREV25J IF ~InParty("Sarevok")~ THEN @112
	== MRKHALID IF ~InParty("Sarevok")~ THEN @113
	== HGWRA01 @114
	== IMOEN25J @115
	== HGWRA01 @116
	= @117
END HGWRA01 GorM2Next

APPEND HGWRA01
IF ~~ THEN GorM2Next
	SAY @118
	IF ~~ THEN DO ~SetGlobal("WraithPunish","GLOBAL",2) StartCutSceneMode() StartCutScene("MRGorEx2")~ EXIT
END
END

// Imoen guilt trip

CHAIN IF WEIGHT #-1 ~Global("ImoenRomanceActive","GLOBAL",2) InParty("Imoen2") Global("WraithPunish","GLOBAL",2)~ THEN HGWRA01 GorM3
	@119
	== MRKHALID IF ~InParty("Jaheira")~ THEN @120
	== JAHEI25J IF ~InParty("Jaheira")~ THEN @121
	== MRKHALID IF ~InParty("Jaheira")~ THEN @122
	== MRKHALID IF ~!InParty("Jaheira")~ THEN @123
	== IMOEN25J IF ~!InParty("Jaheira")~ THEN @124
	== MRKHALID IF ~!InParty("Jaheira")~ THEN @125
	== IMOEN25J @126
	== MRPHLYDI @127
	== IMOEN25J @128
	= @129
	= @130
	== MRDREPPI @131
	== MRHULL @132
	== MRFULLER @133
	== IMOEN25J @134
	== MROBE @135
	== MRJONDAL @136
	== IMOEN25J @137
	== HGWRA01 @138
	== MRREEVOR @139
	== IMOEN25J @140
	== HGWRA01 @141
	= @142
DO ~SetGlobal("IRTGorionWinthrop","GLOBAL",1) SetGlobal("LovedOne","GLOBAL",10) ClearAllActions() StartCutSceneMode() StartCutScene("MRGorWin")~ EXIT

CHAIN IF WEIGHT #0 ~Global("IRTGorionWinthrop","GLOBAL",1)~ THEN MRWINTHR GorWin
	@143
	== IMOEN25J @144
	== MRWINTHR @145
	== IMOEN25J @146
	== MRWINTHR @147
	== IMOEN25J @148
	== MRWINTHR @149
	= @150
	== IMOEN25J @151
	== MRWINTHR @152
// If the player is male
	== MRWINTHR IF ~Gender(Player1,MALE)~ THEN @153
	== IMOEN25J IF ~Gender(Player1,MALE)~ THEN @154
	== MRWINTHR IF ~Gender(Player1,MALE)~ THEN @155
	== IMOEN25J IF ~Gender(Player1,MALE)~ THEN @156
	== MRWINTHR IF ~Gender(Player1,MALE)~ THEN @157
	== IMOEN25J IF ~Gender(Player1,MALE)~ THEN @158
	== MRWINTHR IF ~Gender(Player1,MALE)~ THEN @159
	== IMOEN25J IF ~Gender(Player1,MALE)~ THEN @160
	== HGWRA01 IF ~Gender(Player1,MALE)~ THEN @161
	== MRWINTHR IF ~Gender(Player1,MALE)~ THEN @162
	== IMOEN25J IF ~Gender(Player1,MALE)~ THEN @163
// If the player is female
	== MRWINTHR IF ~Gender(Player1,FEMALE)~ THEN @164
	== IMOEN25J IF ~Gender(Player1,FEMALE)~ THEN @165
	== MRWINTHR IF ~Gender(Player1,FEMALE)~ THEN @166
	== MRWINTHR IF ~Gender(Player1,FEMALE)~ THEN @167
	== HGWRA01 IF ~Gender(Player1,FEMALE)~ THEN @168
	== MRWINTHR IF ~Gender(Player1,FEMALE)~ THEN @169
	== IMOEN25J IF ~Gender(Player1,FEMALE)~ THEN @170
END IMOEN25J GorWin1

APPEND IMOEN25J
IF ~~ THEN GorWin1
	SAY @171
	++ @172 DO ~SetGlobal("IRTPostWraithAttitude","GLOBAL",3)~ + GorWin1i
	++ @173 DO ~SetGlobal("IRTPostWraithAttitude","GLOBAL",2)~ + GorWin1h
	+ ~CheckStatGT(Player1,14,WIS)~ + @174 DO ~SetGlobal("IRTPostWraithAttitude","GLOBAL",2)~ EXTERN MRWINTHR GorWin1g
	++ @175 DO ~SetGlobal("IRTPostWraithAttitude","GLOBAL",3)~ + GorWin1f
	++ @176 DO ~SetGlobal("IRTPostWraithAttitude","GLOBAL",1)~ EXTERN HGWRA01 GorWin1d
	++ @177 DO ~SetGlobal("IRTPostWraithAttitude","GLOBAL",2)~ + GorWin1c
	++ @178 DO ~SetGlobal("IRTPostWraithAttitude","GLOBAL",1)~ EXTERN HGWRA01 GorWin1b
	++ @179 EXTERN MRWINTHR GorWin1a
END
END

CHAIN MRWINTHR GorWin1a
	@180
END MRKHALID GorWinThirdPunish

CHAIN HGWRA01 GorWin1b
	@181
END MRKHALID GorWinThirdPunish

CHAIN IMOEN25J GorWin1c
	@182
	= @183
	= @184
	== HGWRA01 @185
END MRKHALID GorWinThirdPunish

CHAIN MRKHALID GorWinThirdPunish
	@186
	== HGWRA01 @187
	= @188
DO ~SetGlobal("WraithPunish","GLOBAL",3) StartCutSceneMode() StartCutScene("MRGorEx3")~ EXIT


CHAIN HGWRA01 GorWin1d
	@189
DO ~SetGlobal("WraithPunish","GLOBAL",3) StartCutSceneMode() StartCutScene("MRGorEx3")~ EXIT

CHAIN IMOEN25J GorWin1f
	@190
	== MRWINTHR @191
	== MRKHALID @192
	== HGWRA01 @193
	= @194
DO ~SetGlobal("WraithPunish","GLOBAL",3) StartCutSceneMode() StartCutScene("MRGorEx3")~ EXIT

CHAIN MRWINTHR GorWin1g
	@195
	== MRKHALID @196
	== HGWRA01 @187
	= @188
DO ~SetGlobal("WraithPunish","GLOBAL",3) StartCutSceneMode() StartCutScene("MRGorEx3")~ EXIT

CHAIN IMOEN25J GorWin1h
	@197
	= @198
	== HGWRA01 @185
END MRKHALID GorWinThirdPunish

CHAIN IMOEN25J GorWin1i
	@190
	== MRWINTHR @191
	== HGWRA01 @199
	== MRKHALID @186
	== HGWRA01 @193
	= @194
DO ~SetGlobal("WraithPunish","GLOBAL",3) StartCutSceneMode() StartCutScene("MRGorEx3")~ EXIT

APPEND HGWRA01
IF WEIGHT #0 ~Global("ImoenRomanceActive","GLOBAL",2) InParty("Imoen2") Global("WraithPunish","GLOBAL",3)~ THEN GorM4
 SAY @200
 ++ @201 + GorM4a
 ++ @202 EXTERN IMOEN25J GorM4c
 ++ @203 + GorM4a
 IF ~CheckStatLT(Player1,14,WIS)~ THEN REPLY @204 + GorM4a
 IF ~CheckStatGT(Player1,13,WIS)~ THEN REPLY @205 + GorM4b
 ++ @206 + GorM4a
END

IF ~~ THEN BEGIN GorM4a
 SAY @207
 IF ~~ THEN DO ~AddXP2DA("Plot11C") StartCutSceneMode() StartCutScene("MRGorEx4")~ EXIT
END

IF ~~ THEN BEGIN GorM4b
 SAY @208
 IF ~~ THEN DO ~AddXP2DA("Plot11C") StartCutSceneMode() StartCutScene("MRGorEx4")~ EXIT
END
END

CHAIN IMOEN25J GorM4c
@209
== HGWRA01 @210
= @211
DO ~ActionOverride(Player2,Attack("HGWRA01")) ActionOverride(Player3,Attack("HGWRA01")) ActionOverride(Player4,Attack("HGWRA01")) ActionOverride(Player5,Attack("HGWRA01")) ActionOverride(Player6,Attack("HGWRA01")) Kill(Player1)~ EXIT





// ~~ Post-event talk ~~


APPEND IMOEN25J
IF WEIGHT #0 ~Global("IRTPostGorEvent","GLOBAL",1)~ THEN PGor
	SAY @212
	IF ~Gender(Player1,MALE) Global("IRTPostWraithAttitude","GLOBAL",1)~ THEN DO ~SetGlobal("IRTPostGorEvent","GLOBAL",2)~ GOTO PGor1
	IF ~Gender(Player1,MALE) Global("IRTPostWraithAttitude","GLOBAL",2)~ THEN DO ~SetGlobal("IRTPostGorEvent","GLOBAL",2)~ GOTO PGor2
	IF ~Gender(Player1,MALE) Global("IRTPostWraithAttitude","GLOBAL",3)~ THEN DO ~SetGlobal("IRTPostGorEvent","GLOBAL",2)~ GOTO PGor3
	IF ~Gender(Player1,FEMALE) Global("IRTPostWraithAttitude","GLOBAL",1)~ THEN DO ~SetGlobal("IRTPostGorEvent","GLOBAL",2)~ GOTO PGor4
	IF ~Gender(Player1,FEMALE) Global("IRTPostWraithAttitude","GLOBAL",2)~ THEN DO ~SetGlobal("IRTPostGorEvent","GLOBAL",2)~ GOTO PGor5
	IF ~Gender(Player1,FEMALE) Global("IRTPostWraithAttitude","GLOBAL",3)~ THEN DO ~SetGlobal("IRTPostGorEvent","GLOBAL",2)~ GOTO PGor6
END

/* ~ Male character, unsaid feelings ~ */


IF ~~ THEN PGor1
	SAY @213
	= @214
	= @215
	++ @216 + PGor1g
	++ @217 + PGor1f
	++ @218 + PGor1e
	++ @219 + PGor1c
	++ @220 + PGor1b
	++ @221 + PGor1a
END
END

APPEND_EARLY IMOEN25J
IF ~~ THEN PGor1a
	SAY @222
	++ @223 + PGor1a7
	++ @224 + PGor1a6
	++ @225 + PGor1a5
	++ @226 + PGor1a4
	++ @227 + PGor1a3
	++ @228 + PGor1a2
END
END

APPEND IMOEN25J
IF ~~ THEN PGor1a1
	SAY @229
	= @230
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5)~ EXIT  // See global description at the end of the document
END
END

// Little thing: Imoen will leave at a change of areas. Appending the Fate Spirit so you can search for her; you won't get her, though.

EXTEND_TOP Fatesp 7
	IF ~Global("IRTImoenLeavesAtAreaChange","GLOBAL",2) !Global("IRTImoenLeftFate","LOCALS",1)~ THEN REPLY @231 DO ~SetGlobal("IRTImoenLeftFate","LOCALS",1)~ GOTO 7Im
END

CHAIN Fatesp 7Im
	@232
END Fatesp 7
/**********************************************************/

APPEND IMOEN25J
IF ~~ THEN PGor1a2
	SAY @233
	= @234
	IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ EXIT
END

IF ~~ THEN PGor1a3
	SAY @235
	= @236
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5)~ EXIT
END

IF ~~ THEN PGor1a4
	SAY @237
	++ @238 + PGor1a4d
	++ @239 + PGor1a4c
	++ @240 + PGor1a4b
	++ @241 + PGor1a4a
END

IF ~~ THEN PGor1a4a
	SAY @242
	++ @243 + PGor1a4a4
	++ @244 + PGor1a4a3
	++ @245 + PGor1a4a2
	++ @246 + PGor1a4a1
END

IF ~~ THEN PGor1a4a1
	SAY @247
	IF ~~ THEN GOTO PGor1a4aEnd
END

IF ~~ THEN PGor1a4a2
	SAY @248
	IF ~~ THEN GOTO PGor1a4aEnd
END

IF ~~ THEN PGor1a4a3
	SAY @249
	IF ~~ THEN GOTO PGor1a4aEnd
END

IF ~~ THEN PGor1a4a4
	SAY @250
	IF ~~ THEN GOTO PGor1a4aEnd
END

IF ~~ THEN PGor1a4aEnd
	SAY @251
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1a4b
	SAY @252
	= @253
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1a4c
	SAY @254
	= @255
	= @256
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1a4d
	SAY @257
	= @258
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1a5
	SAY @259
	= @260
	= @261
	++ @262 + PGor1a3
	++ @263 + PGor1a5b
	++ @264 + PGor1a5a
	++ @227 + PGor1a3
	++ @265 + PGor1a1
END

IF ~~ THEN PGor1a5a
	SAY @266
	= @267
	= @230
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5)~ EXIT
END

IF ~~ THEN PGor1a5b
	SAY @268
	= @230
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5)~ EXIT
END

IF ~~ THEN PGor1a6
	SAY @269
	= @270
	= @271
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1a7
	SAY @272
	= @273
	= @274
	= @275
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PGor1b
	SAY @276
	= @277
	++ @278 + PGor1b6
	+ ~CheckStatGT(Player1,12,INT)~ + @279 + PGor1b5
	+ ~!CheckStatGT(Player1,12,INT)~ + @280 + PGor1b5
	++ @281 + PGor1b4
	++ @282 + PGor1b3
	++ @283 + PGor1b2
END

IF ~~ THEN PGor1b2
	SAY @284
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1b3
	SAY @285
	IF ~~ THEN GOTO PGor1b3END
END

IF ~~ PGor1b3END
	SAY @286
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1b4
	SAY @287
	IF ~~ THEN GOTO PGor1b3END
END

IF ~~ THEN PGor1b5
	SAY @288
	= @289
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1b6
	SAY @290
	IF ~~ THEN GOTO PGor1b3END
END

IF ~~ THEN PGor1c
	SAY @291
	= @292
	++ @293 + PGor1c4
	++ @294 + PGor1c3
	++ @295 + PGor1c2
	++ @296 + PGor1c1
END
END

CHAIN IMOEN25J PGor1c1
	@297
	== IMOEN25J IF ~Gender(Player1,MALE)~ THEN @298
	== IMOEN25J IF ~Gender(Player1,FEMALE)~ THEN @299
	== IMOEN25J @300
	= @301
DO ~RunAwayFrom(Player1,25)~ EXIT

CHAIN IMOEN25J PGor1c2
	@302
	== IMOEN25J IF ~Gender(Player1,MALE)~ THEN @303
	== IMOEN25J IF ~Gender(Player1,FEMALE)~ THEN @304
END IMOEN25J PGor1c2Next

APPEND_EARLY IMOEN25J 
IF ~~ THEN PGor1c2Next
	SAY @305
	++ @306 + PGor1c2a
	++ @307 + PGor1c2a
	++ @265 + PGor1a1
	++ @308 + PGor1c2a
	++ @309 + PGor1c1
END
END

APPEND IMOEN25J
IF ~~ THEN PGor1c2a
	SAY @310
	= @311
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5)~ EXIT
END
END

CHAIN IMOEN25J PGor1c3
	@312
	== IMOEN25J IF ~Gender(Player1,MALE)~ THEN @313
	== IMOEN25J IF ~Gender(Player1,FEMALE)~ THEN @314
END IMOEN25J PGor1c3Next

APPEND IMOEN25J
IF ~~ THEN PGor1c3Next
	SAY @315
COPY_TRANS IMOEN25J PGor1c2Next
END

IF ~~ THEN PGor1c4
	SAY @316
	= @317
	= @318
	++ @319 + PGor1c4e
	++ @320 + PGor1c4d
	++ @321 + PGor1c4c
	++ @322 + PGor1c4b
	++ @323 + PGor1c4a
END

IF ~~ THEN PGor1c4a
	SAY @324
	= @325
	= @326
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5)~ EXIT
END

IF ~~ THEN PGor1c4b
	SAY @327
	= @328
COPY_TRANS IMOEN25J PGor1c2Next
END

IF ~~ THEN PGor1c4c
 SAY @329
 ++ @330 + PGor1c4d
 ++ @331 + PGor1c4e
 ++ @332 + PGor1c4c1
 ++ @333 + PGor1c4b
END

IF ~~ THEN PGor1c4c1
	SAY @334
	= @328
COPY_TRANS IMOEN25J PGor1c2Next
END

IF ~~ THEN PGor1c4d
	SAY @335
	IF ~~ THEN GOTO PGorGesture
END

IF ~~ PGorGesture
	SAY @336
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1c4e
	SAY @337
	IF ~~ THEN GOTO PGorGesture
END

IF ~~ THEN PGor1d
	SAY @338
	IF ~~ THEN GOTO PGorGesture
END

IF ~~ THEN PGor1e
	SAY @339
	++ @238 + PGor1a4d
	++ @239 + PGor1a4c
	+ ~ReputationGT(Player1,13)~ + @340 + PGor1e3
	+ ~!ReputationGT(Player1,13) ReputationGT(Player1,7)~ + @340 + PGor1e2
	+ ~!ReputationGT(Player1,7)~ + @340 + PGor1e1
	++ @240 + PGor1a4b
	++ @241 + PGor1a4a
END

IF ~~ THEN PGor1e1
	SAY @341
	IF ~~ THEN GOTO PGor1eGesture
END
 
IF ~~ PGor1eGesture
	SAY @342
 IF ~~ THEN EXIT
END

IF ~~ THEN PGor1e2
	SAY @343
	IF ~~ THEN GOTO PGor1eGesture
END

IF ~~ THEN PGor1e3
	SAY @344
	IF ~~ THEN GOTO PGor1eGesture
END
END

APPEND_EARLY IMOEN25J
IF ~~ THEN PGor1f
	SAY @345
	= @346
	++ @347 + PGor1f4
	++ @348 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",3)~ + PGor1f3
	++ @349 + PGor1e
	++ @350 + PGor1f2
	++ @351 + PGor1f1
	++ @352 + PGor1d
END
END

APPEND IMOEN25J
IF ~~ PGor1f1
	SAY @353
	= @354
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1f2
	SAY @355
	= @356
	IF ~~ THEN DO ~SetGlobal("IRTCooldownDue","GLOBAL",1) IncrementGlobal("IRTCooldownCounter","GLOBAL",1) RunAwayFrom(Player1,40)~ EXIT
END

IF ~~ THEN PGor1f3
	SAY @357
	= @358
	= @359
	IF ~Gender(Player1,MALE)~ THEN GOTO PGor1f3Next
	IF ~Gender(Player1,FEMALE)~ THEN GOTO PGor4f3
END

IF ~~ THEN PGor1f3Next
	SAY @360
	= @361
	++ @362 + PGor1f3e
	++ @363 + PGor1f3a
	++ @364 + PGor1f3d
	++ @365 + PGor1f3c
	++ @366 + PGor1f3b
	++ @367 + PGor1f3a
END

IF ~~ THEN PGor1f3a
	SAY @368
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1f3b
	SAY @369
	= @370
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1f3c
	SAY @371
	= @372
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1f3d
	SAY @373
	= @370
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor1f3e
	SAY @374
	= @375
	IF ~~ THEN EXIT
END
END

CHAIN IMOEN25J PGor1f4
	@376
	== IMOEN25J IF ~Gender(Player1,MALE)~ THEN @377
	== IMOEN25J IF ~Gender(Player1,FEMALE)~ THEN @378
END IMOEN25J PGor1f4Next

APPEND IMOEN25J
IF ~~ THEN PGor1f4Next
	SAY @379
	++ @380 + PGor1a7
	++ @224 + PGor1a6
	++ @225 + PGor1a5
	++ @381 + PGor1c1
	++ @226 + PGor1a4
	++ @227 + PGor1a3
	++ @382 + PGor1a2
END

IF ~~ THEN PGor1g
	SAY @383
	= @346

	++ @347 + PGor1f4
	++ @348 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",3)~ + PGor1f3
	++ @349 + PGor1e
	++ @350 + PGor1f2
	++ @352 + PGor1d
END

/* ~ Male character, supportive player ~ */

IF ~~ THEN PGor2
	SAY @384
	= @385
	++ @386 + PGor2g
	++ @387 + PGor2f
	++ @388 + PGor1e
	++ @389 + PGor1c
	++ @220 + PGor1b
	++ @390 + PGor2a
END

IF ~~ THEN PGor2a
	SAY @391
	COPY_TRANS IMOEN25J PGor1a
END

IF ~~ THEN PGor2f
	SAY @392
	= @393
	COPY_TRANS IMOEN25J PGor1f
END

IF ~~ THEN PGor2g
	SAY @394
	= @393
	COPY_TRANS IMOEN25J PGor1f
END

/* ~ Male character, repentant player ~ */

IF ~~ THEN PGor3
	SAY @384
	= @395
	= @396
	++ @397 + PGor3e
	++ @398 + PGor3f
	++ @399 + PGor1c
	++ @221 + PGor3a
END

IF ~~ THEN PGor3a
	SAY @400
	= @401
	COPY_TRANS IMOEN25J PGor1a
END 

IF ~~ THEN PGor3a4
	SAY @402
	++ @238 + PGor1a4d
	++ @239 + PGor1a4c
	++ @240 + PGor1a4b
	++ @241 + PGor1a4a
END

IF ~~ THEN PGor3f
	SAY @403
	= @393
	COPY_TRANS IMOEN25J PGor1f
END

IF ~~ THEN PGor3e
	SAY @404
	++ @238 + PGor1a4d
	++ @239 + PGor1a4c
	+ ~ReputationGT(Player1,13)~ + @340 + PGor1e3
	+ ~!ReputationGT(Player1,13) ReputationGT(Player1,7)~ + @340 + PGor1e2
	+ ~!ReputationGT(Player1,7)~ + @340 + PGor1e1
	++ @240 + PGor1a4b
	++ @241 + PGor1a4a
END

/* ~ Female character, unsaid feelings ~ */

IF ~~ THEN PGor4
	SAY @405
	= @406
	= @407
	++ @408 + PGor4c
	++ @409 + PGor4i
	++ @410 + PGor1e
	++ @411 + PGor1f
	++ @221 + PGor1a
	++ @220 + PGor4b
END

IF ~~ THEN PGor4b
	SAY @276
	= @277
	++ @278 + PGor4b6
	+ ~CheckStatGT(Player1,12,INT)~ + @279 + PGor4b5
	+ ~!CheckStatGT(Player1,12,INT)~ + @280 + PGor4b5
	++ @412 + PGor4b7
	++ @281 + PGor4b4
	++ @282 + PGor4b3
	++ @283 + PGor4b2
END

IF ~~ THEN PGor4b2
	SAY @413
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor4b3
	SAY @414
	= @415
	IF ~~ THEN GOTO PGor4Dream
END

IF ~~ PGor4Dream
	SAY @416
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor4b4
	SAY @287
	= @417
	IF ~~ THEN GOTO PGor4Dream
END

IF ~~ THEN PGor4b5
	SAY @418
	= @289
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor4b6
	SAY @419
	= @415
	IF ~~ THEN GOTO PGor4Dream
END

IF ~~ THEN PGor4b7
	SAY @420
	= @415
	IF ~~ THEN GOTO PGor4Dream
END

IF ~~ THEN PGor4f3
	SAY @421
	++ @362 + PGor1f3e
	++ @363 + PGor1f3a
	++ @422 + PGor4f3d
	++ @423 + PGor1f3c
	++ @424 + PGor1f3b
	++ @367 + PGor1f3a
END

IF ~~ THEN PGor4f3d
	SAY @425
	= @426
	= @427
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor4i
	SAY @428
	= @429
	++ @430 + PGor4i7
	++ @431 + PGor4i6
	++ @432 + PGor4i5 
	++ @433 + PGor4i1
	++ @434 + PGor4i4
	++ @435 + PGor4i3
	++ @436 + PGor4i2
END

IF ~~ THEN PGor4i1
	SAY @437
	++ @438 + PGor4i1f
	++ @439 + PGor4i1e
	++ @440 + PGor4i1d
	++ @441 + PGor4i1c
	++ @442 + PGor4i1a
END

IF ~~ THEN PGor4i1a
	SAY @443
	++ @444 + PGor4i1f
	++ @445 + PGor4i1d
	++ @446 + PGor4i1a3
	++ @447 + PGor4i1a1
END

IF ~~ THEN PGor4i1a1
	SAY @448
	= @449
	IF ~~ THEN DO ~SetGlobal("IRTQuarrelDue","GLOBAL",1) IncrementGlobal("IRTQuarrelCounter","GLOBAL",1)~ EXIT
END

IF ~~ THEN PGor4i1a3
	SAY @450
	= @451
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor4i1c
	SAY @452
	= @453
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor4i1d
	SAY @454
	= @455
	++ @456 + PGor4i1d3
	++ @457 + PGor4i1d2
	++ @458 + PGor4i1d4
	++ @459 + PGor1c1
END

IF ~~ THEN PGor4i1d2
	SAY @460
	++ @461 + PGor4i1d2a
	++ @462 + PGor4i1d2d
	++ @463 + PGor4i1d2c
	++ @464 + PGor4i1d2b
	++ @465 + PGor4i1d2a
END

IF ~~ THEN PGor4i1d2a
	SAY @466
	= @467
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PGor4i1d2b
	SAY @468
	IF ~~ THEN GOTO PGorBreakFool
END

IF ~~ THEN PGor4i1d2c
	SAY @469
	= @470
	IF ~~ THEN GOTO PGorBreakFool
END

IF ~~ THEN PGorBreakFool
	SAY @471
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PGor4i1d2d
	SAY @472
	IF ~~ THEN GOTO PGorBreakFool
END 

IF ~~ THEN PGor4i1d3
	SAY @473
	IF ~~ THEN GOTO PGor5iLIES
END

IF ~~ THEN PGor5iLIES
	SAY @474
	++ @461 + PGor4i1d2a
	++ @462 + PGor4i1d2d
	++ @463 + PGor4i1d2c
	++ @464 + PGor4i1d2b
	++ @465 + PGor4i1d2a
END

IF ~~ THEN PGor4i1d4
	SAY @475
	= @476
	= @477
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PGor4i1e
	SAY @478
	++ @479 + PGor4i1e3
	++ @456 + PGor4i1d3
	++ @480 + PGor4i1d2
	++ @481 + PGor4i1e1
	++ @482 + PGor1c1
END

IF ~~ THEN PGor4i1e1
	SAY @483
	= @484
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PGor4i1e3
	SAY @485
	= @486
	= @487
	= @488
	= @489
	IF ~~ THEN DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",2)~ EXIT
END

IF ~~ THEN PGor4i1f
	SAY @490
	= @491
	++ @492 + PGor4i1f5
	++ @493 + PGor1c1
	++ @494 + PGor4i1e
	++ @495 + PGor4i1d2
	++ @496 + PGor4i1f1
END

IF ~~ THEN PGor4i1f1
	SAY @497
	= @230
	IF ~~ THEN DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5)~ EXIT
END

IF ~~ THEN PGor4i1f5
	SAY @498
	++ @499 + PGorBDSM
	++ @500 + PGor1a5
	++ @501 + PGor1c1 
END

IF ~~ THEN PGorBDSM
	SAY @502
	= @503
	= @504
	= @505
	= @506
	++ @507 + PGorBDSM1
	++ @508 + PGorBDSM2
	++ @509 + PGorBDSM3
END

IF ~~ PGorBDSM1
	SAY @510
	= @511
	= @512
	IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",10) IncrementGlobal("IRTCorruptImoen","GLOBAL",3)~ EXIT
END

IF ~~ PGorBDSM2
	SAY @513
	IF ~~ THEN GOTO PGorBDSM1
END

IF ~~ PGorBDSM3
	SAY @514
	= @515
	= @516
	= @517
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor4i2
	SAY @518
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor4i3
	SAY @519
	IF ~~ THEN GOTO PGor4i3E
END

IF ~~ THEN PGor4i3E
	SAY @520
	++ @278 + PGor4b6
	+ ~CheckStatGT(Player1,12,INT)~ + @279 + PGor4b5
	+ ~!CheckStatGT(Player1,12,INT)~ + @280 + PGor4b5
	++ @521 + PGor4b7
	++ @281 + PGor4b4
	++ @282 + PGor4b3
	++ @283 + PGor4b2
END

IF ~~ THEN PGor4i4
	SAY @522
	= @523
	= @524
	++ @525 + PGor4i4d
	++ @526 + PGor4i4f
	++ @527 + PGor4i4e
	++ @528 + PGor4i4d
	++ @529 + PGor4i4c
	++ @530 + PGor4i4a
END

IF ~~ THEN PGor4i4a
	SAY @531
	IF ~~ THEN GOTO PGor4i3E
END

IF ~~ THEN PGor4i4c
	SAY @532
	IF ~~ THEN GOTO PGor4i3E
END

IF ~~ THEN PGor4i4d
	SAY @533
	= @534
	IF ~~ THEN GOTO PGor4i3E
END

IF ~~ THEN PGor4i4e
	SAY @535
	IF ~~ THEN GOTO PGor4i3E
END

IF ~~ THEN PGor4i4f
	SAY @536
	IF ~~ THEN GOTO PGor4i3E
END

IF ~~ THEN PGor4i5
	SAY @537
	= @538
	++ @539 + PGor4i7
	++ @540 + PGor4i5a
	++ @541 + PGor4i5a
	++ @542 + PGor4i4
	++ @543 + PGor4i3
	++ @544 + PGor4i2

END

IF ~~ THEN PGor4i5a
	SAY @545
	= @546
	++ @547 + PGor4i5a3b
	++ @548 + PGor4i5a5
	++ @549 + PGor4i5a4
	++ @550 + PGor4i5a3
	++ @551 + PGor4i5a1
END

IF ~~ THEN PGor4i5a1
	SAY @552
	= @553
	IF ~~ THEN DO ~SetGlobal("IRTCooldownDue","GLOBAL",1) IncrementGlobal("IRTCooldownCounter","GLOBAL",1)~ EXIT
END

IF ~~ THEN PGor4i5a3
	SAY @554
	= @555
	= @556
	++ @557 + PGor4i5a3d
	++ @558 + PGor4i5a3b
	++ @559 + PGor4i5a3a
END

IF ~~ THEN PGor4i5a3a
	SAY @560
	IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PGor4i5a3b
	SAY @561
	IF ~~ THEN DO ~SetGlobal("IRTCooldownDue","GLOBAL",1) IncrementGlobal("IRTCooldownCounter","GLOBAL",1)~ EXIT
END

IF ~~ THEN PGor4i5a3d
	SAY @562
	IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PGor4i5a4
	SAY @563
	IF ~~ THEN DO ~RunAwayFrom(Player1,25)~ EXIT
END

IF ~~ THEN PGor4i5a5
	SAY @564
	= @565
	IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PGor4i6
	SAY @566
	= @567
	++ @430 + PGor4i7
	++ @568 + PGor4i5
	++ @569 + PGor4i3
	++ @570 + PGor4i2
	++ @571 + PGor4i1
END

IF ~~ THEN PGor4i7
	SAY @572
	= @573
	= @574
	IF ~~ THEN EXIT
END

IF ~~ THEN PGor4c
	SAY @575
	= @292
	++ @576 + PGor4c4
	++ @577 + PGor1c3
	++ @295 + PGor1c2
	++ @296 + PGor1c1
END


IF ~~ THEN PGor4c4
	SAY @578
	= @579
	= @580
	COPY_TRANS IMOEN25J PGor1c2Next
END

/* ~ Female character, supportive player ~ */

IF ~~ THEN PGor5
	SAY @581
	= @582
	= @583
	++ @584 + PGor4c
	++ @585 + PGor4i
	++ @586 + PGor1e
	++ @587 + PGor1f
	++ @221 + PGor1a
	++ @220 + PGor4b
END

/* ~ Female character, repentant player ~ */

IF ~~ THEN PGor6
	SAY @581
	= @582
	= @588
	++ @589 + PGor1g
	++ @590 + PGor4i
	++ @591 + PGor3e
	++ @592 + PGor3f
	++ @593 + PGor4c
	++ @594 + PGor3a
END
END

//////////////////////////////////////////////////////////////////////////////////
/*
List of globals:
Global("IRTGorEvent","GLOBAL",1) => Imoen walks to meet everyone alone, you stand behind
Global("IRTGorEvent","GLOBAL",2) => Imoen and you walk towards the woman
Global("IRTGorEvent","GLOBAL",3) => You walk alone to meet with the person
Global("IRTGorEvent","GLOBAL",4) => The woman is ignored altogether

Global("IRTGorEventVIOLENCE","GLOBAL",1) => You decide to kill everyone in sight.

 DO ~SetGlobal("IRTPostWraithAttitude","GLOBAL",1)~ It is unsaid how does the player feel about the whole being together shebang.
 DO ~SetGlobal("IRTPostWraithAttitude","GLOBAL",2)~ The player is supportive and reassures Imoen that everything is okay.
 DO ~SetGlobal("IRTPostWraithAttitude","GLOBAL",3)~ The player leads Imoen to believe that what they do is indeed wrong.

DO ~SetGlobal("IRTImoenLeavesAtAreaChange","GLOBAL",1) SetGlobal("ImoenRomanceActive","GLOBAL",5)~  Imoen leaves as soon as the party leaves the map area. The player will find the following note in his/her inventory:

~

I can't be with you anymore.


I'm sorry for breaking my promises.~

There is already an entry inside Setup.tra, but the item needs to be created and placed

*/
//////////////////////////////////////////////////////////////////////////////////
