"Lupus Station" by Team14
Use MAX_STATIC_DATA of 100000000.


[*****Testmethode*****]
[Teleport]
Raumteleport is a room variable.
Understand "Teleport to [any room]" as Teleporting.
	Teleporting is an action applying to one thing.
Carry out Teleporting:
	Now Raumteleport is the noun;
	If Raumteleport is not nothing:
		Now the player is in Raumteleport.



[*****globale Variablen*****]
Laute_Aktionen is a number variable. Laute_Aktionen is 0.
Stationsalarm is a truth state variable. Stationsalarm is true.
Hauptenergieabfall is a truth state variable. Hauptenergieabfall is false.
Kontcount is a number variable. Kontcount is 0.
DekonDone is a truth state variable.
Drcklfthmr_Ladezstd is a truth state variable. Drcklfthmr_Ladezstd is true.
Sauerstoff is a number variable. Sauerstoff is 5. [Sauerstoffzähler]
Strom is a number variable. Strom is 5. [Stromzähler]



[*****Regionen*****]
Innerer_Ring is a region.
Aeußerer_Ring is a region.

[*****Definitionen*****]

	[Kontaminierte]
	Kontaminierter is a kind of man. 
		A Kontaminierter has a truth state called Is_Kontaminiert.
	
	[Panels]
	Panel is a kind of thing.
		A Panel has a door called Given_SiBa.
		A Panel is fixed in place.
	
	[Sicherheitsbarriere]
	SiBa is a kind of door. A SiBa is locked.
	
	[Luke]
	Luke is a kind of door. A Luke is locked.

	[Luken Panels]
	LuPanel is a kind of thing.
		A LuPanel has a Luke called Given_Luke.
		A LuPanel is fixed in place.

	[Mobitab]
	Mobitab is a thing. It is in Spind.
	
	[Sicherheitsausweis]
	Sicherheitsausweis is a thing. It is in Spind. The Description is "Ein Sicherheitsausweis, der aussieht als ob er einer wichtigen Person gehört."

	[Med-Lab Pult]
	Med-Lab Pult is a thing. It is in Med_Lab.
		Med-Lab Pult is fixed in place. The Description is "Ein Pult mit einem riesigen Bildschirm. Gerade ist ein Videoblog aufgerufen, man muss nur noch auf Play drücken…"
	
	[Drucklufthammer]
	Drucklufthammer is a thing. It is in Hangar. 
	
	[Öffnungshebel]
	Oeffnungshebel is a thing. It is in Gamma_Delta_Corridor. The Description is "Der Öffnungshebel der Wartungsluke. Dort wo er durch das Laserfeuer abgetrennt wurde sieht man noch Schmauchspuren."
	
	[Krankenbett]
	Krankenbett is a supporter. It is in Med_Lab. It is enterable. It is fixed in place.

	[Palette]
	Palette is a thing. It is in Raumfähre. The description is "Palette die alleine zu schwer zum Tragen oder schieben ist".

[*****Player*****]
Percy is a Kontaminierter.
	Percy is in Raumfähre.
	Is_Kontaminiert of Percy is false.
Barry is a man.
	Barry is in Raumfähre.
Player is Percy.



[*****Methoden*****]

[MobiTab - Kontaminiertenzähler]
Every turn:
	If the player has MobiTab:	
		count_Kontaminiert;
		If Kontcount > 0:
			Say "[bold type]Mobi Tab: [roman type] Anzahl der Kontaminierten: [Kontcount]";
			Continue the action;

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
			If Hauptenergieabfall is true:
				Say "Durch das Deckenfenster sieht man den orange glühenden Maschinenkern.";
			Else:
				If Hilfsgenerator_Aktivierbar is false:
					Say "Durch das Deckenfenster sieht man den rot glühenden Maschinenkern.";
				Else:
					Say "Durch das Deckenfenster sieht man den grün glühenden 	Maschinenkern.";
	Now Raum_Test_2 is Raum_Test_1.


[Spieler wechseln]
To change_to_Barry:
	Now player is Barry;
	Say "[line break][bold type]Du spielst nun Barry!";
	Say "[roman type]Barry ist in [bold type][location][roman type][line break]".

To change_to_Percy:
	If Is_Kontaminiert of Percy is false:
		Now player is Percy;
		Say "[line break][bold type]Du spielst nun Percy!";
		Say "[roman type]Percy ist in [bold type][location][roman type][line break]".
		

[Percy kontaminieren / dekontaminieren]
To kontaminiere_Percy:
	Now Is_Kontaminiert of Percy is true;
	If Percy has the Sicherheitsausweis:
		Now the Sicherheitsausweis is in the location of Percy.

To dekontaminiere_Percy:
	Now Is_Kontaminiert of Percy is false.

[Kommandosperre Brücke]
Instead of going down from the Briefing_Room:
	If Bridge Luke is locked:
		If Hauptenergieabfall is true:
			Now Bridge_Luke is unlocked;
			Continue the action;			
		Otherwise:
			Say "Die Kommandosperre hat die Luke blockiert... nur ein Stromausfall könnte diese Sperre aufheben.";
			Continue the action;	
	Otherwise:
		Continue the action;

[Beende Spiel, wenn Percy und Kontaminierter in einem Raum]
To Percy_und_Kontaminierter:
	Say "[bold type]Es ist nicht mehr möglich Percy zu dekontaminieren! (Percy und ein anderer Kontaminierter befinden sich in einem Raum)[roman type]";
	End the story finally.


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
	If Is_Kontaminiert of Percy is true:
		If Percy is in Dekontaminationskabine:
			Increase Kontcount by 1.

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
	If Is_Kontaminiert of Percy is true:
		If Percy is in the location of the player:
			Increase Kontcount by 1.
			
[Dekontaminiation]
DekonText is a text variable. DekonText is "Du hast Percy erfolgreich dekonatminiert!".

After closing Dekon Tür:
	count_Kont_Dekon;
	If Hauptenergieabfall is false:
		If Kontcount <= 1:
			If the Player is not in Dekontaminationskabine:
				If Percy is in Dekontaminationskabine:
					dekontaminiere_Percy;
					Now Hauptenergieabfall is true;
					Say DekonText;
					Continue the action;
				Else:
					If Kontcount <= 1:
						Say "Du willst doch Percy als erstes dekontaminieren.";
					Else:
						Say "Niemand ist in der Kabine.";
			Else:
				Say "Es kann nur eine Person in der Kabine während der Dekonatmination sein";			
		Else:
			Say "Es sind zu viele Kontaminierte in der Kabine zum dekontaminieren.";
	Else:
		Say "Die Energie des Maschinenkerns hat nur für eine Dekontamination gereicht.";
	
[Mobitab nehmen]
Instead of taking the Mobitab:
	If the player is Barry:
		Continue the action;
	Else:
		Say "Du traust dir das nicht zu, das zu nehmen."	

[Drucklufthammer nehmen]
Instead of taking the Drucklufthammer:
	If the player is Barry:
		Continue the action;
	Else:
		Say "Du brauchst das noch nicht."	

[Palette nehmen]
Instead of taking the Palette:
	Say "Wo willst du den die Palette hinpacken? Die ist doch viel zu groß."

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

[Sprechen]
Understand "talk with [any Kontaminierter]" as Talking.
	Talking is an action applying to one thing.
Carry out Talking:
	If Stationsalarm is false:
		Increase Laute_Aktionen by 1;
	Else:	
		Say "Der Stationsalarm ist zu laut!";
Report Talking:
	Say "Du hast den Kontaminierten angesprochen."

[Drucklufthammer aufladen]
Understand "charge [Drucklufthammer] with [any Panel]" as Charging.
	Charging is an action applying to two things.
Check Charging:
	If the player is not carrying the Drucklufthammer:
		Say "Du hast den Drucklufthammer nicht bei dir." instead;
	If Drcklfthmr_Ladezstd is true:
		Say "Der Drucklufthammer ist schon geladen!" instead;
Carry out Charging:
	If Drcklfthmr_Ladezstd is false:
		Now Drcklfthmr_Ladezstd is true;
Report Charging:
	Say "Du hast den Drucklufthammer aufgeladen."
	
[Drucklufthammer benutzen]
Understand "use [Drucklufthammer]" as Druckluften.
	Druckluften is an action applying to one thing.
Check Druckluften: 
	If the player is not carrying the Drucklufthammer:
		Say "Du hast den Drucklufthammer nicht bei dir." instead;
	If Drcklfthmr_Ladezstd is false:
		Say "Der Drucklufthammer hat keine Energie. Du musst ihn an einem Panel (N oder S) aufladen" instead;
Carry out Druckluften:
	If Drcklfthmr_Ladezstd is true:
		Increase Laute_Aktionen by 1;
		Now Drcklfthmr_Ladezstd is false;
Report Druckluften:
	If Kontaminierter is in the location of the player:
		Say "Du hast mit dem Drucklufthammer ein lautes Geräusch gemacht und der Kontaminierte hat dich bemerkt!";
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
	Else:
		Now the Given_SiBa of the second Noun is closed;
		Now the Given_SiBa of the second Noun is locked;
Report Using:
	If the the Given_SiBa of the second Noun is closed:
		Say "Du hast die zugehörige Tür des Panels verriegelt.";
	Else:
		Say "Du hast die zugehörige Tür des Panels entriegelt.";

[Luke - Sicherheitsausweis]
hLukeTurn is a number variable. hLukeTurn is 0.

Understand "use [Sicherheitsausweis] with [Panel U Hangar]" as u_entriegeln.
	u_entriegeln is an action applying to two things.
Check u_entriegeln:
	If the Player is not carrying the Sicherheitsausweis:
		Say "Du trägst nicht den Sicherheitsausweis!" instead;
Carry out u_entriegeln:
	Now Luke_Hangar is unlocked;
	Now Luke_Hangar is open;
	Now hLukeTurn is 2.
Report u_entriegeln:
	Say "Du hast die Hangarluke für einen Zug geöffnet."

Understand "use [Sicherheitsausweis] with [Panel D Gam Junc]" as d_entriegeln.
	d_entriegeln is an action applying to two things.
Check d_entriegeln:
	If the Player is not carrying the Sicherheitsausweis:
		Say "Du trägst nicht den Sicherheitsausweis!" instead;
Carry out d_entriegeln:
	Now Luke_Hangar is unlocked;
	Now Luke_Hangar is open;
	Now hLukeTurn is 2.
Report d_entriegeln:
	Say "Du hast die Hangarluke für einen Zug geöffnet."
	
Every turn:
	If hLukeTurn is not 0:
		Decrease hLukeTurn by 1;
		If hLukeTurn is 0:
			Now Luke_Hangar is locked;
			Now Luke_Hangar is closed;
			Say "Die Hangarluke hat sich geschlossen".
		

[LuPanel kaputtmachen]
Understand "hit [any LuPanel] with [Mobitab]" as Kaputtmachen.
	Kaputtmachen is an action applying to two things.
Check Kaputtmachen:
	If the Player is not carrying the MobiTab:
		Say "Du trägst nicht das Mobitab!" instead;
Carry out Kaputtmachen:
	Now the Given_Luke of the noun is unlocked;
Report Kaputtmachen:
	Say "Du hast das Panel kaputtgemacht. Jetzt kannst du über die Luke manuell öffnen oder schließen."
	
[Med-Lab Pult Benutzung]
MedLabText is a text variable. MedLabText is "Als du mit dem Pult interagierst fängt plötzlich ein Videoblog an zu spielen: [line break] [bold type] Stationsarzt: [roman type]... durch eine fehlgeschlagene Dekontamination ist ein Erreger von dem nahegelegenem Planeten auf die Station gekommen. Dieser Erreger hat in kurzr Zeit alle Mitarbeiter der Station befallen. Ich noch einen speziellen Filter in die Luftzirkulation einbauen und eine spezielle Dekontaminationskabine für eine Person konstruieren die diese Person gesunden lässt, sobald die Tür geschlossen ist... ich mache diesen Videoblog noch mit meiner letzten Kraft... ich denke das mir nicht mehr viel Zeit bleibt.".
MedLabUsable is a truth state variable. MedLabUsable is false.

Understand "interact with [Med-Lab Pult]" as medInteracting.
	medInteracting is an action applying to one thing.
Check medInteracting:
	If MedLabUsable is false:
		Say "Das interressiert dich noch nicht. Da müsste erst ein Freund kontaminiert sein." instead;
Carry out medInteracting:
	Increase Laute_Aktionen by 1;
	Now Stationsalarm is true;
Report medInteracting:
	Say MedLabText;



[*****Kontaminierte*****]
[Diese Variablen nicht nutzen!]
Aktionen_mit_geraeusch is a number variable. Aktionen_mit_geraeusch is 0.
Aktionen_ohne_geraeusch is a number variable. Aktionen_ohne_geraeusch is 0.
Kontaminierten_richtung is a direction variable.
Kontaminierten_going is a truth state variable. Kontaminierten_going is false.

Before going direction:
	Now Kontaminierten_richtung is the noun;
	If the room Kontaminierten_richtung of the location of the player is not nothing:
		If Aktionen_mit_geraeusch is 2:
			If Kontaminierter_1 is in the location of the player:
				Now Kontaminierter_1 is in the room Kontaminierten_richtung of the location of the player;
			If Kontaminierter_2 is in the location of the player:
				Now Kontaminierter_2 is in the room Kontaminierten_richtung of the location of the player;
			If Kontaminierter_3 is in the location of the player:
				Now Kontaminierter_3 is in the room Kontaminierten_richtung of the location of the player;
			If Kontaminierter_4 is in the location of the player:
				Now Kontaminierter_4 is in the room Kontaminierten_richtung of the location of the player;
			If Kontaminierter_5 is in the location of the player:
				Now Kontaminierter_5 is in the room Kontaminierten_richtung of the location of the player;
			If Kontaminierter_6 is in the location of the player:
				Now Kontaminierter_6 is in the room Kontaminierten_richtung of the location of the player;
			If Kontaminierter_7 is in the location of the player:
				Now Kontaminierter_7 is in the room Kontaminierten_richtung of the location of the player;
			If Kontaminierter_8 is in the location of the player:
				Now Kontaminierter_8 is in the room Kontaminierten_richtung of the location of the player;
			If Is_Kontaminiert of Percy is true:
				If Percy is in the location of the player:
					Now Percy is in the room Kontaminierten_richtung of the location of the player;
					[wenn Percy kontaminiert mit anderem Kontaminierten im Raum]
					If Kontaminierter_1 is in the location of Percy:
						Percy_und_Kontaminierter;
					If Kontaminierter_2 is in the location of Percy:
						Percy_und_Kontaminierter;
					If Kontaminierter_3 is in the location of Percy:
						Percy_und_Kontaminierter;
					If Kontaminierter_4 is in the location of Percy:
						Percy_und_Kontaminierter;
					If Kontaminierter_5 is in the location of Percy:
						Percy_und_Kontaminierter;
					If Kontaminierter_6 is in the location of Percy:
						Percy_und_Kontaminierter;
					If Kontaminierter_7 is in the location of Percy:
						Percy_und_Kontaminierter;
					If Kontaminierter_8 is in the location of Percy:
						Percy_und_Kontaminierter;
		Now Laute_Aktionen is 0;
		Now Kontaminierten_going is true;
		Now Aktionen_ohne_geraeusch is 0;
		Now Aktionen_mit_geraeusch is 0.
		
Every turn:
	count_Kontaminiert;
	[If Kontaminierter is in the location of the player:]
	If Kontcount is greater than 0:
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


[Scene 4]
Hilfsgenerator is a thing.
	It is in Second_Generator.
	It is fixed in place.
Raumanzug is a thing.
	It is in Umkleidekabine.
	It is wearable.
	The description is "Ein Raumanzug, der nicht gegen spitze Sachen gesichert ist."
Startknopf is a thing.
	It is in Second_Generator.
	It is fixed in place.
	The description is "Der Knopf mit dem man den Hilfsgenerator starten kann, ist relativ alt und schon ein bisschen gesplittert."
Selbstzerstörungsknopf is a thing.
	It is in Bridge.
	It is fixed in place.
	The description is "Der Notrufknopf, er ist gerade ohne Funktion, braucht wahrscheinlich Strom…".
Messenger is a thing.
	It is not wearable.
	The description is "Ein kleiner und handlicher Messenger der durch ein Mobitab angeschrieben werden kann - aber nur wenn es wichtig ist.".
	Percy carries the Messenger.



[*****Scene 4 - Gegenstände - Ausführung*****]
Raumanzug_Kaputt is truth state variable. Raumanzug_Kaputt is false. [Ist der Raumanzug kaputt?]
Hilfsgenerator_Aktiviert is a truth state variable. Hilfsgenerator_Aktiviert is false. [Ist der Hilfsgenerator aktiviert? Ist noch Strom da?]

[Messenger nicht wegwerfbar]
Instead of dropping Messenger:
	Say "Der Messenger ist Teil deiner Ausrüstung! Diesen kannst du nicht wegwerfen!".

[Raumanzug ausziehen]
Instead of taking off Raumanzug:
	If the player is in Second_Generator and Scene4 is happening and Raumanzug_Kaputt is false:
		Say "Du kannst den Raumanzug hier nicht ausziehen!";
	Otherwise:
		If the player is in Weltraum:
			Say "Du kannst den Raumanzug hier nicht ausziehen!";
		Otherwise:
			Continue the action.

[Weltraumtüren öffnen mit (heilem) Raumanzug]
Weltraum_Richtung is a direction variable. [In welche Richtung geht der Spieler?]
Weltraum_Text is a text variable. Weltraum_Text is "Du musst einen Raumanzug tragen!". [Ausgabe wenn man keinen Raumanzug trägt]
Raumanzug_Kaputt_Text is a text variable. Raumanzug_Kaputt_Text is "Du kannst nicht ins Weltall! Dein Raumanzug ist beschädigt!". [Ausgabe wenn Raumanzug kaputt]
	
Before going direction:
	Now Weltraum_Richtung is the noun;
	If the room Weltraum_Richtung of the location of the player is not nothing:
		If Weltraumtuer is open or Weltraumtuer is unlocked:
			Now Weltraumtuer is closed;
			Now Weltraumtuer is locked;
		If Weltraumtuer_2 is open or Weltraumtuer_2 is unlocked:
			Now Weltraumtuer_2 is closed;
			Now Weltraumtuer_2 is locked;
		If the player is in Weltraum:
			Now Weltraumtuer is unlocked;
			Now Weltraumtuer_2 is unlocked;
			Now Weltraumtuer is open;
			Now Weltraumtuer_2 is open;
		Otherwise if the player is in Docking_Bay and Weltraum_Richtung is south:
			If the player wears Raumanzug:
				If Raumanzug_Kaputt is false:
					Now Weltraumtuer is unlocked;
					Now Weltraumtuer is open;
				Otherwise:
					Say Raumanzug_Kaputt_Text;
			Otherwise:
				Say Weltraum_Text;
		Otherwise if the player is in Com_Base and Weltraum_Richtung is north:
			If the player wears Raumanzug:
				If Raumanzug_Kaputt is false:
					Now Weltraumtuer_2 is unlocked;
					Now Weltraumtuer_2 is open;
				Otherwise:
					Say Raumanzug_Kaputt_Text;
			Otherwise:
				Say Weltraum_Text.

[mit Startknopf interagieren]
Hilfsgenerator_Aktivierbar is truth state variable. Hilfsgenerator_Aktivierbar is true. [Ist der Hilfsgenerator aktivierbar?]

Understand "Press [Startknopf]" as Pressing_Knopf.
	Pressing_Knopf is an action applying to one thing.
Carry out Pressing_Knopf:
	If Hilfsgenerator_Aktivierbar is true:
		Now Raumanzug_Kaputt is true;
		Now Hilfsgenerator_Aktivierbar is false;
		Now Hilfsgenerator_Aktiviert  is true;
		Now Notruf_Aktivierbar is true;
		Increase Strom by 1;
		Say "Der Hilfsgenerator ist nun aktiviert! Es hat sich ein Splitter gelöst: Jetzt ist dein Raumanzug beschädigt!";
	Otherwise:
		Say "Der Hilfsgenerator wurde schon aktiviert!".

Every turn:
	If Hilfsgenerator_Aktiviert is true:
		Decrease Strom by 1;
		If the player carries the Mobitab:
			Say "Das Mobitab zeigt an, dass nur noch [Strom] Züge Strom da ist!";
	If Strom is 0:
		Now Hilfsgenerator_Aktiviert is false.

[mit Selbstzerstörungsknopf interagieren]
Notruf_Aktivierbar is a truth state variable. Notruf_Aktivierbar is false.
Notruf is a truth state variable. Notruf is false.

Understand "Press [Selbstzerstörungsknopf]" as Pressing_Knopf_2.
	Pressing_Knopf_2 is an action applying to one thing.
Carry out Pressing_Knopf_2:
	If Notruf_Aktivierbar is true:
		Now Notruf_Aktivierbar is false;
		Now Notruf is true;
		Now Wartungsluke is unlocked;
		Say "Der Notruf wurde abgesetzt! Warte auf Hilfe!";
		Change_to_Barry;
	Otherwise:
		If Hilfsgenerator_Aktivierbar is true:
			Say "Du musst den Strom erst anstellen damit du den Notruf absetzen kannst!";
		Else:
			Say "Der Notruf wurde schon abgesetzt!".

Every turn:
	If Notruf is false and Strom is 0:
		Say "[bold type]Du hast den Notruf nicht rechtzeitig aktiviert![roman type]";
		End the story finally.
		
[mit Messenger interagieren]
Understand "Use [Mobitab] to send a message" as Sending_Message.
	Sending_Message is an action applying to one thing.
Carry out Sending_Message:
	If Scene4 is happening and Hilfsgenerator_Aktiviert is true:
		Say "Du sendest eine Nachricht an Percy, dass der Hilfsgenerator aktiviert ist.";
		Change_to_Percy;
	Otherwise:
		Say "Du sendest eine Nachricht an Percy. Percy antwortet, dass du dich erst einmal auf deine Aufgabe konzentrieren sollst.".
	



[*****Räume*****]
Gamma_Junction is a room. It is in Aeußerer_Ring. The printed name is "Gamma Junction". The description is "Im Boden ist ein riesiges Bodenfenster eingelassen. Es sieht gar nicht mal so stabil aus."
SiBa_1 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Gamma_Junction and south of Gamma_Beta_Corridor.
Panel N Gam Junc is a Panel. The Given_SiBa is SiBa_1. Panel N Gam Junc is in Gamma_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Gam Junc is a Panel. 
	The Given_SiBa is SiBa_8. Panel S Gam Junc is in Gamma_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."


Gamma_Beta_Corridor is a room. It is in Aeußerer_Ring. The printed name is "Gamma Beta Corridor". 
SiBa_2 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Gamma_Beta_Corridor and south of Beta_Junction.
Panel N Gam Bet Cor is a Panel.
	The Given_SiBa is SiBa_2. Panel N Gam Bet Cor is in Gamma_Beta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Gam Bet Cor is a Panel.
	The Given_SiBa is SiBa_1. Panel S Gam Bet Cor is in Gamma_Beta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Beta_Junction is a room. It is in Aeußerer_Ring. The printed name is "Beta Junction".
SiBa_3 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Beta_Junction and south of Alpha_Beta_Corridor.
Panel N Bet Junc is a Panel.
	The Given_SiBa is SiBa_3. Panel N Bet Junc is in Beta_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Bet Junc is a Panel.
	The Given_SiBa is SiBa_2. Panel S Bet Junc is in Beta_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
	
Alpha_Beta_Corridor is a room. It is in Aeußerer_Ring. The printed name is "Alpha Beta Corridor".
SiBa_4 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Alpha_Beta_Corridor and south of Alpha_Junction.
Panel N Alp Bet Cor is a Panel. 
	The Given_SiBa is SiBa_4. Panel N Alp Bet Cor is in Alpha_Beta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Alp Bet Cor is a Panel.
	The Given_SiBa is SiBa_3. Panel S Alp Bet Cor is in Alpha_Beta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Alpha_Junction is a room. It is in Aeußerer_Ring. The printed name is "Alpha Junction".
SiBa_5 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Alpha_Junction and south of Alpha_Delta_Corridor.
Panel N Alp Junc is a Panel. 
	The Given_SiBa is SiBa_5. Panel N Alp Junc is in Alpha_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Alp Junc is a Panel.
	The Given_SiBa is SiBa_4. Panel S Alp Junc is in Alpha_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Alpha_Delta_Corridor is a room. It is in Aeußerer_Ring. The printed name is "Alpha Delta Corridor".
SiBa_6 is a SiBa.  The printed name is "Sicherheitsbarriere".
	It is north of Alpha_Delta_Corridor and south of Delta_Junction.
Panel N Alp Del Cor is a Panel. 
	The Given_SiBa is SiBa_6. Panel N Alp Del Cor is in Alpha_Delta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Alp Del Cor is a Panel. 
	The Given_SiBa is SiBa_5. Panel S Alp Del Cor is in Alpha_Delta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Delta_Junction is a room. It is in Aeußerer_Ring. The printed name is "Delta Junction".
SiBa_7 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Delta_Junction and south of Gamma_Delta_Corridor.
Panel N Del Junc is a Panel.
	The Given_SiBa is SiBa_7. Panel N Del Junc is in Delta_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Del Junc is a Panel. 
	The Given_SiBa is SiBa_6. Panel S Del Junc is in Delta_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Gamma_Delta_Corridor is a room. It is in Aeußerer_Ring. The printed name is "Gamma Delta Junction".
SiBa_8 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Gamma_Delta_Corridor and south of Gamma_Junction.
Panel N Gam Del Cor is a Panel. 
	The Given_SiBa is SiBa_8. Panel N Gam Del Cor is in Gamma_Delta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Gam Del Cor is a Panel. 
	The Given_SiBa is SiBa_7. Panel S Gam Del Cor is in Gamma_Delta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Xeno_Lab is a room. It is in Innerer_Ring. The printed name is "Xeno Lab".
Luke_XenoLab is a Luke. The printed name is "Luke_XenoLab". Luke_XenoLab is locked.
	It is up of Gamma_Junction and down of Xeno_Lab.
Panel U Gam Junc is a LuPanel. The Given_Luke is Luke_XenoLab. Panel U Gam Junc is in Gamma_Junction. The description is "Türpanel, welches mit dem dazugehörigen Transponder aktiviert werden kann, aber es sieht nicht gegen Stöße gesichert aus." 

Engeneering_Lab is a room. It is in Innerer_Ring. The printed name is "Engeneering Lab".
Luke_Engineering is a Luke. The printed name is "Luke_Engineering".
	It is up of Beta_Junction and down of Engeneering_Lab.
Panel U Bet Junc is a LuPanel. The Given_Luke is Luke_Engineering. Panel U Bet Junc is in Beta_Junction. The description is "Türpanel, welches mit dem dazugehörigen Transponder aktiviert werden kann, aber es sieht nicht gegen Stöße gesichert aus." 

Med_Lab is a room. It is in Innerer_Ring. The printed name is "Med Lab".
Luke_MedLab is a Luke. The printed name is "Luke_MedLab".
	It is up of Alpha_Junction and down of Med_Lab.
Panel U Alp Junc is a LuPanel. The Given_Luke is Luke_MedLab. Panel U Alp Junc is in Alpha_Junction. The description is "Türpanel, welches mit dem dazugehörigen Transponder aktiviert werden kann, aber es sieht nicht gegen Stöße gesichert aus." 
Dekon Tür is a door. It is inside of Med_Lab. It is outside of Dekontaminationskabine. It is open.
Dekontaminationskabine is a room.  The printed name is "Dekontaminationskabine".
	Dekontaminationskabine is in Innerer_Ring.
	
Solar_Lab is a room. It is in Innerer_Ring. The printed name is "Solar Lab".
Luke_SolarLab is a Luke. The printed name is "Luke_SolarLab".
	It is up of Delta_Junction and down of Solar_Lab.
Panel U Del Junc is a LuPanel. The Given_Luke is Luke_SolarLab. Panel U Del Junc is in Delta_Junction. The description is "Türpanel, welches mit dem dazugehörigen Transponder aktiviert werden kann, aber es sieht nicht gegen Stöße gesichert aus." 

Luke_Hangar is a Luke. It is down of Gamma_Junction and above Hangar.
Panel U Hangar is a LuPanel. The Given_Luke is Luke_Hangar. Panel U Hangar is in Hangar. The description is "Türpanel, welches mit dem Sicherheitsausweis aktiviert werden kann, aber es sieht nicht gegen Stöße gesichert aus."
Panel D Gam Junc is a LuPanel. The Given_Luke is Luke_Hangar. Panel D Gam Junc is in Gamma_Junction. The description is "Türpanel, welches mit dem Sicherheitsausweis aktiviert werden kann, aber es sieht nicht gegen Stöße gesichert aus."
Hangar is a room. The printed name is "Hangar".
Spind is a container. It is in Hangar. Spind is fixed in place. The description is "Der Spind eines Deckoffiziers, wahrscheinlich in Eile offengelassen."

Umkleidekabine is a room. The printed name is "Umkleidekabine".
Umkleidetuer is a door. The printed name is "Umkleidetür".
	It is inside of Hangar and outside of Umkleidekabine.
	It is locked.
	
Docking_Bay is down of Hangar. The printed name is "Docking Bay".
Raumfähre is inside of Docking_Bay. The printed name is "Raumfähre".
Duty_Room is down of Alpha_Junction. The printed name is "Duty Room".
Crew_Quarter is down of Duty_Room. The printed name is "Crew Quarter".
Wartungsluke is a door. It is down of Gamma_Delta_Corridor. It is unlocked.
Wartungsschacht is down of Wartungsluke. The printed name is "Wartungsschacht".
Com_Base is down of Wartungsschacht. The printed name is "Com Base".

Weltraum is a room. The printed name is "Weltraum".
Weltraumtuer is a door. The printed name is "Weltraumtür".
	It is north of Weltraum and south of Docking_Bay.
	It is locked.
Weltraumtuer_2 is a door. The printed name is "Weltraumtür".
	It is south of Weltraum and north of Com_Base.
	It is locked.

Storage_Area is east of Gamma_Junction. It is in Aeußerer_Ring. The printed name is "Storage Area".
Beta_Greenhouse is north of Storage_Area. It is in Aeußerer_Ring. The printed name is "Beta Greenhouse".
Luke_Delta_AI is a Luke. It is down of Delta_AI and above Storage_Area.
Panel U Stor Ar is a LuPanel. The Given_Luke is Luke_Delta_AI. Panel U Stor Ar is in Storage_Area. The description is "Türpanel, welches mit dem dazugehörigen Transponder aktiviert werden kann, aber es sieht nicht gegen Stöße gesichert aus." 

Delta_AI is a room. It is in Innerer_Ring. The printed name is "Delta AI".
Main_Generator is south of Delta_AI. It is in Innerer_Ring. The printed name is "Main Generator".
Delta_Greenhouse is a room. It is in Aeußerer_Ring. The printed name is "Delta Greenhouse".
Storage_Room is south of Delta_Greenhouse. It is in Aeußerer_Ring. The printed name is "Storage Room".
Alpha_AI is up of Storage_Room. It is in Innerer_Ring. The printed name is "Alpha AI".
Transporter_Raum is south of Alpha_AI. It is in Innerer_Ring. The printed name is "Transporter Raum".

Second_Generator is east of Com_Base. The printed name is "Second Generator".
Fitness is east of Crew_Quarter. The printed name is "Fitness".
Cafeteria is east of Duty_Room and down of Storage_Room. The printed name is "Cafeteria".

Antenna_Array is west of Com_Base. The printed name is "Antenna Array".
Briefing_Room is west of Duty_Room. The printed name is "Briefing Room".
Bridge Luke is a door.
	It is down of Briefing_Room.
	Bridge Luke is above Bridge. 
	Bridge Luke is locked.
Bridge is down of Bridge_Luke. The printed name is "Bridge".



[*****Szene 2*****]
Szene2 is a scene.
Szene2 begins when the player is in Xeno_Lab. [noch ändern]
When Szene2 begins:
	Now MedLabUsable is true;
	change_to_Barry;
	Say "[bold type]Szene 2:[line break]";
	Say "Du bist Barry, nachdem du herausgefunden hast dass das Raumschiff einer aufwendigen Reparatur bedarf, wunderst du dich warum noch niemand gekommen ist und wo Percy seit dem Abholen der Palette abgeblieben ist. Du fängst an nach ihm zu suchen[roman type]."
Szene2 ends when DekonDone is true.

After entering Gamma_Junction:
	If the player is Barry:
		Now Stationsalarm is false;
		Say "Du hörst noch kurz den Stationsalarm und ein lautes Pfeifen aus dem Xeno Lab. Doch es verstummt kurz darauf und es ist ein klirren zu hören.";
	Continue the action;
	


[*****Scene 4*****]
Sauerstoff_Abfall is a truth state variable. Sauerstoff_Abfall is false.

Scene4 is a scene.
Scene4 begins when Szene2 ends. [noch ändern]
When Scene4 begins:
	[erster Satz mit "Med-Lab" kann weg => Übergang Scene 2 zu 4]
	Say "[italic type]Scene 4:[line break]";
	Say "Du bist Barry und besprichst dich mit Percy! ...es soll ein Notruf abgesetzt werden. Dazu musst du den Hilfsgenerator im Kommunikationsmodul starten. Nach dem Start des Hilfsgenerators gibst du mit dem Mobitab eine Nachricht an Percy. Percy muss dann schnellst möglich den Selbstzerstörungsknopf auf der Brücke drücken, um den Notruf abzusetzen (der Hilfsgenerator hat nicht lange Energie). Danach muss du zurück zu Percy.[line break]";
	Say "Ein Tipp: In dem Umkleideraum im Hangar befindet sich ein Raumanzug.[roman type]";
	Now Umkleidetuer is unlocked.
Scene4 ends when Sauerstoff_Abfall is true.


[Bodenfenster geht kaputt + Sauerstoffabfall]
Instead of going to Wartungsschacht:
	If the player carries 1 thing and the player carries the Mobitab or the player carries 0 things:
		Continue the action;
	Otherwise:
		Say "Du trägst zu viel! Du kannst nur das Mobitab mitnehmen!".
		
After going up from Wartungsschacht:
	If Sauerstoff_Abfall is false:
		Say "Die eingeklemmte Palette löst sich. Sie hat sich durch die zugehende Luke so sehr beschleunigt dass das Bodenfenster kaputt geht! Der Sauerstoff wird nun weniger im äußeren Ring!";
		Now Sauerstoff_Abfall is true;
		Now Luke_XenoLab is closed;
		Now Luke_XenoLab is locked;  
		Now the Palette is in Gamma_Junction; 
		Now the description of Gamma_Junction is "Das Bodenfenster wurde durch die Palette schwer beschädigt und es entweicht Luft.";
		Increase Sauerstoff by 1;
	Continue the action;

Every turn:
	If Sauerstoff_Abfall is true and Sauerstoff is greater than 0:
		Decrease Sauerstoff by 1;
		If the player carries the Mobitab:
			Say "Das Mobitab zeigt an, dass nur noch [Sauerstoff] Züge Sauerstoff im äußeren Ring vorhanden sind!";
	If Sauerstoff is 0 and the player is in a room in aeußerer_Ring: 
		Say "[bold type]Es ist kein Sauerstoff mehr vorhanden! Du erstickst![roman type]";
		End the story finally.
		


[*****Endscene*****]
Endscene is a scene.
Endscene begins when Scene4 ends. [noch ändern]
When Endscene begins:
	Change_to_Barry;
	Now Percy is in Docking_Bay;
	Say "[italic type]Endscene:[line break]";
	Say "Ein Rettungsteam ist angekommen. Gehe in das Docking Bay, wo das Rettungsteam wartet. Percy wartet dort auch schon auf dich![line break][roman type]".
Endscene ends when the player is in Docking_Bay.
When Endscene ends:
	Say "[bold type]Glückwunsch, du hast es geschafft! Du und Percy kehren nun wieder zurück nach Hause![roman type]";
	End the story finally.