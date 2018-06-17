
instance DIA_THORBEN_EXIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 999;
	condition = dia_thorben_exit_condition;
	information = dia_thorben_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thorben_exit_condition()
{
	return TRUE;
};

func void dia_thorben_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_PICKPOCKET(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 900;
	condition = dia_thorben_pickpocket_condition;
	information = dia_thorben_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_thorben_pickpocket_condition()
{
	return c_beklauen(30,28);
};

func void dia_thorben_pickpocket_info()
{
	Info_ClearChoices(dia_thorben_pickpocket);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_BACK,dia_thorben_pickpocket_back);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_PICKPOCKET,dia_thorben_pickpocket_doit);
};

func void dia_thorben_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thorben_pickpocket);
};

func void dia_thorben_pickpocket_back()
{
	Info_ClearChoices(dia_thorben_pickpocket);
};


instance DIA_THORBEN_ANGEPISST(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_angepisst_condition;
	information = dia_thorben_angepisst_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_thorben_angepisst_condition()
{
	if(Npc_IsDead(gritta) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_thorben_angepisst_info()
{
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//Zamordowa�e� moj� Gritt�! Nigdy ci tego nie wybacz�! Precz, morderco!
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_HALLO(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_hallo_condition;
	information = dia_thorben_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thorben_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_hallo_info()
{
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//Ach, nowa twarz! Nie jeste� z Khorinis, prawda?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//Czasy nie s� dobre dla podr�nik�w. Wsz�dzie bandyci, nie ma pracy, a teraz jeszcze ch�opi si� buntuj�.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//Jakie wiatry ci� tu przywia�y?
};


instance DIA_THORBEN_ARBEIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_arbeit_condition;
	information = dia_thorben_arbeit_info;
	permanent = FALSE;
	description = "Szukam pracy.";
};


func int dia_thorben_arbeit_condition()
{
	return TRUE;
};

func void dia_thorben_arbeit_info()
{
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_00");	//Szukam pracy.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_01");	//Wiesz cokolwiek na temat stolarki?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//Jedyne co potrafi� zrobi� z drewnem, to rozpali� ogie�.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//A wiesz co� o �lusarce?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//No c�...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//Wybacz, ale nie b�d� mia� z ciebie po�ytku, je�li nic nie wiesz o moim rzemio�le.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//I nie mam pieni�dzy, �eby zap�aci� czeladnikowi.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Thorben nie chce mnie na czeladnika.");
};


instance DIA_THORBEN_OTHERMASTERS(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_othermasters_condition;
	information = dia_thorben_othermasters_info;
	permanent = FALSE;
	description = "A co je�li chcia�bym zosta� czeladnikiem u jednego z pozosta�ych mistrz�w?";
};


func int dia_thorben_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_othermasters_info()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//A co je�li chcia�bym zosta� czeladnikiem u jednego z pozosta�ych mistrz�w?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//Dobrze, dam ci moj� zgod�.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//Ale najpierw postaraj si� otrzyma� b�ogos�awie�stwo bog�w.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//Powiedz, czy jeste� cz�owiekiem wierz�cym?
	Info_ClearChoices(dia_thorben_othermasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		Info_AddChoice(dia_thorben_othermasters,"C�, je�li o to chodzi, to modl� si� regularnie...",dia_thorben_othermasters_naja);
	};
	Info_AddChoice(dia_thorben_othermasters,"Tak, jestem pokornym s�ug�, Mistrzu Thorbenie.",dia_thorben_othermasters_devoutly);
};

func void b_thorben_getblessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//Potem id� do Vatrasa, kap�ana Adanosa i popro� go o b�ogos�awie�stwo.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//On ci powie, gdzie znajdziesz kap�ana Innosa. On te� niech ci� pob�ogos�awi.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//Kiedy ju� otrzymasz b�ogos�awie�stwo bog�w, zag�osuj� na ciebie.
	MIS_THORBEN_GETBLESSINGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_THORBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_THORBEN,LOG_RUNNING);
	b_logentry(TOPIC_THORBEN,"Thorben udzieli mi swojego poparcia, je�li otrzymam b�ogos�awie�stwo od kap�ana Adanosa i od kap�ana Innosa.");
};

func void dia_thorben_othermasters_devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//Tak, jestem pokornym s�ug�, Mistrzu Thorbenie.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};

func void dia_thorben_othermasters_naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//C�, je�li o to chodzi, to modl� si� regularnie...
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//Rozumiem!
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//Cz�owiek, kt�ry nie szczyci si� b�ogos�awie�stwem bog�w, nigdy nie otrzyma mojej zgody.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//Popro� bog�w o wybaczenie za twe wykroczenia.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};


instance DIA_THORBEN_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_zustimmung_condition;
	information = dia_thorben_zustimmung_info;
	permanent = TRUE;
	description = "Co z twoj� zgod� Mistrzu?";
};


func int dia_thorben_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (MIS_THORBEN_GETBLESSINGS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thorben_zustimmung_info()
{
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//Co z twoj� zgod� Mistrzu?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//Czy Vatras da� ci swoje b�ogos�awie�stwo?
	if(VATRAS_SEGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//Tak.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//A czy otrzyma�e� r�wnie� b�ogos�awie�stwo od kap�ana Innosa?
		if((DARON_SEGEN == TRUE) || (ISGAROTH_SEGEN == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//Tak.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//Wi�c otrzymasz tak�e moje b�ogos�awie�stwo. Niezale�nie od wybranej �cie�ki b�d� dumny z dobrze wykonywanej pracy, ch�opcze!
			MIS_THORBEN_GETBLESSINGS = LOG_SUCCESS;
			b_giveplayerxp(XP_ZUSTIMMUNG);
			Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
			b_logentry(TOPIC_LEHRLING,"Thorben mo�e mi pom�c zosta� czeladnikiem u jednego z mistrz�w.");
		}
		else
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//Nie. Jeszcze nie...
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//Znasz moje warunki. Powiniene� pracowa� jedynie wtedy, gdy masz b�ogos�awie�stwo bog�w.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//Jeszcze nie...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//Wi�c nie rozumiem, czemu znowu mi przeszkadzasz. Znasz moje warunki.
	};
};


instance DIA_THORBEN_LOCKSMITH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_locksmith_condition;
	information = dia_thorben_locksmith_info;
	permanent = FALSE;
	description = "A wi�c wiesz sporo o �lusarstwie?";
};


func int dia_thorben_locksmith_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit))
	{
		return TRUE;
	};
};

func void dia_thorben_locksmith_info()
{
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//A wi�c wiesz sporo o �lusarstwie?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//Czym�e by�aby pi�kna skrzynia bez dobrego zamka?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//Sam wyrabiam zamki. Dzi�ki temu mog� mie� pewno��, �e nie na darmo zrobi�em mocne skrzynie.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//�le wykonany zamek mo�na z �atwo�ci� zniszczy�. A w Khorinis jest mn�stwo z�odziei. Szczeg�lnie ostatnio!
};


instance DIA_THORBEN_SCHULDENBUCH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_schuldenbuch_condition;
	information = dia_thorben_schuldenbuch_info;
	permanent = FALSE;
	description = "Mam tutaj ksi�g� rachunkow� Lehmara...";
};


func int dia_thorben_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_thorben_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//Mam tutaj ksi�g� rachunkow� Lehmara...
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//Sk�d j� masz?
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//Powinno ci� raczej interesowa� to, �e jest w niej twoje imi�.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//Daj mi j�!
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//A co dostan� w zamian?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//Nie mam �adnych pieni�dzy i nie mog� ofiarowa� ci nic wi�cej ni� moj� najszczersz� wdzi�czno��.
	b_giveplayerxp(XP_SCHULDENBUCH);
};


instance DIA_THORBEN_PLEASETEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_pleaseteach_condition;
	information = dia_thorben_pleaseteach_info;
	permanent = TRUE;
	description = "Mo�esz mnie nauczy�, jak otwiera� zamki?";
};


func int dia_thorben_pleaseteach_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith) && (THORBEN_TEACHPLAYER == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_pleaseteach_info()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//Mo�esz mnie nauczy�, jak otwiera� zamki?
	if(Npc_HasItems(self,itwr_schuldenbuch) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//Gdyby nie ty, do ko�ca �ycia sp�aca�bym Lehmara.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Naucz� ci� tego, co chcesz wiedzie�.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else if(THORBEN_GOTGOLD == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_03");	//Przynios�e� mi 100 sztuk z�ota. To dobry uczynek z twojej strony.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_04");	//Jest mi bardzo g�upio, ale musz� poprosi� ci� o wi�cej.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_05");	//Je�li szybko nie sp�ac� swego d�ugu u Lehmara, na�le na mnie swoich zbir�w.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_06");	//Daj mi jeszcze 100 sztuk z�ota, a b�d� ci� uczy�.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Ile sobie liczysz?",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Dobrze, oto 100 sztuk z�ota.",dia_thorben_pleaseteach_pay100);
	}
	else if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_07");	//Sp�aci�e� d�ug Gritty u Mattea. Wygl�da na to, �e porz�dny z ciebie cz�owiek. Naucz� ci� tego, co chcesz wiedzie�.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_08");	//Jednak nie mog� zrobi� tego za darmo. Jestem zad�u�ony po uszy i potrzebne mi s� pieni�dze.
		AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_09");	//Ile sobie liczysz?
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_10");	//200 sztuk z�ota.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Mo�e p�niej...",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Dobrze. Oto 200 sztuk z�ota.",dia_thorben_pleaseteach_pay200);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//Hmmm... Nie wiem, czy mo�na ci zaufa�.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//Kto wie, mo�esz by� jednym z tych darmozjad�w, kt�rzy przychodz� do miasta tylko po to, �eby opr�nia� skrzynie uczciwych obywateli.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//Nie naucz� ci� niczego, dop�ki nie przekonasz mnie, �e jeste� uczciwym cz�owiekiem.
	};
};

func void dia_thorben_pleaseteach_pay200()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay200_15_00");	//Dobrze. Oto 200 sztuk z�ota.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_01");	//Te pieni�dze naprawd� mi pomog�. Mo�emy zacz��, gdy tylko b�dziesz got�w.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_02");	//Wci�� nie masz 200 sztuk z�ota. A ja potrzebuj� tych pieni�dzy.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_pay100()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay100_15_00");	//Dobrze, oto 100 sztuk z�ota.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_01");	//W takim wypadku mo�emy zacz��, kiedy tylko b�dziesz got�w.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_02");	//Hej, ci�gle troch� brakuje do 100.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_later()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Later_15_00");	//Mo�e p�niej...
	Info_ClearChoices(dia_thorben_pleaseteach);
};


instance DIA_THORBEN_TEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_teach_condition;
	information = dia_thorben_teach_info;
	permanent = TRUE;
	description = b_buildlearnstring("Naucz mnie otwiera� zamki!",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK,1));
};


func int dia_thorben_teach_condition()
{
	if((THORBEN_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_teach_info()
{
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//Naucz mnie otwiera� zamki!
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//Potrzebny jest ci jedynie wytrych. Je�li b�dziesz porusza� nim w zamku ostro�nie w prawo i w lewo, mo�esz odblokowa� mechanizm.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//Ale je�li przesuniesz go za daleko lub za szybko w z�ym kierunku, to od razu si� z�amie.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//Im wi�cej masz do�wiadczenia, tym mniej wytrych�w b�dziesz potrzebowa�. To w�a�ciwie wszystko.
	};
};


instance DIA_THORBEN_TRADE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 3;
	condition = dia_thorben_trade_condition;
	information = dia_thorben_trade_info;
	permanent = TRUE;
	description = "Mo�esz mi sprzeda� par� wytrych�w?";
	trade = TRUE;
};


func int dia_thorben_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith))
	{
		return TRUE;
	};
};

func void dia_thorben_trade_info()
{
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//Mo�esz mi sprzeda� par� wytrych�w?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//Je�li jakie� mi zosta�y...
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//No dobrze. Ale nie na wiele ci si� przydadz�, je�li nie wiesz, jak z nich korzysta�.
	};
	if((Npc_HasItems(self,itke_lockpick) == 0) && (KAPITEL > DIETRICHGEBEN))
	{
		CreateInvItems(self,itke_lockpick,5);
		DIETRICHGEBEN = DIETRICHGEBEN + 1;
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Stolarz Thorben sprzedaje wytrychy.");
};


instance DIA_ADDON_THORBEN_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_addon_thorben_missingpeople_condition;
	information = dia_addon_thorben_missingpeople_info;
	description = "Mia�e� kiedy� czeladnika?";
};


func int dia_addon_thorben_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (ELVRICH_GOESBACK2THORBEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_00");	//Mia�e� kiedy� czeladnika?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_01");	//Owszem - i to ca�kiem niedawno.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_02");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_03");	//Nazywa si� Elvrich i jest moim siostrze�cem.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_04");	//Dobrze pracowa�, ale nagle przesta� si� pojawia�.
	MIS_THORBEN_BRINGELVRICHBACK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Znikn�� Elvrich, czeladnik stolarza Thorbena.");
	Info_ClearChoices(dia_addon_thorben_missingpeople);
	Info_AddChoice(dia_addon_thorben_missingpeople,DIALOG_BACK,dia_addon_thorben_missingpeople_back);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Stra� zosta�a o tym powiadomiona?",dia_addon_thorben_missingpeople_mil);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Jak dawno go ju� nie widzia�e�?",dia_addon_thorben_missingpeople_wann);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Gdzie on jest teraz?",dia_addon_thorben_missingpeople_where);
};

func void dia_addon_thorben_missingpeople_back()
{
	Info_ClearChoices(dia_addon_thorben_missingpeople);
};

func void dia_addon_thorben_missingpeople_wann()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_wann_15_00");	//Jak dawno ju� go nie widzia�e�?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_wann_06_01");	//Pewnie ze dwa tygodnie...
};

func void dia_addon_thorben_missingpeople_where()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_where_15_00");	//Gdzie on jest teraz?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_01");	//A sk�d ja mam wiedzie�? Ca�y czas kr�ci� si� przy tym plugawym burdelu w porcie.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_02");	//Nie zdziwi�bym si�, gdyby w tej chwili zabawia� si� tam z jedn� z panienek.
};

func void dia_addon_thorben_missingpeople_mil()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_00");	//Stra� zosta�a o tym powiadomiona?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_01");	//Jasne. Mieli go z�apa� i zadba�, �eby ruszy� ty�ek i zacz�� znowu pojawia� si� w pracy. Ju� tego �a�uj�...
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_02");	//A zreszt� - niech robi, co chce. Wcze�niej czy p�niej zorientuje si�, �e w Khorinis bez uczciwego zaj�cia trudno o cokolwiek.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_03");	//Czy�by...
};


instance DIA_ADDON_THORBEN_ELVRICHISBACK(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichisback_condition;
	information = dia_addon_thorben_elvrichisback_info;
	description = "Elvrich wr�ci i b�dzie zn�w dla ciebie pracowa�.";
};


func int dia_addon_thorben_elvrichisback_condition()
{
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && (Npc_IsDead(elvrich) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_elvrichisback_info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichIsBack_15_00");	//Elvrich wr�ci� i b�dzie zn�w dla ciebie pracowa�.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//Mam tylko nadziej�, �e nie ucieknie znowu, gdy tylko pojawi si� nast�pna kusa sp�dniczka...
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_02");	//Przyjmij to z�oto - to dzi�ki tobie odzyska�em czeladnika.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	MIS_THORBEN_BRINGELVRICHBACK = LOG_SUCCESS;
	vlk_4302_addon_elvrich.flags = 0;
};


instance DIA_THORBEN_PALADINE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_paladine_condition;
	information = dia_thorben_paladine_info;
	permanent = FALSE;
	description = "Co wiesz o paladynach?";
};


func int dia_thorben_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_thorben_paladine_info()
{
	AI_Output(other,self,"DIA_Thorben_Paladine_15_00");	//Co wiesz o paladynach?
	AI_Output(self,other,"DIA_Thorben_Paladine_06_01");	//Niewiele. Przybyli z kontynentu na statku dwa tygodnie temu.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//Od tego czasu przebywaj� w g�rnym mie�cie.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//Nikt dok�adnie nie wie, dlaczego tu przybyli.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//Wielu l�ka si� ataku ze strony ork�w.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//Wydaje mi si� jednak, �e przybyli, aby st�umi� powstanie farmer�w.
};


instance DIA_THORBEN_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_bauernaufstand_condition;
	information = dia_thorben_bauernaufstand_info;
	permanent = FALSE;
	description = "Wiesz co� o tym ch�opskim buncie?";
};


func int dia_thorben_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_thorben_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//Co wiesz o tym ch�opskim buncie?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//Chodz� pog�oski, �e ziemianin Onar wynaj�� najemnik�w, aby chronili go przed wojskami Kr�la.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//Mia� ju� pewnie do�� oddawania swoich plon�w i trzody paladynom i stra�y miejskiej.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//Skutkiem tego w mie�cie rosn� ceny �ywno�ci.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//Gospodarstwo Onara le�y na wsch�d st�d. Nie wiemy, czy tocz� si� tam jakie� walki.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//Je�li chcesz wiedzie� wi�cej, porozmawiaj z kupcami na targowisku. Podr�uj� po wyspie wi�cej ode mnie.
};


instance DIA_THORBEN_GRITTA(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_gritta_condition;
	information = dia_thorben_gritta_info;
	permanent = FALSE;
	description = "Przyszed�em w sprawie Gritty...";
};


func int dia_thorben_gritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_gritta_info()
{
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//Przyszed�em w sprawie Gritty...
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//Mojej siostrzenicy? A jak� masz do niej spraw�? Chyba nie chodzi o pieni�dze?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//Kupiec Matteo twierdzi, �e jest mu winna 100 sztuk z�ota.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//Powiedz, �e to nieprawda. Od kiedy si� do mnie wprowadzi�a, mam same k�opoty!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//Jest zad�u�ona praktycznie u ka�dego kupca w mie�cie.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//Musia�em po�yczy� 200 sztuk z�ota od lichwiarza Lehmara, �eby sp�aci� jej d�ugi! A teraz jeszcze to!
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//Gritta powinna by� w domu.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//No id�, zapytaj j�. Ale mog� powiedzie� ci jedno - nie ma z�amanego grosza przy duszy.
	if(Npc_HasItems(gritta,itmi_gold) >= 100)
	{
		AI_Output(other,self,"DIA_Thorben_Gritta_15_08");	//Zobaczymy...
	};
};


instance DIA_THORBEN_GRITTAHATTEGOLD(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_grittahattegold_condition;
	information = dia_thorben_grittahattegold_info;
	permanent = FALSE;
	description = "Twoja siostrzenica mia�a 100 sztuk z�ota.";
};


func int dia_thorben_grittahattegold_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_gritta) && (Npc_HasItems(gritta,itmi_gold) < 100) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_grittahattegold_info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//Twoja siostrzenica mia�a 100 sztuk z�ota.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//CO! A to bezwstydna, ma�a �mija - to by�o MOJE z�oto! Zabra�a je z mojej skrzyni.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//Oddaj mi je! Musz� najpierw sp�aci� Lehmara. Matteo mo�e dosta� pieni�dze p�niej.
	Info_ClearChoices(dia_thorben_grittahattegold);
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Matteo dosta� ju� pieni�dze ode mnie!",dia_thorben_grittahattegold_matteohates);
	}
	else
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Nie. Matteo dostanie ode mnie swoje pieni�dze.",dia_thorben_grittahattegold_matteosollhaben);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Oto twoje z�oto.",dia_thorben_grittahattegold_hereitis);
	};
};

func void b_thorben_deletepetzcrimegritta()
{
	if(GRITTA_GOLDGIVEN == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//Z tego co wiem o tej ma�ej �mii, to pobiegnie prosto do stra�y miejskiej i oskar�y ci�.
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//Dopilnuj�, �eby ta sprawa zosta�a za�atwiona.
		b_deletepetzcrime(gritta);
	};
};

func void dia_thorben_grittahattegold_matteohates()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//Matteo dosta� ju� pieni�dze ode mnie!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//A niech to! C�, d�ug to d�ug. Przynajmniej nie zatrzyma�e� pieni�dzy dla siebie. Chyba powinienem ci za to podzi�kowa�.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_matteosollhaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//Nie. Matteo dostanie ode mnie swoje pieni�dze.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//�ci�gasz na mnie spore k�opoty. Lehmar nie jest zbytnio wielkoduszny, je�li chodzi o d�ugi.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//Ale przynajmniej chcesz sp�aci� d�ugi mojej siostrzenicy. Chyba powinienem ci za to podzi�kowa�.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_hereitis()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//Oto twoje z�oto.
	b_giveinvitems(other,self,itmi_gold,100);
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//Dzi�kuj�! Teraz mam przynajmniej cz�� pieni�dzy, kt�re jestem winien Lehmarowi.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//Nie mog� wprost uwierzy�, �e o�mieli�a si� zabra� moje z�oto!
	b_thorben_deletepetzcrimegritta();
	THORBEN_GOTGOLD = TRUE;
	Info_ClearChoices(dia_thorben_grittahattegold);
};

