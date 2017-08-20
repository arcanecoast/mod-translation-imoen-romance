 APPEND JAHEIRAJ   //// None of these files were updated
IF ~Global("MRJaheiraBanterFire","GLOBAL", 2)~
MRDreamComment
SAY @0
 ++ @1 DO ~SetGlobal("MRDreamRomanceComment","GLOBAL",1)SetGlobal("MRJaheiraBanterFire","GLOBAL", 3) ~ + MRDreamComJah2
 ++ @2 DO ~SetGlobal("MRDreamRomanceComment","GLOBAL",1)SetGlobal("MRJaheiraBanterFire","GLOBAL", 3) ~ + MRDreamComJah
END
END

/* Party comments on PC's dreams */

/* Jaheira */

APPEND JAHEIRAJ
IF ~~ MRDreamComJah
 SAY @3
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComJah2
 SAY @4
 ++ @5 + MRDreamComJahYouth
 ++ @6 + MRDreamComJahYouth
 ++ @7 + MRDreamComJahKiss
 ++ @8 + MRDreamComJahPorn
END

IF ~~ MRDreamComJahPorn
 SAY @9
 IF ~~ + MRDreamComJahNext
END

IF ~~ MRDreamComJahKiss
SAY @10
++ @11 + MRDreamComJahKiss2
END

IF ~~ MRDreamComJahKiss2
 SAY @12
 IF ~~ + MRDreamComJahNext
END

IF ~~ MRDreamComJahYouth
 SAY @13
 IF ~~ + MRDreamComJahYouth2
END

IF ~~ MRDreamComJahNext
 SAY @14
 ++ @15 + MRDreamComJahCalm
 ++ @16 + MRDreamComJahScan
END

IF ~~ MRDreamComJahScan
 SAY @17
 =
 @18
 =
 @19
 =
 @20
 IF ~~ THEN DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ MRDreamComJahCalm
 SAY @21
 =
 @22
 IF ~~ THEN DO ~SetGlobal("MRDreamComJahCalm","GLOBAL",1)~ + MRDreamComJahYouth2
END

IF ~~ MRDreamComJahYouth2
 SAY @23
 ++ @24 + MRDreamComJahEnd2
 ++ @25 + MRDreamComJahNext2
 + ~Global("MRDreamComJahCalm","GLOBAL",1)~ + @26 + MRDreamComJahWaste
 + ~!Global("MRDreamComJahCalm","GLOBAL",1)~ + @26 + MRDreamComJahWaste2
 + ~Global("MRDreamComJahCalm","GLOBAL",1)~ + @27 + MRDreamComJahWaste
 + ~!Global("MRDreamComJahCalm","GLOBAL",1)~ + @28 + MRDreamComJahWaste2
END

IF ~~ MRDreamComJahWaste
 SAY @29
 IF ~~ + MRDreamComJahWaste3
END

IF ~~ MRDreamComJahWaste2
 SAY @30
 IF ~~ + MRDreamComJahWaste3
END

IF ~~ MRDreamComJahWaste3
 SAY @31
 IF ~~ THEN EXIT
END

IF ~~ MRDreamComJahNext2
 SAY @32
 ++ @33 + MRDreamComJahNext3
 + ~Global("MRDreamComJahCalm","GLOBAL",1)~ + @26 + MRDreamComJahWaste
 + ~!Global("MRDreamComJahCalm","GLOBAL",1)~ + @26 + MRDreamComJahWaste2
END

IF ~~ MRDreamComJahNext3
 SAY @34
 ++ @35 + MRDreamComJahEnd2
 ++ @36 + MRDreamComJahEnd
 + ~Global("MRDreamComJahCalm","GLOBAL",1)~ + @26 + MRDreamComJahWaste
 + ~!Global("MRDreamComJahCalm","GLOBAL",1)~ + @26 + MRDreamComJahWaste2
END

IF ~~ MRDreamComJahEnd
 SAY @37
 =
 @38
 =
 @39
 =
 @40
 =
 @41
 =
 @42
 =
 @43
 IF ~~ THEN EXIT
END
END

CHAIN JAHEIRAJ MRDreamComJahEnd2
 @44
 =
 @45
 =
 @46
 == JAHEIRAJ IF ~Global("JaheiraRomanceActive","GLOBAL",2)~ THEN @47
END
 + ~!Global("JaheiraRomanceActive","GLOBAL",2)~ + @48 DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)~ EXTERN JAHEIRAJ MRDreamComJahDis
 + ~Global("JaheiraRomanceActive","GLOBAL",2)~ + @49 DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)~ EXTERN JAHEIRAJ MRDreamComJahDis
 ++ @50 EXTERN JAHEIRAJ MRDreamComJahUnk
 ++ @51 EXTERN JAHEIRAJ MRDreamComJahSib
 ++ @52 EXTERN JAHEIRAJ MRDreamComJahAnnoy
 ++ @53 EXTERN JAHEIRAJ MRDreamComJahCruel
 ++ @54 EXTERN JAHEIRAJ MRDreamComJahNext

APPEND JAHEIRAJ
IF ~~ MRDreamComJahCruel
 SAY @55
 =
 @56
 IF ~~ THEN DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ MRDreamComJahAnnoy
 SAY @57
 =
 @58
 IF ~~ + MRDreamComJahFinish
END

IF ~~ MRDreamComJahSib
 SAY @59
 IF ~~ + MRDreamComJahFinish
END

IF ~~ MRDreamComJahUnk
 SAY @60
 IF ~~ + MRDreamComJahFinish
END

IF ~~ MRDreamComJahDis
 SAY @61
 =
 @62
 =
 @63
 IF ~~ + MRDreamComJahFinish
END

IF ~~ MRDreamComJahFinish
 SAY @64
 =
 @65
 IF ~~ THEN EXIT
END
END