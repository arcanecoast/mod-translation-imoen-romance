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
END IF ~OR(4)
	IsValidForPartyDialog("Minsc")
	IsValidForPartyDialog("Jaheira")
	IsValidForPartyDialog("Viconia")
	IsValidForPartyDialog("Edwin")~ THEN REPLY @22 EXTERN IMOEN2 MRIntroductionsOld
	IF ~!IsValidForPartyDialog("Minsc")
	!IsValidForPartyDialog("Jaheira")
	!IsValidForPartyDialog("Viconia")
	!IsValidForPartyDialog("Edwin")~ THEN REPLY @23 EXTERN IMOEN2 MRIntroductionsJM2
	
CHAIN IMOEN2 MRIntroductionsOld
@24
== IMOEN2 IF ~IsValidForPartyDialog("Jaheira")~ THEN @25
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @26
== IMOEN2 IF ~IsValidForPartyDialog("Jaheira")~ THEN @27
== IMOEN2 IF ~IsValidForPartyDialog("Minsc")~ THEN @28
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @29 
== IMOEN2 IF ~IsValidForPartyDialog("Minsc")~ THEN @30
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @31
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @32
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @33
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @34
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @35
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @36
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @37
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @38
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @39
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @40
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @41
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @42
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @43
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @44
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @45
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @46
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @47
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @48
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @49
== EDWINJ IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @50
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @51
== EDWINJ IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @52
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @53
== EDWINJ IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @54
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @55
END IMOEN2 MRIntroductionsOldNext