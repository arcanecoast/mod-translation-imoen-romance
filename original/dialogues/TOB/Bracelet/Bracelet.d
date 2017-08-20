// This is Imoen's Bracelet Mini quest.

BEGIN ~IRTSoren~
BEGIN ~IRTXag~


// Part 1: Imoen inquires about the bracelet in Saradush
//// She initiates conversation with Lazarus after completion of the spellbook quest, right after the player is done talking to him.
// Only happens if Imoen has the bracelet, d'uh


CHAIN IF ~Global("IRTLazarusBracelet","GLOBAL",1)~ THEN IMOEN25J Notice
	~Oh hey, if there's someone that would know, it'd be you. Got a moment, Mr. Librarus?~ [ IRQUIET ]
	== 25SPELL @1 DO ~SetGlobal("IRTLazarusBracelet","GLOBAL",2)~
	== IMOEN25J @2
	= @3
	== 25SPELL @4
	= @5
	== IMOEN25J @6
	== 25SPELL @7
	== IMOEN25J @8
	== 25SPELL @9
	== IMOEN25J @10
	= @11
	== 25SPELL @12
	= @13
	==IMOEN25J @14 
	DO ~ StartCutSceneMode() StartCutScene("BracCut1") ~ 
EXIT

////  Cutscene: A standard fast fade to black and back to color.

CHAIN IF ~Global("IRTLazarusBracelet","GLOBAL",2)~ THEN IMOEN25J Notice2
    @15
	== 25SPELL @16
	== IMOEN25J @17 
	== 25SPELL @18
	== IMOEN25J @19
	= @20
	== 25SPELL @21
	== IMOEN25J @22
	DO ~SetGlobal("IRTLazarusBracelet","GLOBAL",3)~
EXIT



// Part 2: Reunion in Amkethran.


CHAIN IF  ~Global("IRTLazarusBracelet","GLOBAL",4)~ THEN IMOEN25J NoDo
	~Oh, hey, Mr. L! Done with that translation we talked about?~ [ IRQUIET ] DO ~SetGlobal("IRTLazarusBracelet","GLOBAL",5) SetGlobalTimer("IRTLazarusBraceletTimer","GLOBAL",TWO_DAYS)~
	== 25SPELL @24
	== IMOEN25J @25
	== 25SPELL @26
	== IMOEN25J @27
	== 25SPELL @28
	= @29
	== IMOEN25J @30
	== 25SPELL @31
	== IMOEN25J @32
	== 25SPELL @33
	== IMOEN25J @34
	= @35
	== 25SPELL @36
	== IMOEN25J @37
END IMOEN25J NoDoR

APPEND IMOEN25J
IF ~~ THEN NoDoR
	SAY @38
	++ @39 + NoDoYes
	++ @40 + NoDo3
	++ @41 + NoDo2
	++ @42 + NoDo1
END

IF ~~ NoDo1
   SAY @43
   ++ @44 + NoDoNo
   ++ @45 + NoDoYes
   ++ @46 + NoDoYes
   ++ @47 + NoDoNo
END

IF ~~ NoDoNo
   SAY @48
   = @49
   IF ~~ THEN DO ~SetGlobal("IRTLazarusBracelet","GLOBAL",20)~ EXIT //break and stop entire quest
END

IF ~~ NoDoYes
   SAY @50
   IF ~~ THEN EXIT
END

IF ~~ NoDo2
   SAY @51
   ++ @44 + NoDoNo
   ++ @52 + NoDoYes
   ++ @46 + NoDoYes
   ++ @47 + NoDoNo
END

IF ~~ NoDo3
   SAY @53
   ++ @44 + NoDoNo
   ++ @54 + NoDoYes
   ++ @46 + NoDoYes
   ++ @47 + NoDoNo
END
END



// Part 3: Returing to Lazarus
////  Triggers if you enter Lazarus's shop with Global("IRTLazarusBracelet","GLOBAL",5) and GlobalTimerExpired("IRTLazarusBraceletTimer","GLOBAL")

CHAIN IF  ~Global("IRTLazarusBracelet","GLOBAL",6)~ THEN IMOEN25J Done
	@55
	== 25SPELL @56
	== IMOEN25J @57
	== 25SPELL @58
	= @59
	== IMOEN25J @60
	== 25SPELL @61
	= @62
	== IMOEN25J @63
	== 25SPELL @64
	= @65
END IMOEN25J DoneR

APPEND IMOEN25J 
IF ~~ THEN DoneR
	SAY @66
   ++ @67 + Done3
   ++ @68 + Done3
   ++ @69 + Done2
   ++ @70 + Done1
END
END

CHAIN IMOEN25J Done1
	@71
	= @72
	= @73 DO ~SetGlobal("IRTLazarusBracelet","GLOBAL",20)~ //some value that wont ever be triggered
EXIT

CHAIN IMOEN25J Done2
@74
= @75
== 25SPELL @76 DO ~SetGlobal("IRTLazarusBracelet","GLOBAL",7)~
== IMOEN25J @77
EXIT


//// Add to the bottom of Lazarus's standard Amkethran greeting
EXTEND_BOTTOM 25SPELL 1
+ ~Global("IRTLazarusBracelet","GLOBAL",7)  OR(2)PartyHasItem("MRIMRIN1") HasItemEquiped("MRIMRIN1","Imoen2")~ + @78 + Bracelet
END

CHAIN 25SPELL Bracelet
@79
END IMOEN25J Done3

CHAIN IMOEN25J Done3
	@80
	= @81
	== 25SPELL @82
	== IMOEN25J @83
	== 25SPELL @84
	== IMOEN25J @85
	= @86
DO ~StartCutSceneMode() StartCutScene("BracCut2") ~
EXIT

////   Camera pans to center on Imoen while Imoen displays the casting animation for the same spell school as Freedom (the spell used to cancel Imprisonment). A few seconds after she finishes casting, a blue wisp materializes in front of her.

CHAIN IF  ~Global("IRTLazarusBracelet","GLOBAL",9)~ THEN IRTSoren BobTalk
	@87
	== IMOEN25J @88
	== IRTSoren @89
	= @90
	== IMOEN25J @91
	== IRTSoren @92
	= @93
	== IMOEN25J @94
	== IRTSoren @95
	= @96
	== IMOEN25J @97
	== IRTSoren @98
	== IMOEN25J @99
	== IRTSoren @100
	== IMOEN25J @101
	== IRTSoren @102
	== IMOEN25J @103
	== IRTSoren @104
	== IMOEN25J @105
END IRTSoren BobTalkR

APPEND IRTSoren
IF ~~ THEN BobTalkR
	SAY @106
   ++ @107 EXTERN IMOEN25J BobTalk4
   ++ @108 EXTERN IMOEN25J BobTalk3
   ++ @109 EXTERN IMOEN25J BobTalk1
   ++ @110 EXTERN IMOEN25J BobTalk2
   ++ @111 EXTERN IMOEN25J BobTalk1
END
END

APPEND IMOEN25J
IF ~~ THEN BobTalk1
	SAY @112
	IF ~~ THEN EXTERN IRTSoren BobTalk1R
END
END

APPEND IRTSoren
IF ~~ THEN BobTalk1R
	SAY @113
   ++ @114 EXTERN IMOEN25J BobTalkHaggle
   ++ @115 EXTERN IMOEN25J BobTalkNo
END
END

CHAIN IMOEN25J BobTalkHaggle
@116
END IRTSoren BobTalkYes

CHAIN IMOEN25J BobTalk2
	@117
	== IRTSoren @113
	== IMOEN25J @118
END
   ++ @119 EXTERN IMOEN25J BobTalkNo
   ++ @120 EXTERN IMOEN25J BobTalkNo
   ++ @121 EXTERN IMOEN25J BobTalkQuick

CHAIN IMOEN25J BobTalkQuick
	@122
END IRTSoren BobTalkYes

CHAIN IMOEN25J BobTalk3
	@123
	== IRTSoren @124
END
   ++ @125 EXTERN IMOEN25J BobTalk4
   ++ @126 EXTERN IMOEN25J BobTalk1
   ++ @110 EXTERN IMOEN25J BobTalk2
   ++ @127 EXTERN IMOEN25J BobTalk1

CHAIN IMOEN25J BobTalk4
	@128
END IRTSoren BobTalkYes

CHAIN IMOEN25J BobTalkNo
	@48
	== IRTSoren @129
	== IMOEN25J @130
	== IRTSoren @131
	== IMOEN25J @132
	== IRTSoren @133
DO ~StartCutSceneMode() StartCutScene("BracCut3")~ EXIT

//// Cutscene: the apparition vanishes . Dialogue restarts with Imoen

CHAIN IF WEIGHT #200 ~Global("IRTLazarusBracelet","GLOBAL",19)~ THEN IMOEN25J BobTalkBad
	@134 DO ~SetGlobal("IRTLazarusBracelet","GLOBAL",20) IncrementGlobal("IRTLoveMeter","GLOBAL",-7)~
	== 25SPELL @135
	== IMOEN25J @136
EXIT

CHAIN IRTSoren BobTalkYes
	@137
	= @138
DO ~SetGlobal("IRTLazarusBracelet","GLOBAL",10) StartCutSceneMode() StartCutScene("BracCut4")~
EXIT

//// Cutscene: After some flashy spell effects, a swirling portal is created right at the wall.
// Sorenthis displays the following string above his head:
// "You need only walk through the wall. Xaglaroth awaits." (all without the quotes)
// Imoen walks over to the desk, displays the following string:
// "Can't forget to take this thing..."
// The Player walks toward the portal, then it cuts to the Demon's lair. A suitable area could be recycled, like a chunk of the hell trials or the planar sphere area where you face the fat winged demon. 
// After a few seconds, the following string displays over the player's head:
// "Suffocating heat engulfs you as soon as you step through the portal. The air here reeks of sulfur and rot, forcing you to take shallow breaths. The sky, drawn in and oppressive, is a solid sheet of black."
// Imoen starts conversation:

CHAIN IF  ~Global("IRTLazarusBracelet","GLOBAL",11)~ THEN IMOEN25J LairIntro
	~Oh Gods. This is awful.~ [ IRQUIET ]
	== NALIA25J IF ~IsValidForPartyDialog("Nalia")~ THEN @140
	== JAHEI25J IF ~IsValidForPartyDialog("Jaheira")~ THEN @141
	== AERIE25J IF ~IsValidForPartyDialog("Aerie")~ THEN @142
	== EDWIN25J IF ~IsValidForPartyDialog("Edwin")~ THEN @143
	== SAREV25J IF ~IsValidForPartyDialog("Sarevok")~ THEN @144
	== KORGA25J IF ~IsValidForPartyDialog("Korgan")~ THEN @145
	== IMOEN25J @146
   = @147
   DO ~SetGlobal("IRTLazarusBracelet","GLOBAL",12) StartCutSceneMode() StartCutScene("BraCut4b")~
EXIT


/*


Xaglaroth uses one of the gross demon models in the game. He starts dialogue as soon as he comes into view of a visible character. He has three different starting dialogues, depending on how the player approached. If the player managed to destroy Xaglaroth before he could initiate dialogue, Imoen begins dialogue as soon as combat is over as if you picked the violent path in conversation.

If Xaglaroth turns enemy at any point, any surviving imps turn hostile. The fight is pretty standard demon stuff, just like any that has been summoned through a Gate. If you feel like it, go ahead and get creative with him casting some spells or having special abilities. It feels right that he should focus on Imoen, too. Don't make it too hard, however; he is pleading for his life because he knows he can't beat you, after all.

*/


APPEND IRTXag
IF ~Global("IRTBraceletXag","GLOBAL",1)~ Xag1
   SAY @148
   IF ~~ THEN DO ~SetGlobal("IRTBraceletXag","GLOBAL",2)~ GOTO XagStay
END


// Convergence

IF ~~ XagStay
   SAY @149
   = @150
   ++ @151 + XagViolence
   ++ @152 EXTERN IMOEN25J XagHey
   ++ @153 + XagHiss
   ++ @154 EXTERN IMOEN25J XagWhat
   ++ @155 + XagNo
END

IF ~~ XagViolence
   SAY @156
   IF ~~ THEN DO ~Enemy()~ EXIT
END
END

CHAIN IRTXag XagHiss
	@157
	= @158
	== IMOEN25J @159
	== IRTXag @160
END
	++ @161 EXTERN IRTXag XagExplain
	++ @162 EXTERN IRTXag XagNo
	++ @163 EXTERN IMOEN25J XagWhat

APPEND IRTXag
IF ~~ XagExplain
   SAY @164
   = @165
   ++ @162 + XagNo
   ++ @163 EXTERN IMOEN25J XagWhat
END

IF ~~ XagNo
   SAY @166
   = @167
   ++ @168 + XagNo1
   ++ @169 + XagSpared
   ++ @170 + XagNo2
   ++ @171 + XagViolence
END

IF ~~ XagNo1
   SAY @172
   ++ @173 + XagSpared
   ++ @174 + XagNo2
   ++ @175 + XagViolence
END

IF ~~ XagNo2
   SAY @176
   ++ @173 + XagSpared
   ++ @177 + XagViolence
END
END

CHAIN IMOEN25J XagHey
	@178
	== IRTXag @179
	= @180
END
	++ @161 EXTERN IRTXag XagExplain
	++ @162 EXTERN IRTXag XagNo
	++ @163 EXTERN IMOEN25J XagWhat

CHAIN IMOEN25J XagWhat
	@181
	== IRTXag @182
	== IMOEN25J @183
END
	++ @184 + XagWhat2
	++ @185 + XagCommand
	++ @186 + XagWhat2
	++ @187 + XagWhat1
	++ @188 EXTERN IRTXag XagNo

APPEND IMOEN25J
IF ~~ XagWhat1
   SAY @189
   IF ~~ THEN EXTERN IRTXag XagWhatLast
END

IF ~~ XagWhat2
   SAY @190
   IF ~~ THEN EXTERN IRTXag XagWhatLast
END

IF ~~ XagWhatHypocrite
   SAY @191
   = @192
   ++ @193 + XagCommand
   ++ @194 + XagCommand
   ++ @195 + XagCommand
   ++ @196 EXTERN IRTXag XagNo
END
END

CHAIN IRTXag XagWhatLast
	@197
	== IMOEN25J @198
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @199
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",4)~ THEN @200
	== IMOEN25J @201
END
	++ @202 EXTERN IMOEN25J XagCommand
	++ @203 EXTERN IMOEN25J XagCommand
	++ @204 EXTERN IMOEN25J XagCommand
	++ @205 EXTERN IMOEN25J XagWhatHypocrite
	++ @206 EXTERN IRTXag XagNo


CHAIN IMOEN25J XagCommand
	@207
	= @208
	= @209
	= @210 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) SetGlobal("IRTImoenDumped","GLOBAL",1) RealSetGlobalTimer("IRTAerieComfortTimer","GLOBAL",300) SetGlobal("IRTNeverForgive","GLOBAL",1)~
	== IRTXag @211
	= @212
	DO ~SetGlobal("IRTBraceletCorrupted","GLOBAL",1) StartCutSceneMode() StartCutScene("BracCut5")~
EXIT

//// cutscene empower bracelet
CHAIN IF ~Global("IRTBraceletCorrupted","GLOBAL",1)~ THEN IRTXag XagCorruptedEnd
	@213
	= @214
	== IMOEN25J @215
	= @216
	== IRTXag @217
	DO ~ SetGlobal("IRTBraceletCorrupted","GLOBAL",2)~
END
    ++ @218 + XagWTF
	++ @219 DO ~StartCutSceneMode() StartCutScene("BraCut10") ~ EXIT
	++ @220 DO ~StartCutSceneMode() StartCutScene("BraCut10") ~ EXIT
	++ @221 DO ~StartCutSceneMode() StartCutScene("BraCut10")~ EXIT

APPEND IRTXag
IF ~~ XagWTF
   SAY @222
   ++ @223 DO ~StartCutSceneMode() StartCutScene("BraCut10")~ EXIT
   ++ @224 DO ~StartCutSceneMode() StartCutScene("BraCut10") ~ EXIT
END
END

CHAIN IRTXag XagSpared
	@225
	== IMOEN25J @226
END
	++ @227 EXTERN IRTXag XagViolence
	++ @228 EXTERN IMOEN25J XagSpared1
	++ @229 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~ EXTERN IRTXag XagViolence
	++ @230 EXTERN IMOEN25J XagSpared2
	++ @231 EXTERN IMOEN25J XagSpared3

CHAIN IMOEN25J XagSpared1
	@232
END IMOEN25J XagGiveCalcen

CHAIN IMOEN25J XagSpared2
	@233
END IMOEN25J XagGiveCalcen

CHAIN IMOEN25J XagSpared3
	@234
END IRTXag XagViolence

CHAIN IMOEN25J XagGiveCalcen
	@235
	== IRTXag @236
	== IMOEN25J @237
	= @238 DO ~SetGlobal("IRTXagSparedCutscene","GLOBAL",1)
	StartCutSceneMode() StartCutScene("BracCut7") ~ 
EXIT


CHAIN IF ~Global("IRTXagSparedCutscene","GLOBAL",1)~ THEN IRTSoren BobFreeXag1
	@239 DO ~SetGlobal("IRTXagSparedCutscene","GLOBAL",2)~
	== IMOEN25J @240
	== IRTSoren @241
	== IRTXag @242
	= @243
	== IMOEN25J @244
END IRTXag XagCont


/*
Cutscene: The way out opens and the party walks toward it.
Fade to black.
Fade from black back in Lazarus's shop.
Sorenthis starts the end-of-event dialogue with Imoen, below.
*/

APPEND IRTXag

IF ~~ XagCont
 SAY  @245
	=@246 
	= @247
	++ @219 DO ~StartCutSceneMode() StartCutScene("BracCut6")~ EXIT
	++ @248 DO ~StartCutSceneMode() StartCutScene("BracCut6")~ EXIT
	++ @221 DO ~StartCutSceneMode() StartCutScene("BracCut6")~ EXIT
END

IF ~~ XagWTF2
   SAY @249
   IF ~~ THEN DO ~Enemy()~ EXIT
END
END

/***************************************************/


/*
This next cutscene happens as soon as the Demon Xaglaroth is dead, Sorenthis is still trapped, Imoen is still alive and combat has ended.
*/

CHAIN IF ~Global("IRTXagKilled","GLOBAL",1) Global("IRTXagImoenDead","GLOBAL",0)~ THEN IRTSoren BobFreeNoXag1
	@239 DO ~ SetGlobal("IRTXagKilled","GLOBAL",2) SetGlobal("IRTSorenReturnPrompt","GLOBAL",1)~
	== IMOEN25J @240
	== IRTSoren @250
	== IMOEN25J @251
	  == IRTSoren @252
EXIT

//DOES NOT EXECUTE
//current problem where we cant get rid of the bracelet because when imoen dies its left on the ground
//if we ever figure out a good way to get rid of it then we can get this to run
CHAIN IF ~Global("IRTXagKilled","GLOBAL",1) Global("IRTXagImoenDead","GLOBAL",1)~ THEN IMOEN25J BobImDead
   @253  DO ~ SetGlobal("IRTSorenReturnPrompt","GLOBAL",1)  SetGlobal("IRTXagKilled","GLOBAL",2)~
   = @254
   == IRTSoren @255
   == IMOEN25J @256
   == IRTSoren @257
   == IMOEN25J @258
   == IRTSoren @252
EXIT

//DOES NOT EXECUTE
//current problem where we cant get rid of the bracelet because when imoen dies its left on the ground
//if we ever figure out a good way to get rid of it then we can get this to run
APPEND IRTSoren
	IF ~Global("IRTSorenReturnPrompt","GLOBAL",1)~ BobFinalExit
	SAY @259
	++ @260 DO ~ SetGlobal("IRTSorenReturnPrompt","GLOBAL",2) StartCutSceneMode() StartCutScene("BracCut6")~ EXIT
	++ @261 EXIT
	END
END 


/*
Cutscene: The way out opens as described before and the party walks toward it.
Fade to black.
Fade from black back in Lazarus's shop.
Sorenthis starts the end-of-event dialogue with Imoen, below.
*/


/*
 The End of Event talk with Sorenthis happens as soon as the cutscene to get back to Lazarus's Shop is over.
In case Sorenthis wasn't freed, Lazarus starts a conversation instead as soon as you show up in his shop.
*/

CHAIN IF ~Global("IRTBobEndOfEvent","GLOBAL",1)~ THEN IRTSoren End1
	@262 DO ~SetGlobal("IRTBobEndOfEvent","GLOBAL",2)~
	== 25SPELL @263
	== IMOEN25J @264
	== IRTSoren @265
	== IMOEN25J @266
	== IRTSoren @267
	== IMOEN25J @268
	= @269
	== IRTSoren @270 DO ~SetGlobal("IRTBobEndOfEvent","GLOBAL",2) StartCutSceneMode() StartCutScene("BracCut8")~ 
EXIT

/*
Cutscene:
Sorenthis teleports out with a swirly effect while displaying this string over his head:
~'til next we meet.~
End cutscene. Imoen gains the special ability to call Sorenthis three times a day, going in the same menu as all the bhaalspawn abilities. He functions like a regular Deva summon, except he displays one of these random strings whenever he gets summoned:
~Your foes shall perish.~
~Ready to heed your call.~
~I am here, Imoen.~

And displays these dialogues if talked to:
*/

APPEND IRTSoren
IF ~Global("IRTBobEndOfEvent","GLOBAL",2) !IsGabber("Imoen2")~ BobTalkNoIm
   SAY @271
   IF ~~ THEN EXIT
END
END

CHAIN IF ~Global("IRTBobEndOfEvent","GLOBAL",2) IsGabber("Imoen2") RandomNum(5,1)~ THEN IRTSoren BobTalkIm1
	@272
	== IMOEN25J @273
	== IRTSoren @274
	== IMOEN25J @275
EXIT

CHAIN IF ~Global("IRTBobEndOfEvent","GLOBAL",2) IsGabber("Imoen2") RandomNum(5,2)~ THEN IRTSoren BobTalkIm2
	@276
	== IMOEN25J @277
	== IRTSoren @278
	== IMOEN25J @279
	== IRTSoren @280
	== IMOEN25J @281
EXIT

CHAIN IF ~Global("IRTBobEndOfEvent","GLOBAL",2) IsGabber("Imoen2") RandomNum(5,3)~ THEN IRTSoren BobTalkIm3
	@282
	== IMOEN25J @283
	== IRTSoren @284
EXIT

CHAIN IF ~Global("IRTBobEndOfEvent","GLOBAL",2) IsGabber("Imoen2") RandomNum(5,4)~ THEN IRTSoren BobTalkIm4
	@285
	== IMOEN25J @286
	== IRTSoren @287
	== IMOEN25J @288
	== IRTSoren @289
	== IMOEN25J @290
	== IRTSoren @291
	== IMOEN25J @292
EXIT

CHAIN IF ~Global("IRTBobEndOfEvent","GLOBAL",2) IsGabber("Imoen2") RandomNum(5,5)~ THEN IRTSoren BobTalkIm5
@272
	== IMOEN25J @293
	== IRTSoren @294
	== IMOEN25J @295
	== IRTSoren @296
	== IMOEN25J @297
EXIT


////If the bracelet was corrupted, Lazarus starts a conversation with you as soon as you return

CHAIN IF ~Global("IRTBraceletCorrupted","GLOBAL",2)~ THEN IMOEN25J IRTBobCorrupted
	@298
	== 25SPELL@299
	== IMOEN25J @300
	== 25SPELL @301 DO ~SetGlobal("IRTBraceletCorrupted","GLOBAL",3)~ 
EXIT


