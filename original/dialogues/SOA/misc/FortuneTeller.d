// *** Fortunetell ***

EXTEND_BOTTOM TRGYP02 2
	IF ~Name("Imoen2",LastTalkedToBy)~THEN EXTERN IMOEN2J MRFortuneTold
END



CHAIN TRGYP02 MRFortuneChain
	@0
 = @1
 = @2
 = @3

	== TRGYP02 IF ~!Global("BodhiDead","GLOBAL",1)~ THEN @4
	== TRGYP02 IF ~Global("BodhiDead","GLOBAL",1)~ THEN @5

	== TRGYP02 IF ~Global("ImoenRomanceActive","GLOBAL",1)~ THEN @6
	== TRGYP02 IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @7
	== TRGYP02 IF ~GlobalGT("ImoenRomanceActive","GLOBAL",2)~ THEN @8

	== TRGYP02 IF ~!Global("BodhiDead","GLOBAL",1)~ THEN @9
 	== TRGYP02 IF ~Global("BodhiDead","GLOBAL",1)~ THEN @10

 == TRGYP02 @11 DO ~GiveGoldForce(10)~
 == IMOEN2J @12

 == IMOEN2J IF ~Global("ImoenRomanceActive","GLOBAL",1)~ THEN @13 DO ~RunAwayFrom(Player1,40)~
 == IMOEN2J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @14
 == IMOEN2J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @15
 == IMOEN2J IF ~GlobalGT("ImoenRomanceActive","GLOBAL",2)~ THEN @16 DO ~RunAwayFrom(Player1,40)~
EXIT

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRFortuneTold
		SAY @17
		IF ~~ THEN EXTERN TRGYP02 MRFortuneChain
	END
END
