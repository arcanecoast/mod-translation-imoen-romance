CHAIN PLAYER1 MRIntroductionsYes
@0
== PLAYER1 IF ~IsValidForPartyDialog("Aerie") Global("AerieRomanceActive","GLOBAL",2)~ THEN @1

== PLAYER1 IF ~IsValidForPartyDialog("Aerie") !Global("AerieRomanceActive","GLOBAL",2)~ THEN
@2
== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @3
==PLAYER1 IF ~IsValidForPartyDialog("Korgan")~ THEN @4
==KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @5
== PLAYER1 IF ~IsValidForPartyDialog("Nalia")~ THEN @6
==NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @7
==PLAYER1 IF ~IsValidForPartyDialog("Jan")~ THEN  @8
==JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @9
==PLAYER1 IF ~IsValidForPartyDialog("Keldorn")~ THEN @10
==KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @11
==PLAYER1 IF ~IsValidForPartyDialog("HaerDalis")~ THEN @12

==HAERDAJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @13
==PLAYER1 IF ~IsValidForPartyDialog("Anomen")~ THEN @14
==ANOMENJ  IF ~IsValidForPartyDialog("Anomen")~ THEN @15
==PLAYER1 IF ~IsValidForPartyDialog("Cernd")~ THEN @16
==CERNDJ IF ~IsValidForPartyDialog("Cernd")~ THEN @17
==PLAYER1 IF ~IsValidForPartyDialog("Valygar")~ THEN @18
==VALYGARJ IF ~IsValidForPartyDialog("Valygar")~ THEN @19
==PLAYER1 IF ~IsValidForPartyDialog("Mazzy")~ THEN @20
==MAZZYJ IF ~IsValidForPartyDialog("Mazzy")~ THEN @21
==PLAYER1 IF ~IsValidForPartyDialog("Hexxat")~ THEN @22
==IMOEN2 IF ~IsValidForPartyDialog("Hexxat")~ THEN @23
== HEXXATJ IF ~IsValidForPartyDialog("Hexxat")~ THEN @24

END IF ~OR(7)
	IsValidForPartyDialog("Minsc")
	IsValidForPartyDialog("Jaheira")
	IsValidForPartyDialog("Viconia")
	IsValidForPartyDialog("Edwin")
	IsValidForPartyDialog("Neera")
	IsValidForPartyDialog("Dorn")
	IsValidForPartyDialog("Rasaad")~ THEN REPLY @25 EXTERN IMOEN2 MRIntroductionsOld
	IF ~!IsValidForPartyDialog("Minsc")
	!IsValidForPartyDialog("Jaheira")
	!IsValidForPartyDialog("Viconia")
	!IsValidForPartyDialog("Edwin")
	!IsValidForPartyDialog("Neera")
	!IsValidForPartyDialog("Dorn")
	!IsValidForPartyDialog("Rasaad")~ THEN REPLY @26 EXTERN IMOEN2 MRIntroductionsJM2
	
CHAIN IMOEN2 MRIntroductionsOld
@27
==IMOEN2 IF ~IsValidForPartyDialog("Neera")~ THEN @28
== NEERAJ IF ~IsValidForPartyDialog("Neera")~ THEN @29
==IMOEN2 IF ~IsValidForPartyDialog("Dorn")~ THEN @30
== DORNJ IF ~IsValidForPartyDialog("Dorn")~ THEN @31
==IMOEN2 IF ~IsValidForPartyDialog("Rasaad")~ THEN @32
== RASAADJ IF ~IsValidForPartyDialog("Rasaad")~ THEN @33
== IMOEN2 IF ~IsValidForPartyDialog("Jaheira")~ THEN @34
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @35
== IMOEN2 IF ~IsValidForPartyDialog("Jaheira")~ THEN @36
== IMOEN2 IF ~IsValidForPartyDialog("Minsc")~ THEN @37
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @38 
== IMOEN2 IF ~IsValidForPartyDialog("Minsc")~ THEN @39
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @40
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @41
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @42
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @43
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @44
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @45
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @46
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @47
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @48
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @49
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @50
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @51
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @52
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @53
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @54
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @55
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @56
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @57
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @58
== EDWINJ IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @59
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @60
== EDWINJ IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @61
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @62
== EDWINJ IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @63
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @64
END IMOEN2 MRIntroductionsOldNext