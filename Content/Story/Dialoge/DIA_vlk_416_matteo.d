
instance DIA_MATTEO_EXIT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 999;
	condition = dia_matteo_exit_condition;
	information = dia_matteo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_matteo_exit_condition()
{
	return TRUE;
};

func void dia_matteo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MATTEO_PICKPOCKET(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 900;
	condition = dia_matteo_pickpocket_condition;
	information = dia_matteo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_matteo_pickpocket_condition()
{
	return c_beklauen(80,150);
};

func void dia_matteo_pickpocket_info()
{
	Info_ClearChoices(dia_matteo_pickpocket);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_BACK,dia_matteo_pickpocket_back);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_PICKPOCKET,dia_matteo_pickpocket_doit);
};

func void dia_matteo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_matteo_pickpocket);
};

func void dia_matteo_pickpocket_back()
{
	Info_ClearChoices(dia_matteo_pickpocket);
};


instance DIA_MATTEO_HALLO(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_hallo_condition;
	information = dia_matteo_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_matteo_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_matteo_hallo_info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//Co mog� dla ciebie zrobi�?
};


instance DIA_MATTEO_SELLWHAT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_sellwhat_condition;
	information = dia_matteo_sellwhat_info;
	permanent = FALSE;
	description = "Co sprzedajesz?";
};


func int dia_matteo_sellwhat_condition()
{
	return TRUE;
};

func void dia_matteo_sellwhat_info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//Co sprzedajesz?
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//Mog� ci zaproponowa� wszystko, czego b�dziesz potrzebowa�, �eby przetrwa� w dziczy. Bro�, pochodnie, �ywno��... nawet pancerz.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//Mam na stanie co� specjalnego.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_03");	//Pancerz z podw�jnie utwardzanej sk�ry z�bacza - nieu�ywany. Zainteresowany?
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Sklep Mattea znajduje si� przy po�udniowej bramie miasta. Mo�na tam kupi� or�, �ywno�� oraz wyposa�enie.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_MATTEO_TRADE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 800;
	condition = dia_matteo_trade_condition;
	information = dia_matteo_trade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int dia_matteo_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};


var int matteo_tradenewspermanent;

func void dia_matteo_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//Poka� mi swoje towary.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (MATTEO_TRADENEWSPERMANENT == FALSE))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//Od czasu jak najemnicy za�atwili paladyna Lothara, inspekcje paladyn�w s� coraz bardziej nieprzyjemne.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//Mam nadziej�, �e jak ju� powiesz� morderc�, sytuacja si� uspokoi.
		MATTEO_TRADENEWSPERMANENT = 1;
	};
	if((KAPITEL == 5) && (MATTEO_TRADENEWSPERMANENT < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//Wygl�da na to, �e tym razem paladyni traktuj� to naprawd� powa�nie. Wycofali nawet swoich stra�nik�w ze statku.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//Dobrze, �e uzupe�niasz zapasy. Kto wie, czy miasto utrzyma si� jeszcze tydzie�.
		MATTEO_TRADENEWSPERMANENT = 2;
	};
};


var int matteo_leatherbought;

instance DIA_MATTEO_LEATHER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 850;
	condition = dia_matteo_leather_condition;
	information = dia_matteo_leather_info;
	permanent = TRUE;
	description = "Kup sk�rzany pancerz. Ochrona: bro� 25, strza�y 20. 250 sztuk z�ota.";
};


func int dia_matteo_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat) && (MATTEO_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_leather_info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//Dobra, daj mi pancerz.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//Na pewno ci si� spodoba.
		b_giveinvitems(self,other,itar_leather_l,1);
		MATTEO_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//Ten pancerz ma swoj� cen� - i jest jej wart. Przyjd�, jak b�dziesz mia� z�oto.
	};
};


instance DIA_MATTEO_PALADINE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_paladine_condition;
	information = dia_matteo_paladine_info;
	permanent = FALSE;
	description = "Co wiesz o paladynach?";
};


func int dia_matteo_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_matteo_paladine_info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//Co wiesz o paladynach?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//Od czasu, jak te bydlaki przysz�y do miasta, mam same k�opoty.
	AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//Kiedy ostatnio szed�em do g�rnego miasta, zatrzymali mnie stra�nicy i zapytali, po co tam id�!
	AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//I?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//Oczywi�cie, �e mnie wpu�cili!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//Mia�em w mie�cie sklep, kiedy wi�kszo�� z tych nad�tych dupk�w gania�a jeszcze �winie!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//A wczoraj te bydlaki skonfiskowa�y po�ow� mojego towaru!
};


instance DIA_MATTEO_CONFISCATED(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_confiscated_condition;
	information = dia_matteo_confiscated_info;
	permanent = FALSE;
	description = "Paladyni zabrali twoje towary?";
};


func int dia_matteo_confiscated_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine))
	{
		return TRUE;
	};
};

func void dia_matteo_confiscated_info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//Paladyni zabrali twoje towary?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//Wszystko, co mia�em na podw�rku.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//Postawili stra�nika przy wej�ciu na podw�rko.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//Je�li mi si� poszcz�ci, nie zabior� mi wszystkiego. Mo�e chocia� zostawi� t� zbroj�.
};


instance DIA_MATTEO_HELPMETOOV(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmetoov_condition;
	information = dia_matteo_helpmetoov_info;
	permanent = FALSE;
	description = "Czy mo�esz mi pom�c dosta� si� do g�rnego miasta?";
};


func int dia_matteo_helpmetoov_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmetoov_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//Mo�esz mi pom�c dosta� si� do g�rnego miasta?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//Co? Co b�dziesz TAM robi�?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//Mam wa�n� wiadomo��...
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//No, no, no. Pr�bowa�e� przemkn�� si� ko�o stra�nik�w?
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//Cz�owieku, zapomnij!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//To TYPOWE dla tych �ebrak�w!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//Nie rozumiem, dlaczego mia�bym w og�le pr�bowa�.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//Pewnie masz racj�.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//Nie wiem, jak WA�NA jest twoja wiadomo�� - nie obchodzi mnie to.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//Ale nawet gdyby� powiedzia� im, �e statek pe�en ork�w wp�yn�� w�a�nie do portu i tak by ci� odes�ali.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//Bo maj� swoje ROZKAZY.
};

func void b_matteo_preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//Wygl�da na to, �e to dla ciebie wa�ne.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//Pytanie tylko, JAK wa�ne?
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//Do czego zmierzasz?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//Mog� ci pom�c - by�o nie by�o jestem tu jednym z najbardziej wp�ywowych ludzi.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//Ale to ci� b�dzie kosztowa�.
};


instance DIA_MATTEO_HELPMENOW(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmenow_condition;
	information = dia_matteo_helpmenow_info;
	permanent = FALSE;
	description = "No to jak? Mo�esz mi pom�c dosta� si� do g�rnego miasta?";
};


func int dia_matteo_helpmenow_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmetoov) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmenow_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//No to jak? Mo�esz mi pom�c dosta� si� do g�rnego miasta?
	b_matteo_preis();
};


instance DIA_MATTEO_LEHRLINGLATER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_lehrlinglater_condition;
	information = dia_matteo_lehrlinglater_info;
	permanent = FALSE;
	description = "Pom� mi zosta� czeladnikiem u jednego z mistrz�w!";
};


func int dia_matteo_lehrlinglater_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_lehrlinglater_info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//Pom� mi zosta� czeladnikiem u jednego z mistrz�w.
	b_matteo_preis();
};


instance DIA_MATTEO_PRICEOFHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_priceofhelp_condition;
	information = dia_matteo_priceofhelp_info;
	permanent = FALSE;
	description = "Co chcesz w zamian za pomoc?";
};


func int dia_matteo_priceofhelp_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater))
	{
		return TRUE;
	};
};

func void dia_matteo_priceofhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//Co chcesz w zamian za pomoc?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//100 sztuk z�ota.
	Info_ClearChoices(dia_matteo_priceofhelp);
	Info_AddChoice(dia_matteo_priceofhelp,"To cholernie du�o...",dia_matteo_priceofhelp_wow);
	Info_AddChoice(dia_matteo_priceofhelp,"Ty pijawko!",dia_matteo_priceofhelp_cutthroat);
};

func void b_matteo_regdichab()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//Spokojnie! Nie TWOJE z�oto mia�em na my�li.
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//Ale.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//W�a�ciwie, chodzi mi o MOJE z�oto.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//Gritta, bratanica stolarza, od dawna jest mi winna pieni�dze.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//Ta ma�a lisica kr�ci si� po okolicy w nowych ciuszkach - a to znaczy, �e ma pieni�dze.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//Wywlek�bym jej te pieni�dze z gard�a, ale Mistrz Thorben - stolarz - to bardzo wp�ywowy cz�owiek.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//Za�atw mi te pieni�dze, to ci pomog�.
	MIS_MATTEO_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MATTEO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MATTEO,LOG_RUNNING);
	b_logentry(TOPIC_MATTEO,"Je�li Matteo dostanie od siostrzenicy stolarza Thorbena, Gritty, 100 sztuk z�ota, kt�re jest mu winna, pomo�e mi dosta� si� do g�rnego miasta.");
};

func void dia_matteo_priceofhelp_cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//Ty pijawko!
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};

func void dia_matteo_priceofhelp_wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//To cholernie du�o...
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};


instance DIA_MATTEO_WOGRITTA(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_wogritta_condition;
	information = dia_matteo_wogritta_info;
	permanent = FALSE;
	description = "Gdzie znajd� t� Gritt�?";
};


func int dia_matteo_wogritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (gritta.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_wogritta_info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//Gdzie znajd� t� Gritt�?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//Tak jak powiedzia�em, to siostrzenica stolarza. Jego dom stoi przy tej ulicy. To ostatni budynek po prawej stronie przed ku�ni�.
};


instance DIA_MATTEO_GOLDRUNNING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 500;
	condition = dia_matteo_goldrunning_condition;
	information = dia_matteo_goldrunning_info;
	permanent = TRUE;
	description = "Oto twoje 100 sztuk z�ota!";
};


func int dia_matteo_goldrunning_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_gritta_wantsmoney) || Npc_IsDead(gritta)))
	{
		return TRUE;
	};
};

func void dia_matteo_goldrunning_info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//Oto twoje 100 sztuk z�ota!
	if(Npc_IsDead(gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//Na tym z�ocie jest krew Gritty! Nie kaza�em ci jej zabija�!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//Nie chc� mie� z tym nic wsp�lnego. Mo�esz zapomnie� o naszej umowie. Nigdy wi�cej nie pr�buj ze mn� rozmawia�.
		MIS_MATTEO_GOLD = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
		return;
	};
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(Npc_HasItems(gritta,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//I co? Robi�a jakie� problemy?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//Nic, o czym warto wspomina�.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//�wietnie! Dotrzyma�e� swojej cz�ci umowy.
		}
		else
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//Chcesz za ni� zap�aci�? Hmmm - wola�bym, �eby� to z niej wycisn��!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//Mimo to 100 sztuk z�ota, to ci�gle 100 sztuk z�ota.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//Dotrzyma�e� swojej cz�ci umowy.
		};
		MIS_MATTEO_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_MATTEO_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//Liczenie nie jest twoj� najmocniejsz� stron�, co?
	};
};


instance DIA_MATTEO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_zustimmung_condition;
	information = dia_matteo_zustimmung_info;
	permanent = TRUE;
	description = "Pom� mi zosta� czeladnikiem u jednego z mistrz�w!";
};


var int dia_matteo_zustimmung_perm;

func int dia_matteo_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && ((MIS_MATTEO_GOLD == LOG_RUNNING) || (MIS_MATTEO_GOLD == LOG_SUCCESS)) && (PLAYER_ISAPPRENTICE == APP_NONE) && (DIA_MATTEO_ZUSTIMMUNG_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_zustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//Pom� mi zosta� czeladnikiem u jednego z mistrz�w!
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//Nie martw si�. Dotrzymam umowy.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//Inni mistrzowie us�ysz� o tobie same dobre rzeczy.
		b_giveplayerxp(XP_ZUSTIMMUNG);
		b_logentry(TOPIC_LEHRLING,"Je�li zechc� zosta� czeladnikiem, Matteo udzieli mi swojego poparcia.");
		DIA_MATTEO_ZUSTIMMUNG_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//Nie wszystko na raz. Najpierw wywi�� si� z umowy i przynie� mi z�oto!
	};
};


instance DIA_MATTEO_HOWCANYOUHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_howcanyouhelp_condition;
	information = dia_matteo_howcanyouhelp_info;
	permanent = FALSE;
	description = "Na czym DOK�ADNIE ma polega� twoja pomoc?";
};


func int dia_matteo_howcanyouhelp_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_howcanyouhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//Na czym DOK�ADNIE ma polega� twoja pomoc?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//To do�� proste. Wykorzystam swoje wp�ywy, �eby jeden z mistrz�w przyj�� ci� na czeladnika.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//A wtedy praktycznie rzecz bior�c, b�dziesz obywatelem miasta i g�rna jego cz�� stanie przed tob� otworem. Poza tym b�dziesz m�g� co� zarobi�.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Matteo mo�e mi pom�c zosta� czeladnikiem u jednego z mistrz�w.");
};


instance DIA_MATTEO_WOALSLEHRLING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_woalslehrling_condition;
	information = dia_matteo_woalslehrling_info;
	permanent = FALSE;
	description = "Kto w takim razie mo�e przyj�� mnie na czeladnika?";
};


func int dia_matteo_woalslehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_woalslehrling_info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//Kto w takim razie mo�e przyj�� mnie na czeladnika?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//Mo�e to by� kt�rykolwiek z mistrz�w mieszkaj�cych przy g��wnej ulicy.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//Harad kowal, Bosper �uczarz, Thorben stolarz albo Constantino alchemik.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//Jeden z nich musi ci� przyj��.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//Wa�ne jednak, �eby zgodzili si� na to pozostali mistrzowie. W Khorinis panuje taki zwyczaj.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Mog� zosta� czeladnikiem u �uczarza Bospera, kowala Harada, stolarza Thorbena lub alchemika Constantina.");
	b_logentry(TOPIC_LEHRLING,"Zanim zostan� czeladnikiem, musz� zyska� poparcie pozosta�ych mistrz�w.");
};


instance DIA_MATTEO_WIEZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 5;
	condition = dia_matteo_wiezustimmung_condition;
	information = dia_matteo_wiezustimmung_info;
	permanent = FALSE;
	description = "Jak uzyskam zgod� pozosta�ych mistrz�w?";
};


func int dia_matteo_wiezustimmung_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_woalslehrling) || Npc_KnowsInfo(other,dia_matteo_warumnichtbeidir)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_wiezustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//Jak uzyskam zgod� pozosta�ych mistrz�w?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//Musisz ich do tego przekona�. Id� z nimi porozmawia�.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//Wystarczy jednak, �eby� mia� przeciw sobie wi�cej ni� jednego z nich, a nie b�dziesz mia� szans! Wi�c lepiej si� zachowuj!
	b_logentry(TOPIC_LEHRLING,"Aby zyska� poparcie pozosta�ych mistrz�w, musz� dowie�� swojej warto�ci.");
};


instance DIA_MATTEO_WARUMNICHTBEIDIR(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_warumnichtbeidir_condition;
	information = dia_matteo_warumnichtbeidir_info;
	permanent = FALSE;
	description = "A dlaczego TY mnie nie we�miesz na czeladnika?";
};


func int dia_matteo_warumnichtbeidir_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_warumnichtbeidir_info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//A dlaczego TY mnie nie we�miesz na czeladnika?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//Ja nie mam nic przeciwko, ale inni mistrzowie nie zgadzaj� si�.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//Ostatnio przyj��em innego czeladnika.
};


instance DIA_MATTEO_OTHERWAY(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_otherway_condition;
	information = dia_matteo_otherway_info;
	permanent = FALSE;
	description = "Czy jest jaki� inny spos�b, �eby dosta� si� do g�rnego miasta?";
};


func int dia_matteo_otherway_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_otherway_info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//Czy jest jaki� inny spos�b, �eby dosta� si� do g�rnego miasta?
	AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//Mo�e... dam ci zna�, jak co� wymy�l�.
};


instance DIA_MATTEO_MINENANTEIL(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_minenanteil_condition;
	information = dia_matteo_minenanteil_info;
	description = "W�r�d rzeczy na sprzeda� zauwa�y�em udzia�y w kopalni.";
};


func int dia_matteo_minenanteil_condition()
{
	if((other.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};

func void dia_matteo_minenanteil_info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//W�r�d rzeczy na sprzeda� zauwa�y�em udzia�y w kopalni. Od kogo je masz?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//Udzia�y w kopalni? Eeee. Sk�d si� wzi�y? Nie mam poj�cia, sk�d je mam. Naprawd�, Panie.
	b_giveplayerxp(XP_AMBIENT);
};

