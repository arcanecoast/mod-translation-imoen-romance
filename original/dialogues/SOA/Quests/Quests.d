APPEND IMOEN2J  //// Changes: Basic punctuation

	IF ~Global("MRDragonKillTalk","GLOBAL",1)~ THEN BEGIN MRDragonSlayer
		SAY @0
		= @1
		= @2
		IF ~~ THEN DO ~SetGlobal("MRDragonKillTalk","GLOBAL",2)~ EXIT
	END
	
	IF ~Global("MRDragonKillTalk","GLOBAL",3)~ THEN BEGIN MRDragonSlayer2
		SAY @3
		IF ~~ THEN DO ~SetGlobal("MRDragonKillTalk","GLOBAL",4)~ EXIT
	END
END

ADD_TRANS_TRIGGER COWENF2 0 ~OR(2) !IsValidForPartyDialog("Imoen2") !Global("MRImoenCowl","GLOBAL",0)~ DO 0
ADD_TRANS_TRIGGER COWENF2 0 ~OR(2) !IsValidForPartyDialog("Imoen2") !Global("MRImoenCowl","GLOBAL",0)~ DO 1

EXTEND_BOTTOM COWENF2 0
  IF ~IsValidForPartyDialog("Imoen2") Global("MRImoenCowl","GLOBAL",0)~ THEN DO ~SetGlobal("MRImoenCowl","GLOBAL",2)~ EXTERN IMOEN2J MRCowledWizards
END

ADD_TRANS_TRIGGER COWENF2 1 ~OR(2) !IsValidForPartyDialog("Imoen2") !Global("MRImoenCowl","GLOBAL",0)~ DO 0

EXTEND_BOTTOM COWENF2 1
  IF ~IsValidForPartyDialog("Imoen2") Global("MRImoenCowl","GLOBAL",0)~ THEN DO ~SetGlobal("MRImoenCowl","GLOBAL",2)~ EXTERN IMOEN2J MRCowledWizards
END

ADD_TRANS_TRIGGER COWENF2 2 ~OR(2) !IsValidForPartyDialog("Imoen2") !Global("MRImoenCowl","GLOBAL",0)~ DO 0

EXTEND_BOTTOM COWENF2 2
  IF ~IsValidForPartyDialog("Imoen2") Global("MRImoenCowl","GLOBAL",0)~ THEN DO ~SetGlobal("MRImoenCowl","GLOBAL",2)~ EXTERN IMOEN2J MRCowledWizards
END

/* #2 - Running into the Cowled Wizards in Athkatla, after being rescued from Spellhold */
/* Triggers if the Cowled Wizards show up because you're doing unauthorized magic, or you meet Tolgerias in the Government District */
/* after they speak their first lines (so, interjecting after them). We need a CHAIN here between Imoen and the wizard (whoever that is) */

/* Not Tolgerias */
CHAIN IMOEN2J MRCowledWizards
@4
== COWENF2 @5
== IMOEN2J IF ~!IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Jaheira") !IsValidForPartyDialog("Korgan")~ THEN @6
== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @7
== MINSCJ IF ~ IsValidForPartyDialog("Minsc")~ THEN @8
== MINSCJ IF ~ IsValidForPartyDialog("Minsc")~ THEN @9
== JAHEIRAJ IF ~ IsValidForPartyDialog("Jaheira")~ THEN @10
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @11
END COWENF2 cowattack

APPEND COWENF2
	IF ~~ THEN cowattack
	SAY @12
	 IF ~~ THEN DO ~IncrementGlobal("CowledWarning","GLOBAL",1)
	CreateCreatureObject("MAGE16C",Myself,0,0,0)
	CreateCreatureObject("MAGE18A",Myself,0,0,0)
	CreateCreatureObject("MAGE18Z",Myself,0,0,0)
	Enemy()
	~ EXIT
	END
END

/* Tolgerias, in the Government District */

CHAIN 
IF ~Global("MRImoenCowl","GLOBAL",1)~ THEN IMOEN2J MRCowledWizards2
@4
DO ~SetGlobal("MRImoenCowl","GLOBAL",2)~
== TOLGER @5
== IMOEN2J IF ~!IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Jaheira") !IsValidForPartyDialog("Korgan")~ THEN @6
== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @7
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @8
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @9
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @10
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @11
== TOLGER @13
EXIT


/* #3 - When you return the acorns to the Dryads in Windspear Hills */
/* After you give the acorns back and the dryads re-appear, and if you don't have Imoen's soul back yet */

INTERJECT_COPY_TRANS2 VAELASA 6 MRDryadQuest
== IDRYAD1 IF ~IsValidForPartyDialog("Imoen2")~ THEN @14
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2")~ THEN @15
== IDRYAD1 IF ~IsValidForPartyDialog("Imoen2")~ THEN @16
== IDRYAD2 IF ~IsValidForPartyDialog("Imoen2")~ THEN @17
== IDRYAD3 IF ~IsValidForPartyDialog("Imoen2")~ THEN @18
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2")~ THEN @19
== VAELASA IF ~IsValidForPartyDialog("Imoen2")~ THEN @20
== VAELASA IF ~IsValidForPartyDialog("Imoen2")~ THEN @21
END

/* #5 -- Meeting Drizzt */
APPEND IMOEN2J
	IF ~Global("MRMeetDrizzt","GLOBAL",1)~ THEN BEGIN MRDrizzt
		SAY @22
		= @23
		IF ~~ THEN DO ~SetGlobal("MRMeetDrizzt","GLOBAL",2)~ EXIT
	END
END

INTERJECT_COPY_TRANS C6DRIZZ2 0 MRDrizzt2
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2")~ THEN
@24
= @25
== C6DRIZZ2 IF ~IsValidForPartyDialog("Imoen2")~ THEN
@26
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2")~ THEN
 @27
END

/* #6 - The Druid Grove, if Jaheira duels Falon for control and wins */
ADD_TRANS_TRIGGER JAHEIRAJ 94 ~OR(3) !See("Imoen2") !InParty("Imoen2") StateCheck("Imoen2",CD_STATE_NOTVALID)~ DO 0

EXTEND_BOTTOM JAHEIRAJ 94
 IF ~See("Imoen2") InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("MRJahFaldorn","GLOBAL",1)~ EXTERN ~CEFALDOR~ 12
END 

CHAIN 
IF ~Global("MRJahFaldorn","GLOBAL",2)~ THEN IMOEN2J MRDruidDuel
@28
DO ~SetGlobal("MRJahFaldorn","GLOBAL",3)~
==MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @29
==IMOEN2J IF ~IsValidForPartyDialog("Minsc")~ THEN @30
==IMOEN2J IF ~!IsValidForPartyDialog("Minsc")~ THEN @31
EXIT
	
	
/* #7 - The Circus, when you see the circus tent (not sure how to code this -- perhaps when you see the guard or something?) ~ */
APPEND IMOEN2J
	IF ~Global("MRCircus","GLOBAL",1)~ THEN BEGIN MRCircus
			SAY @32
			= @33
			= @34
			IF ~~ THEN DO ~SetGlobal("MRCircus","GLOBAL",2)~ EXIT
	END
	
	IF ~Global("MRCircus","GLOBAL",3)~ THEN BEGIN MRCircus2
	SAY @35
	IF ~~ THEN DO ~SetGlobal("MRCircus","GLOBAL",4)~ EXIT
	END
END

/* #8 - Planar Sphere -- when subduing Lavok -- so, after he is defeated and gives his speech about getting a demon heart and returning to the Material Plane */
APPEND IMOEN2J
	IF ~Global("MRLavok","GLOBAL",1)~ THEN BEGIN MRLavok
	SAY @36
	IF ~~ THEN DO ~SetGlobal("MRLavok","GLOBAL",2)~ EXIT
	END
END


/* #9 - Unseeing Eye -- triggered after hearing Gaal's diatribe about the eyes */
INTERJECT_COPY_TRANS CSGAAL 10 MRUnseeingEye
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2")~ THEN
@37
END


// *** Gong quest ***

INTERJECT_COPY_TRANS LOUT 20 MRGongQuest
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2")~ THEN
@38
== LOUT IF ~IsValidForPartyDialog("Imoen2")~ THEN
@39
END

INTERJECT_COPY_TRANS2 ROGER 13 MRGongQuest2
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2")~ THEN
@40
== JAHEIRAJ IF ~IsValidForPartyDialog("Imoen2") IsValidForPartyDialog("Jaheira")~ THEN
@41
END