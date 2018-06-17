
instance DIA_MILTENNW_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_exit_condition;
	information = dia_miltennw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap3_exit_condition;
	information = dia_miltennw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_HELLO(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_hello_condition;
	information = dia_miltennw_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltennw_kap3_hello_condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_hello_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//A� trudno w to uwierzy�... Naprawd� jeste� teraz paladynem?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//Jak widzisz...
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//Ho, ho! Maj�c kogo� takiego po swojej stronie, nie musimy si� ju� chyba obawia� armii Beliara!
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//Kto�, kto rozprawi� si� ze �ni�cym, nie b�dzie mia� k�opot�w z byle garstk� ork�w.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//Orkowie to najmniejsze z naszych zmartwie�.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//Tak, wiem... ale dobrze ci� mie� po naszej stronie.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//W porz�dku.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//Co robisz w klasztorze? Czekaj, niech zgadn�. Chcesz pobiera� nauki od Mag�w Ognia?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//By� mo�e.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//Wiedzia�em! Najlepiej porozmawiaj z Mardukiem. To on zajmuje si� zwykle paladynami. Znajdziesz go przed kaplic�.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//Widz�, �e plotki nie k�ama�y.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//Jakie plotki?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//Te, wedle kt�rych do��czy�e� do �owc�w smok�w.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//C�, ch�tniej bym ci� widzia� w stroju maga lub paladyna, ale przynajmniej walczysz po naszej stronie.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//To wszystko, co masz mi do powiedzenia?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//Oczywi�cie ciesz� si�, �e ci� widz�. S�dz�c po twoim wygl�dzie, orkowie powinni ju� zacz�� si� ba�.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//Orkowie s� teraz najmniejszym z naszych zmartwie�.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//Wiem, ale mimo wszystko s� gro�ni. A ty...
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//Ty pokona�e� �ni�cego. Twoja pomoc b�dzie nieoceniona.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//W porz�dku.
	};
};


instance DIA_MILTENNW_MONASTERY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_monastery_condition;
	information = dia_miltennw_monastery_info;
	permanent = FALSE;
	description = "Jakim cudem uda�o ci si� tak szybko dosta� do klasztoru?";
};


func int dia_miltennw_monastery_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_monastery_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//Jakim cudem uda�o ci si� tak szybko dosta� do klasztoru?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//G�upie pytanie! Prze�lizgn��em si� przez prze��cz i uda�em si� wprost do klasztoru.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//Omini�cie niekt�rych z pilnuj�cych prze��czy bestii nie by�o proste, ale koniec ko�c�w, posz�o mi �atwiej, ni� si� spodziewa�em.
};


instance DIA_MILTENNW_FOURFRIENDS(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_fourfriends_condition;
	information = dia_miltennw_fourfriends_info;
	permanent = FALSE;
	description = "Wiesz mo�e, gdzie s� pozostali?";
};


func int dia_miltennw_fourfriends_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_fourfriends_info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//Wiesz mo�e, gdzie s� pozostali?
	if(Npc_IsDead(pc_fighter_nw_vor_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//Gorn ca�kiem nie�le zni�s� pobyt w wi�zieniu Garonda.
		if(MIS_RESCUEGORN != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//Jak uda�o mu si� z niego wydosta�?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//Musia�em troch� ok�ama� Garonda i w ko�cu wycofa� wszystkie oskar�enia.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//Tylko niech to b�dzie nasza tajemnica, jasne?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//W ka�dym razie - zamierza� zajrze� do Lee i dowiedzie� si�, co s�ycha� na farmie.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//Jak go znam, odbija sobie teraz z nawi�zk� d�ugie dni postu w wi�zieniu. Za�o�� si�, �e nie�le ju� spustoszy� spi�arni� najemnik�w.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//Gornowi niestety si� nie uda�o.
	};
	if(Npc_IsDead(pc_thief_nw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//Diego mamrota� co� o wyr�wnaniu rachunk�w, ale nie wiem, o co mu chodzi�o.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//Podejrzewam, �e wr�ci� do miasta. Znasz go przecie� - zawsze szuka okazji do zarobku.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//Diego nie mia� tyle szcz�cia. Pozosta� wi�niem Bariery.
	};
};


instance DIA_MILTENNW_KAP3_ENTRY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 32;
	condition = dia_miltennw_kap3_entry_condition;
	information = dia_miltennw_kap3_entry_info;
	permanent = TRUE;
	description = "Musz� si� dosta� do klasztoru. To bardzo pilne!";
};


func int dia_miltennw_kap3_entry_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF) && (MILTENNW_GIVESMONASTERYKEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_entry_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//Musz� si� dosta� do klasztoru. To bardzo pilne!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//W porz�dku. Masz tu klucz.
		CreateInvItems(self,itke_innos_mis,1);
		b_giveinvitems(self,other,itke_innos_mis,1);
		MILTENNW_GIVESMONASTERYKEY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//Nie mog� ci� wpu�ci� do klasztoru! Narazi�bym si� Najwy�szej Radzie.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//Bez upowa�nienia moich zwierzchnik�w nie mog� ci� wpu�ci� do klasztoru.
		Info_ClearChoices(dia_miltennw_kap3_entry);
		Info_AddChoice(dia_miltennw_kap3_entry,DIALOG_BACK,dia_miltennw_kap3_entry_back);
		Info_AddChoice(dia_miltennw_kap3_entry,"To bardzo wa�ne!",dia_miltennw_kap3_entry_important);
		if(Npc_HasItems(other,itwr_permissiontowearinnoseye_mis) >= 1)
		{
			Info_AddChoice(dia_miltennw_kap3_entry,"Mam tu list od Lorda Hagena.",dia_miltennw_kap3_entry_permit);
		};
	};
};

func void dia_miltennw_kap3_entry_back()
{
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//To bardzo wa�ne!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//Przykro mi. Pyrokar urwa�by mi g�ow�.
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//Mam tu list od Lorda Hagena.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//Poka�.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//No dobrze. Masz tu klucz do klasztoru. Pyrokara znajdziesz w �wi�tyni.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,other,itke_innos_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MILTENNW_GIVESMONASTERYKEY = TRUE;
	Info_ClearChoices(dia_miltennw_kap3_entry);
};


instance DIA_MILTENNW_KAP3_NOVIZENCHASE(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_novizenchase_condition;
	information = dia_miltennw_kap3_novizenchase_info;
	permanent = FALSE;
	description = "Wiesz mo�e, dok�d uciek� Pedro?";
};


func int dia_miltennw_kap3_novizenchase_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_novizenchase_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//Wiesz mo�e, dok�d uciek� Pedro?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//A my�lisz, �e sta�bym tutaj, gdybym wiedzia�, gdzie ukry�a si� ta szuja?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//Zobaczysz, zap�aci za to �wi�tokradztwo! Mam tylko nadziej�, �e zdo�amy odzyska� Oko!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//Musisz nam pom�c. Znajd� go i odzyskaj �wi�te Oko Innosa!
};


instance DIA_MILTENNW_KAP3_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 39;
	condition = dia_miltennw_kap3_perm_condition;
	information = dia_miltennw_kap3_perm_info;
	permanent = FALSE;
	description = "Mo�esz mi co� powiedzie� o tych zakapturzonych postaciach?";
};


func int dia_miltennw_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//Mo�esz mi co� powiedzie� o tych zakapturzonych postaciach?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//Niestety, nie. Ale mam co do nich bardzo z�e przeczucia.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//Lepiej nie wchod� im w drog�.
};


instance DIA_MILTENNW_KAP4_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap4_exit_condition;
	information = dia_miltennw_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP4_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 49;
	condition = dia_miltennw_kap4_perm_condition;
	information = dia_miltennw_kap4_perm_info;
	permanent = TRUE;
	description = "Jakie� wie�ci?";
};


func int dia_miltennw_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//Co� nowego?
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//To ja powinienem o to zapyta�. Wszyscy tutaj nadal si� niepokoj�.
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//Najwy�sza Rada pr�buje przewidzie� kolejny ruch nieprzyjaciela.
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//Co� jeszcze?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//Ostatnio du�o s�yszy si� o atakach ork�w, nawet poza G�rnicz� Dolin�.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//Nie podoba mi si� to wszystko. Boj� si�, �e zosta�o nam ju� bardzo niewiele czasu.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//Pewien wie�niak widzia� ko�o swojej zagrody jakie� �uskowate istoty.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//Nie wiem ju�, co o tym wszystkim s�dzi�. Wr�g przygotowuje si� do kolejnego uderzenia, to pewne.
	}
	else if(MIS_FINDTHEOBESESSED == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//Docieraj� do nas wie�ci o kolejnych op�tanych ludziach. Nieprzyjaciel ro�nie w si�� o wiele szybciej, ni� si� tego spodziewa�em.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//Sytuacja nadal jest bardzo powa�na. Ca�a nadzieja w Innosie.
	};
};


instance DIA_MILTENNW_KAP5_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap5_exit_condition;
	information = dia_miltennw_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_miltennw_alldragonsdead_condition;
	information = dia_miltennw_alldragonsdead_info;
	permanent = FALSE;
	description = "Zabi�em wszystkie smoki.";
};


func int dia_miltennw_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//Zabi�em wszystkie smoki.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//Naprawd�?! A wi�c znowu zap�on�a dla nas iskierka nadziei. Teraz musimy tylko uderzy� w samo serce Z�a.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//Je�li uda�o ci si� tego dokona�, zwyci�stwo b�dzie nasze.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//Kto? Ja?!
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//Naturalnie! A kto inny?
	if(MILTENNW_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//Nie mamy czasu do stracenia. Ka�da chwila jest na wag� z�ota.
	};
};


instance DIA_MILTENNW_SCWASINLIB(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_scwasinlib_condition;
	information = dia_miltennw_scwasinlib_info;
	important = TRUE;
};


func int dia_miltennw_scwasinlib_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_scwasinlib_info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//Podobno sp�dzi�e� sporo czasu w klasztornych podziemiach. Dowiedzia�e� si� czego� nowego?
};


instance DIA_MILTENNW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_knowwhereenemy_condition;
	information = dia_miltennw_knowwhereenemy_info;
	permanent = TRUE;
	description = "Wiem ju�, gdzie kryje si� nieprzyjaciel!";
};


func int dia_miltennw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MILTENNW_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};


var int sctoldmiltenheknowwhereenemy;

func void dia_miltennw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//Wiem ju�, gdzie kryje si� nieprzyjaciel! Jest ca�kiem niedaleko st�d.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//Zatem musimy czym pr�dzej wyruszy� w drog�. To mo�e by� nasza jedyna szansa!
	SCTOLDMILTENHEKNOWWHEREENEMY = TRUE;
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	if(Npc_IsDead(diegonw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//A co Diego s�dzi na ten temat? My�l�, �e ch�tnie b�dzie ci towarzyszy�.
		b_logentry(TOPIC_CREW,"Diego m�g�by by� bardzo pomocny. Nigdy nie potrafi� wytrzyma� d�ugo w jednym miejscu.");
	};
	if(Npc_IsDead(gornnw_nach_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//Co z Gornem? Podobno wr�ci� z G�rniczej Doliny. Koniecznie z nim porozmawiaj.
		b_logentry(TOPIC_CREW,"Gorn m�g�by by� bardzo pomocny. Zawsze dobrze jest mie� u swego boku doskona�ego wojownika. Mo�e zgodzi si� mnie szkoli�.");
	};
	if(Npc_IsDead(lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//I nie zapomnij o Lesterze! Gdyby� nie wyci�gn�� go z tej doliny, by�oby po nim.
		b_logentry(TOPIC_CREW,"Je�li nie wezm� ze sob� Lestera, prawdopodobnie nigdy nie wydostanie si� z doliny.");
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//Ja te� mam pewn� rol� do odegrania w tej sprawie. Mog� ci pom�c w zwi�kszeniu twojej many oraz przy sporz�dzaniu nowych run. Kiedy ruszamy?
	b_logentry(TOPIC_CREW,"Je�li zabior� ze sob� Miltena, nauczy mnie, jak tworzy� runy i zwi�ksza� moc magiczn�.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//Powoli, przyjacielu. Chwilowo mam ju� pe�n� za�og�.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//Zawsze mo�esz na mnie liczy�. Gdyby� zmieni� zdanie, wiesz, gdzie mnie szuka�.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//Powodzenia! Niech Innos ma was w swojej opiece!
	}
	else
	{
		Info_ClearChoices(dia_miltennw_knowwhereenemy);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"Chwilowo mi si� nie przydasz.",dia_miltennw_knowwhereenemy_no);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"Witamy na pok�adzie!",dia_miltennw_knowwhereenemy_yes);
	};
};

func void dia_miltennw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//Witamy na pok�adzie!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//Spotykamy si� na przystani. Nie sp�nij si�!
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//W porz�dku. Mo�esz na mnie liczy�.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};

func void dia_miltennw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//Chwilowo mi si� nie przydasz.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//Wiesz, �e zawsze mo�esz na mnie liczy�. Gdyby� zmieni� zdanie, b�d� tutaj czeka�.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};


instance DIA_MILTENNW_WHERECAPTAIN(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_wherecaptain_condition;
	information = dia_miltennw_wherecaptain_info;
	description = "Gdzie mog� znale�� kapitana statku?";
};


func int dia_miltennw_wherecaptain_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (SCTOLDMILTENHEKNOWWHEREENEMY == TRUE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_wherecaptain_info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//Gdzie mog� znale�� kapitana statku?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//Porozmawiaj z Jorgenem, w ko�cu by� kiedy� �eglarzem. Powiniene� spotka� go w klasztorze.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//Gdyby on nie m�g� ci pom�c, musisz popyta� w mie�cie, albo nawet na farmach. Z pewno�ci� s� tu jeszcze jacy� �eglarze.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//Na twoim miejscu porozmawia�bym o tym z Lee albo zajrza�bym na przysta� w Khorinis. To chyba najlepsze wyj�cie.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Jorgen m�g�by zosta� kapitanem mojego statku. Powinienem znale�� go w klasztorze. Poza tym na farmach i w mie�cie musi by� pe�no potencjalnych kandydat�w na to stanowisko. Mo�e powinienem zapyta� Lee albo rozejrze� si� w porcie.");
};


instance DIA_MILTENNW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_leavemyship_condition;
	information = dia_miltennw_leavemyship_info;
	permanent = TRUE;
	description = "Obawiam si�, �e jednak nie mo�esz ze mn� pop�yn��.";
};


func int dia_miltennw_leavemyship_condition()
{
	if((MILTENNW_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_leavemyship_info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//Obawiam si�, �e jednak nie mo�esz ze mn� pop�yn��.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//Trudno. Wiesz najlepiej, kto ci si� przyda, a kto nie. Gdyby� zmieni� zdanie, znajdziesz mnie w klasztorze.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MILTENNW_STILLNEEDYOU(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_stillneedyou_condition;
	information = dia_miltennw_stillneedyou_info;
	permanent = TRUE;
	description = "Potrzebuj� twojej pomocy.";
};


func int dia_miltennw_stillneedyou_condition()
{
	if(((MILTENNW_ISONBOARD == LOG_OBSOLETE) || (MILTENNW_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_miltennw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//Potrzebuj� twojej pomocy.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//Czuj� si� zaszczycony. Chod�my wi�c! Nie mamy czasu do stracenia.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//Spotkamy si� wi�c na przystani.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_TEACH(C_INFO)
{
	npc = pc_mage_nw;
	nr = 90;
	condition = dia_miltennw_teach_condition;
	information = dia_miltennw_teach_info;
	permanent = TRUE;
	description = "Chc� si� nauczy� nowych zakl��.";
};


func int dia_miltennw_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_teach_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//Chc� si� nauczy� nowych zakl��.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltennw_teach);
		Info_AddChoice(dia_miltennw_teach,DIALOG_BACK,dia_miltennw_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_miltennw_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_miltennw_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_miltennw_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//Nie pozna�e� jeszcze drugiego kr�gu magii! Nie mog� ci� niczego nauczy�.
	};
};

func void dia_miltennw_teach_back()
{
	Info_ClearChoices(dia_miltennw_teach);
};

func void dia_miltennw_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltennw_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltennw_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENNW_MANA(C_INFO)
{
	npc = pc_mage_nw;
	nr = 100;
	condition = dia_miltennw_mana_condition;
	information = dia_miltennw_mana_info;
	permanent = TRUE;
	description = "Chc� zwi�kszy� moj� magiczn� moc.";
};


func int dia_miltennw_mana_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_mana_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//Chc� zwi�kszy� moj� magiczn� moc.
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//Twoja magiczna moc i tak jest ogromna. Obawiam si�, �e nie mog� ci pom�c.
	};
	Info_ClearChoices(dia_miltennw_mana);
};

func void dia_miltennw_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};


instance DIA_MAGE_NW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_mage_nw_pickpocket_condition;
	information = dia_mage_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_nw_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_mage_nw_pickpocket_info()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_BACK,dia_mage_nw_pickpocket_back);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_PICKPOCKET,dia_mage_nw_pickpocket_doit);
};

func void dia_mage_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

func void dia_mage_nw_pickpocket_back()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

