// The basic idea is to offer 3 paths with 3 distinct consequences:
// 1. Tell Imoen to embrace the taint, which leads to her losing all bhaal abilities but letting her become an uncontrollable Ravager avatar, very powerful but that will attack indiscriminately. It will also count as "corrupting" Imoen.
// 2. Tell Imoen to control the taint, letting her keep all bhaal abilities as well as become another Slayer that works just like the PC.
// 3. Tell Imoen to shut out the taint, giving her +1 constitution and the ability to look at herself in a mirror without seeing a monster.

/*
Contents:
First Conversation: nightmares and first powers
Second Conversation: more powers
Third Conversation: faster, stronger, more violent
*/

//change the weights so the vanilla taint talks have highest priority
SET_WEIGHT BIMOEN25 81 #-3
SET_WEIGHT BIMOEN25 91 #-2
SET_WEIGHT BIMOEN25 100 #-1

//force set 15 minute timer after gromnir, yaga is dead
//we want the talks to happen sequentially after these bosses are dead

// ~Gromnir knows a stranger came to Saradush, pretty Melissan. Another Bhaalspawn. You must think Gromnir too stupid not to remember there is no way in or out of this city, mmm?~
ADD_TRANS_ACTION GROMNIR
BEGIN 0 END
BEGIN 0 END
~RealSetGlobalTimer("IRTBhaalTalkTimer","GLOBAL",900)~

// ~What a disappointment you created for me, worm! I redoubled our efforts to crush this worthless town when I heard you were within, the Terror of the Sword Coast... only to find you gone!~ 
ADD_TRANS_ACTION YAGA01
BEGIN 1 END
BEGIN 0 END
~RealSetGlobalTimer("IRTBhaalTalkTimer","GLOBAL",900)~




// First Conversation: nightmares and first powers

// Imoen says:
// I... I've been having some nightmares. Really strange ones, like sailing on rivers of blood. So *real*. You... you used to dream a lot. Right before Gorion died. Was it... was it like that?

ADD_STATE_TRIGGER BIMOEN25 81 ~!ActuallyInCombat() RealGlobalTimerExpired("IRTBhaalTalkTimer","GLOBAL") InParty("Imoen2") !StateCheck(Player1,CD_STATE_NOTVALID) !StateCheck(Myself,CD_STATE_NOTVALID)~

ADD_TRANS_TRIGGER BIMOEN25 81 ~!Global("ImoenRomanceActive","GLOBAL",2) !Global("ImoenRomanceActive","GLOBAL",3)~ DO 0 1 2


ADD_TRANS_ACTION BIMOEN25
BEGIN 81 END
BEGIN 0 1 2 3 4 END
~SetGlobal("IRTTortureTalk","GLOBAL",1) RealSetGlobalTimer("IRTBhaalTalkTimer","GLOBAL",2700)~

EXTEND_TOP BIMOEN25 81
+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @0 DO ~SetGlobal("IRTTortureTalk","GLOBAL",1) SetGlobal("ExpBImoen10","LOCALS",1)  RealSetGlobalTimer("IRTBhaalTalkTimer","GLOBAL",2700)~ + 81Restless
	+ ~Global("ImoenRomanceActive","GLOBAL",3)~ + @1 DO ~SetGlobal("IRTShutUp","GLOBAL",1) SetGlobal("ExpBImoen10","LOCALS",1)  RealSetGlobalTimer("IRTBhaalTalkTimer","GLOBAL",2700)~ + 81mean
END

APPEND BIMOEN25
	IF ~~ THEN 81Restless
		SAY @2
		IF ~~ THEN GOTO 84
	END

	IF ~~ THEN 81mean
		SAY @3
		= @4
		= @5
	   IF ~~ THEN DO ~RunAwayFrom(Player1,20) ReallyForceSpell(Myself,IMOEN_BHAAL1)~ EXIT
	END
END

EXTEND_BOTTOM BIMOEN25 85
	++ @6 + 85guess
	++ @7 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-2)~ + 85yourself
	++ @8 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-10)~ + 81mean
END

APPEND BIMOEN25
	IF ~~ THEN 85guess
		SAY @9
		IF ~~ THEN GOTO 87
	END

	IF ~~ THEN 85yourself
		SAY @10
		= @11
		= @12
	   IF ~~ THEN DO ~RunAwayFrom(Player1,20) ReallyForceSpell(Myself,IMOEN_BHAAL1)~ EXIT
	END
END

EXTEND_TOP BIMOEN25 87
	++ @13 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + 87new
END

//go to state 88
//transition 0 (the first one)
//change the transition only when no romance imoen (not even possible really unless you didn't install the mod for SOA
//i guess it makes it never appear

ADD_TRANS_TRIGGER BIMOEN25 88 ~Global("ImoenRomanceActive","GLOBAL",0)~ DO 0

 //put in new states as below
EXTEND_BOTTOM BIMOEN25 88
COPY_TRANS BIMOEN25 87new
END

APPEND_EARLY BIMOEN25
IF ~~ THEN 87new
	SAY @14
	= @15
	++ @16 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + 87new1
	++ @17 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + 87new2
	++ @18 DO ~IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + 87new4
		++ @19 + 87new3
	++ @20 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ + 87new5
END
END

ADD_TRANS_TRIGGER BIMOEN25 90 ~Global("ImoenRomanceActive","GLOBAL",0)~ DO 0

EXTEND_BOTTOM BIMOEN25 90
+ ~GlobalGT("ImoenRomanceActive","GLOBAL",0)~ + @21 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + 90new1
+ ~GlobalGT("ImoenRomanceActive","GLOBAL",0)~ + @22 DO ~IncrementGlobal("IRTControlTaint","GLOBAL",1) IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ + 90new2
+ ~GlobalGT("ImoenRomanceActive","GLOBAL",0)~ + @23 + 90new3
+ ~GlobalGT("ImoenRomanceActive","GLOBAL",0)~ + @24 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-3)~ + 87new5
END


APPEND BIMOEN25
	IF ~~ THEN 87new1
		SAY @25
		= @26
		= @27
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL1)~ EXIT
	END

	IF ~~ THEN 87new2
		SAY @28
		= @29
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL1)~ EXIT
	END

	IF ~~ THEN 87new3
		SAY @30
		= @31
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL1)~ EXIT
	END

	IF ~~ THEN 87new4
		SAY @32
		= @33
		= @34
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL1)~ EXIT
	END

	IF ~~ THEN 87new5	
		SAY @35
		= @36
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL1)~ EXIT
	END

	IF ~~ THEN 90new1
		SAY @37
		= @38
		= @39
		= @40
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL1)~ EXIT
	END

	IF ~~ THEN 90new2
		SAY @41
		= @42
		= @43
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL1)~ EXIT
	END

	IF ~~ THEN 90new3
		SAY @44
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL1)~ EXIT
	END
END

// Second Conversation: more powers, faster and stronger
// Imoen says: I've, um... been developing some more abilities. Bhaal abilities, like your own. I don't mean to; they just come... although I don't think they're very strong.
ADD_STATE_TRIGGER BIMOEN25 91 ~!ActuallyInCombat() Dead("Gromnir") RealGlobalTimerExpired("IRTBhaalTalkTimer","GLOBAL") InParty("Imoen2") !StateCheck(Player1,CD_STATE_NOTVALID) !StateCheck(Myself,CD_STATE_NOTVALID)~

//limit some options out
ADD_TRANS_TRIGGER BIMOEN25 91 ~Global("ImoenRomanceActive","GLOBAL",0)~ DO 1 3


ADD_TRANS_ACTION BIMOEN25
BEGIN 91 END
BEGIN 0 1 2 3 END
~RealSetGlobalTimer("IRTBhaalTalkTimer","GLOBAL",2700)~

EXTEND_TOP BIMOEN25 91
 	  ++ @45 DO ~SetGlobal("ExpBImoen10","LOCALS",2) RealSetGlobalTimer("IRTBhaalTalkTimer","GLOBAL",2700) ~ + 91new
	  ++ @46 DO ~SetGlobal("ExpBImoen10","LOCALS",2) RealSetGlobalTimer("IRTBhaalTalkTimer","GLOBAL",2700) ~ + 92
END

APPEND BIMOEN25
	IF ~~ THEN 91new
		SAY @47
		= @48
		IF ~~ THEN GOTO 93
	END
END

//vanilla choices appear if you didn't even do anything with imoen lol

ADD_TRANS_TRIGGER BIMOEN25 93 ~Global("ImoenRomanceActive","GLOBAL",0)~ DO 0 1 2

EXTEND_BOTTOM BIMOEN25 93 #1
++ @49 DO ~IncrementGlobal("IRTEmbraceTaint","GLOBAL",1) IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ + 93new1
++ @50 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + 93new2
++ @51 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + 93new3
+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @52 + 93new4
END

APPEND BIMOEN25
	IF ~~ THEN 93new1
		SAY @53
		= @54
		= @55
		= @56
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL2)~ EXIT
	END

	IF ~~ THEN 93new2
		SAY @57
		= @58
		= @59
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL2)~ EXIT
	END

	IF ~~ THEN 93new3
		SAY @60
		= @61
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL2)~ EXIT
	END

	IF ~~ THEN 93new4
		SAY @62
		++ @63 DO ~IncrementGlobal("IRTEmbraceTaint","GLOBAL",1) IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ + 93new1
		++ @64 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + 93new2
		++ @51 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + 93new3
		++ @65 + 97new
	END	

	IF ~~ THEN 97new
		SAY @66
		= @67
		IF ~~ THEN DO ~ReallyForceSpell(Myself,IMOEN_BHAAL2)~ EXIT
	END
END

// Third Conversation: craving violence

// Imoen Says: I felt something come over me, <CHARNAME>. A... viciousness I've never felt before. I just wanted to tear someone's throat out with my bare hands.

ADD_STATE_TRIGGER BIMOEN25 100 ~!ActuallyInCombat() RealGlobalTimerExpired("IRTBhaalTalkTimer","GLOBAL") Dead("Yaga01") InParty("Imoen2") !StateCheck(Player1,CD_STATE_NOTVALID) !StateCheck(Myself,CD_STATE_NOTVALID)~

ADD_TRANS_ACTION BIMOEN25
BEGIN 100 END
BEGIN 0 END
~RealSetGlobalTimer("IRTBhaalTalkTimer","GLOBAL",2700)~

EXTEND_BOTTOM BIMOEN25 102
++ @68 + 102new1
++ @69 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-2)~ + 102new2
END

EXTEND_BOTTOM BIMOEN25 101
IF ~GlobalGT("IRTEmbraceTaint","GLOBAL",0) OR(2) GlobalGT("IRTControlTaint","GLOBAL",0) GlobalGT("IRTFightTaint","GLOBAL",0)~ THEN GOTO 101Disamb
IF ~GlobalGT("IRTFightTaint","GLOBAL",0)  OR(2) GlobalGT("IRTControlTaint","GLOBAL",0) GlobalGT("IRTEmbraceTaint","GLOBAL",0)~ THEN GOTO 101Disamb
IF ~GlobalGT("IRTControlTaint","GLOBAL",0) OR(2) GlobalGT("IRTEmbraceTaint","GLOBAL",0) GlobalGT("IRTFightTaint","GLOBAL",0)~ THEN GOTO 101Disamb

IF ~Global("IRTEmbraceTaint","GLOBAL",2) ~ THEN GOTO 101E
IF ~Global("IRTControlTaint","GLOBAL",2)~ THEN GOTO 101C
IF ~Global("IRTFightTaint","GLOBAL",2) ~ THEN GOTO 101F
END

APPEND BIMOEN25
	IF ~~ THEN 102new1
		SAY @70
		= @71
		IF ~~ THEN GOTO 104
	END

	IF ~~ THEN 102new2
		SAY @72
		= @73
		IF ~~ THEN GOTO 104
	END

		// You've adviced Imoen contradictory things
	IF ~~ THEN 101Disamb
		SAY @74
		= @75
		= @76
		+ ~GlobalGT("IRTEmbraceTaint","GLOBAL",0)~ + @77 + 101E3
		+ ~GlobalGT("IRTControlTaint","GLOBAL",0)~ + @78 + 101C1
		+ ~GlobalGT("IRTFightTaint","GLOBAL",0)~ + @79 + 101F2
		+ ~GlobalGT("IRTFightTaint","GLOBAL",0)~ + @80 + 101F4
		++ @81 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ + 101FuckOff
	END
	
	// You've adviced Imoen to embrace the Taint

	IF ~~ THEN 101E
		SAY @82
		= @83
		= @84
		++ @85 + 101E1
        ++ @86 + 101E2
		++ @87 + 101E3
		++ @88 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + 101E4
		++ @81 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ + 101FuckOff
	END

	IF ~~ THEN 101E1
		SAY @89
	    IF ~GlobalGT("IRTLoveMeter","GLOBAL",4)~ THEN DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ GOTO EmbraceYes  // It is only a measure of Imoen's trust, so it doesn't have to be very high.
		IF ~!GlobalGT("IRTLoveMeter","GLOBAL",4)~ THEN DO ~SetGlobal("IRTCorruptImoen","GLOBAL",0)~ GOTO EmbraceNo
	END

	IF ~~ THEN 101E2
		SAY @90
		++ @91 + 101E2next
		++ @92 + 101E2notReady
		++ @93 + 101E2sorry
	END

	IF ~~ THEN 101E2sorry
		SAY @94
		IF ~~ THEN GOTO 101E2end
	END

	IF ~~ THEN 101E2end	
		SAY @95
		= @96
		IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5) SetGlobal("IRTCorruptImoen","GLOBAL",0) ~ EXIT
	END

	IF ~~ THEN 101E2notReady
		SAY @97
		IF ~~ THEN GOTO 101E2end
	END

	IF ~~ THEN 101E2next
		SAY @98
		++ @99 + 101E2next2
		++ @100 + 101E2notReady
		++ @101 + 101E2sorry
	END

	IF ~~ THEN 101E2next2
		SAY @102
		= @103
		= @104
		++ @105 + 101E2next3
		++ @106 + 101E2next3
		++ @107 + 101E2next3
	END

	IF ~~ THEN 101E2next3
		SAY @108
		= @109
		= @110
		= @111
		IF ~~ THEN DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) SetGlobal("IRTRavagerTurnCounter","GLOBAL",1)~ EXIT
	END

	/*
	IRTRavagerTurnCounter needs to go up by 1 every time Imoen gets in combat. When it reaches 5, she will heal all hitpoints and become the Ravager.
	The Ravager is a powerful avatar of Bhaal and is uncontrollable. It has boosted resistances, double Imoen's normal HP and packs a fat melee punch - but it's not nearly as tough as the Ravager monster you fight at the end of ToB, for reference. Its script will attack nearest enemies first, then it will turn on party members. The only way for Imoen to turn back is to get her to one half of her total health. Once Imoen turns back, she will fall unconscious until end of combat. When combat is over, she will start the conversation labeled "After Ravager Turn", below. 
	*/

	IF ~~ THEN 101E3
		SAY @112
		IF ~GlobalGT("IRTLoveMeter","GLOBAL",4)~ THEN DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ GOTO EmbraceYes
		IF ~!GlobalGT("IRTLoveMeter","GLOBAL",4)~ THEN DO ~SetGlobal("IRTCorruptImoen","GLOBAL",0)~ GOTO EmbraceNo
	END

	IF ~~ THEN 101E4
		SAY @113
		= @114
		= @115
		IF ~~ THEN DO ~SetGlobal("IRTCorruptImoen","GLOBAL",0) SetGlobal("IRTFightTaintCount","GLOBAL",1) ~ EXIT
	END

	IF ~~ THEN EmbraceYes
		SAY @116
		= @117
		++ @118 + EY1
		++ @119 + EY2
	END

	IF ~~ THEN EmbraceNo
		SAY @120
		= @121
		IF ~~ THEN DO ~SetGlobal("IRTFightTaintCount","GLOBAL",1)~ EXIT
	END

	IF ~~ THEN EY1
		SAY @122
		IF ~~ THEN DO ~SetGlobal("IRTRavagerTurnCounter","GLOBAL",1)~ EXIT
	END

	IF ~~ THEN EY2
		SAY @123
		= @124
		= @125
		= @126
		IF ~~ THEN DO ~SetGlobal("IRTCorruptImoen","GLOBAL",0)~ EXIT
	END

	// You've adviced Imoen to control the Taint
			
	IF ~~ THEN 101C
		SAY @127
		= @128
		= @129
		++ @130 + 101C1
        	++ @131 + 101C2
		
		++ @132 + 101E4
		++ @81 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ + 101FuckOff
	END
		
	IF ~~ THEN 101C1
		SAY @133
		= @134
		++ @135 + 101C1a
		++ @136 + 101C1a2
		++ @137 + 101C1c
	END
END

APPEND_EARLY BIMOEN25
	IF ~~ THEN 101C1a
		SAY @138
		++ @139 + 101C1a1
		++ @140 + 101C1a2
		++ @141 + 101E4
	END
END

APPEND BIMOEN25
	IF ~~ THEN 101C1a1
		SAY @142
		= @143
		= @144
		IF ~~ THEN DO ~SetGlobal("IRTSlayerTurnLesson","GLOBAL",1)~ EXIT
	END

	/* IRTSlayerTurnLesson
	Imoen starts a conversation as soon as the party rests in the pocket plane. She will initiate the conversation further below, labeled "Teach me to control the Slayer"
	*/

	IF ~~ THEN 101C1a2
		SAY @145
		= @146
		= @147
		IF ~~ THEN DO ~ SetGlobal("IRTCorruptImoen","GLOBAL",0)~ EXIT
	END

	IF ~~ THEN 101C1c
		SAY @148
		= @149	
		COPY_TRANS BIMOEN25 101C1a
	END

	IF ~~ THEN 101C2
		SAY @90
		++ @150 + 101C2next
		++ @92 + 101E2notReady
		++ @151 + 101E2sorry
	END

	IF ~~ THEN 101C2next
		SAY @152
		++ @153 + 101C2next2
		++ @154 + 101E2notReady
		++ @155 + 101E2sorry
	END

	IF ~~ THEN 101C2next2
		SAY @102
		= @103
		= @156
		++ @157 + 101C2next3
		++ @158 + 101C2next3
		++ @159 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1)~ + 101C2next3
	END

	IF ~~ THEN 101C2next3
		SAY @160
		= @161
		= @162
		= @163
		= @164
		= @165
		++ @166 + 101C2next4
		++ @167 + 101C2next4
		++ @168 + 101C2next4
	END
		
	IF ~~ THEN 101C2next4
		SAY @169
		IF ~~ THEN DO ~SetGlobal("IRTSlayerTurnLesson","GLOBAL",1)~ EXIT
	END

	// You've adviced Imoen to fight the taint	

	IF ~~ THEN 101F
		SAY @170
		= @171
		++ @172 + 101F1
		++ @79 + 101F2
		++ @173 + 101F3
		++ @80 + 101F4
		++ @81 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ + 101FuckOff
	END

	IF ~~ THEN 101F1
		SAY @174
		= @175
		IF ~~ THEN GOTO 101F1next
	END

	IF ~~ THEN 101F1next
		SAY @176
		= @177
		= @178
		IF ~~ THEN DO ~SetGlobal("IRTFightTaintCount","GLOBAL",1)~ EXIT
	END

	/*
	IRTFightTaintCount: 
	This global goes up by 1 every time Imoen is in combat. When it reaches 5, the conversation below labeled "Imoen Resists the Slayer" happens right as combat ends.
	*/

	IF ~~ THEN 101F2
		SAY @179
		IF ~~ THEN GOTO 101F1next
	END

	IF ~~ THEN 101F3
		SAY @180
		= @181
		IF ~~ THEN GOTO 101F1next
	END

	IF ~~ THEN 101F4
		SAY @182
		= @183
		IF ~~ THEN GOTO 101F1next
	END	

	IF ~~ THEN 101FuckOff
		SAY @184
		= @185
		= @186
		IF ~~ THEN EXIT
	END
END



//  If you convince Imoen to give in, she will eventually turn into the Ravager during combat. After combat is over, depending on how hard you've tried to corrupt her, she will have one of two different attitudes about it.
// IRTCorruptImoen is 3 or lower: she is scared witless and will lose all Bhaal abilities to show her renewed efforts to never touch the Taint again
// IRTCorruptImoen is higher than 3: she will admit to have enjoyed it and will be able to become the uncontrollable Ravager at will once a day.

// About-to-turn dialogue:
APPEND IMOEN25J
 IF ~Global("IRTImoenRavagerTransformation","GLOBAL",1)~ THEN BEGIN AssTrans
	SAY @187
	= @188
	= @189 
	IF ~~ THEN DO ~SetGlobal("IRTImoenRavagerTransformation","GLOBAL",2)~ EXIT
END
// Imoen fights until she's at half health. She will fight enemies first, then turn on the nearest party member. Once her health is at half or lower, she will fall unconscious until combat ends. When combat ends, she will initiate the following dialogue:

// After Ravager Turn


	IF  ~Global("IRTImoenRavagerTransformation","GLOBAL",5)~ THEN BEGIN Ass1
		SAY @190
		IF ~GlobalGT("IRTCorruptImoen","GLOBAL",3)~ THEN DO ~SetGlobal("IRTImoenRavagerTransformation","GLOBAL",6) SetGlobal("IRTImoenIsRavager","GLOBAL",1)~ GOTO AssYes
		IF ~!GlobalGT("IRTCorruptImoen","GLOBAL",3)~ THEN DO ~SetGlobal("IRTImoenRavagerTransformation","GLOBAL",6) SetGlobal("IRTCorruptImoen","GLOBAL",0)~ GOTO AssNo
	END
END 

CHAIN IMOEN25J AssYes
	@191
	== AERIE25J IF ~IsValidForPartyDialog("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @192
	== AERIE25J IF ~IsValidForPartyDialog("Aerie") !GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @193
	== JAHEI25J IF ~IsValidForPartyDialog("Jaheira")~ THEN @194
	== VICON25J IF ~IsValidForPartyDialog("Viconia")~ THEN @195
	== MINSC25J IF ~IsValidForPartyDialog("Minsc")~ THEN @196
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @197
	== KELDO25J IF ~IsValidForPartyDialog("Keldorn")~ THEN @198
	== EDWIN25J IF ~IsValidForPartyDialog("Edwin")~ THEN @199
	== ANOME25J IF ~IsValidForPartyDialog("Anomen")~ THEN @200
	==IMOEN25J  IF ~IsValidForPartyDialog("Imoen2")~ THEN @201
	==IMOEN25J  IF ~IsValidForPartyDialog("Imoen2")~ THEN @202
END IMOEN25J AssYesR

APPEND IMOEN25J
	IF ~~ THEN AssYesR
		SAY @203
		++ @204 + AssYes1
		++ @205 + AssYes2
		++ @206 + AssYes1
		++ @207 + AssYes3
	END
		
	IF ~~ THEN AssYes1
		SAY @208
		= @209
		IF ~~ THEN GOTO AssYesEnd
	END

	IF ~~ THEN AssYes2
		SAY @210
		= @211
		++ @212 + AssYes1
		++ @213 + AssYes1
		++ @214 + AssYes3
	END

	IF ~~ THEN AssYes3
		SAY @215
		= @216
		IF ~~ THEN GOTO AssYesEnd
	END

	IF ~~ THEN AssYesEnd
		SAY @217
		IF ~~ THEN EXIT
	END 	
END
/*

From here on out, Imoen can turn into the Ravager once a day. It's an uncontrollable instant polymorph as described above
*/

CHAIN IMOEN25J AssNo
	@218
	= @219
	== AERIE25J IF ~IsValidForPartyDialog("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @220
	== AERIE25J IF ~IsValidForPartyDialog("Aerie") !GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @193
	== JAHEI25J IF ~IsValidForPartyDialog("Jaheira")~ THEN @194
	== VICON25J IF ~IsValidForPartyDialog("Viconia")~ THEN @195
	== MINSC25J IF ~IsValidForPartyDialog("Minsc")~ THEN @196
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @221
	== KELDO25J IF ~IsValidForPartyDialog("Keldorn")~ THEN @198
	== EDWIN25J IF ~IsValidForPartyDialog("Edwin")~ THEN @222
	== ANOME25J IF ~IsValidForPartyDialog("Anomen")~ THEN @200
END IMOEN25J AssNoR

APPEND IMOEN25J
	IF ~~ THEN AssNoR
		SAY @223
		++ @224 + AssNo1
		++ @205 + AssNo2
		++ @225 + AssNo3
		++ @226 + AssNo4
	END
		
	IF ~~ THEN AssNo1
		SAY @227
		IF ~~ THEN GOTO AssNoBreakup
	END

	IF ~~ THEN AssNoBreakup
		SAY @228
		= @229
		= @230
		= @231
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) SetGlobal("IRTNeverForgive","GLOBAL",1)~ EXIT
	END
		
	IF ~~ THEN AssNo2
		SAY @232
		++ @233 + AssNo1
		++ @234 + AssNo3
		++ @235 + AssNo4
	END

	IF ~~ THEN AssNo3
		SAY @236
		= @237
		= @238
		= @239
		= @240
		= @241
		= @242
		= @243
		IF ~~ THEN EXIT
	END	

	IF ~~ THEN AssNo4
		SAY @244
		IF ~~ THEN GOTO AssNoBreakup
	END
END

/*
Teach me to control the Slayer:
This conversation happens if you've convinced Imoen to control her Bhaal powers. She will approach you the next time you rest in the pocket plane
*/

CHAIN IF WEIGHT #0 ~Global("IRTSlayerTurnLesson","GLOBAL",2)~ THEN IMOEN25J SCon
	@245 DO ~SetGlobal("IRTSlayerTurnLesson","GLOBAL",3)~
	= @246
END IMOEN25J SConR

APPEND IMOEN25J
	IF ~~ THEN SConR
		SAY @247
		++ @248 + SCon1
		++ @249 + SCon2
		++ @250 + SCon3
		++ @251 + SCon4
		++ @252 + SCon5
	END

	IF ~~ THEN SCon1
		SAY @253
		= @254
		= @255
		++ @256 + SCon2Yes
		++ @257 + SCon4
		++ @258 + SCon3
		++ @259 + SCon2No
	END

	IF ~~ THEN SCon2
		SAY @260
		= @261
		++ @262 + SCon2Yes
		++ @263 + SCon3
		++ @264 + SCon2No
	END

	IF ~~ THEN SCon2Yes
		SAY @265
		IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("IRBhaal1")~ EXIT
	END

	// Small cutscene: fade to black, moves Imoen and the player to the center of the Pocket Plane while every other party member gets moved out of the frame (by the fate spirit?) fade from black, Imoen starts dialogue, State "SConMain"

	IF ~~ THEN SCon2No
		SAY @266
		= @267
		= @268
		IF ~~ THEN DO ~SetGlobal("IRTControlTaint","GLOBAL",0) SetGlobal("IRTCorruptImoen","GLOBAL",0) RestParty()~ EXIT
	END
		
	IF ~~ THEN SCon3
		SAY @269
		= @270
		= @268
		IF ~~ THEN DO ~SetGlobal("IRTControlTaint","GLOBAL",0) SetGlobal("IRTCorruptImoen","GLOBAL",0) RestParty()~ EXIT
	END

	IF ~~ THEN SCon4
		SAY @271
		= @272
		= @273
		= @274
		IF ~~ THEN DO ~SetGlobal("IRTControlTaint","GLOBAL",0) SetGlobal("IRTCorruptImoen","GLOBAL",0) RestParty()~ EXIT
	END	
		
	IF ~~ THEN SCon5
		SAY @275
		= @276
		= @277
		IF ~~ THEN DO ~SetGlobal("IRTControlTaint","GLOBAL",0) SetGlobal("IRTCorruptImoen","GLOBAL",0) RestParty()~ EXIT
	END

	IF WEIGHT #0 ~Global("IRTSlayerTurnLesson","GLOBAL",4)~ THEN SConMain
		SAY @278
		IF ~~ THEN DO ~SetGlobal("IRTSlayerTurnLesson","GLOBAL",5)~ GOTO SConMainR
	END

	IF ~~ THEN SConMainR
		SAY @279
		++ @280 + SConM1
		++ @281 + SConM2
		++ @282 + SConM3
		++ @283 + SConM4
		++ @284 + SConM5
	END

	IF ~~ THEN SConM1
		SAY @285
		IF ~~ THEN GOTO SConMainNext
	END

	IF ~~ THEN SConM2
		SAY @286
		IF ~~ THEN GOTO SConMainNext
	END
		
	IF ~~ THEN SConM3
		SAY @287
		IF ~~ THEN GOTO SConMainNext
	END

	IF ~~ THEN SConM4
		SAY @288
		++ @289 + SConM1
		++ @281 + SConM2
		++ @282 + SConM3
		++ @290 + SConM4a
		++ @291 + SConM5
	END

	IF ~~ THEN SConM4a
		SAY @292
		IF ~~ THEN GOTO SConMainNext
	END

	IF ~~ THEN SConM5
		SAY @293
		IF ~~ THEN GOTO SConMainNext
	END

	IF ~~ THEN SConMainNext
		SAY @294
		= @295
		= @296
		= @297
		= @298
		++ @299 + SConMainN1
		++ @300 + SConMainN1
		++ @301 + SConMainN1
		++ @302 + SConMainN1
	END

	IF ~~ THEN SConMainN1
		SAY @303
		= @304
		= @305
		= @306
		= @307
		++ @308 + SConCheck
		++ @309 + SConNext2
		++ @310 + SConNext2
		++ @311 + SConNext2
	END

	IF ~~ THEN SConCheck
		SAY @312
		IF ~~ THEN GOTO SConNext2
	END

	IF ~~ THEN SConNext2
		SAY @313
		= @314
		++ @315 + SCFinal1
		++ @316 + SCFinal2
		++ @317 + SCFinal3
		++ @318 + SCFinal4
		++ @319 + SCFinal5
	END

	IF ~~ THEN SCFinal1
		SAY @320
		IF ~~ THEN GOTO SCFinalN
	END

	IF ~~ THEN SCFinal2
		SAY @321
		IF ~~ THEN GOTO SCFinalN
	END

	IF ~~ THEN SCFinal3
		SAY @322
		IF ~~ THEN GOTO SCFinalN
	END

	IF ~~ THEN SCFinal4
		SAY @323
		= @324
		IF ~~ THEN GOTO SCFinalN
	END

	IF ~~ THEN SCFinal5
		SAY @325
		IF ~~ THEN GOTO SCFinalN
	END

	IF ~~ THEN SCFinalN
		SAY @326
		= @327
		= @328
		= @329
		= @330
		++ @331 + SCFinalEnd1
		++ @332 + SCFinalEnd2
		++ @333 + SCFinalEnd3
	END

	IF ~~ THEN SCFinalEnd1
		SAY @334
		IF ~~ THEN DO ~SetGlobal("IRTImoenControlsSlayer","GLOBAL",1)  RestParty()~ EXIT
	END

	IF ~~ THEN SCFinalEnd2
		SAY @335
		IF ~~ THEN DO ~SetGlobal("IRTImoenControlsSlayer","GLOBAL",1) RestParty()~ EXIT
	END

	IF ~~ THEN SCFinalEnd3
		SAY @336
		IF ~~ THEN DO ~SetGlobal("IRTImoenControlsSlayer","GLOBAL",1) RestParty()~ EXIT
	END
END
	

/*
Imoen Resists the Slayer
this conversation happens as combat ends if you've encouraged Imoen to fight the taint.
 Give Imoen +1 Constitution just as the dialogue ends
*/

APPEND IMOEN25J
	IF WEIGHT #0 ~Global("IRTResistTheSlayer","GLOBAL",1)~ THEN SRes
		SAY @337
		IF ~~ THEN DO ~SetGlobal("IRTResistTheSlayer","GLOBAL",2)~ GOTO SResR
	END

	IF ~~ THEN SResR
		SAY @338
		++ @316 + SRes1
		++ @339 + SRes1
		++ @340 + SRes1
		++ @341 + SRes2
		++ @302 + SRes3
	END

	IF ~~ THEN SRes1
		SAY @342
		= @343
		++ @344 + SRes1a
		++ @345 + SRes1b
		++ @346 + SRes1c
	END
END 

CHAIN IMOEN25J SRes1a
	@347 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",5)~
	= @348
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @349
	== IMOEN25J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @350
END IMOEN25J SResE

APPEND IMOEN25J
	IF ~~ THEN SResE
		SAY @351
		= @352
		++ @353 + SResE1
		+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @354 + SResE2
		+ ~!Global("ImoenRomanceActive","GLOBAL",2)~ + @355 + SResE3
		++ @356 + SResE4
		++ @357 + SResE5
	END

	IF ~~ THEN SResE1
		SAY @358
		= @359
		IF ~~ THEN  EXIT
	END

	IF ~~ THEN SResE2
		SAY @360
		= @361
		= @362
		IF ~~ THEN  EXIT
	END

	IF ~~ THEN SResE3
		SAY @363
		= @364
		= @365
		IF ~~ THEN EXIT
	END

	IF ~~ THEN SResE4
		SAY @366
		= @367
		IF ~~ THEN EXIT
	END

	IF ~~ THEN SResE5
		SAY @368
		= @369
		= @370
		IF ~~ THEN EXIT
	END
		
	IF ~~ THEN SRes1b
		SAY @371
		= @372
		= @373
		IF ~~ THEN GOTO SResE
	END
		
	IF ~~ THEN SRes1c
		SAY @371
		= @372
		= @374
		= @375
		IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-10) ~ EXIT
	END	

	IF ~~ THEN SRes2
		SAY @342
		= @376
		++ @344 + SRes1a
		++ @345 + SRes1b
		++ @346 + SRes1c
	END

	IF ~~ THEN SRes3
		SAY @377
		= @378
		IF ~~ THEN GOTO SRes1b
	END
END


// After these happen, the player gets a new PID option in Imoen's "Can I ask you a question?" menu:
// PID options:
/*
+ ~Global("IRTResistTheSlayer","GLOBAL",2) Global("IRTResistTheSlayerQ","GLOBAL",0)~ + ~You've been dealing with the Taint for quite some time. How are you holding up?~ DO ~SetGlobal("IRTResistTheSlayerQ","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + HowResist
+ ~Global("IRTImoenControlsSlayer","GLOBAL",1) Global("IRTImoenControlsSlayerQ","GLOBAL",0)~ + ~How is it for you to become the Slayer?~ DO ~SetGlobal("IRTImoenControlSlayerQ","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + HowSlay 
+ ~Global("IRTImoenIsRavager","GLOBAL",1) Global("IRTImoenIsRavagerQ","GLOBAL",0)~ + ~How is it to become the Ravager?~ DO ~SetGlobal("IRTImoenIsRavagerQ","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + HowAss 
*/

 