
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
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//Zamordowa³eœ moj¹ Grittê! Nigdy ci tego nie wybaczê! Precz, morderco!
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
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//Ach, nowa twarz! Nie jesteœ z Khorinis, prawda?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//Czasy nie s¹ dobre dla podró¿ników. Wszêdzie bandyci, nie ma pracy, a teraz jeszcze ch³opi siê buntuj¹.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//Jakie wiatry ciê tu przywia³y?
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
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//Jedyne co potrafiê zrobiæ z drewnem, to rozpaliæ ogieñ.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//A wiesz coœ o œlusarce?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//No có¿...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//Wybacz, ale nie bêdê mia³ z ciebie po¿ytku, jeœli nic nie wiesz o moim rzemioœle.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//I nie mam pieniêdzy, ¿eby zap³aciæ czeladnikowi.
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
	description = "A co jeœli chcia³bym zostaæ czeladnikiem u jednego z pozosta³ych mistrzów?";
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
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//A co jeœli chcia³bym zostaæ czeladnikiem u jednego z pozosta³ych mistrzów?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//Dobrze, dam ci moj¹ zgodê.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//Ale najpierw postaraj siê otrzymaæ b³ogos³awieñstwo bogów.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//Powiedz, czy jesteœ cz³owiekiem wierz¹cym?
	Info_ClearChoices(dia_thorben_othermasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		Info_AddChoice(dia_thorben_othermasters,"Có¿, jeœli o to chodzi, to modlê siê regularnie...",dia_thorben_othermasters_naja);
	};
	Info_AddChoice(dia_thorben_othermasters,"Tak, jestem pokornym s³ug¹, Mistrzu Thorbenie.",dia_thorben_othermasters_devoutly);
};

func void b_thorben_getblessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//Potem idŸ do Vatrasa, kap³ana Adanosa i poproœ go o b³ogos³awieñstwo.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//On ci powie, gdzie znajdziesz kap³ana Innosa. On te¿ niech ciê pob³ogos³awi.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//Kiedy ju¿ otrzymasz b³ogos³awieñstwo bogów, zag³osujê na ciebie.
	MIS_THORBEN_GETBLESSINGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_THORBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_THORBEN,LOG_RUNNING);
	b_logentry(TOPIC_THORBEN,"Thorben udzieli mi swojego poparcia, jeœli otrzymam b³ogos³awieñstwo od kap³ana Adanosa i od kap³ana Innosa.");
};

func void dia_thorben_othermasters_devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//Tak, jestem pokornym s³ug¹, Mistrzu Thorbenie.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};

func void dia_thorben_othermasters_naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//Có¿, jeœli o to chodzi, to modlê siê regularnie...
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//Rozumiem!
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//Cz³owiek, który nie szczyci siê b³ogos³awieñstwem bogów, nigdy nie otrzyma mojej zgody.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//Poproœ bogów o wybaczenie za twe wykroczenia.
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
	description = "Co z twoj¹ zgod¹ Mistrzu?";
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
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//Co z twoj¹ zgod¹ Mistrzu?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//Czy Vatras da³ ci swoje b³ogos³awieñstwo?
	if(VATRAS_SEGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//Tak.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//A czy otrzyma³eœ równie¿ b³ogos³awieñstwo od kap³ana Innosa?
		if((DARON_SEGEN == TRUE) || (ISGAROTH_SEGEN == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//Tak.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//Wiêc otrzymasz tak¿e moje b³ogos³awieñstwo. Niezale¿nie od wybranej œcie¿ki b¹dŸ dumny z dobrze wykonywanej pracy, ch³opcze!
			MIS_THORBEN_GETBLESSINGS = LOG_SUCCESS;
			b_giveplayerxp(XP_ZUSTIMMUNG);
			Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
			b_logentry(TOPIC_LEHRLING,"Thorben mo¿e mi pomóc zostaæ czeladnikiem u jednego z mistrzów.");
		}
		else
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//Nie. Jeszcze nie...
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//Znasz moje warunki. Powinieneœ pracowaæ jedynie wtedy, gdy masz b³ogos³awieñstwo bogów.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//Jeszcze nie...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//Wiêc nie rozumiem, czemu znowu mi przeszkadzasz. Znasz moje warunki.
	};
};


instance DIA_THORBEN_LOCKSMITH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_locksmith_condition;
	information = dia_thorben_locksmith_info;
	permanent = FALSE;
	description = "A wiêc wiesz sporo o œlusarstwie?";
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
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//A wiêc wiesz sporo o œlusarstwie?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//Czym¿e by³aby piêkna skrzynia bez dobrego zamka?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//Sam wyrabiam zamki. Dziêki temu mogê mieæ pewnoœæ, ¿e nie na darmo zrobi³em mocne skrzynie.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//le wykonany zamek mo¿na z ³atwoœci¹ zniszczyæ. A w Khorinis jest mnóstwo z³odziei. Szczególnie ostatnio!
};


instance DIA_THORBEN_SCHULDENBUCH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_schuldenbuch_condition;
	information = dia_thorben_schuldenbuch_info;
	permanent = FALSE;
	description = "Mam tutaj ksiêgê rachunkow¹ Lehmara...";
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
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//Mam tutaj ksiêgê rachunkow¹ Lehmara...
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//Sk¹d j¹ masz?
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//Powinno ciê raczej interesowaæ to, ¿e jest w niej twoje imiê.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//Daj mi j¹!
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//A co dostanê w zamian?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//Nie mam ¿adnych pieniêdzy i nie mogê ofiarowaæ ci nic wiêcej ni¿ moj¹ najszczersz¹ wdziêcznoœæ.
	b_giveplayerxp(XP_SCHULDENBUCH);
};


instance DIA_THORBEN_PLEASETEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_pleaseteach_condition;
	information = dia_thorben_pleaseteach_info;
	permanent = TRUE;
	description = "Mo¿esz mnie nauczyæ, jak otwieraæ zamki?";
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
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//Mo¿esz mnie nauczyæ, jak otwieraæ zamki?
	if(Npc_HasItems(self,itwr_schuldenbuch) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//Gdyby nie ty, do koñca ¿ycia sp³aca³bym Lehmara.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Nauczê ciê tego, co chcesz wiedzieæ.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else if(THORBEN_GOTGOLD == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_03");	//Przynios³eœ mi 100 sztuk z³ota. To dobry uczynek z twojej strony.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_04");	//Jest mi bardzo g³upio, ale muszê poprosiæ ciê o wiêcej.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_05");	//Jeœli szybko nie sp³acê swego d³ugu u Lehmara, naœle na mnie swoich zbirów.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_06");	//Daj mi jeszcze 100 sztuk z³ota, a bêdê ciê uczy³.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Ile sobie liczysz?",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Dobrze, oto 100 sztuk z³ota.",dia_thorben_pleaseteach_pay100);
	}
	else if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_07");	//Sp³aci³eœ d³ug Gritty u Mattea. Wygl¹da na to, ¿e porz¹dny z ciebie cz³owiek. Nauczê ciê tego, co chcesz wiedzieæ.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_08");	//Jednak nie mogê zrobiæ tego za darmo. Jestem zad³u¿ony po uszy i potrzebne mi s¹ pieni¹dze.
		AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_09");	//Ile sobie liczysz?
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_10");	//200 sztuk z³ota.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Mo¿e póŸniej...",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Dobrze. Oto 200 sztuk z³ota.",dia_thorben_pleaseteach_pay200);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//Hmmm... Nie wiem, czy mo¿na ci zaufaæ.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//Kto wie, mo¿esz byæ jednym z tych darmozjadów, którzy przychodz¹ do miasta tylko po to, ¿eby opró¿niaæ skrzynie uczciwych obywateli.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//Nie nauczê ciê niczego, dopóki nie przekonasz mnie, ¿e jesteœ uczciwym cz³owiekiem.
	};
};

func void dia_thorben_pleaseteach_pay200()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay200_15_00");	//Dobrze. Oto 200 sztuk z³ota.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_01");	//Te pieni¹dze naprawdê mi pomog¹. Mo¿emy zacz¹æ, gdy tylko bêdziesz gotów.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_02");	//Wci¹¿ nie masz 200 sztuk z³ota. A ja potrzebujê tych pieniêdzy.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_pay100()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay100_15_00");	//Dobrze, oto 100 sztuk z³ota.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_01");	//W takim wypadku mo¿emy zacz¹æ, kiedy tylko bêdziesz gotów.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_02");	//Hej, ci¹gle trochê brakuje do 100.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_later()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Later_15_00");	//Mo¿e póŸniej...
	Info_ClearChoices(dia_thorben_pleaseteach);
};


instance DIA_THORBEN_TEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_teach_condition;
	information = dia_thorben_teach_info;
	permanent = TRUE;
	description = b_buildlearnstring("Naucz mnie otwieraæ zamki!",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK,1));
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
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//Naucz mnie otwieraæ zamki!
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//Potrzebny jest ci jedynie wytrych. Jeœli bêdziesz porusza³ nim w zamku ostro¿nie w prawo i w lewo, mo¿esz odblokowaæ mechanizm.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//Ale jeœli przesuniesz go za daleko lub za szybko w z³ym kierunku, to od razu siê z³amie.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//Im wiêcej masz doœwiadczenia, tym mniej wytrychów bêdziesz potrzebowaæ. To w³aœciwie wszystko.
	};
};


instance DIA_THORBEN_TRADE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 3;
	condition = dia_thorben_trade_condition;
	information = dia_thorben_trade_info;
	permanent = TRUE;
	description = "Mo¿esz mi sprzedaæ parê wytrychów?";
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
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//Mo¿esz mi sprzedaæ parê wytrychów?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//Jeœli jakieœ mi zosta³y...
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//No dobrze. Ale nie na wiele ci siê przydadz¹, jeœli nie wiesz, jak z nich korzystaæ.
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
	description = "Mia³eœ kiedyœ czeladnika?";
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
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_00");	//Mia³eœ kiedyœ czeladnika?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_01");	//Owszem - i to ca³kiem niedawno.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_02");	//Co siê sta³o?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_03");	//Nazywa siê Elvrich i jest moim siostrzeñcem.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_04");	//Dobrze pracowa³, ale nagle przesta³ siê pojawiaæ.
	MIS_THORBEN_BRINGELVRICHBACK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Znikn¹³ Elvrich, czeladnik stolarza Thorbena.");
	Info_ClearChoices(dia_addon_thorben_missingpeople);
	Info_AddChoice(dia_addon_thorben_missingpeople,DIALOG_BACK,dia_addon_thorben_missingpeople_back);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Stra¿ zosta³a o tym powiadomiona?",dia_addon_thorben_missingpeople_mil);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Jak dawno go ju¿ nie widzia³eœ?",dia_addon_thorben_missingpeople_wann);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Gdzie on jest teraz?",dia_addon_thorben_missingpeople_where);
};

func void dia_addon_thorben_missingpeople_back()
{
	Info_ClearChoices(dia_addon_thorben_missingpeople);
};

func void dia_addon_thorben_missingpeople_wann()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_wann_15_00");	//Jak dawno ju¿ go nie widzia³eœ?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_wann_06_01");	//Pewnie ze dwa tygodnie...
};

func void dia_addon_thorben_missingpeople_where()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_where_15_00");	//Gdzie on jest teraz?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_01");	//A sk¹d ja mam wiedzieæ? Ca³y czas krêci³ siê przy tym plugawym burdelu w porcie.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_02");	//Nie zdziwi³bym siê, gdyby w tej chwili zabawia³ siê tam z jedn¹ z panienek.
};

func void dia_addon_thorben_missingpeople_mil()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_00");	//Stra¿ zosta³a o tym powiadomiona?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_01");	//Jasne. Mieli go z³apaæ i zadbaæ, ¿eby ruszy³ ty³ek i zacz¹³ znowu pojawiaæ siê w pracy. Ju¿ tego ¿a³ujê...
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_02");	//A zreszt¹ - niech robi, co chce. Wczeœniej czy póŸniej zorientuje siê, ¿e w Khorinis bez uczciwego zajêcia trudno o cokolwiek.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_03");	//Czy¿by...
};


instance DIA_ADDON_THORBEN_ELVRICHISBACK(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichisback_condition;
	information = dia_addon_thorben_elvrichisback_info;
	description = "Elvrich wróci i bêdzie znów dla ciebie pracowaæ.";
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
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichIsBack_15_00");	//Elvrich wróci³ i bêdzie znów dla ciebie pracowaæ.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//Mam tylko nadziejê, ¿e nie ucieknie znowu, gdy tylko pojawi siê nastêpna kusa spódniczka...
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_02");	//Przyjmij to z³oto - to dziêki tobie odzyska³em czeladnika.
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
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//Od tego czasu przebywaj¹ w górnym mieœcie.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//Nikt dok³adnie nie wie, dlaczego tu przybyli.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//Wielu lêka siê ataku ze strony orków.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//Wydaje mi siê jednak, ¿e przybyli, aby st³umiæ powstanie farmerów.
};


instance DIA_THORBEN_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_bauernaufstand_condition;
	information = dia_thorben_bauernaufstand_info;
	permanent = FALSE;
	description = "Wiesz coœ o tym ch³opskim buncie?";
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
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//Co wiesz o tym ch³opskim buncie?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//Chodz¹ pog³oski, ¿e ziemianin Onar wynaj¹³ najemników, aby chronili go przed wojskami Króla.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//Mia³ ju¿ pewnie doœæ oddawania swoich plonów i trzody paladynom i stra¿y miejskiej.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//Skutkiem tego w mieœcie rosn¹ ceny ¿ywnoœci.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//Gospodarstwo Onara le¿y na wschód st¹d. Nie wiemy, czy tocz¹ siê tam jakieœ walki.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//Jeœli chcesz wiedzieæ wiêcej, porozmawiaj z kupcami na targowisku. Podró¿uj¹ po wyspie wiêcej ode mnie.
};


instance DIA_THORBEN_GRITTA(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_gritta_condition;
	information = dia_thorben_gritta_info;
	permanent = FALSE;
	description = "Przyszed³em w sprawie Gritty...";
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
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//Przyszed³em w sprawie Gritty...
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//Mojej siostrzenicy? A jak¹ masz do niej sprawê? Chyba nie chodzi o pieni¹dze?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//Kupiec Matteo twierdzi, ¿e jest mu winna 100 sztuk z³ota.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//Powiedz, ¿e to nieprawda. Od kiedy siê do mnie wprowadzi³a, mam same k³opoty!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//Jest zad³u¿ona praktycznie u ka¿dego kupca w mieœcie.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//Musia³em po¿yczyæ 200 sztuk z³ota od lichwiarza Lehmara, ¿eby sp³aciæ jej d³ugi! A teraz jeszcze to!
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//Gritta powinna byæ w domu.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//No idŸ, zapytaj j¹. Ale mogê powiedzieæ ci jedno - nie ma z³amanego grosza przy duszy.
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
	description = "Twoja siostrzenica mia³a 100 sztuk z³ota.";
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
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//Twoja siostrzenica mia³a 100 sztuk z³ota.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//CO! A to bezwstydna, ma³a ¿mija - to by³o MOJE z³oto! Zabra³a je z mojej skrzyni.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//Oddaj mi je! Muszê najpierw sp³aciæ Lehmara. Matteo mo¿e dostaæ pieni¹dze póŸniej.
	Info_ClearChoices(dia_thorben_grittahattegold);
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Matteo dosta³ ju¿ pieni¹dze ode mnie!",dia_thorben_grittahattegold_matteohates);
	}
	else
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Nie. Matteo dostanie ode mnie swoje pieni¹dze.",dia_thorben_grittahattegold_matteosollhaben);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Oto twoje z³oto.",dia_thorben_grittahattegold_hereitis);
	};
};

func void b_thorben_deletepetzcrimegritta()
{
	if(GRITTA_GOLDGIVEN == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//Z tego co wiem o tej ma³ej ¿mii, to pobiegnie prosto do stra¿y miejskiej i oskar¿y ciê.
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//Dopilnujê, ¿eby ta sprawa zosta³a za³atwiona.
		b_deletepetzcrime(gritta);
	};
};

func void dia_thorben_grittahattegold_matteohates()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//Matteo dosta³ ju¿ pieni¹dze ode mnie!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//A niech to! Có¿, d³ug to d³ug. Przynajmniej nie zatrzyma³eœ pieniêdzy dla siebie. Chyba powinienem ci za to podziêkowaæ.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_matteosollhaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//Nie. Matteo dostanie ode mnie swoje pieni¹dze.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//Œci¹gasz na mnie spore k³opoty. Lehmar nie jest zbytnio wielkoduszny, jeœli chodzi o d³ugi.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//Ale przynajmniej chcesz sp³aciæ d³ugi mojej siostrzenicy. Chyba powinienem ci za to podziêkowaæ.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_hereitis()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//Oto twoje z³oto.
	b_giveinvitems(other,self,itmi_gold,100);
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//Dziêkujê! Teraz mam przynajmniej czêœæ pieniêdzy, które jestem winien Lehmarowi.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//Nie mogê wprost uwierzyæ, ¿e oœmieli³a siê zabraæ moje z³oto!
	b_thorben_deletepetzcrimegritta();
	THORBEN_GOTGOLD = TRUE;
	Info_ClearChoices(dia_thorben_grittahattegold);
};

