// *** Imoen's comment about being free, this is when exitting spellhold to brynnlaw ***


APPEND IMOEN2J
	IF ~Global("MRExitComment","AR1500",1) AreaCheck("AR1500")~ THEN BEGIN MRExitComment
		SAY @0
		IF ~~ THEN DO ~SetGlobal("MRExitComment","AR1500",2)~ GOTO MRExitComment2
	END

	IF ~~ THEN BEGIN MRExitComment2
		SAY @1
		= @2
		IF ~~ THEN GOTO MRExitComment3
	END

	IF ~~ THEN BEGIN MRExitComment3
		SAY @3
		IF ~InParty("Aerie")~ THEN DO ~RealSetGlobalTimer("MRBanterStuffTalk","GLOBAL",1800) SetGlobal("MRBanterStuffEval","GLOBAL",1) RealSetGlobalTimer("MRAerieFriendshipTimer","GLOBAL",300)~ EXIT
		IF ~!InParty("Aerie")~ THEN EXIT
	END
END
