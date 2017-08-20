//** Must happen directly upon entering Suldanessellar **//
APPEND IMOEN2J   //// It seems this whole dialogue was overlooked and wasn't updated

	IF ~Global("MRSuldComment","GLOBAL",1)~ THEN BEGIN MRLoveTalk6
	 SAY @0
	 = @1
	 ++ @2 DO ~SetGlobal("MRSuldComment","GLOBAL",2)~ + MRLoveTalk6-Insist
	 ++ @3 DO ~SetGlobal("MRSuldComment","GLOBAL",2)~ + MRLoveTalk6-Insist
	 + ~NumInPartyGT(2)~ + @4 DO ~SetGlobal("MRSuldComment","GLOBAL",2)~ + MRLoveTalk6-1
	 + ~!NumInPartyGT(2)~ + @5 DO ~SetGlobal("MRSuldComment","GLOBAL",2)~ + MRLoveTalk6-1
	 ++ @6 DO ~SetGlobal("MRSuldComment","GLOBAL",2)~ + MRLoveTalk6-1
	END

	IF ~~ MRLoveTalk6-Insist
	 SAY @7
		++ @8 DO ~SetGlobal("MRSuldComment","GLOBAL",2)~ + MRLoveTalk6-End
		++ @9 DO ~SetGlobal("MRSuldComment","GLOBAL",2)~ + MRLoveTalk6-Threat
		+ ~NumInPartyGT(2)~ + @10 + MRLoveTalk6-1
		+ ~!NumInPartyGT(2)~ + @11 + MRLoveTalk6-1
		++ @6 + MRLoveTalk6-1
		+ ~Gender(Player1,MALE) Global("ImoenRomanceActive","GLOBAL",2) ~ + @12 + MRLoveTalk6-Preg
	END

	IF ~~ MRLoveTalk6-Preg
	 SAY @13
		++ @14 DO ~SetGlobal("MRSuldComment","GLOBAL",2)~ + MRLoveTalk6-End
		+ ~NumInPartyGT(2)~ + @15 + MRLoveTalk6-1
		+ ~!NumInPartyGT(2)~ + @16 + MRLoveTalk6-1
	END

	IF ~~ MRLoveTalk6-Threat
	 SAY @17
	 IF ~~ THEN GOTO MRLoveTalk6-ThreatLeave
	END

	IF ~~ MRLoveTalk6-ThreatLeave
	 SAY @18
	 = @19
	 IF ~~ THEN DO ~ SetGlobal("ImoenRomanceActive","GLOBAL",3) LeaveParty() EscapeArea()~ EXIT
	END


	IF ~~ MRLoveTalk6-End
	 SAY @20
         = @21
	 = @22

	 IF ~~ THEN EXIT
	END

	IF ~~ MRLoveTalk6-1
	 SAY @23
	 IF ~NumInPartyGT(2)~ + MRLoveTalk6-1_1
	 IF ~!NumInPartyGT(2)~ + MRLoveTalk6-1_2
	END

	IF ~~ MRLoveTalk6-1_1
	 SAY @24

	 IF ~~ + MRLoveTalk6-1a
	END

	IF ~~ MRLoveTalk6-1_2
	 SAY @25

	 IF ~~ + MRLoveTalk6-1a
	END

	IF ~~ MRLoveTalk6-1a
	 SAY @26
	 ++ @27 + MRLoveTalk6-2
	 ++ @28 + MRLoveTalk6-2a
	 ++ @29 + MRLoveTalk6-2b

	END

	IF ~~ MRLoveTalk6-2a
	 SAY @30
	 IF ~~ + MRLoveTalk6-2
	END

      	IF ~~ MRLoveTalk6-2b
	 SAY @31
	 IF ~~ THEN GOTO MRLoveTalk6-2
	END

	IF ~~ MRLoveTalk6-2
	 SAY @32
	 = @33
	 ++ @34 + MRLoveTalk6-3
	 ++ @35 + MRLoveTalk6-3
	 + ~NumInPartyGT(2)~ + @36 + MRLoveTalk6-3
	 + ~!NumInPartyGT(2)~ + @37 + MRLoveTalk6-3
	END

	IF ~~ MRLoveTalk6-3
	 SAY @38
	 = @39

	 ++ @40 + MRLoveTalk6-4
	 ++ @41 + MRLoveTalk6-4
	 ++ @42 + MRLoveTalk6-4
	 ++ @43 + MRLoveTalk6-4
	END

	IF ~~ MRLoveTalk6-4
	 SAY @44
	 =

	 @45
	 =

	 @46
	 =

	 @47
	 =

	 @48
         = @49
	 ++ @50 + MRLoveTalkN1
	 ++ @51 + MRLoveTalk6-4MeToo


	 ++ @52 + MRLoveTalkN2
	 ++ @53 + MRLoveTalkN3
	 ++ @54 + MRLoveTalk6-5
	 ++ @55 + MRLoveTalk6-4Joke
	END

	IF ~~ MRLoveTalk6-4MeToo
	 SAY @56
	 = @57
	 ++ @58 + MRLoveTalkN1

	 ++ @52 + MRLoveTalkN2
	 ++ @53 + MRLoveTalkN3
	 ++ @54 + MRLoveTalk6-5
	END

	IF ~~ MRLoveTalk6-4Joke
	 SAY @59
	 = @60
	 IF ~~ + MRLoveTalk6-4End2
	END

        IF ~~ MRLoveTalkN1
           SAY @61
           IF ~~ THEN GOTO MRLoveTalk6-5
        END

        IF ~~ MRLoveTalkN2
           SAY @62
           ++ @63 + MRLoveTalk6-7
           ++ @64 + MRLoveTalkN2a
           ++ @65 + MRLoveTalkN2b
        END
        
        IF ~~ THEN MRLoveTalkN2a
           SAY @66
           = @67
           = @68
           IF ~~ THEN GOTO MRLovetalk6-7Leave
        END

        IF ~~ THEN MRLoveTalkN2b
           SAY @66
           = @69
           IF ~~ THEN GOTO MRLoveTalk6-7
        END

        IF ~~ MRLoveTalkN3
           SAY @70

           IF ~~ THEN GOTO MRLoveTalk6-5
        END


	IF ~~ MRLoveTalk6-4End2
	 SAY @71
	 = @72
	 IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	END

	IF ~~ MRLoveTalk6-5
	 SAY @73
	 ++ @74 + MRLoveTalk6-6
	 ++ @75 + MRLoveTalk6-7

	 ++ @76 + MRLoveTalk6-6
	 ++ @77 + MRLoveTalkN2a
         ++ @78 + MRLoveTalkN2
	END

	IF ~~ MRLoveTalk6-6
	 SAY @79
	 ++ @80 + MRLoveTalk6-7
	 ++ @81 + MRLoveTalk6-7

	 ++ @82 + MRLoveTalk6-7
	END

	IF ~~ MRLoveTalk6-7
	 SAY @83

	 IF ~~ THEN GOTO MRLovetalk6-7Leave
	END


	IF ~~ MRLovetalk6-7Leave
	 SAY @84
	 = @85


         = @86
	 IF ~~ THEN EXIT
	END
END