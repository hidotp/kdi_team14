"Lupus Station" by Team14
Use MAX_STATIC_DATA of 100000000.

[Fertig]

[*****globale Variablen*****]
Laute_Aktionen is a number variable. Laute_Aktionen is 0.
Stationsalarm is a truth state variable. Stationsalarm is true.
Pfeifen is a truth state variable. Pfeifen is true.
Hauptenergieabfall is a truth state variable. Hauptenergieabfall is false.
Kontcount is a number variable. Kontcount is 0.
Percy_is_bei_k is a truth state variable. Percy_is_bei_k is false.
dekonKontcount is a number variable. dekonKontcount is 0.
DekonDone is a truth state variable. DekonDone is false.
druckluftLadezustand is a truth state variable. druckluftLadezustand is false.
Hangar_luke_close is a truth state variable. Hangar_luke_close is true.
Scene4_sp_wechsel is a truth state variable. Scene4_sp_wechsel is false.
Percy_Medlab_alleine is a truth state variable. Percy_Medlab_alleine is false.
Wieder_Percy is a truth state variable. Wieder_percy is false.
Percy_Konter is a number variable. Percy_Konter is 0.
Sauerstoff is a number variable. Sauerstoff is 12. [Sauerstoffzähler]
Strom is a number variable. Strom is 10. [Stromzähler]



[*****Regionen*****]
innererRing is a region.
aeußererRing is a region.



[*****Definitionen*****]

	[Neue Raumliste]
	Raumliste is a list of Rooms that varies.

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
	Krankenbett is a supporter. It is in Med_Lab. It is enterable. It is fixed in place. The description is "Ein Krankenbett für eine Person, sieht sogar relativ gemütlich aus."

	[Palette]
	Palette is a thing. It is in Raumfähre. The description is "Palette die alleine zu schwer zum Tragen oder schieben ist.".

	[Leiche]
	Leiche is a Supporter.
	It is fixed in place. Instead of taking Leiche: say "Du wagst es nicht die Leiche zu bewegen.“.
	It is not enterable.
	Leiche is in Gamma_Delta_Corridor. 
	
	[Laborkittel] 
	Laborkittel is a thing. It is wearable. It is portable. The description of Laborkittel is "Ein leicht blutiger und zerschossener Laborkittel mit einem eingenähten Transponder für das Xeno-Lab.“.
	Laborkittel is on Leiche.

	[XenoKnopf]
	XenoKnopf is a thing. It is fixed in place. It is in Xeno_Lab. The description is "Ein schnell blinkender Knopf der praktisch schreit: DRÜCK MICH!".
	
	[Klappe]
	Klappe is a container. It is fixed in place. Klappe is locked. Klappe is closed. The carrying capacity of Klappe is 1. Klappe is in Xeno_Lab. The description of Klappe is "Eine Klappe in der Wand die geschlossen ist. Du siehst keine Möglichkeit sie aufzubrechen."
	


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
	If the player carries the Mobitab:	
		count_Kontaminiert;
		If Kontcount > 0:
			Say "[bold type]Mobitab: [roman type]Anzahl der Kontaminierten: [Kontcount]";
			If Percy_is_bei_k is true:
				Say " (Das ist Percy)";
			Say "[line break]";
			Continue the action.

[Bewegen Methodik (Beschreibungstext durch den Sationsalarm und den Hauptenergieaabfall(Dieser nur im Innerem Ring))]
Richtung_StAla is a direction variable.
Raum_Test_1 is a room variable. 
Raum_Test_2 is a room variable. 

Every turn:
	[Now Raum_Test_1 is the location of the player;]
	[If Raum_Test_1 is not Raum_Test_2:]
	If Stationsalarm is true:
		If the player is in a room in innererRing or the player is in a room in aeußererRing:
			Say "Der Stationsalarm gibt einen ohrenbetäubenden Sirenenton von sich.";	
	If the player is in a room in innererRing:
		If Hauptenergieabfall is true:
			If Hilfsgenerator_Aktivierbar is false:
				Say "Durch das Deckenfenster sieht man den rot glühenden Maschinenkern.";
			Else:
				Say "Durch das Deckenfenster sieht man den orange glühenden Maschinenkern.";
		Else:
			Say "Durch das Deckenfenster sieht man den grün glühenden Maschinenkern.";
	If the player is in Xeno_Lab:
		If Pfeifen is true:
			Say "Ein ohrenbetäubendes Pfeifen ist zu hören.";
	If the player is in Gamma_Junction:
		If Pfeifen is true and Luke_XenoLab is open and XenoLuke_Blockiert is true:
			Say "Ein ohrenbetäubendes Pfeifen ist aus dem Xeno Lab zu hören.".
	[Now Raum_Test_2 is Raum_Test_1.]


[zum Wartungsschacht gehen]
Instead of going to Wartungsschacht:
	If the player carries less than 3 things and the player carries the Mobitab and the player carries the Sicherheitsausweis:
		Continue the action;
	Otherwise:
		If the player carries less than 2 things:
			If the player carries the Mobitab or the player carries the Sicherheitsausweis:
				Continue the action;
			Otherwise:
				If the player carries less than 1 thing:
					Continue the action;
				Otherwise:
					Say "Du trägst zu viel! Du kannst nur das Mobitab und den Sicherheitsausweis mitnehmen!";
		Otherwise:
			If the player carries less than 1 thing:
				Continue the action;
			Otherwise:
				Say "Du trägst zu viel! Du kannst nur das Mobitab und den Sicherheitsausweis mitnehmen!".


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
			Now Bridge Luke is unlocked;
			Continue the action;			
		Otherwise:
			Say "Die Kommandosperre hat die Luke blockiert... nur ein Stromausfall könnte diese Sperre aufheben.";
			Continue the action;	
	Otherwise:
		Continue the action.

[Beende Spiel, wenn Percy und Kontaminierter in einem Raum]
one_time_say is a truth state variable. one_time_say is true.
To Percy_und_Kontaminierter:
	If one_time_say is true:
		Say "[bold type]Es ist nicht mehr möglich Percy zu dekontaminieren! (Percy und ein anderer Kontaminierter befinden sich in einem Raum)[roman type]";
		Now one_time_say is false;
	End the story finally.

[Entriegel alle Barrien und öffne sie]
To oeffne_Barrieren:
	Now SiBa_1 is unlocked;
		Now SiBa_1 is open;
	Now SiBa_2 is unlocked;
		Now SiBa_2 is open;
	Now SiBa_3 is unlocked;
		Now SiBa_3 is open;
	Now SiBa_4 is unlocked;
		Now SiBa_4 is open;
	Now SiBa_5 is unlocked;
		Now SiBa_5 is open;
	Now SiBa_6 is unlocked;
		Now SiBa_6 is open;
	Now SiBa_7 is unlocked;
		Now SiBa_7 is open;
	Now SiBa_8 is unlocked;
		Now SiBa_8 is open;
	Now Luke_Hangar is unlocked;
		Now Luke_Hangar is open;
		Now Hangar_luke_close is false.

[Kontaminiertencounter -- Dekontaminationskabine]
To count_KontDekon:
	Now dekonKontcount is 0;
	If Kontaminierter_1 is in Dekontaminationskabine:
		Increase dekonKontcount by 1;
	If Kontaminierter_2 is in Dekontaminationskabine:
		Increase dekonKontcount by 1;
	If Kontaminierter_3 is in Dekontaminationskabine:
		Increase dekonKontcount by 1;
	If Kontaminierter_4 is in Dekontaminationskabine:
		Increase dekonKontcount by 1;
	If Kontaminierter_5 is in Dekontaminationskabine:
		Increase dekonKontcount by 1;
	If Kontaminierter_6 is in Dekontaminationskabine:
		Increase dekonKontcount by 1;
	If Kontaminierter_7 is in Dekontaminationskabine:
		Increase dekonKontcount by 1;
	If Kontaminierter_8 is in Dekontaminationskabine:
		Increase dekonKontcount by 1;
	If Is_Kontaminiert of Percy is true:
		If Percy is in Dekontaminationskabine:
			Increase dekonKontcount by 1.

[Kontaminiertencounter -- MobiTab]
To count_Kontaminiert:
	Now Percy_is_bei_k is false;
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
			Increase Kontcount by 1;
			Now Percy_is_bei_k is true.
			
[Dekontaminiation]
DekonText is a text variable. DekonText is "Du hast Percy erfolgreich dekonatminiert! Durch die Dekontamination wurde der Maschinenkern so überlastet das Barry nun einen Hauptenenergieabfall feststellt. [line break] Die Kommandosperre der Brücke ist dadurch aufgehoben.".

Instead of closing Dekon Tür:
	If Hauptenergieabfall is false:
		If Stationsalarm is true:
			count_KontDekon;
			If dekonKontcount <= 1:
				If the Player is not in Dekontaminationskabine:
					If Percy is in Dekontaminationskabine:
						dekontaminiere_Percy;
						Now Hauptenergieabfall is true;
						Say DekonText;
						Now Bridge Luke is unlocked;
						Now DekonDone is true;
						Continue the action;
					Else:
						If dekonKontcount is 1:
							Say "[bold type]Du hast die falsche Person dekontaminiert![roman type]";
							End the story finally;
						Else:
							Say "Niemand ist in der Kabine.";
				Else:
					Say "Es kann nur eine Person in der Kabine während der Dekonatmination sein!";			
			Else:
				Say "Es sind zu viele Kontaminierte in der Kabine zum dekontaminieren. Maximal eine kann aufeinmal dekontaminiert werden.";
		Else:
			Say "Du weist doch garnicht was hier los ist. Vielleicht schaust du dir zuerst den Vidoblock an!";
	Else:
		Say "Die Energie des Maschinenkerns hat nur für eine Dekontamination gereicht.".
	
[Mobitab nehmen]
Instead of taking the Mobitab:
	If the player is Barry:
		Continue the action;
	Else:
		Say "Du traust dir das nicht zu, das zu nehmen.".

[Drucklufthammer nehmen]
Instead of taking the Drucklufthammer:
	If the player is Barry:
		Continue the action;
	Else:
		Say "Du brauchst das noch nicht.".

[Palette nehmen]
Instead of taking the Palette:
	Say "Wo willst du den die Palette hinpacken? Die ist doch viel zu groß.".


[RäumeListe erstellen]
To createRaumliste:
	Remove the list of Rooms from Raumliste;
	If the Room up of the location of the player is not nothing:
		If the door up of the location of the player is not locked:
			Add Room up of the location of the player to Raumliste;
	If the Room down of the location of the player is not nothing:
		If the door down of the location of the player is not locked:
			Add Room down of the location of the player to Raumliste;
	If the Room north of the location of the player is not nothing:
		If the door north of the location of the player is not locked:
			Add Room north of the location of the player to Raumliste;
	If the Room south of the location of the player is not nothing:
		If the door south of the location of the player is not locked:
			Add Room south of the location of the player to Raumliste;
	If the Room east of the location of the player is not nothing:
		If the door east of the location of the player is not locked:
			Add Room east of the location of the player to Raumliste;
	If the Room west of the location of the player is not nothing:
		If the door west of the location of the player is not locked:
			Add Room west of the location of the player to Raumliste;
	If the Room inside of the location of the player is not nothing:
		If the door inside of the location of the player is not locked:
			Add Room inside of the location of the player to Raumliste;			
	If the Room outside of the location of the player is not nothing:
		If the door outside of the location of the player is not locked:
			Add Room outside of the location of the player to Raumliste;

[Info zum Hebel]
Before going from Gamma_Delta_Corridor to Wartungsschacht:
	If Wartungsluke is locked:
		Say "Du kannst die Luke nicht öffnen. Der Hebel ist abbgebrochen.".



[*****Aktionen*****]
[verwende Variable "Increase Laute_Aktionen by 1." für laute Aktion] 

[Klatschen]
Understand "clap in Hands" as Clapping.
	Clapping is an action applying to nothing.
Carry out clapping:
	If Stationsalarm is false:
		Increase Laute_Aktionen by 1;
	Otherwise:
		If the player is not in a room in innererRing and the player is not in a room in aeußererRing:
			Increase Laute_Aktionen by 1.
Report Clapping:
	If Stationsalarm is true:
		If the player is in a room in innererRing or the player is in a room in aeußererRing:
			Say "Du hast in die Hände geklatscht, doch der Stationsalarm ist zu laut!";
		Else:
			If Kontaminierter is in the location of the player:
				Say "Du hast in die Hände geklatscht und der Kontaminierter hat dich bemerkt!";
			Else: 
				Say "Du hast in die Hände geklatscht!";
	Else:
		If Kontaminierter is in the location of the player:
			Say "Du hast in die Hände geklatscht und der Kontaminierter hat dich bemerkt!";
		Else: 
			Say "Du hast in die Hände geklatscht!".

[Sprechen]
Understand "talk with [any Kontaminierter]" as Talking.
	Talking is an action applying to one thing.
Carry out Talking:
	If Stationsalarm is false:
		Increase Laute_Aktionen by 1;
	Otherwise:
		If the player is not in a room in innererRing and the player is not in a room in aeußererRing:
			Increase Laute_Aktionen by 1.
Report Talking:
	If Stationsalarm is true:
		If the player is in a room in innererRing or the player is in a room in aeußererRing:
			Say "Du hast den Kontaminierten angesprochen, doch der Stationsalarm ist zu laut und er konnte dich nicht hören.";
		Else:
			Say "Du hast den Kontaminierten angesprochen und seine Aufmerksamkeit erlangt.";
	Else:
		Say "Du hast den Kontaminierten angesprochen und seine Aufmerksamkeit erlangt.".

[Drucklufthammer aufladen]
Understand "charge [Drucklufthammer] with [any Panel]" as Charging.
	Charging is an action applying to two things.
Check Charging:
	If the player is not carrying the Drucklufthammer:
		Say "Du hast den Drucklufthammer nicht bei dir." instead;
	If druckluftLadezustand is true:
		Say "Der Drucklufthammer ist schon geladen!" instead;
Carry out Charging:
	If druckluftLadezustand is false:
		Now druckluftLadezustand is true;
Report Charging:
	Say "Du hast den Drucklufthammer aufgeladen.".
	
[Drucklufthammer benutzen]
Understand "use [Drucklufthammer]" as Druckluften.
	Druckluften is an action applying to one thing.
Check Druckluften: 
	If the player is not carrying the Drucklufthammer:
		Say "Du hast den Drucklufthammer nicht bei dir." instead;
	If druckluftLadezustand is false:
		Say "Der Drucklufthammer hat keine Energie. Du musst ihn an einem Panel (N oder S) aufladen." instead;
Carry out Druckluften:
	If druckluftLadezustand is true:
		Increase Laute_Aktionen by 1;
		Now druckluftLadezustand is false;
Report Druckluften:
	If Kontaminierter is in the location of the player:
		Say "Du hast mit dem Drucklufthammer ein lautes Geräusch gemacht und der Kontaminierte hat dich bemerkt! Dein Akku ist nun leer.";
	Else: 
		Say "Du hast den Drucklufthammer benutzt und ein lautes Geräusch gemacht. Dein Akku ist nun leer.".

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
		Say "Du hast die zugehörige Tür des Panels entriegelt.".

[Luke - Sicherheitsausweis]
hLukeTurn is a number variable. hLukeTurn is 0.

Understand "use [Sicherheitsausweis] with [LuPanel U Hangar]" as u_entriegeln.
	u_entriegeln is an action applying to two things.
Check u_entriegeln:
	If the Player is not carrying the Sicherheitsausweis:
		Say "Du trägst nicht den Sicherheitsausweis!" instead;
Carry out u_entriegeln:
	Now Luke_Hangar is unlocked;
	Now Luke_Hangar is open;
	Now hLukeTurn is 2.
Report u_entriegeln:
	Say "Du hast die Hangarluke für einen Zug geöffnet.[line break]".

Understand "use [Sicherheitsausweis] with [LuPanel D Gam Junc]" as d_entriegeln.
	d_entriegeln is an action applying to two things.
Check d_entriegeln:
	If the Player is not carrying the Sicherheitsausweis:
		Say "Du trägst nicht den Sicherheitsausweis!" instead;
Carry out d_entriegeln:
	Now Luke_Hangar is unlocked;
	Now Luke_Hangar is open;
	Now hLukeTurn is 2.
Report d_entriegeln:
	Say "Du hast die Hangarluke für einen Zug geöffnet.".
	
Every turn:
	If Hangar_luke_close is true:
		If hLukeTurn is not 0:
			Decrease hLukeTurn by 1;
			If hLukeTurn is 0:
				Now Luke_Hangar is locked;
				Now Luke_Hangar is closed;
				Say "Die Hangarluke hat sich geschlossen![line break]";
		If xLukeTurn is not 0:
			Decrease xLukeTurn by 1;
			If xLukeTurn is 0 and XenoLuke_Blockiert is false:
				Now Luke_XenoLab is locked;
				Now Luke_XenoLab is closed;
				Say "Die XenoLab Luke hat sich geschlossen.".
		
[Luke - Laborkittel]
XenoLuke_Blockiert is a truth state variable.
xLukeTurn is a number variable. xLukeTurn is 0.

Understand "use [Laborkittel] with [Luke_XenoLab]" as xenoEntriegeln.
	xenoEntriegeln is an action applying to two things.
Check xenoEntriegeln:
	If XenoLuke_Blockiert is true:
		Say "Die Luke ist schon blockiert, du musst sie nicht nochmal aufmachen." instead;
	If the Player is not wearing the Laborkittel:
		Say "Du hast den Laborkittel nicht an, du musst in anziehen damit du die Luke öffnen kannst!" instead.
Carry out xenoEntriegeln:
	Now Luke_XenoLab is unlocked;
	Now Luke_XenoLab is open;
	Now xLukeTurn is 2.
Report xenoEntriegeln:
	Say "Du hast die XenoLab Luke für einen Zug geöffnet.".

Instead of going up from Gamma_Junction:
	If XenoLuke_Blockiert is true:
		Continue the action;
	Else:
		If Luke_XenoLab is open:
			Say "Du traust dich nicht durch die Luke zu gehen, es würde Sinn machen sie mit etwas zu blockieren... wie zum Beispiel mit der Palette.";
		Else:
			Continue the action.
			
Instead of closing the Luke_XenoLab: 
	If XenoLuke_Blockiert is true:
		Say "Du kannst die Luke nicht schließen, die Palette blockiert sie.";
	Else:
		Continue the action.

[LuPanel kaputtmachen]
Understand "hit [any LuPanel] with [Mobitab]" as Kaputtmachen.
	Kaputtmachen is an action applying to two things.
Check Kaputtmachen:
	If the Player is not carrying the MobiTab:
		Say "Du trägst nicht das Mobitab!" instead.
Carry out Kaputtmachen:
	Now the Given_Luke of the noun is unlocked.
Report Kaputtmachen:
	Say "Du hast das Panel kaputtgemacht. Jetzt kannst du über die Luke manuell öffnen oder schließen.".
	
[Med-Lab Pult Benutzung]
MedLabText is a text variable. MedLabText is "Als du mit dem Pult interagierst fängt plötzlich der Videoblog an zu spielen: [line break] [bold type]Stationsarzt: [roman type]... durch eine fehlgeschlagene Dekontamination ist ein Erreger von dem nahegelegenem Planeten auf die Station gekommen. Dieser Erreger hat in kurzer Zeit alle Mitarbeiter der Station befallen. Ich habe es noch geschafft einen speziellen Filter in die Luftzirkulation einzubauen und eine spezielle Dekontaminationskabine für eine Person zu konstruieren die diese Person gesunden lässt, sobald die Tür geschlossen ist... ich mache diesen Videoblog noch mit meiner letzten Kraft... ich denke das mir nicht mehr viel Zeit bleibt. [line break]Der Stationsalarm geht nach dem Anschauen des Videoblogs wieder los.[line break]".
MedLabUsable is a truth state variable. MedLabUsable is false.

Understand "interact with [Med-Lab Pult]" as medInteracting.
	medInteracting is an action applying to one thing.
Check medInteracting:
	If MedLabUsable is false:
		Say "Das interressiert dich noch nicht. Da müsste erst ein Freund kontaminiert sein." instead.
Carry out medInteracting:
	Increase Laute_Aktionen by 1;
	Now Stationsalarm is true.
Report medInteracting:
	Say MedLabText.
	

[XenoKnopf druecken]
gedrueckt is a truth state variable. gedrueckt is false.

Understand "press [XenoKnopf]" as druecken.
druecken is an action applying to one thing.
Check druecken:
	If gedrueckt is true:
		Say "Dieser Knopf tut nichts." instead;
Carry out druecken:
	Now Stationsalarm is false;
	Now Pfeifen is false;
	Now gedrueckt is true;
	Now Klappe is open;
	Now Klappe is unlocked;
	Now the description of XenoKnopf is "Der Knopf blinkt nicht mehr und er bleibt in seiner gedrückten Position.".
Report druecken:
	Say "Tatsächlich tut es das, das Pfeifen und der Alarm verstummen. Eine Klappe in der Wand öffnet sich und gibt den Blick auf eine Phiole mit rosafarbenen Nebel frei. Das Blinken des Knopfes erlischt und der Knopf ist nun ohne Funktion.".

[Phiole]
Phiole is a Thing. Phiole is in Klappe. 

Understand "take [Phiole]" as nehmen.
nehmen is an action applying to one thing.
Check nehmen:
	If Klappe is locked:
		Say "Du musst vorher die Klappe öffnen um die Phiole zu nehmen." instead.
Carry out nehmen:
	kontaminiere_Percy;
 	Now Szene1Laeuft is 2.
Report nehmen:
	Say "Als Percy versucht, sie an sich zu nehmen, entgleitet sie ihm und faällt auf den Boden und zerbricht. Sofort wird der Nebel freigesetzt, die ihm den Atem abschnüren. Er wird Kontaminiert und blickt fortan mit starren Blick in die Gegend.".

	
[Greifer anbringen]
PaletteVerschieben is a truth state variable. PaletteVerschieben is false.

Understand "connect [Antigravitationsgreifer] with [Palette]" as usePalette.
usePalette is an action applying to two things.
Check usePalette:
	If the Player is not carrying the Antigravitationsgreifer:
		say "Du trägst nicht den Antigravitationsgreifer!" instead;
Carry out usePalette:
	Now paletteVerschieben is true;
	Now the Antigravitationsgreifer is nowhere;
	Now the description of Palette is "Eine durch den Antigravitationsgreifer schwebende Palette.".
Report usePalette:
	say "Du hast den Greifer an die Palette angebracht.".
	
Rand is a number variable. Rand is 0. 
	
[Palette bewegen]
Understand "push [Palette]" as MovePalette.
	MovePalette is an action applying to one thing.
Check MovePalette:
	If paletteVerschieben is false:
		If the Palette is in Xeno_Lab:
			Say "Die Palette blockiert die Luke und ist nicht bewegbar." instead;
		Otherwise:
			Say "Du kannst die Palette noch nicht bewegen! Versuche den Antigravitationsgreifer anzubringen." instead.
Carry out MovePalette:
	createRaumliste; 
	If the number of entries of Raumliste is not 0:
		Now Rand is a random number between 1 and the number of entries of Raumliste;
		If entry Rand of Raumliste is Xeno_Lab:
			Say "Der Antigravitationsgreifer wird durch den Maschinenkern der Station überlastet. Die Palette blockiert nun die Xeno-Luke und du kannst in das Xeno Lab eintreten.";
			Now Antigravitationsgreifer is nowhere;
			Now paletteVerschieben is false;
			Now XenoLuke_Blockiert is true;
			Now the Palette is in entry Rand of Raumliste;
		Else:
			Now the Palette is in entry Rand of Raumliste;
			Say "Jetzt ist die Palette in [entry Rand of Raumliste].".



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
			Say "[bold type]Du wurdest kontaminiert![roman type]";
			End the Story finally;
	If Scene4_sp_wechsel is true and Barry_ist_da is false:
		Now the player is Percy;
		count_Kontaminiert;
		Now the player is Barry;
		If Kontcount is greater than 0:
			Increase Percy_Konter by 1;
		Otherwise:
			Now Percy_Konter is 0;
		If Kontcount is greater than 0 and Percy_Konter is greater than 3:
			Say "[bold type]Percy wurde kontaminiert![roman type]";
			End the story finally;
	If Percy_Medlab_alleine is true and Wieder_Percy is false:
		Now the player is Percy;
		count_Kontaminiert;
		Now the player is Barry;
		If Kontcount is greater than 0:
			Increase Percy_Konter by 1;
		Otherwise:
			Now Percy_Konter is 0;
		If Kontcount is greater than 0 and Percy_Konter is greater than 3:
			Say "[bold type]Percy wurde kontaminiert![roman type]";
			End the story finally;
	If Barry_ist_da is true:
		Now the player is Barry;
		count_Kontaminiert;
		Now the player is Percy;
		If Kontcount is greater than 0:
			Increase Percy_Konter by 1;
		Otherwise:
			Now Percy_Konter is 0;
		If Kontcount is greater than 0 and Percy_Konter is greater than 3:
			Say "[bold type]Barry wurde kontaminiert![roman type]";
			End the story finally.

Kontaminierter_1 is a Kontaminierter. The printed name is "Kontaminierter".
	It is in Bridge.
Kontaminierter_2 is a Kontaminierter. The printed name is "Kontaminierter".
	It is in Bridge.
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


[Scene 1]
Palette is a thing. It is in Raumfähre. 
Antigravitationsgreifer is a thing. It is portable. It is in Raumfähre. 


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
	If Scene4 is happening and Raumanzug_Kaputt is false:
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
		Say "Der Hilfsgenerator ist nun aktiviert! Es hat sich ein Splitter gelöst: Jetzt ist dein Raumanzug beschädigt![line break]";
		Say "Sende Percy eine Nachricht, dass er den Notruf absetzen kann!";
	Otherwise:
		Say "Der Hilfsgenerator wurde schon aktiviert!".

Every turn:
	If Hilfsgenerator_Aktiviert is true:
		Decrease Strom by 1;
		If the player carries the Mobitab:
			If Strom is greater than 0:
				Say "[bold type]Mobitab: [roman type]Züge an Energie: [Strom][line break]";
			Otherwise:
				Say "[bold type]Mobitab: [roman type]Der Hilfsgenerator hat keine Energie mehr!";
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
		Say "Der Notruf wurde abgesetzt! Warte auf Hilfe!";
		Change_to_Barry;
		Say "Gehe jetzt wieder zu Percy!";
		Now Percy_Konter is Aktionen_ohne_Geraeusch;
		Increase Percy_Konter by one;
		Now Scene4_sp_wechsel is true;
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
		Now Wieder_Percy is true;
		Now Percy_Konter is 0;
	Otherwise:
		If Is_Kontaminiert of Percy is true:
			Say "Percy antwortet nicht.";
		Otherwise:
			Say "Du sendest eine Nachricht an Percy. Percy antwortet, dass du dich erst einmal auf deine Aufgabe konzentrieren sollst.".
	



[*****Räume*****]
Gamma_Junction is a room. It is in aeußererRing. The printed name is "Gamma Junction". The description is "Im Boden ist ein riesiges Bodenfenster eingelassen. Es sieht gar nicht mal so stabil aus."
SiBa_1 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Gamma_Junction and south of Gamma_Beta_Corridor.
Panel N Gam Junc is a Panel. The Given_SiBa is SiBa_1. Panel N Gam Junc is in Gamma_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Gam Junc is a Panel. 
	The Given_SiBa is SiBa_8. Panel S Gam Junc is in Gamma_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."


Gamma_Beta_Corridor is a room. It is in aeußererRing. The printed name is "Gamma Beta Corridor". 
SiBa_2 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Gamma_Beta_Corridor and south of Beta_Junction.
Panel N Gam Bet Cor is a Panel.
	The Given_SiBa is SiBa_2. Panel N Gam Bet Cor is in Gamma_Beta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Gam Bet Cor is a Panel.
	The Given_SiBa is SiBa_1. Panel S Gam Bet Cor is in Gamma_Beta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Beta_Junction is a room. It is in aeußererRing. The printed name is "Beta Junction".
SiBa_3 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Beta_Junction and south of Alpha_Beta_Corridor.
Panel N Bet Junc is a Panel.
	The Given_SiBa is SiBa_3. Panel N Bet Junc is in Beta_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Bet Junc is a Panel.
	The Given_SiBa is SiBa_2. Panel S Bet Junc is in Beta_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
	
Alpha_Beta_Corridor is a room. It is in aeußererRing. The printed name is "Alpha Beta Corridor".
SiBa_4 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Alpha_Beta_Corridor and south of Alpha_Junction.
Panel N Alp Bet Cor is a Panel. 
	The Given_SiBa is SiBa_4. Panel N Alp Bet Cor is in Alpha_Beta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Alp Bet Cor is a Panel.
	The Given_SiBa is SiBa_3. Panel S Alp Bet Cor is in Alpha_Beta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Alpha_Junction is a room. It is in aeußererRing. The printed name is "Alpha Junction".
SiBa_5 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Alpha_Junction and south of Alpha_Delta_Corridor.
Panel N Alp Junc is a Panel. 
	The Given_SiBa is SiBa_5. Panel N Alp Junc is in Alpha_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Alp Junc is a Panel.
	The Given_SiBa is SiBa_4. Panel S Alp Junc is in Alpha_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Alpha_Delta_Corridor is a room. It is in aeußererRing. The printed name is "Alpha Delta Corridor".
SiBa_6 is a SiBa.  The printed name is "Sicherheitsbarriere".
	It is north of Alpha_Delta_Corridor and south of Delta_Junction.
Panel N Alp Del Cor is a Panel. 
	The Given_SiBa is SiBa_6. Panel N Alp Del Cor is in Alpha_Delta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Alp Del Cor is a Panel. 
	The Given_SiBa is SiBa_5. Panel S Alp Del Cor is in Alpha_Delta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Delta_Junction is a room. It is in aeußererRing. The printed name is "Delta Junction".
SiBa_7 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Delta_Junction and south of Gamma_Delta_Corridor.
Panel N Del Junc is a Panel.
	The Given_SiBa is SiBa_7. Panel N Del Junc is in Delta_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Del Junc is a Panel. 
	The Given_SiBa is SiBa_6. Panel S Del Junc is in Delta_Junction. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Gamma_Delta_Corridor is a room. It is in aeußererRing. The printed name is "Gamma Delta Corridor".
SiBa_8 is a SiBa. The printed name is "Sicherheitsbarriere".
	It is north of Gamma_Delta_Corridor and south of Gamma_Junction.
Panel N Gam Del Cor is a Panel. 
	The Given_SiBa is SiBa_8. Panel N Gam Del Cor is in Gamma_Delta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."
Panel S Gam Del Cor is a Panel. 
	The Given_SiBa is SiBa_7. Panel S Gam Del Cor is in Gamma_Delta_Corridor. The description is "Türpanel, welches mit einem Sicherheitsausweis aktiviert werden kann. Es sieht sehr stabil aus."

Xeno_Lab is a room. It is in innererRing. The printed name is "Xeno Lab".
Luke_XenoLab is a Luke. The printed name is "Luke_XenoLab". Luke_XenoLab is locked.
	It is up of Gamma_Junction and down of Xeno_Lab.
LuPanel U Gam Junc is a LuPanel. The Given_Luke is Luke_XenoLab. LuPanel U Gam Junc is in Gamma_Junction. The description is "Türpanel, welches mit dem dazugehörigen Transponder aktiviert werden kann, aber es sieht nicht gegen Stöße gesichert aus." 

Engeneering_Lab is a room. It is in innererRing. The printed name is "Engeneering Lab".
Luke_Engineering is a Luke. The printed name is "Luke_Engineering".
	It is up of Beta_Junction and down of Engeneering_Lab.
LuPanel U Bet Junc is a LuPanel. The Given_Luke is Luke_Engineering. LuPanel U Bet Junc is in Beta_Junction. The description is "Türpanel. Es sieht nicht so aus, als sie es gegen Stöße gesichert."

Med_Lab is a room. It is in innererRing. The printed name is "Med Lab".
Luke_MedLab is a Luke. The printed name is "Luke_MedLab".
	It is up of Alpha_Junction and down of Med_Lab.
LuPanel U Alp Junc is a LuPanel. The Given_Luke is Luke_MedLab. LuPanel U Alp Junc is in Alpha_Junction. The description is "Türpanel. Es sieht nicht so aus, als sie es gegen Stöße gesichert." 
Dekon Tür is a door. It is inside of Med_Lab. It is outside of Dekontaminationskabine. It is open.
Dekontaminationskabine is a room.  The printed name is "Dekontaminationskabine".
	Dekontaminationskabine is in innererRing.
	
Solar_Lab is a room. It is in innererRing. The printed name is "Solar Lab".
Luke_SolarLab is a Luke. The printed name is "Luke_SolarLab".
	It is up of Delta_Junction and down of Solar_Lab.
LuPanel U Del Junc is a LuPanel. The Given_Luke is Luke_SolarLab. LuPanel U Del Junc is in Delta_Junction.The description is "Türpanel. Es sieht nicht so aus, als sie es gegen Stöße gesichert."

Hangar is a room. The printed name is "Hangar".
Luke_Hangar is a Luke. It is down of Gamma_Junction and above Hangar.
LuPanel U Hangar is a LuPanel. The Given_Luke is Luke_Hangar. LuPanel U Hangar is in Hangar. The description is "Türpanel, welches mit dem Sicherheitsausweis aktiviert werden kann, aber es sieht nicht gegen Stöße gesichert aus."
LuPanel D Gam Junc is a LuPanel. The Given_Luke is Luke_Hangar. LuPanel D Gam Junc is in Gamma_Junction. The description is "Türpanel, welches mit dem Sicherheitsausweis aktiviert werden kann, aber es sieht nicht gegen Stöße gesichert aus."
Spind is a container. It is in Hangar. Spind is fixed in place. The description is "Der Spind eines Deckoffiziers, wahrscheinlich in Eile offengelassen."

Umkleidekabine is a room. The printed name is "Umkleidekabine".
Umkleidetuer is a door. The printed name is "Umkleidetür".
	It is inside of Hangar and outside of Umkleidekabine.
	It is locked.
	
Docking_Bay is down of Hangar. The printed name is "Docking Bay".
Raumfähre is inside of Docking_Bay. The printed name is "Raumfähre".
Duty_Room is down of Alpha_Junction. The printed name is "Duty Room".
Crew_Quarter is down of Duty_Room. The printed name is "Crew Quarter".

Wartungsluke is a Luke. It is down of Gamma_Delta_Corridor and above Wartungsschacht.
LuPanel U Wartung is a LuPanel. The Given_Luke is Wartungsluke. LuPanel U Wartung is in Wartungsschacht. The description is "Türpanel. Es sieht nicht so aus, als sie es gegen Stöße gesichert." 
	
Wartungsschacht is down of Wartungsluke. The printed name is "Wartungsschacht".
Com_Base is down of Wartungsschacht. The printed name is "Com Base".

Weltraum is a room. The printed name is "Weltraum".
Weltraumtuer is a door. The printed name is "Weltraumtür".
	It is north of Weltraum and south of Docking_Bay.
	It is locked.
Weltraumtuer_2 is a door. The printed name is "Weltraumtür".
	It is south of Weltraum and north of Com_Base.
	It is locked.

Storage_Area is east of Gamma_Junction. It is in aeußererRing. The printed name is "Storage Area".
Beta_Greenhouse is north of Storage_Area. It is in aeußererRing. The printed name is "Beta Greenhouse".
Delta_AI is a room. It is in innererRing. The printed name is "Delta AI".
	Luke_Delta_AI is a Luke. It is down of Delta_AI and above Storage_Area.
	LuPanel U Stor Ar is a LuPanel. The Given_Luke is Luke_Delta_AI. LuPanel U Stor Ar is in Storage_Area. The description is "Türpanel. Es sieht nicht so aus, als sie es gegen Stöße gesichert." 

Main_Generator is south of Delta_AI. It is in innererRing. The printed name is "Main Generator".
Delta_Greenhouse is a room. It is in aeußererRing. The printed name is "Delta Greenhouse".
Storage_Room is south of Delta_Greenhouse. It is in aeußererRing. The printed name is "Storage Room".
Alpha_AI is a room. It is in innererRing. The printed name is "Alpha AI".
	Luke_Alpha_AI is a Luke. It is down of Alpha_AI and above Storage_Room.
	LuPanel U Stor Rm is a LuPanel. The Given_Luke is Luke_Alpha_AI. LuPanel U Stor Rm is in Storage_Room. The description is "Türpanel. Es sieht nicht so aus, als sie es gegen Stöße gesichert." 

Transporter_Raum is south of Alpha_AI. It is in innererRing. The printed name is "Transporter Raum".
Second_Generator is east of Com_Base. The printed name is "Second Generator".
Fitness is east of Crew_Quarter. The printed name is "Fitness".
Cafeteria is east of Duty_Room and down of Storage_Room. The printed name is "Cafeteria".

Antenna_Array is west of Com_Base. The printed name is "Antenna Array".
Briefing_Room is west of Duty_Room. The printed name is "Briefing Room".
Bridge Luke is a door.
	It is down of Briefing_Room.
	Bridge Luke is above Bridge. 
	Bridge Luke is locked.
Bridge is down of Bridge Luke. The printed name is "Bridge".



[*****Szene 1*****]
First_say_gdc is a truth state variable. First_say_gdc is false.
First_say_xl is a truth state variable. First_say_xl is false.

Szene 1 is a scene.
Szene1Laeuft is a number that varies.
Szene1Laeuft is 0.

Szene 1 ends when Szene1Laeuft is 2.
Szene 1 begins when play begins.
When Szene 1 begins:
	Say "[bold type]Szene 1:[line break]";
	Say "[italic type]Percy fliegt die Fähre, Barry übernimmt die Kommunikation. Als sie sich der Station nähern wundern sie sich, dass zwar der automatische Leitstrahl funktioniert, sie jedoch keine Antwort auf ihre Landeanfrage erhalten. Da der Leitstrahl sie führt und das automatische Andocken einleitet, denken sie sich nichts weiter und halten das für ein eventuelles Willkommensritual des Außenpostens. Ein knarrendes Geräusch beim Einflug in die DockingBay la¨sst aber nichts Gutes ahnen. Als sie aus der Fähre aussteigen, finden sie den Dock- und Hangarbereich verlassen vor. Sie sind verwundert und einigen sich darauf, dass Barry die Fähre äußerlich bzgl. des entstandenen Schadens untersucht. Du spielst Percy und machst dich auf, um nach dem Stationspersonal suchen und um dich auf der Brücke beim wachhabenden Offizier meldet. Besuche zunächst einmal das Xeno-Lab.[line break]";
	Say "Ein Tipp: Finde den Laborkittel![roman type][line break]".

After going to Gamma_Delta_Corridor: 
	If First_say_gdc is false:
		Now First_say_gdc is true;
		Say "Percy findet eine Leiche und an den Wänden Spuren von Handlaserwaffen. Außerdem stellt er fest, dass der Öffnungshebel für die Wartungsluke zum Kommunikationsmodul durch Laserfeuer abgetrennt worden ist. Der Öffnungshebel liegt nun auf dem Boden, so dass ein Öffnen der Luke von hier aus nicht möglich ist. Was ist hier passiert? In dem Laborkittel der Leiche, die offenbar ein Wissenschaftler gewesen war, ist ein Transponder eingenäht. Wenn Percy den Kittel der Leiche auszieht und ihn selbst anzieht, könnte er hiermit die entsprechende Luke öffnen.";
	Continue the action.

After going to Xeno_Lab: 
	If First_say_xl is false:
		Now First_say_xl is true;
		Say "Aus dem Xeno-Lab ist ein ohrenbetäubendes Pfeifen zu hören, welches den ohnehin schon lauten Alarm überdeckt. Ein blinkender Knopf lädt zum Drücken ein.";
	Continue the action.



[*****Szene 2*****]
First_say_xl2 is a truth state variable. First_say_xl2 is false.

GammaListened is a truth state variable. GammaListened is false.
Scene2 is a scene.
Scene2 begins when Szene 1 ends. 
When Scene2 begins:
	Now MedLabUsable is true;
	change_to_Barry;
	Say "[bold type]Szene 2:[line break]";
	Say "[italic type]Du bist Barry. Nachdem du herausgefunden hast dass das Raumschiff einer aufwendigen Reparatur bedarf, wunderst du dich warum noch niemand gekommen ist und wo Percy seit dem Abholen der Palette abgeblieben ist. Du fängst an nach ihm zu suchen.[roman type][line break]".
Scene2 ends when DekonDone is true.

After going to Xeno_Lab: 
	If Scene2 is happening and First_say_xl2 is false:
		Now First_say_xl2 is true;
		Say "Du findest Percy ... er steht mit in die Gegend starrenden Blick da. Er ist kontaminiert. Dekontaminiere ihn im Med-Lab!";
	Continue the action.

After going to Gamma_Junction:
	If Scene2 is happening and GammaListened is false:
		Now Stationsalarm is false;
		Now GammaListened is true;
		Say "Du hörst noch kurz den Stationsalarm und ein lautes Pfeifen aus dem Xeno Lab. Doch es verstummt kurz darauf und es ist ein Klirren aus dem Xeno Lab zu hören.";
	Continue the action.
	


[*****Scene 4*****]
Sauerstoff_Abfall is a truth state variable. Sauerstoff_Abfall is false.

Scene4 is a scene.
Scene4 begins when Scene2 ends.
When Scene4 begins:
	Now Percy is in Med_Lab;
	Now Percy_Medlab_alleine is true;
	Now Percy_Konter is Aktionen_ohne_Geraeusch;
	Say "[line break][bold type]Scene 4:[line break]";
	Say "[italic type]Du bist Barry und besprichst dich mit Percy! ...es soll ein Notruf abgesetzt werden. Dazu musst du den Hilfsgenerator im Kommunikationsmodul starten. Gehe dazu in die Com Base.[line break]";
	Say "Ein Tipp: Finde den Raumanzug und gehe durch den Weltraum![roman type][line break]";
	Now Umkleidetuer is unlocked.
Scene4 ends when Sauerstoff_Abfall is true.


[Bodenfenster geht kaputt + Sauerstoffabfall]		
After going up from Wartungsschacht:
	If Sauerstoff_Abfall is false:
		Say "Die eingeklemmte Palette löst sich. Sie hat sich durch die zugehende Luke so sehr beschleunigt dass das Bodenfenster kaputt geht! Der Sauerstoff wird nun weniger im äußeren Ring!";
		Now Sauerstoff_Abfall is true;
		Now Luke_XenoLab is closed;
		Now Luke_XenoLab is locked;  
		Now XenoLuke_Blockiert is false;
		Now the Palette is in Gamma_Junction; 
		Now the description of Palette is "Die Palette wurde leicht durch die Xeno Luke beschädigt. Sie hat das Bodenfenster schwer beschädigt.";
		Now the description of Gamma_Junction is "Das Bodenfenster wurde durch die Palette schwer beschädigt und es entweicht Luft.";
		Increase Sauerstoff by 1;
	Continue the action.

Every turn:
	If Sauerstoff_Abfall is true:
		If Sauerstoff is greater than 0:
			Decrease Sauerstoff by 1;
		If the player carries the Mobitab:
			If Sauerstoff is greater than 0:
				Say "[bold type]Mobitab: [roman type]Züge an Sauerstoff: [Sauerstoff] (im äußeren Ring)[line break]";
			Otherwise:
				Say "[bold type]Mobitab: [roman type]Im äußeren Ring gibt es keine Sauerstoff mehr!";
	If Sauerstoff is 0 and the player is in a room in aeußererRing: 
		Say "[bold type]Es ist kein Sauerstoff mehr vorhanden! Du erstickst![roman type]";
		End the story finally.
		


[*****Endscene*****]
Barry_ist_da is a truth state variable. Barry_ist_da is false.

Endscene is a scene.
Endscene begins when Scene4 ends.
When Endscene begins:
	Change_to_Barry;
	oeffne_Barrieren;
	Say "[line break][italic type]Endscene:[line break]";
	Say "Ein Rettungsteam ist angekommen. Gehe in das Docking Bay, wo das Rettungsteam wartet.[line break]";
	Say "Aus Sicherheitsgründen (wegen des Sauerstoffabfalls) haben sich alle Barrieren und die Hangarluke geöffnet![roman type]".
Endscene ends when Barry is in Docking_Bay and Percy is in Docking_Bay.
When Endscene ends:
	Say "[bold type]Glückwunsch, du hast es geschafft! Du und Barry kehren nun wieder zurück nach Hause![roman type]";
	End the story finally.

[Wechsel den Spieler, wenn Barry in der Docking Bay ist]
Every turn:
	If Endscene is happening and Barry is in Docking_Bay:
		If Barry_ist_da is false:
			Change_to_Percy;
			Say "[italic type]Gehe in die Docking Bay. Barry und ein Rettungsteam warten dort! Beeil dich, der Sauerstoff im äußeren Ring wird langsam knapp![roman type]";
			Now Barry_ist_da is true;
			Now Percy_Konter is Aktionen_ohne_Geraeusch;
			Increase Percy_Konter by 1.



[*****Testmethode*****]
[Teleport]
Raumteleport is a room variable.
Understand "Team-14-Teleport-Test to [any room]" as Teleporting.
	Teleporting is an action applying to one thing.
Carry out Teleporting:
	Now Raumteleport is the noun;
	If Raumteleport is not nothing:
		Now the player is in Raumteleport.