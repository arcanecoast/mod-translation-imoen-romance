APPEND IMOEN2J
	 IF ~Global("MRSleptImoen","GLOBAL",1)
		 Global("MRAfterSexTalk","GLOBAL",3)
		IsGabber(Player1)
		!AreaType(DUNGEON)
		Name("Imoen2",Player2)
		!See(Player3)
		!See(Player4)
		!See(Player5)
		!See(Player6)
	~ THEN BEGIN MRRomanceRes1
	SAY @0
	IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1")) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) SetGlobal("MRAfterSexTalk","GLOBAL",5)~ GOTO MRResolution1
	END
	
 IF ~Global("MRSleptImoen","GLOBAL",1)
	 Global("MRAfterSexTalk","GLOBAL",3)
	IsGabber(Player1)
	!AreaType(DUNGEON)
	Name("Imoen2",Player3)
	!See(Player2)
	!See(Player4)
	!See(Player5)
	!See(Player6)
	~ THEN BEGIN MRRomanceRes2 
	SAY @0
	IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1")) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) SetGlobal("MRAfterSexTalk","GLOBAL",5)~ GOTO MRResolution1
	END
	
 IF ~Global("MRSleptImoen","GLOBAL",1)
	 Global("MRAfterSexTalk","GLOBAL",3)
	IsGabber(Player1)
	!AreaType(DUNGEON)
	Name("Imoen2",Player4)
	!See(Player2)
	!See(Player3)
	!See(Player5)
	!See(Player6)
	~ THEN BEGIN MRRomanceRes3
	SAY @0
	IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1")) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) SetGlobal("MRAfterSexTalk","GLOBAL",5)~ GOTO MRResolution1
	END
	
 IF ~Global("MRSleptImoen","GLOBAL",1)
	 Global("MRAfterSexTalk","GLOBAL",3)
	IsGabber(Player1)
	!AreaType(DUNGEON)
	Name("Imoen2",Player5)
	!See(Player2)
	!See(Player3)
	!See(Player4)
	!See(Player6)
	~ THEN BEGIN MRRomanceRes4
	SAY @0
	IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1")) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) SetGlobal("MRAfterSexTalk","GLOBAL",5)~ GOTO MRResolution1
	END
	
 IF ~Global("MRSleptImoen","GLOBAL",1)
	 Global("MRAfterSexTalk","GLOBAL",3)
	IsGabber(Player1)
	!AreaType(DUNGEON)
	Name("Imoen2",Player6)
	!See(Player2)
	!See(Player3)
	!See(Player4)
	!See(Player5)
	~ THEN BEGIN MRRomanceRes5 
	SAY @0
	IF ~~ THEN DO ~ActionOverride(Player1,SetDialog("Player1")) RealSetGlobalTimer("MRImoenLovetalkTimer","GLOBAL",3000) SetGlobal("MRAfterSexTalk","GLOBAL",5)~ GOTO MRResolution1
	END
	
	IF ~!ActuallyInCombat()
		IsGabber(Player1)
		Global("ImoenRomanceActive","GLOBAL",2)~THEN BEGIN MRGabber
		SAY @1
		IF ~Global("MRPhaereBiTalk","GLOBAL",0)~ THEN REPLY @2 DO ~SetGlobal("MRPhaereBiTalk","GLOBAL",2)~ GOTO MRPhaereBiTalk
		IF ~Global("ImoenRomanceActive","GLOBAL",2)
			!ActuallyInCombat()
			TimeGT(9)
			!TimeGT(18)
			AreaType(WEATHER)
			!AreaType(CITY)
			AreaType(DAYNIGHT)
			AreaType(OUTDOOR)
		~ THEN REPLY @3 DO ~ActionOverride(Player1,SetDialogue("Player1")) ~ GOTO MRLT0

		 IF ~Global("ImoenRomanceActive","GLOBAL",2)
			!ActuallyInCombat()
			TimeGT(9)
			!TimeGT(18)
			AreaType(CITY)
		~ THEN REPLY @3 DO ~ ActionOverride(Player1,SetDialogue("Player1")) ~ GOTO MRLT1
		
		 IF ~Global("ImoenRomanceActive","GLOBAL",2)
			!ActuallyInCombat()
			TimeGT(9)
			!TimeGT(18)
			AreaType(DUNGEON)
			!AreaCheck("AR2900")
			!AreaCheck("AR2901")
			!AreaCheck("AR2902")
			!AreaCheck("AR2903")
			!AreaCheck("AR2904")
			!AreaCheck("AR2905")
			!AreaCheck("AR2906")
		~ THEN REPLY @3 DO ~ActionOverride(Player1,SetDialogue("Player1")) ~ GOTO MRLT2
		
		 IF ~Global("ImoenRomanceActive","GLOBAL",2)
			!ActuallyInCombat()
			TimeGT(18)
			!TimeGT(DUSK_END)
			AreaType(WEATHER)
			!AreaType(CITY)
			AreaType(DAYNIGHT)
			AreaType(OUTDOOR)
			~ THEN REPLY @3 DO ~ ActionOverride(Player1,SetDialogue("Player1")) ~ GOTO MRLT3

		 IF ~Global("ImoenRomanceActive","GLOBAL",2)
			!ActuallyInCombat()
			TimeGT(18)
			!TimeGT(DUSK_END)
			AreaType(DUNGEON)
			!AreaCheck("AR2900")
			!AreaCheck("AR2901")
			!AreaCheck("AR2902")
			!AreaCheck("AR2903")
			!AreaCheck("AR2904")
			!AreaCheck("AR2905")
			!AreaCheck("AR2906")
		 ~ THEN REPLY @3 DO ~ ActionOverride(Player1,SetDialogue("Player1"))~ GOTO MRLT4

		 IF ~Global("ImoenRomanceActive","GLOBAL",2)
			CombatCounter(0)
			TimeGT(18)
			!TimeGT(DUSK_END)
			AreaType(CITY)
		 ~ THEN REPLY @3 DO ~ ActionOverride(Player1,SetDialogue("Player1"))~ GOTO MRLT5

		 IF ~Global("ImoenRomanceActive","GLOBAL",2)
			OR(7)
			Time(23)
			Time(MIDNIGHT)
			Time(1)
			Time(2)
			Time(3)
			Time(4)
			Time(5)
			CombatCounter(0)
			AreaType(WEATHER)
			!AreaType(CITY)
			AreaType(DAYNIGHT)
			AreaType(OUTDOOR)
			~ THEN REPLY @3 DO ~ActionOverride(Player1,SetDialogue("Player1"))~ GOTO MRLT6

			IF ~Global("ImoenRomanceActive","GLOBAL",2)
			!ActuallyInCombat()
			OR(7)
			Time(23)
			Time(MIDNIGHT)
			Time(1)
			Time(2)
			Time(3)
			Time(4)
			Time(5)
			AreaType(CITY)
			~ THEN REPLY @3 DO ~ ActionOverride(Player1,SetDialogue("Player1"))~ GOTO MRLT7
	
		 IF ~Global("ImoenRomanceActive","GLOBAL",2)
			!ActuallyInCombat()
			OR(7)
			Time(23)
			Time(MIDNIGHT)
			Time(1)
			Time(2)
			Time(3)
			Time(4)
			Time(5)
			AreaType(DUNGEON)
			!AreaCheck("AR2900")
			!AreaCheck("AR2901")
			!AreaCheck("AR2902")
			!AreaCheck("AR2903")
			!AreaCheck("AR2904")
			!AreaCheck("AR2905")
			!AreaCheck("AR2906")
			~ THEN REPLY @3 DO ~ActionOverride(Player1,SetDialogue("Player1"))~ GOTO MRLT8

			IF ~Global("ImoenRomanceActive","GLOBAL",2)
			!ActuallyInCombat()
			TimeGT(5)
			!TimeGT(9)
			AreaType(WEATHER)
			!AreaType(CITY)
			AreaType(DAYNIGHT)
			AreaType(OUTDOOR)
			~ THEN REPLY @3 DO ~ ActionOverride(Player1,SetDialogue("Player1"))~ GOTO MRLT9

			 IF ~Global("ImoenRomanceActive","GLOBAL",2)
			!ActuallyInCombat()
			TimeGT(5)
			!TimeGT(9)
			AreaType(CITY)
			~ THEN REPLY @3 DO ~ActionOverride(Player1,SetDialogue("Player1"))~ GOTO MRLT10

			IF ~Global("ImoenRomanceActive","GLOBAL",2)
			!ActuallyInCombat()
			TimeGT(5)
			!TimeGT(9)
			AreaType(DUNGEON)
			!AreaCheck("AR2900")
			!AreaCheck("AR2901")
			!AreaCheck("AR2902")
			!AreaCheck("AR2903")
			!AreaCheck("AR2904")
			!AreaCheck("AR2905")
			!AreaCheck("AR2906")
			~ THEN REPLY @3 DO ~ActionOverride(Player1,SetDialogue("Player1"))~ GOTO MRLT11
			IF ~~ THEN REPLY @4 EXIT
	END
END