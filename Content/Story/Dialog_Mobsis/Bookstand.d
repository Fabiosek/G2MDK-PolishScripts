
func void use_bookstand_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FIRECONTEST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FIRECONTEST,LOG_RUNNING);
			b_logentry(TOPIC_FIRECONTEST,"Jako nowicjusz mam prawo za��da� Pr�by Ognia, a ka�dy z trzech mag�w nale��cych do Najwy�szej Rady przydzieli mi jakie� zadanie. Po uko�czeniu wszystkich misji zostan� przyj�ty do Kr�gu Ognia.");
		};
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Pr�ba Ognia");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Nowicjusz mo�e uwa�a�, �e jest gotowy na do��czenie do Kr�gu Ognia, ale nie od razu dost�pi tego zaszczytu. Gdy dobrze si� zastanowi i nadal b�dzie uparcie d��y� do swego celu, to mo�e skorzysta� z prawa za��dania Pr�by, nie mo�e mu odm�wi� �aden mag. Ca�a procedura nie ogranicza si� do Pr�by Magii - kandydat musi r�wnie� zosta� o�wiecony przez p�omienie, gdy wyrazi tak� wol� przed Najwy�sz� Rad�, stanie przed PR�B� OGNIA,");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"kt�ra sprawdzi jego zr�czno��, si�� i m�dro��. Ka�de z trzech zada� zostanie zlecone przez innego cz�onka Najwy�szej Rady i dopiero po wykonaniu wszystkich trzech kandydat b�dzie m�g� z�o�y� Przysi�g� Ognia i zbrata� si� z p�omieniami.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Taka jest wola Innosa i tako� si� stanie.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Najwy�sza Rada");
		Doc_Show(ndocid);
	};
};


var int finaldragonequipment_once;

func void use_finaldragonequipment_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"...Mam nadziej�, �e Bariera ochroni rud� przed zakusami Beliara. Kr�l w swej naiwno�ci wierzy, �e stworzyli�my j�, �eby nie dopu�ci� do ucieczek. Niechaj nadal tak s�dzi, je�li dzi�ki temu uda si� nam osi�gn�� nasze odleglejsze cele. Mo�emy tylko marzy� o czasie na przygotowanie si� do nadchodz�cej walki. To na ni� skieruj� ca�� sw� moc, gdy tylko Bariera dooko�a G�rniczej Doliny zostanie uko�czona.");
		Doc_PrintLines(ndocid,0,"");
		if(hero.guild == GIL_KDF)
		{
			PLAYERGETSAMULETTOFDEATH = TRUE;
			PLAYER_TALENT_RUNES[SPL_MASTEROFDISASTER] = TRUE;
			b_logentry(TOPIC_TALENTRUNES,"Sk�adniki runy '�wi�ty pocisk': 1 porcja wody �wi�conej, nie potrzeba zwoju z zakl�ciem");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"...Na runicznym stole obla�em wod� �wi�con�, zgodnie z instrukcjami, pusty kamie� runiczny. Kamie� uleg� zniszczeniu... To zakl�cie jest chyba przeznaczone tylko dla Wybra�ca.");
			Doc_PrintLines(ndocid,1,"Na stra�y klasztoru pozostawi�em �wi�t� Aur� Innosa. Przeor b�dzie o ni� dba�, dop�ki nie objawi si� Wybraniec.");
			Doc_PrintLines(ndocid,1,"�zy Innosa mog� odegra� ogromn� rol� w nadchodz�cej walce, niebezpiecznie wi�c trzyma� je na widoku publicznym. Lepiej schowam je tu, w bibliotece.");
			Doc_Show(ndocid);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KNOWSABOUT_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
			PrintScreen(PRINT_LEARNPALTELEPORTSECRET,-1,-1,FONT_SCREEN,2);
			Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
			b_logentry(TOPIC_TALENTRUNES,"Tworzenie run wymaga u�ycia odpowiednich sk�adnik�w. Ca�y proces wymaga jeszcze odpowiedniego sto�u i pustego kamienia runicznego.");
			b_logentry(TOPIC_TALENTRUNES,"Sk�adniki runy 'Tajny teleport': 1 porcja �ez Innosa");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Aby m�c si� dosta� do ukrytego miejsca, musisz stworzy� specjaln� run� teleportuj�c� - b�dzie ci do tego potrzebny pusty kamie� runiczny i ma�a buteleczka wody �wi�conej.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Jestem prawie pewien, �e paladyni wykorzystywali �zy Innosa w dawno zapomnianym rytuale znanym jako Konsekracja Miecza. Za pomoc� znalezionej wcze�niej ma�ej buteleczki powinienem wi�c nada� konsekrowanej broni dodatkow� moc.");
			Doc_PrintLine(ndocid,1,"");
			Doc_Show(ndocid);
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
			PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
			PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
			Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
			Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
			b_logentry(TOPIC_TALENTSMITH,"Je�li zechc� wyku� jak�� bro�, to po pierwsze b�dzie mi potrzebny kawa� surowej stali, kt�ry trzeba rozgrza� do czerwono�ci w ku�ni, a nast�pnie ukszta�towa� na kowadle. Nadanie broni jakich� specjalnych charakterystyk b�dzie wymaga�o u�ycia dodatkowych sk�adnik�w.");
			b_logentry(TOPIC_TALENTSMITH,"Dodanie na przyk�ad czterech bry�ek rudy i pi�ciu porcji smoczej krwi umo�liwi mi wykucie magicznego ostrza na smoki, a");
			b_logentry(TOPIC_TALENTSMITH,"pi�ciu bry�ek rudy i pi�ciu porcji smoczej krwi - du�ego magicznego ostrza na smoki.");
			PLAYERGETSFINALDJGARMOR = TRUE;
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Fragment ksi�gi 'Bro� smoczego pana'.");
			Doc_PrintLines(ndocid,1,"Aby zbroicy ze smoczych �usek twardo�ci nielichej doda�, pokry� trza �uski takowe rud� w dolinie na wyspie Karynis kopan�.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"By ostrze po�lednie zdatnym dla smoczego pana uczyni�, krwi� smok�w obla� je nale�y. Pi�� porcji posoki sprawi, �e ostrze ostre niezwykle b�dzie i moc niezr�wnan� zyska.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Uwaga: nazwa 'Karynis' nawi�zuje prawdopodobnie do obszar�w znanych obecnie jako Khorinis.");
			Doc_Show(ndocid);
		};
		if(FINALDRAGONEQUIPMENT_ONCE == FALSE)
		{
			b_giveplayerxp(XP_FINALDRAGONEQUIPMENT);
			FINALDRAGONEQUIPMENT_ONCE = TRUE;
		};
	};
};

