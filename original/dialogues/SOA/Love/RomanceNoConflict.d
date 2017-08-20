/*the idea is that this is to be compiled with romanceContent, pidtree, qualityimes, bitalk */

APPEND IMOEN2J

	IF ~~ THEN BEGIN MRResolution1
		SAY @0
		= ~<CHARNAME> what happened between us... I've been thinking about it a lot.~ [ MRImRom1 ]
		= @2
      = @3
		= @4
		++ @5 GOTO MRResolution2-Friends
		++ @6 GOTO MRResolution2-Explode
		++ @7 GOTO MRResolution2-Aggressive
		++ @8 GOTO MRResolution2-Love
		IF ~CheckStatGT(Player1,13,CHR)~ THEN REPLY @9 GOTO MRResolution2-HighCha
		IF ~!CheckStatGT(Player1,13,CHR)~ THEN REPLY @9 GOTO MRResolution2-LowCha
		++ @10 GOTO MRResolution2-Toy
	   ++ @11 GOTO MRResolutionDoneWithYou
	END
END