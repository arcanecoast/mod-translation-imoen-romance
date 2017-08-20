// Imoen will tease other vanilla NPCs if they are sleeping with the PC
// Won't do it for the EE version characters because we don't care about them
// note: all dialogue was appended to B(NAME)25 files


/* Trigger globals: 
IRTTeaseAerieRom = 1
IRTTeaseJaheiraRom = 1
IRTTeaseViconiaRom = 1
IRTTeaseAnomenRom = 1
*/

// Aerie

CHAIN IF WEIGHT #500 ~Global("AerieRomanceActive","GLOBAL",2) Global("IRTTeaseAerieRom","GLOBAL",0) See("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty(Myself)
		InParty("Aerie")
		!ActuallyInCombat()~ THEN BIMOEN25 TeaseAer
	~So Aerie, you've been beddin' my <PRO_BROTHERSISTER> for a while. How's that workin' for ya?~ [ IRQUIET ] DO ~SetGlobal("IRTTeaseAerieRom","GLOBAL",1)~
	== BAERIE25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @1
	== BIMOEN25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @2
	== BIMOEN25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @3
	== BAERIE25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @4
	== BIMOEN25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @5
	== BAERIE25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @6

	== BAERIE25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @7

	== BIMOEN25 @8
	== BAERIE25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @9
	== BIMOEN25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @10
	== BAERIE25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @11
	== BIMOEN25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @12
	== BAERIE25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @13
	== BIMOEN25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @14
	== BAERIE25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @15

	== BAERIE25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @16
	== BIMOEN25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @17
	== BAERIE25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @18
	== BIMOEN25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @19
	== BAERIE25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @20
	== BIMOEN25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @21
	== BAERIE25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @22

	== BIMOEN25 @23
	== BAERIE25 @24
	== BIMOEN25 @25
	= @26
	= @27

	== BAERIE25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @28
	== BIMOEN25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @29
	== BAERIE25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @30
	== BIMOEN25 IF ~!GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @31

	== BAERIE25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @32
	== BAERIE25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @33
	== BIMOEN25 IF ~GlobalGT("IRTImAerTalks","GLOBAL",1)~ THEN @34
EXIT



// Jaheira

CHAIN IF WEIGHT #500 ~Global("JaheiraRomanceActive","GLOBAL",2) Global("IRTTeaseJaheiraRom","GLOBAL",0) See("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty(Myself)
		InParty("Jaheira")
		!ActuallyInCombat()~ THEN BIMOEN25 TeaseJah
	~So Jaheira, you've been beddin' my <PRO_BROTHERSISTER> for a while. How's that workin' for ya?~ [ IRQUIET ] DO ~SetGlobal("IRTTeaseJaheiraRom","GLOBAL",1)~
	== BJAHEI25 @36
	== BIMOEN25 @37
	== BJAHEI25 @38
	== BIMOEN25 @39
	== BJAHEI25 @40
		== BIMOEN25 @41
	== BJAHEI25 @42
	== BIMOEN25 @43
	== BJAHEI25 @44
	== BIMOEN25 @45
EXIT


// Viconia

CHAIN IF WEIGHT #500 ~ Global("IRTTeaseViconiaRom","GLOBAL",0) Global("ViconiaRomanceActive","GLOBAL",2) See("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty(Myself)
		InParty("Viconia")
		!ActuallyInCombat()~ THEN BIMOEN25 TeaseVic
	~So Viconia, you've been beddin' my <PRO_BROTHERSISTER> for a while. How's that workin' for ya?~ [ IRQUIET ] DO ~SetGlobal("IRTTeaseViconiaRom","GLOBAL",1)~
	== BVICON25 @47
	== BIMOEN25 @48
	== BVICON25 @49
	== BIMOEN25 @50
	= @51
	== BVICON25 @52
	== BIMOEN25 @53
	== BVICON25 @54
	== BIMOEN25 @55
EXIT

// Anomen

CHAIN IF WEIGHT #500 ~Global("AnomenRomanceActive","GLOBAL",2) Global("IRTTeaseAnomenRom","GLOBAL",0) See("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty(Myself)
		InParty("Anomen")
		!ActuallyInCombat()~ THEN BIMOEN25 TeaseAno
	~So Anomen, you've been beddin' my <PRO_BROTHERSISTER> for a while. How's that workin' for ya?~ [ IRQUIET ] DO ~SetGlobal("IRTTeaseAnomenRom","GLOBAL",1)~
	== BANOME25 @57
	== BIMOEN25 @58
	== BANOME25 @59
	== BIMOEN25 @60
	== BANOME25 @61
	== BIMOEN25 @62
EXIT




























