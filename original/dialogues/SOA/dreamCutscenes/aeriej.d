APPEND AERIEJ                               //// None of these files were updated
IF ~Global("MRAerieBanterFire","GLOBAL", 2)~
MRDreamComment
 SAY @0
 = @1
 ++ @2 DO ~SetGlobal("MRDreamRomanceComment","GLOBAL",1) SetGlobal("MRAerieBanterFire","GLOBAL",3)~ + MRDreamComAer
 ++ @3 DO ~SetGlobal("MRDreamRomanceComment","GLOBAL",1) SetGlobal("MRAerieBanterFire","GLOBAL",3)~ + MRDreamComAer2
END
END

// ***Aerie***

APPEND AERIEJ

IF ~~ MRDreamComAer
 SAY @4
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComAer2
 SAY @5
 =
 @6
 ++ @7 + MRDreamComAer3
 ++ @8 + MRDreamComAer3
 ++ @9 + MRDreamComAer3
 ++ @10 + MRDreamComAer
END

IF ~~ MRDreamComAer3
 SAY @11
 ++ @12 + MRDreamComAerYouth
 ++ @13 + MRDreamComAerKissed
 ++ @14 + MRDreamComAerBlood
 ++ @15 + MRDreamComAerPerv
 ++ @16 + MRDreamComAer
END

IF ~~ MRDreamComAerPerv
 SAY @17
 =
 @18
 ++ @19 + MRDreamComAerYouth
 ++ @20 + MRDreamComAerKissed
 ++ @21 + MRDreamComAerDunno
 ++ @22 + MRDreamComAerIntro
 + ~InParty("Viconia")~ + @23 + MRDreamComAerVic
 + ~!InParty("Viconia")~ + @24 + MRDreamComAerVic2
END

IF ~~ MRDreamComAerBlood
 SAY @25
 =
 @26
 ++ @19 + MRDreamComAerYouth
 ++ @27 + MRDreamComAerKissed
 ++ @21 + MRDreamComAerDunno
 ++ @28 + MRDreamComAerIntro
 IF ~InParty("Viconia")~ THEN REPLY @29 + MRDreamComAerVic
 IF ~!InParty("Viconia")~ THEN REPLY @29 + MRDreamComAerVic2
END

IF ~~ MRDreamComAerVic
 SAY @30
 =
 @31
 =
 @32
 IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ MRDreamComAerVic2
 SAY @33
 =
 @34
 =
 @32
 IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ MRDreamComAerIntro
 SAY @35
 =
 @36
 =
 @32
 IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ MRDreamComAerDunno
 SAY @37
 =
 @38
 =
 @32
 IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ MRDreamComAerYouth
 SAY @39
 =
 @40
 ++ @41 + MRDreamComAerKissed
 ++ @42 + MRDreamComAerYouth2
 ++ @43 + MRDreamComAerSex2
 ++ @44 + MRDreamComAerBlood2
 ++ @45 + MRDreamComAerPreEnd
 ++ @46 + MRDreamComAerCruelEnd
END

IF ~~ MRDreamComAerCruelEnd
 SAY @47
 =
 @48
 =
 @49
 IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ MRDreamComAerPreEnd
 SAY @50
 ++ @51 + MRDreamComAerKissed
 ++ @52 + MRDreamComAerYouth2
 ++ @43 + MRDreamComAerSex2
 ++ @44 + MRDreamComAerBlood2
 ++ @53 + MRDreamComAer
END

IF ~~ MRDreamComAerBlood2
 SAY @54
 =
 @55
 ++ @56 + MRDreamComAerStop
 ++ @21 + MRDreamComAerDunno
 ++ @57 + MRDreamComAerIntro
 IF ~InParty("Viconia")~ THEN REPLY @29 + MRDreamComAerVic
 IF ~!InParty("Viconia")~ THEN REPLY @29 + MRDreamComAerVic2
END

IF ~~ MRDreamComAerSex2
 SAY @54
 =
 @55
 ++ @56 + MRDreamComAerStop
 ++ @21 + MRDreamComAerDunno
 ++ @22 + MRDreamComAerIntro
 IF ~InParty("Viconia")~ THEN REPLY @58 + MRDreamComAerVic
 IF ~!InParty("Viconia")~ THEN REPLY @58 + MRDreamComAerVic2
END

IF ~~ MRDreamComAerStop
 SAY @59
 =
 @60
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComAerYouth2
 SAY @61
 =
 @62
 =
 @63
 ++ @64 + MRDreamComAerPreEnd2
 ++ @65 + MRDreamComAerKissed
 ++ @66 + MRDreamComAerYouth3
 ++ @67 + MRDreamComAerSex2
 ++ @68 + MRDreamComAerBlood2
 ++ @69 + MRDreamComAerCruelEnd
END

IF ~~ MRDreamComAerYouth3
 SAY @70
 =
 @71
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComAerPreEnd2
 SAY @72
 =
 @73
 ++ @74 + MRDreamComAerKissed
 ++ @75 + MRDreamComAer
 ++ @67 + MRDreamComAerSex2
 ++ @76 + MRDreamComAerBlood2
END

IF ~~ MRDreamComAerKissed
 SAY @77
 =
 @78
 =
 @79
 ++ @80 + MRDreamComAerDeny
 ++ @81 + MRDreamComAerMaybe
 ++ @82 + MRDreamComAerMaybe
 ++ @83 + MRDreamComAerAdmit
 ++ @84 + MRDreamComAerCruelEnd2
END

IF ~~ MRDreamComAerCruelEnd2
 SAY @85
 =
 @86
 =
 @87
 IF ~~ THEN DO ~ReputationInc(-2) ActionOverride(Player1,ApplySpellRES("SPMRACNE",Player1))
 LeaveParty()
 EscapeArea()~
EXIT
END

IF ~~ MRDreamComAerAdmit
 SAY @88
 =
 @89
 IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ MRDreamComAerMaybe
 SAY @90
 =
 @91
 =
 @92
IF ~~ THEN EXIT
END

IF ~~ MRDreamComAerDeny
 SAY @93
 =
 @94
 IF ~~ THEN EXIT
END
END