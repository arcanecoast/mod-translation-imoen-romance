BEGIN ~MRYWin~
BEGIN ~MRJaenya~
BEGIN ~MRTarren~
BEGIN ~MRNevea~
BEGIN ~MRYIm~
BEGIN ~MRKiller~

// This is a talk with Solar about Imoen's past. It starts as an additional option right before Solar is about to show you yours.
// Fully implemented as far as I can tell

// There is a post-event talk at the end of this file that needs to be triggered
//After Yaga Shura

ADD_TRANS_TRIGGER SOLAR 20 ~OR(3) Global("ImoenRomanceActive","GLOBAL",0) !InParty("Imoen2") Dead("Imoen2")~ DO 0 1

EXTEND_BOTTOM SOLAR 20
IF ~!Global("ImoenRomanceActive","GLOBAL",0) InParty("Imoen2") !Dead("Imoen2")~  THEN REPLY @0 EXTERN Solar SolIm
END


APPEND SOLAR
IF ~~ THEN SolIm
  SAY @1
  ++ @2 + SI5
  + ~Global("ImoenRomanceActive","GLOBAL",2)~ + @3 + SI4
  ++ @4 + SI3
  ++ @5 + SI2
  ++ @6 +SI3
  ++ @7 + SI1
END

IF ~~ THEN SI1
  SAY @8
  IF ~~ THEN GOTO SolIm2
END

IF ~~ THEN SI2
  SAY @9
  IF ~~ THEN GOTO SolIm2
END

IF ~~ THEN SI3
  SAY @10
  IF ~~ THEN GOTO SolIm2
END

IF ~~ THEN SI4
  SAY @11
  IF ~~ THEN GOTO SolIm2
END

IF ~~ THEN SI5
  SAY @11
  IF ~~ THEN GOTO 22
END

IF ~~ THEN SolIm2
  SAY @12
  = @13
  IF ~~ THEN DO ~SetGlobal("IRTSolarPast","GLOBAL",1) StartCutSceneMode() StartCutScene("IRSola01")~ EXIT

// Cutscene: Camera pans to Imoen, Imoen moans and approaches the PC, then starts dialogue

END
END



CHAIN IF WEIGHT #1 ~Global("IRTSolarPast","GLOBAL",1)~ THEN IMOEN25J SolIm3
	@14 DO ~SetGlobal("IRTSolarPast","GLOBAL",2)~
	= @15
	== SOLAR @16
END SOLAR 22

//we dont want this option appearing if mod is installed.
ADD_TRANS_TRIGGER SOLAR 29 ~!Global("IRTSolarPast","GLOBAL",2)~ DO 0

EXTEND_BOTTOM SOLAR 29
	IF ~Global("IRTSolarPast","GLOBAL",2)~ THEN REPLY @17 EXTERN IMOEN25J SolIm5
	IF ~Global("IRTSolarPast","GLOBAL",2)~ THEN REPLY @18 EXTERN IMOEN25J SolIm5
	IF ~Global("IRTSolarPast","GLOBAL",2)~ THEN REPLY @19 GOTO 30
END

CHAIN IMOEN25J SolIm5
	@20
	== SOLAR @21
	== IMOEN25J @22
	== SOLAR @23
DO ~SetGlobal("IRTImoenPast","GLOBAL",1) StartCutSceneMode() StartCutScene("IRSola02")~ EXIT

// Cutscene: Imoen's mother appears.


CHAIN IF WEIGHT #1 ~Global("IRTImoenPast","GLOBAL",1)~ THEN MRJaenya Past1
	@24
	= @25
	== SOLAR @26
	== MRJaenya @27
	= @28
	= @29
	= @30
	= @31
	= @32 DO ~SetGlobal("IRTImoenPast","GLOBAL",2) StartCutSceneMode() StartCutScene("IRSola03")~ 
EXIT

// Cutscene: Young Winthrop appears, along with his two adventuring partners. One woman, two men in total. Nevea is a mage, Tarren is sword and shield warrior, Winthrop is dual wielding rogue.



CHAIN IF WEIGHT #1 ~Global("IRTImoenPast","GLOBAL",2)~ THEN MRNevea Past2
	@33
	== MRYWin @34
	== MRTarren @35
	== MRNevea @36
	== MRJaenya @37
	== MRNevea @38
	== MRYWin @39
	== MRJaenya @40
	== MRTarren @41
	== MRYWin @42
	== MRJaenya @43
	== MRTarren @44
	== MRNevea @45
	== MRYWin @46
	== MRTarren @47
DO ~SetGlobal("IRTImoenPast","GLOBAL",3) StartCutSceneMode() StartCutScene("IRSola04")~ EXIT

CHAIN IF WEIGHT #-1 ~Global("IRTImoenPast","GLOBAL",3)~ THEN MRNevea PATATA
	@48
DO ~SetGlobal("IRTImoenPast","GLOBAL",4) StartCutSceneMode() StartCutScene("IRSola05")~ EXIT

CHAIN IF WEIGHT #-1 ~Global("IRTImoenPast","GLOBAL",4)~ THEN MRYWin PATATA2
	@49
	== MRJaenya @50
DO ~SetGlobal("IRTImoenPast","GLOBAL",5) StartCutSceneMode() StartCutScene("IRSola06")~ EXIT

// Cutscene: Camera pans to Tarren, Ghosts emerge from their bodies

CHAIN IF WEIGHT #-1 ~Global("IRTImoenPast","GLOBAL",5)~ THEN MRNevea PATATA3
	@51
	== MRTarren @52
DO ~SetGlobal("IRTImoenPast","GLOBAL",6) StartCutSceneMode() StartCutScene("IRSola07")~ EXIT

// Cutscene: Both disappear

CHAIN IF WEIGHT #-1 ~Global("IRTImoenPast","GLOBAL",6)~ THEN MRYWin PATATA4
	@53
= @54
	= @55
	== MRJaenya @56
	= @57
	== MRYWin @58
DO ~SetGlobal("IRTImoenPast","GLOBAL",7) StartCutSceneMode() StartCutScene("IRSola08")~ EXIT

// Cutscene: Jaenya and Winthrop teleport to be next to each other. Young Imoen appears.

CHAIN IF WEIGHT #-1 ~Global("IRTImoenPast","GLOBAL",7)~ THEN MRYWin PATATA5
	@59
	== MRYIm @60
	== MRJaenya @61
	== MRYIm @62
	== MRJaenya @63
	== MRYIm @64
	== MRYWin @65
	== MRJaenya @66
DO ~SetGlobal("IRTImoenPast","GLOBAL",8) StartCutSceneMode() StartCutScene("IRSola09")~ EXIT

// Cutscene: The deathstalker appears.

CHAIN IF WEIGHT #-1 ~Global("IRTImoenPast","GLOBAL",8)~ THEN MRKiller PATATA6
	@67
	== MRYWin @68
	== MRKiller @69
	== MRJaenya @70
	== MRYIm @71
	== MRYWin @72
	== MRKiller @73
	== MRJaenya @74
	== MRYWin @75
	== MRJaenya @76
	== MRYWin @77
	== MRYIm @78
	== MRYWin @79
	== MRJaenya @80
DO ~SetGlobal("IRTImoenPast","GLOBAL",9) StartCutSceneMode() StartCutScene("IRSola10")~ EXIT

// Cutscene: Jaenya dies and Winthrop collapses, Gorion appears.

CHAIN IF WEIGHT #-1 ~Global("IRTImoenPast","GLOBAL",9)~ THEN d1gori PATATA7
	@81
DO ~SetGlobal("IRTImoenPast","GLOBAL",10) StartCutSceneMode() SmallWait(8) ActionOverride("MRYWin2",PlayDeadInterruptable(1)) Wait(2) ActionOverride("MRYWin2",StartDialogNoSet("MRYWin2"))~ EXIT

// Cutscene: Winthrop gets back up

CHAIN IF WEIGHT #-1 ~Global("IRTImoenPast","GLOBAL",10)~ THEN MRYWin PATATA7a
	@82
	== d1gori @83
	== MRYWin @84
	= @85
	== d1gori @86
	== MRYWin @87
	== d1gori @88
	== MRYWin @89
	== d1gori @90
	== MRYWin @91
	== d1gori @92
	== MRYWin @93
DO ~SetGlobal("IRTImoenPast","GLOBAL",11) StartCutSceneMode()  StartCutScene("IRSola12")~ EXIT

// Cutscene: Winthrop turns into a fat man

CHAIN IF WEIGHT #-1 ~Global("IRTImoenPast","GLOBAL",11)~ THEN MRYWin PATATA8
	@94
	== d1gori @95
	= @96
DO ~SetGlobal("IRTImoenPast","GLOBAL",12) StartCutSceneMode() StartCutScene("IRSola11")~ EXIT

// Cutscene: Everyone disintegrates, camera pans to Solar.

CHAIN IF WEIGHT #-1 ~Global("IRTImoenPast","GLOBAL",12)~ THEN SOLAR PATATA9
	@97
	= @98
	DO ~SetGlobal("IRTImoenPast","GLOBAL",13) ActionOverride("Imoen2",SetDialog("IMOEN25J"))~
END SOLAR 30




// Post event talk
// Triggers just as the party returns to normal, some five to ten seconds after Melissan goes away


APPEND IMOEN25J
IF WEIGHT #0 ~Global("IRTPostPastTalk","GLOBAL",1)~ THEN PP
	SAY @99
	IF ~Global("IRTImoenPast","GLOBAL",13)~ THEN DO ~SetGlobal("IRTPostPastTalk","GLOBAL",2)~ GOTO PPImoen
	IF ~!Global("IRTImoenPast","GLOBAL",13)~ THEN DO ~SetGlobal("IRTPostPastTalk","GLOBAL",2)~ GOTO PPNoImoen
END

IF ~~ THEN PPImoen
	SAY @100
	++ @101 + PPI0
	++ @102 + PPI1
	++ @103 + PPI3
	++ @104 + PPI4
	++ @105 + PPI5
	++ @106 + PPI6
END

IF ~~ THEN PPI0
	SAY @107
	= @108
	= @109
	++ @110 + PPI0a
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @111 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",2)~ + PPI0b
	+ ~!Global("ImoenRomanceActive","GLOBAL",2)~ + @112 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",2)~ + PPI0c
	++ @113 + PPI0d
	++ @114 + PPI0e
	++ @115 + PPI0f
END

IF ~~ THEN PPI0a
	SAY @116
	= @117
	IF ~~ THEN EXIT
END

IF ~~ THEN PPI0b
	SAY @118
	IF ~~ THEN EXIT
END

IF ~~ THEN PPI0c
	SAY @119
	IF ~~ THEN EXIT
END

IF ~~ THEN PPI0d
	SAY @120
	= @121
	= @122
	= @123
	IF ~~ THEN EXIT
END

IF ~~ THEN PPI0e
	SAY @124
	= @125
	IF ~~ THEN EXIT
END

IF ~~ THEN PPI0f
	SAY @126
	IF ~~ THEN EXIT
END
	
IF ~~ THEN PPI1
	SAY @127
	= @128
	IF ~~ THEN GOTO PPIN
END
	
IF ~~ THEN PPI2
	SAY @129
	= @130
	IF ~~ THEN GOTO PPIN
END
	
IF ~~ THEN PPI3
	SAY @131
	++ @132 + PPI3a
	++ @133 + PPI3a
	++ @134 + PPI3b
	++ @135 + PPI3c
END

IF ~~ THEN PPI3a
	SAY @136
	= @137
	= @138
	IF ~~ THEN EXIT
END

IF ~~ THEN PPI3b
	SAY @139
	= @140
	= @141
	IF ~~ THEN GOTO PPIN
END

IF ~~ THEN PPI3c
	SAY @142
	= @143
	= @144
	IF ~~ THEN EXIT
END

IF ~~ THEN PPI4
	SAY @145
	= @146
	= @147
	IF ~~ THEN GOTO PPIN
END

IF ~~ THEN PPI5
	SAY @148
	= @149
	= @147
	IF ~~ THEN GOTO PPIN
END
	
IF ~~ THEN PPI6
	SAY @150
	= @151
	= @152
	IF ~~ THEN EXIT
END

IF ~~ THEN PPIN
	SAY @153
	= @154
	++ @155 + PPIN1	
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @156 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",3)~ + PPIN2
	+ ~!Global("ImoenRomanceActive","GLOBAL",2)~ + @157 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",3)~ + PPIN3
	++ @158 + PPIN4
	++ @159 + PPIN5
END

IF ~~ THEN PPIN1
	SAY @160
	IF ~~ THEN EXIT
END

IF ~~ THEN PPIN2
	SAY @161
	= @162
	= @163
	= @164
	= @165
	IF ~~ THEN EXIT
END
	
IF ~~ THEN PPIN3
	SAY @166
	= @167
	= @168
	= @169
	IF ~~ THEN EXIT
END

IF ~~ THEN PPIN4
	SAY @170	
	= @171
	= @172
	++ @173 + PPIN1	
	+ ~Global("ImoenRomanceActive","GLOBAL",2)~ + @156 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",3)~ + PPIN2
	+ ~!Global("ImoenRomanceActive","GLOBAL",2)~ + @157 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",3)~ + PPIN3
	++ @174 + PPIN5
END
	
IF ~~ THEN PPIN5
	SAY @175
	= @176
	IF ~~ THEN EXIT
END


IF ~~ THEN PPNoImoen
	SAY @177
	++ @101 + PPNI1
	++ @102 + PPNI2
	++ @178 + PPNI3
	++ @179 + PPNI4
	++ @180 + PPNI5
END

IF ~~ THEN PPNI1
	SAY @181
	IF ~~ THEN GOTO PPNIEnd
END

IF ~~ THEN PPNIEnd
	SAY @182
	= @109
	IF ~~ THEN EXIT
END

IF ~~ THEN PPNI2
	SAY @183
	IF ~~ THEN GOTO PPNIEnd
END

IF ~~ THEN PPNI3
	SAY @184
	= @185
	= @186
	= @187
	IF ~~ THEN EXIT
END

IF ~~ THEN PPNI4
	SAY @188
	= @189
	IF ~~ THEN GOTO PPNIEnd
END

IF ~~ THEN PPNI5
	SAY @190
	IF ~~ THEN GOTO PPNIEnd
END
END

