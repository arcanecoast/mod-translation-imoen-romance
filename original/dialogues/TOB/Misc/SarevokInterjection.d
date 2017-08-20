// Here go all of Imoen's interactions with Sarevok.

/*
// Contents:
// Imoen mocks Sarevok's interjection when talking with the barkeep in Amkethran
// Interjection to Sarevok's proposal on becoming Lady/Lord of Murder
// Banter with Sarevok about the piece of soul of Imoen he has
// Extended meeting with Sarevok 
*/




// Imoen mocks Sarevok's interjection when talking with the barkeep in Amkethran

I_C_T SAREV25J 8 IRTIntSarevBar
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok")~ THEN @0
	== SAREV25J IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") ~ THEN @1
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok")~ THEN @2
END


// Interjection to Sarevok's proposal on becoming Lady/Lord of Murder
//this is random banter after you get sarevok's oath
// Sarevok's state 120, BSAREV25

// If You blow Sarevok off right away
I_C_T BSAREV25 121 IRTIntSarevProp1
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3)~ THEN
	 @3
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2")  !Global("ImoenRomanceActive","GLOBAL",3)~ THEN
	 @4
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3)~ THEN
	 @5
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3)~ THEN
	 @6
END

// You tell him that you have other plans
// --> None of your business | Doesn't matter what happens, you won't be involved
I_C_T BSAREV25 131 IRTIntSarevProp2
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @7
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @8
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3)~ THEN
	 @5
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3)~ THEN
	 @6
END


// --> I don't want what you want | Have you learned nothing? | Still want power and wealth? | None of that is important to me |
//  Doesn't mean I'll become evil | I do not seek to rule others:
// ----> I'm not going to discuss it with you <= Same as "None of your business"
// ----> There are better things than power, don't be a fool <= Imoen is satisfied with the outcome and doesn't say anything.
// ----> Goodie-two-shoes responses <= Depends on Sarevok's reaction to your words:
// ------> Sarevok changes
I_C_T BSAREV25 141 IRTIntSarevProp3
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @9
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @10
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @11
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @12
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @13
END

// ------> Sarevok calls you a liar
I_C_T BSAREV25 139 IRTIntSarevProp4
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @14
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @15
END 

// ------> Sarevok is uncertain
I_C_T BSAREV25 138 IRTIntSarevProp5
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @16
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @17
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @18
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @19
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @20
END

// ~~ You plan on assuming your birthright without him ~~
// --> Still think he's not involved <= Same as "none of your business"
// --> You consider his involvement <= Same as "you tell him that it's a possibility" (below)

// ~~ You tell him that it's a possibility ~~
I_C_T BSAREV25 129 IRTIntSarevProp6
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @21
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @22
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @23

// If Imoen isn't romanced
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",2) !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @24
// If Imoen is romanced
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") Global("ImoenRomanceActive","GLOBAL",2) !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @25

	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @26

// If Sarevok doesn't have Imoen's soul
	== BSAREV25 IF ~!Global("ImoenGiveSoul","GLOBAL",2) See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @27
// If Sarevok has Imoen's soul
	== BSAREV25 IF ~Global("ImoenGiveSoul","GLOBAL",2) See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @28

	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Sarevok") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @29
	== BSAREV25 IF ~See("Imoen2") IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN
	 @30 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1)~
END



// Banter with Sarevok about the piece of soul of Imoen he has
//no checks needed because it starts from a vanilla talk that checks if imoen and sarevok are around (didnt bother to find it)
ALTER_TRANS BIMOEN25
BEGIN 6 END
BEGIN 0 END
BEGIN
 "EPILOGUE" ~EXTERN BSAREV25 3Extended~ 
END

CHAIN BSAREV25 3Extended
	@31
	== BSAREV25 IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @32
	== BSAREV25 IF ~!Global("ImoenRomanceActive","GLOBAL",2) GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @33
	== BSAREV25 IF ~!Global("ImoenRomanceActive","GLOBAL",2) !GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @34
END BIMOEN25 8


// Extended meeting with Sarevok 

// Little added option to scold Sarevok for snapping at Imoen
EXTEND_BOTTOM SAREV25A 68
   IF ~IsValidForPartyDialog("Imoen2")~ THEN REPLY @35 + 68a
END

APPEND SAREV25A
IF ~~ THEN 68a
	SAY @36
	IF ~~ THEN DO ~SetGlobal("TalkedToSarevok","GLOBAL",1)~  GOTO 3
END

END

// Sarevok finds out about their relationship
ADD_TRANS_TRIGGER SAREV25A 28 ~!Global("ImoenRomanceActive","GLOBAL",2)~ DO 0

EXTEND_BOTTOM SAREV25A 28
   IF ~Global("ImoenRomanceActive","GLOBAL",2)~ EXTERN IMOEN25J SarevSoul1
END


APPEND IMOEN25J
IF ~~ THEN BEGIN SarevSoul1
	SAY @37
	++ @38 EXTERN SAREV25A SarevSoul2
	++ @39 EXTERN SAREV25A SarevSoul2
	++ @40 EXTERN SAREV25A SarevSoul2
	++ @41 EXTERN SAREV25A SarevSoul2
	++ @42 EXTERN SAREV25A SarevSoul2
END
END

CHAIN SAREV25A SarevSoul2
	@43
	= @44
	== IMOEN25J @45
	== SAREV25A IF ~Gender(Player1,MALE)~ THEN @46
	== SAREV25A IF ~Gender(Player1,FEMALE)~ THEN @47
	== IMOEN25J @48
END SAREV25A SarevSoul3

APPEND SAREV25A
IF ~~ THEN BEGIN SarevSoul3
	SAY @49 
	++ @50 GOTO 29
	++ @51 EXTERN IMOEN25J 4
	++ @52 GOTO 11
	++ @53 GOTO 32
END
END

ADD_TRANS_TRIGGER SAREV25A 29 ~!Global("ImoenRomanceActive","GLOBAL",3)~ DO 0

EXTEND_BOTTOM SAREV25A 29
    IF ~Global("ImoenRomanceActive","GLOBAL",3)~ THEN EXTERN IMOEN25J 3annoyedSarevSoul
END

APPEND IMOEN25J
	IF ~~ THEN BEGIN 3annoyedSarevSoul
		SAY @54
		IF ~~ THEN EXTERN SAREV25A 30
	END
END


ADD_TRANS_TRIGGER IMOEN25J 3 ~!Global("ImoenRomanceActive","GLOBAL",2)~ DO 0

EXTEND_BOTTOM IMOEN25J 3
    IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN EXTERN SAREV25A SarevSoul4
END


APPEND SAREV25A
	IF ~~ THEN BEGIN SarevSoul4
		SAY @55
	IF ~~ THEN GOTO 30
	END
END

// Imoen gives her soul

ADD_TRANS_TRIGGER IMOEN25J 8 ~OR(3) !Global("ImoenGiveSoul","GLOBAL",2) !IsValidForPartyDialog("Aerie") !GlobalGT("IRTImAerTalks","GLOBAL",1)~ DO 0

EXTEND_BOTTOM IMOEN25J 8
    IF ~Global("ImoenGiveSoul","GLOBAL",2) IsValidForPartyDialog("Aerie") GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN EXTERN AERIE25J SarevSoul6
END


APPEND AERIE25J
	IF ~~ THEN BEGIN SarevSoul6
		SAY @56
		IF ~~ THEN EXTERN SAREV25A 42
	END
END

I_C_T IMOEN25J 8 SarevokComment2MR
	== ANOME25J IF ~Global("ImoenGiveSoul","GLOBAL",2) IsValidForPartyDialog("Anomen")~ THEN @57
	== VALYG25J IF ~Global("ImoenGiveSoul","GLOBAL",2) IsValidForPartyDialog("Valygar")~ THEN @58
END


