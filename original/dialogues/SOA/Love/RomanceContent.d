/*the idea is that this is to be compiled with romanceContent, pidtree, qualityimes, bitalk */
APPEND IMOEN2J

	IF ~Global("MRAfterSexTalk","GLOBAL",2)~ THEN BEGIN MRResolutionNotYet1
	SAY @0
	IF ~~ THEN DO ~SetGlobal("MRAfterSexTalk","GLOBAL",3)~ GOTO MRResolutionNotYet2
	END

	IF ~~ THEN BEGIN MRResolutionNotYet2
		SAY @1
		= @2
		= @3
		IF ~~ THEN EXIT
	END
		
	//Continuing from MRResolution1
	IF ~~ MRResolutionDoneWithYou
	   SAY @4
	   = @5
           IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) LeaveParty() EscapeArea()~ EXIT
        END
	IF ~~ MRResolution1noConflict
     SAY @6
		= @7
		++ @8 GOTO MRResolution2-Friends
		++ @9 GOTO MRResolution2-Explode
		++ @10 GOTO MRResolution2-Aggressive
		++ @11 GOTO MRResolution2-Love
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @12 GOTO MRResolution2-HighCha
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @12 GOTO MRResolution2-LowCha
		++ @13 GOTO MRResolution2-Toy
	END
	
	IF ~~ THEN BEGIN MRResolution2-Aggressive
		SAY @14
		++ @15 GOTO MRResolution2-Seduced
		++ @16 GOTO MRResolution2-Explode
		++ @17 GOTO MRResolution2-Love
		++ @18 GOTO MRResolution2-Toy
	END

	IF ~~ THEN BEGIN MRResolution2-Seduced
		SAY @19
		= @20
		= @21
		IF ~CheckStatGT(Player1,9,INT)~ THEN REPLY @22 GOTO MRResolution2-SeducedRetort1
		IF ~CheckStatGT(Player1,11,CHR)~ THEN REPLY @23 GOTO MRResolution2-SeducedRetort2
		++ @24 GOTO MRResolution2-Explode
		++ @25 GOTO MRResolution2-Mistake
		IF ~Gender(Player1,MALE)~ THEN REPLY @26 GOTO MRResolution2-HarlotMale
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @27 GOTO MRResolution2-HarlotFemale

	END

	IF ~~ THEN BEGIN MRResolution2-Mistake
		SAY @28
		IF ~~ THEN GOTO MRResolution-FriendsHetero
		IF ~Gender(Player1,FEMALE)~ THEN GOTO MRResolution-FriendsHomo
	END

	IF ~~ THEN BEGIN MRResolution2-HarlotMale
	SAY @29



	=@30
	= @31
	= @32
	= @33
	IF ~~ THEN DO ~LeaveParty() EscapeArea() SetGlobal("ImoenRomanceActive","Global",3)~ EXIT
	END

	IF ~~ THEN BEGIN MRResolution2-HarlotFemale
	SAY @29



	= @34
	= @35
	= @33
	IF ~~ THEN DO ~LeaveParty() EscapeArea() SetGlobal("ImoenRomanceActive","Global",3)~ EXIT
	END

	IF ~~ THEN BEGIN MRResolution2-SeducedRetort1
	 SAY @36
	 = @37

	 ++ @38 GOTO MRResolutionTease
	 ++ @39 GOTO MRResolution2-SeducedRetort2

	 ++ @40 GOTO MRResolutionSpontaneous
	 ++ @41 GOTO MRResolutionAlways
	 IF ~Gender(Player1,MALE)~ THEN REPLY @42 GOTO MRResolution-FriendsHetero
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @42 GOTO MRResolution-FriendsHomo
	 IF ~Gender(Player1,MALE)~ THEN REPLY @43 GOTO MRResolution2-HarlotMale
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @44 GOTO MRResolution2-HarlotFemale
	END

	IF ~~ THEN BEGIN MRResolutionAlways
	 SAY @45
	 = @46
	 ++ @47 GOTO MRResolutionAlwaysLove
	 IF ~Gender(Player1,MALE)~ THEN REPLY @42 GOTO MRResolution-FriendsHetero
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @42 GOTO MRResolution-FriendsHomo
	 IF ~Gender(Player1,MALE)~ THEN REPLY @43 GOTO MRResolution2-HarlotMale
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @44 GOTO MRResolution2-HarlotFemale
	END

	IF ~~ THEN BEGIN MRResolutionAlwaysLove
	 SAY @48
	 ++ @49 GOTO MRResolutionAlwaysLove2
	 ++ @50 GOTO MRResolutionAlwaysLove2
	 ++ @51 GOTO MRResolutionAlwaysLove2
	 ++ @52 GOTO MRResolutionAlwaysLove2
	 ++ @53 GOTO MRResolutionAlwaysLove2
	END

	IF ~~ THEN BEGIN MRResolutionAlwaysLove2
	 SAY @54
	= @55
	 = @56
	 IF ~~ THEN GOTO MRResolution3
	END

	IF ~~ THEN BEGIN MRResolutionSpontaneous
	 SAY @57
	 = @58
	 = @59
	 ++ @60 GOTO MRResolutionLoveRight
	 ++ @61 GOTO MRResolution3Pointless

	 IF ~Global("MRResolutionTeasedAlready","LOCALS",0)~ THEN REPLY @62 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolution3Joke

	 ++ @63 GOTO MRResolutionBhaalThink
	 ++ @64 GOTO MRResolutionBhaalseed
	 IF ~Gender(Player1,MALE)~ THEN REPLY @65 GOTO MRResolution-FriendsHetero
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @65 GOTO MRResolution-FriendsHomo
	END

	IF ~~ THEN BEGIN MRResolution2-SeducedRetort2
	  SAY @66
	 = @67
	 IF ~~ THEN DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolution3
	END

	IF ~~ THEN BEGIN MRResolution3
	  SAY @68
	 = @69
	 ++ @60 GOTO MRResolutionLoveRight
	 ++ @61 GOTO MRResolution3Pointless

	 IF ~Global("MRResolutionTeasedAlready","LOCALS",0)~ THEN REPLY @70 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolution3Joke

	 ++ @63 GOTO MRResolutionBhaalThink
	 ++ @64 GOTO MRResolutionBhaalseed
	 IF ~Gender(Player1,MALE)~ THEN REPLY @65 GOTO MRResolution-FriendsHetero
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @65 GOTO MRResolution-FriendsHomo
	END

	IF ~~ THEN BEGIN MRResolutionTease
	SAY @71
	= @72
	IF ~~ THEN GOTO MRResolutionTease2
	END

	IF ~~ THEN BEGIN MRResolutionTease2
	SAY @73
	 IF ~CheckStatGT(Player1,10,INT)~ THEN REPLY @74 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionAdmit
	 ++ @75 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionAlways
	 ++ @76 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionTease3
	 ++ @77 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionEnd
	 ++ @78 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionWhore
	END

	IF ~~ THEN BEGIN MRResolutionTease3
	  SAY @79
	 = @80
	 IF ~~ THEN DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolution3
	END

	IF ~~ THEN BEGIN MRResolutionAdmit
	  SAY @81
	 ++ @82 GOTO MRResolutionAdmitKiss


	 IF ~~ THEN REPLY @83 GOTO MRResolutionHard
	 IF ~~ THEN REPLY @84 GOTO MRResolutionHard
	 ++ @85 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionTease3
	 ++ @77 GOTO MRResolutionEnd
	END

	IF ~~ THEN BEGIN MRResolutionAdmitLove
	 SAY @86
	 IF ~~ THEN DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionLoveFails
	END
END

CHAIN IMOEN2J MRResolutionAdmitKiss
@87 
== IMOEN2J IF ~Gender(Player1,MALE)~ THEN @88
== IMOEN2J IF ~Gender(Player1,FEMALE)~ THEN @89
== IMOEN2J @90
END IMOEN2J MRResolution4

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRResolution2-LowCha
	 SAY @91
	 = @92
	 = @93
	 ++ @94 GOTO MRResolution2-LowCha2 
	 IF ~CheckStatGT(Player1,11,WIS)~ THEN REPLY @95GOTO MRResolution2-LowCha3
	 ++ @96 GOTO MRResolution2-LowCha1
	 ++ @97 GOTO MRResolution2-Love
	END

	IF ~~ THEN BEGIN MRResolution2-LowCha1
	 SAY @98
		++ @15 GOTO MRResolution2-Seduced
		++ @16 GOTO MRResolution2-Explode
		++ @99 GOTO MRResolution2-Love
		++ @100 GOTO MRResolution2-Toy
	END

	IF ~~ THEN BEGIN MRResolution2-LowCha2
	 SAY @101
	 = @102
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRResolution2-LowCha3
	 SAY @103
	 = @104
	 = @105
		 = @106
	 IF ~~ THEN GOTO MRResolutionPre4
	END

	IF ~~ THEN BEGIN MRResolution2-HighCha
	 SAY @91
	 = @107
	 = @108
	IF ~~ THEN GOTO MRResolutionPre4
	END

	IF ~~ THEN BEGIN MRResolutionPre4
	 SAY @109
	 IF ~~THEN GOTO MRResolution4
	END

	IF ~~ THEN BEGIN MRResolution4
	 SAY @110

	 //IF ~~ THEN REPLY ~You love me! Finally, I've waited so long to hear it... (Take her hand) I am so happy, Imoen!~ GOTO MRResolution4-c
	 IF ~CheckStatGT(Player1,11,WIS)~ THEN REPLY @111 GOTO MRResolution4-b
	 IF ~!CheckStatGT(Player1,11,WIS)~ THEN REPLY @112 GOTO MRResolution4-b
	 ++ @113 GOTO MRResolution4-a
	 IF ~Global("MRResolutionTeasedAlready","LOCALS",0)~ THEN REPLY @114 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolution3Joke
	 ++ @115 GOTO MRResolutionBhaalseed
	 IF ~Gender(Player1,MALE)~ THEN REPLY @65 GOTO MRResolution-FriendsHetero
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @65 GOTO MRResolution-FriendsHomo
	END

	IF ~~ THEN BEGIN MRResolution4-a
    SAY @116
	 = @117
	 = @118
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RunAwayFrom(Player1,60)~ EXIT
	END

	IF ~~ THEN BEGIN MRResolution4-b
	 SAY @119
	 IF ~~ THEN GOTO MRResolution5
	END

	IF ~~ THEN BEGIN MRResolution4-c
	 SAY @120
	 IF ~~ THEN GOTO MRResolution5
	END

	IF ~~ THEN BEGIN MRResolution5
	 SAY @121
	 IF ~~ THEN REPLY @122 GOTO MRResolution5Point

	 ++ @123 GOTO MRResolution5Wrong
	 ++ @124 GOTO MRResolutionBhaalseed
	 IF ~Gender(Player1,MALE)~ THEN REPLY @65 GOTO MRResolution-FriendsHetero
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @65 GOTO MRResolution-FriendsHomo
	END

	IF ~~ THEN BEGIN MRResolution5Wrong
	 SAY @125
	 IF ~~ THEN GOTO MRResolution6
	END

	IF ~~ THEN BEGIN MRResolution5Point
	 SAY @126
	 IF ~~ THEN GOTO MRResolution6
	END

	IF ~~ THEN BEGIN MRResolution6
	
	 SAY @127
	 = @128
	 = @129
	 ++ @130 GOTO MRResolution7
	 ++ @131 GOTO MRResolution6Mortals
	 ++ @132 GOTO MRResolution6Slayer
	 IF ~Gender(Player1,MALE)~ THEN REPLY @133 GOTO MRResolution-FriendsHetero
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @133 GOTO MRResolution-FriendsHomo
	 ++ @134 GOTO MRResolution6Friends
	END

	IF ~~ THEN BEGIN MRResolution6Friends
	 SAY @135
	 = @136
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RunAwayFrom(Player1,60)~ EXIT
	END

	IF ~~ THEN BEGIN MRResolution6Slayer
	 SAY @137
	 IF ~~ THEN GOTO MRResolution7
	END

	IF ~~ THEN BEGIN MRResolution6Mortals
	 SAY @138
	 IF ~~ THEN GOTO MRResolution7
	END


	IF ~~ THEN BEGIN MRResolution7
	 SAY @139
	 = @140 
	 ++ @141 GOTO MRResolution7Embrace
	 ++ @142 GOTO MRResolution7Nice
	 ++ @143 GOTO MRResolution7Nice
	 ++ @144 GOTO MRResolution7Joke
	 ++ @145 GOTO MRResolution6Friends
	END

	IF ~~ THEN BEGIN MRResolution7Nice
	SAY @146
	 ++ @147 GOTO MRResolution7Embrace
	 ++ @148 GOTO MRResolution7Embrace2
	 ++ @149 GOTO MRResolution7Delay
	 IF ~Gender(Player1,MALE)~ THEN REPLY @150 GOTO MRResolution7Propose
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @150 GOTO MRResolution7Propose


	 ++ @151 GOTO MRResolution6Friends
	END

	IF ~~ THEN BEGIN MRResolution7Joke
	 SAY @152
	 IF ~~ THEN GOTO MRResolution7Nice
	END

	IF ~~ THEN BEGIN MRResolution7Delay
	 SAY @153 
	 ++ @147 GOTO MRResolution7Embrace
	 ++ @148 GOTO MRResolution7Embrace2
	 ++ @154 GOTO MRResolution7Delay2
	 IF ~Gender(Player1,MALE)~ THEN REPLY @150 GOTO MRResolution7Propose
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @150 GOTO MRResolution7Propose
	 ++ @151 GOTO MRResolution6Friends
	END

	IF ~~ THEN BEGIN MRResolution7Delay2
	 SAY @155
	 ++ @147 GOTO MRResolution7Embrace
	 ++ @148 GOTO MRResolution7Embrace2
	 ++ @156 GOTO MRResolution7Delay3
	 IF ~Gender(Player1,MALE)~ THEN REPLY @157 GOTO MRResolution7Propose
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @157 GOTO MRResolution7Propose
	 IF ~Gender(Player1,MALE)~ THEN REPLY @158 GOTO MRResolution2-HarlotMale
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @159 GOTO MRResolution2-HarlotFemale
	END

	IF ~~ THEN BEGIN MRResolution7Delay3
	SAY @160
	 = @161
	 ++ @162 GOTO MRResolution7Friends
	 ++ @147 GOTO MRResolution7Embrace
	 ++ @148 GOTO MRResolution7Embrace2
	 IF ~Gender(Player1,MALE)~ THEN REPLY @150 GOTO MRResolution7Propose
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @150 GOTO MRResolution7Propose


	 ++ @151 GOTO MRResolution6Friends
	END

	IF ~~ THEN BEGIN MRResolution7Friends
		SAY @163
		= @164
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RunAwayFrom(Player1,60)~ EXIT
	END


	IF ~~ THEN BEGIN MRResolution7Embrace
	  SAY ~(Imoen melts into your arms, your gentle embrace rewarded by the softness of her skin, the warmth of her body. She simply lets you envelop her and hold her close, not moving at all.)~ [ MRImRom6 ]
	 = @166
	 IF ~~ THEN GOTO MRResolution8
	 END

	 IF ~~ THEN BEGIN MRResolution8
	 SAY @167
	 = @168
	 ++ @169 GOTO MRResolution8More
	 ++ @170 GOTO MRResolution8More
	 ++ @171 GOTO MRResolution8Calm
	 ++ @172 GOTO MRResolution8Calm
	 ++ @173 GOTO MRResolution8Evil
	 END

	IF ~~ THEN BEGIN MRResolution8Evil
	 SAY @174
	 = @175
	 = @176
	 = @177
	 = @178
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) LeaveParty() EscapeArea()~ EXIT
	END

	IF ~~ THEN BEGIN MRResolution7Embrace2
	  SAY ~(Imoen leans in and your mouths find one another. Her tremulous breath touches your face, and you can sense her trepidation as you warmly stroke her lips with yours.)~ [ MRImRom6 ]
	 = @180
	 = @166
	 IF ~~ THEN GOTO MRResolution8
	END

	IF ~~ THEN BEGIN MRResolution7Propose
	 SAY @181
	 = @182 
	 = @183
	 IF ~~ THEN GOTO MRResolution8
	END

	IF ~~ THEN BEGIN MRResolution8More
	 SAY @184
	= @185
	 IF ~~ THEN GOTO MRResolution9
	END

	IF ~~ THEN BEGIN MRResolution8Calm
	 SAY @186
	 = @187
	 IF ~~ THEN GOTO MRResolution9
	END
END

CHAIN IMOEN2J MRResolution9
@188
= @189
= @190
END IMOEN2J MRResolution10

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRResolution10
	 SAY @191
	 = @192
         = @193
         = @194
         ++ @195 + MRResolution10d
         ++ @196 + MRResolution10c
         ++ @197 + MRResolution10b
         ++ @198 + MRResolution10a
        END

        IF ~~ MRResolution10a
           SAY @199
           = @200
           = @201
   		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",2) SetGlobalTimer("MRPartyReactionTimer","GLOBAL",ONE_DAY)
		RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",800)~ EXIT 
        END

        IF ~~ MRResolution10b
           SAY @202
   		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",2) SetGlobalTimer("MRPartyReactionTimer","GLOBAL",ONE_DAY)
		RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",800)~ EXIT 
        END

        IF ~~ MRResolution10c
           SAY @203
           = @204
           = @205
   		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",2) SetGlobalTimer("MRPartyReactionTimer","GLOBAL",ONE_DAY)
		RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",800)~ EXIT 
        END

        IF ~~ MRResolution10d
           SAY @206
           = @202
  		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",2) SetGlobalTimer("MRPartyReactionTimer","GLOBAL",ONE_DAY)
		RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",800)~ EXIT
        END

	IF ~~ THEN BEGIN MRResolution3Joke
	 SAY @207
	  IF ~CheckStatGT(Player1,9,INT)~ THEN REPLY @74 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionAdmit
	 ++ @75 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionAlways
	 ++ @76 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionTease3
	 ++ @77 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionEnd
	 ++ @78 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionWhore
	END

	IF ~~ THEN BEGIN MRResolution3Pointless
	SAY @208
	 = @209
	 ++ @210 GOTO MRResolutionLoveFails2
	 ++ @211 GOTO MRResolutionLoveFails2
	 ++ @212 GOTO MRResolutionLoveFails2
	END

	IF ~~ THEN BEGIN MRResolutionLoveRight
	 SAY @213
	 = @214
	 = @215
	 = @216
	 ++ @217 GOTO MRResolutionLoveRight2
	 ++ @218 GOTO MRResolutionLoveRightDelay
	 ++ @219 GOTO MRResolution3Pointless
	 ++ @220 GOTO MRResolutionLoveRightEnd
	END

	IF ~~ THEN BEGIN MRResolution2-Friends
		SAY @221
		= @102
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRResolution2-Love
		SAY @222
	 IF ~~ THEN GOTO MRResolutionLoveFails
	END
	 
	IF ~~ THEN BEGIN MRResolutionLoveFails
	 SAY @223
	 = @209
		++ @210 GOTO MRResolutionLoveFails2
		++ @211 GOTO MRResolutionLoveFails2
		++ @212 GOTO MRResolutionLoveFails2
	END

	IF ~~ THEN BEGIN MRResolutionLoveFails2
		SAY @224
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRResolution2-Toy
		SAY @225
		++ @226 GOTO MRResolution2-Toy2
		++ @227 GOTO MRResolution2-Toy3
	END

	IF ~~ THEN BEGIN MRResolution2-Toy3
		SAY @228
		IF ~Class(Player1,MONK)~ THEN GOTO MRResolution2-Toy3Monk
		IF ~~ THEN GOTO MRResolution2-Toy3NotMonk
	END

	IF ~~ THEN BEGIN MRResolution2-Toy3NotMonk
		SAY @229
		IF ~~ THEN GOTO MRResolution2-Toy4
	END

	IF ~~ THEN BEGIN MRResolution2-Toy3Monk
		SAY @230
		IF ~~ THEN GOTO MRResolution2-Toy4
	END

	IF ~~ THEN BEGIN MRResolution2-Toy4
		SAY @231
			= @232
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)
		LeaveParty()
		EscapeArea()~
		EXIT
	END

	IF ~~ THEN BEGIN MRResolution2-Toy2
		SAY @233
		++ @234 GOTO MRResolution2-Toy3
		++ @235 GOTO MRResolution2-Toy5
	END

	IF ~~ THEN BEGIN MRResolution2-Toy5
	SAY @236
		++ @237 GOTO MRResolution2-Toy3
		IF ~Gender(Player1,MALE)~ THEN REPLY @238 GOTO MRResolution2-Toy6
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @238 GOTO MRResolution2-Toy6
	END

	IF ~~ THEN BEGIN MRResolution2-Explode
		SAY @239
		= @240

		= @241
		= @242
		++ @243 GOTO MRResolution2-Toy6
		++ @244 GOTO MRResolution2-Friends
		++ @245 GOTO MRResolution2-Love
		++ @246 GOTO MRResolution2-Toy
	END

	IF ~~ THEN BEGIN MRResolution2-Toy6
		SAY @247
	 ++ @60 GOTO MRResolutionLoveRight
	 ++ @248 GOTO MRResolution3Pointless
	 ++ @249 GOTO MRResolutionBlasphemy
	 IF ~Global("MRResolutionTeasedAlready","LOCALS",0)~ THEN REPLY @250 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolution3Joke

	 ++ @63 GOTO MRResolutionBhaalThink
	 ++ @64 GOTO MRResolutionBhaalseed
	 IF ~Gender(Player1,MALE)~ THEN REPLY @65 GOTO MRResolution-FriendsHetero
	 IF ~Gender(Player1,FEMALE)~ THEN REPLY @65 GOTO MRResolution-FriendsHomo
	END

	IF ~~ THEN BEGIN MRResolution-FriendsHetero
		SAY @251
                = @252
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~
		EXIT
	END

	IF ~~ THEN BEGIN MRResolutionBlasphemy
		SAY @253
	 ++ @254 GOTO MRResolutionBlasphemy2
	++ @255 GOTO MRResolutionBhaalThink
	 ++ @256 GOTO MRResolutionLoveRight
	END

	IF ~~ THEN BEGIN MRResolutionBhaalThink
		SAY @257
		IF ~~ THEN GOTO MRResolutionBhaalThink2
	END

	IF ~~ THEN BEGIN MRResolutionBlasphemy2
		SAY @258
		= @259
		= @260 
		= @261
		= @252
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~
		EXIT
	END

	IF ~~ THEN BEGIN MRResolutionBhaalseed
	SAY @262
		IF ~CheckStatGT(Player1,12,WIS)~ THEN REPLY @263 GOTO MRResolutionBhaalseedWise
		IF ~CheckStatLT(Player1,13,WIS)~ THEN REPLY @263 GOTO MRResolutionBhaalseedWise2
		++ @264 GOTO MRResolutionBhaalseedStupid
		++ @265 GOTO MRResolutionBlasphemy
	END

	IF ~~ THEN BEGIN MRResolutionBhaalseedWise2
	 SAY @266
	 ++ @267 GOTO MRResolutionBhaalseedWise3
	  ++ @268 GOTO MRResolutionBhaalseedWise3
	 ++ @269 GOTO MRResolutionBhaalseedWise3
	END

	IF ~~ THEN BEGIN MRResolutionBhaalseedWise3
	 SAY @270
	 IF ~~ THEN GOTO MRResolutionLoveRight
	END

	IF ~~ THEN BEGIN MRResolutionBhaalseedStupid
		SAY @271
		= @272
		++ @273 GOTO MRResolutionBhaalseedStupidRead
		++ @274 GOTO MRResolutionBhaalseedStupid2
		++ @275 GOTO MRResolutionHard
	END


	IF ~~ THEN BEGIN MRResolutionBhaalseedWise
		SAY @266
		++ @273 GOTO MRResolutionHard
		++ @276 GOTO MRResolutionHard
    	        ++ @277 GOTO MRResolutionBhaalseedWise3
		++ @274 GOTO MRResolutionBhaalThinkNonsense
		++ @275 GOTO MRResolutionHard
	END


	IF ~~ THEN BEGIN MRResolutionBhaalseedStupidRead
		SAY @278 
		= @279
			= @280 
		= @281
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~
		EXIT
	END

	IF ~~ THEN BEGIN MRResolutionBhaalseedStupid2
		SAY @282
		= @283
		= @284
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~
		EXIT
	END

	IF ~~ THEN BEGIN MRResolutionHard
		SAY @285
		IF ~~ THEN GOTO MRResolutionBhaalThink2
	END

	IF ~~ THEN BEGIN MRResolutionBhaalThinkNonsense
	  SAY @286
	 IF ~CheckStatGT(Player1,8,INT)~ THEN REPLY @287 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionBhaalThinkLove
	 ++ @288 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionAlways
	 ++ @289 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionEnd
	 ++ @290 DO ~SetGlobal("MRResolutionTeasedAlready","LOCALS",1)~ GOTO MRResolutionWhore
	END

	IF ~~ THEN BEGIN MRResolutionEnd
		SAY @283
		= @291
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~
		EXIT
	END

	IF ~~ THEN BEGIN MRResolutionBhaalThinkLove
		SAY @292
	 IF ~~ THEN REPLY @83 GOTO MRResolutionHard
	 IF ~~ THEN REPLY @84 GOTO MRResolutionHard
	 ++ @77 GOTO MRResolutionEnd
	END

	IF ~~ THEN BEGIN MRResolutionWhore
			SAY @293
		= @294
		= @295
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~
		EXIT
	END

	IF ~~ THEN BEGIN MRResolution-FriendsHomo
		SAY @296
                = @297
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~
		EXIT
	END

	IF ~~ THEN BEGIN MRResolutionBhaalThink2
		SAY @298
                = @299
		= @300
	        ++ @217 GOTO MRResolutionLoveRight2
	 ++ @218 GOTO MRResolutionLoveRightDelay
	 ++ @301 GOTO MRResolution3Pointless
	 ++ @302 GOTO MRResolutionLoveRightEnd
        END

	IF ~~ THEN BEGIN MRResolutionLoveRightEnd
		SAY @303
		=
		@304
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~
		EXIT
	END

	IF ~~ THEN BEGIN MRResolutionLoveRightDelay
		SAY @305
	        ++ @217 GOTO MRResolutionLoveRight2
	 ++ @301 GOTO MRResolution3Pointless
	 ++ @302 GOTO MRResolutionLoveRightEnd
	END

	IF ~~ THEN BEGIN MRResolutionLoveRight2
		SAY @306
		++ @307 GOTO MRResolutionLoveRightBody
		++ @308 + MRResolutionLoveRightSoul
		++ @309 GOTO MRResolutionLoveRightSoul
	END

	IF ~~ THEN BEGIN MRResolutionLoveRightSoul
		SAY @310
		= @311
		++ @312 GOTO MRResolutionLoveRight3
		++ @313 GOTO MRResolutionLoveRight3
		++ @314 GOTO MRResolutionLoveRightEnd
	END

	IF ~~ THEN BEGIN MRResolutionLoveRightBody
		SAY @315
		=
			@316
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~
		EXIT
	END

	IF ~~ THEN BEGIN MRResolutionLoveRight3
		SAY @317
		=
		@318
                = @319
		IF ~~ THEN REPLY @320 GOTO MRResolutionLoveRightLOVEYOU
		++ @321 GOTO MRResolutionCRUSHING
	END
	
	IF ~~ MRResolutionCRUSHING
	   SAY @322
	   = @323
	   = @324
	   = @325
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) LeaveParty() EscapeArea()~ EXIT
	END


	IF ~~ THEN BEGIN MRResolutionLoveRightLOVEYOU
	   SAY ~(Your gentle embrace is rewarded by the softness of her skin, the warmth and yearning of her body. Imoen leans in and your mouths converge, restoring a link you were on the verge of never knowing again. Her tremulous breath touches your face, and you can sense her trepidation as you tenderly stroke her lips with yours.)~ [ MRImRom6 ]
           = @327
           = @189
           = @328
           IF ~~ THEN GOTO MRResolution10
        END
END
