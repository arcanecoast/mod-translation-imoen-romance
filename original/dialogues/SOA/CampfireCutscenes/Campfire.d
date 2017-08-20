APPEND IMOEN2J
	// just before sleep at underdark exit comment

	 IF ~Global("MRCampSleepTalk","GLOBAL",1) AreaCheck("AR2500")~ THEN BEGIN MRCampfireAct2
		SAY ~Aah... (Imoen stretches) This place is great. Look, that spot over there will do.~ [ IRQUIET ]
		IF ~~ THEN DO ~SetGlobal("MRCampSleepTalk","GLOBAL",2)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe1")~
		EXIT	
	END
END
//campfire cutscene start
//act 2

//loveme1a.bcs start
APPEND IMOEN2J
	IF ~Global("MRCampfireMusic","GLOBAL",1)~ THEN BEGIN MRCampfireMusic
		SAY ~Yeah, a beautiful place, dontcha think? Let's rest here!~ [ IRQUIET ]
		IF ~~ THEN REPLY @2 DO ~SetGlobal("MRCampfireMusic","GLOBAL",2)~ GOTO MRCampfireMusic2
	END

	IF ~~ THEN BEGIN MRCampfireMusic2
		SAY @3
		++ @4 GOTO MRCampfireMusic2Rest
		++ @5 GOTO MRCampfireMusic2Rest
		++ @6 GOTO MRCampfireMusic2Rest
		++ @7 GOTO MRCampfireMusic2Rest
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Rest
		SAY @8
		IF ~NumInPartyGT(2)~ THEN REPLY @9 GOTO MRCampfireMusic2Group
		IF ~!NumInPartyGT(2)~ THEN REPLY @9 GOTO MRCampfireMusic2Solo
		IF ~NumInPartyGT(2)~ THEN REPLY @10 GOTO MRCampfireMusic2Group
		IF ~!NumInPartyGT(2)~ THEN REPLY @10 GOTO MRCampfireMusic2Solo
		++ @11 GOTO MRCampfireMusic2Naughty
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Naughty
		SAY @12
		= @13
		IF ~~ THEN REPLY @14 GOTO MRCampfireMusic2NaughtyNice
		IF ~Gender(Player1,MALE)~ THEN REPLY @15 GOTO MRCampfireMusic2Naughty2Male
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @16 GOTO MRCampfireMusic2Naughty2Female
		++ @17 GOTO MRCampfireMusic2NaughtyJoke
	END

	IF ~~ THEN BEGIN MRCampfireMusic2NaughtyJoke
		SAY @18
		IF ~NumInPartyGT(2)~ THEN GOTO MRCampfireMusic2Group
		IF ~!NumInPartyGT(2)~ THEN GOTO MRCampfireMusic2Solo
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Naughty2Male
		SAY @19
		= @20
		= @21
		= @22
		IF ~~ THEN DO ~LeaveParty()
		SetGlobal("KickedOut","LOCALS",1)
		SetDialog("Imoen2p")
		ReputationInc(-1)
		SetGlobal("ImoenRomanceActive","GLOBAL",3)
		EscapeAreaMove("ar0406",504,1493,0)~ // IMOEN SHOULD GO TO THE COPPER CORONET~
		EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Naughty2Female
		SAY @19
		= @23


		= @24
		= @22
		IF ~~ THEN DO ~LeaveParty()
		ReputationInc(-1) 
		SetGlobal("KickedOut","LOCALS",1)
		SetDialog("Imoen2p")
		SetGlobal("ImoenRomanceActive","GLOBAL",3)
		EscapeAreaMove("ar0406",504,1493,0)~ // IMOEN SHOULD GO TO THE COPPER CORONET~
		EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2NaughtyNice
		SAY @25

                = @26

		++ @27 GOTO MRCampfireMusic2NaughtyNiceSad
		IF ~Gender(Player1,MALE)~ THEN REPLY @28 GOTO MRCampfireMusic2NaughtyNiceSadF
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @29 GOTO MRCampfireMusic2NaughtyNiceSadF
		++ @30 GOTO MRCampfireMusic2NaughtyNiceBitch
	END

	IF ~~ THEN BEGIN MRCampfireMusic2NaughtyNiceSad
		SAY @31

		=
		@32
		=
		@33
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
                SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2NaughtyNiceSadF
		SAY @34

		=
		@32
		=
		@33
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
                SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2NaughtyNiceBitch
		SAY @35
		=
		@36
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
                SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Group
		SAY @37

		++ @38	DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe2")~ EXIT
        	++ @39 GOTO MRCampfireMusic2Orgy

	END

	IF ~~ THEN BEGIN MRCampfireMusic2Solo
		SAY @40
		++ @41 GOTO MRCampfireMusic2Orgy
		++ @38	DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe2")~ EXIT
	END


	IF ~~ THEN BEGIN MRCampfireMusic2Orgy
		SAY @42
		++ @43 DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe2")~ EXIT
		IF ~NumInPartyGT(2)~ THEN REPLY @44 GOTO MRCampfireMusic2OrgyGroup
		IF ~!NumInPartyGT(2)~ THEN REPLY @44 GOTO MRCampfireMusic2OrgySolo
	END
END


CHAIN IMOEN2J MRCampfireMusic2OrgyGroup
	@45
	= @46
	==VICONIJ IF ~CheckStatGT(Player1,13,CHR) IsValidForPartyDialog("Viconia")~ THEN @47
	==AERIEJ IF ~Gender(Player1,MALE) IsValidForPartyDialog("Aerie")~ THEN @48
	==NALIAJ IF ~Gender(Player1,MALE) IsValidForPartyDialog("Nalia")~ THEN @49
	==NALIAJ IF ~Gender(Player1,MALE) CheckStatGT(Player1,13,CHR) IsValidForPartyDialog("Nalia")~ THEN @50
	==NALIAJ IF ~Gender(Player1,MALE) !CheckStatGT(Player1,10,CHR) IsValidForPartyDialog("Nalia")~ THEN @51
	==MAZZYJ IF ~Gender(Player1,MALE) IsValidForPartyDialog("Mazzy")~ THEN @52
	==VICONIJ IF ~!CheckStatGT(Player1,13,CHR) IsValidForPartyDialog("Viconia")~ THEN @53
	==JAHEIRAJ IF ~Gender(Player1,MALE) IsValidForPartyDialog("Jaheira")~ THEN @54

	==KORGANJ IF ~Gender(Player1,FEMALE) CheckStatGT(Player1,9,CHR) IsValidForPartyDialog("Korgan")~ THEN @55
	==KORGANJ IF ~Gender(Player1,FEMALE) !CheckStatGT(Player1,10,CHR) IsValidForPartyDialog("Korgan")~ THEN @56
	==EDWINJ IF ~Gender(Player1,FEMALE) CheckStatGT(Player1,13,CHR) IsValidForPartyDialog("Edwin")~ THEN @57
	==EDWINJ IF ~Gender(Player1,FEMALE) !CheckStatGT(Player1,13,CHR) !CheckStatLT(Player1,10,CHR) IsValidForPartyDialog("Edwin")~ THEN @58
	==EDWINJ IF ~Gender(Player1,FEMALE) CheckStatLT(Player1,10,CHR) IsValidForPartyDialog("Edwin")~ THEN @59
	==JANJ IF ~Gender(Player1,FEMALE) IsValidForPartyDialog("Jan")~ THEN @60
	==HAERDAJ IF ~Gender(Player1,FEMALE) CheckStatGT(Player1,12,CHR) IsValidForPartyDialog("HaerDalis")~ THEN @61
	==HAERDAJ IF ~Gender(Player1,FEMALE) !CheckStatGT(Player1,12,CHR) IsValidForPartyDialog("HaerDalis")~ THEN @62
	==ANOMENJ IF ~Gender(Player1,FEMALE) IsValidForPartyDialog("Anomen")~ THEN @63
	==VALYGARJ IF ~Gender(Player1,FEMALE) IsValidForPartyDialog("Valygar")~ THEN @64
	==KELDORJ IF ~Gender(Player1,FEMALE) !CheckStatGT(Player1,13,CHR) IsValidForPartyDialog("Keldorn")~ THEN @52
	==MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @65
	==CERNDJ IF ~IsValidForPartyDialog("Cernd")~ THEN @66
	
	==IMOEN2J @67
END ++ @68 EXTERN IMOEN2J MRCampfireMusic2Sex
	++ @69 EXTERN IMOEN2J MRCampfireMusic2OrgyBath

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMusic2OrgySolo
		SAY ~(Her eyes widen when she sees your state of undress. You realize too late that, shockingly enough, Imoen wasn't suggesting you have wild sex by the campfire.)~
		@46
		= @67
		++ @68 GOTO MRCampfireMusic2Sex
		++ @69 GOTO MRCampfireMusic2OrgyBath
	END


	IF ~~ THEN BEGIN MRCampfireMusic2OrgyBath
		SAY @71
		=
		@72
		=
		@73
		IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe2")~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Sex
		SAY @74
		= @75
		IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe2")~ EXIT
	END

	//LoveMe2.baf

	// *** Act 3 ***

	IF ~NumInPartyGT(2) Global("MRCampfireMusic","GLOBAL",2)~ THEN BEGIN MRCampfireMusic3Group
		SAY ~(Imoen stares at the flames. Everyone is sitting around the small fire, but few words have been said. Finally, Imoen speaks.)~ [ MRImRom5 ]
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",3)~ GOTO MRCampfireMusic4
	END

	IF ~!NumInPartyGT(2) Global("MRCampfireMusic","GLOBAL",2)~ THEN BEGIN MRCampfireMusic3Solo
		SAY ~(Imoen stares at the flames. You both are sitting around the small fire, but few words have been said. Finally, Imoen speaks.)~ [ MRImRom5 ]
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",3)~ GOTO MRCampfireMusic4
	END
END

CHAIN IMOEN2J MRCampfireMusic4
@78
= @79
= @80
= @81



= @82
== IMOEN2J IF ~!Class(Player1,BARD)~ THEN @83
== IMOEN2J IF ~Class(Player1,BARD)~ THEN @84



== IMOEN2J @85
= @86

= ~(Imoen's fingers begin to gracefully fly over the strings, playing a beautiful melody. Triumphantly she looks at you; she's practically glowing.)~ [ MRImInt3 ]
= @88
= @89
= @90
= @91
== IMOEN2J IF ~Class(Player1,BARD)~ THEN @92
== IMOEN2J IF ~!Class(Player1,BARD)~ THEN @93
== IMOEN2J @94
= @95
= @96
= @97
= @98

= ~And that's it! How's that for a story? (She beams at you and plays something else.)~ [ MRImInt2 ]
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @100
== AERIEJ IF ~IsValidForPartyDialog("Aerie") !Class(Player1,BARD)~ THEN @101
== AERIEJ IF ~IsValidForPartyDialog("Aerie") Class(Player1,BARD)~ THEN @102
== NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @103
== JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @104
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @105
== EDWINJ IF ~IsValidForPartyDialog("Edwin")~ THEN @106
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @107
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @108
== HAERDAJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @109
== KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @110
== MAZZYJ IF ~IsValidForPartyDialog("Mazzy")~ THEN @111
== ANOMENJ IF ~IsValidForPartyDialog("Anomen")~ THEN @112
END IMOEN2J MRCampfireMusic5

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMusic5
		SAY @113
		++ @114 GOTO MRCampfireMusic5How
		+ ~!Class(Player1,BARD)~ + @115 GOTO MRCampfireMusic5WhyNot
		IF ~Class(Player1,BARD)~ THEN REPLY @116 GOTO MRCampfireMusic5WhyNot
                ++ @117 GOTO MRCampfireMusic5Continue
		IF ~!Class(Player1,BARD)~ THEN REPLY @118 GOTO MRCampfireMusic5Hate
		++ @119 GOTO MRCampfireMusic5Hate
	END

	IF ~~ THEN BEGIN MRCampfireMusic5Hate
		SAY ~(She stops, puzzled) Whatever you mean by that? Everyone likes at least *some* sort of music!~ [ MRImEndG ]
		++ @121 GOTO MRCampfireMusic5HateJoke
		IF ~!Class(Player1,BARD)~ THEN REPLY @122 GOTO MRCampfireMusic5HateYes
		++ @123 GOTO MRCampfireMusic5HateYou
	END

	IF ~~ THEN BEGIN MRCampfireMusic5HateYou
		SAY @124
		= @125
		=@126
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)
		SetGlobal("MRCampfireMusic","GLOBAL",7)
        	StartCutSceneMode() StartCutScene("Cut34a")~
		EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic5HateYes
		SAY @127
		IF ~~ THEN GOTO MRCampfireMusic5HateStopGroup
		IF ~!NumInPartyGT(2)~ THEN GOTO MRCampfireMusic5HateStopSolo
	END

	IF ~~ THEN BEGIN MRCampfireMusic5HateStopGroup
		SAY @128
		IF ~~ THEN GOTO MRCampfireMusic5HateStopEnd
	END

	IF ~~ THEN BEGIN MRCampfireMusic5HateStopSolo
		SAY @129
		IF ~~ THEN GOTO MRCampfireMusic5HateStopEnd
	END

	IF ~~ THEN BEGIN MRCampfireMusic5HateStopEnd
		SAY @130
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player2)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3a")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player3)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3b")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player4)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3c")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player5)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3d")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player6)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3e")~ EXIT
		
		IF ~!Global("ImoenRomanceActive","GLOBAL",1)~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END


	IF ~~ THEN BEGIN MRCampfireMusic5HateJoke
		SAY ~Pff, you goon. Had me worried for a moment there... (she starts playing again.)~ [ MRImInt2 ]
		++ @132 GOTO MRCampfireMusic5How
		++ @133 GOTO MRCampfireMusic5WhyNot
        ++ @134 GOTO MRCampfireMusic5Continue
	END

	IF ~~ THEN BEGIN MRCampfireMusic5How
		SAY @135
		= @136
		++ @137 GOTO MRCampfireMusic5WhyNot
		++ @138 GOTO MRCampfireMusic6
		++ @139 GOTO MRCampfireMusic5Continue
	END

	IF ~~ THEN BEGIN MRCampfireMusic5WhyNot
		SAY @140
		=
		@141
		=
		@142
		++ @143 GOTO MRCampfireMusic5Continue
		++ @144 GOTO MRCampfireMusic5Continue2
        ++ @138 GOTO MRCampfireMusic6
	END



	IF ~~ THEN BEGIN MRCampfireMusic5Continue
		SAY ~But of course you will! (She chuckles happily, and stops the melody she was playing.)~ [ MRImEndG ]
		IF ~~ THEN GOTO MRCampfireMusic6
	END

	IF ~~ THEN BEGIN MRCampfireMusic5Continue2
		SAY ~But of course you are! (She chuckles happily, and stops the melody she was playing.)~ [ MRImEndG ]
		IF ~~ THEN GOTO MRCampfireMusic6
	END

	IF ~~ THEN BEGIN MRCampfireMusic6
		SAY @147
                = ~(Imoen prepares a chord and clears her throat with a slight cough. Soon she's plucking strings, gently easing the ambiance into a simple tune.)~ [ MRImInt1 ]
		= @149

		= @150

		= @151

		= @152

		= @153
		= @154

		IF ~~ THEN GOTO MRCampfireMusic7
	END
END

CHAIN IMOEN2J MRCampfireMusic7
~(You'd never heard Imoen sing before. Sometimes she'd whistle, sometimes she'd hum - but you can't remember her ever singing.)~ [ MRImRom6 ]
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @156
== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @157
== NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @158
== JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @159
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @160
== EDWINJ IF ~IsValidForPartyDialog("Edwin")~ THEN @161

== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @162
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @163
== HAERDAJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @164
== KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @165
== MAZZYJ IF ~IsValidForPartyDialog("Mazzy")~ THEN @166
== ANOMENJ IF ~IsValidForPartyDialog("Anomen")~ THEN @167
END IMOEN2J MRCampfireMusic8


APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMusic8
		SAY @168

		++ @169 GOTO MRCampfireMusic8Stun
		++ @170 GOTO MRCampfireMusic8Gift

		++ @171 GOTO MRCampfireMusic8High
		++ @172 GOTO MRCampfireMusic8Shrug
		++ @173 GOTO MRCampfireMusic8Cringe

	END

	IF ~~ THEN BEGIN MRCampfireMusic8Stun
		SAY @174
		=
		@175
		IF ~~ THEN GOTO MRCampfireMusic9
	END

	IF ~~ THEN BEGIN MRCampfireMusic8Gift
		SAY @176

		=
		@177

		IF ~~ THEN GOTO MRCampfireMusic9
	END

	IF ~~ THEN BEGIN MRCampfireMusic8High
		SAY @178


		IF ~~ THEN GOTO MRCampfireMusic9
	END

	IF ~~ THEN BEGIN MRCampfireMusic8Shrug
		SAY @179

		IF ~~ THEN GOTO MRCampfireMusic9
	END

	IF ~~ THEN BEGIN MRCampfireMusic8Cringe
		SAY @180
         =@181
		IF ~~ THEN GOTO MRCampfireMusic9
	END
END

CHAIN IMOEN2J MRCampfireMusic9
@182

== IMOEN2J IF ~NumInPartyGT(2)~ THEN @183
== IMOEN2J IF ~NumInPartyGT(2)~ THEN @184
== IMOEN2J IF ~NumInPartyGT(2)~ THEN @185
== IMOEN2J IF ~!NumInPartyGT(2)~ THEN @186
== IMOEN2J IF ~!NumInPartyGT(2)~ THEN @187
== IMOEN2J IF ~!NumInPartyGT(2)~ THEN @188
END IMOEN2J MRCampfireMusic10

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMusic10
		SAY @189
			IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player2)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3a")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player3)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3b")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player4)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3c")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player5)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3d")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player6)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3e")~ EXIT
		IF ~!Global("ImoenRomanceActive","GLOBAL",1)~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	// *** Act 4 ***
	//loveme3.baf

	IF ~Global("MRCampfireMusic","GLOBAL",3)~ THEN BEGIN MRCampfireMorning
		SAY ~WAKE UP, <CHARNAME>!~ [ MRImRom4 ]
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",4) ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRCampfireMorning2
	END

	IF ~~ THEN BEGIN MRCampfireMorning2
		SAY @191

		IF ~~ THEN EXTERN PLAYER1 MRCampfireMorning2
	END
END

APPEND PLAYER1
	IF ~~ THEN BEGIN MRCampfireMorning2
	SAY @192
        = @193


	IF ~~ THEN EXTERN IMOEN2J MRCampfireMorning3
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMorning3
		SAY @194
		=
		@195
		++ @196 GOTO MRCampfireMorning3Why


		++ @197 GOTO MRCampfireMorning3Catch
		++ @198 GOTO MRCampfireMorning3Catch
		++ @199 GOTO MRCampfireMorning3Bitch
		++ @200 GOTO MRCampfireMorning3Why4
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Why
		SAY @201
		++ @202 GOTO MRCampfireMorning3Why2
		++ @197 GOTO MRCampfireMorning3Catch


		++ @198 GOTO MRCampfireMorning3Catch
		++ @203 GOTO MRCampfireMorning3Bitch
		++ @204 GOTO MRCampfireMorning3Why4
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Why2
		SAY @205

		=
		@206
		++ @207 GOTO MRCampfireMorning3Why3
		++ @197 GOTO MRCampfireMorning3Catch
		++ @198 GOTO MRCampfireMorning3Catch


		++ @208 GOTO MRCampfireMorning3Bitch
		++ @209 GOTO MRCampfireMorning3Why4
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Why3
		SAY @210
		++ @211 GOTO MRCampfireMorning3Catch
		++ @212 GOTO MRCampfireMorning3Why4
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Why4
		SAY @213
                = @214
                IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7) SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
         END

	IF ~~ THEN BEGIN MRCampfireMorning3Bitch
		SAY @215
		++ @216 GOTO MRCampfireMorning3Catch
		++ @217 GOTO MRCampfireMorning3Catch
		++ @218 GOTO MRCampfireMorning3Why4


	END

	IF ~~ THEN BEGIN MRCampfireMorning3Catch
		SAY @219
		=
		@220

		++ @221 GOTO MRCampfireMorning3Chase
		++ @222 GOTO MRCampfireMorning3Revenge
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Revenge
		SAY @223
		++ @216 GOTO MRCampfireMorning3Catch

		++ @224 GOTO MRCampfireMorning3Chase
		++ @225 GOTO MRCampfireMorning3Why4
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Chase
		SAY @226
		IF ~~ THEN DO ~
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe4")
		~ EXIT
	END
END

// *** Act 5 ***
//LoveMe4

APPEND PLAYER1
	IF ~Global("MRCampfireMusic","GLOBAL",4)~ THEN BEGIN MRCampfireMorning3Chase
	SAY ~(After the short chase, you are lucky enough to catch the hem of her clothes and drag her to the mossy ground. She tries to roll away from you, but she only sends you both tumbling together on the grass.)~  [ IRQUIET ]
	=
	@228
	=
	@229


	IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",5)~ EXTERN IMOEN2J MRCampfireMorning4
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMorning4
		SAY ~Hahahahahah... hahahah... (She keeps giggling uncontrollably. It's been years since you last saw Imoen like this.)~ [ MRImRom1 ]
		++ @231 DO ~ActionOverride(Player1,SetDialog("Player1"))~GOTO MRCampfireMorning4Tickle2
		++ @232 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRCampfireMorning4Tickle
		++ @233 GOTO MRCampfireMorning4Anger
		++ @234 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRCampfireMorning4Quit
	END

	IF ~~ THEN BEGIN MRCampfireMorning4Anger
	   SAY @235
           = @236
           = @237
           = @238
           = @239
           IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7) SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
        END

	IF ~~ THEN BEGIN MRCampfireMorning4Quit
		SAY @240
		=
		@241
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7) SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMorning4Tickle
		SAY @242
		=
		@243
		IF ~~ THEN GOTO MRCampfireMorning4Tickle2
	END

	IF ~~ THEN BEGIN MRCampfireMorning4Tickle2
		SAY @244

		=
		@245
                =
                @246
                =
		~<CHARNAME>... (A fresh breeze carries her whisper. Cherry locks of hair titillate around her face.)~ [ MRImRom3 ]
		++ @248 GOTO MRCampfirePivotFondle
		++ @249 GOTO MRCampfirePivotStand
		++ @250 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRCampfirePivotKiss
		++ @251 GOTO MRCampfirePivotDelay
		++ @252 GOTO MRCampfirePivotSpeak
	END

	IF ~~ THEN BEGIN MRCampfirePivotSpeak
		SAY @253

		++ @254 GOTO MRCampfirePivotFondle
		++ @249 GOTO MRCampfirePivotStand
		++ @255 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRCampfirePivotKiss
		++ @251 GOTO MRCampfirePivotDelay
	END



	IF ~~ THEN BEGIN MRCampfirePivotKiss
		SAY @256
		=@257
        IF ~~ THEN GOTO MRCampfirePivotKissNext
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfirePivotDelay
		SAY @258
		=
		@259
		=@260
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
		SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfirePivotStand
		SAY @261
		=
		@260
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7) SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfirePivotFondle
		SAY @262
                = @263
                = @264
                = @265
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
		SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfirePivotKissNext
		SAY @266
		= @267
		= @268
		IF ~~ THEN REPLY @269 GOTO MRCampfirePivotYes
		++ @270 GOTO MRCampfirePivotYes
		IF ~~ THEN REPLY @271 GOTO MRCampfirePivotYes
		++ @272 GOTO MRCampfirePivotYes
        ++ @273 GOTO MRCampfirePivotNo
	END


	IF ~~ THEN BEGIN MRCampfirePivotYes
	SAY @274
	= @275
	= @276
	IF ~~ THEN DO ~ClearAllActions()
	FaceObject(Player1)
	StartCutSceneMode()
	StartCutScene("LoveMe5")~
	EXIT
 END


	IF ~~ THEN BEGIN MRCampfirePivotNo
		SAY @277
		=
		@278
		=
		@279
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
		SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END
END

// *** Act 6: The messy interlude ***
//loveme5.baf

APPEND PLAYER1
	IF ~Global("MRCampfireMusic","GLOBAL",5)~ THEN BEGIN MRCampfireAftermath
		SAY ~(You awaken to find that Imoen is no longer lying by your side. She stands a few paces from where you lie, looking up at nesting birds. She's lost in thought.)~ [ MRImRom6 ]
		=
		@281
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",6) SetGlobal("MRSleptImoen","GLOBAL",1) SetGlobalTimer("MRPartyReactionTimer","GLOBAL",ONE_DAY)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe5b")~ EXIT
	END
END

//loveme5a.baf
APPEND IMOEN2J
	IF ~Global("MRCampfireMusic","GLOBAL",6)~ THEN BEGIN MRCampfireAftermath
		SAY ~(Imoen senses your approach, then half-turns toward you. Her eyes are fastened to the ground, her stance distant, defensive.)~ [ IRQUIET ]
                = @283
                = @284
                = @285
                = @286
                = @287
                = @288
				= @289
                IF ~~ THEN DO ~
			SetGlobal("MRCampfireMusic","GLOBAL",7)
			RunAwayFromNoInterrupt(Player1,30)~ EXIT
	END
END