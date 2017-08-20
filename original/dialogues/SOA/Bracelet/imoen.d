APPEND PLAYER1
	IF ~Global("MRRingSellImoen","GLOBAL",1)~ THEN BEGIN MRBracelet // from:
	 SAY @0
         IF ~~ THEN DO ~ActionOverride(Player1,SetDialogue("Player1"))~ EXTERN MRWOMER MRWoman
	END
	
	IF ~~ THEN BEGIN MRBraceletGoAway
	   SAY @1
	   IF ~~ THEN EXIT
        END

	IF ~~ THEN BEGIN MRBraceletApproach
	 SAY @2
	 IF ~~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("MrWoCut1")
	~ EXIT
	END

	IF ~~ THEN BEGIN MRBraceletApproach1 // from:
	 SAY @3 
	 IF ~~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("MrWoCut1")
	~ EXIT
	END


	IF ~~ THEN BEGIN MRBraceletPlan // from: 194.0 193.0
	 SAY @4 
	 IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("MRWoCut2") ~ EXIT
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRBraceletIm // from:
	 SAY @5
	 =@6
	 IF ~~ THEN EXTERN MRWOMER MRWomanAnnoyed
	END


	IF ~~ THEN BEGIN MRBraceletElbow // from:
	 SAY @7
	 = @8
	 IF ~~ THEN EXTERN MRWOMER MRWomanNotice
	END
	
	IF ~~ THEN BEGIN MRPurse
	SAY@9
	IF ~~ THEN EXTERN MRWOMER MRAfterPurse
	END

	IF ~~ THEN BEGIN MRWomanPrice // from:
	 SAY @10
         = @11
         IF ~~ THEN EXTERN MRWOMER MRWomanPriceJade
    END

	IF ~~ THEN BEGIN MRWomanBuyRing // from: 1864.0
	 SAY @12
         = @13
	 IF ~~ THEN REPLY @14 GOTO MRBraceletDemand2
	 IF ~~ THEN REPLY @15 GOTO MRBraceletDemand2
	 IF ~OR(4)
	Global("AerieRomanceActive","GLOBAL",2)
	Global("JaheiraRomanceActive","GLOBAL",2)
	Global("ViconiaRomanceActive","GLOBAL",2)
	Global("AnomenRomanceActive","GLOBAL",2)
	!Global("ImoenRomanceActive","GLOBAL",2)
	~ THEN REPLY @16 GOTO MRBraceletDemand2
	 IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @17 GOTO MRBraceletDemand2
	 IF ~~ THEN REPLY @18 GOTO MRBraceletDemand2
	 IF ~~ THEN REPLY @19 GOTO MRBraceletDemand2
	END
 END
        
CHAIN
IMOEN2J MRBraceletDemand2
 @20
	 = @21
	 == MRWOMER @22
	 == IMOEN2J @23
	 == MRWOMER @24
	 == IMOEN2J @25
	 == IMOEN2J @26
	 == IMOEN2J @27
END IMOEN2J MRBraceletStole
 
 APPEND IMOEN2J
 IF ~~ THEN BEGIN MRBraceletStole
    SAY @28
    ++ @29 EXTERN MRWOMER MRHold
    ++ @30 EXTERN MRWOMER MRHold
    ++ @31 EXTERN MRWOMER MRHold
 END

IF ~~ THEN BEGIN MRHoldNot
   SAY @32
   = @33
	 IF ~NumInPartyGT(2)~ THEN GOTO MRBraceletParty
	 IF ~!NumInPartyGT(2)~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("MRWoCut3")~ EXIT
	END

	IF ~~ THEN BEGIN MRBraceletParty
	 SAY @34 
	 IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("MRWoCut3") ~ EXIT
	END

	IF ~Global("MRRingSellImoen","GLOBAL",5)~ THEN BEGIN MRBraceletSuccess // from:
	 SAY @35
	 IF ~~ THEN DO ~ActionOverride(Player1,GiveItemCreate("MRIMRIN1","Imoen2",0,0,0)) SetGlobal("MRRingSellImoen","GLOBAL",7) ActionOverride(Player1,SetDialogue("Player1"))~ GOTO MRBraceletSuccess2
	END

	IF ~~ THEN BEGIN MRBraceletSuccess2 // from: 1878.0
	 SAY @36
	 IF ~!IfValidForPartyDialogue("Keldorn") !IfValidForPartyDialogue("Mazzy") !IfValidForPartyDialogue("Jaheira") !IfValidForPartyDialogue("Aerie") !IfValidForPartyDialogue("Anomen") !IfValidForPartyDialogue("Edwin") !IfValidForPartyDialogue("Korgan")~ THEN GOTO MRBraceletSuccessAdmire
	 IF ~IfValidForPartyDialogue("Keldorn")
	~ THEN EXTERN ~KELDORJ~ MRBraceletSuccess
	 IF ~IfValidForPartyDialogue("Mazzy")
	~ THEN EXTERN ~MAZZYJ~ MRBraceletSuccess
	 IF ~IfValidForPartyDialogue("Jaheira")
	~ THEN EXTERN ~JAHEIRAJ~ MRBraceletSuccess
	 IF ~IfValidForPartyDialogue("Aerie")
	~ THEN EXTERN ~AERIEJ~ MRBraceletSuccess
	 IF ~IfValidForPartyDialogue("Anomen")
	~ THEN EXTERN ~ANOMENJ~ MRBraceletSuccess
	 IF ~IfValidForPartyDialogue("Edwin")
	~ THEN EXTERN ~EDWINJ~ MRBraceletSuccess
	END
END

CHAIN KELDORJ MRBraceletSuccess
@37
==IMOEN2J @38
==KELDORJ @39
END IMOEN2J MRBraceletSuccessAdmire

CHAIN MAZZYJ MRBraceletSuccess
@37
==IMOEN2J @40
== MAZZYJ @41
END IMOEN2J MRBraceletSuccessAdmire

CHAIN JAHEIRAJ MRBraceletSuccess
@37
==IMOEN2J @42
==JAHEIRAJ @43
END IMOEN2J MRBraceletSuccessAdmire

CHAIN AERIEJ MRBraceletSuccess
@44
==IMOEN2J @45
==AERIEJ @46
== IMOEN2J @47
END IMOEN2J MRBraceletSuccessAdmire

CHAIN ANOMENJ MRBraceletSuccess
 @37
==IMOEN2J @48
== ANOMENJ @41
END IMOEN2J MRBraceletSuccessAdmire

CHAIN EDWINJ MRBraceletSuccess
 @49
==IMOEN2J @50
==EDWINJ @51
== IMOEN2J @52
END IMOEN2J MRBraceletSuccessAdmire

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRBraceletSuccessAdmire // from: 2366.0 2363.0 2361.0 1879.0
	 SAY @53
         = @54
	 = @55
	 IF ~~ THEN GOTO MRBraceletAdmire
	END

	IF ~~ THEN BEGIN MRBraceletAdmire // from: 1882.0
	 SAY @56
	 IF ~~ THEN REPLY @57 GOTO MRBraceletRich
	 IF ~~ THEN REPLY @58 GOTO MRBraceletGuards
	 IF ~~ THEN REPLY @59 GOTO MRBraceletWorth
	 IF ~~ THEN REPLY @60 GOTO MRBraceletIdiot
	 IF ~~ THEN REPLY @61 GOTO MRBraceletEgg
	 IF ~~ THEN REPLY @62 GOTO MRBraceletGuilt
	END

        IF ~~ THEN BEGIN MRBraceletGuilt
         SAY @63
         = @64
         ++ @65 + MRBraceletGuilt1
         ++ @66 + MRBraceletGuilt2
         ++ @67 + MRBraceletGuilt3
        END
        
        IF ~~ THEN BEGIN MRBraceletGuilt1
           SAY @68
           = @69
           = @70
           IF ~~ THEN EXIT
        END

        IF ~~ THEN BEGIN MRBraceletGuilt2
           SAY @71
           = @72
           = @70
           IF ~~ THEN EXIT
        END

        IF ~~ THEN BEGIN MRBraceletGuilt3
           SAY @73
           = @74
           IF ~~ THEN EXIT
        END

	IF ~~ THEN BEGIN MRBraceletEgg
	 SAY @75
	    = @76
            = @70
           IF ~~ THEN EXIT
        END

	IF ~~ THEN BEGIN MRBraceletIdiot // from: 1883.3
	 SAY @77
         = @78
         = @79
           IF ~~ THEN EXIT
        END


	IF ~~ THEN BEGIN MRBraceletGuards // from: 1883.1
	 SAY @80
         = @81
	 IF ~~ THEN REPLY @82 GOTO MRBraceletRich
	 IF ~~ THEN REPLY @83 GOTO MRBraceletWorth
	 IF ~~ THEN REPLY @84 GOTO MRBraceletIdiot
	 IF ~~ THEN REPLY @85 GOTO MRBraceletEgg
	 IF ~~ THEN REPLY @86 GOTO MRBraceletGuilt
	END
	
	IF ~~ THEN BEGIN MRBraceletWorth
	SAY @87
	= @88
	IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRBraceletRich // from: 1884.0 1883.0
	SAY @89
	= @90
        = @91
        = @92
    IF ~~ THEN EXIT
    END

END