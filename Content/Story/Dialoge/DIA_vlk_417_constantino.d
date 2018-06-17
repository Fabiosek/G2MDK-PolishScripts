
instance DIA_CONSTANTINO_EXIT(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 999;
	condition = dia_constantino_exit_condition;
	information = dia_constantino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_constantino_exit_condition()
{
	return TRUE;
};

func void dia_constantino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 900;
	condition = dia_constantino_pickpocket_condition;
	information = dia_constantino_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_constantino_pickpocket_condition()
{
	return c_beklauen(59,90);
};

func void dia_constantino_pickpocket_info()
{
	Info_ClearChoices(dia_constantino_pickpocket);
	Info_AddChoice(dia_constantino_pickpocket,DIALOG_BACK,dia_constantino_pickpocket_back);
	Info_AddChoice(dia_constantino_pickpocket,DIALOG_PICKPOCKET,dia_constantino_pickpocket_doit);
};

func void dia_constantino_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_constantino_pickpocket);
};

func void dia_constantino_pickpocket_back()
{
	Info_ClearChoices(dia_constantino_pickpocket);
};


instance DIA_CONSTANTINO_HALLO(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_hallo_condition;
	information = dia_constantino_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_constantino_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_constantino_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Constantino_Hallo_10_00");	//Czego chcesz? Za darmo niczego tu nie dajê.
};


instance DIA_CONSTANTINO_ABOUTLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_aboutlehrling_condition;
	information = dia_constantino_aboutlehrling_info;
	permanent = FALSE;
	description = "Chcê zostaæ czeladnikiem.";
};


func int dia_constantino_aboutlehrling_condition()
{
	return TRUE;
};

func void dia_constantino_aboutlehrling_info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//Chcê zostaæ czeladnikiem.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//Naprawdê? A u kogo chcesz terminowaæ?
};


instance DIA_CONSTANTINO_HEILUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_constantino_heilung_condition;
	information = dia_constantino_heilung_info;
	permanent = FALSE;
	description = "Potrzebujê leczenia.";
};


func int dia_constantino_heilung_condition()
{
	return TRUE;
};

func void dia_constantino_heilung_info()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_15_00");	//Potrzebujê leczenia.
	AI_Output(self,other,"DIA_Constantino_Heilung_10_01");	//Co, jesteœ ranny?
	Info_ClearChoices(dia_constantino_heilung);
	Info_AddChoice(dia_constantino_heilung,"Nie.",dia_constantino_heilung_nein);
	Info_AddChoice(dia_constantino_heilung,"Tak.",dia_constantino_heilung_ja);
};

func void dia_constantino_heilung_ja()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//Tak.
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_01");	//IdŸ wiêc do Vatrasa, on ciê pozbiera do kupy. I przestañ krwawiæ na moj¹ pod³ogê!
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_02");	//To ledwie draœniêcie, a ja mam wa¿niejsze rzeczy do roboty ni¿ rozmowa z tob¹.
	};
	AI_StopProcessInfos(self);
};

func void dia_constantino_heilung_nein()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Nein_15_00");	//Nie.
	AI_Output(self,other,"DIA_Constantino_Heilung_Nein_10_01");	//Wynoœ siê wiêc, bo zaraz BÊDZIESZ ranny.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CONSTANTINO_LESTERSKRAEUTER(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_addon_constantino_lesterskraeuter_condition;
	information = dia_addon_constantino_lesterskraeuter_info;
	description = "Zechcesz mo¿e nabyæ nieco zió³?";
};


func int dia_addon_constantino_lesterskraeuter_condition()
{
	if((MIS_CONSTANTINO_BRINGHERBS == 0) && (MIS_ADDON_LESTER_PICKFORCONSTANTINO != 0))
	{
		return TRUE;
	};
};

func void dia_addon_constantino_lesterskraeuter_info()
{
	AI_Output(other,self,"DIA_Addon_Constantino_LestersKraeuter_15_00");	//Zechcesz mo¿e nabyæ nieco zió³?
	AI_Output(self,other,"DIA_Addon_Constantino_LestersKraeuter_10_01");	//Jeœli masz jakieœ na sprzeda¿...
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_CONSTANTINO_TRADE(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 700;
	condition = dia_constantino_trade_condition;
	information = dia_constantino_trade_info;
	permanent = TRUE;
	description = "Poka¿ mi swoje towary.";
	trade = TRUE;
};


func int dia_constantino_trade_condition()
{
	return TRUE;
};

func void dia_constantino_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//Poka¿ mi swoje towary.
	if(CONSTANTINO_LOGPATCH1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Constantino sprzedaje towary alchemiczne.");
		CONSTANTINO_LOGPATCH1 = TRUE;
	};
};


instance DIA_CONSTANTINO_BEIDIR(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_beidir_condition;
	information = dia_constantino_beidir_info;
	permanent = FALSE;
	description = "Chcê terminowaæ jako czeladnik... u ciebie.";
};


func int dia_constantino_beidir_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aboutlehrling) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_beidir_info()
{
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//Chcê terminowaæ jako czeladnik... u ciebie.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//U MNIE? Nie! Mia³em ju¿ w¹tpliw¹ przyjemnoœæ posiadania czeladnika. Jeden raz mi wystarczy.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//Poœwiêci³em wiele lat na jego naukê, a na koniec ten biedny g³upiec siê otru³.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//Wst¹p na nauki do któregoœ z innych mistrzów!
};


instance DIA_CONSTANTINO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_zustimmung_condition;
	information = dia_constantino_zustimmung_info;
	permanent = TRUE;
	description = "Chcê siê uczyæ u innego mistrza.";
};


func int dia_constantino_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aboutlehrling) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_zustimmung_info()
{
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//Chcê siê uczyæ u innego mistrza.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//Przyszed³eœ po moj¹ zgodê?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//Hmmm - jeœli chodzi o mnie, mo¿esz siê uczyæ u kogo tylko chcesz.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//No có¿, nie dostaniesz jej! To, co s³ysza³em na twój temat, nie œwiadczy o tobie dobrze.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//Nie bêdê g³osowa³, ¿eby taki kryminalista jak ty uzyska³ szanowan¹ pozycjê w naszym mieœcie.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//Do czasu a¿ za³atwisz tê sprawê z komendantem stra¿y miejskiej, moja odpowiedŸ brzmi nie!
	};
	if(CONSTANTINO_LOGPATCH2 == FALSE)
	{
		Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
		b_logentry(TOPIC_LEHRLING,"Constantino udzieli mi swojego poparcia, o ile nie bêdê zamieszany w ¿adne przestêpstwo.");
		CONSTANTINO_LOGPATCH2 = TRUE;
	};
};


instance DIA_CONSTANTINO_BRINGHERBS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_bringherbs_condition;
	information = dia_constantino_bringherbs_info;
	permanent = FALSE;
	description = "Co muszê zrobiæ, ¿eby zostaæ TWOIM czeladnikiem?";
};


func int dia_constantino_bringherbs_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_beidir) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_bringherbs_info()
{
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//Co muszê zrobiæ, ¿eby zostaæ TWOIM czeladnikiem?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//Moje sumienie nie znios³oby ciê¿aru œmierci KOLEJNEGO dyletanta.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//W okolicy roœnie mnóstwo ró¿norodnych zió³. Wykorzystane w ró¿nych kombinacjach daj¹ zdumiewaj¹ce efekty.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//Prawdopodobnie nie znasz nawet po³owy z nich.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//Masz - oto lista najwa¿niejszych roœlin.
	b_giveinvitems(self,other,itwr_kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//Przynieœ mi po jednej z ka¿dego rodzaju, a wtedy zastanowiê siê, czy przyj¹æ ciê na czeladnika.
	MIS_CONSTANTINO_BRINGHERBS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CONSTANTINOPLANTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CONSTANTINOPLANTS,LOG_RUNNING);
	b_logentry(TOPIC_CONSTANTINOPLANTS,"Constantino nie przyjmie mnie na swojego czeladnika, jeœli nie dostarczê mu po jednym egzemplarzu ka¿dej roœliny.");
};


instance DIA_CONSTANTINO_HERBSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_herbsrunning_condition;
	information = dia_constantino_herbsrunning_info;
	permanent = TRUE;
	description = "Jeœli chodzi o te roœliny...";
};


func int dia_constantino_herbsrunning_condition()
{
	if(MIS_CONSTANTINO_BRINGHERBS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_constantino_herbsrunning_info()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//Jeœli chodzi o te roœliny...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//Je¿eli sam nie potrafisz sobie z tym poradziæ, to nie nadajesz siê na alchemika!
	Info_ClearChoices(dia_constantino_herbsrunning);
	Info_AddChoice(dia_constantino_herbsrunning,"Rozumiem.",dia_constantino_herbsrunning_running);
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) && (Npc_HasItems(other,itpl_mana_herb_02) > 0) && (Npc_HasItems(other,itpl_mana_herb_03) > 0) && (Npc_HasItems(other,itpl_health_herb_01) > 0) && (Npc_HasItems(other,itpl_health_herb_02) > 0) && (Npc_HasItems(other,itpl_health_herb_03) > 0) && (Npc_HasItems(other,itpl_dex_herb_01) > 0) && (Npc_HasItems(other,itpl_strength_herb_01) > 0) && (Npc_HasItems(other,itpl_speed_herb_01) > 0) && (Npc_HasItems(other,itpl_temp_herb) > 0) && (Npc_HasItems(other,itpl_perm_herb) > 0))
	{
		Info_AddChoice(dia_constantino_herbsrunning,"Mam wszystkie roœliny, które mia³em przynieœæ!",dia_constantino_herbsrunning_success);
	};
};

func void dia_constantino_herbsrunning_success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//Mam wszystkie roœliny, które mia³em przynieœæ!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//Co? ¯artujesz sobie ze mnie, tak?
	AI_PrintScreen("Przekazano 11 przedmiotów (roœlin)",-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	Npc_RemoveInvItems(other,itpl_mana_herb_01,1);
	Npc_RemoveInvItems(other,itpl_mana_herb_02,1);
	Npc_RemoveInvItems(other,itpl_mana_herb_03,1);
	Npc_RemoveInvItems(other,itpl_health_herb_01,1);
	Npc_RemoveInvItems(other,itpl_health_herb_02,1);
	Npc_RemoveInvItems(other,itpl_health_herb_03,1);
	Npc_RemoveInvItems(other,itpl_dex_herb_01,1);
	Npc_RemoveInvItems(other,itpl_strength_herb_01,1);
	Npc_RemoveInvItems(other,itpl_speed_herb_01,1);
	Npc_RemoveInvItems(other,itpl_temp_herb,1);
	Npc_RemoveInvItems(other,itpl_perm_herb,1);
	CreateInvItems(self,itpl_mana_herb_01,1);
	CreateInvItems(self,itpl_mana_herb_02,1);
	CreateInvItems(self,itpl_mana_herb_03,1);
	CreateInvItems(self,itpl_health_herb_01,1);
	CreateInvItems(self,itpl_health_herb_02,1);
	CreateInvItems(self,itpl_health_herb_03,1);
	CreateInvItems(self,itpl_dex_herb_01,1);
	CreateInvItems(self,itpl_strength_herb_01,1);
	CreateInvItems(self,itpl_speed_herb_01,1);
	CreateInvItems(self,itpl_temp_herb,1);
	CreateInvItems(self,itpl_perm_herb,1);
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_02");	//Na Adanosa! Wszystko tu jest.
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//Kto wie, mo¿e pewnego dnia bêdzie z ciebie jednak porz¹dny alchemik.
	MIS_CONSTANTINO_BRINGHERBS = LOG_SUCCESS;
	b_giveplayerxp(XP_CONSTANTINO_HERBS);
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Constantino przyjmie mnie na swojego czeladnika, jeœli zyskam poparcie pozosta³ych mistrzów.");
	Info_ClearChoices(dia_constantino_herbsrunning);
};

func void dia_constantino_herbsrunning_running()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Running_15_00");	//Rozumiem.
	Info_ClearChoices(dia_constantino_herbsrunning);
};


var int constantino_startguild;

instance DIA_CONSTANTINO_LEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_lehrling_condition;
	information = dia_constantino_lehrling_info;
	permanent = TRUE;
	description = "Mogê teraz zostaæ twoim czeladnikiem?";
};


func int dia_constantino_lehrling_condition()
{
	if((MIS_CONSTANTINO_BRINGHERBS == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//Mogê teraz zostaæ twoim czeladnikiem?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//Jeœli chodzi o mnie, to tak!
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//Harada obchodzi tylko to, czy w razie ataku orków bêdziesz w stanie broniæ miasta.
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//Wygl¹da na to, ¿e uda³o ci siê go o tym przekonaæ.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//Uwa¿a jednak, ¿e jesteœ tchórzem.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//Harad twierdzi jednak, ¿e nigdy wczeœniej ciê nie widzia³.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//Bosper nie chcia³ nic powiedzieæ o twoich zdolnoœciach.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//Myœlê, ¿e sam chêtnie widzia³by ciê jako swojego czeladnika.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//Koniec koñców jednak siê zgodzi³.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//Odmówienie udzielenia zgody z takiego powodu jest niehonorowe!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//Jeœli jednak wszyscy pozostali mistrzowie wyra¿¹ zgodê, nie bêdziesz potrzebowa³ jego g³osu.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//Bosper jeszcze ciê nie zna.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//Thorben to bardzo pobo¿ny cz³owiek.
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//Da³ ci swoje b³ogos³awieñstwo. To dobry znak.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//Udzieli swojej aprobaty tylko takiemu kandydatowi, który cieszy siê b³ogos³awieñstwem bogów.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//Thorben nie wie, kim jesteœ.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//Jeœli chodzi o Mattea, to wychwala ciê pod niebiosa.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//Matteo powiedzia³, ¿e jesteœ mu coœ winien. Jeœli zale¿y ci na jego g³osie, to lepiej zajmij siê tym drobiazgiem.
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//Matteo powiedzia³, ¿e jeszcze nie omawia³eœ z nim tej sprawy.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//Matteo mówi, ¿e nigdy wczeœniej nie widzia³ ciê w swoim sklepie.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//To oznacza, ¿e masz zgodê wszystkich mistrzów!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//Masz zgodê czterech mistrzów. To wystarczy, byœ móg³ zostaæ czeladnikiem.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//Jesteœ gotów, by rozpocz¹æ terminowanie jako mój czeladnik?
			Info_ClearChoices(dia_constantino_lehrling);
			Info_AddChoice(dia_constantino_lehrling,"Muszê siê najpierw z tym przespaæ.",dia_constantino_lehrling_later);
			Info_AddChoice(dia_constantino_lehrling,"Tak, mistrzu.",dia_constantino_lehrling_yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//Aby zostaæ czeladnikiem w dolnej czêœci miasta, musisz mieæ zgodê co najmniej czterech mistrzów.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//Czyli powinieneœ porozmawiaæ z tymi, którzy ciê nie akceptuj¹.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//Nie ma mowy! Dosz³y mnie plotki, ¿e jesteœ oskar¿ony w Khorinis o pope³nienie przestêpstwa!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//Przyjmê ciê na czeladnika, dopiero jak za³atwisz tê sprawê z dowódc¹ stra¿y miejskiej.
	};
};

func void dia_constantino_lehrling_yes()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//Tak, mistrzu.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//Dobrze wiêc! Mam nadziejê, ¿e nie bêdê ¿a³owaæ tej decyzji.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//Od tej chwili mo¿esz siê uwa¿aæ za mojego czeladnika.
	PLAYER_ISAPPRENTICE = APP_CONSTANTINO;
	Npc_ExchangeRoutine(lothar,"START");
	CONSTANTINO_STARTGUILD = other.guild;
	CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Constantino przyj¹³ mnie na czeladnika. Droga do górnego miasta stoi przede mn¹ otworem.");
	Info_ClearChoices(dia_constantino_lehrling);
};

func void dia_constantino_lehrling_later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//Muszê siê najpierw z tym przespaæ.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//Dobrze! Ale jeœli nie potrafisz oddaæ siê temu ca³ym sercem, to powinieneœ zaj¹æ siê czymœ innym.
	Info_ClearChoices(dia_constantino_lehrling);
};


var int constantino_milkommentar;
var int constantino_innoskommentar;

instance DIA_CONSTANTINO_ALSLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_alslehrling_condition;
	information = dia_constantino_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_constantino_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_CONSTANTINO) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_constantino_alslehrling_info()
{
	if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//Nie mam zamiaru ciê uczyæ, dopóki jesteœ oskar¿ony o pope³nienie przestêpstwa.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//IdŸ do Lorda Andre i wyjaœnij sytuacjê.
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (CONSTANTINO_STARTGUILD != GIL_MIL) && (CONSTANTINO_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//Wst¹pi³eœ do stra¿y? Ju¿ o tym s³ysza³em.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//Najpierw czeladnik, a potem, hops, i do stra¿y? Nie zamierzam ci niczego u³atwiaæ.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//Oczekujê, ¿e bêdziesz siê trzyma³ naszej umowy i regularnie dostarcza³ mi roœliny, i grzyby.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//Jeœli nie bêdziesz sobie radziæ z dwoma zadaniami jednoczeœnie, to bêdziesz musia³ mniej spaæ!
		CONSTANTINO_MILKOMMENTAR = TRUE;
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (CONSTANTINO_STARTGUILD != GIL_NOV) && (CONSTANTINO_STARTGUILD != GIL_KDF) && (CONSTANTINO_STARTGUILD != GIL_PAL) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//Widzê, ¿e wst¹pi³eœ na s³u¿bê do Innosa. Domyœlam siê, ¿e od tej pory nie bêdziesz móg³ poœwiêcaæ zbyt du¿o czasu na dostarczanie zió³ staremu cz³owiekowi.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//Mimo to czujê siê zaszczycony, ¿e mog³em ciê wspieraæ.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//Je¿eli, pomimo nowych obowi¹zków, znajdziesz czas na zajmowanie siê alchemi¹, to pamiêtaj, ¿e jesteœ tu zawsze mile widziany.
		CONSTANTINO_INNOSKOMMENTAR = TRUE;
	}
	else if((CONSTANTINO_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//Co chcesz zrobiæ?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//Od swojego czeladnika spodziewam siê czegoœ wiêcej ni¿ zagl¹dania tutaj tylko od œwiêta!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//Czy przynios³eœ chocia¿ trochê grzybów?
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//To znowu ty...
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_CONSTANTINO_AUFGABEN(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_aufgaben_condition;
	information = dia_constantino_aufgaben_info;
	permanent = FALSE;
	description = "Jakie s¹ moje obowi¹zki?";
};


func int dia_constantino_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		return TRUE;
	};
};

func void dia_constantino_aufgaben_info()
{
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//Jakie s¹ moje obowi¹zki?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//Zdajê sobie sprawê, ¿e nie mogê oczekiwaæ od m³odego cz³owieka, ¿eby spêdza³ tu ze mn¹ ca³y dzieñ.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//Od czasu do czasu bêdziesz mi przynosiæ roœliny, których potrzebujê. A ja w zamian za to nauczê ciê sztuki alchemicznej.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//Buteleczki mo¿esz kupiæ ode mnie. Wiêkszoœæ ingrediencji bêdziesz musia³ jednak zdobyæ sam.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//No i spodziewam siê, ¿e jako obywatel tego miasta bêdziesz siê odpowiednio zachowywa³.
};


instance DIA_CONSTANTINO_MUSHROOMS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushrooms_condition;
	information = dia_constantino_mushrooms_info;
	permanent = FALSE;
	description = "Jakie roœliny mam przynosiæ?";
};


func int dia_constantino_mushrooms_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aufgaben))
	{
		return TRUE;
	};
};

func void dia_constantino_mushrooms_info()
{
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//Jakie roœliny mam przynosiæ?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//Kupiê wszystko, co mi przyniesiesz - i dam ci za to normaln¹ cenê.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//Za grzyby dostaniesz jednak specjalne wynagrodzenie.
	MIS_CONSTANTINO_MUSHROOMS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Constantino kupi ode mnie grzyby po wyj¹tkowo dobrej cenie.");
};


instance DIA_CONSTANTINO_MUSHROOMSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushroomsrunning_condition;
	information = dia_constantino_mushroomsrunning_info;
	permanent = TRUE;
	description = "Chcia³eœ grzybów...";
};


func int dia_constantino_mushroomsrunning_condition()
{
	if(MIS_CONSTANTINO_MUSHROOMS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_constantino_mushroomsrunning_info()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//Chcia³eœ grzybów...
	Info_ClearChoices(dia_constantino_mushroomsrunning);
	Info_AddChoice(dia_constantino_mushroomsrunning,"Przyniosê ci ich trochê.",dia_constantino_mushroomsrunning_later);
	if(PLAYER_KNOWSDUNKELPILZBONUS == FALSE)
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"Te nie s¹ tak dobre jak mu³owe grzyby, ale i tak je wezmê.",dia_constantino_mushroomsrunning_why);
	};
	if((Npc_HasItems(other,itpl_mushroom_01) > 0) || (Npc_HasItems(other,itpl_mushroom_02) > 0))
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"Mam kilka...",dia_constantino_mushroomsrunning_sell);
	};
};

func void dia_constantino_mushroomsrunning_sell()
{
	var int dunkelpilz_dabei;
	dunkelpilz_dabei = FALSE;
	if(Npc_HasItems(other,itpl_mushroom_01) > 0)
	{
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//Mam tu kilka mu³owych grzybów...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//Ach! Te s¹ najlepsze! Dobra robota! Oto twoje z³oto!
		dunkelpilz_dabei = TRUE;
		CONSTANTINO_DUNKELPILZCOUNTER = CONSTANTINO_DUNKELPILZCOUNTER + Npc_HasItems(other,itpl_mushroom_01);
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itpl_mushroom_01) * VALUE_MUSHROOM_01);
		b_giveinvitems(other,self,itpl_mushroom_01,Npc_HasItems(other,itpl_mushroom_01));
	};
	if(Npc_HasItems(other,itpl_mushroom_02) > 0)
	{
		if(dunkelpilz_dabei == TRUE)
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_02");	//A tu kilka innych...
		}
		else
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//Mam tu kilka grzybów!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//Te nie s¹ tak dobre jak mu³owe grzyby, ale i tak je wezmê.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itpl_mushroom_02) * VALUE_MUSHROOM_02);
		b_giveinvitems(other,self,itpl_mushroom_02,Npc_HasItems(other,itpl_mushroom_02));
	};
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};

func void dia_constantino_mushroomsrunning_why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//Dlaczego te grzyby s¹ takie wa¿ne?
	if(CONSTANTINO_DUNKELPILZCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//Jesteœ moim czeladnikiem, ale i tak nie zdradzê ci wszystkiego.
	}
	else if(CONSTANTINO_DUNKELPILZCOUNTER >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//Dobrze - powiem ci wiêc. Musisz to jednak zachowaæ dla siebie.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//Mu³owe grzyby s¹ przepe³nione magiczn¹ energi¹. Za ka¿dym razem, kiedy zjadasz taki grzyb, jej niewielka czêœæ odk³ada siê w twoim ciele.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//Kiedy zjesz ich dostatecznie du¿o, twoja energia magiczna wzroœnie...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//Gdybym powiedzia³ ci to wczeœniej, to pewnie sam byœ ze¿ar³ wszystkie te grzyby, prawda?
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_06");	//O rany!
		PLAYER_KNOWSDUNKELPILZBONUS = TRUE;
		Info_ClearChoices(dia_constantino_mushroomsrunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_07");	//Ju¿ mnie o to pyta³eœ. Kto wie, mo¿e pewnego dnia rzeczywiœcie ci powiem...
	};
};

func void dia_constantino_mushroomsrunning_later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//Przyniosê ci ich trochê.
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//Œwietnie! Przynieœ mi tyle, ile tylko zdo³asz znaleŸæ...
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};


instance DIA_CONSTANTINO_ALCHEMY(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_alchemy_condition;
	information = dia_constantino_alchemy_info;
	permanent = FALSE;
	description = "Naucz mnie sztuki alchemicznej!";
};


func int dia_constantino_alchemy_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		return TRUE;
	};
};

func void dia_constantino_alchemy_info()
{
	AI_Output(other,self,"DIA_Constantino_Alchemy_15_00");	//Naucz mnie sztuki alchemicznej!
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Dobrze. Najpierw podstawy.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Ka¿da mikstura jest robiona z roœlin, w których zawarte s¹ wszelkie moce.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Roœliny wykorzystuj¹ ca³¹ sw¹ energiê na wzrost, a sztuka alchemii polega w³aœnie na przekszta³caniu mocy roœlin.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//Aby przygotowaæ miksturê na stole alchemicznym, bêdziesz potrzebowa³ menzurki.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Musisz te¿ znaæ poprawn¹ formu³ê i mieæ odpowiednie ingrediencje.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Jest ca³kiem sporo formu³, których mogê ciê nauczyæ.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//S¹ mikstury, które przywracaj¹ stracone si³y, a nawet takie, które trwale je wzmacniaj¹.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Nie mo¿na jednak nauczyæ siê wszystkiego na raz.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Constantino mo¿e mi udzieliæ szkolenia w zakresie alchemii.");
};


instance DIA_CONSTANTINO_NEWRECIPES(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_newrecipes_condition;
	information = dia_constantino_newrecipes_info;
	permanent = FALSE;
	description = "Chcia³bym poznaæ nowe receptury tworzenia mikstur.";
};


func int dia_constantino_newrecipes_condition()
{
	if((PLAYER_ISAPPRENTICE != APP_CONSTANTINO) && (PLAYER_ISAPPRENTICE > APP_NONE) && (Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0))
	{
		return TRUE;
	};
};

func void dia_constantino_newrecipes_info()
{
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//Chcia³bym poznaæ nowe receptury tworzenia mikstur.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//Mia³eœ ju¿ wczeœniej jakiœ kontakt z alchemi¹?
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//Tak.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//I wci¹¿ jeszcze ¿yjesz... nie najgorsze kwalifikacje.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//Myœlê, ¿e mogê ci podaæ kilka formu³. Oczywiœcie zale¿y, co chcesz wiedzieæ.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Constantino mo¿e mi udzieliæ szkolenia w zakresie alchemii.");
};


instance DIA_CONSTANTINO_TEACH(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_teach_condition;
	information = dia_constantino_teach_info;
	permanent = TRUE;
	description = "Jakich receptur mo¿esz mnie nauczyæ?";
};


func int dia_constantino_teach_condition()
{
	if(CONSTANTINO_TEACHALCHEMY == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_teach_info()
{
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//Jakich receptur mo¿esz mnie nauczyæ?
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//Przykro mi. Niczego wiêcej nie mogê ciê nauczyæ.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//Znam kilka - musisz sam wybraæ.
		Info_ClearChoices(dia_constantino_teach);
		Info_AddChoice(dia_constantino_teach,DIALOG_BACK,dia_constantino_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Esencja lecznicza",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_constantino_teach_health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Ekstrakt leczniczy",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_constantino_teach_health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Eliksir leczniczy",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_constantino_teach_health03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Eliksir ¿ycia",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_constantino_teach_permhealth);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Esencja many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_constantino_teach_mana01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Ekstrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_constantino_teach_mana02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Eliksir si³y",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STR)),dia_constantino_teach_permstr);
	};
};

func void dia_constantino_teach_back()
{
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//Sk³adnikami esencji leczniczej s¹ roœliny lecznicze i rdest polny.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//Aby przygotowaæ ekstrakt leczniczy, potrzebujesz zió³ leczniczych i rdestu polnego.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//Pamiêtaj, ¿e ten wywar trzeba bardzo ostro¿nie podgrzewaæ.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health03()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//Stworzenie eliksiru leczniczego wymaga nieco doœwiadczenia.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//Bêd¹ ci potrzebne korzenie lecznicze i rdest polny. Bardzo uwa¿aj przy podgrzewaniu.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permhealth()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//Eliksir ¿ycia! To prawdziwa rzadkoœæ, ale wcale nie tak trudno go przyrz¹dziæ.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_01");	//Prawdziwym problemem jest zdobycie sk³adników. Potrzebne s¹ korzenie lecznicze i szczaw królewski.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//Esencja magiczna to najprostsza z wszystkich mikstur.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//WeŸ ogniste pokrzywy oraz rdest polny i powoli je podgrzewaj.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//Skoro potrafisz ju¿ przygotowaæ esencjê, przy niewielkim wysi³ku powinieneœ byæ w stanie otrzymaæ tak¿e ekstrakt.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//Ten wywar trzeba robiæ z sercem. Aby stworzyæ ten eliksir, u¿yj ognistego ziela i rdestu polnego.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permstr()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//Eliksir si³y! Wspania³a mikstura. Bêdziesz potrzebowa³ rzadko spotykanego smoczego korzenia i szczawiu królewskiego.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//Gotuj¹c wywar, nie mo¿esz pozwoliæ, ¿eby doszed³ do wrzenia, bo spotka ciê paskudna niespodzianka!
	};
	Info_ClearChoices(dia_constantino_teach);
};

