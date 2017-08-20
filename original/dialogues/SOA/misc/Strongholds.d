
/* Should trigger if the player has a stronghold BEFORE Imoen joins the party in Spellhold */

/* STRONGHOLD COMMENT - RADIANT HEART */

// *** Radiant Heart ***

APPEND IMOEN2J
	IF ~Global("MRStrongholdTalkPal","GLOBAL",1)~ THEN BEGIN MRPalStrong1
		SAY @0
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkPal","GLOBAL",2)~ GOTO MRPalStrong2
	END

	IF ~~ THEN BEGIN MRPalStrong2
		SAY @1
		=
		@2
		++ @3 GOTO MRPalStrongCor1
		++ @4 GOTO MRPalStrongCor1
		++ @5 GOTO MRPalStrongCor2
		++ @6 GOTO MRPalStrongStuffy
		++ @7 GOTO MRPalStrongEnd
	END

	IF ~~ THEN BEGIN MRPalStrongEnd
		SAY @8
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRPalStrongStuffy
		SAY @9
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @10 GOTO MRPalStrongSexy1
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @10 GOTO MRPalStrongSexy2
		++ @11 GOTO MRPalStrongSexy1
		++ @12 GOTO MRPalStrongStuffy1
		IF ~Gender(Player1,MALE)~ THEN REPLY @13 GOTO MRPalStrongStuffy2M
		++ @14 GOTO MRPalStrongSexy1
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @13 GOTO MRPalStrongStuffy2F
	END

	IF ~~ THEN BEGIN MRPalStrongStuffy1
		SAY @15
		=
		@16
		=
		@17
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRPalStrongStuffy2M
		SAY @18
		=
		@19
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRPalStrongStuffy2F
		SAY @18
		=
		@20
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~EXIT
	END


	IF ~~ THEN BEGIN MRPalStrongSexy1
		SAY @21
		IF ~~ THEN GOTO MRPalStrongCor1
	END

	IF ~~ THEN BEGIN MRPalStrongSexy2
		SAY @22
		=
		@23
		=
		@24
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRPalStrongCor1
		SAY @25
		++ @26 GOTO MRPalStrongCor2
		++ @27 GOTO MRPalStrongCor3
		++ @7 GOTO MRPalStrongEnd
		++ @28 GOTO MRPalStrongProud
	END

	IF ~~ THEN BEGIN MRPalStrongProud
		SAY @29
		IF ~~ THEN GOTO MRPalStrongCor2
	END

	IF ~~ THEN BEGIN MRPalStrongCor3
		SAY @30
		IF ~~ THEN GOTO MRPalStrongCor2
	END

	IF ~~ THEN BEGIN MRPalStrongCor2
		SAY @31
		=
		@32
		++ @33 GOTO MRPalStrongCor4
		++ @34 GOTO MRPalStrongCor4
	END

	IF ~~ THEN BEGIN MRPalStrongCor4
		SAY @35
		=
		@36
		IF ~Global("ImoenRomanceActive","GLOBAL",2) ~ THEN GOTO MRPalStrongCor5
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN GOTO MRPalStrongCor55
	END

	IF ~~ THEN BEGIN MRPalStrongCor5
		SAY @37
		=
		@38
		=
		@39
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRPalStrongCor55
		SAY @40
		=
		@41
		IF ~~ THEN EXIT
	END
END

/* STRONGHOLD COMMENTS - TEMPLES */

// 0901 Temple of Helm
// 0902 Temple of Lathander
// 0904 Temple of Talos


APPEND IMOEN2J
	IF ~Global("MRStrongholdTalkCler","GLOBAL",1)~ THEN BEGIN MRCleStrong
		SAY @42
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkCler","GLOBAL",2)~ GOTO MRCleStrong2
	END

	IF ~~ THEN BEGIN MRCleStrong2
		SAY @43
		IF ~AreaCheck("AR0901")~ THEN GOTO MRCleStrongHelm
		IF ~AreaCheck("AR0902")~ THEN GOTO MRCleStrongLath
		IF ~AreaCheck("AR0904")~ THEN GOTO MRCleStrongTal
	END

	IF ~~ THEN BEGIN MRCleStrongHelm
		SAY @44
		IF ~~ THEN GOTO MRCleStrong3
	END

	IF ~~ THEN BEGIN MRCleStrongLath
		SAY @45
		IF ~~ THEN GOTO MRCleStrong3
	END

	IF ~~ THEN BEGIN MRCleStrongTal
		SAY @46
		IF ~~ THEN GOTO MRCleStrong3
	END

	IF ~~ THEN BEGIN MRCleStrong3
		SAY @47
		++ @48 GOTO MRCleStrongNeu
		++ @49 GOTO MRCleStrongNeu
		++ @50 GOTO MRCleStrongNeu
		++ @51 GOTO MRCleStrongConvert
		++ @52 GOTO MRCleStrongConvert
		++ @53 GOTO MRCleStrongHyp
	END

	IF ~~ THEN BEGIN MRCleStrongHyp
		SAY @54
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRCleStrongConvert
		SAY @55
		IF ~~ THEN GOTO MRCleStrong4
	END

	IF ~~ THEN BEGIN MRCleStrongNeu
		SAY @56
		IF ~~ THEN GOTO MRCleStrong4
	END

	IF ~~ THEN BEGIN MRCleStrong4
		SAY @57
		=
		@58
		=
		~You leave them alone, they leave you alone. We don't bother each other, y'see?~
		~Oh well... let's get outta here. All these fanatics make me sick-- uh, I mean... I want some fresh air.~
		IF ~~ THEN EXIT
	END
END

/* STRONGHOLD COMMENT - THIEF */


APPEND IMOEN2J
	IF ~Global("MRStrongholdTalkThie","GLOBAL",1)~ THEN BEGIN MRThiefStrong
		SAY @60
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkThie","GLOBAL",2)~ GOTO MRThiefStrong1
	END

	IF ~~ THEN BEGIN MRThiefStrong1
		SAY @61
		=
		@62
		IF ~Gender(Player1,MALE)~ THEN REPLY @63 GOTO MRThiefStrongGood
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @64 GOTO MRThiefStrongGood
		++ @65 GOTO MRThiefStrongExit
		++ @66 GOTO MRThiefStrongMoney
		++ @67 GOTO MRThiefStrongPreExit
		++ @68 GOTO MRThiefStrongRedeem
		++ @69 GOTO MRThiefStrongBad
	END

	IF ~~ THEN BEGIN MRThiefStrongExit
		SAY @70
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRThiefStrongBad
		SAY @71
		=
		@72
		++ @73 GOTO MRThiefStrongProud
		++ @74 GOTO MRThiefStrongPreExit
		++ @75 GOTO MRThiefStrongPreExit
	END

	IF ~~ THEN BEGIN MRThiefStrongRedeem
		SAY @76
		++ @73 GOTO MRThiefStrongProud
		++ @77 GOTO MRThiefStrongExit
		++ @75 GOTO MRThiefStrongPreExit
		++ @74 GOTO MRThiefStrongPreExit
	END

	IF ~~ THEN BEGIN MRThiefStrongPreExit
		SAY @78
		=
		@79
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRThiefStrongMoney
		SAY @80
		++ @81 GOTO MRThiefStrongProud
		++ @77 GOTO MRThiefStrongExit
		++ @75 GOTO MRThiefStrongPreExit
		++ @74 GOTO MRThiefStrongPreExit
	END

	IF ~~ THEN BEGIN MRThiefStrongGood
		SAY @82
		++ @81 GOTO MRThiefStrongProud
		++ @77 GOTO MRThiefStrongExit
		++ @75 GOTO MRThiefStrongPreExit
		++ @74 GOTO MRThiefStrongPreExit
	END

	IF ~~ THEN BEGIN MRThiefStrongProud
		SAY @83
		=
		@84
		=
		@85
		IF ~~ THEN EXIT
	END
END

/* STRONGHOLD COMMENT - FIGHTER-TYPES */

APPEND IMOEN2J
	IF ~Global("MRStrongholdTalkFigh","GLOBAL",1)~ THEN BEGIN MRFightStrong
		SAY @86
		=
		@87
		=
		@88
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkFigh","GLOBAL",2)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("ImArnise")~ EXIT
	END

	IF WEIGHT #666
	~Global("MRStrongholdTalk","GLOBAL",3)~ THEN BEGIN MRFightStrong2
		SAY @89
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalk","GLOBAL",4)~ GOTO MRFightStrong3
	END

	IF ~~ THEN BEGIN MRFightStrong3
		SAY @90
		IF ~InParty("Nalia")~THEN EXTERN NALIAJ MRFightStrong3
		IF ~!InParty("Nalia")~ THEN GOTO MRFightStrong4
	END

	IF ~~ THEN BEGIN MRFightStrong4
		SAY @91
		=
		@92
		=
		@93
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRFightStrong5
		SAY @94
		=
		@95
		IF ~~ THEN EXTERN NALIAJ MRFightStrong5
	END

	IF ~~ THEN BEGIN MRFightStrong6
		SAY @96
		IF ~~ THEN EXIT
	END
END

APPEND NALIAJ
	IF ~~ THEN BEGIN MRFightStrong3
	SAY @97
	IF ~~ THEN EXTERN IMOEN2J MRFightStrong5
	END

	IF ~~ THEN BEGIN MRFightStrong5
		SAY @98
		IF ~~ THEN EXTERN IMOEN2J MRFightStrong6
	END
END


/* STRONGHOLD COMMENT - UMAR HILLS */

// *** Umar hills ***

APPEND IMOEN2J
	IF WEIGHT #666
	~Global("MRStrongholdTalkUmar","GLOBAL",1)~ THEN BEGIN MRStrongUm
	SAY @99
	IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkUmar","GLOBAL",2)~ GOTO MRStrongUm1
	END

	IF ~~ THEN BEGIN MRStrongUm1
		SAY @100
		=
		@101
		++ @102 GOTO MRStrongUmCabin
		++ @103 GOTO MRStrongUmWhy
		++ @104 GOTO MRStrongUmExit1
		++ @105 GOTO MRStrongUmExit2
	END

	IF ~~ THEN BEGIN MRStrongUmExit2
		SAY @106
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmExit1
		SAY @107
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmWhy
		SAY @108
		++ @102 GOTO MRStrongUmCabin
		++ @104 GOTO MRStrongUmExit1
		++ @109 GOTO MRStrongUmExit2
	END

	IF ~~ THEN BEGIN MRStrongUmCabin
		SAY @110
		IF ~~ THEN EXIT
	END

	IF ~Global("MRStrongholdTalkRan","GLOBAL",3)~ THEN BEGIN MRStrongUmCabin1
		SAY @111
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkRan","GLOBAL",4)~ GOTO MRStrongUmCabin2
	END

	IF ~~ THEN BEGIN MRStrongUmCabin2
		SAY @112
		=
		@113
		=
		@114
		=
		@115
		++ @116 GOTO MRStrongUmCould
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @117 GOTO MRStrongUmTogether
		++ @118 GOTO MRStrongUmShare
		++ @119 GOTO MRStrongUmShare
		++ @120 GOTO MRStrongUmSettle
		++ @121 GOTO MRStrongUmUnfinished
	END

	IF ~~ THEN BEGIN MRStrongUmUnfinished
		SAY @122
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmSettle
		SAY @123
		=
		@124
		=
		@125
		=
		@126
		=
		@127
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmShare
		SAY @128
		=
		@129
		=
		@130
		=
		@126
		=
		@131
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmTogether
		SAY @132
		=
		@133
		=
		@134
		=
		@135
		=
		@131
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmCould
		SAY @136
		++ @137 GOTO MRStrongUmGrand
		++ @138 GOTO MRStrongUmBored
		++ @139 GOTO MRStrongUmDumb
		++ @140 GOTO MRStrongUmRude
	END

	IF ~~ THEN BEGIN MRStrongUmGrand
		SAY @141
		=
		@142
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmBored
		SAY @143
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmDumb
		SAY @144
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmRude
		SAY @145
		=
		@146
		IF ~~ THEN EXIT
	END

END

/* STRONGHOLD COMMENT - PLAYHOUSE */

APPEND IMOEN2J
	IF WEIGHT #666
	~Global("MRStrongholdTalkBard","GLOBAL",1)~ THEN BEGIN MRStrongPlay
		SAY @147
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkBard","GLOBAL",2) ~ GOTO MRStrongPlay1
	END

	IF ~~ THEN BEGIN MRStrongPlay1
		SAY @148
		++ @149 GOTO MRStrongPlayStory
		++ @150 GOTO MRStrongPlay3
		++ @151 GOTO MRStrongPlayPrepare
		++ @152 GOTO MRStrongPlayRude
		++ @153 GOTO MRStrongPlayRude
	END

	IF ~~ THEN BEGIN MRStrongPlayRude
		SAY @154
		=
		@155
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongPlayPrepare
		SAY @156
		IF ~~ THEN GOTO MRStrongPlay2
	END

	IF ~~ THEN BEGIN MRStrongPlay3
		SAY @157
		IF ~~ THEN GOTO MRStrongPlay2
	END

	IF ~~ THEN BEGIN MRStrongPlayStory
		SAY @158
		=
		@159
		++ @160 GOTO MRStrongPlayStory2
		++ @161 GOTO MRStrongPlayStory3
		++ @162 GOTO MRStrongPlayRude
		++ @163 GOTO MRStrongPlayRude
	END

	IF ~~ THEN BEGIN MRStrongPlayStory3
		SAY @164
		IF ~~ THEN GOTO MRStrongPlay2
	END

	IF ~~ THEN BEGIN MRStrongPlayStory2
		SAY @165
		IF ~~ THEN GOTO MRStrongPlay2
	END

	IF ~~ THEN BEGIN MRStrongPlay2
		SAY @166
		=
		@167
		++ @168 GOTO MRStrongPlayPlay
		++ @169 GOTO MRStrongPlayPlay
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @170 GOTO MRStrongPlayKiss
		++ @171 EXIT
		++ @172 GOTO MRStrongPlayRude
	END

	IF ~~ THEN BEGIN MRStrongPlayKiss
		SAY @173
		=
		@174
		++ @175 GOTO MRStrongPlayAsk
		++ @176 GOTO MRStrongPlayCheese
		++ @177 EXIT
		++ @178 GOTO MRStrongPlayHint
	END

	IF ~~ THEN BEGIN MRStrongPlayHint
		SAY @179
		=
		@180
		=
		@181
		=
		@182
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongPlayCheese
		SAY @183
		=
		@184
		=
		@185
		++ @186 GOTO MRStrongPlayAsk
		++ @187 GOTO MRStrongPlayHint
		++ @188 EXIT
		++ @189 GOTO MRStrongPlayHint
	END

	IF ~~ THEN BEGIN MRStrongPlayAsk
		SAY @190
		++ @191 GOTO MRStrongPlayPlay
		++ @192 GOTO MRStrongPlayPlay
		++ @193 GOTO MRStrongPlayChicken
	END

	IF ~~ THEN BEGIN MRStrongPlayChicken
		SAY @194
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongPlayPlay
		SAY @195
		IF ~!NumInPartyGT(2)~ THEN REPLY @196 GOTO MRStrongPlayPlayed
		IF ~NumInPartyGT(2)~ THEN REPLY @197 GOTO MRStrongPlayPlayed
		++ @198 GOTO MRStrongPlayPlayChicken
		++ @199 GOTO MRStrongPlayPay
		++ @200 GOTO MRStrongPlayPlayMad
		++ @201 GOTO MRStrongPlayReverse
		++ @202 GOTO MRStrongPlayPlayHave
		++ @203 GOTO MRStrongPlayReverse
	END

	IF ~~ THEN BEGIN MRStrongPlayReverse
		SAY @204
		=
		@205
		++ @206 GOTO MRStrongPlayPlayFinal
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayFinal
		SAY @209
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayHave
		SAY @210
		++ @206 GOTO MRStrongPlayPlayFinal
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayMad
		SAY @211
		++ @206 GOTO MRStrongPlayPlayFinal
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPay
		SAY @212
		=
		@205
		++ @206 GOTO MRStrongPlayPlayFinal
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayChicken
		SAY @213
		++ @206 GOTO MRStrongPlayPlayFinal
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayed
		SAY @214
		=
		@215
		++ @216 GOTO MRStrongPlayPlayFinal2
		++ @217 GOTO MRStrongPlayNotMe
		++ @218 GOTO MRStrongPlayPay
		++ @219 GOTO MRStrongPlayPlayChicken
		++ @220 GOTO MRStrongPlayPlayPromise
		++ @201 GOTO MRStrongPlayReverse
		++ @202 GOTO MRStrongPlayPlayMad
		++ @203 GOTO MRStrongPlayReverse
	END

	IF ~~ THEN BEGIN MRStrongPlayNotMe
		SAY @221
		++ @206 GOTO MRStrongPlayPlayFinal
		++ @222 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayFinal2
		SAY @223
		++ @206 GOTO MRStrongPlayPlayFinal
		++ @222 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
	END

		IF ~~ THEN BEGIN MRStrongPlayPlayPromise        //// The change to this state was intentional. It just didn't flow naturally, from clammy and annoyed back to romantic.

		SAY @224
		=
		@225
		IF ~~ THEN EXIT
       END
END


/* STRONGHOLD COMMENT - DRUID GROVE */

APPEND IMOEN2J
	IF WEIGHT #666
	~Global("MRStrongholdTalkDrui","GLOBAL",1)~ THEN BEGIN MRStrongGrove
		SAY @226
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkDrui","GLOBAL",2)~ GOTO MRStrongGrove1
	END

	IF ~~ THEN BEGIN MRStrongGrove1
		SAY @227
		=
		@228
		=
		@229
		++ @230 GOTO MRStrongGroveStory
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @231 GOTO MRStrongGroveSex
		++ @232 GOTO MRStrongGroveLong
		++ @233 GOTO MRStrongGroveEvil
		++ @234 GOTO MRStrongGroveExit
		++ @235 GOTO MRStrongGroveExit
	END

	IF ~~ THEN BEGIN MRStrongGroveExit
		SAY @236
		=
		@237
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveEvil
		SAY @238
		=
		@239
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveLong
		SAY @240
		=
		@239
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveSex
		SAY ~I can do better than that. (Imoen approaches you and wraps her arms around your waist, pulling you close. Her open mouth beckons for yours and, as she kisses you, her tongue dashes in and out of your mouth.)~ [ MRImRom6 ]
		IF ~~ THEN GOTO MRStrongGroveSex1
	END

	IF ~~ THEN BEGIN MRStrongGroveStory
		SAY @242
		=
		@243
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveSex2
		SAY @244
		=
		@245
		++ @246 GOTO MRStrongGroveSex3
		++ @247 GOTO MRStrongGroveSex4
		++ @248 GOTO MRStrongGroveSex4
		++ @249 GOTO MRStrongGroveSex4
	END

	IF ~~ THEN BEGIN MRStrongGroveSex3
		SAY @250
		IF ~~ THEN GOTO MRStrongGroveSex4
	END

	IF ~~ THEN BEGIN MRStrongGroveSex4
		SAY @251
		IF ~~ THEN GOTO MRStrongGroveSex5
	END

	IF ~~ THEN BEGIN MRStrongGroveSex5
		SAY @252
		++ @253 GOTO MRStrongGroveSexAccept
		++ @254 GOTO MRStrongGroveSexAccept
		++ @255 GOTO MRStrongGroveSexMaybe
		++ @256 GOTO MRStrongGroveSexAccept
		++ @257 GOTO MRStrongGroveSexSlut
		++ @258 GOTO MRStrongGroveSexNo
		++ @259 GOTO MRStrongGroveSexHarlot2
	END

 IF ~~ THEN BEGIN MRStrongGroveSexSlut
 SAY @260
 = @261
 = @262
 IF ~~ THEN EXIT
 END

	IF ~~ THEN BEGIN MRStrongGroveSexHarlot2
		SAY @263
		=
		@264
		=
		@265
		=
		@266
		IF ~!IsValidForPartyDialog("Aerie")~ THEN GOTO MRStrongGroveSexHarlot2chain
		IF ~IsValidForPartyDialog("Aerie")~THEN EXTERN AERIEJ MRStrongGroveSexHarlot2achain
	END

	IF ~~ THEN BEGIN MRStrongGroveSexNo
		SAY @267
		++ @268 GOTO MRStrongGroveSexAccept
		++ @269 GOTO MRStrongGroveSexNo2
		++ @270 GOTO MRStrongGroveSexHarlot2
	END

	IF ~~ THEN BEGIN MRStrongGroveSexNo1
		SAY @271
		++ @272 GOTO MRStrongGroveSexAccept
		++ @273 GOTO MRStrongGroveSexNo2
		++ @274 GOTO MRStrongGroveSexHarlot2
	END

	IF ~~ THEN BEGIN MRStrongGroveSexNo2
		SAY @275
		=
		@276
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveSexAccept
		SAY @277
		IF ~~ THEN GOTO MRStrongGroveScore
	END

	IF ~~ THEN BEGIN MRStrongGroveSexMaybe
		SAY @278
		IF ~~ THEN GOTO MRStrongGroveScore
	END

	IF ~~ THEN BEGIN MRStrongGroveScore
		SAY @279
		IF ~~ THEN GOTO MRStrongGroveScorechain
	END

	IF ~~ THEN BEGIN MRStrongGroveScore2
		SAY @280
		=
		@281
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkDrui","GLOBAL",3)
		StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~Global("MRStrongholdTalkDrui","GLOBAL",4)~ THEN BEGIN MRStrongGroveAfter
		SAY @396 [ MRImRom5 ]
	IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkDrui","GLOBAL",5) ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRStrongGroveAfterExtern
	END

		IF ~~ THEN BEGIN MRStrongGroveAfterExtern
		SAY ~<CHARNAME>...~ [ MRImRom5 ]
		IF ~~ THEN EXTERN PLAYER1 MRStrongGroveAfter2
	END

	IF ~~ THEN BEGIN MRStrongGroveAfter3
		SAY @284
		=
		@285
		=
		@286
		++ @287 GOTO MRStrongGroveEnjoy
		++ @288 GOTO MRStrongGroveAfterNeeds
		++ @289 GOTO MRStrongGroveAfterGreat
		++ @290 GOTO MRStrongGroveAfterWhy
		++ @291 GOTO MRStrongGroveAfterIntense
		++ @292 GOTO MRStrongGroveAfterDis
		++ @293 GOTO MRStrongGroveAfterHarlot1
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterHarlot1
		SAY @294
		=
		@295
		=
		@296
		=
		@297
		IF ~~ THEN DO ~ SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterDis
		SAY @298
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterIntense
		SAY @299
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterWhy
		SAY @300
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterGreat
		SAY @301
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterNeeds
		SAY @302
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveEnjoy
		SAY @303
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterNext
		SAY @304
		=
		@305
		=
		@306
		++ @307 GOTO MRStrongGroveAfterBugs
		++ @308 GOTO MRStrongGroveAfterBugs
		++ @309 GOTO MRStrongGroveAfterGrow
		++ @310 GOTO MRStrongGroveAfterNaughty
		++ @311 GOTO MRStrongGroveAfterLetGo
		++ @312 GOTO MRStrongGroveAfterCrass
	END

 IF ~~ THEN BEGIN MRStrongGroveAfterLetGo
 SAY @313
 = @314
 = @315
 IF ~~ THEN EXIT
 END


	IF ~~ THEN BEGIN MRStrongGroveAfterCrass
		SAY @316
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterNaughty
		SAY @317
		IF ~~ THEN GOTO MRStrongGroveAfterLast
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterGrow
		SAY @318
		IF ~~ THEN GOTO MRStrongGroveAfterLast
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterBugs
		SAY @319
		=
		@320
		++ @321 GOTO MRStrongGroveAfterBugsLast
		++ @322 GOTO MRStrongGroveAfterGrow
		++ @323 GOTO MRStrongGroveAfterNaughty
		++ @324 GOTO MRStrongGroveAfterLetGo
		++ @325 GOTO MRStrongGroveAfterCrass
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterLast
		SAY @326
		=
		@327
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterBugsLast
		SAY @328
 = @329
		IF ~~ THEN EXIT
	END
END

APPEND PLAYER1
	IF ~Global("MRGroveNextMorning","GLOBAL",1)~ THEN BEGIN MRStrongGroveAfter2
	SAY @330
	IF ~~ THEN EXTERN IMOEN2J MRStrongGroveAfter3
	END
END


CHAIN IMOEN2J MRStrongGroveScorechain
@331
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @332
== EDWINJ IF ~IsValidForPartyDialog("Edwin")~ THEN @333
== NALIAJ IF ~IsValidForPartyDialog("Nalia") NumInPartyGT(3)~ THEN @334
== NALIAJ IF ~IsValidForPartyDialog("Nalia") !NumInPartyGT(3)~ THEN @335
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @336
== VALYGARJ IF ~IsValidForPartyDialog("Valygar")~ THEN @337
== KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @338
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @339
END IMOEN2J MRStrongGroveScore2

APPEND AERIEJ
	IF ~~ THEN BEGIN MRStrongGroveSexHarlot2achain
	SAY @340
	IF ~~ THEN DO ~LeaveParty()
	EscapeArea()~ EXTERN IMOEN2J MRStrongGroveSexHarlot2chain
	END
END


CHAIN IMOEN2J MRStrongGroveSexHarlot2chain
@341
== NALIAJ IF ~IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Aerie")~ THEN @342
==NALIAJ IF ~IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN @343
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @344
== VICONIJ IF ~IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Jaheira")~ THEN @345
== VICONIJ IF ~IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Jaheira")~ THEN @346
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @347
END PLAYER1 MRStrongGroveSexHarlot3

APPEND PLAYER1
	IF ~~ THEN BEGIN MRStrongGroveSexHarlot3
	SAY @348
	IF ~~ THEN DO ~ActionOverride("Imoen2",LeaveParty())
		ReputationInc(-2) ActionOverride(Player1,ApplySpellRES("SPMRACNE",Player1))
		ActionOverride("Imoen2",EscapeArea())~ EXIT
	END
END

CHAIN IMOEN2J MRStrongGroveSex1
@349
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @350
== AERIEJ IF ~IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Jaheira")~ THEN @351
== AERIEJ IF ~IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Jaheira")~ THEN @352
== NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @353
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @354
== VICONIJ IF ~IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Korgan")~ THEN @355
== VICONIJ IF ~IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan")~ THEN @356
END IMOEN2J MRStrongGroveSex2


/* STRONGHOLD COMMENT - PLANAR SPHERE */

APPEND IMOEN2J
	IF WEIGHT #666
	~Global("MRStrongholdTalkMage","GLOBAL",1)~ THEN BEGIN MRStrongSphere
		SAY @357
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkMage","GLOBAL",2)~ GOTO MRStrongSphere1
	END

	IF ~~ THEN BEGIN MRStrongSphere1
		SAY @358
		++ @359 GOTO MRStrongSphereHome
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @360 GOTO MRStrongSphereHome
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @361 GOTO MRStrongSphereHome
		++ @362 GOTO MRStrongSphereHome
		++ @363 GOTO MRStrongSphereCont
		++ @364 GOTO MRStrongSphereStrange
		++ @365 GOTO MRStrongSphereJerk
	END

	IF ~~ THEN BEGIN MRStrongSphereJerk
		SAY @366
		=
		@367
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongSphereStrange
		SAY @368
		++ @369 GOTO MRStrongSphereCont
		++ @370 GOTO MRStrongSphereStrange1
		++ @371 GOTO MRStrongSphereStrange2
		++ @372 GOTO MRStrongSphereJerk
	END

	IF ~~ THEN BEGIN MRStrongSphereStrange1
		SAY @373
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongSphereStrange2
		SAY @374
		=
		@375
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongSphereHome
		SAY @376
		IF ~~ GOTO MRStrongSphereCont
	END

	IF ~~ THEN BEGIN MRStrongSphereCont
		SAY @377
		++ @378 GOTO MRStrongSphereBroken
		++ @379 GOTO MRStrongSphereJerk
		++ @380 GOTO MRStrongSphereIce
		++ @381 GOTO MRStrongSphereNothing
		IF ~CheckStatLT(Player1,7,WIS)
			CheckStatGT(Player1,16,CHR)
			CheckStatGT(Player1,14,INT)
			Alignment(Player1,CHAOTIC_NEUTRAL)~ THEN REPLY @382 GOTO MRStrongSphereEE
	END

	IF ~~ THEN BEGIN MRStrongSphereEE
		SAY @383
		= @384
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongSphereNothing
		SAY @385
		IF ~~ THEN GOTO MRStrongSphereNext
	END

	IF ~~ THEN BEGIN MRStrongSphereIce
		SAY @386
		IF ~~ THEN GOTO MRStrongSphereNext
	END

	IF ~~ THEN BEGIN MRStrongSphereBroken
		SAY @387
		IF ~~ THEN GOTO MRStrongSphereNext
	END

	IF ~~ THEN BEGIN MRStrongSphereNext
		SAY @388
		=
		@389
		IF ~~ THEN DO ~SetGlobal("MRGolemOrder","GLOBAL",1)~ EXIT
	END
END

ADD_TRANS_TRIGGER OBSGOL01 8 ~OR(3) !IsValidForPartyDialog("Imoen2") Global("MRGolemOrder","GLOBAL",2) Global("MRGolemOrder","GLOBAL",3)~ DO 0

EXTEND_BOTTOM OBSGOL01 8
 IF ~IsValidForPartyDialog("Imoen2")
		Global("MRGolemOrder","GLOBAL",1)~THEN DO ~SetGlobal("MRGolemOrder","GLOBAL",2)~ EXTERN IMOEN2J MRPSMRGol
END

ADD_STATE_TRIGGER OBSGOL01 4
	~!Global("MRGolemOrder","GLOBAL",2)~

CHAIN IMOEN2J MRPSMRGol
 @390
 ==OBSGOL01 @391
 ==IMOEN2J @392
 ==OBSGOL01 @391
 ==IMOEN2J @393
 ==OBSGOL01 @394
 ==IMOEN2J @395
==OBSGOL01 @396
==OBSGOL01 @397
==IMOEN2J @398
==OBSGOL01 @396
==OBSGOL01 @399
==IMOEN2J @400
==OBSGOL01 @401
==IMOEN2J@402
EXIT

APPEND OBSGOL01
	IF ~Global("MRGolemOrder","GLOBAL",2)~ THEN BEGIN MRGolemObey
		SAY @401
		IF ~!IsValidForPartyDialog("Imoen2")~ THEN EXIT
		IF ~IsValidForPartyDialog("Imoen2")~ THEN REPLY @403 EXTERN IMOEN2J MRStrongSphereGolemTwisted
	END

	IF ~~ THEN BEGIN PSMRgolt3b
		SAY @404
		IF ~~ THEN DO ~SetGlobal("MRGolemOrder","GLOBAL",3)~ GOTO 4
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRStrongSphereGolemTwisted
		SAY @405
		++ @406 GOTO MRStrongSphereGolemRestore
		++ @407 EXIT
	END

	IF ~~ THEN BEGIN MRStrongSphereGolemRestore
		SAY @408
		= @409
		IF ~~ THEN EXTERN OBSGOL01 PSMRgolt3b
	END
END




