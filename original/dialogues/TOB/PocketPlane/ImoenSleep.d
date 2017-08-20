// Contents:
// Imoen talks about the first time you sleep in the pocket plane

CHAIN IF WEIGHT #0 ~Global("IRTRestedInPocketPlane","GLOBAL",1)~ THEN IMOEN25J Poc
	@0 DO ~SetGlobal("IRTRestedInPocketPlane","GLOBAL",2)~
	= @1
	== AERIE25J IF ~InParty("Aerie")~ THEN @2
	== JAHEI25J IF ~InParty("Jaheira")~ THEN @3
	== IMOEN25J @4
	= @5
END
	++ @6 + Poc1
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @7 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + Poc2
	++ @8 + Poc3
	++ @9 + Poc4
	+ ~!Global("ImoenRomanceActive","GLOBAL",3)~ + @10 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-2)~ + Poc5
	+ ~Global("ImoenRomanceActive","GLOBAL",3)~ + @11 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-2)~ + Poc6
	
APPEND IMOEN25J
	IF ~~ THEN Poc1
		SAY @12
		= @13
		= @14
		IF ~~ THEN EXIT
	END

	IF ~~ THEN Poc2
		SAY @15
		= @16
		++ @17 + Poc1
		++ @18 + Poc3
		++ @19 + Poc4
	END
		

	IF ~~ THEN Poc3	
		SAY @20
		= @21
		IF ~~ THEN EXIT
	END

	IF ~~ THEN Poc4
		SAY @20
		= @22
		IF ~~ THEN EXIT
	END
		
	IF ~~ THEN Poc5
		SAY @23
		IF ~~ THEN EXIT
	END

	IF ~~ THEN Poc6
		SAY @24
		= @25
		IF ~~ THEN EXIT
	END
END

