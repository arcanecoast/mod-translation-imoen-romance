//*** Jaheira ***//

/* Jaheira reaction Dialog #1 */

CHAIN 
IF ~InParty("Jaheira")
See("Jaheira")
!Global("MRSleptImoen","GLOBAL",1)
Global("ImoenRomanceActive","GLOBAL",1)
Global("MRJaheiraIncest","LOCALS",0)
!StateCheck("Jaheira",CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
 !ActuallyInCombat()
 ~ THEN BIMOEN2 MRJaheiraReact1
@0
DO ~SetGlobal("MRJaheiraIncest","LOCALS",1)~
==BJAHEIR @1
==BIMOEN2 @2
==BJAHEIR @3
==BIMOEN2 @4
==BJAHEIR @5
==BIMOEN2 @6
==BJAHEIR @7
==BIMOEN2 @8
EXIT

/* Jaheira reaction Dialog #2 */
/* Triggers sometime after, if the sex scene hasn't happened yet */

CHAIN 
IF ~InParty("Jaheira")
	See("Jaheira")
	!Global("MRSleptImoen","GLOBAL",1)
	Global("MRJaheiraIncest","LOCALS",1)
	Global("ImoenRomanceActive","GLOBAL",1)
	!StateCheck("Jaheira",CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
 !ActuallyInCombat()~ THEN BIMOEN2 MRJaheiraReact2
@9
DO ~SetGlobal("MRJaheiraIncest","LOCALS",2)~
==BJAHEIR @10
==BIMOEN2 @11
==BJAHEIR @12
==BJAHEIR @13
==BIMOEN2 @14
==BJAHEIR @15 
==BIMOEN2 IF ~Gender(Player1,MALE)~ THEN @16
==BIMOEN2 IF ~Gender(Player1,FEMALE)~ THEN @17
==BJAHEIR IF ~Gender(Player1,MALE)~ THEN @18
==BJAHEIR IF ~Gender(Player1,FEMALE)~ THEN @19 
==BIMOEN2 @20
==BJAHEIR @21
==BIMOEN2 @22
==BJAHEIR @23
EXIT


/* Jaheira reaction Dialog #3 */
/* if the sex scene hasn't happened yet */

CHAIN IF ~
	InParty("Jaheira")
	See("Jaheira")
	!Global("MRSleptImoen","GLOBAL",1)
	Global("MRJaheiraIncest","LOCALS",2)
	Global("ImoenRomanceActive","GLOBAL",1)
	!StateCheck("Jaheira",CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
 !ActuallyInCombat()~ THEN BIMOEN2 MRJaheiraReact3
@24
DO ~SetGlobal("MRJaheiraIncest","LOCALS",3)~
==BJAHEIR @25
==BIMOEN2 @26
==BJAHEIR @27
==BIMOEN2 @28
==BJAHEIR @29
==BIMOEN2 @30
==BJAHEIR @31
==BIMOEN2 @32
==BJAHEIR @33
==BIMOEN2 @34
==BJAHEIR @35
EXIT


/* Jaheira reaction Dialog #4 */
/* Triggers only if all of the previous dialogs occurred, and after the sex scene: Global("MRSleptImoen","GLOBAL",1) and after her initial reaction to it */

CHAIN IF ~InParty("Jaheira")
	See("Jaheira")
	Global("MRSleptImoen","GLOBAL",1)
	Global("MRJaheiraReaction","GLOBAL",2)
	!Global("MRJaheiraIncest","LOCALS",4)
	Global("ImoenRomanceActive","GLOBAL",1)
	!StateCheck("Jaheira",CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
 !ActuallyInCombat()~ THEN BIMOEN2 MRJaheiraReact4
@36
DO ~SetGlobal("MRJaheiraIncest","LOCALS",4)~
==BJAHEIR IF ~Gender(Player1,MALE)~ THEN @37
==BJAHEIR IF ~Gender(Player1,FEMALE)~ THEN @38
==BIMOEN2 @39
==BJAHEIR @40
==BIMOEN2 @41
==BJAHEIR @42
==BIMOEN2 @43
==BJAHEIR @44
==BIMOEN2 @45
EXIT


/* Comment on the Death of Khalid -- Must be the first banter Imoen has with Jaheira, preferably in Spellhold */
/* Only if both are ValidForPartyDialog, of course */

CHAIN
IF ~InParty("Jaheira")
See("Jaheira")
Global("MRJaheiraIncest","LOCALS",0)
Global("MRJaheiraMiss","LOCALS",0)
!StateCheck("Jaheira",CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
 !ActuallyInCombat()~ THEN BIMOEN2 MRDeathKhalid
@46
DO ~SetGlobal("MRJaheiraMiss","LOCALS",1)~
==BJAHEIR @47
==BIMOEN2 @48
==BJAHEIR @49
==BIMOEN2 @50
==BJAHEIR @51
==BIMOEN2 @52
==BJAHEIR @53
==BIMOEN2 @54
==BIMOEN2 @55
== BJAHEIR @56
EXIT


/* Viconia banter #1 */

CHAIN
IF ~InParty("Imoen2")
See("Imoen2")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
 !ActuallyInCombat()
Global("MRViconiaKnives","LOCALS",0)~ THEN BVICONI MRViconiaTalk
@57
DO ~SetGlobal("MRViconiaKnives","LOCALS",1)~
==BIMOEN2 @58
==BVICONI @59
==BIMOEN2 @60
==BVICONI @61

EXIT

/* Viconia banter #2 */

CHAIN
IF ~InParty("Imoen2")
See("Imoen2")
!Global("BodhiDead","GLOBAL",1)
Global("MRViconiaSoul","LOCALS",0)
!StateCheck("Imoen2",CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
 !ActuallyInCombat()~ THEN BVICONI MRViconiaTalk2
@62
DO ~SetGlobal("MRViconiaSoul","LOCALS",1)~
==BIMOEN2 @63
==BVICONI @64
==BIMOEN2 @65
==BIMOEN2 @66
==BVICONI @67
EXIT

/* Viconia banter #3 */

CHAIN
IF ~InParty("Imoen2")
See("Imoen2")
Global("MRViconiaTorture","LOCALS",0)
Global("MRViconiaKnives","LOCALS",1)
!StateCheck("Imoen2",CD_STATE_NOTVALID)
 !StateCheck(Myself,CD_STATE_NOTVALID)
 !ActuallyInCombat()~ THEN BVICONI MRViconiaTalk3
@68
DO ~SetGlobal("MRViconiaTorture","LOCALS",1)~
==BIMOEN2 @69
==BVICONI @70
==BVICONI @71
==BIMOEN2 @72
EXIT
