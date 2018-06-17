
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
	AI_Output(self,other,"DIA_Addon_Constantino_Hallo_10_00");	//Czego chcesz? Za darmo niczego tu nie daj�.
};


instance DIA_CONSTANTINO_ABOUTLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_aboutlehrling_condition;
	information = dia_constantino_aboutlehrling_info;
	permanent = FALSE;
	description = "Chc� zosta� czeladnikiem.";
};


func int dia_constantino_aboutlehrling_condition()
{
	return TRUE;
};

func void dia_constantino_aboutlehrling_info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//Chc� zosta� czeladnikiem.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//Naprawd�? A u kogo chcesz terminowa�?
};


instance DIA_CONSTANTINO_HEILUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_constantino_heilung_condition;
	information = dia_constantino_heilung_info;
	permanent = FALSE;
	description = "Potrzebuj� leczenia.";
};


func int dia_constantino_heilung_condition()
{
	return TRUE;
};

func void dia_constantino_heilung_info()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_15_00");	//Potrzebuj� leczenia.
	AI_Output(self,other,"DIA_Constantino_Heilung_10_01");	//Co, jeste� ranny?
	Info_ClearChoices(dia_constantino_heilung);
	Info_AddChoice(dia_constantino_heilung,"Nie.",dia_constantino_heilung_nein);
	Info_AddChoice(dia_constantino_heilung,"Tak.",dia_constantino_heilung_ja);
};

func void dia_constantino_heilung_ja()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//Tak.
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_01");	//Id� wi�c do Vatrasa, on ci� pozbiera do kupy. I przesta� krwawi� na moj� pod�og�!
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_02");	//To ledwie dra�ni�cie, a ja mam wa�niejsze rzeczy do roboty ni� rozmowa z tob�.
	};
	AI_StopProcessInfos(self);
};

func void dia_constantino_heilung_nein()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Nein_15_00");	//Nie.
	AI_Output(self,other,"DIA_Constantino_Heilung_Nein_10_01");	//Wyno� si� wi�c, bo zaraz B�DZIESZ ranny.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CONSTANTINO_LESTERSKRAEUTER(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_addon_constantino_lesterskraeuter_condition;
	information = dia_addon_constantino_lesterskraeuter_info;
	description = "Zechcesz mo�e naby� nieco zi�?";
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
	AI_Output(other,self,"DIA_Addon_Constantino_LestersKraeuter_15_00");	//Zechcesz mo�e naby� nieco zi�?
	AI_Output(self,other,"DIA_Addon_Constantino_LestersKraeuter_10_01");	//Je�li masz jakie� na sprzeda�...
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_CONSTANTINO_TRADE(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 700;
	condition = dia_constantino_trade_condition;
	information = dia_constantino_trade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int dia_constantino_trade_condition()
{
	return TRUE;
};

func void dia_constantino_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//Poka� mi swoje towary.
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
	description = "Chc� terminowa� jako czeladnik... u ciebie.";
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
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//Chc� terminowa� jako czeladnik... u ciebie.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//U MNIE? Nie! Mia�em ju� w�tpliw� przyjemno�� posiadania czeladnika. Jeden raz mi wystarczy.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//Po�wi�ci�em wiele lat na jego nauk�, a na koniec ten biedny g�upiec si� otru�.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//Wst�p na nauki do kt�rego� z innych mistrz�w!
};


instance DIA_CONSTANTINO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_zustimmung_condition;
	information = dia_constantino_zustimmung_info;
	permanent = TRUE;
	description = "Chc� si� uczy� u innego mistrza.";
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
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//Chc� si� uczy� u innego mistrza.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//Przyszed�e� po moj� zgod�?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//Hmmm - je�li chodzi o mnie, mo�esz si� uczy� u kogo tylko chcesz.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//No c�, nie dostaniesz jej! To, co s�ysza�em na tw�j temat, nie �wiadczy o tobie dobrze.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//Nie b�d� g�osowa�, �eby taki kryminalista jak ty uzyska� szanowan� pozycj� w naszym mie�cie.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//Do czasu a� za�atwisz t� spraw� z komendantem stra�y miejskiej, moja odpowied� brzmi nie!
	};
	if(CONSTANTINO_LOGPATCH2 == FALSE)
	{
		Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
		b_logentry(TOPIC_LEHRLING,"Constantino udzieli mi swojego poparcia, o ile nie b�d� zamieszany w �adne przest�pstwo.");
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
	description = "Co musz� zrobi�, �eby zosta� TWOIM czeladnikiem?";
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
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//Co musz� zrobi�, �eby zosta� TWOIM czeladnikiem?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//Moje sumienie nie znios�oby ci�aru �mierci KOLEJNEGO dyletanta.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//W okolicy ro�nie mn�stwo r�norodnych zi�. Wykorzystane w r�nych kombinacjach daj� zdumiewaj�ce efekty.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//Prawdopodobnie nie znasz nawet po�owy z nich.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//Masz - oto lista najwa�niejszych ro�lin.
	b_giveinvitems(self,other,itwr_kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//Przynie� mi po jednej z ka�dego rodzaju, a wtedy zastanowi� si�, czy przyj�� ci� na czeladnika.
	MIS_CONSTANTINO_BRINGHERBS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CONSTANTINOPLANTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CONSTANTINOPLANTS,LOG_RUNNING);
	b_logentry(TOPIC_CONSTANTINOPLANTS,"Constantino nie przyjmie mnie na swojego czeladnika, je�li nie dostarcz� mu po jednym egzemplarzu ka�dej ro�liny.");
};


instance DIA_CONSTANTINO_HERBSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_herbsrunning_condition;
	information = dia_constantino_herbsrunning_info;
	permanent = TRUE;
	description = "Je�li chodzi o te ro�liny...";
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
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//Je�li chodzi o te ro�liny...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//Je�eli sam nie potrafisz sobie z tym poradzi�, to nie nadajesz si� na alchemika!
	Info_ClearChoices(dia_constantino_herbsrunning);
	Info_AddChoice(dia_constantino_herbsrunning,"Rozumiem.",dia_constantino_herbsrunning_running);
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) && (Npc_HasItems(other,itpl_mana_herb_02) > 0) && (Npc_HasItems(other,itpl_mana_herb_03) > 0) && (Npc_HasItems(other,itpl_health_herb_01) > 0) && (Npc_HasItems(other,itpl_health_herb_02) > 0) && (Npc_HasItems(other,itpl_health_herb_03) > 0) && (Npc_HasItems(other,itpl_dex_herb_01) > 0) && (Npc_HasItems(other,itpl_strength_herb_01) > 0) && (Npc_HasItems(other,itpl_speed_herb_01) > 0) && (Npc_HasItems(other,itpl_temp_herb) > 0) && (Npc_HasItems(other,itpl_perm_herb) > 0))
	{
		Info_AddChoice(dia_constantino_herbsrunning,"Mam wszystkie ro�liny, kt�re mia�em przynie��!",dia_constantino_herbsrunning_success);
	};
};

func void dia_constantino_herbsrunning_success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//Mam wszystkie ro�liny, kt�re mia�em przynie��!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//Co? �artujesz sobie ze mnie, tak?
	AI_PrintScreen("Przekazano 11 przedmiot�w (ro�lin)",-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
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
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//Kto wie, mo�e pewnego dnia b�dzie z ciebie jednak porz�dny alchemik.
	MIS_CONSTANTINO_BRINGHERBS = LOG_SUCCESS;
	b_giveplayerxp(XP_CONSTANTINO_HERBS);
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Constantino przyjmie mnie na swojego czeladnika, je�li zyskam poparcie pozosta�ych mistrz�w.");
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
	description = "Mog� teraz zosta� twoim czeladnikiem?";
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
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//Mog� teraz zosta� twoim czeladnikiem?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//Je�li chodzi o mnie, to tak!
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//Harada obchodzi tylko to, czy w razie ataku ork�w b�dziesz w stanie broni� miasta.
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//Wygl�da na to, �e uda�o ci si� go o tym przekona�.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//Uwa�a jednak, �e jeste� tch�rzem.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//Harad twierdzi jednak, �e nigdy wcze�niej ci� nie widzia�.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//Bosper nie chcia� nic powiedzie� o twoich zdolno�ciach.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//My�l�, �e sam ch�tnie widzia�by ci� jako swojego czeladnika.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//Koniec ko�c�w jednak si� zgodzi�.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//Odm�wienie udzielenia zgody z takiego powodu jest niehonorowe!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//Je�li jednak wszyscy pozostali mistrzowie wyra�� zgod�, nie b�dziesz potrzebowa� jego g�osu.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//Bosper jeszcze ci� nie zna.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//Thorben to bardzo pobo�ny cz�owiek.
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//Da� ci swoje b�ogos�awie�stwo. To dobry znak.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//Udzieli swojej aprobaty tylko takiemu kandydatowi, kt�ry cieszy si� b�ogos�awie�stwem bog�w.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//Thorben nie wie, kim jeste�.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//Je�li chodzi o Mattea, to wychwala ci� pod niebiosa.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//Matteo powiedzia�, �e jeste� mu co� winien. Je�li zale�y ci na jego g�osie, to lepiej zajmij si� tym drobiazgiem.
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//Matteo powiedzia�, �e jeszcze nie omawia�e� z nim tej sprawy.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//Matteo m�wi, �e nigdy wcze�niej nie widzia� ci� w swoim sklepie.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//To oznacza, �e masz zgod� wszystkich mistrz�w!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//Masz zgod� czterech mistrz�w. To wystarczy, by� m�g� zosta� czeladnikiem.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//Jeste� got�w, by rozpocz�� terminowanie jako m�j czeladnik?
			Info_ClearChoices(dia_constantino_lehrling);
			Info_AddChoice(dia_constantino_lehrling,"Musz� si� najpierw z tym przespa�.",dia_constantino_lehrling_later);
			Info_AddChoice(dia_constantino_lehrling,"Tak, mistrzu.",dia_constantino_lehrling_yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//Aby zosta� czeladnikiem w dolnej cz�ci miasta, musisz mie� zgod� co najmniej czterech mistrz�w.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//Czyli powiniene� porozmawia� z tymi, kt�rzy ci� nie akceptuj�.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//Nie ma mowy! Dosz�y mnie plotki, �e jeste� oskar�ony w Khorinis o pope�nienie przest�pstwa!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//Przyjm� ci� na czeladnika, dopiero jak za�atwisz t� spraw� z dow�dc� stra�y miejskiej.
	};
};

func void dia_constantino_lehrling_yes()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//Tak, mistrzu.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//Dobrze wi�c! Mam nadziej�, �e nie b�d� �a�owa� tej decyzji.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//Od tej chwili mo�esz si� uwa�a� za mojego czeladnika.
	PLAYER_ISAPPRENTICE = APP_CONSTANTINO;
	Npc_ExchangeRoutine(lothar,"START");
	CONSTANTINO_STARTGUILD = other.guild;
	CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Constantino przyj�� mnie na czeladnika. Droga do g�rnego miasta stoi przede mn� otworem.");
	Info_ClearChoices(dia_constantino_lehrling);
};

func void dia_constantino_lehrling_later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//Musz� si� najpierw z tym przespa�.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//Dobrze! Ale je�li nie potrafisz odda� si� temu ca�ym sercem, to powiniene� zaj�� si� czym� innym.
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
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//Nie mam zamiaru ci� uczy�, dop�ki jeste� oskar�ony o pope�nienie przest�pstwa.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//Id� do Lorda Andre i wyja�nij sytuacj�.
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (CONSTANTINO_STARTGUILD != GIL_MIL) && (CONSTANTINO_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//Wst�pi�e� do stra�y? Ju� o tym s�ysza�em.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//Najpierw czeladnik, a potem, hops, i do stra�y? Nie zamierzam ci niczego u�atwia�.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//Oczekuj�, �e b�dziesz si� trzyma� naszej umowy i regularnie dostarcza� mi ro�liny, i grzyby.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//Je�li nie b�dziesz sobie radzi� z dwoma zadaniami jednocze�nie, to b�dziesz musia� mniej spa�!
		CONSTANTINO_MILKOMMENTAR = TRUE;
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (CONSTANTINO_STARTGUILD != GIL_NOV) && (CONSTANTINO_STARTGUILD != GIL_KDF) && (CONSTANTINO_STARTGUILD != GIL_PAL) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//Widz�, �e wst�pi�e� na s�u�b� do Innosa. Domy�lam si�, �e od tej pory nie b�dziesz m�g� po�wi�ca� zbyt du�o czasu na dostarczanie zi� staremu cz�owiekowi.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//Mimo to czuj� si� zaszczycony, �e mog�em ci� wspiera�.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//Je�eli, pomimo nowych obowi�zk�w, znajdziesz czas na zajmowanie si� alchemi�, to pami�taj, �e jeste� tu zawsze mile widziany.
		CONSTANTINO_INNOSKOMMENTAR = TRUE;
	}
	else if((CONSTANTINO_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//Co chcesz zrobi�?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//Od swojego czeladnika spodziewam si� czego� wi�cej ni� zagl�dania tutaj tylko od �wi�ta!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//Czy przynios�e� chocia� troch� grzyb�w?
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
	description = "Jakie s� moje obowi�zki?";
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
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//Jakie s� moje obowi�zki?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//Zdaj� sobie spraw�, �e nie mog� oczekiwa� od m�odego cz�owieka, �eby sp�dza� tu ze mn� ca�y dzie�.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//Od czasu do czasu b�dziesz mi przynosi� ro�liny, kt�rych potrzebuj�. A ja w zamian za to naucz� ci� sztuki alchemicznej.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//Buteleczki mo�esz kupi� ode mnie. Wi�kszo�� ingrediencji b�dziesz musia� jednak zdoby� sam.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//No i spodziewam si�, �e jako obywatel tego miasta b�dziesz si� odpowiednio zachowywa�.
};


instance DIA_CONSTANTINO_MUSHROOMS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushrooms_condition;
	information = dia_constantino_mushrooms_info;
	permanent = FALSE;
	description = "Jakie ro�liny mam przynosi�?";
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
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//Jakie ro�liny mam przynosi�?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//Kupi� wszystko, co mi przyniesiesz - i dam ci za to normaln� cen�.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//Za grzyby dostaniesz jednak specjalne wynagrodzenie.
	MIS_CONSTANTINO_MUSHROOMS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Constantino kupi ode mnie grzyby po wyj�tkowo dobrej cenie.");
};


instance DIA_CONSTANTINO_MUSHROOMSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushroomsrunning_condition;
	information = dia_constantino_mushroomsrunning_info;
	permanent = TRUE;
	description = "Chcia�e� grzyb�w...";
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
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//Chcia�e� grzyb�w...
	Info_ClearChoices(dia_constantino_mushroomsrunning);
	Info_AddChoice(dia_constantino_mushroomsrunning,"Przynios� ci ich troch�.",dia_constantino_mushroomsrunning_later);
	if(PLAYER_KNOWSDUNKELPILZBONUS == FALSE)
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"Te nie s� tak dobre jak mu�owe grzyby, ale i tak je wezm�.",dia_constantino_mushroomsrunning_why);
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
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//Mam tu kilka mu�owych grzyb�w...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//Ach! Te s� najlepsze! Dobra robota! Oto twoje z�oto!
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
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//Mam tu kilka grzyb�w!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//Te nie s� tak dobre jak mu�owe grzyby, ale i tak je wezm�.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itpl_mushroom_02) * VALUE_MUSHROOM_02);
		b_giveinvitems(other,self,itpl_mushroom_02,Npc_HasItems(other,itpl_mushroom_02));
	};
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};

func void dia_constantino_mushroomsrunning_why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//Dlaczego te grzyby s� takie wa�ne?
	if(CONSTANTINO_DUNKELPILZCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//Jeste� moim czeladnikiem, ale i tak nie zdradz� ci wszystkiego.
	}
	else if(CONSTANTINO_DUNKELPILZCOUNTER >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//Dobrze - powiem ci wi�c. Musisz to jednak zachowa� dla siebie.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//Mu�owe grzyby s� przepe�nione magiczn� energi�. Za ka�dym razem, kiedy zjadasz taki grzyb, jej niewielka cz�� odk�ada si� w twoim ciele.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//Kiedy zjesz ich dostatecznie du�o, twoja energia magiczna wzro�nie...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//Gdybym powiedzia� ci to wcze�niej, to pewnie sam by� ze�ar� wszystkie te grzyby, prawda?
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_06");	//O rany!
		PLAYER_KNOWSDUNKELPILZBONUS = TRUE;
		Info_ClearChoices(dia_constantino_mushroomsrunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_07");	//Ju� mnie o to pyta�e�. Kto wie, mo�e pewnego dnia rzeczywi�cie ci powiem...
	};
};

func void dia_constantino_mushroomsrunning_later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//Przynios� ci ich troch�.
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//�wietnie! Przynie� mi tyle, ile tylko zdo�asz znale��...
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
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Ka�da mikstura jest robiona z ro�lin, w kt�rych zawarte s� wszelkie moce.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Ro�liny wykorzystuj� ca�� sw� energi� na wzrost, a sztuka alchemii polega w�a�nie na przekszta�caniu mocy ro�lin.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//Aby przygotowa� mikstur� na stole alchemicznym, b�dziesz potrzebowa� menzurki.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Musisz te� zna� poprawn� formu�� i mie� odpowiednie ingrediencje.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Jest ca�kiem sporo formu�, kt�rych mog� ci� nauczy�.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//S� mikstury, kt�re przywracaj� stracone si�y, a nawet takie, kt�re trwale je wzmacniaj�.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Nie mo�na jednak nauczy� si� wszystkiego na raz.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Constantino mo�e mi udzieli� szkolenia w zakresie alchemii.");
};


instance DIA_CONSTANTINO_NEWRECIPES(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_newrecipes_condition;
	information = dia_constantino_newrecipes_info;
	permanent = FALSE;
	description = "Chcia�bym pozna� nowe receptury tworzenia mikstur.";
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
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//Chcia�bym pozna� nowe receptury tworzenia mikstur.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//Mia�e� ju� wcze�niej jaki� kontakt z alchemi�?
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//Tak.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//I wci�� jeszcze �yjesz... nie najgorsze kwalifikacje.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//My�l�, �e mog� ci poda� kilka formu�. Oczywi�cie zale�y, co chcesz wiedzie�.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Constantino mo�e mi udzieli� szkolenia w zakresie alchemii.");
};


instance DIA_CONSTANTINO_TEACH(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_teach_condition;
	information = dia_constantino_teach_info;
	permanent = TRUE;
	description = "Jakich receptur mo�esz mnie nauczy�?";
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
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//Jakich receptur mo�esz mnie nauczy�?
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//Przykro mi. Niczego wi�cej nie mog� ci� nauczy�.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//Znam kilka - musisz sam wybra�.
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
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Eliksir �ycia",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_constantino_teach_permhealth);
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
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Eliksir si�y",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STR)),dia_constantino_teach_permstr);
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
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//Sk�adnikami esencji leczniczej s� ro�liny lecznicze i rdest polny.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//Aby przygotowa� ekstrakt leczniczy, potrzebujesz zi� leczniczych i rdestu polnego.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//Pami�taj, �e ten wywar trzeba bardzo ostro�nie podgrzewa�.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health03()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//Stworzenie eliksiru leczniczego wymaga nieco do�wiadczenia.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//B�d� ci potrzebne korzenie lecznicze i rdest polny. Bardzo uwa�aj przy podgrzewaniu.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permhealth()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//Eliksir �ycia! To prawdziwa rzadko��, ale wcale nie tak trudno go przyrz�dzi�.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_01");	//Prawdziwym problemem jest zdobycie sk�adnik�w. Potrzebne s� korzenie lecznicze i szczaw kr�lewski.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//Esencja magiczna to najprostsza z wszystkich mikstur.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//We� ogniste pokrzywy oraz rdest polny i powoli je podgrzewaj.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//Skoro potrafisz ju� przygotowa� esencj�, przy niewielkim wysi�ku powiniene� by� w stanie otrzyma� tak�e ekstrakt.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//Ten wywar trzeba robi� z sercem. Aby stworzy� ten eliksir, u�yj ognistego ziela i rdestu polnego.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permstr()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//Eliksir si�y! Wspania�a mikstura. B�dziesz potrzebowa� rzadko spotykanego smoczego korzenia i szczawiu kr�lewskiego.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//Gotuj�c wywar, nie mo�esz pozwoli�, �eby doszed� do wrzenia, bo spotka ci� paskudna niespodzianka!
	};
	Info_ClearChoices(dia_constantino_teach);
};

