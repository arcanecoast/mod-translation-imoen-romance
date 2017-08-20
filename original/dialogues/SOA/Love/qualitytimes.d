APPEND IMOEN2J
	IF ~~ THEN BEGIN MRLT0
		SAY ~(Imoen drifts away from you and walks on in silence.)~ [ MRImRom2 ]
		=
		@1
		IF ~~ THEN REPLY @2 GOTO MRLT0-Approach
		IF ~~ THEN REPLY @3 EXIT
		IF ~~ THEN REPLY @4 GOTO MRLT0-Pebble
	END

	IF ~~ THEN BEGIN MRLT0-Approach
		SAY @5
		=
		@6
		++ @7 GOTO MRLT0-Approachbird1
		++ @8 GOTO MRLT0-Approachbird2
		++ @9 GOTO MRLT0-ApproachAlert
		++ @10 GOTO MRLT0-Approachgoddess
	END

	IF ~~ THEN BEGIN MRLT0-Approachbird1
		SAY @11
		IF ~~ THEN GOTO MRLT0-Approach1
	END

	IF ~~ THEN BEGIN MRLT0-Approachbird2
		SAY @12
		IF ~~ THEN GOTO MRLT0-Approach1
	END

	IF ~~ THEN BEGIN MRLT0-Approachgoddess
		SAY @13
		=
		@14
		IF ~~ THEN GOTO MRLT0-Approach1
	END

	IF ~~ THEN BEGIN MRLT0-Approach1
		SAY @15
		++ @16 GOTO MRLT0-ApproachSex
		++ @17 GOTO MRLT0-ApproachArms
		IF ~IsValidForPartyDialog("Aerie")~ THEN REPLY @18 GOTO MRLT0-ApproachAerie
		IF ~!IsValidForPartyDialog("Aerie")~ THEN REPLY @19 GOTO MRLT0-ApproachFly
		++ @20 GOTO MRLT0-ApproachAlert
	END

	IF ~~ THEN BEGIN MRLT0-ApproachSex
		SAY @21
		= @22
		=
		@23
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT0-ApproachArms
		SAY @24
		= @25
		= @26
		= @27
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT0-ApproachAerie
		SAY @28
		= @29
		= @30
		= @31
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT0-ApproachFly
		SAY @32
		= @33
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT0-ApproachAlert
		SAY @34
		=
		@35
		IF ~~ THEN EXIT
	END

	 
	IF ~~ THEN BEGIN MRLT0-Pebble
		SAY @36
		=
		@37
		++ @38 GOTO MRLT0-PebbleJoke
		++ @39 GOTO MRLT0-PebbleKeep
		++ @40 EXIT
	END

	IF ~~ THEN BEGIN MRLT0-PebbleJoke
		SAY @41
		=
		@42
		=
		@43
		++ @44 GOTO MRLT0-PebbleJoke1
		++ @45 GOTO MRLT0-PebbleJoke2
		++ @46 GOTO MRLT0-PebbleJoke3
	END

	IF ~~ THEN BEGIN MRLT0-PebbleJoke1
		SAY @47
		=
		@48
		=
		@49
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT0-PebbleJoke2
		SAY @50
		=
		@48
		=
		@49
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT0-PebbleJoke3
		SAY @51
		=
		@52
		=
		@49
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT0-PebbleKeep
		SAY @53
		=
		@54
		++ @55 GOTO MRLT0-PebbleJoke1
		++ @56 GOTO MRLT0-PebbleJoke2
		IF ~ReputationGT(Player1,13)
		Gender(Player1,MALE)~ THEN REPLY @57 GOTO MRLT0-MaleGood
		IF ~ReputationGT(Player1,13)
		Gender(Player1,FEMALE)~ THEN REPLY @57 GOTO MRLT0-FemaleGood
		IF ~!ReputationGT(Player1,13)
		Gender(Player1,MALE)~ THEN REPLY @57 GOTO MRLT0-MaleBad
		IF ~!ReputationGT(Player1,13)
		Gender(Player1,FEMALE)~ THEN REPLY @57 GOTO MRLT0-FemaleGood
		++ @58 GOTO MRLT0-Sorry
	END

	IF ~~ THEN BEGIN MRLT0-MaleGood
		SAY @59
		++ @60 GOTO MRLT0-Neverwinter
		++ @61 GOTO MRLT0-PebbleJoke2
		++ @58 GOTO MRLT0-Sorry
	END

	IF ~~ THEN BEGIN MRLT0-FemaleGood
		SAY @62
		++ @60 GOTO MRLT0-Neverwinter
		++ @63 GOTO MRLT0-PebbleJoke2
		++ @58 GOTO MRLT0-Sorry
	END


	IF ~~ THEN BEGIN MRLT0-MaleBad
		SAY @64
		++ @65 GOTO MRLT0-Neverwinter
		++ @63 GOTO MRLT0-PebbleJoke2
		++ @58 GOTO MRLT0-Sorry
	END

	IF ~~ THEN BEGIN MRLT0-FemaleBad
		SAY @66
		++ @65 GOTO MRLT0-Neverwinter
		++ @63 GOTO MRLT0-PebbleJoke2
		++ @58 GOTO MRLT0-Sorry
	END

	IF ~~ THEN BEGIN MRLT0-Neverwinter
		SAY @67
		++ @68 GOTO MRLT0-Snore
		++ @69 GOTO MRLT0Punch
		++ @63 GOTO MRLT0-PebbleJoke2
		++ @58 GOTO MRLT0-Sorry
	END

	IF ~~ MRLT0Punch
	   SAY @70
	   = @71
 	   ++ @68 GOTO MRLT0-Snore
		++ @72 GOTO MRLT0-Finale2
		++ @73 GOTO MRLT0-Finale3
		++ @63 GOTO MRLT0-PebbleJoke2
		++ @58 GOTO MRLT0-Sorry
        END

	IF ~~ THEN BEGIN MRLT0-Snore
		SAY @74
		++ @75 GOTO MRLT0-Finale
	END

	IF ~~ THEN BEGIN MRLT0-Finale
		SAY @76
		= @77
		= @78
		= @79
		++ @72 GOTO MRLT0-Finale2
		++ @73 GOTO MRLT0-Finale3
		++ @80 GOTO MRLT0-Finale4
	END

	IF ~~ THEN BEGIN MRLT0-Finale2
		SAY @81
		=
		@82
		=
		@83
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT0-Finale3
		SAY @84
		=
		@85
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT0-Finale4
		SAY @86
		=
		@87
		=
		@88
		=
		@89
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT0-Sorry
		SAY @90
		= @91
		IF ~~ THEN EXIT
	END


	/* LoveTalk 1 */

	/* Must be inside a city */

	IF ~~ THEN BEGIN MRLT1
		SAY ~(Imoen grins at you, guessing your intentions) Hmm, feelin' mushy today, arentcha?~ [ MRImRom3 ] 
		IF ~~ THEN REPLY @93 GOTO MRLT1-2
		IF ~~ THEN REPLY @94GOTO MRLT1-Kiss
		IF ~~ THEN REPLY @95 GOTO MRLT1-2
		IF ~~ THEN REPLY @96 GOTO MRLT1-Hot
		IF ~~ THEN REPLY @97 GOTO MRLT1-2
		IF ~~ THEN REPLY @98 GOTO MRLT1-Exit
	END

	IF ~~ THEN BEGIN MRLT1-Exit
		SAY @99
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT1-Exit2
		SAY @100
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT1-2
		SAY @101
		=
		@102
		=
		@103
		++ @104 GOTO MRLT1-Sugarness
		++ @105 GOTO MRLT1-Staring
		++ @106 GOTO MRLT1-Exit2
	END

	IF ~~ THEN BEGIN MRLT1-Sugarness
		SAY @107
		=
		@108
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT1-Staring
		SAY @109
		=
		@108
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT1-Hot
		SAY @110
		=
		@111
		=
		@112
		=
		@113
		=
		@114
		=
		@103
		++ @104 GOTO MRLT1-Sugarness
		++ @105 GOTO MRLT1-Staring
		++ @106 GOTO MRLT1-Exit2
	END

	IF ~~ THEN BEGIN MRLT1-Staring2
		SAY @115
		=
		@116
		=
		@108
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT1-Kiss
		SAY @117
		=
		@118
		=
		@114
		=
		@119
		++ @104 GOTO MRLT1-Sugarness
		++ @105 GOTO MRLT1-Staring
		++ @106 GOTO MRLT1-Exit2
	END

	IF ~~ THEN BEGIN MRLT1-Appropriate
		SAY @120
		++ @121 GOTO MRLT1-Appropriate2
		++ @122 GOTO MRLT1-Exit2
	END

	IF ~~ THEN BEGIN MRLT1-Appropriate2
		SAY @123
		=
		@108
		IF ~~ THEN EXIT
	END


	/* LoveTalk 2 */

	/* Must trigger at night */

	IF ~~ THEN BEGIN MRLT2
		SAY ~(As you approach, Imoen smiles and sheepishly kisses your nose) All this darkness scares me, my good <PRO_LADYLORD>. Couldst thou be my light and allay my fears?~ [ MRImRom3 ] 
		IF ~~ THEN REPLY @125 GOTO MRLT2-Fair
		IF ~~ THEN REPLY @126 GOTO MRLT2-Course
		IF ~~ THEN REPLY @127 GOTO MRLT2-Humble
		IF ~~ THEN REPLY @128 GOTO MRLT2-Fair
		IF ~~ THEN REPLY @129 GOTO MRLT2-Sex
	END

	IF ~~ THEN BEGIN MRLT2-Fair
		SAY @130
		=
		@131
		=
		@132
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT2-Course
		SAY @133
		=
		@134
		=
		@135
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT2-Humble
		SAY @136
		=
		@137
		=
		@138
		=
		@139
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT2-Sex
		SAY @140
		=
		@141
		=
		@142
		=
		@143
		IF ~~ THEN EXIT
	END

	/* LoveTalk 3 */

	/* Must trigger around sunset time, whenever that is, in the outdoors/forest */

	IF ~~ THEN BEGIN MRLT3
		SAY ~(You get close to Imoen and embrace her from behind. She is gazing at the fading sun behind the canopy. Peering over her shoulder, you look down inside her tunic and enjoy for a brief moment an even more spectacular sight.)~ [ MRImRom1 ]
		IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRLT3-2
	END

	IF ~~ THEN BEGIN MRLT3-2
		SAY @145
		=
		@146
		++ @147 GOTO MRLT3-Sad
		++ @148 GOTO MRLT3-3
		++ @149 GOTO MRLT3-3Camp
		++ @150 GOTO MRLT3-Kiss
		++ @151 GOTO MRLT3-Exit
	END

	IF ~~ THEN BEGIN MRLT3-Exit
		SAY @152
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT3-Kiss
		SAY @153
		IF ~~ THEN GOTO MRLT3-3
	END

	IF ~~ THEN BEGIN MRLT3-Sad
		SAY @154
		=
		@155
		IF ~~ THEN GOTO MRLT3-3
	END

	IF ~~ THEN BEGIN MRLT3-3
		SAY @156
		=
		@157
		++ @158 GOTO MRLT3-3Camp
		++ @159 GOTO MRLT3-3Kiss
		++ @160 GOTO MRLT3-Day
		++ @161 GOTO MRLT3-3Waste
	END

	IF ~~ THEN BEGIN MRLT3-3Waste
		SAY @162
		++ @163 GOTO MRLT3-3Waste2
		++ @164 GOTO MRLT3-3Waste3
	END
		
	IF ~~ THEN BEGIN MRLT3-3Waste2
		SAY @165
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT3-3Waste3
		SAY @166
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT3-Day
		SAY @167
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT3-3Kiss
		SAY @168
		++ @169 GOTO MRLT3-3Camp
		++ @170 GOTO MRLT3-Day
	END

	IF ~~ THEN BEGIN MRLT3-3Camp
		SAY @171
		=
		@172
		=
		@173
		=
		@174
		+ ~Gender(Player1,MALE)~ + @175 GOTO MRLT3-Sexm
		+ ~Gender(Player1,FEMALE)~ + @175 GOTO MRLT3-Sexf
		++ @176 GOTO MRLT3-SexSleep
		+ ~Gender(Player1,MALE)~ + @177 GOTO MRLT3-Sexm
		+ ~Gender(Player1,FEMALE)~ + @177 GOTO MRLT3-Sexf
		++ @178 GOTO MRLT3-Naughty
		++ @179 GOTO MRLT3-SexSleep2
	END

	IF ~~ THEN BEGIN MRLT3-Sexm
		SAY @180
		IF ~~ THEN GOTO MRLT3-Sex2
	END

	IF ~~ THEN BEGIN MRLT3-Sexf
		SAY @181
		IF ~~ THEN GOTO MRLT3-Sex2
	END

	IF ~~ THEN BEGIN MRLT3-Sex2
	 SAY @182
		IF ~NumInPartyGT(2)~THEN EXTERN PLAYER1 MRLT3-Sex2Extern
		IF ~!NumInPartyGT(2)~THEN EXTERN PLAYER1 MRLT3-Sex2Externa
	END

        IF ~~ THEN BEGIN MRLT3-SexSleep
		SAY @183
		IF ~Gender(Player1,MALE)~ THEN GOTO MRLT3-Sexm
		IF ~Gender(Player1,FEMALE)~ THEN GOTO MRLT3-Sexf
        END

	IF ~~ THEN BEGIN MRLT3-SexSleep2
		SAY @184
		IF ~NumInPartyGT(2)~ THEN REPLY @185 GOTO MRLT3-SexSleep3
		IF ~!NumInPartyGT(2)~ THEN REPLY @186 GOTO MRLT3-SexSleep3
		++ @187 GOTO MRLT3-Kick
	END

	IF ~~ THEN BEGIN MRLT3-Kick
		SAY @188
		=
		@189
		IF ~~ THEN DO ~ StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ THEN BEGIN MRLT3-SexSleep3
		SAY @190
		IF ~~ THEN DO ~ StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ THEN BEGIN MRLT3-Naughty
		SAY @191
		++ @192 GOTO MRLT3-3Waste2
		++ @193 GOTO MRLT3-Naughty2
	END

	IF ~~ THEN BEGIN MRLT3-Naughty2
		SAY @194
		=
		@195
		=
		@196
		=
		@197
		IF ~~ THEN DO ~ StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ THEN BEGIN MRLT3-4
		SAY @198
		IF ~~ THEN DO ~ StartCutSceneMode() StartCutScene("Cut34a")~EXIT
	END
END


APPEND PLAYER1
	IF ~~ THEN BEGIN MRLT3-Sex2Extern
		SAY @199
		IF ~~ THEN EXTERN IMOEN2J MRLT3-4
	END

	IF ~~ THEN BEGIN MRLT3-Sex2Externa
		SAY @200
		IF ~~ THEN EXTERN IMOEN2J MRLT3-4
	END
END

/* LoveTalk 4 */

/* Must trigger in a dungeon/sewer environment */
APPEND IMOEN2J
	IF ~~ THEN BEGIN MRLT4
		SAY ~(Imoen glances at her surroundings) This place is so dark... it gives me the creeps.~ [ MRImRom3 ]
		IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRLT4-2
	END

	IF ~~ THEN BEGIN MRLT4-2
		SAY @202
		=
		@203
		++ @204 GOTO MRLT4-Cuddle
		++ @205 GOTO MRLT4-Cherry
		++ @206 GOTO MRLT4-Now
	END

	IF ~~ THEN BEGIN MRLT4-Cuddle
		SAY @207
		IF ~~ THEN EXTERN PLAYER1 MRLT4-Cuddle
	END

	IF ~~ THEN BEGIN MRLT4-Cherry
		SAY @208
		=
		@209
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT4-Now
		SAY @210
		IF ~~ THEN EXIT
	END
END

APPEND PLAYER1
	IF ~~ THEN BEGIN MRLT4-Cuddle
	SAY @211
 = @212
	= @213
	IF ~~ THEN EXIT
	END
END


/* LoveTalk 5 */

/* Must trigger in late afternoon, anywhere that's not inside a building? */
APPEND IMOEN2J
	IF ~~ THEN BEGIN MRLT5
		SAY ~(Imoen waits until you get close and gaily throws herself into your arms.)~ [ MRImRom4 ]
		=
		@215
		IF ~~ THEN REPLY @216 DO ~ ActionOverride(Player1,SetDialog("Player1"))~GOTO MRLT5-Inn
		IF ~~ THEN REPLY @217 DO ~ActionOverride(Player1,SetDialog("Player1"))~GOTO MRLT5-Ground
		IF ~~ THEN REPLY @218 DO ~ActionOverride(Player1,SetDialog("Player1"))~GOTO MRLT5-Ground
		IF ~~ THEN REPLY @219 DO ~ActionOverride(Player1,SetDialog("Player1"))~GOTO MRLT5-Cost
		IF ~~ THEN REPLY @220 DO ~ ActionOverride(Player1,SetDialog("Player1"))~GOTO MRLT5-Exit
	END

	IF ~~ THEN BEGIN MRLT5-Exit
		SAY @221
		++ @222 GOTO MRLT5-Inn
		++ @223 GOTO MRLT5-Ground
		++ @224 GOTO MRLT5-Cost
		++ @225 GOTO MRLT5-Exit2
	END

	IF ~~ THEN BEGIN MRLT5-Exit2
		SAY @226
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT5-Cost
		SAY @227
		++ @228 GOTO MRLT5-Inn
		++ @229 GOTO MRLT5-Ground
		++ @230 GOTO MRLT5No
		++ @225 GOTO MRLT5-Exit2
	END
	
	IF ~~ MRLT5No
	   SAY @231
	   = @232
	   IF ~~ THEN EXIT
        END

	IF ~~ THEN BEGIN MRLT5-Ground
		SAY @233
		=
		@234
		=
		@235
		++ @228 GOTO MRLT5-Inn
		++ @230 GOTO MRLT5No
		++ @225 GOTO MRLT5-Exit2
	END

	IF ~~ THEN BEGIN MRLT5-Inn
		SAY @236
		=
		@237
		=
		@238
		IF ~~ THEN GOTO MRLT5-Inn2
	END

	IF ~~ THEN BEGIN MRLT5-Inn2
		SAY @239
		= @240
		IF ~~ THEN DO ~SetGlobal("MRQuality5Sleep","GLOBAL",1) ~ EXIT
	END

	IF ~Global("MRQuality5Sleep","GLOBAL",2)~ THEN BEGIN MRLT5-AfterRest
		SAY @241
		=
		@242
		=
		@243
		IF ~~ THEN DO ~SetGlobal("MRQuality5Sleep","GLOBAL",3)~ EXIT
	END
END

/* LoveTalk 6 */

/* Must trigger at night, in a forest */
APPEND IMOEN2J
	IF ~~ THEN BEGIN MRLT6
		SAY @244
		=
		~<CHARNAME>, did you hear that?~ [ MRImNig2 ]
		=
		@246
		IF ~~ THEN REPLY @247 GOTO MRLT6-Nothing
		IF ~~ THEN REPLY @248 GOTO MRLT6-Protect
	END

	IF ~~ THEN BEGIN MRLT6-Protect
		SAY @249
		++ @250 GOTO MRLT6-Nothing
		++ @251 GOTO MRLT6-Nothing
		++ @252 GOTO MRLT6-Nothing
	END

	IF ~~ THEN BEGIN MRLT6-Nothing
		SAY @253
		=
		@254
		++ @255 GOTO MRLT6-Mare1
                ++ @256 GOTO MRLT6-Mare1
		++ @257 GOTO MRLT6-Mare2
	END

	IF ~~ THEN BEGIN MRLT6-Mare2
		SAY @258
		IF ~~ THEN GOTO MRLT6-Mare1
	END

	IF ~~ THEN BEGIN MRLT6-Mare1
		SAY @259 
		IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LuvCut2")~ EXIT
	END

	IF ~Global("MRLT6Nightmare","GLOBAL",1)~ THEN BEGIN MRLT6-4
		SAY @260
		IF ~~ THEN DO ~SetGlobal("MRLT6Nightmare","GLOBAL",2)~ GOTO MRLT6-5
	END

	IF ~~ THEN BEGIN MRLT6-5
		SAY @261
		++ @262 GOTO MRLT6-7
		++ @263 GOTO MRLT6-6
		++ @264 GOTO MRLT6-6
		++ @265 GOTO MRLT6-6
		++ @266 GOTO MRLT6-6
	END

	IF ~~ THEN BEGIN MRLT6-6
		SAY @267
		++ @268 GOTO MRLT6-7
		++ @269 GOTO MRLT6-7Forget
		++ @270 GOTO MRLT6-7Forget
	END

	IF ~~ THEN BEGIN MRLT6-7
		SAY @271
		=
		@272
		=
		~<CHARNAME>...~ [ MRImRom5 ] 
		=
		@274
		=
		@275
		=
		@276
		++ @277 GOTO MRLT6-7Dunno
		++ @278 GOTO MRLT6-7Spellhold
		++ @279 GOTO MRLT6-7Dunno
		++ @280 GOTO MRLT6-7Forget
	END

	IF ~~ THEN BEGIN MRLT6-7Forget
		SAY @281
		++ @277 GOTO MRLT6-7Dunno
		++ @278 GOTO MRLT6-7Dunno
		++ @279 GOTO MRLT6-7Dunno
		++ @282 GOTO MRLT6-7Weak
	END
		
	IF ~~ THEN BEGIN MRLT6-7Weak
		SAY @283
		=
		@284
		=
		@285
		IF ~~ THEN DO ~
		LeaveParty()
		EscapeArea() ~
		EXIT
	END

	IF ~~ THEN BEGIN MRLT6-7Dunno
		SAY @286
		=
		@287
		=
		@288
                = 
                @289
		++ @290 GOTO MRLT6-7Spellhold
		++ @291 GOTO MRLT6-7Spellhold
		++ @292 GOTO MRLT6-7Spellhold
		++ @293 GOTO MRLT6-7Walk
		++ @294 GOTO MRLT6-7Weak
	END

	IF ~~ THEN BEGIN MRLT6-7Walk
		SAY @295
		=
		@296
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT6-7Spellhold
		SAY @297
		=
		@298
		++ @299 GOTO MRLT6-7Cuddle
		++ @300 GOTO MRLT6-8
		++ @301 GOTO MRLT6-8
		++ @302 GOTO MRLT6-8
		++ @303 GOTO MRLT6-7Weak
	END

	IF ~~ THEN BEGIN MRLT6-8
		SAY @304
		IF ~~ THEN GOTO MRLT6-7Cuddle
	END

	IF ~~ THEN BEGIN MRLT6-7Cuddle
		SAY @305
		++ @306 + MRLT6-8End
		++ @307 GOTO MRLT6-8End
		++ @308 GOTO MRLT6-8End
		++ @309 GOTO MRLT6-7Walk
		++ @310 GOTO MRLT6-7Weak
	END

	IF ~~ THEN BEGIN MRLT6-8End
		SAY @311
		=
		@312
		IF ~~ THEN EXIT
        END


/* LoveTalk 7 */

/* Must trigger in a city */
	IF ~~ THEN BEGIN MRLT7
		SAY ~(Without words, you surprise Imoen by sweeping her into your arms and kissing her intensely.)~ [ MRImRom2 ] 
		=
		@314
		IF ~~ THEN REPLY @315 GOTO MRLT7-Nice
		IF ~~ THEN REPLY @316 GOTO MRLT7-Nice
		IF ~~ THEN REPLY @317 GOTO MRLT7-Nice
		IF ~~ THEN REPLY @318 GOTO MRLT7-Sex
		IF ~~ THEN REPLY @319 GOTO MRLT7-Exit
	END

	IF ~~ THEN BEGIN MRLT7-Exit
		SAY @320
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT7-Sex
		SAY @321
		=
		@322
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT7-Nice
		SAY @323
		=
		@324
		=
		@325
		++ @326 GOTO MRLT7-Hair
		++ @327 GOTO MRLT7-Hair
		++ @328 GOTO MRLT7-Grow
		++ @329 GOTO MRLT7-Change
		++ @330 GOTO MRLT7-Change
		++ @331 GOTO MRLT7-Boring
	END

	IF ~~ THEN BEGIN MRLT7-Boring
		SAY @332
		=
		@333
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT7-Change
		SAY @334
		IF ~~ THEN GOTO MRLT7-Hair
	END

	IF ~~ THEN BEGIN MRLT7-Grow
		SAY @335
		IF ~~ THEN GOTO MRLT7-Hair
	END

	IF ~~ THEN BEGIN MRLT7-Hair
		SAY @336
		=
		@337
		=
		@338
		++ @339 GOTO MRLT7-Remember
		++ @340 GOTO MRLT7-Scissors
		IF ~InParty("Jan")~ THEN REPLY @341 GOTO MRLT7-Jan
		IF ~!InParty("Jan")~ THEN REPLY @342 GOTO MRLT7-Jan
		++ @343 GOTO MRLT7-Boring
	END

	IF ~~ THEN BEGIN MRLT7-Jan
		SAY @344
		=
		@345
		IF ~~ THEN GOTO MRLT7-Scissors
	END

	IF ~~ THEN BEGIN MRLT7-Scissors
		SAY @346
		IF ~~ THEN GOTO MRLT7-Remember
	END

	IF ~~ THEN BEGIN MRLT7-Remember
		SAY @347
		=
		@348
		IF ~InParty("Jan")~ THEN REPLY @349 GOTO MRLT7-Scissors2
		IF ~!InParty("Jan")
			NumInPartyGT(2)~ THEN REPLY @350 GOTO MRLT7-Scissors2
		IF ~!NumInPartyGT(2)~ THEN REPLY @351 GOTO MRLT7-Scissors2
		++ @352 GOTO MRLT7-Scissors3
		++ @353 GOTO MRLT7-Boring
	END

	IF ~~ THEN BEGIN MRLT7-Scissors2
		SAY @354
		=
		@355
		= @356
		= @357
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT7-Scissors3
		SAY @358
		=
		@359
		=
		@360
		=
		@361
		IF ~~ THEN EXIT
	END
END
/* LoveTalk 8 */

/* Must trigger in a subterranean environment at night */
APPEND IMOEN2J
	IF ~~ THEN BEGIN MRLT8
		SAY ~<CHARNAME>, I hate being in caverns and the like at night.~ [ MRImRom1 ]
		=
		@363
                = @364
		IF ~~ THEN REPLY @365 GOTO MRLT8-1
		IF ~~ THEN REPLY @366 GOTO MRLT8-2
		IF ~~ THEN REPLY @367 GOTO MRLT8-2
		IF ~~ THEN REPLY @368GOTO MRLT8-Rat
	END

	IF ~~ THEN BEGIN MRLT8-1
		SAY @369
		IF ~~ THEN GOTO MRLT8-Next
	END

	IF ~~ THEN BEGIN MRLT8-2
		SAY @370
		=
		@371
		IF ~~ THEN GOTO MRLT8-Next
	END

	IF ~~ THEN BEGIN MRLT8-Rat
		SAY @372
		= @373
		IF ~!IsValidForPartyDialog("Minsc")~ THEN GOTO MRLT8-NoBoo
		IF ~IsValidForPartyDialog("Minsc")~ THEN GOTO MRLT8-Boo
	END
END


CHAIN IMOEN2J MRLT8-Boo
@374
== MINSCJ 
@375
== IMOEN2J 
@376
== MINSCJ 
@377
== IMOEN2J 
@378
== MINSCJ 
@379
END IMOEN2J MRLT8-Boo2

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRLT8-NoBoo
		SAY @380
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT8-Boo2
		SAY @381
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT8-Next
		SAY @382
		++ @383 GOTO MRLT8-NotNow
		++ @384 GOTO MRLT8-Gone
		++ @385 GOTO MRLT8-Gone
	END	

	IF ~~ THEN BEGIN MRLT8-Gone
		SAY @386
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT8-NotNow
		SAY @387
		= @388
		IF ~~ THEN EXIT
	END
END

/* LoveTalk 9 */

/* Can trigger anywhere, daytime */
APPEND IMOEN2J
	IF ~~ THEN BEGIN MRLT9
		SAY ~(You come closer to Imoen with the intention of saying something beautiful to her.)~ [ MRImRom5 ]
		IF ~~ THEN REPLY @390 GOTO MRLT9Smooth
		IF ~~ THEN REPLY @391 GOTO MRLT9Smooth
		IF ~~ THEN REPLY @392 GOTO MRLT9Smooth
		IF ~~ THEN REPLY @393 GOTO MRLT9Breasts
		IF ~~ THEN REPLY @394 GOTO MRLT9Lame
	END

	IF ~~ THEN BEGIN MRLT9Lame
		SAY @395
		=
		@396
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT9Breasts
		SAY @397
                = @398
                = @399
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT9Smooth
		SAY @400
		++ @401 GOTO MRLT9Smooth2
		++ @402 GOTO MRLT9Smooth2
		++ @403 GOTO MRLT9Smooth2
		++ @404 GOTO MRLT9Wait
		++ @405 GOTO MRLT9Lame2
	END

	IF ~~ THEN BEGIN MRLT9Lame2
		SAY @406
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT9Wait
		SAY @407
		=
		@408
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT9Smooth2
		SAY @409
		++ @410 GOTO MRLT9Smooth3
		++ @411 GOTO MRLT9Smooth3
		++ @412 GOTO MRLT9Wait2
		++ @413 GOTO MRLT9Lame2
	END

	IF ~~ THEN BEGIN MRLT9Wait2
		SAY @414
		=
		@408
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT9Smooth3
		SAY @415
		=
		@416
		=
		@417
		=
		@418
		=
		@419
		=
		@420
		=
		@421
		IF ~OR(2) CheckStatGT(Player1,10,WIS) CheckStatGT(Player1,10,INT)~ THEN REPLY @422 GOTO MRLT9Book
		++ @423 GOTO MRLT9Night
		++ @424 GOTO MRLT9Night
		++ @425 GOTO MRLT9Doubt
	END

	IF ~~ THEN BEGIN MRLT9Doubt
		SAY @426
		=
		@427
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT9Night
		SAY @428
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT9Book
		SAY @429
		=
		@430
		++ @431 GOTO MRLT9Night
		++ @432 GOTO MRLT9Night
		++ @433 GOTO MRLT9Doubt
		IF ~~ THEN EXIT
	END
END

/* LoveTalk 10 */

/* Triggers in the morning, in a city */
APPEND IMOEN2J
	IF ~~ THEN BEGIN MRLT10
		SAY ~(Looking at her, a variety of desires assault your will.)~ [ MRImRom3 ]
		IF ~~ THEN REPLY @435 GOTO MRLT10a
		IF ~~ THEN REPLY @436 GOTO MRLT10b
		IF ~~ THEN REPLY @437 GOTO MRLT10c
		IF ~~ THEN REPLY @438 GOTO MRLT10d
		IF ~~ THEN REPLY @439 GOTO MRLT10e
		IF ~~ THEN REPLY @440 GOTO MRLT10f
		IF ~~ THEN REPLY @441 GOTO MRLT10g
		IF ~~ THEN REPLY @442 GOTO MRLT10h
		IF ~~ THEN REPLY @443 GOTO MRLT10i
		IF ~~ THEN REPLY @444 GOTO MRLT10j
		IF ~~ THEN REPLY @445 EXIT
	END

	IF ~~ THEN BEGIN MRLT10a
		SAY @446
		=
		@447
		IF ~~ THEN REPLY @448 GOTO MRLT10b
		IF ~~ THEN REPLY @437 GOTO MRLT10c
		IF ~~ THEN REPLY @438 GOTO MRLT10d
		IF ~~ THEN REPLY @439 GOTO MRLT10e
		IF ~~ THEN REPLY @449 GOTO MRLT10f
		IF ~~ THEN REPLY @441 GOTO MRLT10g
		IF ~~ THEN REPLY @450 GOTO MRLT10h
		IF ~~ THEN REPLY @443 GOTO MRLT10i
	END

	IF ~~ THEN BEGIN MRLT10b
		SAY @451
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT10c
		SAY @452
		=
		@453
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT10d
		SAY @454
		= @455
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT10e
		SAY @456
                = @457
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT10f
		SAY @458
		=
		@459
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT10g
		SAY @460
		=
		@461
		IF ~~ THEN REPLY @448 GOTO MRLT10b
		IF ~~ THEN REPLY @437 GOTO MRLT10c
		IF ~~ THEN REPLY @438 GOTO MRLT10d
		IF ~~ THEN REPLY @439 GOTO MRLT10e
		IF ~~ THEN REPLY @449 GOTO MRLT10f
		IF ~~ THEN REPLY @450 GOTO MRLT10h
		IF ~~ THEN REPLY @443 GOTO MRLT10i
	END

	IF ~~ THEN BEGIN MRLT10h
		SAY @462
		=
		@463
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT10i
		SAY @464
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT10j
		SAY @465
		++ @448 GOTO MRLT10b
		++ @437 GOTO MRLT10c
		++ @466 GOTO MRLT10d
		++ @467 GOTO MRLT10e
		++ @468 GOTO MRLT10f
		IF ~~ THEN REPLY @450 GOTO MRLT10h
		++ @443 GOTO MRLT10i
	END

	/* LoveTalk 11 */

	/* Must trigger in a dungeon, cave, or sewer */

	IF ~~ THEN BEGIN MRLT11
		SAY @469
		=
		@470
		= @471
		++ @472 GOTO MRLT11a
		++ @473 GOTO MRLT11b
		++ @474 GOTO MRLT11c
	END

	IF ~~ THEN BEGIN MRLT11a
		SAY @475
		= @476
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT11b
		SAY @477
		= @478
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLT11c
		SAY @479
		= @480
		IF ~~ THEN EXIT
	END
END
