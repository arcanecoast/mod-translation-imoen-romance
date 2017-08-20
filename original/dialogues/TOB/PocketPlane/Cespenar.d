/* Contents:
// Meeting
// Imoen initiating dialogue with Cespenar
*/ 
ADD_TRANS_TRIGGER BOTSMITH 146 ~OR(4) !InParty("Imoen2") !See("Imoen2") StateCheck("Imoen2",CD_STATE_NOTVALID) !Global("IRTImIntroCesp","GLOBAL",0)~ 147 DO 0 1 2

EXTEND_BOTTOM BOTSMITH 146
 IF ~InParty("Imoen2") See("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) Global("IRTImIntroCesp","GLOBAL",0)~ THEN EXTERN IMOEN25J ImCesp1
END

EXTEND_BOTTOM BOTSMITH 147
 IF ~InParty("Imoen2") See("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) Global("IRTImIntroCesp","GLOBAL",0)~ THEN EXTERN IMOEN25J ImCesp1
END


ADD_TRANS_TRIGGER BOTSMITH 152 ~ OR(2)!Name("Imoen2",LastTalkedToBy) Global("TalkedToBotsmith","GLOBAL",0)~ DO 0


CHAIN IMOEN25J ImCesp1
	@0 DO ~SetGlobal("IRTImIntroCesp","GLOBAL",1)~
	== BOTSMITH @1
	== IMOEN25J @2
	== BOTSMITH @3
	== IMOEN25J @4
	== BOTSMITH @5
END BOTSMITH 2


// Imoen initiating dialogue with Cespenar
// Verify item name is correct

CHAIN IF WEIGHT #-1 ~IsGabber("Imoen2") GlobalGT("TalkedToBotsmith","GLOBAL",0) PartyHasItem("MRIMRIN1") Global("IRTCespenarBracelet","GLOBAL",0)~ THEN BOTSMITH ImCespBra1
	@6
	== IMOEN25J @7 DO ~SetGlobal("IRTCespenarBracelet","GLOBAL",1)~
	== BOTSMITH @8
	== IMOEN25J @9
	== BOTSMITH @10
	== IMOEN25J @11
	== BOTSMITH @12
	== IMOEN25J @13
	== IMOEN25J @14
	== BOTSMITH @15
	== IMOEN25J @16
EXIT

CHAIN IF WEIGHT #-1 ~IsGabber("Imoen2") RandomNum(5,1) GlobalGT("TalkedToBotsmith","GLOBAL",0)~ THEN BOTSMITH ImCesp2
	@17
	== IMOEN25J @18
	== BOTSMITH @19
	== IMOEN25J @20
	== BOTSMITH @21
	== IMOEN25J @22 DO ~ActionOverride("BOTSMITH",RunAwayFrom("Imoen2",45))~
EXIT

CHAIN IF WEIGHT #-1 ~IsGabber("Imoen2") RandomNum(5,2) GlobalGT("TalkedToBotsmith","GLOBAL",0)~ THEN BOTSMITH ImCesp2
	@23
	== IMOEN25J @24
	== BOTSMITH @25
	== IMOEN25J @26 DO ~ActionOverride("BOTSMITH",RunAwayFrom("Imoen2",45))~
EXIT

APPEND BOTSMITH
IF WEIGHT #-1 ~IsGabber("Imoen2") RandomNum(5,3) GlobalGT("TalkedToBotsmith","GLOBAL",0)~ THEN BEGIN ImCesp4
	SAY @27
	IF ~RandomNum(3,1)~ THEN EXTERN IMOEN25J ImCesp4cha1
	IF ~RandomNum(3,2)~ THEN EXTERN IMOEN25J ImCesp4cha2
	IF ~RandomNum(3,3) Global("IRTwa2robe","GLOBAL",0) PartyHasItem("WA2ROBE")~ THEN DO ~SetGlobal("IRTwa2robe","GLOBAL",1)~ EXTERN IMOEN25J ImCesp4cha5
	IF ~RandomNum(3,3) OR(2) !PartyHasItem("WA2ROBE") Global("IRTwa2robe","GLOBAL",1)~ THEN EXTERN IMOEN25J ImCesp4cha6
END
END

CHAIN IMOEN25J ImCesp4cha1
	@28
	== BOTSMITH @29
END IMOEN25J ImCesp4chaex1

APPEND IMOEN25J
IF ~~ THEN BEGIN ImCesp4chaex1
	SAY @30
	IF ~~ THEN DO ~ActionOverride("BOTSMITH",RunAwayFrom("Imoen2",45))~ EXIT
END
END

CHAIN IMOEN25J ImCesp4cha2
	@31
	== BOTSMITH @29
END IMOEN25J ImCesp4chaex1

CHAIN IMOEN25J ImCesp4cha5
	@32
	== BOTSMITH @29
	== IMOEN25J @33
	= @34 DO ~ActionOverride("BOTSMITH",RunAwayFrom("Imoen2",45))~
EXIT

CHAIN IMOEN25J ImCesp4cha6
	@35
	== BOTSMITH @29
END IMOEN25J ImCesp4chaex1

CHAIN IF WEIGHT #-1 ~IsGabber("Imoen2") RandomNum(5,4) GlobalGT("TalkedToBotsmith","GLOBAL",0)~ THEN BOTSMITH ImCesp5
	@36
	== IMOEN25J @37
	== BOTSMITH @38
	== IMOEN25J @39 DO ~ActionOverride("BOTSMITH",RunAwayFrom("Imoen2",45))~
EXIT

CHAIN IF WEIGHT #-1 ~IsGabber("Imoen2") RandomNum(5,5) GlobalGT("TalkedToBotsmith","GLOBAL",0)~ THEN BOTSMITH ImCesp6
	@40
	== IMOEN25J @41
	== BOTSMITH @42
	== IMOEN25J @43
	== BOTSMITH @44 DO ~GiveGoldForce(3) RunAwayFrom("Imoen2",45)~
EXIT
