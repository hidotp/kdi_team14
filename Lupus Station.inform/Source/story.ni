"Lupus Station" by Team14
Use MAX_STATIC_DATA of 100000000.

<<<<<<< HEAD
[*****Player*****]
Percy is a man.
	Percy is in Raumfähre. 
Barry is a man.
	Barry is in Raumfähre.
Player is Percy.

=======
>>>>>>> master

[*****globale Variablen*****]
Laute_Aktionen is a number variable. Laute_Aktionen is 0.
Stationsalarm is a truth state variable. Stationsalarm is true.
HaEnAbf is a truth state variable. HaEnAbf is false.
Kontcount is a number variable. Kontcount is 0.
<<<<<<< HEAD
Drcklfthmr_Ladezstd is a truth state variable. Drcklfthmr_Ladezstd is true.
=======

>>>>>>> master

[*****Regionen*****]
Innerer_Ring is a region.
Aeußerer_Ring is a region.
<<<<<<< HEAD
=======


>>>>>>> master

[*****Definitionen*****]

	[Kontaminierte]
	Kontaminierter is a kind of thing. 
		A Kontaminierter is not portable.
	
	[Sicherheitsbarriere]
	SiBa is a kind of door. A SiBa is locked.
	
	[Panels]
	Panel is a kind of thing.
		A Panel has a SiBa called Given_SiBa.
	
	[Luke]
	Luke is a kind of door. A Luke is locked.
	
	[Mobitab]
	Mobitab is a thing. It is in Gamma_Junction.
	
	[Sicherheitsausweis]
	Sicherheitsausweis is a thing. It is in Spind.





[*****Methoden*****]

[Bewegen Methodik (Beschreibungstext durch den Sationsalarm und den Hauptenergieaabfall(Dieser nur im Innerem Ring))]
Richtung_StAla is a direction variable.
Raum_Test_1 is a room variable. 
Raum_Test_2 is a room variable. 

Every turn:
	Now Raum_Test_1 is the location of the player;
	If Raum_Test_1 is not Raum_Test_2:
		If Stationsalarm is true:
			Say "Der Stationsalarm gibt ein ohrenbetäubenden Sirenenton von sich.";		
		If the player is in a room in Innerer_Ring:
			If HaEnAbf is true:
				Say "Durch das Deckenfenster sieht man den orange glühenden Maschinenkern.";
			Else:
				Say "Durch das Deckenfenster sieht man den grün glühenden 	Maschinenkern.";
	Now Raum_Test_2 is Raum_Test_1.


[Spieler wechseln]
To change_to_Barry:
	Now player is Barry;
	Say "[line break][bold type]Du spielst nun Barry!";
	Say "[location][roman type][line break]".

To change_to_Percy:
	Now player is Percy;
	Say "[line break][bold type]Du spielst nun Percy!";
	Say "[location][roman type][line break]".

[Kontaminiertencounter -- Dekontaminationskabine]
To count_Kont_Dekon:
	Now Kontcount is 0;
	If Kontaminierter_1 is in Dekontaminationskabine:
		Increase Kontcount by 1;
	If Kontaminierter_2 is in Dekontaminationskabine:
		Increase Kontcount by 1;
	If Kontaminierter_3 is in Dekontaminationskabine:
		Increase Kontcount by 1;
	If Kontaminierter_4 is in Dekontaminationskabine:
		Increase Kontcount by 1;
	If Kontaminierter_5 is in Dekontaminationskabine:
		Increase Kontcount by 1;
	If Kontaminierter_6 is in Dekontaminationskabine:
		Increase Kontcount by 1;
	If Kontaminierter_7 is in Dekontaminationskabine:
		Increase Kontcount by 1;
	If Kontaminierter_8 is in Dekontaminationskabine:
		Increase Kontcount by 1;

[Kontaminiertencounter -- MobiTab]
To count_Kontaminiert:
	Now Kontcount is 0;
	If Kontaminierter_1 is in the location of the player:
		Increase Kontcount by 1;
	If Kontaminierter_2 is in the location of the player:
		Increase Kontcount by 1;
	If Kontaminierter_3 is in the location of the player:
		Increase Kontcount by 1;
	If Kontaminierter_4 is in the location of the player:
		Increase Kontcount by 1;
	If Kontaminierter_5 is in the location of the player:
		Increase Kontcount by 1;
	If Kontaminierter_6 is in the location of the player:
		Increase Kontcount by 1;
	If Kontaminierter_7 is in the location of the player:
		Increase Kontcount by 1;
	If Kontaminierter_8 is in the location of the player:
		Increase Kontcount by 1;
	
[Dekontaminiation]
After closing Dekon Tür:
	count_Kont_Dekon;
	If Kontcount <= 1:
		If the player is not in Dekontaminationskabine:
			Percy is a Kontaminierter.

[*****Aktionen*****]
[verwende Variable "Increase Laute_Aktionen by 1." für laute Aktion] 

[Klatschen]
Understand "clap in Hands" as Clapping.
	Clapping is an action applying to nothing.
Carry out clapping:
	If Stationsalarm is false:
		Increase Laute_Aktionen by 1.
Report Clapping:
	If Stationsalarm is true:
		Say "Du hast in die Hände geklatscht doch der Stationsalarm ist zu laut!";
	Else:
		If Kontaminierter is in the location of the player:
			Say "Du hast in die Hände geklatscht und der Kontaminierter hat dich bemerkt!";
		Else: 
			Say "Du hast in die Hände geklatscht!";
			
[Sprechen/ Kontaminierte]
Understand "talk with [any Kontaminierter]" as Talking_K.
	Talking_K is an action applying to one thing.
Carry out Talking_K:
	If Stationsalarm is false:
		Increase Laute_Aktionen by 1;
	Else:	
		Say "Der Stationsalarm ist zu laut!";
Report Talking_K:
	Say "Du hast den Kontaminierten angesprochen."

[Drucklufthammer aufladen]
Understand "charge [Drucklufthammer] with [Panel]" as Charging.
	Charging is an action applying to two things.
Check Charging: 
	If Drcklfthmr_Ladezstd is true:
		Say "Der Drucklufthammer ist schon geladen!" instead;
Carry out clapping:
	If Drcklfthmr_Ladezstd is false:
		Now Drcklfthmr_Ladezstd is true;
Report Charging:
	Say "Du hast den Drucklufthammer aufgeladen."
	
[Drucklufthammer benutzen]
Understand "use [Drucklufthammer]" as Druckluften.
	Druckluften is an action applying to one thing.
Check Druckluften: 
	If Drcklfthmr_Ladezstd is false:
		Say "Der Drucklufthammer hat keine Energie" instead;
Carry out Druckluften:
	If Drcklfthmr_Ladezstd is true:
		Increase Laute_Aktionen by 1;
Report Druckluften:
	If Kontaminierter is in the location of the player:
		Say "Du mit dem Drucklufthammer ein lautes Geräusch gemacht und der Kontaminierte hat dich bemerkt!";
	Else: 
		Say "Du hast den Drucklufthammer benutzt und ein lautes Geräusch gemacht.";

[Sicherheitsbarrieren]
Understand "use [Sicherheitsausweis] with [any Panel]" as Using.
	Using is an action applying to two things.
Check using:
	If the Player is not carrying the Sicherheitsausweis:
		Say "Du trägst nicht den Sicherheitsausweis!" instead;
Carry out using:
	If the the Given_SiBa of the second Noun is closed:
		Now the Given_SiBa of the second noun is unlocked;
		Now the Given_SiBa of the second Noun is open;
	If the the Given_SiBa of the second Noun is open:
		Now the Given_SiBa of the second Noun is closed;
		Now the Given_SiBa of the second Noun is locked;
Report Using:
	Say "Du hast die zugehörige Tür des Panels entriegelt."

[]
Understand "use [Sicherheitsausweis] with d [any Door]" as Using_B.
	Using_B is an action applying to two things.
Check Using_B:
	If the Player is not carrying the Sicherheitsausweis:
		Say "Du trägst nicht den Sicherheitsausweis!" instead;
Carry out using:
	Now the Given_SiBa of the second Noun is unlocked;
Report Using_B:
	Say "Du hast die zugehörige Tür des Panels entriegelt."
	
[Med-Lab Pult Benutzung]
MedLabText is a text variable. MedLabText is "TEMP muss noch geschrieben werden!!!".

Understand "interact with [Med-Lab Pult]" as Interacting.
	Interacting is an action applying to one thing.
Carry out Interacting:
	Increase Laute_Aktionen by 1;
Report Interacting:
	Say MedLabText;



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


	
[*****Gegenstände*****]
Med-Lab Pult is a thing. It is in Med_Lab. The printed name is "Med-Lab Pult".
Drucklufthammer is a thing. It is in Umkleidekabine. 


[*****Räume*****]
Gamma_Junction is a room. The printed name is "Gamma Junction". 
SiBa_1 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Gamma_Junction and south of Gamma_Beta_Corridor.
Panel N Gam Junc is a Panel. 
	The Given_SiBa is SiBa_1. Panel N Gam Junc is in Gamma_Junction.
Panel S Gam Junc is a Panel. 
	The Given_SiBa is SiBa_8. Panel S Gam Junc is in Gamma_Junction.

Gamma_Beta_Corridor is a room. The printed name is "Gamma Beta Corridor". 
SiBa_2 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Gamma_Beta_Corridor and south of Beta_Junction.
Panel N Gam Bet Corr is a Panel.
	The Given_SiBa is SiBa_2. Panel N Gam Bet Cor is in Gamma_Beta_Corridor.
Panel S Gam Bet Corr is a Panel.
	The Given_SiBa is SiBa_1. Panel S Gam Bet Cor is in Gamma_Beta_Corridor.

Beta_Junction is a room. The printed name is "Beta Junction".
SiBa_3 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Beta_Junction and south of Alpha_Beta_Corridor.
Panel N Bet Junc is a Panel.
	The Given_SiBa is SiBa_3. Panel N Bet Junc is in Beta_Junction.
Panel S Bet Junc is a Panel.
	The Given_SiBa is SiBa_2. Panel S Bet Junc is in Beta_Junction.
	
Alpha_Beta_Corridor is a room. The printed name is "Alpha Beta Corridor".
SiBa_4 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Alpha_Beta_Corridor and south of Alpha_Junction.
Panel N Alp Bet Cor is a Panel. 
	The Given_SiBa is SiBa_4. Panel N Alp Bet Cor is in Alpha_Beta_Corridor.
Panel S Alp Bet Cor is a Panel.
	The Given_SiBa is SiBa_3. Panel S Alp Bet Cor is in Alpha_Beta_Corridor.

Alpha_Junction is a room. The printed name is "Alpha Junction".
SiBa_5 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Alpha_Junction and south of Alpha_Delta_Corridor.
Panel N Alp Junc is a Panel. 
	The Given_SiBa is SiBa_5. Panel N Alp Junc is in Alpha_Junction.
Panel S Alp Junc is a Panel.
	The Given_SiBa is SiBa_4. Panel S Alp Junc is in Alpha_Junction.

Alpha_Delta_Corridor is a room. The printed name is "Alpha Delta Corridor".
SiBa_6 is a SiBa.  The printed name is "Sicherheitsbarriere".
	It is north of Alpha_Delta_Corridor and south of Delta_Junction.
Panel N Alp Del Cor is a Panel. 
	The Given_SiBa is SiBa_6. Panel N Alp Del Cor is in Alpha_Delta_Corridor.
Panel S Alp Del Cor is a Panel. 
	The Given_SiBa is SiBa_5. Panel S Alp Del Cor is in Alpha_Delta_Corridor.

Delta_Junction is a room. The printed name is "Delta Junction".
SiBa_7 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Delta_Junction and south of Gamma_Delta_Corridor.
Panel N Del Junc is a Panel.
	The Given_SiBa is SiBa_7. Panel N Del Junc is in Delta_Junction.
Panel S Del Junc is a Panel. 
	The Given_SiBa is SiBa_6. Panel S Del Junc is in Delta_Junction.

Gamma_Delta_Corridor is a room. The printed name is "Gamma Delta Junction".
SiBa_8 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Gamma_Delta_Corridor and south of Gamma_Junction.
Panel N Gam Del Cor is a Panel. 
	The Given_SiBa is SiBa_1. Panel N Gam Del Cor is in Gamma_Delta_Corridor.
Panel S Gam Del Cor is a Panel. 
	The Given_SiBa is SiBa_8. Panel S Gam Del Cor is in Gamma_Delta_Corridor.

Xeno_Lab is a room. It is in Innerer_Ring. The printed name is "Xeno Lab".
Luke_1 is a Luke. The printed name is "Deckenluke".
	It is up of Gamma_Junction and down of Xeno_Lab.

Engeneering_Lab is a room. It is in Innerer_Ring. The printed name is "Engeneering Lab".
Luke_2 is a Luke. The printed name is "Deckenluke".
	It is up of Beta_Junction and down of Engeneering_Lab.

Med_Lab is a room. It is in Innerer_Ring. The printed name is "Med Lab".
Luke_3 is a Luke. The printed name is "Deckenluke".
	It is up of Alpha_Junction and down of Med_Lab.
Dekon Tür is a door. It is inside of Med_Lab. It is outside of Dekontaminationskabine.
Dekontaminationskabine is a room.  The printed name is "Dekontaminationskabine".
	Dekontaminationskabine is in Innerer_Ring.
	
Solar_Lab is a room. It is in Innerer_Ring. The printed name is "Solar Lab".
Luke_4 is a Luke. The printed name is "Deckenluke".
	It is up of Delta_Junction and down of Solar_Lab.

Luke_Hangar is a door. It is down of Gamma_Junction and above Hangar.
Hangar is a room. The printed name is "Hangar".
Spind is a container. It is in Hangar. 

Umkleidekabine is a room. The printed name is "Umkleidekabine".
Umkleidetuer is a door. The printed name is "Umkleidetür".
	It is inside of Hangar and outside of Umkleidekabine.
	It is locked.
	
Docking_Bay is down of Hangar. The printed name is "Docking Bay".
Raumfähre is inside of Docking_Bay. The printed name is "Raumfähre".
Duty_Room is down of Alpha_Junction. The printed name is "Duty Room".
Crew_Quarter is down of Duty_Room. The printed name is "Crew Quarter".
Wartungsschacht is down of Gamma_Delta_Corridor. The printed name is "Wartungsschacht".
Com_Base is down of Wartungsschacht. The printed name is "Com Base".

Weltraum is a room. The printed name is "Weltraum".
Weltraumtuer is a door. The printed name is "Weltraumtür".
	It is north of Weltraum and south of Docking_Bay.
	It is locked.
Weltraumtuer_2 is a door. The printed name is "Weltraumtür".
	It is south of Weltraum and north of Com_Base.
	It is locked.

Storage_Area is east of Gamma_Junction. The printed name is "Storage Area".
Beta_Greenhouse is north of Storage_Area. The printed name is "Beta Greenhouse".
Delta_AI is up of Storage_Area. It is in Innerer_Ring. The printed name is "Delta AI".
Main_Generator is south of Delta_AI. It is in Innerer_Ring. The printed name is "Main Generator".
Delta_Greenhouse is a room. The printed name is "Delta Greenhouse".
Storage_Room is south of Delta_Greenhouse. The printed name is "Storage Room".
Alpha_AI is up of Storage_Room. It is in Innerer_Ring. The printed name is "Alpha AI".
Transporter_Raum is south of Alpha_AI. It is in Innerer_Ring. The printed name is "Transporter Raum".

Second_Generator is east of Com_Base. The printed name is "Second Generator".
Fitness is east of Crew_Quarter. The printed name is "Fitness".
Cafeteria is east of Duty_Room and down of Storage_Room. The printed name is "Cafeteria".

Antenna_Array is west of Com_Base. The printed name is "Antenna Array".
Briefing_Room is west of Duty_Room. The printed name is "Briefing Room".
Bridge is down of Briefing_Room. The printed name is "Bridge".