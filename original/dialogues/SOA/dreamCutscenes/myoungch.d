BEGIN MYOUNGCH

IF ~Global("MRDream2","GLOBAL",3)~ THEN BEGIN MRDream2-sub1
	SAY @0
	=
	@1
	IF ~~ THEN EXTERN MYOUNGIM MRDream2-sub2
END

CHAIN2 MYOUNGIM MRDream2-sub2
~We're finally here! Whoa, this place hasn't changed a bit, has it?~ [ MRImRom3 ]
==
@3
==
@4
END MYOUNGIM MRDream2-sub3

IF ~Global("MRDream2","GLOBAL",4)~ THEN BEGIN MRDream2-sub4
	SAY @5
	=
	@6
	IF ~~ THEN EXTERN MYOUNGIM MRDream2-sub5
END


IF ~~ THEN BEGIN MRDream2-sub6
	SAY @7
	=
	@8
 	=
	@9
	IF ~Gender(Player1,MALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("cutim09")~
	EXIT
	IF ~Gender(Player1,FEMALE)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("CutiF09")~
	EXIT
END





