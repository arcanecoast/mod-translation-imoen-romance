
//** Love Talk 1 - Rescue from Spellhold **//
APPEND IMOEN2J
	IF ~Global("MRLoveTalk","GLOBAL",1) RealGlobalTimerExpired("MRImoenLovetalkTimer","GLOBAL")~ THEN BEGIN MRLoveTalk1
	 SAY ~You really took your time coming to rescue me, didn't ya?~ [ MRImRom1]
	 IF ~~ THEN DO ~IncrementGlobal("MRLoveTalk","GLOBAL",1) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ GOTO MRLoveTalk1-1
	END

	IF ~~ MRLoveTalk1-1
	 SAY @1
	 ++ @2 + MRLoveTalk1-1Gold
	 ++ @3 + MRLoveTalk1-1Gold
	 ++ @4 + MRLoveTalk1-1Busy
	 ++ @5 + MRLoveTalk1-1Tool
	END

	IF ~~ MRLoveTalk1-1Tool
	 SAY @6
	 =
	 @7
	 =
	 @8
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	END

	IF ~~ MRLoveTalk1-1Busy
	 SAY @9
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ MRLoveTalk1-1Gold
	 SAY @10
	 + ~!Alignment(Player1,LAWFUL_EVIL)
	 !Alignment(Player1,NEUTRAL_EVIL)
	 !Alignment(Player1,CHAOTIC_EVIL)~ + @11 + MRLoveTalk1-1GoldGood
	 + ~OR(3)
	 Alignment(Player1,LAWFUL_EVIL)
	 Alignment(Player1,NEUTRAL_EVIL)
	 Alignment(Player1,CHAOTIC_EVIL)~ + @11 + MRLoveTalk1-1GoldLie
	 + ~!Alignment(Player1,LAWFUL_EVIL)
	 !Alignment(Player1,NEUTRAL_EVIL)
	 !Alignment(Player1,CHAOTIC_EVIL)~ + @12 + MRLoveTalk1-1GoldNeu
	 + ~OR(3)
	 Alignment(Player1,LAWFUL_EVIL)
	 Alignment(Player1,NEUTRAL_EVIL)
	 Alignment(Player1,CHAOTIC_EVIL)~ + @12 + MRLoveTalk1-1GoldLie
	 ++ @13+ MRLoveTalk1-1GoldEvil
	 ++ @14 + MRLoveTalk1-1Spell
	 ++ @15 + MRLoveTalk1-1Spell
	END

	IF ~~ MRLoveTalk1-1GoldLie
	 SAY @16
	 IF ~~ + MRLoveTalk1-1Spell
	END

	IF ~~ MRLoveTalk1-1GoldEvil
	 SAY @17
	 ++ @18 + MRLoveTalk1-1Cor
	 ++ @19 + MRLoveTalk1-1GoldEvil1
	 ++ @20 + MRLoveTalk1-1Tool
	END

	IF ~~ MRLoveTalk1-1GoldEvil1
	 SAY @21
	 IF ~~ THEN GOTO MRLoveTalk1-1Spell
	END

	IF ~~ MRLoveTalk1-1Cor
	 SAY @22
	 IF ~~ THEN GOTO MRLoveTalk1-1Spell
	END

	IF ~~ MRLoveTalk1-1GoldNeu
	 SAY @23
	 IF ~~ THEN GOTO MRLoveTalk1-1Spell
	END

	IF ~~ MRLoveTalk1-1GoldGood
	 SAY @24
	 IF ~~ THEN GOTO MRLoveTalk1-1Spell
	END

	IF ~~ MRLoveTalk1-1Spell
	 SAY @25
	 + ~InParty("Minsc")~ + @26 + MRLoveTalk1-1SpellMinsc
	 + ~!InParty("Minsc")~ + @27 + MRLoveTalk1-1SpellCrazy
	 ++ @28 + MRLoveTalk1-1SpellWard
	 ++ @29 + MRLoveTalk1-1SpellDeny
	 ++ @30 + MRLoveTalk1-1Thanks
	END

	IF ~~ MRLoveTalk1-1SpellDeny
	 SAY @31
	 =
	 @32
	 IF ~~ THEN GOTO MRLoveTalk1-1Thanks
	END

	IF ~~ MRLoveTalk1-1SpellMinsc
	 SAY @33
	 IF ~~ THEN EXTERN MINSCJ MRLoveTalk1-1SpellMinsc
	END

	IF ~~ MRLoveTalk1-1SpellMinsc2
	 SAY @34
	 IF ~~ THEN GOTO MRLoveTalk1-1Thanks
	END

	IF ~~ MRLoveTalk1-1SpellCrazy
	 SAY @35
	 =
	 @36
	 IF ~~ THEN GOTO MRLoveTalk1-1Thanks
	END

	IF ~~ MRLoveTalk1-1SpellWard
	 SAY @37
	 IF ~~ THEN GOTO MRLoveTalk1-1Thanks
	END

	IF ~~ MRLoveTalk1-1Thanks
	 SAY ~Hey...~ [ MRImRom5 ]
	 =
	 @39
	 =
	 @40
	 ++ @41 + MRLoveTalk1-1ThanksLove
	 ++ @42 + MRLoveTalk1-1ThanksFriends
	 ++ @43 + MRLoveTalk1-1ThanksTool
	 ++ @44 + MRLoveTalk1-1ThanksRevenge
	 ++ @45 + MRLoveTalk1-1ThanksPet
	END

	IF ~~ MRLoveTalk1-1ThanksPet
	 SAY @46
	 =
	 @47
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk1-1ThanksRevenge
	 SAY @48
	 = @49
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ MRLoveTalk1-1ThanksFriends
	 SAY @50
         = @51
         = @52
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk1-1ThanksLove
	 SAY @53
	 = @54
	 = @55
	 IF ~~THEN EXIT
	END

	IF ~~ MRLoveTalk1-1ThanksTool
	 SAY @56
	 =
	 @57
	 IF ~~ THEN EXIT
	END
END


APPEND MINSCJ
	IF ~~ MRLoveTalk1-1SpellMinsc
	 SAY @58
	 IF ~~ THEN EXTERN IMOEN2J MRLoveTalk1-1SpellMinsc2
	END
END

//** Love Talk 2 - Being Siblings **//
APPEND IMOEN2J
	IF ~Global("MRLoveTalk","GLOBAL",3)~ THEN BEGIN MRLoveTalk2
	 SAY ~Y'know... it's kinda weird, finding out I'm your sister.~ [ MRImRom1]
	 = @60
	 = @61
	 IF ~~ THEN REPLY @62 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) SetGlobal("MRLoveTalk","GLOBAL",4)~ GOTO MRLoveTalk2Sis
	 IF ~~ THEN REPLY @63 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) SetGlobal("MRLoveTalk","GLOBAL",4)~ GOTO MRLoveTalk2Jerk
	 IF ~~ THEN REPLY @64 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) SetGlobal("MRLoveTalk","GLOBAL",4)~ GOTO MRLoveTalk2Weird
	 IF ~~ THEN REPLY @65 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) SetGlobal("MRLoveTalk","GLOBAL",4)~ GOTO MRLoveTalk2Think
	 IF ~~ THEN REPLY @66 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) SetGlobal("MRLoveTalk","GLOBAL",4)~ GOTO MRLoveTalk2Friend
	END

	IF ~~ MRLoveTalk2Jerk
	 SAY @67
	 ++ @68 + MRLoveTalk2Jerk2
	 ++ @69 + MRLoveTalk2Reload
	 + ~Race(Player1,HALFORC)~ + @70 + MRLoveTalk2Orc
	END

	IF ~~ MRLoveTalk2Orc
	 SAY @71
	 ++ @72 + MRLoveTalk2Jerk2
	 ++ @73 + MRLoveTalk2Reload
	END

	IF ~~ MRLoveTalk2Reload
	 SAY @74
	 ++ @75 + MRLoveTalk2Sis
	 ++ @64 + MRLoveTalk2Weird
	 ++ @76 + MRLoveTalk2Think
	 ++ @66 + MRLoveTalk2Friend
	END

	IF ~~ MRLoveTalk2Jerk2
	 SAY @77
	 IF ~!Race(Player1,HALFORC)~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	 IF ~Race(Player1,HALFORC)~ + MRLoveTalk2Jerk2_1
	END

	IF ~~ MRLoveTalk2Jerk2_1
	 SAY @78
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	END

	IF ~~ MRLoveTalk2Think
	 SAY @79
	 ++ @80 + MRLoveTalk2Friend
	 ++ @81 + MRLoveTalk2Sis
	 ++ @82 + MRLoveTalk2Weird
	END

	IF ~~ MRLoveTalk2Weird
	 SAY @83
	 IF ~~ THEN GOTO MRLoveTalk2-2
	END

	IF ~~ MRLoveTalk2Sis
	 SAY @84
	 IF ~~ THEN GOTO MRLoveTalk2-2
	END

	IF ~~ MRLoveTalk2Friend
	 SAY @85
	 IF ~~ THEN GOTO MRLoveTalk2-2
	END

	IF ~~ MRLoveTalk2-2
	 SAY @86
	 = @87
	 = @88
	 ++ @89 + MRLoveTalk2-2Feel
	 ++ @90 + MRLoveTalk2-2Same2 
	 ++ @91 + MRLoveTalk2-2Evil2
	END

	IF ~~ MRLoveTalk2-2Feel
	 SAY @92
	 IF ~~ THEN GOTO MRLoveTalk2-3
	END


	IF ~~ MRLoveTalk2-2Same2
	 SAY @93
	 IF ~~ THEN GOTO MRLoveTalk2-3
	END


	IF ~~ MRLoveTalk2-2Evil2
	 SAY @94
	 =
	 @95
	 IF ~~ THEN GOTO MRLoveTalk2-2EvilNext
	END

	IF ~~ MRLoveTalk2-2EvilNext
	 SAY @96
	 ++ @97 + MRLoveTalk2-2EvilDumb
	 ++ @98 + MRLoveTalk2-2EvilSnap
	 ++ @99 + MRLoveTalk2-2Corrupt
	END

	IF ~~ MRLoveTalk2-2Corrupt
	 SAY @100
	 ++ @101 + MRLoveTalk2-2CorruptSoft
	 ++ @102 + MRLoveTalk2-2CorruptHarm
	 ++ @103 + MRLoveTalk2-2CorruptWolf
	END

	IF ~~ MRLoveTalk2-2CorruptSoft
	 SAY @104
	 ++ @105 + MRLoveTalk2-2CorruptHarm
	 ++ @106 + MRLoveTalk2-2CorruptWolf
	 ++ @107 + MRLoveTalk2-2CorruptSheep
	END

	IF ~~ MRLoveTalk2-2CorruptHarm
	 SAY @108
	 ++ @109 + MRLoveTalk2-2CorruptWolf
	 ++ @110 + MRLoveTalk2-2CorruptWolf
         ++ @111 + MRLoveTalk2-2CorruptDeep
	 ++ @112 + MRLoveTalk2-2CorruptSheep
	END

	IF ~~ MRLoveTalk2-2CorruptWolf
	 SAY @113
	 =
	 @114
	 =
	 @115
	 IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
	END

	IF ~~ MRLoveTalk2-2CorruptDeep
	 SAY @116
	 =
	 @117
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
	END

	IF ~~ MRLoveTalk2-2CorruptSheep
	 SAY @118
	 =
	 @117
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
	END

	IF ~~ MRLoveTalk2-2EvilSnap
	 SAY @119
	 = @120
	 ++ @121 + MRLoveTalk2-2EvilDumb2
	 ++ @122 + MRLoveTalk2-2EvilDumb2
	 ++ @123 + MRLoveTalk2-2EvilDumbEnd
	 ++ @124 + MRLoveTalk2-2ThreatEnd
	END

        IF ~~ MRLoveTalk2-2ThreatEnd
           SAY @125
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
	END

	IF ~~ MRLoveTalk2-2EvilDumb
	 SAY @126
	 =
	 @127
	 ++ @121 + MRLoveTalk2-2EvilDumb2
	 ++ @122 + MRLoveTalk2-2EvilDumb2
	 ++ @128 + MRLoveTalk2-2EvilDumbEnd
	 ++ @124 + MRLoveTalk2-2ThreatEnd
	END

	IF ~~ MRLoveTalk2-2EvilDumb2
	 SAY @129
	 IF ~~ THEN GOTO MRLoveTalk2-2EvilDumbEnd
	END

	IF ~~ MRLoveTalk2-2EvilDumbEnd
	 SAY @130
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ MRLoveTalk2-3
	 SAY @131
	 ++ @132 + MRLoveTalk2-3End
	 + ~!Race(Player1,HUMAN)~ + @133 + MRLoveTalk2-3Race
	END
END

CHAIN IMOEN2J MRLoveTalk2-3End
 @134
 == IMOEN2J IF ~Gender(Player1,MALE)~ THEN @135
 == IMOEN2J IF ~Gender(Player1,FEMALE)~ THEN @136
 == IMOEN2J @137
 =
 @138
EXIT

CHAIN IMOEN2J MRLoveTalk2-3Race
 @139
 =
 @140
  == IMOEN2J IF ~IsValidForPartyDialog("Aerie") ~ THEN @141
 == IMOEN2J IF ~IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Aerie")~ THEN @142
 == IMOEN2J IF ~!IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Anomen")~ THEN @143
 == IMOEN2J IF ~!IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Anomen")~ THEN @144
 == IMOEN2J IF ~!IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Anomen")~ THEN @145
END
 IF ~!IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Anomen")~ THEN EXIT
  IF ~ IsValidForPartyDialog("Aerie")~ THEN EXTERN AERIEJ MRLoveTalk2-3Race
 IF ~IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Aerie")~ THEN EXTERN VICONIJ MRLoveTalk2-3Race
 IF ~!IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Anomen")~THEN EXTERN ANOMENJ MRLoveTalk2-3Race

APPEND IMOEN2J
	IF ~~ MRLoveTalk2-3RaceVic
	 SAY @146
	 =
	 @147
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk2-3RaceAer
	 SAY @148
	 =
	 @149
	 =
	 @150
	 IF ~~ THEN EXIT
 END

	IF ~~ MRLoveTalk2-3RaceAno
	 SAY @151
	 =
	 @152
	 =
	 @153
	 =
	 @154
	 IF ~~ THEN EXIT
	END
END

APPEND VICONIJ
	IF ~~ MRLoveTalk2-3Race
	 SAY @155
	 IF ~~ THEN EXTERN IMOEN2J MRLoveTalk2-3RaceVic
	END
END

APPEND AERIEJ
	IF ~~ MRLoveTalk2-3Race
	 SAY @156
	 IF ~~ THEN EXTERN IMOEN2J MRLoveTalk2-3RaceAer
	END
END

APPEND ANOMENJ
	IF ~~ MRLoveTalk2-3Race
	 SAY @157
	 IF ~~ THEN EXTERN IMOEN2J MRLoveTalk2-3RaceAno
	END
END

//** Love Talk 3 - Dreams, part 1 **//
APPEND IMOEN2J
	IF ~Global("MRLoveTalk","GLOBAL",5) RealGlobalTimerExpired("MRImoenLovetalkTimer","GLOBAL") ~ THEN BEGIN MRLoveTalk3 
	 SAY @158
	 =
	 ~Haha, sorry to startle ya. I was just... well, thinking 'bout something you said, back in Spellhold. If you have a minute?~ [ MRImRom1]
	 IF ~~ THEN REPLY @160 GOTO MRLoveTalk3Busy
	 IF ~~ THEN REPLY @161 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) IncrementGlobal("MRLoveTalk","GLOBAL",1)~ GOTO MRLoveTalk3-1
	 IF ~~ THEN REPLY @162 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) IncrementGlobal("MRLoveTalk","GLOBAL",1)~ GOTO MRLoveTalk3Lala
	END

	IF ~~ MRLoveTalk3Busy
	 SAY @163

	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",1000)~ EXIT
	END

	IF ~~ MRLoveTalk3Lala
	 SAY @164
	 ++ @165 + MRLoveTalk3Works
	 ++ @166 + MRLoveTalk3Ears
	 ++ @167 + MRLoveTalk3Rude
	END

	IF ~~ MRLoveTalk3Works
	 SAY @168
	 = @169
	 ++ @170 + MRLoveTalk3-1
	 ++ @171 + MRLoveTalk3Rude
	END

	IF ~~ MRLoveTalk3Ears
	 SAY @172
	 = @173
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~EXIT
	END

	IF ~~ MRLoveTalk3Rude
	 SAY @174
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~EXIT
	END

	IF ~~ MRLoveTalk3-1
	 SAY @175
	 ++ @176 + MRLoveTalk3-1Deny
	 ++ @177 + MRLoveTalk3-2
	 ++ @178 + MRLoveTalk3Rude
	END

	IF ~~ MRLoveTalk3-1Deny
	 SAY @179
	 ++ @180 + MRLoveTalk3-1Deny1
	 ++ @181 + MRLoveTalk3-2
	 ++ @182 + MRLoveTalk3-2
	END

	IF ~~ MRLoveTalk3-1Deny1
	 SAY @183
	 IF ~~ THEN GOTO MRLoveTalk3-2
	END

	IF ~~ MRLoveTalk3-2
	 SAY @184
	 ++ @185 + MRLoveTalk3Rude
	 ++ @186 + MRLoveTalk3-2AskDeny
	 ++ @187 + MRLoveTalk3-2Ask
	 ++ @188 + MRLoveTalk3-2Nervous
	 ++ @189 + MRLoveTalk3Busy
	 ++ @190 + MRLoveTalk3-3
	END

	IF ~~ MRLoveTalk3-2Nervous
	 SAY @191
	 ++ @192 + MRLoveTalk3-2Nervous2
	 ++ @193 + MRLoveTalk3-2Nervous4
	END

	IF ~~ MRLoveTalk3-2Nervous2
	 SAY @194
	 ++ @195 + MRLoveTalk3-2Nervous3
	 ++ @196 + MRLoveTalk3-2Nervous4
	END

	IF ~~ MRLoveTalk3-2Nervous3
	 SAY @197
	 IF ~~THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ MRLoveTalk3-2Nervous4
	 SAY @198
	 ++ @186 + MRLoveTalk3-2AskDeny
	 ++ @185+ MRLoveTalk3Rude
	 ++ @187 + MRLoveTalk3-2Ask
	 ++ @189 + MRLoveTalk3Busy
	 ++ @199 + MRLoveTalk3-3
	END

	IF ~~ MRLoveTalk3-2Ask
	 SAY @200
	 ++ @186 + MRLoveTalk3-2AskDeny
	 ++ @185 + MRLoveTalk3Rude
	 ++ @190 + MRLoveTalk3-3
	END

	IF ~~ MRLoveTalk3-2AskDeny
	 SAY @201
	 ++ @202 + MRLoveTalk3Busy
	 ++ @203 + MRLoveTalk3-3
	END

	IF ~~ MRLoveTalk3-3
	 SAY @204
	 ++ @205 + MRLoveTalk3-White
	 ++ @206 + MRLoveTalk3-White2
	 ++ @207 + MRLoveTalk3-3Lie
	 ++ @208 + MRLoveTalk3-3Deny
	END

	IF ~~ MRLoveTalk3-3Deny
	 SAY @209
	 ++ @210 + MRLoveTalk3-White
	 ++ @211 + MRLoveTalk3-White2
	 ++ @212 + MRLoveTalk3-3Lie
	 ++ @213 + MRLoveTalk3-2Nervous3
	END
END

CHAIN IMOEN2J MRLoveTalk3-3Lie
 @214
 == IMOEN2J IF ~OR(4) Time(1) Time(2) Time(3) Time(20)~ THEN @215
 == IMOEN2J IF ~OR(4) Time(4) Time(5) Time(6) Time(19)~ THEN @216
 == IMOEN2J IF ~OR(4) Time(7) Time(8) Time(9) Time(18)~ THEN @217
 == IMOEN2J IF ~OR(4) Time(10) Time(11) Time(12) Time(17)~ THEN @218
 == IMOEN2J IF ~OR(4) Time(13) Time(14) Time(15) Time(16)~ THEN @219
 == IMOEN2J IF ~OR(4) Time(21) Time(22) Time(23) Time(24)~ THEN @220
END
 ++ @221 EXTERN IMOEN2J MRLoveTalk3-3Tyr
 ++ @222 EXTERN IMOEN2J MRLoveTalk3-3Exagg

APPEND IMOEN2J
	IF ~~ MRLoveTalk3-3Tyr
	 SAY @223
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~EXIT
	END

	IF ~~ MRLoveTalk3-3Exagg
	 SAY @224
	 ++ @210 + MRLoveTalk3-White
	 ++ @211 + MRLoveTalk3-White2
	 ++ @225 + MRLoveTalk3-3ExaggEnd
	END

	IF ~~ MRLoveTalk3-3ExaggEnd
	 SAY @226
	 = @227
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~EXIT
	END
 
 IF ~~ THEN MRLoveTalk3-White 
	 SAY @228
	 IF ~~ THEN GOTO MRLoveTalk3WhiteR
         END

 IF ~~ THEN MRLoveTalk3-White2
	 SAY @229
	 = @230
	 IF ~~ THEN GOTO MRLoveTalk3WhiteR
 END


   IF ~~ MRLoveTalk3WhiteR
       SAY @231
	 ++ @232 + MRLoveTalk3-WhiteLie
	 ++ @233 + MRLoveTalk3DreamIm
	 ++ @234 + MRLoveTalk3Certain
	 ++ @235 + MRLoveTalk3Confused
	END

	IF ~~ MRLoveTalk3-WhiteLie
	 SAY @236
	 IF ~~ + MRLoveTalk3-4
	END

        IF ~~ MRLoveTalk3Confused
           SAY @237
	 IF ~~ + MRLoveTalk3-4
	END

   	IF ~~ MRLoveTalk3Certain
   	   SAY @238
	 IF ~~ + MRLoveTalk3-4
	END

	IF ~~ MRLoveTalk3DreamIm
	 SAY @239
	 IF ~~ + MRLoveTalk3-4
	END

	IF ~~ MRLoveTalk3-4
	 SAY @240
	 ++ @241 + MRLoveTalk3-4Same
	 ++ @242 + MRLoveTalk3-5
	 ++ @243 + MRLoveTalk3-4End
	END

	IF ~~ MRLoveTalk3-4End
	 SAY @244
         = @245
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	END
	
	IF ~~ MRLoveTalk3-4Same
	 SAY @246
	 IF ~~ + MRLoveTalk3-5
	END

	IF ~~ MRLoveTalk3-5
	 SAY @247
	 =
	 @248
	 IF ~CheckStatGT(Player1,11,CHR) Global("ImoenRomanceActive","GLOBAL",1)~ THEN REPLY @249 + MRLoveTalk3-5Press1
	 IF ~OR(2) Global("ImoenRomanceActive","GLOBAL",4) Global("ImoenRomanceActive","GLOBAL",3)~ THEN REPLY @249 + MRLoveTalk3-5Press2
	 IF ~!CheckStatGT(Player1,11,CHR) Global("ImoenRomanceActive","GLOBAL",1)~ THEN REPLY @249 + MRLoveTalk3-5Press3
	 ++ @250 + MRLoveTalk3-5Sorry
	 ++ @251 + MRLoveTalk3-5End
	END

	IF ~~ MRLoveTalk3-5Sorry
	 SAY @252
	 ++ @249 + MRLoveTalk3-5Press1
	 ++ @253 + MRLoveTalk3-5Press1
	END

	IF ~~ MRLoveTalk3-5Press1
	 SAY @254
	 =
	 @255
	 =
	 @256
	 ++ @257 + MRLoveTalk3-5Press1Okay
	 ++ @258 + MRLoveTalk3-5Press1Kinky
	 ++ @259 + MRLoveTalk3-5Press1Help
	END

	IF ~~ MRLoveTalk3-5Press1Okay
	 SAY @260
	 =
	 @261
	 =
	 @262
	 IF ~~ THEN EXIT
	END
	
       	IF ~~ MRLoveTalk3-5Press1Help
       	   SAY @263
       	   = @264
       	   = @265
       	   IF ~~ THEN EXIT
        END

	IF ~~ THEN BEGIN MRLoveTalk3-5Press2
	SAY @266
		++ @267 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",1)~ GOTO MRLoveTalk3-5Press2Sincere
		++ @268 GOTO MRLoveTalk3-5End
		++ @269 GOTO MRLoveTalk3-5Press2Press
	END
	IF ~~ THEN BEGIN MRLoveTalk3-5Press2Sincere
		SAY @270
		=
		@271
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
	END

	IF ~~ THEN BEGIN MRLoveTalk3-5Press2Press
		SAY @272
		=
		@273
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
	END

	IF ~~ THEN BEGIN MRLoveTalk3-5Press3
		SAY @274
		=
		@275
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
	END

	IF ~~ MRLoveTalk3-5Press1Kinky
	 SAY @276
	 ++ @277 + MRLoveTalk3-5Press1KinkyHot
	 ++ @278 + MRLoveTalk3-5Press1KinkyPlay
	 + ~Gender(Player1,MALE)~ + @279 + MRLoveTalk3-5Press1KinkyGrossM
	 + ~Gender(Player1,FEMALE)~ + @279 + MRLoveTalk3-5Press1KinkyGrossF
	 ++ @280 + MRLoveTalk3-5NormExit
	END
	
	IF ~~ MRLoveTalk3-5NormExit
	   SAY @281
	   IF ~~ THEN EXIT
        END

	IF ~~ MRLoveTalk3-5Press1KinkyPlay
	   SAY @282
	   IF ~~ THEN EXIT
        END

	IF ~~ MRLoveTalk3-5Press1KinkyGrossM
	 SAY @283
	 ++ @284 + MRLoveTalk3-5Press1KinkyGross2
	 ++ @285 + MRLoveTalk3-5Press1KinkySoM
	 ++ @286 + MRLoveTalk3-5Press1KinkyGross2
	END

	IF ~~ MRLoveTalk3-5Press1KinkyGrossF
	 SAY @287
	 ++ @284 + MRLoveTalk3-5Press1KinkyGross2
	 ++ @288 + MRLoveTalk3-5Press1KinkySoF
	 ++ @286 + MRLoveTalk3-5Press1KinkyGross2
	END

	IF ~~ MRLoveTalk3-5Press1KinkySoF
	 SAY @289
	 =
	 @290
	 ++ @291 + MRLoveTalk3-5Press1KinkySoFStraight
	 ++ @292 + MRLoveTalk3-5Press1KinkySoFGay
	 ++ @293 + MRLoveTalk3-5Press1KinkySoFChange
	 ++ @294 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ MRLoveTalk3-5Press1KinkySoFChange
	 SAY @295
	 ++ @296 + MRLoveTalk3-5Press1KinkySoFStraight
	 ++ @292 + MRLoveTalk3-5Press1KinkySoFGay
	 ++ @294 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ MRLoveTalk3-5Press1KinkySoFGay
	 SAY @297
	 =
	 @298
	 ++ @299 + MRLoveTalk3-5Press1KinkySoFGay2
	 ++ @300 + MRLoveTalk3-5Bothways
	 ++ @301 + MRLoveTalk3-5Press1KinkySoFGay2
	END
	
	IF ~~ MRLoveTalk3-5Bothways
	   SAY @302
	   = @303
	   = @304
	 IF ~~ THEN EXIT
	END


	IF ~~ MRLoveTalk3-5Press1KinkySoFGay2
	 SAY @305
	 =
	 @303
	 =
	 @304
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk3-5Press1KinkySoFStraight
	 SAY @306
         = @307
	 =
	 @308
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk3-5Press1KinkySoM
	 SAY @309
	 =
	 @310
	 ++ @311 + MRLoveTalk3-5Press1KinkySoMSex
	 ++ @312 + MRLoveTalk3-5Press1KinkySoMThink
	 ++ @313 + MRLoveTalk3-5Press1KinkySoMLove
	END

	IF ~~ MRLoveTalk3-5Press1KinkySoMLove
	 SAY @314
	 =
	 @315
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk3-5Press1KinkySoMSex
	 SAY @316
	 =
	 @317
	 =
	 @318
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ MRLoveTalk3-5Press1KinkySoMThink
	 SAY @319
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk3-5Press1KinkyGross2
	 SAY @320
	 IF ~~THEN EXIT
	END


	IF ~~ MRLoveTalk3-5Press1KinkyHot
	 SAY @321
	 =
	 @322
	 IF ~~THEN EXIT
	END

	IF ~~ MRLoveTalk3-5End
	 SAY @323
	 =
	 @324
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END
END

//** Love Talk 4 - Dreams, part 2 **//

APPEND IMOEN2J
	IF ~Global("MRLoveTalk","GLOBAL",7)~ THEN BEGIN MRLoveTalk4
	 SAY ~<CHARNAME>, I feel a tiny bit bad. I kinda brushed you off earlier, 'bout the dreams thing.~ [ MRImRom1]
	 IF ~~ THEN REPLY @326 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) IncrementGlobal("MRLoveTalk","GLOBAL",1)~ GOTO MRLoveTalk4-Door
	 IF ~~ THEN REPLY @327 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) IncrementGlobal("MRLoveTalk","GLOBAL",1)~ GOTO MRLoveTalk4-Mean
	 IF ~~ THEN REPLY @328 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) IncrementGlobal("MRLoveTalk","GLOBAL",1)~ GOTO MRLoveTalk4-Door
	 IF ~~ THEN REPLY @329 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) IncrementGlobal("MRLoveTalk","GLOBAL",1)~ GOTO MRLoveTalk4-Nice
         ++ @330 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ GOTO MRLoveTalk4NoTime
	END
	
	IF ~~ MRLoveTalk4NoTime
	   SAY @331
	   = @332
           IF ~~ THEN EXIT
        END

	IF ~~ MRLoveTalk4-Nice
	 SAY @333
	 IF ~~ + MRLoveTalk4-1
	END

	IF ~~ MRLoveTalk4-Door
	 SAY @334
	 IF ~~ + MRLoveTalk4-1
	END

	IF ~~ MRLoveTalk4-Mean
	 SAY @335
	 IF ~~ + MRLoveTalk4-1
	END

	IF ~~ MRLoveTalk4-1
	 SAY @336
	 ++ @337 + MRLoveTalk4-2
	 ++ @338 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ + MRLoveTalk4-2
	 ++ @339 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ + MRLoveTalk4-2
	END

	IF ~~ MRLoveTalk4-2
	 SAY @340
	 =
	 @341
	 + ~Alignment(Player1,MASK_EVIL)~ + @342 + MRLoveTalk4-2Gore1
	 + ~!Alignment(Player1,MASK_EVIL)~ + @342 + MRLoveTalk4-2Gore2
	 ++ @343 + MRLoveTalk4-Words
	 ++ @344 + MRLoveTalk4-Usual
	 ++ @345 + MRLoveTalk4-3_1
	END

	IF ~~ MRLoveTalk4-Usual
	 SAY @346
	 IF ~~ THEN GOTO MRLoveTalk4-3_1
	END

	IF ~~ MRLoveTalk4-2Gore1
	 SAY @347
	 IF ~~ THEN GOTO MRLoveTalk4-3_1
	END

	IF ~~ MRLoveTalk4-2Gore2
	 SAY @348
	 IF ~~ THEN GOTO MRLoveTalk4-3_1
	END


	IF ~~ MRLoveTalk4-Boring
	 SAY @349
	 =
	 @350
	 IF ~~ THEN DO ~ SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	END

	IF ~~ MRLoveTalk4-Later
	 SAY @351
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ MRLoveTalk4-Words
	 SAY @352
	 IF ~~ THEN GOTO MRLoveTalk4-3_1
	END

	IF ~~ MRLoveTalk4-3_1
	 SAY @353
	 IF ~~ + MRLoveTalk4-3_3
	END

	IF ~~ MRLoveTalk4-3_3
	 SAY @256
	 IF ~~ THEN + MRLoveTalk4-4
	END

	IF ~~ MRLoveTalk4-4
	 SAY @354
	 = @355
	 ++ @356 + MRLoveTalk4-5
	 ++ @357 + MRLoveTalk4-5
	 ++ @358 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ MRLoveTalk4-5
	 SAY @359
	 ++ @360 + MRLoveTalk4-Boring
	 ++ @361 + MRLoveTalk4-6
	 ++ @362 + MRLoveTalk4-6
	END

	IF ~~ MRLoveTalk4-6
	 SAY @363
	 = @364
	 = @365
	 ++ @366 + MRLoveTalk4-6Taint
	 ++ @367 + MRLoveTalk4-6Taint
	 ++ @368 + MRLoveTalk4-6Crush
	 ++ @369 + MRLoveTalk4-Boring
	END

	IF ~~ MRLoveTalk4-6Crush
	 SAY @370
		++ @366 + MRLoveTalk4-6Taint
		++ @371 + MRLoveTalk4-6Taint
	 ++ @369 + MRLoveTalk4-Boring
	END

	IF ~~ MRLoveTalk4-6Taint
	 SAY @372
	 =
	 @373
	 =
	 @374
	 ++ @375 + MRLoveTalk4-Boring
	 ++ @376 + MRLoveTalk4-7Hug
	 ++ @377 + MRLoveTalk4-7
	 ++ @378 + MRLoveTalk4-7a
	 ++ @379 + MRLoveTalk4-7b
	END

        IF ~~ MRLoveTalk4-7a
           SAY @380
           = @381
	 ++ @382 + MRLoveTalk4-9Neu
	 ++ @383 + MRLoveTalk4-8
	 ++ @384 + MRLoveTalk4-8
	 ++ @385 + MRLoveTalk4-8a
        END

        IF ~~ MRLoveTalk4-7b
           SAY @386
           = @387
           IF ~~ THEN EXIT
        END

	IF ~~ MRLoveTalk4-7
	 SAY @388
	 ++ @382 + MRLoveTalk4-9Neu
	 ++ @383 + MRLoveTalk4-8
	 ++ @384 + MRLoveTalk4-8
	 ++ @385 + MRLoveTalk4-8a
	END

	IF ~~ MRLoveTalk4-7Hug
	 SAY @389
	 = @390
          = @391
	 ++ @382 + MRLoveTalk4-9Neu
	 ++ @383 + MRLoveTalk4-8
	 ++ @384 + MRLoveTalk4-8
	 ++ @385 + MRLoveTalk4-8a
	END

	IF ~~ MRLoveTalk4-8
	 SAY @392
	 ++ @393 + MRLoveTalk4-9Good
	 ++ @394 + MRLoveTalk4-9Neu
	 ++ @395 + MRLoveTalk4-9Neu
	END
	
	IF ~~ MRLoveTalk4-8a
	 SAY @396
	 ++ @393 + MRLoveTalk4-9Good
	 ++ @394 + MRLoveTalk4-9Nuts
	 ++ @395 + MRLoveTalk4-9Changed
        END

	IF ~~ MRLoveTalk4-9Good
	 SAY @397
	 = @398
	 ++ @399 + MRLoveTalk4-9Dreams
	 ++ @400 + MRLoveTalk4-9End
	END

	IF ~~ MRLoveTalk4-9Nuts
	   SAY @401
	   = @402
	 = @403
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk4-9Changed
	   SAY @404
	   = @405
	 = @403
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk4-9Neu
	 SAY @406
	 =
	 @403
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk4-9Dreams
	 SAY @407
	 =
	 @408
	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk4-9End
	 SAY @409
	 IF ~~ THEN EXIT
	END
	

/* Love Talk 5 duergar talk, originally happened */

	IF ~Global("MRLoveTalk","GLOBAL",9)  RealGlobalTimerExpired("MRImoenLovetalkTimer","GLOBAL")~ THEN BEGIN MRLoveTalkExperience
	 SAY @410
	 = @411
	 IF ~~ THEN REPLY @412 DO ~SetGlobal("MRLoveTalk","GLOBAL",10)~ GOTO MRLoveTalkExperienceListen
	 ++ @413 DO ~SetGlobal("MRLoveTalk","GLOBAL",10)~ GOTO MRLoveTalkExperienceDontListen
	END
	IF ~~ THEN BEGIN MRLoveTalkExperienceDontListen
	 SAY @414
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
	END

	IF ~~ THEN BEGIN MRLoveTalkExperienceListen 
	 SAY @415 
	 = @416
	 = @417
	 = @418
	 = @419
         ++ @420 GOTO MRLoveTalkEx1
	 IF ~~ THEN REPLY @421 GOTO MRLoveTalkEx1
	 IF ~~ THEN REPLY @422 GOTO MRLoveTalkExEXIT
	END
	
	IF ~~ MRLoveTalkExEXIT
	   SAY @423
	   = @424
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
	END

	IF ~~ THEN BEGIN MRLoveTalkEx1
	 SAY @425
         = @426
         = @427
         =@428  
		=@429 
		=@430 
         = @431
         = @432
         = @433
         = @434
         = @435
         = @436
         = @437
         =@438
         = @439
         = @440
         = @441
         = @442
         = @443
         ++ @444 + MRLoveTalkEx1c
         ++ @445 + MRLoveTalkEx1b
         ++ @446 + MRLoveTalkEx1b
         ++ @447 + MRLoveTalkEx1a
  END
  
IF ~~ MRLoveTalkEx1a
   SAY @448
   = @449
   IF ~~ THEN GOTO MRLoveTalkEx1aNext
END

IF ~~ MRLoveTalkEx1b
   SAY @450
   = @451
   IF ~~ THEN GOTO MRLoveTalkEx1aNext
END

IF ~~ MRLoveTalkEx1c
   SAY @452
   = @453
   = @454
   IF ~~ THEN GOTO MRLoveTalkEx1aNext
END

IF ~~ MRLoveTalkEx1aNext
   SAY @455
   = @456
   = @457
   = @458
   = @459
   ++ @460 + MRLoveTalkEx2
   ++ @461 + MRLoveTalkEx3
   ++ @462 + MRLoveTalkEx4
   ++ @463 + MRLoveTalkEx5
   ++ @464 + MRLoveTalkEx6
END

IF ~~ MRLoveTalkEx2
   SAY @465
   IF ~~ THEN GOTO MRLoveTalkExSavedMe
END

IF ~~ MRLoveTalkEx3
   SAY @466
   = @467
   IF ~~ THEN GOTO MRLoveTalkExSavedMe
END

IF ~~ MRLoveTalkEx4
   SAY @468
   = @469
   IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) ~ EXIT
END

IF ~~ MRLoveTalkEx5
   SAY @470
   IF ~~ THEN GOTO MRLoveTalkExSavedMe
END

IF ~~ MRLoveTalkEx6
   SAY @471
   = @472
   = @473
   IF ~~ THEN GOTO MRLoveTalkExSavedMe
END

IF ~~ MRLoveTalkExSavedMe
   SAY @474
   = @475
   = @476
   = @477
   ++ @478 + MRLoveTalkExEnd1
   ++ @479 + MRLoveTalkExEnd2
   ++ @480 + MRLoveTalkExEnd3
   ++ @481 + MRLoveTalkExEnd4
   ++ @482 + MRLoveTalkExEnd5
   ++ @483 + MRLoveTalkExEnd5
END

IF ~~ MRLoveTalkExEnd1
   SAY @484
   = @485
   = @486
   = @487
   IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)  RealSetGlobalTimer("MRCampPromptTimer","GLOBAL",180)~ EXIT
END

IF ~~ MRLoveTalkExEnd2
   SAY @488
   = @489
   = @486
   = @487
   IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)  RealSetGlobalTimer("MRCampPromptTimer","GLOBAL",180)~ EXIT
END

IF ~~ MRLoveTalkExEnd3
   SAY @490
   = @491
   = @492
   IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) RealSetGlobalTimer("MRCampPromptTimer","GLOBAL",180) ~ EXIT
END

IF ~~ MRLoveTalkExEnd4
   SAY @493
   = @494
   = @485
   = @486
   = @487
   IF ~~ THEN DO ~ RealSetGlobalTimer("MRCampPromptTimer","GLOBAL",180) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
END

IF ~~ MRLoveTalkExEnd5
   SAY @495
   = @496
   = @497
   IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600)~ EXIT
END
END

//** Love Talk - scars, after romance resolution, remember goblin **//

//** Must occur just before a rest **//
APPEND IMOEN2J
	IF ~Global("MRLoveTalk","GLOBAL",11)~ THEN BEGIN MRLoveTalk5
	 SAY @498
	 = @499
	 IF ~~ THEN REPLY @500 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) IncrementGlobal("MRLoveTalk","GLOBAL",1) StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	 IF ~~ THEN REPLY @501 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) IncrementGlobal("MRLoveTalk","GLOBAL",1)~ GOTO MRLoveTalk5-1
	 IF ~~ THEN REPLY @502 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",2600) IncrementGlobal("MRLoveTalk","GLOBAL",1)~ GOTO MRLoveTalk5-1
	END

	IF ~~ MRLoveTalk5-1
	 SAY @503
	 ++ @504 + MRLoveTalk5-Attack
	 ++ @505 + MRLoveTalk5-2
	 ++ @506 + MRLoveTalk5-Attack
	END

	IF ~~ MRLoveTalk5-Attack
	 SAY @507
	 = @508
	 IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ MRLoveTalk5-2
	 SAY @509
	 = @510
	 = @511
	 ++ @512 + MRLoveTalk5-2Magic
	 ++ @513 + MRLoveTalk5-2Lot
	 ++ @514 + MRLoveTalk5-2Poem
	 ++ @515 + MRLoveTalk5-2Beauty
	END

	IF ~~ MRLoveTalk5-2Poem
	 SAY @516
	 IF ~~ THEN GOTO MRLoveTalk5-3
	END

	IF ~~ MRLoveTalk5-2Beauty
	 SAY @517
	 IF ~~ THEN GOTO MRLoveTalk5-3
	END
END

CHAIN IMOEN2J MRLoveTalk5-3
 @518
 == IMOEN2J IF ~IsValidForPartyDialog("Viconia")
 !IsValidForPartyDialog("Aerie")
 !IsValidForPartyDialog("Jaheira")
 !IsValidForPartyDialog("Nalia")
 !IsValidForPartyDialog("Mazzy")~ THEN @519
 == IMOEN2J IF ~!IsValidForPartyDialog("Viconia")
 !IsValidForPartyDialog("Aerie")
 !IsValidForPartyDialog("Jaheira")
 IsValidForPartyDialog("Nalia")
 !IsValidForPartyDialog("Mazzy")~ THEN @520
 == IMOEN2J IF ~!IsValidForPartyDialog("Viconia")
 IsValidForPartyDialog("Aerie")
 !IsValidForPartyDialog("Jaheira")
 !IsValidForPartyDialog("Nalia")
 !IsValidForPartyDialog("Mazzy")~ THEN @521
 == IMOEN2J IF ~!IsValidForPartyDialog("Viconia")
 !IsValidForPartyDialog("Aerie")
 !IsValidForPartyDialog("Jaheira")
 !IsValidForPartyDialog("Nalia")
 IsValidForPartyDialog("Mazzy")~ THEN @522
 == IMOEN2J IF ~!IsValidForPartyDialog("Viconia")
 !IsValidForPartyDialog("Aerie")
 IsValidForPartyDialog("Jaheira")
 !IsValidForPartyDialog("Nalia")
 !IsValidForPartyDialog("Mazzy")~ THEN @523
 == IMOEN2J @524
END
 ++ @525 EXTERN IMOEN2J MRLoveTalk5-3Ugly
 + ~IsValidForPartyDialog("Nalia")~ + @526 EXTERN IMOEN2J MRLoveTalk5-3Hate
 + ~!IsValidForPartyDialog("Nalia")~ + @526 EXTERN IMOEN2J MRLoveTalk5-3Hate2
 ++ @527 EXTERN IMOEN2J MRLoveTalk5-4
 ++ @528 EXTERN IMOEN2J MRLoveTalk5-4

APPEND IMOEN2J
	IF ~~ MRLoveTalk5-2Magic
	 SAY @529
	 IF ~~ + MRLoveTalk5-3
	END

	IF ~~ MRLoveTalk5-2Lot
	 SAY @530
	 = @531
	 IF ~~ THEN GOTO MRLoveTalk5-3
	END

	IF ~~ MRLoveTalk5-3Ugly
	 SAY @532
	 IF ~~ THEN GOTO MRLoveTalk5-4
	END
END

CHAIN IMOEN2J MRLoveTalk5-3Hate
 @533
 == BNALIA @534
 == IMOEN2J @535
 == BNALIA @536
 == IMOEN2J @537
 == BNALIA @538
 == IMOEN2J @539
 == IMOEN2J @540
END
IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT

APPEND IMOEN2J

	IF ~~ MRLoveTalk5-3Hate2
	 SAY @541
	 = @542
	 IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ MRLoveTalk5-4
	 SAY @543
	 = @544
	 ++ @545 + MRLoveTalk5-4Training
	 ++ @546 + MRLoveTalk5-4Plate
	 ++ @547 + MRLoveTalk5-4Forget
	END

	IF ~~ MRLoveTalk5-4Forget
	 SAY @548
	 IF ~~ THEN GOTO MRLoveTalk5-5
	END

	IF ~~ MRLoveTalk5-4Plate
	 SAY @549
	 IF ~~ THEN GOTO MRLoveTalk5-5
	END

	IF ~~ MRLoveTalk5-4Training
	 SAY @550
	 IF ~~ THEN GOTO MRLoveTalk5-5
	END

	IF ~~ MRLoveTalk5-5
	 SAY @551
	 = @552
	 = @553
	 = @554
	 = @555
		++ @556 + MRLoveTalk5-5Sorry
		++ @557 + MRLoveTalk5-5Blood
		++ @558 + MRLoveTalk5-5Sorry
		++ @559 + MRLoveTalk5-5Blood
	END

	IF ~~ MRLoveTalk5-5Sorry
	 SAY @560
	 IF ~~ THEN GOTO MRLoveTalk5-6
	END

	IF ~~ MRLoveTalk5-5Blood
	 SAY @561
	 IF ~~ THEN GOTO MRLoveTalk5-6
	END

	IF ~~ MRLoveTalk5-6
	 SAY @562
	 = @563
	 = @564
	 = @565
	 ++ @566 + MRLoveTalk5-7
	 ++ @567 + MRLoveTalk5-7
	 ++ @568 + MRLoveTalk5-7a
	 ++ @569 + MRLoveTalk5-6Go
	 ++ @570 + MRLoveTalk5-6Go
	END
	
	IF ~~ MRLoveTalk5-7a
	   SAY @571
	   IF ~~ THEN GOTO MRLoveTalk5-7
        END

	IF ~~ MRLoveTalk5-6Go
	 SAY @572
	 =
	 @573
	 IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ MRLoveTalk5-7
	 SAY @574
	 =
	 ~'Course, having it cut into my skin does help jog the memory, huh?~ [ MRImRom3 ]
	 IF ~~ THEN GOTO MRLoveTalk5-8
	END

	IF ~~ MRLoveTalk5-8
	 SAY @576
	 =
	 @577
	 =
	 @578
	 =
	 @579
	 =
	 @580
	 ++ @581 + MRLoveTalk5-8End
	 IF ~~ THEN REPLY @582 + MRLoveTalk5-9
	 ++ @583 + MRLoveTalk5-6Go
	END

	IF ~~ MRLoveTalk5-8End
	 SAY @584
	 IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ MRLoveTalk5-9
	 SAY @585
         = @586
         = @587
	 ++ @588 + MRLoveTalk5-9End
	 ++ @589 + MRGoblinTrue
	 ++ @590 + MRLoveTalk5-10
	END

        IF ~~ MRGoblinTrue
           SAY @591
           = @592
           = @593
           = @594
           = @595
           ++ @596 + MRGoblinTrueRest
           ++ @597 + MRGoblinTruePast
        END
        
        IF ~~ MRGoblinTrueRest
         SAY @598
         = @599
         IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

        IF ~~ MRGoblinTruePast
         SAY @600
         ++ @601 + MRLoveTalk5-11
         ++ @602 + MRGoblinTrueRest
        END

	IF ~~ MRLoveTalk5-9End
	 SAY @603
	 =
	 @573
	 IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ MRLoveTalk5-10
	 SAY @600 [ MRImNig1 ]
	 ++ @605 + MRLoveTalk5-11
	 ++ @606 + MRLoveTalk5-9End
	END

	IF ~~ MRLoveTalk5-11
	 SAY @607
	 ++ @608 + MRLoveTalk5-11What
	 ++ @609 + MRLoveTalk5-11False
	 ++ @610 + MRLoveTalk5-11Vague
	 ++ @611 + MRLoveTalk5-11Sorry
	END

	IF ~~ MRLoveTalk5-11Vague
	 SAY @612
	 =
	 @613
	 IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ MRLoveTalk5-11Sorry
	 SAY @614
	 =
	 @613
	 IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ MRLoveTalk5-11False
	 SAY @615
	 IF ~~ THEN GOTO MRLoveTalk5-12
	END

	IF ~~ MRLoveTalk5-11What
	 SAY @616
	 IF ~~ THEN GOTO MRLoveTalk5-12
	END

	IF ~~ MRLoveTalk5-12
	 SAY @617
	 ++ @618 + MRLoveTalk5-13
	 ++ @619 + MRLoveTalk5-11Vague
	 ++ @620 + MRLoveTalk5-11Sorry
	END

	IF ~~ MRLoveTalk5-13
	 SAY @621
	 = @622
	 ++ @623 + MRLoveTalk5-14
	 ++ @624 + MRLoveTalk5-14
	 ++ @625 + MRLoveTalk5-11Vague
	 ++ @626 + MRLoveTalk5-11Vague
	END

	IF ~~ MRLoveTalk5-14
	 SAY @627
	 =
	 @628
	 ++ @629 + MRLoveTalk5-14Wrong
	 ++ @630 + MRLoveTalk5-15
	 ++ @631 + MRLoveTalk5-11Vague
	 ++ @632 + MRLoveTalk5-11Vague
	END

	IF ~~ MRLoveTalk5-14Wrong
	 SAY @633
	 ++ @630 + MRLoveTalk5-15
	 ++ @634 + MRLoveTalk5-11Vague
	 ++ @635 + MRLoveTalk5-11Vague
	END

	IF ~~ MRLoveTalk5-15
	 SAY @636
	 ++ @637 DO ~SetGlobal("MRTenYearTalkHappened","GLOBAL",1)~ + MRLoveTalk5-16
	 ++ @638 DO ~SetGlobal("MRTenYearTalkHappened","GLOBAL",1)~ + MRLoveTalk5-11Vague
	 ++ @639 DO ~SetGlobal("MRTenYearTalkHappened","GLOBAL",1)~ + MRLoveTalk5-11Vague
	END

	IF ~~ MRLoveTalk5-16
	 SAY @640
	 =
	 @641
	 ++ @642 + MRLoveTalk5-17
	 ++ @643 + MRLoveTalk5-17
	 ++ @644 + MRLoveTalk5-17
	END

	IF ~~ MRLoveTalk5-17
	 SAY @645
	 ++ @646 + MRLoveTalk5-18
	 + ~CheckStatGT(Player1,13,CHR)~ + @647 + MRLoveTalk5-17Lie
	 + ~!CheckStatGT(Player1,13,CHR)~ + @647 + MRLoveTalk5-17Lie2
	 ++ @648 + MRLoveTalk5-17Jerk
	END

	IF ~~ MRLoveTalk5-17Lie
	 SAY @649
         = @650
	 = @651
	 ++ @652 + MRLoveTalk5-18
	 ++ @653 + MRLoveTalk5-18
	 ++ @654 + MRLoveTalk5-17Jerk
	END

	IF ~~ MRLoveTalk5-17Lie2
	 SAY @655
	 =
	 @656
	 =
	 @657
	 =
	 @658
         = @659
	 IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~EXIT
	END

	IF ~~ MRLoveTalk5-17Jerk
	 SAY @660
	 =
	 @661
	 =
	 @662
         = @659
	 IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~~ MRLoveTalk5-18
	 SAY @663
	 =
	 @664
	 =
	 @658
         = @659
	 IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END
END