//** Talk about the Slayer Dreams **//
//* the character has already Slayer-changed once **//
APPEND IMOEN2J 
	IF ~Global("MRSlayDreamResolved","GLOBAL",1)~ THEN BEGIN MRSlayTalk
		SAY @0
		++ @1 DO ~SetGlobal("MRSlayDreamResolved","GLOBAL",2) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ + MRSlayTalkStop
		++ @2 DO ~SetGlobal("MRSlayDreamResolved","GLOBAL",2) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ + MRSlayContinue3
		++ @3 DO ~SetGlobal("MRSlayDreamResolved","GLOBAL",2) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ + MRSlayContinue2
		++ @4 DO ~SetGlobal("MRSlayDreamResolved","GLOBAL",2) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ + MRSlayContinue1
	END

	IF ~~ THEN BEGIN MRSlayTalkStop
		SAY @5
                = @6
		IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN MRSlayContinue1
		SAY @7
		IF ~~ THEN GOTO MRSlayContinueNext
	END

	IF ~~ THEN BEGIN MRSlayContinue2
		SAY @8
		IF ~~ THEN GOTO MRSlayContinueNext
	END

	IF ~~ THEN BEGIN MRSlayContinue3
		SAY @9
		IF ~~ THEN GOTO MRSlayContinueNext
	END

        IF ~~ THEN BEGIN MRSlayContinueNext
		SAY @10
		++ @11 + MRSlayTalkStop
		++ @12 + MRSlayDream
	END


	IF ~~ THEN BEGIN MRSlayDream
		SAY @13
			++ @14 GOTO MRSlayDreamEnd
			++ @15 GOTO MRSlayDream2
	END

	IF ~~ THEN BEGIN MRSlayDream2
		SAY ~(Her eyebrow arches up) Oh? Like what?~ [ MRImRom5 ]
			++ @17 GOTO MRSlayDream3
			IF ~!Global("MRSlayDreamLoop","GLOBAL",1)~ THEN REPLY @18 DO ~SetGlobal("MRSlayDreamLoop","GLOBAL",1)~ GOTO MRSlayDreamAvatar
			++ @19 GOTO MRSlayDreamShort
			++ @20 GOTO MRSlayDreamCrazy
			++ @14 GOTO MRSlayDreamNo
	END


	IF ~~ THEN BEGIN MRSlayDreamNo
		SAY @21
		++ @22 GOTO MRSlayDreamEnd
		++ @23 GOTO MRSlayDream1a
	END

	IF ~~ THEN BEGIN MRSlayDreamEnd
		SAY @24
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDream1a
		SAY @25
			++ @17 GOTO MRSlayDream3
			IF ~!Global("MRSlayDreamLoop","GLOBAL",1)~ THEN REPLY @18 DO ~SetGlobal("MRSlayDreamLoop","GLOBAL",1)~ GOTO MRSlayDreamAvatar
			++ @19 GOTO MRSlayDreamShort
			++ @20 GOTO MRSlayDreamCrazy
	END

	IF ~~ THEN BEGIN MRSlayDreamCrazy
		SAY @26
		=
		@27
		=
		@28
		++ @29 GOTO MRSlayDreamCrazyJoke
		++ @30 GOTO MRSlayDreamCrazy2
		++ @31 GOTO MRSlayDreamCrazyCandy
		++ @32 DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDreamCrazyJoke
		SAY @33
		IF ~InParty("Aerie")~ THEN GOTO MRSlayDreamCrazyAerie
		IF ~!InParty("Aerie")~ THEN GOTO MRSlayDreamCrazyNext
	END
END

CHAIN IMOEN2J MRSlayDreamCrazyAerie
	@34
	== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @35
	== IMOEN2J IF ~IsValidForPartyDialog("Aerie")~ THEN @36
	== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @37
	== IMOEN2J IF ~IsValidForPartyDialog("Aerie")~ THEN @38
END IMOEN2J MRSlayDreamCrazyNext

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRSlayDreamCrazyNext
		SAY @39
		=
		@40
			++ @17 GOTO MRSlayDream3
			++ @18 GOTO MRSlayDreamAvatar
			++ @41 GOTO MRSlayDreamShort
	END	

	IF ~~ THEN BEGIN MRSlayDreamCrazy2
		SAY @42
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDreamCrazyCandy
		SAY @43
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDreamShort
		SAY @44
		=
		@45
		++ @46 GOTO MRSlayDream3
		++ @47 GOTO MRSlayDreamAvatar
		++ @48 GOTO MRSlayDreamNosey
	END

	IF ~~ THEN BEGIN MRSlayDreamNosey
		SAY @49
		=
		@50
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDreamAvatar
		SAY @51
		=
		@52
		++ @17 GOTO MRSlayDream3
		++ @53 + MRSlayDreamMidEND
		++ @48 GOTO MRSlayDreamNosey
	END
	
	IF ~~ THEN BEGIN MRSlayDreamMidEND
           SAY @54
               IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ EXIT
        END

	IF ~~ THEN BEGIN MRSlayDream3
		SAY @55
		=
		@56
		++ @57 GOTO MRSlayDream4
		++ @58 GOTO MRSlayDream4
		++ @59 GOTO MRSlayDream4
		++ @60 GOTO MRSlayDreamListen
		++ @61 GOTO MRSlayDreamListen2
	END

	IF ~~ THEN BEGIN MRSlayDream4
		SAY @62
		IF ~~ THEN GOTO MRSlayDream5
	END

	IF ~~ THEN BEGIN MRSlayDreamAvatar2
		SAY @51
		IF ~~ THEN GOTO MRSlayDream5
	END

	IF ~~ THEN BEGIN MRSlayDreamListen
		SAY @63
		++ @64 GOTO MRSlayDreamListen2
		++ @65 GOTO MRSlayDreamCorrect
		++ @66 GOTO MRSlayDreamOnion
	END

	IF ~~ THEN BEGIN MRSlayDreamListen2
		SAY @50
		IF ~~ THEN GOTO MRSlayDream5
	END

	IF ~~ THEN BEGIN MRSlayDreamStrange
		SAY @67
		IF ~~ THEN GOTO MRSlayDream5
	END

	IF ~~ THEN BEGIN MRSlayDreamCorrect
		SAY @68
		=
		@69
		IF ~~ THEN GOTO MRSlayDreamListen2
	END

	IF ~~ THEN BEGIN MRSlayDreamOnion
		SAY @70
		++ @71 GOTO MRSlayDreamOnion2
		++ @72 GOTO MRSlayDreamOnion2
		++ @73 GOTO MRSlayDreamStrange
		++ @74 GOTO MRSlayDreamOnion3
	END

	IF ~~ THEN BEGIN MRSlayDreamOnion2
		SAY @75
		=
		@76
		=
		@77
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDreamOnion3
		SAY @78
		=
		@77
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDream5
		SAY @79
		=
		@80
		=
		@81
		=
		@82
		++ @83 GOTO MRSlayDream5Avatar
		++ @84 GOTO MRSlayDream5NotBad
		++ @85 GOTO MRSlayDream5Imoen
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @86 GOTO MRSlayDream5Appeal
		++ @87 GOTO MRSlayDream5Control
		++ @88 GOTO MRSlayDream5End
	END

	IF ~~ THEN BEGIN MRSlayDream5End
		SAY @89
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDream5Control
		SAY @90
		=
		@91
		=
		@92
		=
		@93
		=
		@94
		=
		@95
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) RunAwayFrom(Player1,30)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDream5Appeal
		SAY @96
		=
		@97
		=
		@98
		=
		@99
		=
		@94
		=
		@95
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) RunAwayFrom(Player1,30)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDream5Imoen
		SAY @100
		= @101
		= @102
		++ @103 GOTO MRSlayDream5Imoen2
		++ @104 GOTO MRSlayDream5Avatar
		++ @105 GOTO MRSlayDream5NotBad
		++ @106 GOTO MRSlayDream5End
	END

	IF ~~ THEN BEGIN MRSlayDream5NotBad
		SAY @107
		=
		@108
		=
		@109
		=
		@110
		=
		@111
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) RunAwayFrom(Player1,30)~ EXIT
	END


	IF ~~ THEN BEGIN MRSlayDream5Avatar
		SAY @112
		= @113
		++ @114 GOTO MRSlayDream6
		++ @115 GOTO MRSlayDream5NotBad
		++ @116 GOTO MRSlayDream5Control
		++ @117 GOTO MRSlayDream5End
	END

	IF ~~ THEN BEGIN MRSlayDream5Imoen2
		SAY @118
		=
		@119
		=
		@120
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000)~ EXIT
	END

	IF ~~ THEN BEGIN MRSlayDream6
		SAY @121
		=
		@122
		=
		@123
		IF ~~ THEN DO ~RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) RunAwayFrom(Player1,30)~ EXIT
	END
END