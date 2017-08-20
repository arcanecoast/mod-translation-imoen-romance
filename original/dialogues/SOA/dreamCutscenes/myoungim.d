BEGIN ~MYOUNGIM~

IF ~~ THEN BEGIN MRDream2-sub3
	SAY @0
	IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutim08")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("CutiF08")~
	EXIT
END

IF ~~ THEN BEGIN MRDream2-sub5
	SAY @1
	IF ~~ THEN EXTERN MYOUNGCH MRDream2-sub6
END