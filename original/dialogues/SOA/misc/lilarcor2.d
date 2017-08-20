CHAIN
IF ~Global("MRLilarcor","GLOBAL",1)~ THEN IMOEN2J MRLilarcorTalk //// Changes: basic punctuation
	@0
	== MRLILCOR @1
	== IMOEN2J @2
	== MRLILCOR @3
	== MRLILCOR @4
	== IMOEN2J @5
 == MRLILCOR @6
	== IMOEN2J @7
	== MRLILCOR @8
	== IMOEN2J @9
	== MRLILCOR @10
	== IMOEN2J @11
	== MRLILCOR @12
	== IMOEN2J @13
	DO ~SetGlobal("MRLilarcor","GLOBAL",2) RealSetGlobalTimer("MRLilarcorTimer","GLOBAL",500)~
END MRLILCOR MRLastFirstTalk

APPEND MRLILCOR

	IF ~~ THEN BEGIN MRLastFirstTalk
		SAY @14
		IF ~~ THEN DO ~DestroySelf()~ EXTERN IMOEN2J MRLastFirstTalk2
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRLastFirstTalk2
		SAY @15
		IF ~~ THEN EXIT
	END
END

/* Second talk -- check to make sure that Lilarcor is still equipped first */

APPEND MRLILCOR
	IF ~Global("MRLilarcor","GLOBAL",3)~ THEN BEGIN MRLilarcorTalk2
		SAY @16
			IF ~~ THEN REPLY @17 DO ~SetGlobal("MRLilarcor","GLOBAL",4)~ EXTERN MRLILCOR MRLilarcorTalk22
	END
END


CHAIN MRLILCOR MRLilarcorTalk22
	@18
	== IMOEN2J @19
	== MRLILCOR @20
	== IMOEN2J @21
	== MRLILCOR @22
	== IMOEN2J @23
END MRLILCOR MRLast2Talk


APPEND MRLILCOR
 IF ~~ THEN BEGIN MRLast2Talk
		SAY @24
		IF ~~ THEN DO ~DestroySelf()~ EXIT
	END
END