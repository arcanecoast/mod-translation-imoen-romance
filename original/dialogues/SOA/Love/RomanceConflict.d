/*the idea is that this is to be compiled with romanceContent, pidtree, qualityimes, bitalk */
APPEND IMOEN2J
	IF ~~ THEN BEGIN MRResolution1
				SAY @0
			= ~<CHARNAME>, what happened between us... I've been thinking about it a lot.~ [ MRImRom1 ]
			= @2
			IF ~!Global("JaheiraRomanceActive","GLOBAL",2)
				!Global("AerieRomanceActive","GLOBAL",2)
				!Global("AnomenRomanceActive","GLOBAL",2)
				!Global("ViconiaRomanceActive","GLOBAL",2)
				!Global("RasaadRomanceActive","GLOBAL",2)
				!Global("DornRomanceActive","GLOBAL",2)
				!Global("HexxatRomanceActive","GLOBAL",2)
				!Global("NeeraRomanceActive","GLOBAL",2)~ GOTO MRResolution1noConflict
			IF ~OR(8) Global("JaheiraRomanceActive","GLOBAL",2)
					Global("AerieRomanceActive","GLOBAL",2)
					Global("AnomenRomanceActive","GLOBAL",2)
					Global("ViconiaRomanceActive","GLOBAL",2)
					Global("RasaadRomanceActive","GLOBAL",2)
					Global("DornRomanceActive","GLOBAL",2)
					Global("HexxatRomanceActive","GLOBAL",2)
					Global("NeeraRomanceActive","GLOBAL",2)~ THEN GOTO MRRomanceConflict2
		END
END
APPEND IMOEN2J
	//conflict line
	
	IF ~~ THEN BEGIN MRRomanceConflict2
    SAY @3
	= @4
	++ @5 GOTO MRRomanceConflict-Explode
	++ @6 GOTO MRRomanceConflict-Aggressive
	++ @7 GOTO MRRomanceConflict-Love
	++ @8 GOTO MRRomanceConflict-Cha
	++ @9 GOTO MRResolutionDoneWithYou
	END

	IF ~~ THEN BEGIN MRRomanceConflict-Love
		SAY @10
			++ @11 GOTO MRRomanceConflict-Explain
			++ @12 GOTO MRRomanceConflict-Explain
			++ @13 GOTO MRRomanceConflict-No
	END

	IF ~~ THEN BEGIN MRRomanceConflict-Cha
		SAY @14
			++ @15 GOTO MRRomanceConflict-Explain
			++ @16 GOTO MRRomanceConflict-Explain
			++ @17 GOTO MRRomanceConflict-No
	END

	IF ~~ THEN BEGIN MRRomanceConflict-Aggressive
		SAY @18
			++ @19 GOTO MRRomanceConflict-Explain
			++ @20 GOTO MRRomanceConflict-Explain
			++ @13 GOTO MRRomanceConflict-No
	END

	IF ~~ THEN BEGIN MRRomanceConflict-Explode
	SAY @21
			++ @19 GOTO MRRomanceConflict-Explain
			++ @22 GOTO MRRomanceConflict-Explain
			++ @13 GOTO MRRomanceConflict-No
	END

	IF ~~ THEN BEGIN MRRomanceConflict-No
		SAY @23
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	END
END

CHAIN IMOEN2J MRRomanceConflict-Explain
@24
DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3)~
== IMOEN2J IF ~Global("AerieRomanceActive","GLOBAL",2)~ THEN @25
== IMOEN2J IF ~Global("ViconiaRomanceActive","GLOBAL",2)~ THEN @26
== IMOEN2J IF ~Global("JaheiraRomanceActive","GLOBAL",2)~ THEN @27
== IMOEN2J IF ~Global("AnomenRomanceActive","GLOBAL",2)~ THEN @28

== IMOEN2J IF ~Global("RasaadRomanceActive","GLOBAL",2)~ THEN @29
== IMOEN2J IF ~Global("DornRomanceActive","GLOBAL",2)~ THEN @30
== IMOEN2J IF ~Global("HexxatRomanceActive","GLOBAL",2)~ THEN @31
== IMOEN2J IF ~Global("NeeraRomanceActive","GLOBAL",2)~ THEN @32

== IMOEN2J @33
END
++ @34 EXTERN IMOEN2J MRRomanceConflict-Explain2
++ @35 EXTERN IMOEN2J MRRomanceConflict-Explain2
++ @36 EXTERN IMOEN2J MRRomanceConflict-Jerk


CHAIN IMOEN2J MRRomanceConflict-Explain2
@37
= @38
= @39
==IMOEN2J IF ~OR(5) Global("AerieRomanceActive","GLOBAL",2) Global("ViconiaRomanceActive","GLOBAL",2) Global("JaheiraRomanceActive","GLOBAL",2) Global("HexxatRomanceActive","GLOBAL",2) Global("NeeraRomanceActive","GLOBAL",2)~ THEN @40
==IMOEN2J IF~OR(3) Global("AnomenRomanceActive","GLOBAL",2) Global("DornRomanceActive","GLOBAL",2) Global("RasaadRomanceActive","GLOBAL",2)~ THEN @41
EXIT

CHAIN IMOEN2J MRRomanceConflict-Jerk
@42
==IMOEN2J IF ~Gender(PLAYER1,FEMALE)~ THEN @43
==IMOEN2J IF ~Gender(PLAYER1,MALE)~ THEN @44
==IMOEN2J @45
=@46
END
IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",3) LeaveParty() EscapeArea()~ EXIT