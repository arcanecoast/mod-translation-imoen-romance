// These should trigger if IRTAerImFriend = 1, on a standard timer unless otherwise stated. They all need to be implemented.
// If IRTAerImFriend = 2, they're still friends but they're quiet about it because the player has expressed annoyance
// Name of the global keeping track of banter progress: IRTImAerTalks
// If Imoen is not romanced by the player, there are two more conversations about Imoen and Aerie.
// I figured the mod wouldn't be nearly as saturated if you're not romancing Imoen, so it shouldn't feel like she talks too much.

// If Global("IRTImAerWishYes","GLOBAL",1) then Aerie's epilogue doesn't display and Imoen's epilogue shows their story together as a romantic couple.
// If !Global("IRTImAerWishYes","GLOBAL",1) and IRTAerImFriend > 0, then Aerie's epilogue doesn't display and Imoen gets the friendship epilogue.






// ~~ 1st conversation ~~
// Should trigger pretty soon. In pocket plane after talking heads and Illasera?


CHAIN IF WEIGHT #21 ~Global("IRTImAerTalks","GLOBAL",1)~ THEN AERIE25J AE1
@0 DO ~SetGlobal("IRTImAerTalks","GLOBAL",2) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~
	== IMOEN25J @1
	== AERIE25J @2
	== IMOEN25J @3
	== AERIE25J @4
	== IMOEN25J @5
	== AERIE25J @6
	== IMOEN25J @7
	= @8
	== AERIE25J @9
	== IMOEN25J @10
	== AERIE25J @11
	== IMOEN25J @12
	== AERIE25J @13
	= @14
	== IMOEN25J @15
	== AERIE25J @16
	== IMOEN25J @17
	= @18
	== AERIE25J @19
	= @15
	== IMOEN25J @20
	== AERIE25J @21
	= @22
	== IMOEN25J @23
	== AERIE25J @24
	== IMOEN25J @25
	== AERIE25J @26
	== IMOEN25J @27
	== AERIE25J @28
	== IMOEN25J @29
EXIT





// ~~ 2nd conversation: Imoen - Aerie original game banter, which needs to be heavily changed if they are friends. It becomes the second banter they have befriended each other. ~~

CHAIN IF WEIGHT #20 ~Global("IRTImAerTalks","GLOBAL",3)~ THEN AERIE25J Friend71
@30 DO ~SetGlobal("IRTImAerTalks","GLOBAL",4) SetGlobal("ExpBaerie11","LOCALS",1) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~
	== IMOEN25J @31
	== AERIE25J @32
	== IMOEN25J @33
	== AERIE25J @34
	== IMOEN25J @35
	== AERIE25J @36
	== IMOEN25J @37
	== AERIE25J @38
	== IMOEN25J @39
	== AERIE25J @39
	== IMOEN25J @27
	== AERIE25J @40
	== IMOEN25J @41
	== IMOEN25J @42
	== AERIE25J @43
	== IMOEN25J @44
	== AERIE25J @45
	== IMOEN25J @46
	== AERIE25J @47
	== IMOEN25J @48
	== AERIE25J @49
	== IMOEN25J @50
	== AERIE25J IF ~Alignment(Player1,MASK_EVIL) OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ THEN @51
	== IMOEN25J IF ~Alignment(Player1,MASK_EVIL) OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ THEN @52
	== AERIE25J IF ~!Alignment(Player1,MASK_EVIL) OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ THEN @53
	== IMOEN25J IF ~!Alignment(Player1,MASK_EVIL) OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ THEN @54
	== AERIE25J @55
== IMOEN25J @56
	== AERIE25J @57
	== IMOEN25J @58
	== IMOEN25J @59
	== AERIE25J @60
	== IMOEN25J @61
	== AERIE25J @62
	== IMOEN25J @63
	== AERIE25J @64
	== IMOEN25J @65
	== AERIE25J @66
EXIT




// 3rd Conversation


CHAIN IF WEIGHT #19 ~Global("IRTImAerTalks","GLOBAL",5)~ THEN IMOEN25J ImAerChain3
	~Shut up, shut up already!~ [ IRQUIET ] DO ~SetGlobal("IRTImAerTalks","GLOBAL",6) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~
	= @68
	= @69
	== AERIE25J @70
	== IMOEN25J @71
	== AERIE25J @72
	== IMOEN25J @73
	== AERIE25J @74
EXIT


//// 4th Conversation (Make the timer shorter for this one)

CHAIN IF WEIGHT #18 ~Global("IRTImAerTalks","GLOBAL",7)~ THEN IMOEN25J ImAerChain4
	@75 DO ~SetGlobal("IRTImAerTalks","GLOBAL",8) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ 
	== AERIE25J @76
	= @77
	== IMOEN25J @78
	= @79
	== AERIE25J @80
	== IMOEN25J @81
	== AERIE25J @82
	== IMOEN25J @83
	== AERIE25J @84
	== IMOEN25J @85
	== AERIE25J @86
	= @87
	== IMOEN25J @88
	== AERIE25J @89
	== IMOEN25J @90
	== AERIE25J @91
	== IMOEN25J @92
	== AERIE25J @93
	== IMOEN25J @94
	== AERIE25J @95
EXIT


// 5th Conversation: Imoen approaches the player, but only if she is either romanced or friendly.
// Skip to next if she's fighting with the player

/* branch a) Imoen is romanced */

APPEND IMOEN25J
IF WEIGHT #800 ~Global("ImoenRomanceActive","GLOBAL",2) Global("IRTImAerTalks","GLOBAL",9)~ THEN IAR1
   SAY @96
   = @97
   ++ @98 DO ~SetGlobal("IRTImAerTalks","GLOBAL",10)~ + IAR1Next
   ++ @99 DO ~SetGlobal("IRTImAerTalks","GLOBAL",10)~ + IAFRQuick
   ++ @100 DO ~SetGlobal("IRTImAerTalks","GLOBAL",10)~ + IAFEnd
   ++ @101 DO ~SetGlobal("IRTImAerTalks","GLOBAL",10)~ + IAFEnd2
END

IF ~~ IAFRQuick
   SAY @102
   ++ @103 + IAR1Next
   ++ @104 + IAREnd
END

IF ~~ IAREnd
   SAY @105
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~EXIT
END

IF ~~ THEN IAR1Next
   SAY @106
   ++ @107 + IAR1d
   ++ @108 + IAR1c
   ++ @109 + IAR1b
   ++ @110 + IAR1a
END

IF ~~ IAR1a
   SAY @111
   = @112
   ++ @113 + IAR1a4
   ++ @114 + IAR1a3
   ++ @115 + IAR1a2
   ++ @116 + IAR1a1
END

IF ~~ IAR1a1
   SAY @117
   = @118
   = @119
   IF ~~ THEN DO ~SetGlobal("IRTAerImFriend","GLOBAL",2) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAR1a2
   SAY @120
   = @121
   = @122
   = @123
   ++ @124 + IAR1a2b
   ++ @125 + IAR1a2a
   ++ @116 + IAR1a1
END

IF ~~ IAR1a2a
   SAY @126
   = @127
   = @128
   = @129
   IF ~~ THEN DO ~SetGlobal("IRTAerImFriend","GLOBAL",2) IncrementGlobal("IRTLoveMeter","GLOBAL",-15) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAR1a2b
   SAY @130
   = @131
   = @132
   IF ~~ THEN DO ~SetGlobal("IRTAerImFriend","GLOBAL",2) IncrementGlobal("IRTLoveMeter","GLOBAL",-20) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAR1a3
   SAY @133
   = @134
   = @135
   IF ~~ THEN DO ~SetGlobal("IRTAerImFriend","GLOBAL",2) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAR1a4
   SAY @136
   = @137
   = @138
   IF ~~ THEN DO ~SetGlobal("IRTAerImFriend","GLOBAL",2) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAR1b
   SAY @139
   IF ~~ THEN GOTO IAR1bN
END

IF ~~ IAR1bN
   SAY @140
   = @141
   IF ~~ THEN GOTO IARFond
END

IF ~~ IAR1c
   SAY @142
   IF ~~ THEN GOTO IAR1bN
END

IF ~~ IAR1d
   SAY @143
   IF ~~ THEN GOTO IARFond
END

IF ~~ IARFond
   SAY @144
   ++ @145 + IARHappy
   ++ @146 + IARSkills
   ++ @147 + IARSake
   ++ @148 + IARGetRid
   ++ @149 + IARSide
   ++ @150 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + IARPlan
END

IF ~~ IARHappy
   SAY @151
   = @152
   = @153
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IARSkills
   SAY @154
   = @155
   = @153
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IARSake
   SAY @156
   = @157
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IARGetRid
   SAY @158
   IF ~~ THEN GOTO IARNoAerieEnd
END

IF ~~ IARSide
   SAY @159
   IF ~~ THEN GOTO IARNoAerieEnd
END

IF ~~ IARNoAerieEnd
   SAY @160
   = @161
   IF ~~ THEN DO ~SetGlobal("IRTEpilogueNoAerie","GLOBAL",1) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IARPlan
   SAY @162
   = @163
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

/* branch b) Imoen isn't romanced */

IF WEIGHT #800 ~!Global("ImoenRomanceActive","GLOBAL",2) Global("IRTImAerTalks","GLOBAL",9)~ THEN IAF1
   SAY @164
   = @97
   ++ @165 DO ~SetGlobal("IRTImAerTalks","GLOBAL",10)~ + IAF2
   ++ @99 DO ~SetGlobal("IRTImAerTalks","GLOBAL",10)~ + IAF2Quick
   ++ @100 DO ~SetGlobal("IRTImAerTalks","GLOBAL",10)~ + IAFEnd
   ++ @101 DO ~SetGlobal("IRTImAerTalks","GLOBAL",10)~ + IAFEnd2
END

IF ~~ IAFEnd
   SAY @166
   IF ~~ THEN DO ~SetGlobal("IRTAerieIgnoreSexualTension","GLOBAL",1) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAFEnd2
   SAY @167
   IF ~~ THEN DO ~SetGlobal("IRTAerieIgnoreSexualTension","GLOBAL",1) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAF2
   SAY @168
   = @169
   = @170
   = @171
   ++ @172 + IAFSerious
   ++ @173 + IAFSaw
   ++ @174 + IAFLaugh
   ++ @175 + IAFDismiss
   ++ @176 + IAFYell
END

IF ~~ IAF2Quick
   SAY @177
   = @178
   ++ @179 + IAFSerious
   ++ @173 + IAFSaw
   ++ @174 + IAFLaugh
   ++ @175 + IAFDismiss
   ++ @176 + IAFYell
END

IF ~~ IAFYell
   SAY @180
    = @181
   = @182
   = @183
   IF ~IsValidForPartyDialog("Aerie")~ THEN DO ~SetGlobal("IRTAerieTalkSexualTension","GLOBAL",1) MoveToObject("Aerie") RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
   IF ~!IsValidForPartyDialog("Aerie")~ THEN DO ~SetGlobal("IRTAerieTalkSexualTension","GLOBAL",1) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAFDismiss
   SAY @184
   = @185
   IF ~~ THEN DO ~SetGlobal("IRTAerieTalkSexualTension","GLOBAL",1) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAFLaugh
   SAY @186
   = @187
   ++ @188 + IAFLaugh1
   ++ @189 + IAFLaugh2
END

IF ~~ IAFLaugh1
   SAY @190
   IF ~~ THEN GOTO IAFAdvice
END

IF ~~ IAFLaugh2
   SAY @191
   IF ~~ THEN DO ~SetGlobal("IRTAerieTalkSexualTension","GLOBAL",1) RunAwayFrom(Player1,40) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAFSaw
   SAY @192
   = @193
   IF ~~ THEN GOTO IAFAdvice
END

IF ~~ IAFSerious
   SAY @194
   = @195
   IF ~~ THEN GOTO IAFAdvice
END

IF ~~ IAFAdvice
   SAY @196
   ++ @197 + IAFAdvice5
   ++ @198 + IAFAdvice4
   ++ @199 + IAFAdvice3
   ++ @200 + IAFAdvice22
   ++ @201 + IAFAdvice2
   ++ @202 + IAFAdvice1
END

IF ~~ IAFAdvice1
   SAY @203
   = @204
   = @205
   IF ~~ THEN DO ~SetGlobal("IRTAerImFriend","GLOBAL",2) SetGlobal("ImoenRomanceActive","GLOBAL",3) RunAwayFrom(Player1,40) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAFAdvice2
   SAY @206
   = @207
   ++ @197 + IAFAdvice5
   ++ @198 + IAFAdvice4
   ++ @199 + IAFAdvice3
   ++ @208 + IAFAdvice22
   ++ @202 + IAFAdvice1
END

IF ~~ IAFAdvice22
   SAY @209
   IF ~~ THEN GOTO IAFAdviceGush
END

IF ~~ IAFAdvice3
   SAY @210
   IF ~~ THEN GOTO IAFAdviceLike
END

IF ~~ IAFAdvice4
   SAY @211
   IF ~~ THEN GOTO IAFAdviceLike
END

IF ~~ IAFAdviceLike
   SAY @212
   IF ~~ THEN GOTO IAFAdviceGush
END

IF ~~ IAFAdvice5
   SAY @213
   IF ~~ THEN GOTO IAFAdviceLike
END

IF ~~ IAFAdviceGush
   SAY @214
   = @215
   ++ @216 DO ~SetGlobal("IRTAerieTalkPlayerAdvice","GLOBAL",1) SetGlobal("IRTAerieTalkSexualTension","GLOBAL",1)~ + IAFRes5
   ++ @217 DO ~SetGlobal("IRTAerieIgnoreSexualTension","GLOBAL",1)~ + IAFRes4
   ++ @218 DO ~SetGlobal("IRTAerieKissSexualTension","GLOBAL",1)~ + IAFRes3
   ++ @219 DO ~SetGlobal("IRTAerieIgnoreSexualTension","GLOBAL",1)~ + IAFRes2
   ++ @220 DO ~SetGlobal("IRTAerieIgnoreSexualTension","GLOBAL",1)~ + IAFRes1
END

IF ~~ IAFRes1
   SAY @221
   = @222
   = @223
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~EXIT
END

IF ~~ IAFRes2
   SAY @224
   = @225
   = @226
   = @227
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAFRes3
   SAY @228
   = @229
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAFRes4
   SAY @230
   = @231
   = @232
   = @227
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAFRes5
   SAY @233
   = @234
   = @235
   = @236
   = @237
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END
END




// 6th Conversation

// If Imoen is romanced, this is their final conversation

CHAIN IF WEIGHT #800 ~Global("IRTImAerTalks","GLOBAL",11) OR(3) Global("IRTAerieTalkSexualTension","GLOBAL",1) Global("IRTAerieKissSexualTension","GLOBAL",1) Global("ImoenRomanceActive","GLOBAL",2)~ THEN IMOEN25J IA6Chain
	@238 DO ~SetGlobal("IRTImAerTalks","GLOBAL",12) ~
	== AERIE25J @239
	== IMOEN25J @240
	== AERIE25J @241
	== IMOEN25J @242
	== AERIE25J @243
	== IMOEN25J @244
	== AERIE25J @245
	= @246
	== IMOEN25J @247
	== AERIE25J @248
	= @249
	== IMOEN25J @250
	== AERIE25J @251
	== IMOEN25J @252
	== AERIE25J @253
	== IMOEN25J @254
	== AERIE25J @255
	== IMOEN25J @256
	== AERIE25J @257
	== IMOEN25J @258
END
	IF ~Global("IRTAerieKissSexualTension","GLOBAL",1)~ THEN EXTERN AERIE25J IA6KissChain
	IF ~Global("IRTAerieTalkSexualTension","GLOBAL",1)~ THEN EXTERN AERIE25J IA6RomChain
	IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN EXTERN AERIE25J IA6RomChain



// This chain is for when IRTAerieTalkSexualTension = 1 or ImoenRomanceActive = 2

CHAIN AERIE25J IA6RomChain
	@259
	= @260
	== IMOEN25J @261
	== AERIE25J @262
	== IMOEN25J @263
	== AERIE25J @264
	== IMOEN25J @265
	== AERIE25J @266
END
	IF ~Global("IRTAerieTalkSexualTension","GLOBAL",1)~ THEN EXTERN IMOEN25J IA6TalkChain
	IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN EXTERN IMOEN25J IA6RomChain2



// This chain is for when ImoenRomanceActive = 2

CHAIN IMOEN25J IA6RomChain2
	@267 DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~
	= @268
	== BVICON25 IF ~IsValidForPartyDialog("Viconia")~ THEN @269
	== BEDWIN25 IF ~IsValidForPartyDialog("Edwin")~ THEN @270
	== BKORGA25 IF ~IsValidForPartyDialog("Korgan")~ THEN @271
	== BSAREV25 IF ~IsValidForPartyDialog("Sarevok")~ THEN @272
	== AERIE25J @273
EXIT


// This chain is for when IRTAerieKissSexualTension = 1

CHAIN AERIE25J IA6KissChain
	@274 DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~
	== IMOEN25J @275
	= @276
	== AERIE25J @277
	== IMOEN25J @278
	== AERIE25J @279
	== IMOEN25J @280
	== AERIE25J @281
	== IMOEN25J @282
	== AERIE25J @283
	== IMOEN25J @284
	== AERIE25J @285
	== IMOEN25J @286 DO ~RunAwayFrom("Aerie",40)~
	== BJAHEI25 IF ~IsValidForPartyDialog("Jaheira")~ THEN @287
	== BNALIA25 IF ~IsValidForPartyDialog("Nalia")~ THEN @288
	== BMAZZY25 IF ~!IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Mazzy")~ THEN @288
	== BEDWIN25 IF ~IsValidForPartyDialog("Edwin")~ THEN @289
	== BVICON25 IF ~IsValidForPartyDialog("Viconia")~ THEN @269
	== BKORGA25 IF ~IsValidForPartyDialog("Korgan")~ THEN @290
	== BSAREV25 IF ~IsValidForPartyDialog("Sarevok")~ THEN @272
EXIT


// This chain is for when IRTAerieTalkSexualTension = 1

CHAIN IMOEN25J IA6TalkChain
	@291 DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~
	= @292
	== AERIE25J @26
	== IMOEN25J IF ~NumInPartyGT(3)~ THEN @293
	== IMOEN25J IF ~!NumInPartyGT(3)~ THEN @294
	== IMOEN25J IF ~Global("IRTAerieTalkPlayerAdvice","GLOBAL",1)~ THEN @295
	== IMOEN25J IF ~!Global("IRTAerieTalkPlayerAdvice","GLOBAL",1)~ THEN @296
	== AERIE25J @297
	== IMOEN25J @298
	= @299
	== AERIE25J @300
	== IMOEN25J @301
	== AERIE25J @302
	== IMOEN25J @303
	== AERIE25J @304
	== IMOEN25J @60
	== IMOEN25J @305
	== AERIE25J @306
	== IMOEN25J @307
	== AERIE25J @308
	== IMOEN25J @309
	== AERIE25J @310
	== IMOEN25J @311
	= @312
	== AERIE25J @313
	== BNALIA25 IF ~IsValidForPartyDialog("Nalia")~ THEN @288
	== BMAZZY25 IF ~!IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Mazzy")~ THEN @288
	== BEDWIN25 IF ~IsValidForPartyDialog("Edwin")~ THEN @314
	== BVICON25 IF ~IsValidForPartyDialog("Viconia")~ THEN @315
	== BKORGA25 IF ~IsValidForPartyDialog("Korgan")~ THEN @316
	== BSAREV25 IF ~IsValidForPartyDialog("Sarevok")~ THEN @272
EXIT



// This is an independent chain that happens when IRTAerieIgnoreSexualTension = 1

CHAIN IF WEIGHT #800 ~Global("IRTImAerTalks","GLOBAL",11)  Global("IRTAerieIgnoreSexualTension","GLOBAL",1)~ THEN IMOEN25J IA6IgnoreChain
	@317 DO ~SetGlobal("IRTImAerTalks","GLOBAL",12) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~
	== IMOEN25J @318
	== AERIE25J @319
	== IMOEN25J @320
	== AERIE25J @321
	== IMOEN25J @322
	== AERIE25J @323
	== IMOEN25J @324
	== AERIE25J @325
	== IMOEN25J @326
	== AERIE25J @327
	== IMOEN25J @328
	== AERIE25J @329
	== IMOEN25J @330
	== AERIE25J @331
	== IMOEN25J @332
	== AERIE25J @333
	== IMOEN25J @334
	== AERIE25J @335
	== IMOEN25J @336
	== AERIE25J @337
	== AERIE25J @338
	== AERIE25J @339
	== IMOEN25J @340
	= @341
	== AERIE25J @308
	== IMOEN25J @342
	== AERIE25J @310
	== IMOEN25J @343
	= @312
	== AERIE25J @313
	== BNALIA25 IF ~IsValidForPartyDialog("Nalia")~ THEN @288
	== BMAZZY25 IF ~!IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Mazzy")~ THEN @288
	== BEDWIN25 IF ~IsValidForPartyDialog("Edwin")~ THEN @314
	== BVICON25 IF ~IsValidForPartyDialog("Viconia")~ THEN @315
	== BKORGA25 IF ~IsValidForPartyDialog("Korgan")~ THEN @316
	== BSAREV25 IF ~IsValidForPartyDialog("Sarevok")~ THEN @272
EXIT



// 7th Conversation
// Only happens if Imoen is not romanced
// Triggers right before resting, or perhaps after displaying the animation but not getting the actual rest yet. The talk actually happens in the *middle* of rest.


APPEND IMOEN25J
IF WEIGHT #800 ~Global("IRTImAerTalks","GLOBAL",13)~ IAEavesdrop
   SAY ~(The sound of hushed voices wakes you. It takes your keen senses only a moment to understand there is no danger; it is simply Imoen, speaking barely above a whisper.)~ [ IRQUIET ]
   IF ~~ THEN DO ~SetGlobal("IRTImAerWishYes","GLOBAL",1) SetGlobal("IRTImAerTalks","GLOBAL",14)~ GOTO IAEavesdropN
END

IF ~~ IAEavesdropN
   SAY @345
   ++ @346 DO ~SetGlobal("IRTImAerEavesdrop","GLOBAL",1)~ + IAEaveChain
   ++ @347 + IAEaveNot
END

IF ~~ THEN IAEaveNot
   SAY @348
   IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",300) RestParty()~ EXIT
END
END

CHAIN IMOEN25J IAEaveChain
@349 DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",300)~
== AERIE25J @350
== IMOEN25J @351
== AERIE25J @352
== IMOEN25J @353
== AERIE25J @354
= @355
== IMOEN25J @356
== AERIE25J @357
== IMOEN25J @358
== AERIE25J @359
== IMOEN25J @360
== AERIE25J @361
== IMOEN25J @362
== AERIE25J @363
= @364
= @365
== IMOEN25J @366
== AERIE25J @367
== IMOEN25J @368
== AERIE25J @369
== IMOEN25J @370
== AERIE25J @371
== IMOEN25J @372
== AERIE25J @373
= @374
== IMOEN25J @375
= @376
== AERIE25J @377
= @378
== IMOEN25J @379
= @380
= @381
== AERIE25J @382
= @383
= @384
== IMOEN25J @385
== AERIE25J @386
== IMOEN25J @39
= @387
== AERIE25J @388
== IMOEN25J @389
== AERIE25J @390
= @391
== IMOEN25J @392
= @393
= @394
END
 IF ~~ THEN DO ~RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",300) RestParty()~ EXIT



// 8th Conversation
// Imoen approaches you for more advice.

APPEND IMOEN25J
IF WEIGHT #800 ~Global("IRTImAerTalks","GLOBAL",15) !Global("ImoenRomanceActive","GLOBAL",2)~ IAWish
   SAY ~Can I bug you again, <CHARNAME>?~ [ IRQUIET ]
   IF ~~ THEN DO ~SetGlobal("IRTImAerTalks","GLOBAL",16)~ GOTO IAWishN
END

IF ~~ IAWishN
   SAY @396
   ++ @397 + IAWishYes2
   + ~Global("IRTImAerEavesdrop","GLOBAL",1)~ + @398 + IAWishEave
   ++ @399 + IAWishYes1
   ++ @400 + IAWishNo
END

IF ~~ IAWishNo
   SAY @401
   = @402
   IF ~~ THEN DO ~SetGlobal("IRTImAerWishYes","GLOBAL",1) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAWishYes1
   SAY @403
   IF ~~ THEN GOTO IAWishEx
END

IF ~~ IAWishYes2
   SAY @404
   IF ~~ THEN GOTO IAWishEx
END

IF ~~ IAWishEave
   SAY @405
   = @406
   IF ~~ THEN GOTO IAWishOpinion
END

IF ~~ THEN IAWishEx
   SAY @407
   = @408
   = @409
   = @410
   = @411
   IF ~~ THEN GOTO IAWishOpinion
END

IF ~~ IAWishOpinion
   SAY @412
   ++ @174 + IAWishOp5
   ++ @413 + IAWishInfo
   ++ @414 + IAWishOp6
   ++ @415 + IAWishOp4
   ++ @416 + IAWishOp3
   ++ @417 + IAWishOp2
   ++ @418 + IAWishOp1
END

IF ~~ IAWishInfo
   SAY @419
   = @420
   = @421
   = @422
   IF ~~ THEN GOTO IAWishFinal
END

IF ~~ IAWishFinal
   SAY @423
   ++ @424 + IAWishOp4
   ++ @416 + IAWishOp3
   ++ @425 + IAWishOp2
   ++ @418 + IAWishOp1
END

IF ~~ IAWishOp1
   SAY @426
   = @427
   = @428
   IF ~~ THEN DO ~SetGlobal("IRTImAerWishYes","GLOBAL",1) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAWishOp2
   SAY @429
   IF ~~ THEN GOTO IAWishOpNo
END

IF ~~ IAWishOpNo
   SAY @430
   = @431
   = @432
   = @433
   IF ~~ THEN DO ~SetGlobal("IRTImAerWishYes","GLOBAL",2) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAWishOp3
   SAY @434
   IF ~~ THEN GOTO IAWishOpNo
END

IF ~~ IAWishOp4
   SAY @435
   IF ~~ THEN GOTO IAWishOpYes
END

IF ~~ IAWishOpYes
   SAY @436
   = @437
   = @438
   IF ~~ THEN DO ~SetGlobal("IRTImAerWishYes","GLOBAL",1) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAWishOp5
   SAY @439
   = @440
   ++ @441 + IAWishLaugh4
   ++ @442 + IAWishLaugh3
   ++ @443 + IAWishLaugh2
   ++ @444 + IAWishInfo
   ++ @445 + IAWishLaugh1
END

IF ~~ IAWishLaugh1
   SAY @446
   = @447
   IF ~~ THEN DO ~SetGlobal("IRTImAerWishYes","GLOBAL",2) RealSetGlobalTimer("IRTAerieImoenTimer","GLOBAL",1200)~ EXIT
END

IF ~~ IAWishLaugh2
   SAY @448
   IF ~~ THEN GOTO IAWishFinal
END

IF ~~ IAWishLaugh3
   SAY @449
   IF ~~ THEN GOTO IAWishOpNo
END

IF ~~ IAWishLaugh4
   SAY @450
   IF ~~ THEN GOTO IAWishOpYes
END

IF ~~ IAWishOp6
   SAY @451
   IF ~~ THEN GOTO IAWishOpYes
END
END


// Misc: If the player ever breaks off the relationship with Imoen

//// Triggers after a while (5 real minutes?) of IRTImoenDumped = 1
//might leave this as banter triggerable for now
CHAIN IF WEIGHT #800 ~Global("IRTImoenDumped","GLOBAL",1) Global("IRTAerieComfortsDumpedImoen","GLOBAL",1)~ THEN AERIE25J IAConfortChain
	~Imoen, I'm so sorry. Can I... can I do anything?~ [ IRQUIET ] DO ~SetGlobal("IRTAerieComfortsDumpedImoen","GLOBAL",2)~
	== IMOEN25J @453
	== AERIE25J @454
	== IMOEN25J @455
	== AERIE25J @456
	= @457
	== IMOEN25J @458
EXIT

