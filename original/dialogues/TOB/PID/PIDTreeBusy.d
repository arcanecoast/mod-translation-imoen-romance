// ~~ Global-specific transitional PIDs ~~

// About-to-be-razed Saradush!
APPEND IMOEN25J
IF WEIGHT #997 ~RandomNum(3,1) AreaCheck("AR5000") !IsGabber("Imoen2")~ THEN BEGIN outsara1
SAY @0
IF ~~ THEN EXIT
END

IF WEIGHT #997 ~RandomNum(3,2) AreaCheck("AR5000") !IsGabber("Imoen2")~ THEN BEGIN outsara2
SAY @1
IF ~~ THEN EXIT
END

IF WEIGHT #997 ~RandomNum(3,3) AreaCheck("AR5000") !IsGabber("Imoen2")~ THEN BEGIN outsara3
SAY @2
IF ~~ THEN EXIT
END

// In the siege camp (before the slaughter)

IF WEIGHT #997 ~AreaCheck("AR5203") !IsGabber("Imoen2") !Global("YagaShuraHeart","GLOBAL",1) !Global("HadBhaal25Dream1","GLOBAL",1)~ THEN BEGIN siege1
SAY @3
= @4
IF ~~ THEN EXIT
END

IF WEIGHT #997 ~AreaCheck("AR5203") !IsGabber("Imoen2") Global("YagaShuraHeart","GLOBAL",1) !Global("HadBhaal25Dream1","GLOBAL",1)~ THEN BEGIN siege2
SAY @5
IF ~~ THEN EXIT
END

// In the siege camp (after the slaughter) or in the Oasis

IF WEIGHT #997 ~OR(2) AreaCheck("AR6300") AreaCheck("AR5203") !IsGabber("Imoen2") Global("HadBhaal25Dream1","GLOBAL",1)~ THEN BEGIN siege1
SAY @6
IF ~~ THEN EXIT
END

// PID during combat

IF WEIGHT #880 ~!IsGabber("Imoen2") OR(2) Detect([ENEMY]) ActuallyInCombat() RandomNum(6,1)~ THEN ForceCombat1
 SAY @7
 IF ~~ THEN EXIT
END

IF WEIGHT #880 ~!IsGabber("Imoen2") OR(2) Detect([ENEMY]) ActuallyInCombat() RandomNum(6,2)~ THEN ForceCombat2
 SAY @8
 IF ~~ THEN EXIT
END

IF WEIGHT #880 ~!IsGabber("Imoen2") OR(2) Detect([ENEMY]) ActuallyInCombat() RandomNum(6,3)~ THEN ForceCombat3
 SAY @9
 IF ~~ THEN EXIT
END

IF WEIGHT #880 ~!IsGabber("Imoen2") OR(2) Detect([ENEMY]) ActuallyInCombat() RandomNum(6,4)~ THEN ForceCombat4
 SAY @10
 IF ~~ THEN EXIT
END

IF WEIGHT #880 ~!IsGabber("Imoen2") OR(2) Detect([ENEMY]) ActuallyInCombat() RandomNum(6,5)~ THEN ForceCombat5
 SAY @11
 IF ~~ THEN EXIT
END

IF WEIGHT #880 ~!IsGabber("Imoen2") OR(2) Detect([ENEMY]) ActuallyInCombat() RandomNum(6,6)~ THEN ForceCombat6
 SAY @12
 IF ~~ THEN EXIT
END
END
