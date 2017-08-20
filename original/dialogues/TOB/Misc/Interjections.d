// Here go all the small interjections and very brief dialogues scattered throughout the game

/* Table of contents:
// Imoen takes special interest in retrieving Lazarus Librarus's book
// You killed the merchant after leaving Saradush
// Imoen interjects to Peltje in Saradush about finding vampires
// Extending Imoen's interjection to a gnome bhaalspawn in Saradush
// Comments to Farielle, a priestess in Saradush that might give you the key to the sewers
// Viconia's "you should be his/her slave" banter with Imoen needs to be changed to account for the romance
// Haer'Dalis cheesy come-on
// Keldorn and his ring
// Imoen and the vampire tramp/man-whore
// Imoen and the n00b trollop in Saradush
// Imoen interjects to Saemon in Amkethran
// Imoen saves Asana in Amkethran if you do nothing
// Imoen greets Lazarus Librarus in Amkethran
//Extend Volo imoen comment
*/


// Imoen takes special interest in retrieving Lazarus Librarus's book

// 1st Comment - Lazarus

EXTEND_BOTTOM 25SPELL 0
  IF ~InParty("Imoen2") IsValidForPartyDialog("Imoen2") Global("IRTLazGreeting1","GLOBAL",0)~ THEN DO ~SetGlobal("IRTLazGreeting1","GLOBAL",1)~EXTERN IMOEN25J MRLaz1
END

APPEND IMOEN25J
 IF ~~ THEN MRLaz1
	SAY @0
	IF ~Global("lazarus","GLOBAL",0)~ THEN EXTERN 25SPELL 8
	IF ~Global("lazarus","GLOBAL",3)~ THEN EXTERN 25SPELL 1
 END
END


I_C_T2 25SPELL 8 IRTIntLazarus2
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2")~ THEN
	@1
END

I_C_T 25SPELL 13 IRTIntLazarus3
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") !Global("IRTPlayerIsMagicUser","GLOBAL",1)~ THEN @2
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") Global("IRTPlayerIsMagicUser","GLOBAL",1)~ THEN @3
	== 25SPELL IF ~IsValidForPartyDialog("Imoen2")~ THEN @4
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2")~ THEN @5
	== 25SPELL IF ~IsValidForPartyDialog("Imoen2") OR(2) Global("ImoenRomanceActive","GLOBAL",2) GlobalGT("ImoenRomanceActive","GLOBAL",3)~ THEN @6
	== 25SPELL IF ~IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",2) !GlobalGT("ImoenRomanceActive","GLOBAL",3)~ THEN @7
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") !ReputationGT(Player1,6)~ THEN @8
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") ReputationGT(Player1,6)~ THEN @9
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2")~ THEN @10
	== 25SPELL IF ~IsValidForPartyDialog("Imoen2")~ THEN @11
END	

I_C_T 25SPELL 3 IRTIntLazarus4
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2")~ THEN @12
END

// 2nd Comment - Hectan

I_C_T SARTHF1 8 IRTIntHectan1
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2")~ THEN @13
	== SARTHF1 IF ~IsValidForPartyDialog("Imoen2")~ THEN @14
END

// 3rd Comment - Restored book

I_C_T2 25SPELL 17 IRTIntLazarus5
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2")~ THEN @15
	== 25SPELL IF ~IsValidForPartyDialog("Imoen2")~ THEN @16 // Lazarus is meant to say this
END


// You killed the merchant after leaving Saradush, North Forest guy
//  Triggers after combat is over

ADD_TRANS_ACTION HGKAR01
BEGIN 10 END
BEGIN 0 END
~SetGlobal("IRTKilledForestMerchant","GLOBAL",1)~ // Sets a global right as the merchant dies.

APPEND IMOEN25J
IF WEIGHT #0 ~Global("IRTKilledForestMerchant","GLOBAL",2)~ THEN Mer1
	SAY @17
	IF ~~ THEN DO ~SetGlobal("IRTKilledForestMerchant","GLOBAL",3) IncrementGlobal("IRTLoveMeter","GLOBAL",-2)~ + Mer2
END

IF ~~ THEN Mer2
	SAY @18
	++ @19 + Mer3
	++ @20 + Mer4
	++ @21 + Mer5
	++ @22 + Mer6
	++ @23 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-1)~ + Mer7
END

IF ~~ THEN Mer3
	SAY @24
	= @25
	= @26
	IF ~~ THEN EXIT
END

IF ~~ THEN Mer4
	SAY @27
	IF ~~ THEN EXIT
END

IF ~~ THEN Mer5
	SAY @28
	= @29
	IF ~~ THEN EXIT
END

IF ~~ THEN Mer6
	SAY @30
	IF ~~ THEN EXIT
END

IF ~~ THEN Mer7
	SAY @31
	= @32
	IF ~~ THEN EXIT
END
END

// Imoen interjects to Peltje in Saradush about finding vampires

I_C_T SARPEL01 5 IRTIntPeltje
== IMOEN25J IF ~InParty("Imoen2")~ THEN @33
END


// Replacing Imoen's interjection to a gnome bhaalspawn in Saradush

ADD_TRANS_TRIGGER IMOEN25J 12 ~Global("ImoenRomanceActive","GLOBAL",0)~ DO 0 1

EXTEND_BOTTOM IMOEN25J 12
  IF ~!Global("ImoenRomanceActive","GLOBAL",0)~ THEN REPLY @34 GOTO 12Ext
		IF ~!Global("ImoenRomanceActive","GLOBAL",0)~ THEN REPLY @35 EXTERN SARBHA02 12ExtEnd
		IF ~!Global("ImoenRomanceActive","GLOBAL",0)~ THEN REPLY @36 EXTERN SARBHA02 12ExtEnd
END


CHAIN IMOEN25J 12Ext
	@37
	= @38
END SARBHA02 12ExtEnd

CHAIN SARBHA02 12ExtEnd
	@39 DO ~RunAwayFrom(LastTalkedToBy,60)~
	== IMOEN25J @40
EXIT

// Comments to Farielle, a priestess in Saradush that might give you the key to the sewers

I_C_T2 SARTEM01 21 IRTIntFar
	== IMOEN25J IF ~InParty("Imoen2") Range("Imoen2",11)~ THEN @41
	== SARTEM01 IF ~InParty("Imoen2") Range("Imoen2",11)~ THEN @42
	== IMOEN25J IF ~InParty("Imoen2") Range("Imoen2",11)~ THEN @43
END



I_C_T SARTEM01 22 Farielle
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") IsValidForPartyDialog("Edwin")~ THEN @44
	== EDWIN25J IF ~IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Imoen2")~ THEN @45
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") IsValidForPartyDialog("Edwin")~ THEN @46
	== SARTEM01 IF ~IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Imoen2")~ THEN @47
	== EDWIN25J IF ~IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Imoen2")~ THEN @48
END

I_C_T SARTEM01 17 IRTIntFar2
	== IMOEN25J IF ~IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Imoen2")~ THEN @49
	== EDWIN25J IF ~IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Imoen2")~ THEN @45
	== IMOEN25J IF ~IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Imoen2")~ THEN @46
	== SARTEM01 IF ~IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Imoen2")~ THEN @47
	== EDWIN25J IF ~IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Imoen2")~ THEN @48
END


// Viconia's "you should be his/her slave" banter with Imoen needs to be changed to account for the romance
ADD_TRANS_TRIGGER BVICON25 26 ~OR(3) Global("ImoenRomanceActive","GLOBAL",1) Global("ImoenRomanceActive","GLOBAL",0) Global("ImoenRomanceActive","GLOBAL",4) !Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1)~ DO 0

EXTEND_BOTTOM BVICON25 26
    IF ~Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1)~ THEN EXTERN BIMOEN25 VicBan1
	IF ~Global("ImoenRomanceActive","GLOBAL",3) !Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1)~ THEN EXTERN BIMOEN25 VicBan2
	IF ~Global("ImoenRomanceActive","GLOBAL",5) !Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1)~ THEN EXTERN BIMOEN25 VicBan3
	IF ~OR(2) Global("IRTQuarrelDue","GLOBAL",1) Global("IRTCooldownDue","GLOBAL",1)~ THEN EXTERN BIMOEN25 NotInTheMood
END

CHAIN BIMOEN25 NotInTheMood
	@50
	== BVICON25 @51
	== BIMOEN25 @52
	== BVICON25 @53
	== BIMOEN25 @54
EXIT

CHAIN BIMOEN25 VicBan1
	@55
	== BVICON25 @56
	== BIMOEN25 @57
	== BVICON25 @58
		== BIMOEN25 @59
END BIMOEN25 108

CHAIN BIMOEN25 VicBan2
	@60
	== BVICON25 @61
	== BIMOEN25 @62
	== BVICON25 @63
	== BIMOEN25 @64
EXIT

CHAIN BIMOEN25 VicBan3
	@65
	== BVICON25 @66
	== BIMOEN25 @67
	= @68
	== BVICON25 @69
END BIMOEN25 109

// Haer'Dalis cheesy come-on
ADD_TRANS_TRIGGER BHAERD25 28 ~!Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1)~ DO 0

EXTEND_BOTTOM BHAERD25 28
   IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN EXTERN BIMOEN25 HaerBanExt1
	  IF ~!Global("ImoenRomanceActive","GLOBAL",2) OR(2) Global("IRTQuarrelDue","GLOBAL",1) Global("IRTCooldownDue","GLOBAL",1)~ THEN EXTERN BIMOEN25 HaerBanExt2
END


CHAIN BIMOEN25 HaerBanExt1
	@70
	== BHAERD25 @71
	== BIMOEN25 @72
	== BHAERD25 @73
	== BIMOEN25 @74
	== BHAERD25 @75
	== BIMOEN25 @76
END BHAERD25 32

CHAIN BIMOEN25 HaerBanExt2
	@77
	== BHAERD25 @78
EXIT

// Imoen mentions in a banter with Cernd that she was 8 years old and stole a watch from Winthrop, but the official timeline says she arrived at Candlekeep when she was 10.
// Here it's changed to "wee girl"

REPLACE BIMOEN25
IF ~~ THEN BEGIN 40
	SAY @79
	IF ~~ THEN EXTERN BCERND 35
END
END

// Keldorn and his ring
ADD_TRANS_TRIGGER BKELDO25 39 ~!Global("ImoenRomanceActive","GLOBAL",2)~ DO 0

EXTEND_BOTTOM BKELDO25 39
   IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN EXTERN ~BIMOEN25~ 39Keldorn
END 

CHAIN BIMOEN25 39Keldorn
	@80
	== BKELDO25 @81
	== BIMOEN25 @82
	== BKELDO25 @83
	== BIMOEN25 @84
	== BKELDO25 @85
	== BIMOEN25 @86
EXIT


// Imoen and the vampire tramp/man-whore in Saradush

ADD_TRANS_TRIGGER SARPROVF 0 ~!Global("ImoenRomanceActive","GLOBAL",2)~ DO 0
ADD_TRANS_TRIGGER SARPROVM 0 ~!Global("ImoenRomanceActive","GLOBAL",2)~ DO 0


EXTEND_BOTTOM SARPROVF 0
	+ ~IsValidForPartyDialog("Imoen2") Global("ImoenRomanceActive","GLOBAL",2) PartyGoldGT(49) !Global("ToldVampires","GLOBAL",1)~ + @87 EXTERN IMOEN25J spvf1
END
EXTEND_BOTTOM SARPROVM 0
	+ ~IsValidForPartyDialog("Imoen2") Global("ImoenRomanceActive","GLOBAL",2) PartyGoldGT(49) !Global("ToldVampires","GLOBAL",1)~ + @87 EXTERN IMOEN25J spvf2
END

APPEND IMOEN25J
IF ~~ THEN spvf1
	SAY @88
	IF ~~ THEN EXTERN SARPROVF 1
END

IF ~~ THEN spvf2
	SAY @89
	IF ~~ THEN EXTERN SARPROVM 1
END
END

// Imoen and the n00b trollop in Saradush


ADD_TRANS_TRIGGER SARPRO01 11 ~!Global("ImoenRomanceActive","GLOBAL",2)~ DO 0

EXTEND_BOTTOM SARPRO01 11
	+ ~IsValidForPartyDialog("Imoen2") Global("ImoenRomanceActive","GLOBAL",2)~ + @90 EXTERN IMOEN25J sarpro1
END

APPEND IMOEN25J
IF ~~ THEN sarpro1
  SAY @91
	= @92
	IF ~~ THEN EXTERN SARPRO01 3
END
END

// Imoen interjects to Saemon in Amkethran

I_C_T amsaemon 4 IRTIntSae
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2") See("Imoen2")~ THEN @93
	== AMSAEMON IF ~IsValidForPartyDialog("Imoen2") See("Imoen2")~ THEN @94
END

// Imoen saves Asana in Amkethran if you do nothing
//this is a special case we DONT WANT THE NORMAL DO's to happen as it contains cutscenes etc
INTERJECT AMMERC04 2 IRTAsanaInt
	== IMOEN25J IF ~IsValidForPartyDialog("Imoen2")~ THEN @95
END AMMERC03 AsanInter1

CHAIN AMMERC03 AsanInter1
	@96
	== IMOEN25J @97
	== AMMERC04 @98
	== AMMERC03 @99
	== IMOEN25J @100
	== AMMERC04 @101
	== IMOEN25J @102
	== IMOEN25J @103
	== AMMERC03 @104
	== AMMERC03 @105 DO ~ActionOverride("ammerc04",EscapeArea()) EscapeArea()~
	== AMASANA @106 DO ~SetGlobal("IRTImoenHero","GLOBAL",1) SetGlobal("AsanaPlot","GLOBAL",3) EscapeArea() ActionOverride("Imoen2",StartDialog("IMOEN25J",Player1))~ 
EXIT

APPEND IMOEN25J
IF WEIGHT #1 ~Global("IRTImoenHero","GLOBAL",1)~ THEN ImoenHero
  SAY @107
  ++ @108 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-10) SetGlobal("IRTImoenHero","GLOBAL",2)~ + IH4
  ++ @109 DO ~SetGlobal("IRTImoenHero","GLOBAL",2)~ + IH1
  ++ @110 DO ~SetGlobal("IRTImoenHero","GLOBAL",2)~ + IH3
  ++ @111 DO ~SetGlobal("IRTImoenHero","GLOBAL",2)~ EXIT
  ++ @112 DO ~SetGlobal("IRTImoenHero","GLOBAL",2)~ + IH1
  ++ @113 DO ~SetGlobal("IRTImoenHero","GLOBAL",2)~ + IH1
END

IF ~~ THEN IH1
  SAY @114
  IF ~~ THEN EXIT
END

IF ~~ THEN IH3
  SAY @115
  IF ~~ THEN EXIT
END

IF ~~ THEN IH4
  SAY @116
  IF ~~ THEN EXIT
END
END

// Imoen greets Lazarus Librarus in Amkethran

INTERJECT 25SPELL 5 IRTIntLazAmk
	== IMOEN25J IF ~AreaCheck("AR5502") IsValidForPartyDialog("Imoen2")~ THEN @117
END 25SPELL 6


//Volo comment on imoen
ADD_TRANS_TRIGGER IMOEN25J 32 ~!Global("ImoenRomanceActive","GLOBAL",2)~ DO 0

EXTEND_BOTTOM IMOEN25J 32
   IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN EXTERN SARVOLO Imvolo
END

CHAIN 
IF ~~ THEN SARVOLO Imvolo
@118
==IMOEN25J @119
==SARVOLO @120
==IMOEN25J @121
==SARVOLO @122
==IMOEN25J @15
EXIT