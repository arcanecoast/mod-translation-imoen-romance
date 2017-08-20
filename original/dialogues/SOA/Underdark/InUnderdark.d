//*** Imprisonment ***//       //// This file was overlooked and the proofread was never applied.


/* Should trigger upon activating ALL of the windows on the Imprisonment device in the Underdark and after killing all the summoned enemies */
ADD_TRANS_ACTION UDTRAP05
BEGIN 0 END
BEGIN 0 1 END
~SetGlobal("MRUdTrap5Released","AR2100",1)~

APPEND IMOEN2J

	IF ~Global("MRSphere","AR2100",1)~ THEN BEGIN MRImprisonedSphere
		SAY @0
			++ @1 DO ~SetGlobal("MRSphere","AR2100",2)~ GOTO MRImprisonedSphereWhat
			++ @2 DO ~SetGlobal("MRSphere","AR2100",2)~ GOTO MRImprisonedSphereWhat
			++ @3 DO ~SetGlobal("MRSphere","AR2100",2)~ GOTO MRImprisonedSphereNice
			++ @4 DO ~SetGlobal("MRSphere","AR2100",2)~ GOTO MRImprisonedSphereEmp
	END

	IF ~~ THEN BEGIN MRImprisonedSphereWhat
		SAY @5
		=
		@6
		++ @7 GOTO MRImprisonedSphereEmp
		++ @8 GOTO MRImprisonedSphereSpell
		++ @9 DO ~SetGlobal("MRCastImprisonment","GLOBAL",1)~ GOTO MRImprisonedSphereNice
	END

	IF ~~ THEN BEGIN MRImprisonedSphereSpell
		SAY @10
		=
		@11
		++ @7 GOTO MRImprisonedSphereEmp
		++ @3 GOTO MRImprisonedSphereNice
		IF ~CheckStatGT(Player1,15,INT) IsValidForPartyDialog("Cernd") PartyGoldGT("10000") PartyGoldLT("15000")~ THEN REPLY @12 GOTO MRImprisonedSphereEE
	END

	IF ~~ THEN BEGIN MRImprisonedSphereEE
		SAY @13
		=
		@14


		 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRImprisonedSphereNice
		SAY @15
		IF ~~ THEN GOTO MRImprisonedSphereEnd
	END

	IF ~~ THEN BEGIN MRImprisonedSphereEnd
		SAY @16
		 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRImprisonedSphereEmp
		SAY @17
		=
		@18
		 IF ~~ THEN EXIT
	END


	//*** Attacking Adalon ***//

	/* Should trigger immediately if Imoen is Valid for Party Dialog and Adalon (UDSILVER?) is dead */

	IF ~Global("MRAdalonDead","AR2102",1)~ THEN BEGIN MRKilledAdalon
		SAY @19
			++ @20 DO ~SetGlobal("MRAdalonDead","AR2102",2)~ GOTO MRKilledAdalon2
			++ @21 DO ~SetGlobal("MRAdalonDead","AR2102",2)~ GOTO MRKilledAdalon2
			++ @22 DO ~SetGlobal("MRAdalonDead","AR2102",2)~ GOTO MRKilledAdalon2
	END

	IF ~~ THEN BEGIN MRKilledAdalon2
		SAY @23
		=
		@24
		=
		@25
			++ @26 + MRKilledAdalon3
			++ @27 + MRKilledAdalon5
			++ @20 GOTO MRKilledAdalon3
			++ @28 + MRKilledAdalon4
	END

	IF ~~ THEN BEGIN MRKilledAdalon3
		SAY @29
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRKilledAdalon4
		SAY @30
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRKilledAdalon5
		SAY @29
		IF ~~ THEN EXIT
	END


	// *** Drow-skin *** //
	IF ~Global("MRDrowSkin","AR2100",1)~ THEN BEGIN MRDrowSkin
		SAY @31
		IF ~~ THEN DO ~SetGlobal("MRDrowSkin","AR2100",2)~ GOTO MRDrowSkin2
	END

	IF ~~ THEN BEGIN MRDrowSkin2
		SAY @32
		IF ~OR(2) PartyHasItem("Misc3E") PartyHasItem("C2KIT")~ THEN GOTO MRDrowSpider
		IF ~!PartyHasItem("Misc3E") !PartyHasItem("C2KIT")~ THEN GOTO MRDrowSkin3
	END


	IF ~~ THEN BEGIN MRDrowSpider
		SAY @33
		IF ~PartyHasItem("MISC3E")~ THEN REPLY @34 GOTO MRDrowSpider2
		IF ~PartyHasItem("C2KIT")~ THEN REPLY @35 GOTO MRDrowSpider2
		IF ~!PartyHasItem("MISC3E") !PartyHasItem("C2KIT")~ THEN GOTO MRDrowSkin3

	END

	IF ~~ THEN BEGIN MRDrowSpider2
		SAY @36

		IF ~~ THEN GOTO MRDrowSkin3
	END
END

CHAIN IMOEN2J MRDrowSkin3
	@37
	== IMOEN2J IF ~IsValidForPartyDialog("Aerie")~ THEN
	@38
	== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN
	@39
	== IMOEN2J IF ~IsValidForPartyDialog("Mazzy")~ THEN


	@40
	== MAZZYJ IF ~IsValidForPartyDialog("Mazzy")~ THEN
	@41
	== IMOEN2J IF ~IsValidForPartyDialog("Korgan")~ THEN
	@42
	== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN
	@43
	== IMOEN2J IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN
	@44
	== EDWINJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN
	@45
	== IMOEN2J IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN
	@46
	== EDWINJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN
	@47
	== IMOEN2J IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN
	@48
	== EDWINJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN
	@49
	== IMOEN2J IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",MALE) GlobalTimerExpired("EdwinScroll","GLOBAL")~ THEN
	@50
	== EDWINJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",MALE) GlobalTimerExpired("EdwinScroll","GLOBAL")~ THEN
	@51
	== IMOEN2J IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",MALE) GlobalTimerExpired("EdwinScroll","GLOBAL")~ THEN
	@52
	== IMOEN2J @53
EXIT