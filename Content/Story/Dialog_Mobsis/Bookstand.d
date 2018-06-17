
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
			b_logentry(TOPIC_FIRECONTEST,"Jako nowicjusz mam prawo za¿¹daæ Próby Ognia, a ka¿dy z trzech magów nale¿¹cych do Najwy¿szej Rady przydzieli mi jakieœ zadanie. Po ukoñczeniu wszystkich misji zostanê przyjêty do Krêgu Ognia.");
		};
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Próba Ognia");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Nowicjusz mo¿e uwa¿aæ, ¿e jest gotowy na do³¹czenie do Krêgu Ognia, ale nie od razu dost¹pi tego zaszczytu. Gdy dobrze siê zastanowi i nadal bêdzie uparcie d¹¿yæ do swego celu, to mo¿e skorzystaæ z prawa za¿¹dania Próby, nie mo¿e mu odmówiæ ¿aden mag. Ca³a procedura nie ogranicza siê do Próby Magii - kandydat musi równie¿ zostaæ oœwiecony przez p³omienie, gdy wyrazi tak¹ wolê przed Najwy¿sz¹ Rad¹, stanie przed PRÓB¹ OGNIA,");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"która sprawdzi jego zrêcznoœæ, si³ê i m¹droœæ. Ka¿de z trzech zadañ zostanie zlecone przez innego cz³onka Najwy¿szej Rady i dopiero po wykonaniu wszystkich trzech kandydat bêdzie móg³ z³o¿yæ Przysiêgê Ognia i zbrataæ siê z p³omieniami.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Taka jest wola Innosa i tako¿ siê stanie.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Najwy¿sza Rada");
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
		Doc_PrintLines(ndocid,0,"...Mam nadziejê, ¿e Bariera ochroni rudê przed zakusami Beliara. Król w swej naiwnoœci wierzy, ¿e stworzyliœmy j¹, ¿eby nie dopuœciæ do ucieczek. Niechaj nadal tak s¹dzi, jeœli dziêki temu uda siê nam osi¹gn¹æ nasze odleglejsze cele. Mo¿emy tylko marzyæ o czasie na przygotowanie siê do nadchodz¹cej walki. To na ni¹ skierujê ca³¹ sw¹ moc, gdy tylko Bariera dooko³a Górniczej Doliny zostanie ukoñczona.");
		Doc_PrintLines(ndocid,0,"");
		if(hero.guild == GIL_KDF)
		{
			PLAYERGETSAMULETTOFDEATH = TRUE;
			PLAYER_TALENT_RUNES[SPL_MASTEROFDISASTER] = TRUE;
			b_logentry(TOPIC_TALENTRUNES,"Sk³adniki runy 'œwiêty pocisk': 1 porcja wody œwiêconej, nie potrzeba zwoju z zaklêciem");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"...Na runicznym stole obla³em wod¹ œwiêcon¹, zgodnie z instrukcjami, pusty kamieñ runiczny. Kamieñ uleg³ zniszczeniu... To zaklêcie jest chyba przeznaczone tylko dla Wybrañca.");
			Doc_PrintLines(ndocid,1,"Na stra¿y klasztoru pozostawi³em œwiêt¹ Aurê Innosa. Przeor bêdzie o ni¹ dba³, dopóki nie objawi siê Wybraniec.");
			Doc_PrintLines(ndocid,1,"£zy Innosa mog¹ odegraæ ogromn¹ rolê w nadchodz¹cej walce, niebezpiecznie wiêc trzymaæ je na widoku publicznym. Lepiej schowam je tu, w bibliotece.");
			Doc_Show(ndocid);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KNOWSABOUT_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
			PrintScreen(PRINT_LEARNPALTELEPORTSECRET,-1,-1,FONT_SCREEN,2);
			Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
			b_logentry(TOPIC_TALENTRUNES,"Tworzenie run wymaga u¿ycia odpowiednich sk³adników. Ca³y proces wymaga jeszcze odpowiedniego sto³u i pustego kamienia runicznego.");
			b_logentry(TOPIC_TALENTRUNES,"Sk³adniki runy 'Tajny teleport': 1 porcja ³ez Innosa");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Aby móc siê dostaæ do ukrytego miejsca, musisz stworzyæ specjaln¹ runê teleportuj¹c¹ - bêdzie ci do tego potrzebny pusty kamieñ runiczny i ma³a buteleczka wody œwiêconej.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Jestem prawie pewien, ¿e paladyni wykorzystywali ³zy Innosa w dawno zapomnianym rytuale znanym jako Konsekracja Miecza. Za pomoc¹ znalezionej wczeœniej ma³ej buteleczki powinienem wiêc nadaæ konsekrowanej broni dodatkow¹ moc.");
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
			b_logentry(TOPIC_TALENTSMITH,"Jeœli zechcê wykuæ jak¹œ broñ, to po pierwsze bêdzie mi potrzebny kawa³ surowej stali, który trzeba rozgrzaæ do czerwonoœci w kuŸni, a nastêpnie ukszta³towaæ na kowadle. Nadanie broni jakichœ specjalnych charakterystyk bêdzie wymaga³o u¿ycia dodatkowych sk³adników.");
			b_logentry(TOPIC_TALENTSMITH,"Dodanie na przyk³ad czterech bry³ek rudy i piêciu porcji smoczej krwi umo¿liwi mi wykucie magicznego ostrza na smoki, a");
			b_logentry(TOPIC_TALENTSMITH,"piêciu bry³ek rudy i piêciu porcji smoczej krwi - du¿ego magicznego ostrza na smoki.");
			PLAYERGETSFINALDJGARMOR = TRUE;
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Fragment ksiêgi 'Broñ smoczego pana'.");
			Doc_PrintLines(ndocid,1,"Aby zbroicy ze smoczych ³usek twardoœci nielichej dodaæ, pokryæ trza ³uski takowe rud¹ w dolinie na wyspie Karynis kopan¹.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"By ostrze poœlednie zdatnym dla smoczego pana uczyniæ, krwi¹ smoków oblaæ je nale¿y. Piêæ porcji posoki sprawi, ¿e ostrze ostre niezwykle bêdzie i moc niezrównan¹ zyska.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Uwaga: nazwa 'Karynis' nawi¹zuje prawdopodobnie do obszarów znanych obecnie jako Khorinis.");
			Doc_Show(ndocid);
		};
		if(FINALDRAGONEQUIPMENT_ONCE == FALSE)
		{
			b_giveplayerxp(XP_FINALDRAGONEQUIPMENT);
			FINALDRAGONEQUIPMENT_ONCE = TRUE;
		};
	};
};

