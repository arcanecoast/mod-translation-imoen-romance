BEGIN HYOUNGCH

IF ~~ THEN BEGIN MRDream3-sub3
	SAY @0
	IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("Cutim14")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("CutiF14")~
	EXIT	
END

IF ~~ THEN BEGIN MRDream3-sub6
	SAY @1
	IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("Cutim15")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("CutiF15")~
	EXIT
END