//exitting underdark, first talk

ADD_TRANS_ACTION C6ELHAN2
BEGIN 54 63 END
BEGIN 0 END
~RealSetGlobalTimer("MRExitCommentTimer","GLOBAL",5)~

APPEND IMOEN2J

	IF ~Global("MRExitComment","AR2500",1)  GlobalGT("MRLoveTalk","GLOBAL",9)~ THEN BEGIN MRCampfire
		SAY ~I can't believe we are finally outta that hellhole, ugh... (She takes a deep breath) About time we got rid of that awful musty smell.~ [ MRImRom3 ]
		IF ~~ THEN DO ~SetGlobal("MRExitComment","AR2500",2) SetGlobal("MRCampPrompt","GLOBAL",5)~ GOTO MRCampfire2
	END
	
	IF ~Global("MRExitComment","AR2500",1)  !GlobalGT("MRLoveTalk","GLOBAL",9)~ THEN BEGIN MRCampfire
		SAY @1
		 =~Mmh, that's so nice. In the stories they never say just how bad the Underdark smells.~ [ IRQUIET ]
		IF ~~ THEN DO ~SetGlobal("MRExitComment","AR2500",2)~ GOTO MRGladeN
	END
	
	IF ~~ THEN MRGladeN
	SAY @3
	= @4
	IF ~~ THEN EXIT
END
END


CHAIN IMOEN2J MRCampfire2
	@5
	==JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @6
	==AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @7
	==CERNDJ IF ~IsValidForPartyDialog("Cernd")~ THEN @8
	==NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @9
END IMOEN2J MRCampfire3

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfire3
		SAY @10
		=
		@11
		IF ~IsValidForPartyDialog("Viconia")~ THEN REPLY @12 EXTERN VICONIJ MRCampfire3
		IF ~!IsValidForPartyDialog("Viconia")~ THEN REPLY @13 GOTO MRCampfireYes
		++ @14 GOTO MRCampfireYes
		++ @15 GOTO MRCampfireNo
		++ @16 GOTO MRCampfireCruel
	END
END

APPEND ~VICONIJ~
	IF ~~ THEN BEGIN MRCampfire3
		SAY @17
		IF ~~ THEN EXTERN IMOEN2J MRCampfireYes
	END
END

APPEND IMOEN2J

	IF ~~ THEN BEGIN MRCampfireCruel
		SAY @18
		= @19
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireNo
		SAY @20
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireYes
		SAY @21
		IF ~~ THEN DO ~SetGlobal("MRCampfire","GLOBAL",1)~
		EXIT
	END
END

APPEND IMOEN2J
IF  ~Global("MRCampPrompt","GLOBAL",3)~ THEN MRArrivedAtGlade
	SAY @22
	= @23
	IF ~~ THEN DO ~SetGlobal("MRCampPrompt","GLOBAL",4)~ EXIT
END
END

