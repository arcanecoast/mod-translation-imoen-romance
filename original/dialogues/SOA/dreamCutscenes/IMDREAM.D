BEGIN IMDREAM

// **********************1st DREAM************************


IF ~Global("MRDream1","GLOBAL",1)~ THEN BEGIN MRDream1-1
 SAY ~Heya! It's me, Imoen!~ [ MRImDre2 ]
 =
 @1
 IF ~~ + MRDream1-2
END

IF ~~ THEN BEGIN MRDream1-2
SAY @2
 =
 @3
 =
 @4
 =
 @5
 
 IF ~Gender(Player1,MALE)~ THEN DO ~SetGlobal("MRDream1","GLOBAL",3)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("Cutim01")~
	EXIT
 IF ~Gender(Player1,FEMALE)~ THEN DO ~SetGlobal("MRDream1","GLOBAL",3)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("CutiF01")~
	EXIT
END

IF ~Global("MRDream1","GLOBAL",3)
~ THEN BEGIN MRDream1-3 // from:
 SAY @6
	= @7
	= @8
	= @9
	IF ~Gender(Player1, MALE)~ THEN GOTO sonOfBhaalThing
 IF ~Gender(Player1, FEMALE)~ THEN GOTO daughterOfBhaalThing
 END

 IF ~~ THEN BEGIN sonOfBhaalThing
 SAY @10
 IF ~~ + butForSomeReason
 END

 IF ~~ THEN BEGIN daughterOfBhaalThing
 SAY @11
 IF ~~ + butForSomeReason
 END

 IF ~~ THEN BEGIN butForSomeReason
	SAY @12
	= @13
IF ~Gender(Player1,MALE)~ THEN DO ~SetGlobal("MRDream1","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("Cutim02")~
EXIT
IF ~Gender(Player1,FEMALE)~ THEN DO ~SetGlobal("MRDream1","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("CutiF02")~
EXIT
END

IF ~Global("MRDream1","GLOBAL",5)~
THEN BEGIN MRDream1-4
	SAY @14
	=
	@15
	=
	@16
	IF ~Gender(Player1,MALE)~ THEN GOTO MRDR4Mal
	IF ~Gender(Player1,FEMALE)~ THEN GOTO MRDR4Fem
END

	IF ~~ THEN BEGIN MRDR4Mal
	SAY @17
	IF ~~ THEN DO ~SetGlobal("MRDream1","GLOBAL",6)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("Cuti03a")~
	EXIT
	END

	IF ~~ THEN BEGIN MRDR4Fem
	SAY @18
	IF ~~ THEN DO ~SetGlobal("MRDream1","GLOBAL",6)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("CuiF03a")~
	EXIT
	END


IF ~Global("MRDream1","GLOBAL",6)~ BEGIN MRDream1-5
	SAY @19
	=
	@20
	=
	@21
	IF ~Gender(Player1,MALE)~ THEN DO ~SetGlobal("MRDream1","GLOBAL",7)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("Cutim04")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~SetGlobal("MRDream1","GLOBAL",7)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("CutiF04")~
	EXIT
END

// *****************************2nd DREAM*******************************


IF ~Global("MRDream2","GLOBAL",1)~ THEN BEGIN MRDream2-1
 SAY @22
 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",1)~ GOTO MRDream2-2
END
IF ~~ THEN BEGIN MRDream2-2
	SAY @23
	=
	~They *are* memories... aren't they?~ [ MRImDre2 ]
	=
	@25
	=
	@26
	=
	@27
	=
	@28
	=
	@29
	=
	@30
	=
	@31
	=
	@32
	IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutim06")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutiF06")~
	EXIT
END

IF ~Global("MRDream2","GLOBAL",2)~ THEN BEGIN MRDream2-3
	SAY @33
	=
	@34
	IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutim07")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutiF07")~
	EXIT
END

IF ~Global("MRDream2","GLOBAL",5)~
	THEN BEGIN MRDream2-4
	SAY @14
	IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cuti07a")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cuiF07a")~
	EXIT
END

IF ~Global("MRDream2","GLOBAL",6)~ THEN BEGIN MRDream2-5
	SAY @35
	=
	@36
	=
	@37
	= @38
	IF ~Gender(Player1,MALE)~ THEN DO ~
    RealSetGlobalTimer("MRDreamComTimer","GLOBAL",20) 
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutim10")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~
    RealSetGlobalTimer("MRDreamComTimer","GLOBAL",20) 
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutiF10")~
	EXIT
END


// **********************************3rd Dream*************************************


IF ~Global("MRDream3","GLOBAL",1)~ THEN BEGIN MRDream3-1
	SAY @39
	=
	@40
	= ~I guess the actual question is, am I *really* Imoen? Do we share a special connection that lets me reach you from my own personal hellhole? Do I talk to you from far, far away?~ [ MRImRom6 ]
	= @42
	= @43
	= @44
	= @45
	= @46
	= @47
	IF ~OR(5)
		Alignment(Player1,LAWFUL_GOOD)
		Alignment(Player1,NEUTRAL_GOOD)
		Alignment(Player1,CHAOTIC_GOOD)
		Alignment(Player1,LAWFUL_NEUTRAL)
		Alignment(Player1,NEUTRAL)
 Gender(Player1,MALE)
	~ THEN GOTO MRDream3-2-Good-Male
	IF ~OR(5)
		Alignment(Player1,LAWFUL_GOOD)
		Alignment(Player1,NEUTRAL_GOOD)
		Alignment(Player1,CHAOTIC_GOOD)
		Alignment(Player1,LAWFUL_NEUTRAL)
		Alignment(Player1,NEUTRAL)
 Gender(Player1,FEMALE)
	~ THEN GOTO MRDream3-2-Good-Female
	IF ~OR(4)
		Alignment(Player1,CHAOTIC_NEUTRAL)
		Alignment(Player1,LAWFUL_EVIL)
		Alignment(Player1,NEUTRAL_EVIL)
		Alignment(Player1,CHAOTIC_EVIL)
	~ THEN GOTO MRDream3-2-Evil
END

IF ~~ THEN BEGIN MRDream3-2-Good-Male
	SAY @48
 IF ~~ THEN GOTO MRDream3-3
END

IF ~~ THEN BEGIN MRDream3-2-Good-Female
	SAY @49
 IF ~~ THEN GOTO MRDream3-3
END

IF ~~ THEN BEGIN MRDream3-2-Evil
	SAY @50
	=
	@51
	IF ~~ THEN GOTO MRDream3-3
END

IF ~~ THEN BEGIN MRDream3-3
	SAY @52
	= @53
	= @54
	= @55
	IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("Cutim12")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutiF12")~
	EXIT
END


IF ~Global("MRDream3","GLOBAL",2)~ THEN BEGIN MRDream3-4
	SAY @56 
	=
	@57
	=
	@58
	=
	~Oh, look, and we have company. Who coulda expected it? Not me, nu-uh.~ [ MRImRom3 ]
	IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("Cutim13")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutiF13")~
	EXIT
END

IF ~Global("MRDream3","GLOBAL",5)~ THEN BEGIN MRDream3-5
	SAY @14
	=
	@60
	=
	@61
        = @62
        = @63
        = @64
        = @65
        = @66
        = @67
	IF ~Gender(Player1,MALE)~THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("Cuti15a")~
	EXIT
	IF ~Gender(Player1,FEMALE)~THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cuiF15a")~
	EXIT
END


IF ~Global("MRDream3","GLOBAL",6)~ THEN BEGIN MRDream3-6
	SAY @68
	=
	@69
	= @70
	= @71
	= @72
	= @73
	= @74
	= @75
	= @76
	= @77
	= @78
	IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("Cutim16")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutiF16")~
	EXIT
END
