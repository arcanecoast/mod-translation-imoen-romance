/* Change the Hell Selfish trial to reflect the Imoen-Aerie Friendship */

ADD_TRANS_TRIGGER HELLSELF 24 ~!InParty("Imoen2")~ DO 0

EXTEND_BOTTOM HELLSELF 24
  IF ~InParty("Imoen2")~ THEN GOTO MRHellReplace
END

APPEND HELLSELF
	IF ~~ THEN BEGIN MRHellReplace
		SAY @0
		IF ~~ THEN EXTERN IMOEN2J MRHellReplace
	END
END

CHAIN IMOEN2J MRHellReplace
@1
== HELLSELF IF ~Name("Aerie",Player2) !Dead("Aerie") InParty("Aerie")~ THEN
@2
== AERIEJ IF ~Name("Aerie",Player2) !Dead("Aerie") InParty("Aerie")~ THEN
@3
== HELLSELF IF ~Name("Aerie",Player2) !Dead("Aerie") InParty("Aerie")~ THEN
@4 DO ~SetGlobal("MRHellTookAerie","GLOBAL",1)~
// He takes Jaheira //
== HELLSELF IF ~Name("Jaheira",Player2) !Dead("Jaheira") InParty("Jaheira")~ THEN
@5
== JAHEIRAJ IF ~Name("Jaheira",Player2) !Dead("Jaheira") InParty("Jaheira")~ THEN
@6
== HELLSELF IF ~Name("Jaheira",Player2) !Dead("Jaheira") InParty("Jaheira")~ THEN
@4 DO ~SetGlobal("MRHellTookJaheira","GLOBAL",1)~
// He takes Nalia //
== HELLSELF IF ~Name("Nalia",Player2) !Dead("Nalia") InParty("Nalia")~ THEN
@7
== NALIAJ IF ~Name("Nalia",Player2) !Dead("Nalia") InParty("Nalia")~ THEN
@3
== HELLSELF IF ~Name("Nalia",Player2) !Dead("Nalia") InParty("Nalia")~ THEN
@4 DO ~SetGlobal("MRHellTookNalia","GLOBAL",1)~
// He takes Minsc //
== HELLSELF IF ~Name("Minsc",Player2) !Dead("Minsc") InParty("Minsc")~ THEN
@8
== MINSCJ IF ~Name("Minsc",Player2) !Dead("Minsc") InParty("Minsc")~ THEN
@9
== HELLSELF IF ~Name("Minsc",Player2) !Dead("Minsc") InParty("Minsc")~ THEN
@4 DO ~SetGlobal("MRHellTookMinsc","GLOBAL",1)~
// He takes Keldorn //
== HELLSELF IF ~Name("Keldorn",Player2) !Dead("Keldorn") InParty("Keldorn")~ THEN
@10
== KELDORJ IF ~Name("Keldorn",Player2) !Dead("Keldorn") InParty("Keldorn")~ THEN
@6
== HELLSELF IF ~Name("Keldorn",Player2) !Dead("Keldorn") InParty("Keldorn")~ THEN
@4 DO ~SetGlobal("MRHellTookKeldorn","GLOBAL",1)~
// He takes someone that isn't one of those //
== HELLSELF IF ~NumInPartyGT(2) InPartyAllowDead(Player2) InParty(Player2) !Name("Imoen2",Player2)
OR(3) !Name("Aerie",Player2) Dead("Aerie") !InParty("Aerie") 
OR(3) !Name("Jaheira",Player2) Dead("Jaheira") !InParty("Jaheira") 
OR(3) !Name("Nalia",Player2) Dead("Nalia") !InParty("Nalia") 
OR(3) !Name("Minsc",Player2) Dead("Minsc") !InParty("Minsc") 
OR(3) !Name("Keldorn",Player2) Dead("Keldorn") !InParty("Keldorn")~ THEN
@11  DO ~SetGlobal("MRHellTookNPC","GLOBAL",1)~
END 
 IF ~NumInPartyGT(1) InPartyAllowDead(Player2) InParty(Player2) !Name("Imoen2",Player2)~ EXTERN HELLSELF 25
  IF ~NumInPartyGT(1) InPartyAllowDead(Player2) InParty(Player2) Name("Imoen2",Player2)~ EXTERN HELLSELF 26

APPEND IMOEN2J
	IF ~Global("MRSelfishTalk","GLOBAL",1) Global("MRHellTookAerie","GLOBAL",1)~ THEN BEGIN MRHellSelfAerie
		SAY @12
		IF ~GlobalGT("MRAerImFriend","GLOBAL",8)~ THEN DO ~SetGlobal("MRSelfishTalk","GLOBAL",2)~GOTO MRHellSelfAerie2
		IF ~!GlobalGT("MRAerImFriend","GLOBAL",8)~ THEN DO ~SetGlobal("MRSelfishTalk","GLOBAL",2)~GOTO MRHellSelfTookF
	END

	IF ~Global("MRSelfishTalk","GLOBAL",1) Global("MRHellTookJaheira","GLOBAL",1)~ THEN BEGIN MRHellSelfJaheira
		SAY @13
		IF ~~ THEN DO ~SetGlobal("MRSelfishTalk","GLOBAL",2)~ GOTO MRHellSelfTookF
	END

	IF ~Global("MRSelfishTalk","GLOBAL",1) Global("MRHellTookNalia","GLOBAL",1)~ THEN BEGIN MRHellSelfNalia
		SAY @14
		IF ~~ THEN DO ~SetGlobal("MRSelfishTalk","GLOBAL",2)~GOTO MRHellSelfTookF
	END

	IF ~Global("MRSelfishTalk","GLOBAL",1) Global("MRHellTookMinsc","GLOBAL",1)~ THEN BEGIN MRHellSelfMinsc
		SAY @15
		IF ~~ THEN DO ~SetGlobal("MRSelfishTalk","GLOBAL",2)~ GOTO MRHellSelfTookM
	END

	IF ~ Global("MRSelfishTalk","GLOBAL",1) Global("MRHellTookKeldorn","GLOBAL",1)~ THEN BEGIN HellSelfKeldorn
		SAY @16
		IF ~~ THEN DO ~SetGlobal("MRSelfishTalk","GLOBAL",2)~ GOTO MRHellSelfTookM
	END

	IF ~ Global("MRSelfishTalk","GLOBAL",1) Global("MRHellTookNPC","GLOBAL",1)~ THEN BEGIN HS2com
		SAY @17
		IF ~~ THEN DO ~SetGlobal("MRSelfishTalk","GLOBAL",2)~ GOTO MRHellSelfTookC
	END

	/* Aerie and Imoen are friends */

	IF ~~ THEN BEGIN MRHellSelfAerie2
		SAY @18
		IF ~~ THEN REPLY @19 GOTO MRHellSelfAerieChoice1
		IF ~~ THEN REPLY @20 GOTO MRHellSelfAerieChoice2
		IF ~~ THEN REPLY @21 GOTO MRHellSelfAerieChoice1
		IF ~~ THEN REPLY @22 GOTO MRHellSelfAerieChoice2a
		IF ~CheckStatGT(Player1,11,INT)~ THEN REPLY @23 GOTO MRHellSelfAerieChoice3
	END

	IF ~~ THEN BEGIN MRHellSelfAerieChoice1
		SAY @24
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRHellSelfAerieChoice2
		SAY @25
		IF ~~ THEN REPLY @26 GOTO MRHellSelfAerieChoice1
		IF ~~ THEN REPLY @27 GOTO MRHellSelfAerieChoice2a
		IF ~~ THEN REPLY @28 GOTO MRHellSelfAerieChoice1
		IF ~~ THEN REPLY @29 GOTO MRHellSelfAerieChoice2a
		IF ~CheckStatGT(Player1,11,INT)~ THEN REPLY @23 GOTO MRHellSelfAerieChoice3
	END

	IF ~~ THEN BEGIN MRHellSelfAerieChoice2a
		SAY @30
		=
		@31
		=
		@32
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRHellSelfAerieChoice3
		SAY @33
		= @34
		= @32
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRHellSelfTookF
		SAY @35
		=
		@36
                = @37
		=
		@38
		IF ~~ THEN DO ~SetGlobal("MRHellTookCompanion","GLOBAL",2)~ EXIT
	END

	IF ~~ THEN BEGIN MRHellSelfTookM
		SAY @35
		=
		@36
                = @39
		=
		@38
		IF ~~ THEN DO ~SetGlobal("MRHellTookCompanion","GLOBAL",2)~ EXIT
	END

	IF ~~ THEN BEGIN MRHellSelfTookC
		SAY @35
		=
		@40
                = @41
		=
		@38
		IF ~~ THEN DO ~SetGlobal("MRHellTookCompanion","GLOBAL",2)~ EXIT
	END
END
// aerie killed and raised ~~

APPEND IMOEN2J
	IF ~Global("MRSelfishTalk","GLOBAL",3) Global("Player1Selfish","GLOBAL",2)~ THEN BEGIN MRSelfishAerieRaised1
		SAY @42 
		IF ~~ THEN DO ~SetGlobal("MRSelfishTalk","GLOBAL",4)~ EXTERN AERIEJ MRSelfishAerieRaised2
	END
END

CHAIN AERIEJ MRSelfishAerieRaised2
@43 
=
@44
== IMOEN2J
@45
== AERIEJ
@46
== IMOEN2J
@47
=
@48
EXIT

// ~~ aerie Didn't die ~~

APPEND IMOEN2J
	IF ~Global("MRSelfishTalk","GLOBAL",3) Global("Player1Selfish","GLOBAL",1)~ THEN BEGIN MRSelfishAerieNotDead
	SAY @42
	IF ~~ THEN DO ~SetGlobal("MRSelfishTalk","GLOBAL",4)~ EXTERN AERIEJ MRSelfishAerieNotDead2
	END
END

CHAIN AERIEJ MRSelfishAerieNotDead2
@43
= @49
= @50
== IMOEN2J @51
== AERIEJ @52
= @53
== IMOEN2J @54
== AERIEJ @55
== IMOEN2J @56
== IMOEN2J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @57
== IMOEN2J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @58
== AERIEJ IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @59
== AERIEJ IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @60
== IMOEN2J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @61
== AERIEJ IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @59
== IMOEN2J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @62
EXIT





