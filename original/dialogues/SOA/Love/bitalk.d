APPEND IMOEN2J
	IF ~~ THEN BEGIN MRPhaereBiTalk
		SAY @0
			++ @1 GOTO MRPhaereBiTalk2
			++ @2 GOTO MRPhaereBiTalkBlunt
			++ @3 EXIT
	END

	IF ~~ THEN BEGIN MRPhaereBiTalkBlunt
		SAY @4
		IF ~Gender(Player1,MALE)~ THEN REPLY @5 GOTO MRPhaereBiTalkBoyfriend
		++ @6 + MRPhaereBiTalk2
		++ @7 + MRPhaereBiTalkRefuse
	END

	IF ~~ THEN BEGIN MRPhaereBiTalk2
		SAY @8
			++ @9 GOTO MRPhaereBiTalk3
			++ @10 GOTO MRPhaereBiTalkEnd2
			IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @11 GOTO MRPhaereBiTalkEnd1
			IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @11 EXIT
	END

	IF ~~ THEN BEGIN MRPhaereBiTalk3
		SAY @12
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN GOTO MRPhaereBiTalkRudeLove
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN GOTO MRPhaereBiTalkRudeFriend
	END

	IF ~~ THEN BEGIN MRPhaereBiTalkBoyfriend
		SAY @13
			IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @14 GOTO MRPhaereBiTalkRudeLove
			IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @14 GOTO MRPhaereBiTalkRudeFriend
			++ @15 GOTO MRPhaereBiTalkRudeFriend
			IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @16 GOTO MRPhaereBiTalkEnd1
			IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @16 EXIT
	END


	IF ~~ THEN BEGIN MRPhaereBiTalkRefuse
		SAY @17
			IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @15 GOTO MRPhaereBiTalkRudeLove
			IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @15 GOTO MRPhaereBiTalkRudeFriend
			++ @18 GOTO MRPhaereBiTalkEnd2
			IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @16 GOTO MRPhaereBiTalkEnd1
			IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @16 EXIT
	END

	IF ~~ THEN BEGIN MRPhaereBiTalkRudeLove
		SAY @19
		++ @20 + MRSweetTalker
		++ @21 GOTO MRPhaereBiTalkEnd2
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @16 GOTO MRPhaereBiTalkEnd1
		++ @22 GOTO MRPhaereBiTalkEnd2
	END

	IF ~~ THEN BEGIN MRPhaereBiTalkRudeFriend
		SAY @23
		++ @21 GOTO MRPhaereBiTalkEnd2
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @16 GOTO MRPhaereBiTalkEnd1
		++ @22 GOTO MRPhaereBiTalkEnd2
	END
	
	IF ~~ THEN BEGIN MRPhaereBiTalkEnd2
		SAY @24
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRPhaereBiTalkEnd1
		SAY @25
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRSweetTalker
		SAY @26 
		IF ~~ THEN GOTO MRSweetTalker2
	END

	IF ~~ THEN BEGIN MRSweetTalker2
		SAY @27
		=
		@28
		=
		@29
		=
		@30
		IF ~~ THEN EXIT
	END
END