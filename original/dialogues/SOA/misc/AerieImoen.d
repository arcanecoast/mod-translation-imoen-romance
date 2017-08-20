

// ********************************************************************************* //

/* The Imoen-Aerie Friendship */

/* We need to set the "MRAerieFriendshipTimer" when Aerie and Imoen meet in Spellhold... but only
if there's no opportunity for the Aerie-Imoen Romance Conflict above. So only set it if Aerie's
LoveTalks never got above 16, I guess?

We also need to set an "MRAerImFriend" global so we can track things.
Set this regardless of anything -- just set it automatically when they meet in Spellhold, and set it to 0
*/


/* The beginning of the actual friendship */

/* Triggers if the MRAerieFriendshipTimer has expired and MRAerImFriend == 0 */

CHAIN
IF ~Global("MRAerImFriend","GLOBAL",1)~ THEN AERIEJ MRAerImFriend
@0
DO ~SetGlobal("MRAerImFriend","GLOBAL",2) RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",1200)~
== IMOEN2J @1
== AERIEJ @2
== IMOEN2J @3
== AERIEJ @4
== IMOEN2J @5
== IMOEN2J @6
== AERIEJ @7
== IMOEN2J@8
== AERIEJ @9
== IMOEN2J @10
== IMOEN2J @11
== AERIEJ @12
= @13
EXIT
// ******************************************************************

CHAIN
IF ~Global("MRAerImFriend","GLOBAL",3)~ THEN IMOEN2J MRAerImFriend3
@14
DO ~SetGlobal("MRAerImFriend","GLOBAL",4) RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",1200)~
== AERIEJ @15
== IMOEN2J @16
== AERIEJ @17
= @18
== IMOEN2J @19
== AERIEJ @20
= @21
== IMOEN2J @22
== AERIEJ @23
== IMOEN2J @24
== AERIEJ @25
= @26

== IMOEN2J IF ~!Global("BodhiDead","GLOBAL",1)~ THEN @27
== IMOEN2J IF ~!Global("BodhiDead","GLOBAL",1)~ THEN @28
== AERIEJ IF ~!Global("BodhiDead","GLOBAL",1)~ THEN @29
== IMOEN2J IF ~!Global("BodhiDead","GLOBAL",1)~ THEN @30
== IMOEN2J IF ~!Global("BodhiDead","GLOBAL",1)~ THEN @31
== AERIEJ IF ~!Global("BodhiDead","GLOBAL",1)~ THEN @32
== IMOEN2J IF ~!Global("BodhiDead","GLOBAL",1)~ THEN @33
== AERIEJ IF ~!Global("BodhiDead","GLOBAL",1)~ THEN @34

== IMOEN2J IF ~Global("BodhiDead","GLOBAL",1)~ THEN @35
== AERIEJ IF ~Global("BodhiDead","GLOBAL",1)~ THEN @36
== IMOEN2J IF ~Global("BodhiDead","GLOBAL",1)~ THEN @37
== AERIEJ IF ~Global("BodhiDead","GLOBAL",1)~ THEN @38
== IMOEN2J IF ~Global("BodhiDead","GLOBAL",1)~ THEN @39
== IMOEN2J IF ~Global("BodhiDead","GLOBAL",1)~ THEN @40
== AERIEJ IF ~Global("BodhiDead","GLOBAL",1)~ THEN @41
== IMOEN2J IF ~Global("BodhiDead","GLOBAL",1)~ THEN @42
== IMOEN2J IF ~Global("BodhiDead","GLOBAL",1)~ THEN @43
== AERIEJ IF ~Global("BodhiDead","GLOBAL",1)~ THEN @44

== IMOEN2J @45
= @46
== AERIEJ @47
= @48
= @49
== IMOEN2J @50
==AERIEJ @51
EXIT

// *****************************************************************

CHAIN
IF ~Global("MRAerImFriend","GLOBAL",5)~ THEN AERIEJ MRAerImFriend7
@52
== IMOEN2J @53
== AERIEJ @54
= @55
== IMOEN2J @56
= @57
== AERIEJ @58
== IMOEN2J @59
== AERIEJ @60
= @61
== IMOEN2J @62
== AERIEJ @63
== IMOEN2J @64
= @65
== AERIEJ @66
==IMOEN2J @67
END
	IF ~~ THEN DO ~RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",1200) SetGlobal("MRAerImFriend","GLOBAL",6)~ EXIT

// ******************************************************************************
CHAIN
IF ~Global("MRAerImFriend","GLOBAL",7)~ THEN IMOEN2J MRAerImFriend9
@68
DO ~SetGlobal("MRAerImFriend","GLOBAL",8)~
== AERIEJ @69
== IMOEN2J @70
== AERIEJ @71
== IMOEN2J @72
== AERIEJ @73
== IMOEN2J @74
== AERIEJ @75
== IMOEN2J @76
== AERIEJ @77
== IMOEN2J @78
== AERIEJ @79
END IMOEN2J MRAerImPrank

APPEND IMOEN2J
IF ~~ THEN BEGIN MRAerImPrank
 SAY @80
 ++ @81 + MRAerImPrank1
 ++ @82 + MRAerImPrank1
 ++ @83 + MRAerImPrankShut
END

IF ~~ THEN BEGIN MRAerImPrank1
 SAY @84
 IF ~~ THEN EXTERN AERIEJ MRAerImPrank1Ae
END

IF ~~ THEN BEGIN MRAerImPrankShut
 SAY @85
 IF ~~ THEN EXTERN AERIEJ MRAerImPrank1Ae
END
END

APPEND AERIEJ
IF ~~ THEN BEGIN MRAerImPrank1Ae
 SAY @86
 = @87
 IF ~~ THEN EXTERN IMOEN2J MRAerImPrank1Im
END

IF ~~ THEN BEGIN MRAerImPrankPreCheckAer
 SAY @88
 IF ~~ THEN EXTERN IMOEN2J MRAerImPrankPreCheckIm
END
END

APPEND IMOEN2J
IF ~~ THEN BEGIN MRAerImPrank1Im
 SAY @89
 ++ @90 + MRAerImPrankCheck
 ++ @91 + MRAerImPrankPreCheck
 IF ~OR(2) CheckStatGT(Player1,13,INT) CheckStatGT(Player1,13,WIS)~ THEN REPLY @92 GOTO MRAerImPrankSmart
 ++ @93 + MRAerImPrankCheck
END

IF ~~ THEN BEGIN MRAerImPrankCheck
 SAY @94
 = @95
 = @96
 ++ @97 EXTERN AERIEJ MRAerImPrankReveal
 ++ @98 EXTERN AERIEJ MRAerImPrankReveal
 ++ @99 EXTERN AERIEJ MRAerImPrankReveal
 ++ @100 EXTERN AERIEJ MRAerImPrankReveal
 + ~OR(2) CheckStatGT(Player1,11,INT) CheckStatGT(Player1,11,WIS)~ + @101 + MRAerImPrankSmartNice
 + ~OR(2) CheckStatGT(Player1,11,INT) CheckStatGT(Player1,11,WIS)~ + @102 + MRAerImPrankSmart
END
END

CHAIN
AERIEJ MRAerImPrankReveal
@103
DO ~SetGlobal("MRAerImFriend","GLOBAL",9) RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",1200)~
== IMOEN2J @104
== AERIEJ @105
END IMOEN2J MRAerImPrankEnd

APPEND IMOEN2J
IF ~~ THEN BEGIN MRAerImPrankEnd
 SAY @106
 ++ @107 EXTERN AERIEJ MRAerImPrankEndSport
 ++ @108 + MRAerImPrankEndMiffed
 ++ @109 + MRAerImPrankEndHow
 ++ @110 + MRAerImPrankEndMiffed
 ++ @111 + MRAerImPrankEndMad
 ++ @112 + MRAerImPrankEndMiffed
END
END

CHAIN
IMOEN2J MRAerImPrankEndMiffed
@113
== AERIEJ @114
== IMOEN2J @115
== AERIEJ @116
== IMOEN2J @117
== AERIEJ @118
== IMOEN2J @119
EXIT

CHAIN
IMOEN2J MRAerImPrankEndMad
@120
= @121
== AERIEJ @122
EXIT

CHAIN
IMOEN2J MRAerImPrankEndHow
@123
== AERIEJ @124
== IMOEN2J @125
== AERIEJ @126
== IMOEN2J @127
EXIT

CHAIN
AERIEJ MRAerImPrankEndSport
@128
== IMOEN2J @129
== AERIEJ @130
== IMOEN2J @131
== AERIEJ @132
== IMOEN2J @133
== AERIEJ @134
== IMOEN2J @135
== AERIEJ @136
= @137
== IMOEN2J @138
EXIT

APPEND IMOEN2J
IF ~~ THEN BEGIN MRAerImPrankPreCheck
 SAY @139
 IF ~~ THEN EXTERN AERIEJ MRAerImPrankPreCheckAer
END

IF ~~ THEN BEGIN MRAerImPrankPreCheckIm
 SAY @140
 ++ @141 + MRAerImPrankCheck
 IF ~OR(2) CheckStatGT(Player1,13,INT) CheckStatGT(Player1,13,WIS)~ THEN REPLY @142 GOTO MRAerImPrankSmart
 ++ @93 + MRAerImPrankCheck
END
END


CHAIN
IMOEN2J MRAerImPrankSmart
@143
DO ~SetGlobal("MRAerImFriend","GLOBAL",9) RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",1200)~
== AERIEJ @144
== IMOEN2J @145
== AERIEJ @146
== IMOEN2J @147
= @148
EXIT

CHAIN
IMOEN2J MRAerImPrankSmartNice
@149
DO ~SetGlobal("MRAerImFriend","GLOBAL",9) RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",1200)~
== AERIEJ @144
== IMOEN2J @150
== AERIEJ @146
== IMOEN2J @147
= @151
EXIT


// *********************************************************************************************

CHAIN
IF ~Global("MRAerImFriend","GLOBAL",10)~ THEN IMOEN2J MRAerImFriend15
@152
DO ~SetGlobal("MRAerImFriend","GLOBAL",11)~
== AERIEJ @153
== IMOEN2J @154
== AERIEJ @155
== IMOEN2J @156
== AERIEJ @157
= @158
= @159
= @160
= @161
== IMOEN2J @162
== AERIEJ @163
== IMOEN2J @164
== AERIEJ @165
== IMOEN2J @166
= @167
== AERIEJ @168
= @169
== IMOEN2J @170
== AERIEJ @171
== IMOEN2J @172
== AERIEJ @173
== IMOEN2J @174
END
	IF ~~ THEN DO ~RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",1200)~ EXIT

// *****************************************************************************

APPEND PLAYER1
	IF ~Global("MRAerImFriend","GLOBAL",12)~ THEN BEGIN MRAerImFriend18
		SAY @175
		=
		@176
		++ @177 DO ~ActionOverride(Player1,SetDialog("Player1")) SetGlobal("MRAerImFriend","GLOBAL",13)~ GOTO MRAerImFriend19
		++ @178 DO ~ActionOverride(Player1,SetDialog("Player1")) SetGlobal("MRAerImFriend","GLOBAL",13)~ GOTO MRAerImFriend18Hey
		++ @179 DO ~ActionOverride(Player1,SetDialog("Player1")) SetGlobal("MRAerImFriend","GLOBAL",13)~ GOTO MRAerImFriend18Lame
		++ @180 DO ~ActionOverride(Player1,SetDialog("Player1")) SetGlobal("MRAerImFriend","GLOBAL",13)~ GOTO MRAerImFriend18Private
	END

	IF ~~ THEN BEGIN MRAerImFriend18Lame
		SAY @181
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRAerImFriend18Private
		SAY @182
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRAerImFriend18Hey
		SAY @183
		IF ~~ THEN EXTERN IMOEN2J MRAerImFriend18Hey2
	END

	IF ~~ THEN BEGIN MRAerImFriend18Hey4
		SAY @184
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRAerImFriend19
		SAY @185
		IF ~~ THEN EXTERN AERIEJ MRAerImFriend20
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRAerImFriend18Hey2
		SAY @186
		IF ~~ THEN EXTERN AERIEJ MRAerImFriend18Hey3
	END

END


APPEND AERIEJ
	IF ~~ THEN BEGIN MRAerImFriend18Hey3
		SAY @186
		IF ~~ THEN EXTERN PLAYER1 MRAerImFriend18Hey4
	END

	IF ~~ THEN BEGIN MRAerImFriend20
		SAY @187
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN EXTERN IMOEN2J MRAerImFriend21Rom
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN EXTERN IMOEN2J MRAerImFriend21NoRom
	END
END

CHAIN
IMOEN2J MRAerImFriend21NoRom
@188
== AERIEJ @189
== IMOEN2J @190
== AERIEJ @191
== IMOEN2J @192
== AERIEJ @193
== IMOEN2J @194
== AERIEJ @195

== IMOEN2J IF ~Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @196
== AERIEJ IF ~Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @197
== IMOEN2J IF ~Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @198
== AERIEJ IF ~Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @199
== IMOEN2J IF ~Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @200

== IMOEN2J IF ~!Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @201
== AERIEJ IF ~!Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @202
== IMOEN2J IF ~!Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @203

== AERIEJ @204
== IMOEN2J @205
== AERIEJ @206
== IMOEN2J @207
== AERIEJ @208
== IMOEN2J @209
== AERIEJ @210
END IMOEN2J MRAerImFriendShockNoRom

CHAIN 
IMOEN2J MRAerImFriend21Rom
@188
== AERIEJ @211
== IMOEN2J @212
== AERIEJ @191
== IMOEN2J @192
== AERIEJ @193
== IMOEN2J @194
== AERIEJ @195


== IMOEN2J IF ~Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @196
== AERIEJ IF ~Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @213
== IMOEN2J IF ~Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @214
== AERIEJ IF ~Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @215


== IMOEN2J IF ~!Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @216
== AERIEJ IF ~!Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @217
== IMOEN2J IF ~!Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @218
== AERIEJ IF ~!Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @219
== IMOEN2J IF ~!Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @214
== AERIEJ IF ~!Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @220
== IMOEN2J IF ~!Global("HaerDalisRomanceActive","GLOBAL",2)~ THEN @221


== IMOEN2J @222
== AERIEJ @208
== IMOEN2J @223
== AERIEJ @210
END IMOEN2J MRAerImFriendShock

APPEND IMOEN2J
 IF ~~ THEN BEGIN MRAerImFriendShock
 SAY @224
 ++ @225 + MRAerImFriendKnewit
 ++ @226 + MRAerImFriendKnewit
 ++ @227 + MRAerImFriendKnewit
 ++ @228 + MRAerImFriendKnewit
 ++ @229 + MRAerImFriendWalk
 END
 
 IF ~~ THEN BEGIN MRAerImFriendShockNoRom
 SAY @230
 ++ @225 + MRAerImFriendKnewit
 ++ @226 + MRAerImFriendKnewit
 ++ @227 + MRAerImFriendKnewit
 ++ @228 + MRAerImFriendKnewit
 ++ @229 + MRAerImFriendWalk
 END
END

CHAIN
IMOEN2J MRAerImFriendKnewit
@231
== AERIEJ @232
== IMOEN2J @233
== IMOEN2J IF ~Gender(Player1,MALE)~ THEN @234
== IMOEN2J IF ~Gender(Player1,FEMALE)~ THEN @235
EXIT

CHAIN
IMOEN2J MRAerImFriendWalk
@236
== AERIEJ @237
== IMOEN2J @238
== IMOEN2J IF ~Gender(Player1,MALE)~ THEN @234
== IMOEN2J IF ~Gender(Player1,FEMALE)~ THEN @235
EXIT




