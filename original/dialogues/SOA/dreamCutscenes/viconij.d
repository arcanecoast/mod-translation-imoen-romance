APPEND VICONIJ              //// None of these files were updated
IF ~Global("MRVicBanterFire","GLOBAL", 2)~ MRDreamComment
 SAY @0
 ++ @1 DO ~SetGlobal("MRDreamRomanceComment","GLOBAL",1)SetGlobal("MRVicBanterFire","GLOBAL", 3)~ + MRDreamComVic2
 ++ @2 DO ~SetGlobal("MRDreamRomanceComment","GLOBAL",1)SetGlobal("MRVicBanterFire","GLOBAL", 3)~ + MRDreamComVicPreEnd
END
END

// ***Viconia***

APPEND VICONIJ

IF ~~ MRDreamComVicPreEnd
SAY @3
IF ~~ THEN EXIT
END

IF ~~ MRDreamComVic2
 SAY @4
 ++ @5 + MRDreamComVicSex1
 ++ @6 + MRDreamComVicSex2
 ++ @7 + MRDreamComVicShare
 ++ @8 + MRDreamComVicRight
 ++ @9 + MRDreamComVicBitch
END

IF ~~ MRDreamComVicRight
 SAY @10
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComVicBitch
 SAY @11
 =
 @12
 IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ MRDreamComVicSex1
 SAY @13
 =
 @14
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComVicSex2
 SAY @13
 =
 @15
 ++ @16 + MRDreamComVicBitch
 ++ @17 + MRDreamComVicKissed
 ++ @18 + MRDreamComVicExplicit
 ++ @19 + MRDreamComVicEnd
END

IF ~~ MRDreamComVicEnd
 SAY @20
 ++ @21 + MRDreamComVicBitch
 ++ @17 + MRDreamComVicKissed
 ++ @22 + MRDreamComVicExplicit
END

IF ~~ MRDreamComVicKissed
 SAY @23
 IF ~~ + MRDreamComVicFlirt1
END

IF ~~ MRDreamComVicExplicit
 SAY @24
 =
 @25
 IF ~~ + MRDreamComVicFlirt1
END

IF ~~ MRDreamComVicFlirt1
 SAY @26
 ++ @27 + MRDreamComVicYes
 IF ~CheckStatGT(Player1,11,WIS)~ THEN REPLY @28 + MRDreamComVicWise
 ++ @29 + MRDreamComVicMaybe
 ++ @30 + MRDreamComVicNo
END

IF ~~ MRDreamComVicNo
 SAY @31
 =
 @32
 =
 @33
 IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ MRDreamComVicMaybe
 SAY @34
 =
 @35
 =
 @36
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComVicYes
 SAY @37
 =
 @38
 =
 @39
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComVicWise
 SAY @40
 =
 @41
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComVicShare
 SAY @42
 =
 @43
 =
 @44
 IF ~~ THEN DO ~RealSetGlobalTimer("MRDreamComTimer","GLOBAL",300)~ EXIT
END

IF ~Global("MRVicBanterFire","GLOBAL",4)~ THEN BEGIN MRDreamComVicContinue
 SAY @45
 ++ @46 DO ~SetGlobal("MRVicBanterFire","GLOBAL",5)~ + MRDreamComVicChange
 ++ @47DO ~SetGlobal("MRVicBanterFire","GLOBAL",5)~ + MRDreamComVic3
 ++ @48 DO ~SetGlobal("MRVicBanterFire","GLOBAL",5)~ + MRDreamComVicDismiss
 ++ @49 DO ~SetGlobal("MRVicBanterFire","GLOBAL",5)~ + MRDreamComVicBitch
END

IF ~~ MRDreamComVicDismiss
 SAY @50
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComVicChange
 SAY @51
 ++ @47 + MRDreamComVic3
 ++ @48 + MRDreamComVicDismiss
 ++ @52 + MRDreamComVicBitch
END

IF ~~ MRDreamComVic3
 SAY @53
 ++ @54 + MRDreamComVicYouth
 ++ @55 + MRDreamComVicKissed2
 ++ @56 + MRDreamComVicExplicit2
 ++ @57 + MRDreamComVicDismiss
END

IF ~~ MRDreamComVicExplicit2
 SAY @58
 =
 @59
 =
 @60
 =
 @61
 IF ~~ + MRDreamComVicFlirt1
END

IF ~~ MRDreamComVicKissed2
 SAY @62
 ++ @63 + MRDreamComVicDeny
 ++ @64 + MRDreamComVicDeny
 ++ @65 + MRDreamComVicConfused
 ++ @66 + MRDreamComVic2Admit
 ++ @67 + MRDreamComVic2Admit
 ++ @68 + MRDreamComVicBitch
END

IF ~~ MRDreamComVicDeny
 SAY @69
 =
 @70
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComVicConfused
 SAY @71
 =
 @72
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComVic2Admit
 SAY @73
 ++ @74 + MRDreamComVicFinal
 ++ @75 + MRDreamComVicFinal
 ++ @76 + MRDreamComVicFinal
END

IF ~~ MRDreamComVicFinal
 SAY @77
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComVicYouth
 SAY @78
 ++ @79 + MRDreamComVicKissed2
 ++ @80 + MRDreamComVicMore
 ++ @81 + MRDreamComVicKissed2
 ++ @82 + MRDreamComVicKissed
 ++ @83 + MRDreamComVicGames
END

IF ~~ MRDreamComVicGames
 SAY @84
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComVicMore
 SAY @85
 ++ @86 + MRDreamComVicKissed2
 ++ @87 + MRDreamComVicKissed
 ++ @88 + MRDreamComVicGames
END
END
