"Lupus Station" by Team14

Panel is a kind of thing. A panel has a door called Zugehörige_Tür.

Understand "use [Sicherheitsausweis] with [any Panel]" as Using.
	Using is an action applying to two things.
Check using:
	If the Player is not carrying the Sicherheitsausweis:
		Say "Du trägst nicht den Sicherheitsausweis!" instead;
Carry out using:
	Now the Zugehörige_Tür of the second Noun is unlocked;
Report Using:
	Say "Du hast die zugehörige Tür des Panels entriegelt."
	

--nicht fertig--
Spielabbruch is a text variable. Spielabbruch is "".
Weiter_spielen is truth state variable. Weiter_spielen is true.
Aktionen_ohne_geraeusch is a number variable. Aktionen_ohne_geraeusch is 0.
Aktionen_mit_geraeusch is a number variable. Aktionen_mit_geraeusch is 0.
Richtung is a direction variable.

Kontaminierter is a kind of thing. 
	A Kontaminierter is not portable.
Before going direction:
	Now Richtung is the noun;
	if the room Richtung of the location of the player is not nothing:
		Now Aktionen_ohne_geraeusch is 0;
		Now Aktionen_mit_geraeusch is 0;
		if Kontaminierter is in the location of the player and Aktionen_mit_geraeusch is 2:
			--Fehler--
			Now Kontaminierter is the room Richtung of the location of the player. 
Every turn:
	Increase Aktionen_ohne_geraeusch by 1;
	if Kontaminierter is in the location of the player:
		if Aktionen_ohne_geraeusch is greater than 2 or Aktionen_mit_geraeusch is greater than 2:
			Now Weiter_spielen is false;
			Now Spielabbruch is "Du wurdest kontaminiert".


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
Engeneering_Lab is up of Beta_Junction. The printed name is "Engeneering Lab".
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