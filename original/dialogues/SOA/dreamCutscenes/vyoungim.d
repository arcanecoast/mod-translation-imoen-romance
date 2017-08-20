BEGIN ~VYOUNGIM~

IF ~~ THEN BEGIN MRDream1-sub3
	SAY @0
IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cutim03")~
EXIT
IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("CutiF03")~
EXIT
END

