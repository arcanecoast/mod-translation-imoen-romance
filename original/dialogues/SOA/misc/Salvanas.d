// ** Meeting Salvanas **//

APPEND SALVANAS  //// Changes: basic punctuation, missing words
	IF WEIGHT #11
	~!InPartySlot(LastTalkedToBy,0)
		Name("Imoen2",LastTalkedToBy)~ THEN BEGIN MRSalvanas
	 SAY @0
	 IF ~~ THEN EXTERN IMOEN2J MRSalvanas
	END
END

CHAIN IMOEN2J MRSalvanas
@1
== SALVANAS
@2
== IMOEN2J
@3
== IMOEN2J
@4
==SALVANAS
@5
==IMOEN2J
@6
== IMOEN2J
@7
==SALVANAS
@8
==IMOEN2J
@9
==SALVANAS
@10
==IMOEN2J
@11
==IMOEN2J
IF ~Global("ImoenRomanceActive","GLOBAL",2) Gender(Player1,MALE) OR(2) Race(Player1,HALFORC) Race(Player1,DWARF)~ THEN @12
==IMOEN2J @13
==IMOEN2J @14
==SALVANAS @15
==SALVANAS @16
EXIT