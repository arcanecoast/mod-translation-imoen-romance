// A dialogue in which Imoen approaches you at bedtime and just lets you vent.
// It is exclusive to female PCs, because male PCs get to argue with her about getting her pregnant.
//  It should trigger some time toward the middle of ToB, when the party rests. After Yaga Shura is down

// Global trigger: IRTFemaleBedtimeStories = 1


APPEND IMOEN25J
IF WEIGHT #200 ~Global("IRTFemaleBedtimeStories","GLOBAL",1)~ THEN BEGIN U
 SAY @0
 IF ~~ THEN DO ~SetGlobal("IRTFemaleBedtimeStories","GLOBAL",2)~ GOTO UN
END

IF ~~ UN
 SAY @1
 = @2
 = @3
 = @4
 ++ @5 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + U5
 ++ @6 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + U4
 ++ @7 + U3
 ++ @8 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + U2
 ++ @9 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + U1
 ++ @10 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-3)~ + U00
 ++ @11 + U0
END

IF ~~ USettleDrift
 SAY @12
 IF ~~ THEN DO ~RestParty()~ EXIT
END

IF ~~ U0
 SAY @13
 IF ~~ THEN GOTO USettleDrift
END

IF ~~ U00
 SAY @14
 = @15
 = @16
 IF ~~ THEN DO ~RestParty()~ EXIT
END

IF ~~ U1
 SAY @17
 ++ @18 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + U1a
 ++ @19 + U4
 ++ @20 + U2
 ++ @21 + U3
END

IF ~~ U1a
 SAY @22
 ++ @23 + U1a3
 ++ @24 + U1a2
 ++ @25 + U1a1
 ++ @26 + U3
END

IF ~~ U1a1
 SAY @27
 ++ @28 + U1a1b
 ++ @29 + U1a1b
 ++ @30 + U1a1a
 ++ @26 + U3
END

IF ~~ U1a1a
 SAY @31
 = @32
 = @33
 IF ~~ THEN DO ~RestParty()~ EXIT
END

IF ~~ U1a1b
 SAY @34
 = @35
 IF ~~ THEN DO ~RestParty()~ EXIT
END

IF ~~ U1a2
 SAY @36
 ++ @37 + U1a1b
 ++ @38 + U1a1b
 ++ @30 + U1a1a
 ++ @26 + U3
END

IF ~~ U1a3
 SAY @39
 ++ @37 + U1a1b
 ++ @40 + U1a1b
 ++ @41 + U1a1a
END

IF ~~ U2
 SAY @42
 = @43
 = @44
 ++ @37 + U1a1b
 ++ @45 + U1a1b
 ++ @46 + U3
END

IF ~~ U3
 SAY @47
 = @48
 ++ @49 + U3b
 ++ @50 + U3a
END

IF ~~ U3a
 SAY @51
 = @52
IF ~~ THEN GOTO U1a1b
END

IF ~~ U3b
 SAY @53
 = @54
 IF ~~ THEN DO ~RestParty()~ EXIT
END

IF ~~ U4
 SAY @55
 IF ~~ THEN GOTO U4N
END

// Level 1

IF ~~ U4N
 SAY @56
 ++ @57 + U4f
 ++ @58 + U4e
 ++ @59 + U4d
 ++ @60 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4c
 ++ @61 + U4b
 ++ @62 + U4a
END

// Level 2

IF ~~ U4a
   SAY @63
   ++ @64 + U4a3
   ++ @65 + U4a3
   ++ @66 + U4a2
   ++ @67 + U4a1
   ++ @68 + U4a1
END

IF ~~ U4b
   SAY @69
   ++ @70 + U4b2
   ++ @71 + U4b3
   ++ @66 + U4a2
   ++ @72 + U4a2
   ++ @73 + U4b1
END

IF ~~ U4c
   SAY @74
   ++ @75 + U4c5
   ++ @76 + U4c4
   ++ @77 + U4c3
   ++ @78 + U4c2
   ++ @79 + U4c1
END

IF ~~ U4d
   SAY @80
   ++ @81 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4c
   ++ @82 + U4d3
   ++ @83 + U4d2
   ++ @84 + U4d1
END

IF ~~ U4e
   SAY @85
   = @86
   = @87
   ++ @88 + U4f
   ++ @89 + U4d
   ++ @90 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4c
   ++ @91 + U4b
   ++ @92 + U4a
END

IF ~~ U4f
   SAY @93
   ++ @94 + U4b2
   ++ @71 + U4b3
   ++ @95 + U4a2
   ++ @72 + U4a2
   ++ @96 + U4b1
END

// Level 3

IF ~~ U4c1
   SAY @97
   ++ @98 + U4c1a
   ++ @99 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4a2c
   ++ @100 + U4a2b
   ++ @101 + U4a2b
END

IF ~~ U4c2
   SAY @102
   ++ @103 + U4c2a
   ++ @104 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4a2c
   ++ @100 + U4a2b
   ++ @101 + U4a2b
END

IF ~~ U4c3
   SAY @105
   ++ @106 + U4b1d
   ++ @107 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4a2c
   ++ @108 + U4c3b
   ++ @109 + U4c3a
   ++ @110 + U4a2a
   ++ @111 + U4Sugarpuff
END

IF ~~ U4Sugarpuff
   SAY @112
   ++ @113 + U4SugarpuffN
   ++ @114 + U4SugarpuffN
   ++ @115 + U4SugarpuffN
END

IF ~~ U4SugarpuffN
   SAY @116
   = @117
   ++ @118 + U4b1d
   ++ @119 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4a2c
   ++ @120 + U4c3b
   ++ @121 + U4c3a
   ++ @122 + U4a2a
END

IF ~~ U4c4
   SAY @123
   ++ @124 + U4c5a
   ++ @104 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4a2c
   ++ @125 + U4a2b
   ++ @126 + U4a2b
END

IF ~~ U4c5
   SAY @127
   ++ @128 + U4c5a
   ++ @104 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4a2c
   ++ @100 + U4a2b
   ++ @129 + U4a2b
END

IF ~~ U4a1
   SAY @130
   ++ @131 + U4a1d
   ++ @132 + U4a1c
   ++ @133 + U4a1b
   ++ @134 + U4a1a
END

IF ~~ U4a2
   SAY @135
   ++ @136 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4a2c
   ++ @137 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4a2b
   ++ @138 + U4a2a
END

IF ~~ U4a3
   SAY @139
   ++ @140 + U4a1d
   ++ @133 + U4a1b
   ++ @141 + U4a1a
   ++ @132 + U4a1c
   ++ @142 + U4a1b
END

IF ~~ U4b1
   SAY @143
   ++ @144 + U4b1d
   ++ @145 + U4b1c
   ++ @146 + U4a1a
   ++ @147 + U4b1b
   ++ @148 + U4b1a
END

IF ~~ U4b2
   SAY @149
   ++ @150 + U4a1d
   ++ @148 + U4b1a
   ++ @145 + U4b1c
   ++ @146 + U4a1a
   ++ @151 + U4a1c
END

IF ~~ U4b3
   SAY @152
   ++ @153 + U4b1d
   ++ @131 + U4a1d
   ++ @145 + U4b1c
   ++ @146 + U4a1a
   ++ @151 + U4a1c
END

IF ~~ U4d1
   SAY @97
   ++ @154 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4c1a
   ++ @155 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4d1a
   ++ @156 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ + U4d1a
   ++ @157 + U4d3
END

IF ~~ U4d2
   SAY @158
   ++ @159 + U4d2a
   ++ @160 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4c5a
   ++ @161 + U4b1d
   ++ @162 + U4b1a
   ++ @163 + U4a1d
END


IF ~~ U4d3
   SAY @164
   ++ @159 + U4d2a
   ++ @165 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4c
   ++ @161 + U4b1d
   ++ @166 + U4a1d
END

// Level 4

IF ~~ U4a1a
   SAY @167
   ++ @168 + U4DutyEnd
   ++ @169 + U4LetGoEnd
   ++ @170 + U4KillGuiltEnd
   ++ @171 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4HeritageEnd
END

IF ~~ U4a1b
   SAY @172
   ++ @173 + UChokeEnd
   ++ @174 + UInsecureEnd
   ++ @175 + UDifferentEnd
   ++ @176 + UWrongDecisionEnd
   ++ @177 + UInsecureEnd
END

IF ~~ U4a1c
   SAY @178
   ++ @179 + U4ZakharaEnd
   ++ @180 + U4HuntedEnd
   ++ @181 + U4PlanesEnd
   ++ @182 + U4MarkedEnd
   ++ @183 + U4DutyEnd
END

IF ~~ U4a1d
   SAY @184
   ++ @185 + UWrongDecisionEnd
   ++ @186 + UDisconnectEnd
   ++ @187 + U4GiveAllEnd
   ++ @188 + U4GiveAllEnd
   ++ @189 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4HeritageEnd
END

IF ~~ U4a2a
   SAY @190
   ++ @191 + U4NoPlansEnd
   ++ @192 + U4OurWayEnd
   ++ @193 + U4CatastropheEnd
   ++ @194 + U4BetterPlaceEnd
   ++ @195 + U4SurviveEnd
END

IF ~~ U4a2b
   SAY @196
   ++ @197 + U4HeritageEnd
   ++ @198 + U4HeritageEnd
   ++ @199 + U4HeritageEnd
   ++ @200 + U4HeritageEnd
   ++ @201 + U4HeritageEnd
   ++ @202 + U4HeritageEnd
END

IF ~~ U4a2c
   SAY @203
   ++ @204 + U4IntertwinedEnd
   ++ @205 + U4MortalEnd
   ++ @206 + U4MortalEnd
   ++ @207 + U4MortalEnd
   ++ @208 + U4MortalEnd
END

IF ~~ U4b1a
   SAY @209
   ++ @210 + U4SurviveEnd
   ++ @211 + U4BetterPlaceEnd
   ++ @212 + U4CatastropheEnd
   ++ @213 + U4OurWayEnd
   ++ @214 + U4GiveAllEnd
END

IF ~~ U4b1b
   SAY @215
   ++ @216 + U4BetterPlaceEnd
   ++ @217 + U4InstinctsEnd
   ++ @218 + U4SurviveEnd
   ++ @219 + U4BloodyEnd
   ++ @220 + U4MarkedEnd
END

IF ~~ U4b1c
   SAY @221
   ++ @222 + U4SurviveEnd
   ++ @211 + U4BetterPlaceEnd
   ++ @213 + U4OurWayEnd
   ++ @219 + U4BloodyEnd
   ++ @223 + U4BloodyEnd
END

IF ~~ U4b1d
   SAY @224
   ++ @225 + U4IntertwinedEnd
   ++ @226 + U4WakeUp
   ++ @227 + U4MortalEnd
   ++ @228 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4HeritageEnd
   ++ @229 + U4WakeUp
END

IF ~~ U4c1a
   SAY @230
   ++ @231 + U4MortalEnd
   ++ @232 + U4MortalEnd
   ++ @233 + U4OneGodEnd
   ++ @234 + U4InsaneGodEnd
   ++ @235 + U4ShyGodEnd
END

IF ~~ U4c2a
   SAY @236
   ++ @231 + U4MortalEnd
   ++ @237 + U4MortalEnd
   ++ @238 + U4OneGodEnd
   ++ @239 + U4InsaneGodEnd
   ++ @235 + U4ShyGodEnd
END

IF ~~ U4c5a
   SAY @240
   ++ @231 + U4MortalEnd
   ++ @237 + U4MortalEnd
   ++ @241 + U4OneGodEnd
   ++ @239 + U4InsaneGodEnd
   ++ @235 + U4ShyGodEnd
END

IF ~~ U4c3a
   SAY @242
   ++ @243 + U4UsgodsEnd
   ++ @244 + U4UsgodsEnd
   ++ @245 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4a2c
   ++ @246 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4MortalEnd
END

IF ~~ U4c3b
   SAY @247
   ++ @248 + U4UsgodsEnd
   ++ @245 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4a2c
   ++ @246 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",0)~ + U4MortalEnd
END

IF ~~ U4d1a
   SAY @249
   ++ @250 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + U4EvilGodEnd
   ++ @251 + U4ViolentEnd
   ++ @252 + U4NormalEnd
   ++ @253 + U4evilRegretEnd
END

IF ~~ U4d2a
   SAY @254
   ++ @255 + U4ZakharaEnd
   ++ @256 + U4TourismEnd
   ++ @257 + U4PlanesEnd
   ++ @258 + U4MarkedEnd
   ++ @259 + U4DutyEnd
END

// End States

IF ~~ U4TourismEnd
   SAY @260
   ++ @261 + UAsleep
   ++ @262 + UAsleep
   ++ @263 + UAsleep
   ++ @264 + UAsleep
   ++ @265 + UAsleep
END

IF ~~ U4evilRegretEnd
   SAY @260
   ++ @266 + UAsleep
   ++ @267 + UAsleep
   ++ @268 + UAsleep
   ++ @269 + UAsleep
   ++ @270 + UAsleep
END

IF ~~ U4NormalEnd
   SAY @260
   ++ @271 + UAsleep
   ++ @272 + UAsleep
   ++ @273 + UAsleep
   ++ @274 + UAsleep
   ++ @275 + UAsleep
END

IF ~~ U4ViolentEnd
   SAY @260
   ++ @276 + UAsleep
   ++ @277 + UAsleep
   ++ @278 + UAsleep
   ++ @279 + UAsleep
END

IF ~~ U4EvilGodEnd
   SAY @260
   ++ @280 + UAsleep
   ++ @281 + UAsleep
   ++ @282 + UAsleep
   ++ @279 + UAsleep
END

IF ~~ U4UsgodsEnd
   SAY @260
   ++ @283 + UAsleep
   ++ @284 + UAsleep
   ++ @285 + UAsleep
   ++ @286 + UAsleep
   ++ @287 + UAsleep
END

IF ~~ U4ShyGodEnd
   SAY @260
   ++ @288 + UAsleep
   ++ @289 + UAsleep
   ++ @290 + UAsleep
   ++ @291 + UAsleep
   ++ @292 + UAsleep
END

IF ~~ U4InsaneGodEnd
   SAY @260
   ++ @293 + UAsleep
   ++ @294 + UAsleep
   ++ @295 + UAsleep
   ++ @296 + UAsleep
   ++ @297 + UAsleep
END

IF ~~ U4OneGodEnd
   SAY @260
   ++ @290 + UAsleep
   ++ @298 + UAsleep
   ++ @299 + UAsleep
   ++ @300 + UAsleep
   ++ @292 + UAsleep
END

IF ~~ U4WakeUp
   SAY @301
   = @302
   = @303
   = @304
   ++ @305 + U4WakeUp4
   ++ @306 + U4WakeUp3
   ++ @307 + U4WakeUp2
   ++ @308 + U4WakeUp1
END

IF ~~ U4WakeUp1
   SAY @309
   = @310
   = @311
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",5) RestParty()~ EXIT
END

IF ~~ U4WakeUp2
   SAY @312
   IF ~~ THEN GOTO U4WakeUpEnd
END

IF ~~ U4WakeUpEnd
   SAY @313
   = @314
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",5) RestParty()~ EXIT
END

IF ~~ U4WakeUp3
   SAY @315
   IF ~~ THEN GOTO U4WakeUpEnd
END

IF ~~ U4WakeUp4
   SAY @316
   IF ~~ THEN GOTO U4WakeUpEnd
END

IF ~~ U4BloodyEnd
   SAY @260
   ++ @317 + UAsleep
   ++ @318 + UAsleep
   ++ @319 + UAsleep
   ++ @320 + UAsleep
   ++ @321 + UAsleep
END


IF ~~ U4InstinctsEnd
   SAY @322
   ++ @323 + UAsleep
   ++ @324 + UAsleep
   ++ @325 + UAsleep
   ++ @326 + UAsleep
   ++ @327 + UAsleep
END

IF ~~ U4SurviveEnd
   SAY @328
   ++ @329 + UAsleep
   ++ @330 + UAsleep
   ++ @331 + UAsleep
   ++ @332 + UAsleep
   ++ @333 + UAsleep
END

IF ~~ U4BetterPlaceEnd
   SAY @260
   ++ @334 + UAsleep
   ++ @335 + UAsleep
   ++ @336 + UAsleep
   ++ @337 + UAsleep
   ++ @338 + UAsleep
END

IF ~~ U4CatastropheEnd
   SAY @260
   ++ @339 + UAsleep
   ++ @340 + UAsleep
   ++ @341 + UAsleep
   ++ @342 + UAsleep
   ++ @343 + UAsleep
END

IF ~~ U4OurWayEnd
   SAY @260
   ++ @334 + UAsleep
   ++ @335 + UAsleep
   ++ @336 + UAsleep
   ++ @344 + UAsleep
   ++ @345 + UAsleep
END

IF ~~ U4NoPlansEnd
   SAY @328
   ++ @346 + UAsleep
   ++ @347 + UAsleep
   ++ @348 + UAsleep
   ++ @349 + UAsleep
   ++ @350 + UAsleep
END

IF ~~ U4MortalEnd
   SAY @328
   ++ @351 + UAsleep
   ++ @352 + UAsleep
   ++ @353 + UAsleep
   ++ @354 + UAsleep
   ++ @355 + UAsleep
   ++ @356 + UAsleep
END

IF ~~ U4IntertwinedEnd
   SAY @357
   ++ @358 + UAsleep
   ++ @359 + UAsleep
   ++ @360 + UAsleep
   ++ @361 + UAsleep
   ++ @362 + UAsleep
END

IF ~~ U4GiveAllEnd
   SAY @260
   ++ @363 + UAsleep
   ++ @364 + UAsleep
   ++ @365 + UAsleep
   ++ @366 + UAsleep
   ++ @367 + UAsleep
END

IF ~~ UDisconnectEnd
   SAY @260
   ++ @368 + UAsleep
   ++ @369 + UAsleep
   ++ @370 + UAsleep
   ++ @371 + UAsleep
   ++ @372 + UAsleep
END

IF ~~ U4HeritageEnd
   SAY @260
   ++ @373 + UAsleep
   ++ @374 + UAsleep
   ++ @375 + UAsleep
   ++ @376 + UAsleep
   ++ @377 + UAsleep
   ++ @378 + UAsleep
   ++ @379 + UAsleep
END

IF ~~ U4KillGuiltEnd
   SAY @260
   ++ @380 + UAsleep
   ++ @318 + UAsleep
   ++ @319 + UAsleep
   ++ @381 + UAsleep
   ++ @382 + UAsleep
END

IF ~~ U4LetGoEnd
   SAY @260
   ++ @383 + UAsleep
   ++ @384 + UAsleep
   ++ @385 + UAsleep
   ++ @386 + UAsleep
   ++ @387 + UAsleep
END

IF ~~ U4DutyEnd
   SAY @260
   ++ @388 + UAsleep
   ++ @364 + UAsleep
   ++ @389 + UAsleep
   ++ @366 + UAsleep
   ++ @390 + UAsleep
END

IF ~~ UInsecureEnd
   SAY @260
   ++ @391 + UAsleep
   ++ @392 + UAsleep
   ++ @393 + UAsleep
   ++ @394 + UAsleep
   ++ @395 + UAsleep
END

IF ~~ UWrongDecisionEnd
   SAY @260
   ++ @391 + UAsleep
   ++ @396 + UAsleep
   ++ @397 + UAsleep
   ++ @398 + UAsleep
   ++ @399 + UAsleep
   ++ @400 + UAsleep
END

IF ~~ UDifferentEnd
   SAY @260
   ++ @401 + UAsleep
   ++ @402 + UAsleep
   ++ @403 + UAsleep
   ++ @404 + UAsleep
   ++ @405 DO ~SetGlobal("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + UAsleep
END

IF ~~ UChokeEnd
   SAY @260
   ++ @391 + UAsleep
   ++ @406 + UAsleep
   ++ @398 + UAsleep
   ++ @407 + UAsleep
   ++ @408 + UAsleep
END

IF ~~ U4MarkedEnd
   SAY @260
   ++ @409 + UAsleep
   ++ @410 + UAsleep
   ++ @370 + UAsleep
   ++ @411 + UAsleep
   ++ @412 + UAsleep
END

IF ~~ U4PlanesEnd
   SAY @260
   ++ @413 + UAsleep
   ++ @414 + UAsleep
   ++ @415 + UAsleep
   ++ @416 + UAsleep
   ++ @183 + UAsleep
END

IF ~~ U4HuntedEnd
   SAY @260
   ++ @417 + UAsleep
   ++ @370 + UAsleep
   ++ @418 + UAsleep
   ++ @419 + UAsleep
   ++ @371 + UAsleep
END

IF ~~ U4ZakharaEnd
   SAY @260
   ++ @420 + UAsleep
   ++ @421 + UAsleep
   ++ @422 + UAsleep
   ++ @423 + UAsleep
   ++ @424 + UAsleep
END


//////////////

IF ~~ U5
 SAY @425
 ++ @426 + U4
 ++ @427 + U3
 ++ @428 + U2
 ++ @9 + U1
END

IF ~~ UAsleep
   SAY @429
   ++ @430 + UAsleep3
   ++ @431 + UAsleep3
   ++ @432 + UAsleep2
   ++ @433 + UAsleep1
END

IF ~~ UAsleep1
   SAY @434
   = @435
   ++ @436 + UAsleep1b
   ++ @437 + UAsleep1b
   ++ @438 + UAsleep1a
END

IF ~~ UAsleep1a
   SAY @439
   = @440
   IF ~~ THEN DO ~RestParty()~ EXIT
END

IF ~~ UAsleep1b
   SAY @441
   IF ~~ THEN DO ~RestParty()~ EXIT
END

IF ~~ UAsleep2
   SAY @442
   ++ @430 + UAsleep3
   ++ @431 + UAsleep3
   ++ @433 + UAsleep1
END

IF ~~ UAsleep3
   SAY @443
   IF ~~ THEN DO ~RestParty()~ EXIT
END
END





