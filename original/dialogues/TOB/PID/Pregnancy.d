// This is a conversation initiated through PID by a male protagonist
// who wants to talk children with a romanced Imoen.
// Available after first of Senda/Abazigal dead and solar talk


// Trigger global: IRTPregnancyTalk = 1
// A global is set here that is taken into account for epilogues if the main character is male
// "IRTInSyncChildren","GLOBAL",1
// It's only set if the player and Imoen have the same views on the issue

/*
PID option:
+ ~Global("IRTPregnancyTalk","GLOBAL",1)~ + ~Could we talk for a minute? What do you think about ever having children?~ DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRTPregnancyTalk","GLOBAL",2)~ GOTO Preg1
*/


APPEND IMOEN25J
IF ~~ Preg1
   SAY @0
   = @1
   + ~CheckStatGT(Player1,10,INT)~ + @2 + PregEnd2
   + ~!CheckStatGT(Player1,10,INT)~ + @3 + PregEnd2
   ++ @4 + PregWorry
   ++ @5 + PregYes
   ++ @6 + PregNo
   ++ @7 + PregDoubt
   ++ @8 + PregEnd
END

IF ~~ PregEnd
   SAY @9
   IF ~~ THEN EXIT
END

IF ~~ PregEnd2
   SAY @10
   IF ~~ THEN EXIT
END

IF ~~ PregDoubt
   SAY @11
   IF ~~ THEN DO ~SetGlobal("IRTInSyncChildren","GLOBAL",1)~ GOTO PregAgree
END

IF ~~ PregNo
   SAY @12
   IF ~~ THEN DO ~SetGlobal("IRTInSyncChildren","GLOBAL",1)~ GOTO PregAgree
END

IF ~~ PregYes
   SAY @13
   IF ~~ THEN GOTO PregDisagree
END

IF ~~ PregAgree
   SAY @14
   ++ @15 + PregAgree5
   ++ @16 + PregAgree4
   ++ @17 + PregAgree3
   ++ @18 + PregAgree2
   ++ @19 + PregAgree1
   ++ @20 + PregAgree0
END

IF ~~ PregAgree0
   SAY @21
   IF ~~ THEN GOTO PregReasonAgree
END

IF ~~ PregAgree1
   SAY @22
   IF ~~ THEN GOTO PregReasonAgree
END

IF ~~ PregAgree2
   SAY @23
   IF ~~ THEN GOTO PregReasonAgree
END

IF ~~ PregAgree3
   SAY @24
   IF ~~ THEN GOTO PregReasonAgree
END

IF ~~ PregAgree4
   SAY @25
   IF ~~ THEN GOTO PregReasonAgree
END

IF ~~ PregAgree5
   SAY @26
   = @27
   IF ~~ THEN EXIT
END

IF ~~ PregReasonAgree
   SAY @28
   = @29
   = @30
   = @27
   IF ~~ THEN EXIT
END

IF ~~ PregReasonDisagree
   SAY @28
   = @29
   ++ @31 + PregReasonArg2
   ++ @32 + PregReasonArg1
   ++ @33 + PregBioClock
   ++ @34 + PregDisagree3
   ++ @35 + PregDisagree2
   ++ @36 + PregDisagree1
END

IF ~~ PregBioClock
   SAY @37
   = @38
   = @39
   ++ @40 + PregReasonArg2
   ++ @41 + PregReasonArg1
   ++ @34 + PregDisagree3
   ++ @36 + PregDisagree1
END

IF ~~ PregReasonArg1
   SAY @42
   = @43
   = @44
   ++ @40 + PregReasonArg2
   ++ @45 + PregReasonArg3
   ++ @46 + PregDisagree3
   ++ @36 + PregDisagree1
END

IF ~~ PregReasonArg2
   SAY @47
   = @48
   = @49
   IF ~~ THEN GOTO PregUltimatum
END

IF ~~ PregReasonArg3
   SAY @50
   = @51
   IF ~~ THEN GOTO PregUltimatum
END

IF ~~ PregDisagree
   SAY @14
   ++ @52 + PregDisagree4
   ++ @53 + PregDisagree3
   ++ @35 + PregDisagree2
   ++ @36 + PregDisagree1
END

IF ~~ PregDisagree1
   SAY @54
   = @55
   IF ~~ THEN GOTO PregUltimatum
END

IF ~~ PregUltimatum
   SAY @56
   ++ @57 + PregUlti5
   ++ @58 + PregUlti4
   ++ @59 + PregUlti3
   ++ @60 + PregUlti2
   ++ @61 + PregUlti1
END

IF ~~ PregUlti1
   SAY @62
   ++ @63 + PregUlti1Loop
   ++ @64 + PregUlti4
   ++ @60 + PregUlti2
END

IF ~~ PregUlti1Loop
   SAY @65
   ++ @64 + PregUlti4
   ++ @60 + PregUlti2
END


IF ~~ PregUlti2
   SAY @66
   = @67
   = @68
   IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RunAwayFrom(Player1,50)~ EXIT
END

IF ~~ PregUlti3
   SAY @69
   = @70
   ++ @57 + PregUlti5
   ++ @71 + PregUlti4
   ++ @60 + PregUlti2
END

IF ~~ PregUlti4
   SAY @72
   IF ~~ THEN GOTO PregReversal
END

IF ~~ PregReversal
   SAY @73
   = @74
   ++ @75 + PregReversal3
   ++ @76 + PregReversal2
   ++ @77 + PregReversal1
   ++ @78 + PregUlti5a
END

IF ~~ PregReversal1
   SAY @79
   = @80
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ EXIT
END

IF ~~ PregReversal2
   SAY @81
   = @82
   = @27
   IF ~~ THEN DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-5)~ EXIT
END

IF ~~ PregReversal3
   SAY @83
   = @84
   = @27
   IF ~~ THEN EXIT
END

IF ~~ PregUlti5
   SAY @85
   = @86
   ++ @71 + PregUlti4
   ++ @60 + PregUlti2
   ++ @87 + PregUlti5a
END

IF ~~ PregUlti5a
   SAY @88
   = @89
   = @90
   IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RunAwayFrom(Player1,50)~ EXIT
END

IF ~~ PregDisagree2
   SAY @91
   ++ @92 + PregDisagree2d
   ++ @93 + PregDisagree2c
   ++ @94 + PregDisagree2b
   ++ @95 + PregDisagree2a
END

IF ~~ PregDisagree2a
   SAY @96
   = @97
   ++ @98 + PregDisagree2d
   ++ @99 + PregDisagree2c
   ++ @33 + PregBioClock
   ++ @100 + PregDisagree2b
   ++ @101 + PregDisagree2a1
END

IF ~~ PregDisagree2a1
   SAY @102
   IF ~~ THEN GOTO PregDisagree1
END

IF ~~ PregDisagree2b
   SAY @103
   = @104
   ++ @105 + PregAgree5
   ++ @106 + PregAgree4
   ++ @107 + PregAgree3
   ++ @108 + PregAgree2
   ++ @109 + PregDisagree2b1
END

IF ~~ PregDisagree2b1
   SAY @110
   IF ~~ THEN GOTO PregReasonDisagree
END

IF ~~ PregDisagree2c
   SAY @111
   = @112
   ++ @113 + PregDumb
   ++ @100 + PregDisagree2b
END

IF ~~ PregDumb
   SAY @114
   = @115
   = @116
   ++ @117 + PregDumbN
   ++ @118 + PregDisagree2b
   ++ @119 + PregDisagree2b
END

IF ~~ PregDumbN
   SAY @120
   = @121
   = @122
   = @123
   IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) RunAwayFrom(Player1,50)~ EXIT
END

IF ~~ PregDisagree2d
   SAY @124
   IF ~~ THEN GOTO PregReasonArg3
END

IF ~~ PregDisagree3
   SAY @125
   IF ~~ THEN GOTO PregReversal
END

IF ~~ PregDisagree4
   SAY @22
   IF ~~ THEN GOTO PregReasonDisagree
END

IF ~~ PregWorry
   SAY @126
   = @127
   = @128
   ++ @129 + PregEnd2
   ++ @130 + PregYes
   ++ @131 + PregNo
   ++ @132 + PregDoubt
   ++ @133 + PregCC
END

IF ~~ PregCC
   SAY @134
   = @135
   = @136
   ++ @137 + PregCC3
   ++ @138 + PregCC2
   ++ @139 + PregCC1
END

IF ~~ PregCC1
   SAY @140
   = @141
   ++ @142 + PregYes
   ++ @143 + PregNo
   ++ @144 + PregDoubt
   ++ @145 + PregEnd
END

IF ~~ PregCC2
   SAY @146
   ++ @142 + PregYes
   ++ @147 + PregNo
   ++ @148 + PregDoubt
   ++ @149 + PregEnd
END

IF ~~ PregCC3
   SAY @150
   = @151
   ++ @152 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-3)~ + PregCCDumb
   ++ @153 + PregYes
   ++ @6 + PregNo
   ++ @7 + PregDoubt
   ++ @8 + PregEnd
END

IF ~~ PregCCDumb
   SAY @154
   = @155
   = @156
   IF ~~ THEN EXIT
END


END















