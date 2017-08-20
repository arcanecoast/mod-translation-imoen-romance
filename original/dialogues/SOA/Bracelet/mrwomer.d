
BEGIN ~MRWOMER~

APPEND MRWOMER

	IF ~~ THEN BEGIN MRWoman
		SAY @0
		=@1 
		 IF ~~ THEN REPLY @2 EXTERN PLAYER1 MRBraceletApproach
		 IF ~Global("ImoenRomanceActive","GLOBAL",2)
		~ THEN REPLY @3 EXTERN PLAYER1 MRBraceletApproach1
		 IF ~Global("AerieRomanceActive","GLOBAL",2)
		~ THEN REPLY @4 EXTERN PLAYER1 MRBraceletApproach1
		 IF ~Global("JaheiraRomanceActive","GLOBAL",2)
		~ THEN REPLY @5 EXTERN PLAYER1 MRBraceletApproach1
		 IF ~Global("ViconiaRomanceActive","GLOBAL",2)
		~ THEN REPLY @6 EXTERN PLAYER1 MRBraceletApproach1
		 IF ~Global("AnomenRomanceActive","GLOBAL",2)
		~ THEN REPLY @7 EXTERN PLAYER1 MRBraceletApproach1
		 IF ~Global("NaliaRomanceActive","GLOBAL",2)
		~ THEN REPLY @8 EXTERN PLAYER1 MRBraceletApproach1
		 IF ~Global("TashiaRomanceActive","GLOBAL",2)
		~ THEN REPLY @9 EXTERN PLAYER1 MRBraceletApproach1
		 IF ~~ THEN REPLY @10 EXTERN PLAYER1 MRBraceletGoAway
	END

	IF ~Global("MRRingSellImoen","GLOBAL",3)~ THEN BEGIN MRWoman2 // from:
	 SAY @11
	 = @12
	 = @13
	 IF ~~ THEN EXTERN IMOEN2J MRBraceletIm
	END

	IF ~~ THEN BEGIN MRWomanAnnoyed // from:
	 SAY @14
	 = @15
	 IF ~OR(5)
		Global("AerieRomanceActive","GLOBAL",2)
		Global("JaheiraRomanceActive","GLOBAL",2)
		Global("ViconiaRomanceActive","GLOBAL",2)
		Global("NaliaRomanceActive","GLOBAL",2)
		Global("AnomenRomanceActive","GLOBAL",2)
		!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @16 EXTERN IMOEN2J MRBraceletElbow
	 IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @17 EXTERN IMOEN2J MRBraceletElbow
	 IF ~~ THEN REPLY @18 EXTERN IMOEN2J MRBraceletElbow
	 IF ~~ THEN REPLY @19 EXTERN IMOEN2J MRBraceletElbow
	END

	IF ~~ THEN BEGIN MRWomanNotice // from:
	 SAY @20
	 IF ~~ THEN EXTERN IMOEN2J MRPurse
	END

	IF ~~ THEN BEGIN MRAfterPurse
	SAY @21
	 = @22
         = @23
	 = @24
	 IF ~~ THEN EXTERN IMOEN2J MRWomanPrice
	END
	
	IF ~~ THEN BEGIN MRWomanPriceJade
	SAY @25
        = @26
	IF ~~ THEN EXTERN IMOEN2J MRWomanBuyRing
	END

	IF ~~ THEN BEGIN MRHold
	SAY @27
	= @28
	IF ~~ THEN EXTERN IMOEN2J MRHoldNot
	END
END


