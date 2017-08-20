/* Here go all of Imoen's states whenever you initiate dialogue with her */


APPEND IMOEN25J


// Romanced or Friendly

IF WEIGHT #999 ~IsGabber(Player1) !Global("ImoenRomanceActive","GLOBAL",3) !Global("IRTQuarrelDue","GLOBAL",1) !Global("IRTCooldownDue","GLOBAL",1) !Global("IRTBrokeUpTalk","GLOBAL",1) !AreaCheck("AR5203") !ActuallyInCombat() !AreaCheck("AR5000") !AreaCheck("AR5203")~ NormalPID
  SAY @0

// ~~ conversations ~~

  ++ @1 + PIDQuestions

// ~~ Romantic interactions ~~

	// Quality times
	

		// After 2nd Test in Pocketplane
		+ ~Global("ImoenRomanceActive","GLOBAL",2) Global("BeginChallenge2","GLOBAL",3) IsGabber(Player1) Global("IRTQTPocket1","GLOBAL",0) AreaCheck("AR4500")~ + @2 DO ~SetGlobal("IRTQTPocket1","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",2)~ + 2QT
		
		// After either Abazigal or Sendai is dead, in Pocketplane

		+ ~Global("ImoenRomanceActive","GLOBAL",2) IsGabber(Player1) Global("IRTQTPocket1","GLOBAL",1) Global("IRTQTPocket2","GLOBAL",0) AreaCheck("AR4500") Global("TalkedToSolar","GLOBAL",6)~ + @3 DO ~SetGlobal("IRTQTPocket2","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",2)~ + 4QT
		
		
	// Brief Public Displays of Affection // IRTLoveMeter increases by 1 every 3 sets.

		// PDA0

	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) Global("IRTPDA","GLOBAL",0)~ + @4 DO ~SetGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA0-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) Global("IRTPDA","GLOBAL",0)~ + @5 DO ~SetGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA0-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) Global("IRTPDA","GLOBAL",0)~ + @6 DO ~SetGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA0-3

	// PDA1
	
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",1)~ + @7 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA1-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",1)~ + @8 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA1-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",1)~ + @9 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA1-3
		
	// PDA2
	
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",2)~ + @10 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA2-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",2)~ + @11 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ GOTO PDA2-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",2)~ + @12 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ GOTO PDA2-3

	// PDA3
	
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",3)~ + @13 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA3-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",3)~ + @14 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA3-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",3)~ + @15 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA3-3

	// PDA4

	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",4)~ + @16 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA4-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",4)~ + @17 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA4-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",4)~ + @18 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA4-3

	// PDA5
	
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",5)~ + @19 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA5-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",5)~ + @20 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA5-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",5)~ + @21 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA5-3
	
	// PDA6
	
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",6)~ + @22 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA6-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",6)~ + @23 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA6-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",6)~ + @24 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA6-3

	// PDA7
	
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",7)~ + @25 DO ~SetGlobal("bf251","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA7-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",7)~ + @26 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA7-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",7)~ + @27 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA7-3
  
	// PDA8
	
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",8)~ + @28 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA8-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",8)~ + @29 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA8-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",8)~ + @30 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA8-3

	// PDA9
	
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",9)~ + @31 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA9-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",9)~ + @32 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA9-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",9)~ + @33 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA9-3
		
	// PDA10
	
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",10)~ + @34 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA10-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",10)~ + @35 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA10-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",10)~ + @36 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA10-3
	
	// PDA11
	
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",11)~ + @37 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ GOTO PDA11-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",11)~ + @38 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ GOTO PDA11-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",11)~ + @39 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA11-3

	// PDA12

	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",12)~ + @40 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA12-1
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",12)~ + @41 DO ~IncrementGlobal("IRTPDA","GLOBAL",1)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA12-2
	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",12)~ + @42 DO ~IncrementGlobal("IRTPDA","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA12-3


	// PDA13

	+ ~IsGabber(Player1) Global("ImoenRomanceActive","GLOBAL",2) RealGlobalTimerExpired("IRTPDATimer","GLOBAL") Global("IRTPDA","GLOBAL",13)~ + @43 DO ~SetGlobal("IRTPDA","GLOBAL",0)  IncrementGlobal("IRTLoveMeter","GLOBAL",1) RealSetGlobalTimer("IRTPDATimer","GLOBAL",600)~ + PDA13-1

	
// ~~ exit dialogue ~~

  + ~IsGabber(Player1) RandomNum(8,1)~ + @44 + DiaExFT1
  + ~IsGabber(Player1) RandomNum(8,2)~ + @45 + DiaExFT2
  + ~IsGabber(Player1) RandomNum(8,3)~ + @46 + DiaExFT3
  + ~IsGabber(Player1) RandomNum(8,4)~ + @47 + DiaExFT4
  + ~IsGabber(Player1) RandomNum(8,5)~ + @48 + DiaExFT5
  + ~IsGabber(Player1) RandomNum(8,6)~ + @49 + DiaExFT6
  + ~IsGabber(Player1) RandomNum(8,7)~ + @50 + DiaExFT7
  + ~IsGabber(Player1) RandomNum(8,8)~ + @51 + DiaExFT8
  + ~!IsGabber(Player1) !IsGabber("Korgan") !IsGabber("Minsc")~ + @52 + DiaExFT9
  + ~IsGabber("Korgan")~ + @53 + DiaExFT9
  + ~IsGabber("Minsc")~ + @54 + DiaExFT9


END

// ~~ Questions state leading to several conversations ~~

	IF ~~ PIDQuestions
	  SAY @55

	  /* Marriage */
      //after solar talk after killing senda or abazigal
	  + ~GlobalGT("IRTLoveMeter","GLOBAL",7) Global("IRTMarriageTalk","GLOBAL",1)  Gender(Player1,MALE)~ + @56 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRTMarriageTalk","GLOBAL",2)~ GOTO Mar1
	  + ~GlobalGT("IRTLoveMeter","GLOBAL",7) Global("IRTMarriageTalk","GLOBAL",1)  Gender(Player1,FEMALE)~ + @56 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRTMarriageTalk","GLOBAL",2)~ GOTO MarF
	  + ~!GlobalGT("IRTLoveMeter","GLOBAL",7) Global("IRTMarriageTalk","GLOBAL",1)~ + @56 DO ~SetGlobal("IRTMarriageTalk","GLOBAL",2)~ GOTO MarTooLow

	  /* Children */
       //after solar talk after killing senda or abazigal
	  + ~Global("IRTPregnancyTalk","GLOBAL",1)~ + @57 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRTPregnancyTalk","GLOBAL",2)~ GOTO Preg1

	  /* Torture */
	  //after first bhaal talk
	  + ~Global("IRTTortureTalk","GLOBAL",1)~ + @58 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRTTortureTalk","GLOBAL",2)~ + T1

	  /* Worship */
      //after first challenge
	IF ~Global("IRTHadFaithTalk","GLOBAL",1) Global("BeginChallenge1","GLOBAL",12)~ THEN REPLY @59 DO ~SetGlobal("IRTHadFaithTalk","GLOBAL",2)~ GOTO god1
	  
	  /* Slayer-Ravager-Resisting the Taint */
	  
	  + ~Global("IRTResistTheSlayer","GLOBAL",3) Global("IRTResistTheSlayerQ","GLOBAL",0)~ + @60 DO ~SetGlobal("IRTResistTheSlayerQ","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + HowResist
	  + ~Global("IRTImoenControlsSlayer","GLOBAL",2) Global("IRTImoenControlsSlayerQ","GLOBAL",0)~ + @61 DO ~SetGlobal("IRTImoenControlsSlayerQ","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + HowSlay 
	  + ~Global("IRTImoenIsRavager","GLOBAL",1) Global("IRTImoenIsRavagerQ","GLOBAL",0)~ + @62 DO ~SetGlobal("IRTImoenIsRavagerQ","GLOBAL",1) IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + HowAss 



	  ++ @63 + DiaExFT2
	END



	// ~~ Random dialogue exits ~~


	IF ~~ DiaExFT1
	  SAY @64
	  IF ~~ THEN EXIT
	END

	IF ~~ DiaExFT2
	  SAY @65
	  IF ~~ THEN EXIT
	END

	IF ~~ DiaExFT3
	  SAY @66
	  IF ~~ THEN EXIT
	END

	IF ~~ DiaExFT4
	  SAY @67
	  IF ~~ THEN EXIT
	END

	IF ~~ DiaExFT5
	  SAY @68
	  IF ~~ THEN EXIT
	END

	IF ~~ DiaExFT6
	  SAY @69
	  IF ~~ THEN EXIT
	END

	IF ~~ DiaExFT7
	  SAY @70
	  IF ~~ THEN EXIT
	END

	IF ~~ DiaExFT8
	  SAY @71
	  IF ~~ THEN EXIT
	END

	IF ~~ DiaExFT9
	  SAY @72
	  IF ~~ THEN EXIT
	END




// ~~ PID for ImoenRomanceActive = 3 ~~

IF WEIGHT #999 ~Global("ImoenRomanceActive","GLOBAL",3)~ PIDAngry
SAY ~(Imoen frowns.) What?~ [ IRQUIET ]
 ++ @74 + PIDAngry1
 ++ @75 + PIDAngry2
 ++ @76 + PIDAngry3
 ++ @77 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-100)~ + PIDAngry4
 ++ @78 EXIT
END

IF ~~ PIDAngry1
  SAY @79
  IF ~!GlobalGT("IRTLoveMeter","GLOBAL",-10) !Global("IRTNeverForgive","GLOBAL",1)~ THEN GOTO PIDNotYetForgive
  IF ~GlobalGT("IRTLoveMeter","GLOBAL",-10) !Global("IRTNeverForgive","GLOBAL",1)~ THEN GOTO PIDForgive
  IF ~Global("IRTNeverForgive","GLOBAL",1)~ THEN GOTO PIDNeverForgive
END

IF ~~ PIDNeverForgive
  SAY @80
  = @81
  IF ~~ THEN EXIT
END

IF ~~ PIDNotYetForgive
  SAY @82
  = @81
  IF ~~ THEN EXIT
END

IF ~~ PIDForgive
  SAY @83
  = @84
  ++ @85 + PIDForgiveYes
  ++ @86 + PIDForgiveNo
  ++ @87 + PIDAngry4
END

IF ~~ PIDForgiveYes
  SAY @88
  = @89
  = @90
  = @91
  IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
END

IF ~~ PIDForgiveNo
  SAY @92
  IF ~~ THEN GOTO PIDAngry4
END

IF ~~ PIDAngry2
  SAY @93
  = @94
  IF ~~ THEN EXIT
END

IF ~~ PIDAngry3
  SAY @95
  = @96
  ++ @97 + PIDAngry1
  ++ @98 + PIDAngryNuts
  ++ @99 + PIDAngry4
  ++ @100 + PIDAngry4
END

IF ~~ PIDAngryNuts
  SAY @101
  ++ @102 + PIDAngry1
  ++ @99 + PIDAngry4
  ++ @100 + PIDAngry4
END

IF ~~ PIDAngry4
  SAY @103
  IF ~~ THEN EXIT
END
END