"Lupus Station" by Team14
Use MAX_STATIC_DATA of 100000000.

[*****globale Variablen*****]
Laute_Aktionen is a number variable. Laute_Aktionen is 0.
Stationsalarm is a truth state variable. Stationsalarm is true.



[*****Regionen*****]
Innerer_Ring is a region.
Aeußerer_Ring is a region.
Maschinenkern is scenery.



[*****Definitionen*****]

	[Kontaminierte]
	Kontaminierter is a kind of thing. 
		A Kontaminierter is not portable.
	
	[Panels]
	Panel is a kind of thing.
		A Panel has a Door called Given_Door.
	TestTür is a Door. It is west of Gamma_Junction.
	TestPanel is a Panel. The Given_Door of TestPanel is TestTür. TestPanel is in Gamma_Junction.
	
	Mobitab is a thing. It is in Gamma_Junction.



[*****Aktionen*****]
[verwende Variable "Increase Laute_Aktionen by 1." für laute Aktion] 

[Klatschen]
Understand "clap in Hands" as Clapping.
	Clapping is an action applying to nothing.
Carry out clapping:
	If Stationsalarm is false:
		Increase Laute_Aktionen by 1;
	Else:	
		Say "Der Stationsalarm ist zu laut!";
Report Clapping:
	If Stationsalarm is false:
		Say "Der Stationsalarm ist zu laut!";

[Sprechen]
Understand "talk with [any Kontaminierter]" as Talk_With.
	Talk_With is an action applying to one thing.
Carry out Talk_With:
	If Stationsalarm is false:
		Increase Laute_Aktionen by 1;
	Else:	
		Say "Der Stationsalarm ist zu laut!";
Report Talk_With:
		Say "Du hast den Kontaminierten angesprochen."

[Sicherheitsbarrieren]
Understand "use [Mobitab] with [any Panel]" as Using.
	Using is an action applying to two things.
Check using:
	If the Player is not carrying the Mobitab:
		Say "Du trägst nicht das Mobitab!" instead;
Carry out using:
	Now the Given_Door of the second Noun is unlocked;
Report Using:
	Say "Du hast die zugehörige Tür des Panels entriegelt."


[*****Kontaminierte*****]
[Diese Variablen nicht nutzen!]
Aktionen_mit_geraeusch is a number variable. Aktionen_mit_geraeusch is 0.
Aktionen_ohne_geraeusch is a number variable. Aktionen_ohne_geraeusch is 0.
Kontaminierten_richtung is a direction variable.
Kontaminierten_while is a number variable. Kontaminierten_while is 0.
Kontaminierten_going is a truth state variable. Kontaminierten_going is false.

Before going direction:
	Now Kontaminierten_richtung is the noun;
	If the room Kontaminierten_richtung of the location of the player is not nothing:
		If Aktionen_mit_geraeusch is 2:
			Now Kontaminierten_while is 1;
			While Kontaminierten_while is less than 9:
				If Kontaminierten_while is 1 and Kontaminierter_1 is in the location of the player:
					Now Kontaminierter_1 is in the room Kontaminierten_richtung of the location of the player;
				If Kontaminierten_while is 2 and Kontaminierter_2 is in the location of the player:
					Now Kontaminierter_2 is in the room Kontaminierten_richtung of the location of the player;
				If Kontaminierten_while is 3 and Kontaminierter_3 is in the location of the player:
					Now Kontaminierter_3 is in the room Kontaminierten_richtung of the location of the player;
				If Kontaminierten_while is 4 and Kontaminierter_4 is in the location of the player:
					Now Kontaminierter_4 is in the room Kontaminierten_richtung of the location of the player;
				If Kontaminierten_while is 5 and Kontaminierter_5 is in the location of the player:
					Now Kontaminierter_5 is in the room Kontaminierten_richtung of the location of the player;
				If Kontaminierten_while is 6 and Kontaminierter_6 is in the location of the player:
					Now Kontaminierter_6 is in the room Kontaminierten_richtung of the location of the player;
				If Kontaminierten_while is 7 and Kontaminierter_7 is in the location of the player:
					Now Kontaminierter_7 is in the room Kontaminierten_richtung of the location of the player;
				If Kontaminierten_while is 8 and Kontaminierter_8 is in the location of the player:
					Now Kontaminierter_8 is in the room Kontaminierten_richtung of the location of the player;
				Increase Kontaminierten_while by 1;
		Now Laute_Aktionen is 0;
		Now Kontaminierten_going is true;
		Now Aktionen_ohne_geraeusch is 0;
		Now Aktionen_mit_geraeusch is 0.
		
Every turn:
	If Kontaminierter is in the location of the player:
		If Kontaminierten_going is false:
			Increase Aktionen_ohne_geraeusch by 1;
		If Laute_Aktionen is greater than 0:
			Increase Aktionen_mit_geraeusch by 1;
		Now Kontaminierten_going is false;
		If Aktionen_ohne_geraeusch is greater than 2:
			Say "Du wurdest kontaminiert!";
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
	


[*****Räume*****]
Gamma_Junction is a room. The printed name is "Gamma Junction".
Gamma_Beta_Corridor is north of Gamma_Junction. The printed name is "Gamma Beta Corridor".
Beta_Junction is north of Gamma_Beta_Corridor. The printed name is "Beta Junction".
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
Umkleidekabine is inside of Hangar. The printed name is "Umkleidekabine".
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