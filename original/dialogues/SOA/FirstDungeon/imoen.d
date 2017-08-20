/*Irenicus dungeon first talk */
APPEND IMOENJ

	IF ~Global("MRLeaveDungeon","GLOBAL",2)~ THEN BEGIN MRLeaveDungeon
	 SAY @0 
	 IF ~~ THEN REPLY @1 DO ~SetGlobal("MRLeaveDungeon","GLOBAL",3)~ GOTO MRLeaveDungeonNext
	 IF ~~ THEN REPLY @2 DO ~SetGlobal("MRLeaveDungeon","GLOBAL",3)~ GOTO MRLeaveDungeonNext
	 ++ @3 DO ~SetGlobal("MRLeaveDungeon","GLOBAL",3)~ + MRLeaveDungeonQuiet
        END
        
        IF ~~ THEN BEGIN MRLeaveDungeonQuiet
           SAY @4
           IF ~~ THEN EXIT
        END

	IF ~~ THEN BEGIN MRLeaveDungeonNext
	 SAY @5
	 IF ~~ THEN REPLY @6 GOTO MRLeaveDungeonAche
	 IF ~IfValidForPartyDialogue("Jaheira")~ THEN REPLY @7 GOTO MRLeaveDungeonAche
	 IF ~~ THEN REPLY @8 GOTO MRLeaveDungeonHug
	 IF ~~ THEN REPLY @9 GOTO MRLeaveDungeonSilence
	END

	IF ~~ THEN BEGIN MRLeaveDungeonHug
	 SAY @10
	 IF ~~ THEN GOTO MRLeaveDungeonHug2
	END

	IF ~~ THEN BEGIN MRLeaveDungeonHug2
	 SAY @11
	 IF ~~ THEN REPLY @12 GOTO MRLeaveDungeonClose
	 IF ~~ THEN REPLY @13 GOTO MRLeaveDungeonClose
	 IF ~~ THEN REPLY @14 GOTO MRLeaveDungeonDeath
	 IF ~~ THEN REPLY @9 GOTO MRLeaveDungeonSilence
	END

	IF ~~ THEN BEGIN MRLeaveDungeonAche
	 SAY @15
	 IF ~~ THEN REPLY @12 GOTO MRLeaveDungeonClose
	 IF ~~ THEN REPLY @13 GOTO MRLeaveDungeonClose
	 IF ~~ THEN REPLY @14 GOTO MRLeaveDungeonDeath
	 IF ~~ THEN REPLY @9 GOTO MRLeaveDungeonSilence
	END

	IF ~~ THEN BEGIN MRLeaveDungeonClose
	 SAY @16
         = @17
         IF ~~ THEN REPLY @18 GOTO MRLeaveDungeonPromise
	 IF ~~ THEN REPLY @19 GOTO MRLeaveDungeonSplit
	 IF ~~ THEN REPLY @20 GOTO MRLeaveDungeonSilence
	 IF ~~ THEN REPLY @21 GOTO MRLeaveDungeonBurden
	END

	IF ~~ THEN BEGIN MRLeaveDungeonPromise
	 SAY @22
	 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeonSilence
	 SAY @23
	 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeonSplit
	 SAY @24
	 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeonDeath
	 SAY @25
         = @26
	 IF ~~ THEN GOTO MRLeaveDungeonDeath2
	END

	IF ~~ THEN BEGIN MRLeaveDungeonDeath2
	 SAY @27
	 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeonBurden
	 SAY @28
	 IF ~~ THEN EXIT
	END



	 /* second talk */

	IF ~Global("MRAtExit","GLOBAL",1)~ THEN BEGIN MRLeaveDungeon2
	 SAY @29
	 IF ~~ THEN DO ~SetGlobal("MRAtExit","GLOBAL",2) ActionOverride("TALKERMR",DestroySelf())~ GOTO MRLeaveDungeon2next
	END

	IF ~~ THEN BEGIN MRLeaveDungeon2next
	 SAY @30
	 = @31
	 IF ~~ THEN REPLY @32 GOTO MRLeaveDungeon2Anger
	 IF ~~ THEN REPLY @33 GOTO MRLeaveDungeon2Leave
	 IF ~~ THEN REPLY @34 GOTO MRLeaveDungeon2Revenge
	END


	IF ~~ THEN BEGIN MRLeaveDungeon2Anger
	 SAY @35
	 = @36
	 = @37
	 IF ~~THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeon2Leave
	 SAY@38
	 =@39
	 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeon2Revenge
	 SAY @40
	 = @41
	 IF ~~ THEN EXIT
	END
END