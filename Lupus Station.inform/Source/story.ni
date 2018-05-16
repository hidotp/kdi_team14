"Lupus Station" by Team14
Use MAX_STATIC_DATA of 100000000.

Spielabbruch is a text variable. Spielabbruch is "".
Weiter_spielen is truth state variable. Weiter_spielen is true.
Aktionen_mit_geraeusch is a number variable. Aktionen_mit_geraeusch is 0.

Innerer_Ring is a region.
Aeußerer_Ring is a region.

Maschinenkern is scenery.

<<<<<<< HEAD
Kontaminierter is a kind of thing. 
	A Kontaminierter is not portable.
=======
[]

>>>>>>> 6eb1a87283d2dccda4753718c28472405d6004fa

Panel is a kind of thing. A panel has a door called Zugehörige_Tür.

Understand "clap in Hands" as Clapping.
	Clapping is an action applying to nothing.
Carry out clapping:
	Increase Aktionen_mit_geraeusch by 1.
Report Clapping:
	Say "Du hast in die Hände geklatscht!".
	
Understand "talk with [any Kontaminierter]" as Talk_With.
	Talk_With is an action applying to one thing.
Carry out Talk_With:
	Increase Aktionen_mit_geraeusch by 1.
Report Talk_With:
	Say "Du hast den Kontaminierten angesprochen."

Aktionen_ohne_geraeusch is a number variable. Aktionen_ohne_geraeusch is 0.
Richtung is a direction variable.
Kontaminierten_while is a number variable. Kontaminierten_while is 0.
	
Tür1 is a Door. It is west of Gamma_Junction.
Panel2 is a Panel. The Zugehörige_Tür of Panel2 is Tür1.

Before going direction:
	Now Richtung is the noun;
	if the room Richtung of the location of the player is not nothing:
		if Aktionen_mit_geraeusch is 2:
			Now Kontaminierten_while is 1;
			while Kontaminierten_while is less than 9:
				if Kontaminierten_while is 1 and Kontaminierter_1 is in the location of the player:
					Now Kontaminierter_1 is in the room Richtung of the location of the player;
				if Kontaminierten_while is 2 and Kontaminierter_2 is in the location of the player:
					Now Kontaminierter_2 is in the room Richtung of the location of the player;
				if Kontaminierten_while is 3 and Kontaminierter_3 is in the location of the player:
					Now Kontaminierter_3 is in the room Richtung of the location of the player;
				if Kontaminierten_while is 4 and Kontaminierter_4 is in the location of the player:
					Now Kontaminierter_4 is in the room Richtung of the location of the player;
				if Kontaminierten_while is 5 and Kontaminierter_5 is in the location of the player:
					Now Kontaminierter_5 is in the room Richtung of the location of the player;
				if Kontaminierten_while is 6 and Kontaminierter_6 is in the location of the player:
					Now Kontaminierter_6 is in the room Richtung of the location of the player;
				if Kontaminierten_while is 7 and Kontaminierter_7 is in the location of the player:
					Now Kontaminierter_7 is in the room Richtung of the location of the player;
				if Kontaminierten_while is 8 and Kontaminierter_8 is in the location of the player:
					Now Kontaminierter_8 is in the room Richtung of the location of the player;
				Increase Kontaminierten_while by 1;
		Now Aktionen_ohne_geraeusch is 0;
		Now Aktionen_mit_geraeusch is 0.
		
Every turn:
	if Kontaminierter is in the location of the player:
		Increase Aktionen_ohne_geraeusch by 1;
		If Aktionen_ohne_geraeusch is greater than 2 or Aktionen_mit_geraeusch is greater than 2:
			Now Weiter_spielen is false;
			Now Spielabbruch is "Du wurdest kontaminiert";
			Say Spielabbruch;
			End the Story finally.

Kontaminierter_1 is a Kontaminierter. The printed name is "Kontaminierter".
	It is in Brigde.
Kontaminierter_2 is a Kontaminierter. The printed name is "Kontaminierter".
	It is in Brigde.
Kontaminierter_3 is a Kontaminierter. The printed name is "Kontaminierter".
	it is in Alpha_Beta_Corridor.
Kontaminierter_4 is a Kontaminierter. The printed name is "Kontaminierter".
	It is in Alpha_Delta_Corridor.
Kontaminierter_5 is a Kontaminierter. The printed name is "Kontaminierter".
	It is in Med_Lab.
Kontaminierter_6 is a Kontaminierter. The printed name is "Kontaminierter".
	It is in Fitness.
Kontaminierter_7 is a Kontaminierter. The printed name is "Kontaminierter".
	It is in Fitness.
Kontaminierter_8 is a Kontaminierter. The printed name is "Kontaminierter".
	It is in Fitness.
			

Gamma_Junction is a room. The printed name is "Gamma Junction".
Gamma_Beta_Corridor is north of Gamma_Junction. The printed name is "Gamma Beta Corridor".
Beta_Junction is north of Gamma_Beta_Corridor. The printed name is "Beta Juncton".
Alpha_Beta_Corridor is north of Beta_Junction. The printed name is "Alpha Beta Corridor".
Alpha_Junction is north of Alpha_Beta_Corridor. The printed name is "Alpha Junction".
Alpha_Delta_Corridor is north of Alpha_Junction. The printed name is "Alpha Delta Corridor".
Delta_Junction is north of Alpha_Delta_Corridor. The printed name is "Delta Junction".
Gamma_Delta_Corridor is north of Delta_Junction. The printed name is "Gamma Delta Junction".
Gamma_Junction is north of Gamma_Delta_Corridor.

Xeno_Lab is up of Gamma_Junction. The printed name is "Xeno Lab".
Engeneering_Lab is up of Beta_Junction. It is in Innerer_Ring. The printed name is "Engeneering Lab".
Med_Lab is up of Alpha_Junction. The printed name is "Med Lab".
Dekontaminationskabine is inside of Med_Lab. The printed name is "Dekontaminationskabine".
Solar_Lab is up of Delta_Junction. The printed name is "Solar Lab".
Hangar is down of Gamma_Junction. The printed name is "Hangar".
Docking_Bay is down of Hangar. The printed name is "Docking Bay".
Raumfähre is inside of Docking_Bay. The printed name is "Raumfähre".
Duty_Room is down of Alpha_Junction. The printed name is "Duty Room".
Crew_Quarter is down of Duty_Room. The printed name is "Crew Quarter".
Wartungsschacht is down of Gamma_Delta_Corridor. The printed name is "Wartungsschacht".
Com_Base is down of Wartungsschacht. The printed name is "Com Base".
Weltraum is north of Com_Base. The printed name is "Weltraum".
Docking_Bay is north of Weltraum.

Storage_Area is east of Gamma_Junction. The printed name is "Storage Area".
Beta_Greenhouse is north of Storage_Area. The printed name is "Beta Greenhouse".
Delta_AI is up of Storage_Area. The printed name is "Delta AI".
Main_Generator is south of Delta_AI. The printed name is "Main Generator".
Delta_Greenhouse is a room. The printed name is "Delta Greenhouse".
Storage_Room is south of Delta_Greenhouse. The printed name is "Storage Room".
Alpha_AI is up of Storage_Room. The printed name is "Alpha AI".
Transporter_Raum is south of Alpha_AI. The printed name is "Transporter Raum".

Second_Generator is east of Com_Base. The printed name is "Second Generator".
Fitness is east of Crew_Quarter. The printed name is "Fitness".
Cafeteria is east of Duty_Room and down of Storage_Room. The printed name is "Cafeteria".

Antenna_Array is west of Com_Base. The printed name is "Antenna Array".
Briefing_Room is west of Duty_Room. The printed name is "Briefing Room".
Bridge is down of Briefing_Room. The printed name is "Bridge".