"Lupus Station" by Nick

Gamma_Junction is a room. The printed name is "Gamma Junction".
Gamma_Beta_Corridor is north of Gamma_Junction. The printed name is "Gamma Beta Corridor".
Beta_Junction is north of Gamma_Beta_Corridor. The printed name is "Beta Juncton".
Alpha_Beta_Corridor is north of Beta_Junction. The printed name is "Alpha Beta Corridor".
Alpha_Junction is north of Alpha_Beta_Corridor. The printed name is "Alpha Junction".
Alpha_Delta_Corridor is north of Alpha_Junction. The printed name is "Alpha Delta Corridor".
Delta_Junction is north of Alpha_Delta_Corridor. The printed name is "Delta Junction".
Gamma_Delta_Corridor is north of Delta_Junction. The printed name is "Gamma Delta Junction".
Gamma_Junction is north of Gamma_Delta_Corridor.

Xeno_Lab is down of Gamma_Junction. The printed name is "Xeno Lab".
Engeneering_Lab is down of Beta_Junction. The printed name is "Engeneering Lab".
Med_Lab is down of Alpha_Junction. The printed name is "Med Lab".
Dekontaminationskabine is inside of Med_Lab. The printed name is "Dekontaminationskabine".
Solar_Lab is down of Delta_Junction. The printed name is "Solar Lab".
Hangar is up of Gamma_Junction. The printed name is "Hangar".
Docking_Bay is up of Hangar. The printed name is "Docking Bay".
Raumfähre is inside of Docking_Bay. The printed name is "Raumfähre".
Duty_Room is up of Alpha_Junction. The printed name is "Duty Room".
Crew_Quarter is up of Duty_Room. The printed name is "Crew Quarter".
Wartungsschacht is up of Gamma_Delta_Corridor. The printed name is "Wartungsschacht".
Com_Base is up of Wartungsschacht. The printed name is "Com Base".
Weltraum is north of Com_Base. The printed name is "Weltraum".
Docking_Bay is north of Weltraum.

Storage_Area is east of Gamma_Junction. The printed name is "Storage Area".
Beta_Greenhouse is north of Storage_Area. The printed name is "Beta Greenhouse".
Delta_AI is down of Storage_Area. The printed name is "Delta AI".
Main_Generator is south of Delta_AI. The printed name is "Main Generator".
Delta_Greenhouse is a room. The printed name is "Delta Greenhouse".
Storage_Room is south of Delta_Greenhouse. The printed name is "Storage Room".
Alpha_AI is down of Storage_Room. The printed name is "Alpha AI".
Transporter_Raum is south of Alpha_AI. The printed name is "Transporter Raum".

Second_Generator is east of Com_Base. The printed name is "Second Generator".
Fitness is east of Crew_Quarter. The printed name is "Fitness".
Cafeteria is east of Duty_Room and up of Storage_Room. The printed name is "Cafeteria".

Antenna_Array is west of Com_Base. The printed name is "Antenna Array".
Briefing_Room is west of Duty_Room. The printed name is "Briefing Room".
Bridge is up of Briefing_Room. The printed name is "Bridge".


Antenna_Array_SM is a room. The printed name is "Antenna Array SM".
Transporter_Module is south of Antenna_Array_SM. The printed name is "Transporter Module".
Solar_Module is a room. The printed name is "Solar Module".
Pulsator_Module is south of Solar_Module. The printed name is "Pulsator Module".

Lab_Module is down of Antenna_Array_SM. The printed name is "Lab Module".
Storage_SM is east of Lab_Module. The printed name is "Storage SM".
Control_Module is down of Pulsator_Module. The printed name is "Control Module".
Com_Module is west of Control_Module. The printed name is "Com Module".

Damaged_Module is down of Storage_SM. The printed name is "Damaged Module".
Energy_Module is south of Damaged_Module. The printed name is "Energy Module".
Delta_Greenhouse_SM is west of Energy_Module and down of Com_Module. The printed name is "Delta Grennhouse SM".
Rescue_Module is north of Delta_Greenhouse_SM. The printed name is "Rescue Module".


Testing is an action applying to nothing.
Understand "teleport" as testing.
Check testing:
	if the player is in Transporter_Raum:
		Now the player is in Transporter_Module;
	otherwise:
		if the player is in Transporter_Module:
			Now the player is in Transporter_Raum;
		otherwise:
			say "Nicht möglich!";
			