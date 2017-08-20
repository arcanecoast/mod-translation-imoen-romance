 APPEND ANOMENJ     //// None of these files were updated

IF ~Global("MRAnomenBanterFire","GLOBAL", 2)~
MRDreamComment
 SAY @0
 ++ @1 DO ~SetGlobal("MRDreamRomanceComment","GLOBAL",1)SetGlobal("MRAnomenBanterFire","GLOBAL", 3)~ + MRDreamComAno2
 ++ @2 DO ~SetGlobal("MRDreamRomanceComment","GLOBAL",1)SetGlobal("MRAnomenBanterFire","GLOBAL", 3)~ + MRDreamComAno
END


IF ~~ MRDreamComAno
 SAY @3
 IF ~~ THEN EXIT
END

END

CHAIN ANOMENJ MRDreamComAno2
 @4
 == ANOMENJ IF ~Global("AnomenDecide","GLOBAL",0)~ THEN @5
 == ANOMENJ IF ~!Global("AnomenDecide","GLOBAL",0)~ THEN @6
END
 ++ @7 + MRDreamComAno
 ++ @8 + MRDreamComAno3
 ++ @9 + MRDreamComAno3


APPEND ANOMENJ

IF ~~ MRDreamComAno3
 SAY @10
 ++ @11 + MRDreamComAno
 ++ @12 + MRDreamComAno4
 ++ @13 + MRDreamComAno5
 ++ @14 + MRDreamComAnoDirty
END

END

CHAIN ANOMENJ MRDreamComAnoDirty
 @15
 == ANOMENJ IF ~!ReputationGT(Player1,8)~ THEN @16
 == ANOMENJ IF ~ReputationGT(Player1,8) ReputationLT(Player1,13) Gender(Player1,MALE)~ THEN @17
 == ANOMENJ IF ~ReputationGT(Player1,8) ReputationLT(Player1,13) Gender(Player1,FEMALE)~ THEN @18
 == ANOMENJ IF ~ReputationGT(Player1,13)~ THEN @19
END
 ++ @20 EXTERN ANOMENJ MRDreamComAnoNext
 ++ @21 EXTERN ANOMENJ MRDreamComAnoDirty2
 IF ~!ReputationGT(Player1,8)~ EXTERN AnomenJ MRDreamComAnoAttack


APPEND ANOMENJ

IF ~~ MRDreamComAnoDirty2
SAY @22
IF ~~ + MRDreamComAnoAttack
END

IF ~~ MRDreamComAnoAttack
SAY @23
IF ~~ THEN DO ~SetGlobal("AnomenJoined","LOCALS",0) LeaveParty() Enemy() Attack(Player1)~ EXIT
END

IF ~~ MRDreamComAnoNext
 SAY @24
 =
 @25 
 ++ @26 + MRDreamComAno
 ++ @27 + MRDreamComAno4
 ++ @28 + MRDreamComAno5
END

IF ~~ MRDreamComAno4
 SAY @29
 IF ~Global("AnomenIsKnight","GLOBAL",1)~ + MRDreamComAno4_1
 IF ~!Global("AnomenIsKnight","GLOBAL",1)~ + MRDreamComAno4_2
END

IF ~~ MRDreamComAno4_1
 SAY @30
 IF ~~ + MRDreamComAno4_3
END

IF ~~ MRDreamComAno4_2
 SAY @31
 IF ~~ + MRDreamComAno4_3
END

IF ~~ MRDreamComAno4_3
 SAY @32
 = @33
 ++ @34 + MRDreamComAno
 ++ @35 + MRDreamComAno45
 + ~Global("AnomenRomanceActive","GLOBAL",2)~ + @36 + MRDreamComAno6_3
 + ~!Global("AnomenRomanceActive", "GLOBAL",2) Global("AnomenIsKnight", "GLOBAL",1)~ + @36 + MRDreamComAno6_1
 + ~!Global("AnomenRomanceActive", "GLOBAL",2) !Global("AnomenIsKnight","GLOBAL",1)~ + @36 + MRDreamComAno6_2
END

IF ~~ MRDreamComAno45
 SAY @37
 ++ @38 + MRDreamComAno5
 ++ @39 + MRDreamComAnoEnd1
 + ~Global("AnomenRomanceActive","GLOBAL",2)~ + @36 + MRDreamComAno6_3
 + ~!Global("AnomenRomanceActive", "GLOBAL",2) Global("AnomenIsKnight", "GLOBAL",1)~ + @36 + MRDreamComAno6_1
 + ~!Global("AnomenRomanceActive", "GLOBAL",2) !Global("AnomenIsKnight","GLOBAL",1)~ + @36 + MRDreamComAno6_2
END

IF ~~ MRDreamComAnoEnd1
 SAY @40
 IF ~~ THEN EXIT
END

END

CHAIN ANOMENJ MRDreamComAno6_1
 @41
 = @42
EXIT

CHAIN ANOMENJ MRDreamComAno6_2
 @43
 = @44
EXIT

CHAIN ANOMENJ MRDreamComAno6_3
 @45
 =
 @46
EXIT

CHAIN ANOMENJ MRDreamComAno5
 @47
 =
 @48
 == ANOMENJ IF ~GENDER(Player1,MALE)~ THEN @49
 == ANOMENJ IF ~GENDER(Player1,FEMALE) !Global("AnomenRomanceActive","GLOBAL",2)~ THEN @50
 == ANOMENJ IF ~Global("AnomenRomanceActive","GLOBAL",2)~ THEN @51
 == ANOMENJ @52
END
 + ~Global("AnomenRomanceActive","GLOBAL",2)~ + @53 EXTERN ANOMENJ MRDreamComAnoLove1
 + ~Global("AnomenRomanceActive","GLOBAL",2)~ + @54 EXTERN ANOMENJ MRDreamComAnoLove1
 + ~Global("AnomenRomanceActive","GLOBAL",2)~ + @55 EXTERN ANOMENJ MRDreamComAnoLove2
 + ~Gender(Player1,FEMALE) !Global("AnomenRomanceActive","GLOBAL",2)~ + @56 EXTERN ANOMENJ MRDreamComAno7
 + ~!Global("AnomenRomanceActive","GLOBAL",2)~ + @57 EXTERN ANOMENJ MRDreamComAno8
 + ~!Global("AnomenRomanceActive","GLOBAL",2)~ + @58 EXTERN ANOMENJ MRDreamComAnoDirty
 + ~Gender(Player1,MALE)~ + @59 EXTERN ANOMENJ MRDreamComAnoLove3


APPEND ANOMENJ
IF ~~ MRDreamComAno7
 SAY @60
 IF ~~ + MRDreamComAnoLove3
END

IF ~~ MRDreamComAno8
 SAY @61
 IF ~~ + MRDreamComAnoLove3
END

IF ~~ MRDreamComAnoLove1
 SAY @62
 IF ~~ + MRDreamComAnoLove3
END

IF ~~ MRDreamComAnoLove2
 SAY @63
 =
 @64
 ++ @65 + MRDreamComAnoLove1
 ++ @66 + MRDreamComAnoLove1
 ++ @67 + MRDreamComAnoLove2
END

IF ~~ MRDreamComAnoLove3
 SAY @68
 =
 @69
 IF ~~ THEN EXIT
 IF ~Global("AnomenRomanceActive","GLOBAL",2)~ + MRDreamComAnoLove3_1
END

IF ~~ MRDreamComAnoLove3_1
 SAY @70
 IF ~~ THEN DO ~SetGlobal("AnomenRomanceActive","GLOBAL",3)~ EXIT
END

END
