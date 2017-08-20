/*
Table of contents:
Quarrels
 // First
 // Second
 // Third
Cool down period
 // First
 // Second
 // Third
*/



// There are two types of angry Imoen conversations: full arguments (Quarrels), and small spats where you snapped out of the blue (Cooldowns)
// Every instance where Imoen starts talking to you in a friendly way needs to make sure that
// !Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) . Interjections to NPCs don't need to do this check.

// Quarrels:
// These happen when the outcome of a previous conversation was as follows:
// IncrementGlobal("IRTQuarrelCounter","GLOBAL",1) SetGlobal("IRTQuarrelDue","GLOBAL",1)
// They are generic arguments kept very vague on purpose so they can be reused whenever you piss her off.


// First (QuarrelCounter = 1)

APPEND IMOEN25J
IF WEIGHT #990 ~IsGabber(Player1) !AreaCheck("AR5203") Global("IRTQuarrelDue","GLOBAL",1) Global("IRTQuarrelCounter","GLOBAL",1) Global("ImoenRomanceActive","GLOBAL",2)~ THEN Q1
 SAY ~(Imoen barely looks in your direction as you approach her.)~ [ IRQUIET ]
 IF ~~ THEN DO ~SetGlobal("IRTQuarrelDue","GLOBAL",0)~ GOTO Q1N
END

IF ~~ Q1N
 SAY @1
 ++ @2 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-2)~ GOTO Quarrel1g
 ++ @3 GOTO Quarrel1f
 ++ @4 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ GOTO Quarrel1e
 ++ @5 GOTO Quarrel1d
 ++ @6 GOTO Quarrel1b
 ++ @7 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ GOTO Quarrel1a
END

IF ~~ THEN Quarrel1a
 SAY @8
 IF ~~ THEN DO ~IncrementGlobal("IRTQuarrelCounter","GLOBAL",1) SetGlobal("IRTQuarrelDue","GLOBAL",1) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Quarrel1b
 SAY @9
 = @10
 ++ @11 GOTO Quarrel1b7
 ++ @12 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-1)~ GOTO Quarrel1b6
 ++ @13 GOTO Quarrel1b5
 ++ @14 GOTO Quarrel1b4
 ++ @15 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ GOTO Quarrel1b1
END

IF ~~ THEN Quarrel1b1
 SAY @16
 = @17
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) SetGlobal("IRTImoenDumped","GLOBAL",1) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Quarrel1b4
 SAY @18
 IF ~~ THEN GOTO Quarrel1Fix
END

IF ~~ THEN Quarrel1Fix
 SAY @19
 ++ @20 + Q1Fix5
 ++ @21 + Q1Fix4
 ++ @22 + Q1Fix3
 ++ @23 + Q1Fix1
END

IF ~~ THEN Q1Fix1
 SAY @24
 ++ @25 + Q1Fix5
 ++ @26 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-1)~ GOTO Quarrel1b6
 ++ @27 + Quarrel1b1
END

IF ~~ THEN Q1Fix3
 SAY @28
 IF ~~ THEN GOTO Q1Fix3Next
END

IF ~~ THEN Q1Fix3Next
 SAY @29
 ++ @30 + Q1Fix5
 ++ @31 + Q1Fix3a
 ++ @32 + Q1Fix3b
 ++ @33 + Q1Fix3a
END

IF ~~ THEN Q1Fix3a
 SAY @34
 = @35
 IF ~~ THEN DO ~IncrementGlobal("IRTQuarrelCounter","GLOBAL",1) SetGlobal("IRTQuarrelDue","GLOBAL",1) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Q1Fix3b
 SAY @36
 IF ~~ THEN GOTO Q1Fix5
END

IF ~~ THEN Q1Fix4
 SAY @37
 IF ~~ THEN GOTO Q1Fix3Next
END

IF ~~ THEN Q1Fix5
 SAY @38
 = @39
 IF ~~ THEN DO ~SetGlobal("ToBMRQuarrel","GLOBAL",0) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Quarrel1b5
 SAY @40
 ++ @41 + Quarrel1b5a
 ++ @42 + Quarrel1b5a
 ++ @43 + Quarrel1b5a
 ++ @44 + Quarrel1b5a
 ++ @45 + Quarrel1b5a
END

IF ~~ THEN Quarrel1b5a
 SAY @46
 = @47
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300) SetGlobal("IRTImoenDumped","GLOBAL",1) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Quarrel1b6
 SAY @48
 ++ @49 + Quarrel1b6a
 ++ @50 + Quarrel1b6a
 ++ @51 + Quarrel1b1
 ++ @52 + Quarrel1b6a
 ++ @53 + Quarrel1b6a
 ++ @54 + Quarrel1b6a
END

IF ~~ THEN Quarrel1b6a
 SAY @55
 = @56
 ++ @57 + Quarrel1b6a3
 ++ @58 + Quarrel1b6a2
 ++ @59 + Quarrel1b6a1
END

IF ~~ THEN Quarrel1b6a1
 SAY @60
 IF ~~ THEN GOTO Quarrel1Hatred1
END

IF ~~ THEN Quarrel1Hatred1
 SAY @61
 IF ~~ THEN GOTO Q2Leaving
END

IF ~~ THEN Quarrel1b6a2
 SAY @62
 = @63
 = @64
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",5) SetGlobal("IRTImoenDumped","GLOBAL",1) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300) SetGlobal("IRTBrokeUpTalk","GLOBAL",1) RealSetGlobalTimer("IRTBrokeUpTalkTimer","GLOBAL",900) RunAwayFrom(Player1,30)~ EXIT
END

/* These globals are for a small talk that happens if you approach Imoen 2 minutes after you break up gently. If it's before the time, Imoen just blows you off. They can be found at the bottom of this file. */

IF ~~ THEN Quarrel1b6a3
  SAY @65
 = @66
 = @67
 ++ @68 + Quarrel1b6a3e
 ++ @69 + Quarrel1b6a3d
 ++ @70 + Quarrel1b6a3c
 ++ @71 + Quarrel1b6a3b
 ++ @72 + Quarrel1b6a3a
END

IF ~~ THEN Quarrel1b6a3a
 SAY @73
 = @74
 IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Quarrel1b6a3b
 SAY @75
 = @76
 IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Quarrel1b6a3c
 SAY @77
 IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Quarrel1b6a3d
 SAY @78
 IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Quarrel1b6a3e
 SAY @79
 IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Quarrel1b7
 SAY @80
 = @81
 ++ @41 + Quarrel1b5a
 ++ @82 + Quarrel1b5a
 ++ @83 + Quarrel1b5a
 ++ @84 + Quarrel1b5a
 ++ @85 + Quarrel1b5a
END

IF ~~ THEN Quarrel1d
 SAY @86
 IF ~~ THEN GOTO Quarrel1dNext
END

IF ~~ THEN Quarrel1dNext
 SAY @87
 ++ @88 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-3)~ + Quarrel1d6
 ++ @89 + Quarrel1d5
 ++ @90 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-3)~ + Quarrel1d4
 ++ @91 + Quarrel1d3
 ++ @92 + Quarrel1d2
 ++ @93 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ + Quarrel1d1
END

IF ~~ THEN Quarrel1d1
 SAY @94
 IF ~~ THEN DO ~IncrementGlobal("IRTQuarrelCounter","GLOBAL",1) SetGlobal("IRTQuarrelDue","GLOBAL",1)~ EXIT
END

IF ~~ THEN Quarrel1d2
 SAY @95
 ++ @89 + Quarrel1d5
 ++ @90 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-3)~ + Quarrel1d4
 ++ @91 + Quarrel1d3
 ++ @93 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ + Quarrel1d1
END

IF ~~ THEN Quarrel1d3
 SAY @96
 IF ~~ THEN GOTO Quarrel1Fix
END

IF ~~ THEN Quarrel1d4
 SAY @97
 IF ~~ THEN DO ~IncrementGlobal("IRTQuarrelCounter","GLOBAL",1) SetGlobal("IRTQuarrelDue","GLOBAL",1)~ EXIT
END

IF ~~ THEN Quarrel1d5
 SAY @98
 IF ~~ THEN GOTO Quarrel1Fix
END

IF ~~ THEN Quarrel1d6
 SAY @99
 IF ~~ THEN DO ~SetGlobal("IRTQuarrelDue","GLOBAL",1)~ EXIT
END

IF ~~ THEN Quarrel1e
 SAY @100
 = @101
 IF ~~ THEN GOTO Quarrel1Fix
END

IF ~~ THEN Quarrel1f
 SAY @102
 IF ~~ THEN GOTO Quarrel1dNext
END

IF ~~ Quarrel1g
 SAY @103
 IF ~~ THEN GOTO Quarrel1dNext
END


// Second (QuarrelCounter = 2)

IF WEIGHT #990 ~IsGabber(Player1) !AreaCheck("AR5203") Global("IRTQuarrelDue","GLOBAL",1) Global("IRTQuarrelCounter","GLOBAL",2) Global("ImoenRomanceActive","GLOBAL",2)~ THEN Q2
 SAY ~(Imoen stares straight ahead as you approach her.)~ [ IRQUIET ]
 IF ~~ THEN DO ~SetGlobal("IRTQuarrelDue","GLOBAL",0)~ GOTO Q2N
END

IF ~~ Q2N
 SAY @105
 ++ @106 + Q2ShoveIt
 ++ @107 + Q2Beg
 ++ @108 + Q2g
 ++ @109 + Q2Over
 ++ @110 + Q2Loop
END

IF ~~ Q2Loop
 SAY @111
 IF ~~ THEN DO ~SetGlobal("IRTQuarrelDue","GLOBAL",1)~ EXIT
END

IF ~~ Q2Over
 SAY @112
 = @113
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) SetGlobal("IRTImoenDumped","GLOBAL",1) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300)~ EXIT
END

IF ~~ Q2ShoveIt
 SAY @114
 IF ~~ THEN DO ~SetGlobal("IRTQuarrelDue","GLOBAL",1) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ Q2Beg
 SAY @115
 = @116
 = @117
 ++ @118 + Q2B4
 ++ @119 + Q2B3
 ++ @120 + Q2B2
 ++ @121 + Q2B1
END

IF ~~ Q2B1
 SAY @122
 = @123
 IF ~~ THEN GOTO Q2BreakUpEnd
END

IF ~~ Q2BreakUpEnd
 SAY @124
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",5) SetGlobal("IRTImoenDumped","GLOBAL",1) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300) SetGlobal("IRTBrokeUpTalk","GLOBAL",1) RealSetGlobalTimer("IRTBrokeUpTalkTimer","GLOBAL",900) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ Q2B2
 SAY @125
 = @126
 = @127
 ++ @128 + Q2B2Answer
 ++ @129 + Q2B2Answer
 ++ @130 + Q2B2Answer
 ++ @131 + Q2B2Answer
END

IF ~~ Q2B2Answer
 SAY @132
 IF ~~ THEN GOTO Q2BreakUpEnd
END

IF ~~ Q2B3
 SAY @133
 = @134
 = @135
 IF ~~ THEN GOTO Q2BreakUpEnd
END

IF ~~ Q2B4
 SAY @133
 = @136
 ++ @137 + Q2B4b
 ++ @138 + Q2B4a
 ++ @139 + Q1Fix3a
END

IF ~~ Q2B4a
 SAY @140
 = @141
 IF ~~ THEN GOTO Q2B4Exit
END

IF ~~ Q2B4Exit
 SAY @142
 IF ~~ THEN EXIT
END

IF ~~ Q2B4b
 SAY @143
 = @144
 = @145
 IF ~~ THEN GOTO Q2B4Exit
END

IF ~~ Q2g
 SAY @146
 = @147
 = @148
 = @149
 ++ @150 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-10)~ + Q2gN5
 ++ @151 + Q2gN4
 ++ @152 + Q2gN3
 ++ @153 + Q2gN2
 ++ @154 + Q2gN1
END

IF ~~ THEN Q2gN1
 SAY @155
 = @156
 = @157
 IF ~~ THEN GOTO Q2FrN
END

IF ~~ THEN Q2gN2
 SAY @158
 ++ @107 + Q2Beg
 ++ @159 + Q2B1
 ++ @160 + Q2Lolz
 END

 IF ~~ Q2Lolz
 SAY @161
 = @162
 IF ~~ THEN GOTO Q2Leaving
 END

IF ~~ THEN Q2gN3
 SAY @163
 = @164
 = @165
 IF ~~ THEN GOTO Q2FrN
END

IF ~~ THEN Q2gN4
 SAY @166
 = @167
 = @168
 IF ~~ THEN GOTO Q2FrN
END

IF ~~ THEN Q2gN5
 SAY @169
 = @170
 IF ~~ THEN DO ~IncrementGlobal("IRTQuarrelCounter","GLOBAL",1) SetGlobal("IRTQuarrelDue","GLOBAL",1) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN Q2FrN
 SAY @171
 = @172
 ++ @173 + Q2Friends4
 ++ @174 + Q2Friends3
 ++ @175 + Q2Friends2
 ++ @176 + Q2Friends1
END

IF ~~ THEN Q2Friends1
 SAY @177
 = @178
 IF ~~ THEN GOTO Q2Leaving
END
END

CHAIN IMOEN25J Q2Leaving
@179
== IMOEN25J IF ~!AreaCheck("AR4500") InParty("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @180 DO ~LeaveParty() EscapeArea() SetGlobal("IRTAerieImoenLeft","GLOBAL",1)~
== IMOEN25J IF ~!AreaCheck("AR4500") !InParty("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @181 DO ~LeaveParty() EscapeArea() SetGlobal("IRTAerieImoenLeft","GLOBAL",1)~
== IMOEN25J IF ~!AreaCheck("AR4500") !GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @181 DO ~LeaveParty() EscapeArea()~

== IMOEN25J IF ~AreaCheck("AR4500") InParty("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @180 DO ~SetGlobal("IRTAerieImoenLeft","GLOBAL",1) StartCutSceneMode() LeaveParty() GivePartyAllEquipment() RunAwayFrom(Player1,30) FaceObject(Player1) CreateVisualEffectObject("SPGRWHRL","Imoen2") PlaySound("EFF_M28") Wait(1) DestroySelf() EndCutSceneMode()~
== IMOEN25J IF ~AreaCheck("AR4500") !InParty("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @181 DO ~SetGlobal("IRTAerieImoenLeft","GLOBAL",1) StartCutSceneMode() LeaveParty() GivePartyAllEquipment() RunAwayFrom(Player1,30) FaceObject(Player1) CreateVisualEffectObject("SPGRWHRL","Imoen2") PlaySound("EFF_M28") Wait(1) DestroySelf() EndCutSceneMode()~
== IMOEN25J IF ~AreaCheck("AR4500") !GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @181 DO ~StartCutSceneMode() LeaveParty() GivePartyAllEquipment() RunAwayFrom(Player1,30) FaceObject(Player1) CreateVisualEffectObject("SPGRWHRL","Imoen2") PlaySound("EFF_M28") Wait(1) DestroySelf() EndCutSceneMode()~
EXIT

APPEND IMOEN25J
IF ~~ THEN Q2Friends2
 SAY @182
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) SetGlobal("IRTImoenDumped","GLOBAL",1)RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300)~ EXIT
END

IF ~~ THEN Q2Friends3
 SAY @183
 = @184
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",5) SetGlobal("IRTImoenDumped","GLOBAL",1)RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300)~ EXIT
END

IF ~~ THEN Q2Friends4
 SAY @185
 = @186
 ++ @187 + Q2Friends4a
 ++ @188 + Q2Friends3
 ++ @189 + Q2Friends2
 ++ @190 + Q2Friends1
END

IF ~~ THEN Q2Friends4a
 SAY @191
 = @192
 ++ @193 + Q2Friends4a1
 ++ @194 + Q2Friends3
 ++ @189 + Q2Friends2
 ++ @195 + Q2Friends1
END

IF ~~ THEN Q2Friends4a1
 SAY @196
 ++ @197 + Q2Friends1
 ++ @198 + Q2Friends3
 ++ @189 + Q2Friends2
 ++ @195 + Q2Friends1
END


// Third (QuarrelCounter = 3)


IF WEIGHT #990 ~IsGabber(Player1) !AreaCheck("AR5203") Global("IRTQuarrelDue","GLOBAL",1) Global("IRTQuarrelCounter","GLOBAL",3) Global("ImoenRomanceActive","GLOBAL",2)~ THEN Q2
 SAY ~(Imoen stares daggers at you as you approach.)~ [ IRQUIET ]
 IF ~~ THEN DO ~SetGlobal("IRTQuarrelDue","GLOBAL",0)~ GOTO Q3N
END

IF ~~ Q3N
 SAY @200
 ++ @201 + Q3Quiet
 ++ @202 + Q3Quiet
 ++ @203 + Q3Sorry
 ++ @204 + Q3Abuse
 ++ @205 + Q3Qs
END

IF ~~ Q3Quiet
 SAY @206
 ++ @207 + Q3Understand
 ++ @208 + Q3Friends
 ++ @209 + Q3Leave
 ++ @210 + Q3Use
END

IF ~~ Q3Understand
 SAY @211
 = @212
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) SetGlobal("IRTImoenDumped","GLOBAL",1) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300)~ EXIT
END

IF ~~ Q3Friends
 SAY @213
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",5) SetGlobal("IRTImoenDumped","GLOBAL",1) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300) SetGlobal("IRTBrokeUpTalk","GLOBAL",1)RealSetGlobalTimer("IRTBrokeUpTalkTimer","GLOBAL",900)  RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ Q3Leave
 SAY @214
 IF ~~ THEN GOTO Q2Leaving
END

IF ~~ Q3Use
 SAY @215
 = @162
 IF ~~ THEN GOTO Q2Leaving
END

IF ~~ Q3Sorry
 SAY @216
 = @217
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) SetGlobal("IRTImoenDumped","GLOBAL",1) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300)~ EXIT
END

IF ~~ Q3Abuse
 SAY @218
 = @219
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) SetGlobal("IRTImoenDumped","GLOBAL",1) SetGlobal("IRTImoenDumped","GLOBAL",1) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ Q3Qs
 SAY @220
 = @221
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) SetGlobal("IRTImoenDumped","GLOBAL",1) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300) RunAwayFrom(Player1,30)~ EXIT
END
END








// Cool Down period

// Sometimes if you snap at Imoen, she will give you some time to cool off. These are the short conversations that happen afterwards, when you initiate dialogue with her.

// First (IRTCooldownCounter = 1)

APPEND IMOEN25J
IF WEIGHT #-500 ~IsGabber(Player1) !AreaCheck("AR5203") Global("IRTCooldownDue","GLOBAL",1) Global("IRTCooldownCounter","GLOBAL",1)~ THEN CD1
 SAY ~(Imoen eyes you warily.)~ [ IRQUIET ]
 IF ~~ THEN DO ~SetGlobal("IRTCooldownDue","GLOBAL",0)~ GOTO CD1N
END

IF ~~ CD1N
 SAY @223
 ++ @224 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + CD1Sorry
 ++ @225 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ + CD1Sick
 ++ @226 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + CD1Hug
 ++ @227 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + CD1Stressed
 ++ @228 + CD1Qs
END

IF ~~ CD1Sick
 SAY @229
 = @230
 ++ @231 + CD1BreakUp
 ++ @232 + CD1Sick2
 ++ @233 + CD1Sick1
END

IF ~~ CD1Sick1
 SAY @234
 = @235
 = @236
 IF ~~ THEN EXIT
END

IF ~~ CD1Sick2
 SAY @237
 = @238
 IF ~~ THEN EXIT
END

IF ~~ CD1BreakUp
 SAY @239
 = @240
 ++ @241 + CD1BreakUpEnd
 ++ @242 + CD1Prank
END

IF ~~ CD1Prank
 SAY @243
 = @244
 = @245
 = @246
 = @247
 IF ~~ THEN EXIT
END

IF ~~ CD1BreakUpEnd
 SAY @248
 = @249
 = @63
 = @250
 = @64
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",5) SetGlobal("IRTImoenDumped","GLOBAL",1) SetGlobal("IRTBrokeUpTalk","GLOBAL",1)RealSetGlobalTimer("IRTBrokeUpTalkTimer","GLOBAL",900)  RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ CD1Qs
 SAY @251
 = @252
 IF ~~ THEN EXIT
END

IF ~~ CD1Stressed
 SAY @253
 = @254
 IF ~~ THEN EXIT
END

IF ~~ CD1Hug
 SAY @255
 = @256
 = @257
 IF ~~ THEN EXIT
END

IF ~~ CD1Sorry
 SAY @258
 = @259
 IF ~~ THEN EXIT
END
END




// Second (IRTCooldownCounter = 2)

APPEND IMOEN25J
IF WEIGHT #-500 ~IsGabber(Player1) !AreaCheck("AR5203") Global("IRTCooldownDue","GLOBAL",1) Global("IRTCooldownCounter","GLOBAL",2)~ THEN CD2
 SAY ~(Imoen eyes you with pursed lips.)~ [ IRQUIET ]
 IF ~~ THEN DO ~SetGlobal("IRTCooldownDue","GLOBAL",0)~ GOTO CD2N
END

IF ~~ CD2N
 SAY @261
 ++ @262 + CD2Sorry
 ++ @263 + CD2Silent
 ++ @264 + CD2Silent
 ++ @265 + CD2Qs
 ++ @266 + CD2Abuse
END

IF ~~ CD2Abuse
 SAY @267
 = @268
 = @269
 ++ @270 + CD2Abuse3
 ++ @271 + CD2Abuse2
 ++ @272 + CD2Abuse1
END

IF ~~ CD2Abuse1
 SAY @273
 = @274
 IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-3)~ EXIT
END

IF ~~ CD2Abuse2
 SAY @275
 IF ~~ THEN EXIT
END

IF ~~ CD2Abuse3
 SAY @276
 = @277
 IF ~~ THEN EXIT
END

IF ~~ CD2Qs
 SAY @278
 ++ @279 + CD2Abuse1
 ++ @280 + CD2Abuse2
 ++ @281 + CD2Qs1
END

IF ~~ CD2Qs1
 SAY @282
 ++ @283 + CD2Abuse2
 ++ @284 + CD2Abuse1
 ++ @285 + CD2Abuse1
END

IF ~~ CD2Silent
 SAY @286
 = @287
 IF ~~ THEN GOTO CD2SorryN
END

IF ~~ CD2Sorry
 SAY @288
 = @289
 IF ~~ THEN GOTO CD2SorryN
END

IF ~~ CD2SorryN
 SAY @290
 ++ @291 + CD2Won
 ++ @292 + CD2NotYou
 ++ @293 + CD2Pat
 ++ @294 + CD2Abuse1
END

IF ~~ CD2Pat
 SAY @295
 = @296
 IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-1)~ EXIT
END

IF ~~ CD2NotYou
 SAY @297
 = @298
 IF ~~ THEN EXIT
END

IF ~~ CD2Won
 SAY @299
 = @300
 IF ~~ THEN EXIT
END
END

// Third (IRTCooldownCounter = 3)

APPEND IMOEN25J
IF WEIGHT #-500 ~IsGabber(Player1) !AreaCheck("AR5203") Global("IRTCooldownDue","GLOBAL",1) Global("IRTCooldownCounter","GLOBAL",3)~ THEN CD3
 SAY ~(Imoen glowers at you as you approach.)~ [ IRQUIET ]
 IF ~~ THEN DO ~SetGlobal("IRTCooldownDue","GLOBAL",0)~ GOTO CD3N
END

IF ~~ CD3N
 SAY @302
 ++ @303 + CD3Sorry
 ++ @304 + CD3Silent
 ++ @305 + CD3Temper
 ++ @306 + CD3Hint
 ++ @307 + CD3Cry
END

IF ~~ CD3Cry
 SAY @308
 = @309
 IF ~~ THEN DO ~SetGlobal("IRTQuarrelDue","GLOBAL",1) IncrementGlobal("IRTQuarrelCounter","GLOBAL",1) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ CD3Hint
 SAY @310
 = @230
 ++ @311 + CD3Hint3
 ++ @231 + CD1BreakUp
 ++ @232 + CD3Hint2
 ++ @312 + CD3Hint1
END

IF ~~ CD3Hint1
 SAY @313
 = @314
 = @315
 IF ~~ THEN EXIT
END

IF ~~ CD3Hint2
 SAY @316
 = @317
 IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-3) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ CD3Hint3
 SAY @318
 = @319
 = @320
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) SetGlobal("IRTImoenDumped","GLOBAL",1) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300) RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ CD3Temper
 SAY @321
 ++ @322 + CD3Temper2
 ++ @323 + CD3Sorry
 ++ @324 + CD3Cry
 ++ @325 + CD3Temper1
END

IF ~~ CD3Temper1
 SAY @326
 = @327
 IF ~~ THEN GOTO CD3Go
END

IF ~~ CD3Go
 SAY @328
 IF ~~ THEN EXIT
END

IF ~~ CD3Temper2
 SAY @329
 = @330
 IF ~~ THEN GOTO CD3Go
END

IF ~~ CD3Silent
 SAY @331
 IF ~~ THEN GOTO CD3Sorry
END

IF ~~ CD3Sorry
 SAY @332
 ++ @322 + CD3Temper2
 ++ @333 + CD3Sorry1
 ++ @334 + CD3Cry
 ++ @335 + CD3Temper1
END

IF ~~ CD3Sorry1
 SAY @336
 = @337
 IF ~~ THEN GOTO CD3Go
END
END

// Fourth ( IRTCooldownCounter = 4 )
// Imoen just acts super hurt and it just leads to a full Quarrel

APPEND IMOEN25J
IF WEIGHT #-500 ~IsGabber(Player1) !AreaCheck("AR5203") Global("IRTCooldownDue","GLOBAL",1) Global("IRTCooldownCounter","GLOBAL",4)~ THEN CD4
 SAY ~(Imoen doesn't look up from the ground when you try to get her attention.)~ [ IRQUIET ]
 IF ~~ THEN DO ~SetGlobal("IRTCooldownDue","GLOBAL",0)~ GOTO CD4N
END

IF ~~ CD4N
 SAY @339
 IF ~~ THEN DO ~SetGlobal("IRTQuarrelDue","GLOBAL",1) IncrementGlobal("IRTQuarrelCounter","GLOBAL",1) RunAwayFrom(Player1,30)~ EXIT
END



// ~~ Talking after you break up with her during a quarrel ~~

IF WEIGHT #999 ~IsGabber(Player1) !AreaCheck("AR5203") Global("IRTBrokeUpTalk","GLOBAL",1) !RealGlobalTimerExpired("IRTBrokeUpTalkTimer","GLOBAL")~ THEN QBrokeUpEarly
 SAY @340
 IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END 

IF WEIGHT #999 ~IsGabber(Player1) !AreaCheck("AR5203") Global("IRTBrokeUpTalk","GLOBAL",1) RealGlobalTimerExpired("IRTBrokeUpTalkTimer","GLOBAL")~ THEN QBrokeUp
SAY @341
 ++ @342 + QBrokeUp5
 ++ @343 + QBrokeUp4
 ++ @344 + QBrokeUp3
 ++ @345 + QBrokeUp2
 ++ @346 + QBrokeUp1
END

IF ~~ THEN QBrokeUp1
 SAY @347
 IF ~~ THEN GOTO QBrokeUpEnd
END

IF ~~ THEN QBrokeUpEnd
 SAY @348
 = @349
 = @350
 = @351
 IF ~~ THEN DO ~SetGlobal("IRTBrokeUpTalk","GLOBAL",2) RunAwayFrom(Player1,20)~ EXIT
END

IF ~~ THEN QBrokeUp2
 SAY @352
 IF ~~ THEN GOTO QBrokeUpEnd
END

IF ~~ THEN QBrokeUp3
 SAY @353
 IF ~~ THEN GOTO QBrokeUpEnd
END

IF ~~ THEN QBrokeUp4
 SAY @354
 IF ~~ THEN GOTO QBrokeUpEnd
END

IF ~~ THEN QBrokeUp5
 SAY @355
 = @356
 IF ~~ THEN GOTO QBrokeUpEnd
END
END