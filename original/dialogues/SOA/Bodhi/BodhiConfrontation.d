/* The Bodhi 'Kidnap' Scene - COMPLETED*/

ADD_TRANS_TRIGGER BODHIAMB 6 ~OR(3) !InParty("Imoen2") !See("Imoen2") StateCheck("Imoen2",CD_STATE_NOTVALID)~ DO 0

EXTEND_BOTTOM BODHIAMB 6
 IF ~InParty("Imoen2") See("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN GOTO MRBodhi6
END

//the prior dialogue above has See because Bodhi is there, but she has dissapeared now so remove See
//conditions below
ADD_TRANS_TRIGGER BODHIAMB 7 ~OR(2) !InParty("Imoen2") StateCheck("Imoen2",CD_STATE_NOTVALID)~ DO 0

EXTEND_BOTTOM BODHIAMB 7
  IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN DO ~ DialogueInterrupt(FALSE)
	CreateCreatureObject("VAMPIM01",Myself,0,0,0)
	CreateCreatureObject("VAMPIM01",Myself,0,0,0)
	CreateCreatureObject("VAMPIM01",Myself,0,0,0)
	CreateCreatureObject("VAMPIM01",Myself,0,0,0)
	ForceSpell(Myself,DRYAD_TELEPORT)
	Wait(1)
	SetGlobal("Deactivate0801","AR0800",3)
	DestroySelf()
	~ UNSOLVED_JOURNAL #16351 /* ~The final battle with Bodhi

	Bodhi has revealed herself to me, letting me know that she is aware of my pursuit... and in an attempt to dissuade me from entering her lair unleashed yet more of her undead creations upon me. She swears I will lose much more than my life if I continue to pursue her... although, in truth, I have little choice.~ */ EXTERN IMOEN2J MRBodhiGone
END


APPEND BODHIAMB
	IF ~~ THEN BEGIN MRBodhi6
		SAY @0
		IF ~OR(2) Global("ImoenRomanceActive","GLOBAL",1) Global("ImoenRomanceActive","GLOBAL",2)~ THEN GOTO MRBodhi6-1
		IF ~ GlobalGT("ImoenRomanceActive","GLOBAL",2)~ THEN GOTO MRBodhi6-2
	END

	IF ~~ THEN BEGIN MRBodhi6-1
		SAY @1
		=
		@2
		IF ~~ THEN EXTERN IMOEN2J MRBodhi6-1a
	END

	IF ~~ THEN BEGIN MRBodhi6-1b
		SAY @3
		IF ~~ THEN GOTO MRBodhi6-4
	END

	IF ~~ THEN BEGIN MRBodhi6-2
		SAY @4
		=
		@5
		=
		@6
		=
		@7
		IF ~~ THEN EXTERN IMOEN2J MRBodhi6-2a
	END


	IF ~~ THEN BEGIN MRBodhi6-4
		SAY @8
		=
		@9
		=
		@10
		IF ~~ THEN EXTERN IMOEN2J MRBodhi6-5a
	END

	IF ~~ THEN BEGIN MRBodhi6-6
		SAY @11
		IF ~~ THEN GOTO 7
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRBodhi6-1a
		SAY @12
		IF ~~ THEN EXTERN BODHIAMB MRBodhi6-1b
	END

	IF ~~ THEN BEGIN MRBodhi6-2a
		SAY @13
		IF ~~ THEN EXTERN BODHIAMB MRBodhi6-1b
	END

	IF ~~ THEN BEGIN MRBodhi6-5a
		SAY @14
		IF ~~ THEN EXTERN BODHIAMB MRBodhi6-6	
	END

	IF ~~ THEN BEGIN MRBodhiGone
		SAY @15
		IF ~~ THEN GOTO MRBodhiGone2
	END
END

CHAIN IMOEN2J MRBodhiGone2
@16
== NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @17
== JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @18
== ANOMENJ IF ~IsValidForPartyDialog("Anomen")~ THEN @19
== CERNDJ IF ~IsValidForPartyDialog("Cernd")~ THEN @20
== EDWINJ IF ~IsValidForPartyDialog("Edwin")~ THEN @21
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @22
== HAERDAJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @23
== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @24
== JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @25
== KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @26
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @27
== MAZZYJ IF ~IsValidForPartyDialog("Mazzy")~ THEN @28
== VALYGARJ IF ~IsValidForPartyDialog("Valygar")~ THEN @29
== IMOEN2J
@30
=
@31
EXIT
