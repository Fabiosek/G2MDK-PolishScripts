
instance DIA_CASSIA_EXIT(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 999;
	condition = dia_cassia_exit_condition;
	information = dia_cassia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cassia_exit_condition()
{
	return TRUE;
};

func void dia_cassia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_PICKME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 900;
	condition = dia_cassia_pickme_condition;
	information = dia_cassia_pickme_info;
	permanent = TRUE;
	description = PICKPOCKET_100_FEMALE;
};


func int dia_cassia_pickme_condition()
{
	return c_beklauen(100,400);
};

func void dia_cassia_pickme_info()
{
	Info_ClearChoices(dia_cassia_pickme);
	Info_AddChoice(dia_cassia_pickme,DIALOG_BACK,dia_cassia_pickme_back);
	Info_AddChoice(dia_cassia_pickme,DIALOG_PICKPOCKET,dia_cassia_pickme_doit);
};

func void dia_cassia_pickme_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cassia_pickme);
};

func void dia_cassia_pickme_back()
{
	Info_ClearChoices(dia_cassia_pickme);
};


instance DIA_CASSIA_GILDE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_gilde_condition;
	information = dia_cassia_gilde_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_gilde_condition()
{
	if((CASSIA_GILDENCHECK == TRUE) && (JOIN_THIEFS == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_cassia_gilde_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//Widz�, �e sta�e� si� wojownikiem prawa i porz�dku.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//To �e s�u�ysz Innosowi, nie ma znaczenia. Jeste� jednym z nas. Mam nadziej�, �e ty te� tak to postrzegasz.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//Nale�ysz teraz do ko�cio�a Innosa, ale wci�� jeste� jednym z nas - mam nadziej�, �e o tym nie zapomnisz.
	};
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_ABGELAUFEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgelaufen_condition;
	information = dia_cassia_abgelaufen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_abgelaufen_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CASSIA_FRIST == TRUE) && (CASSIA_DAY < (b_getdayplus() - 2)))
	{
		return TRUE;
	};
};

func void dia_cassia_abgelaufen_info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//Termin min��. Trzeba by�o nie wraca�.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_CASSIA_NEWS(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_news_condition;
	information = dia_cassia_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_news_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//Widz�, �e dosta�e� nasz prezent. Jestem Cassia.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//W porz�dku, powiedz mi, dlaczego tu jestem?
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//Przyci�gn��e� nasz� uwag�, zdobywaj�c zaufanie naszych przyjaci�.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//Chcemy ci co� zaproponowa�. Mo�esz do nas do��czy�.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//Popatrzcie tylko, kto znalaz� do nas drog�. Atylla ci� nie doceni�. Ja nie pope�ni� tego b��du.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//Co si� tu dzieje?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//Chcieli�my twojej �mierci za to, �e donios�e� na jednego z naszych przyjaci�. Dlatego wys�ali�my Atyll�.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//Jednak twoja obecno�� tutaj otwiera now� mo�liwo��...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//...co chcesz mi zaproponowa�?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//Mo�esz do nas do��czy�.
	};
	if((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		CASSIA_GILDENCHECK = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_CASSIA_MEHR(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_mehr_condition;
	information = dia_cassia_mehr_info;
	permanent = FALSE;
	description = "Opowiedz mi wi�cej o waszej organizacji.";
};


func int dia_cassia_mehr_condition()
{
	return TRUE;
};

func void dia_cassia_mehr_info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//Opowiedz mi wi�cej o waszej organizacji.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//Ludzie w mie�cie boj� si� nas, ale nikt nie zna naszej kryj�wki.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//Ta garstka ludzi, kt�ra wie o istnieniu kana��w, jest przekonana, �e s� zamkni�te i nikt nie ma do nich dost�pu.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//Tak d�ugo jak nas nie znajd�, mo�emy spokojnie pracowa�.
};


instance DIA_CASSIA_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_missingpeople_condition;
	information = dia_cassia_missingpeople_info;
	permanent = FALSE;
	description = "Mo�esz mi co� powiedzie� o zaginionych mieszka�cach miasta?";
};


func int dia_cassia_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_00");	//Mo�esz mi co� powiedzie� o zaginionych mieszka�cach miasta?
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_01");	//Czemu niby chcesz si� o tym czego� dowiedzie�?
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_02");	//Interesuje mnie ich los.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_03");	//Opuszczaj�c kana�, pop�y� w prawo wzd�u� wybrze�a.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_04");	//Tam znajdziesz odpowiedzi na swoje pytania.
};


instance DIA_CASSIA_VORTEIL(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_vorteil_condition;
	information = dia_cassia_vorteil_info;
	permanent = FALSE;
	description = "Je�li do was do��cz�, to co b�d� z tego mia�?";
};


func int dia_cassia_vorteil_condition()
{
	return TRUE;
};

func void dia_cassia_vorteil_info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//Je�li do was do��cz�, to co b�d� z tego mia�?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//Mo�esz si� od nas nauczy� specjalnych zdolno�ci, kt�re pozwol� ci �y� w luksusie.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//Ale nie b�d� musia� ukrywa� si� tutaj na dole, prawda?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//Nie. Musisz jedynie przestrzega� naszych zasad. To wszystko.
};


instance DIA_CASSIA_LERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 4;
	condition = dia_cassia_lernen_condition;
	information = dia_cassia_lernen_info;
	permanent = FALSE;
	description = "Czego mog� si� od was nauczy�?";
};


func int dia_cassia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_lernen_info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//Czego mog� si� od was nauczy�?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//Jesper jest mistrzem skradania i ukrywania si�. Poka�e ci, jak si� bezszelestnie porusza�.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//Ramirez jest wyj�tkowo zdolnym w�amywaczem. �aden zamek nie oprze si� jego wytrychom.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//A ja mog� nauczy� ci� kradzie�y kieszonkowej.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//Pomog� ci tak�e sta� si� zr�czniejszym. To podstawa twoich zdolno�ci.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Cassia mo�e nauczy� mnie kradzie�y kieszonkowej. Mo�e mi r�wnie� pokaza�, jak sta� si� zr�czniejszym.");
	b_logentry(TOPIC_CITYTEACHER,"Ramirez mo�e mnie nauczy�, jak otwiera� zamki.");
	b_logentry(TOPIC_CITYTEACHER,"Jesper mo�e mnie nauczy�, jak si� skrada�.");
};


instance DIA_CASSIA_REGELN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_regeln_condition;
	information = dia_cassia_regeln_info;
	permanent = FALSE;
	description = "Jakie s� wasze zasady?";
};


func int dia_cassia_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_regeln_info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//Jakie s� wasze zasady?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//Zasada pierwsza: ani s�owa o nas. Nikomu. Nigdy.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Druga: nie daj si� z�apa�.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Trzecia: je�eli wyci�gniesz tu bro�, �eby kogo� zaatakowa�, zabijemy ci�.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//I czwarta, ostatnia zasada: ci, kt�rzy chc� do nas do��czy�, musz� udowodni� swoj� warto��.
};


instance DIA_CASSIA_ERWISCHEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_erwischen_condition;
	information = dia_cassia_erwischen_info;
	permanent = FALSE;
	description = "Co si� stanie, jak mnie z�api�?";
};


func int dia_cassia_erwischen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_erwischen_info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//Co si� stanie, jak mnie z�api�?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//Po prostu nie daj si� z�apa�, dobra?
};


instance DIA_CASSIA_BEWEISEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_beweisen_condition;
	information = dia_cassia_beweisen_info;
	permanent = TRUE;
	description = "Jak mam dowie�� swojej warto�ci?";
};


var int dia_cassia_beweisen_permanent;

func int dia_cassia_beweisen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln) && (DIA_CASSIA_BEWEISEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_beweisen_info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//Jak mam dowie�� swojej warto�ci?
	if(JOIN_THIEFS == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//Do��czysz do nas czy nie?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//Ten uparty stary alchemik - Constantino - ma pi�kny pier�cie�.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//Nie jest mu on potrzebny. Chc�, by przyozdobi� moj� d�o�.
		MIS_CASSIARING = LOG_RUNNING;
		DIA_CASSIA_BEWEISEN_PERMANENT = TRUE;
		Log_CreateTopic(TOPIC_CASSIARING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIARING,LOG_RUNNING);
		b_logentry(TOPIC_CASSIARING,"Cassia chce, abym przyni�s� jej pier�cie� Constantina.");
	};
};


instance DIA_CASSIA_BEITRETEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_beitreten_condition;
	information = dia_cassia_beitreten_info;
	permanent = FALSE;
	description = "Dobra, niech b�dzie.";
};


func int dia_cassia_beitreten_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_beitreten_info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//Dobra, wchodz� w to.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//�wietnie. B�dziesz mia� okazj� dowie�� swej warto�ci. Je�li chcesz si� od nas uczy�, to nie widz� ku temu �adnych przeszk�d.
	JOIN_THIEFS = TRUE;
};


instance DIA_CASSIA_ABLEHNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 9;
	condition = dia_cassia_ablehnen_condition;
	information = dia_cassia_ablehnen_info;
	permanent = FALSE;
	description = "A co je�li nie chc� do was do��czy�...?";
};


func int dia_cassia_ablehnen_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_ablehnen_info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//A co je�li nie chc� do was do��czy�...?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//Tracisz jedyn� w swoim rodzaju szans�, ale mo�esz odej��.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//I nawet nie my�l o zdradzie. Gorzko by� tego po�a�owa�.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"Dobra, niech b�dzie.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"Musz� si� nad tym zastanowi�.",dia_cassia_ablehnen_frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//W takim razie zabij� ci�.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"Dobra, niech b�dzie.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"W takim razie spr�buj mnie zabi�.",dia_cassia_ablehnen_kill);
	};
};

func void dia_cassia_ablehnen_okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//Dobra, niech b�dzie.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//Podj��e� m�dr� decyzj�. Je�eli uda ci si� dowie�� swojej warto�ci, b�dziesz m�g� wst�pi� w nasze szeregi.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_02");	//Je�eli chcesz wcze�niej opanowa� umiej�tno�ci z�odziejskie, to nie kr�puj si� - na pewno ci si� przydadz�.
	JOIN_THIEFS = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};

func void dia_cassia_ablehnen_kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//W takim razie spr�buj mnie zabi�.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//Szkoda. My�la�am, �e jeste� m�drzejszy.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_cassia_ablehnen_frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//Musz� si� nad tym zastanowi�.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//Zr�b tak. Daj� ci dwa dni na podj�cie decyzji. Potem nie b�dziesz tu mile widziany.
	CASSIA_DAY = b_getdayplus();
	CASSIA_FRIST = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};


instance DIA_CASSIA_BEVORLERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 5;
	condition = dia_cassia_bevorlernen_condition;
	information = dia_cassia_bevorlernen_info;
	permanent = TRUE;
	description = "Mo�esz mnie przeszkoli�?";
};


func int dia_cassia_bevorlernen_condition()
{
	if((JOIN_THIEFS == TRUE) && Npc_KnowsInfo(other,dia_cassia_lernen) && ((CASSIA_TEACHPICKPOCKET == FALSE) || (CASSIA_TEACHDEX == FALSE)))
	{
		return TRUE;
	};
};

func void dia_cassia_bevorlernen_info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");	//Mo�esz mnie przeszkoli�?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_01");	//Pewnie, nie ma problemu. Daj mi tylko zna�, jak b�dziesz got�w.
		CASSIA_TEACHPICKPOCKET = TRUE;
		CASSIA_TEACHDEX = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_02");	//Pewnie. Szkolenie w zakresie kradzie�y kieszonkowej i zr�czno�ci b�dzie ci� kosztowa� 100 sztuk z�ota ka�de.
		Info_ClearChoices(dia_cassia_bevorlernen);
		Info_AddChoice(dia_cassia_bevorlernen,"Mo�e p�niej... (POWR�T)",dia_cassia_bevorlernen_spaeter);
		if(CASSIA_TEACHPICKPOCKET == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"Chc� pozna� zasady kradzie�y kieszonkowej (zap�a� 100 sztuk z�ota).",dia_cassia_bevorlernen_pickpocket);
		};
		if(CASSIA_TEACHDEX == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"Chc� si� sta� zr�czniejszy (zap�a� 100 sztuk z�ota).",dia_cassia_bevorlernen_dex);
		};
	};
};

func void dia_cassia_bevorlernen_spaeter()
{
	Info_ClearChoices(dia_cassia_bevorlernen);
};

func void dia_cassia_bevorlernen_dex()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_DEX_15_00");	//Chc� by� zr�czniejszy. Tu masz z�oto.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_DEX_16_01");	//Mo�emy zacz��, jak tylko b�dziesz gotowy.
		CASSIA_TEACHDEX = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");	//Wr��, jak b�dziesz mia� z�oto.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};

func void dia_cassia_bevorlernen_pickpocket()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_Pickpocket_15_00");	//Chc� si� nauczy� kradzie�y kieszonkowej. Oto z�oto.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_01");	//Mo�emy zacz��, jak tylko b�dziesz gotowy.
		CASSIA_TEACHPICKPOCKET = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_02");	//Wr��, jak b�dziesz mia� z�oto.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};


instance DIA_CASSIA_TEACH(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 12;
	condition = dia_cassia_teach_condition;
	information = dia_cassia_teach_info;
	permanent = TRUE;
	description = "Chc� by� zr�czniejszy.";
};


func int dia_cassia_teach_condition()
{
	if(CASSIA_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_cassia_teach_info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//Chc� by� zr�czniejszy.
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_back()
{
	Info_ClearChoices(dia_cassia_teach);
};

func void dia_cassia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};


instance DIA_CASSIA_PICKPOCKET(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_pickpocket_condition;
	information = dia_cassia_pickpocket_info;
	permanent = TRUE;
	description = "Poka� mi, jak okrada� innych (10 punkt�w nauki).";
};


func int dia_cassia_pickpocket_condition()
{
	if((CASSIA_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_pickpocket_info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//Poka� mi, jak opr�ni� czyje� kieszenie.
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//Je�eli chcesz opr�ni� czyje� kieszenie, musisz odci�gn�� uwag� ofiary. Zacznij z ni� gaw�dzi�.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//Podczas rozmowy postaraj si� oceni�, z kim masz do czynienia. Zwr�� uwag� na wypchane kieszenie albo bi�uteri�. Ale przede wszystkim oce�, jak czujny jest klient.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//Pami�taj, �e okradanie pijanego robotnika to nie to samo co skubanie czujnego kupca.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//Jak b�dziesz niezgrabny, to klient si� skapuje. Tak wi�c musisz by� opanowany.
	};
};


instance DIA_CASSIA_AUFNAHME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_aufnahme_condition;
	information = dia_cassia_aufnahme_info;
	permanent = FALSE;
	description = "Mam pier�cie� Constantina.";
};


func int dia_cassia_aufnahme_condition()
{
	if((MIS_CASSIARING == LOG_RUNNING) && (Npc_HasItems(other,itri_prot_point_01_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_cassia_aufnahme_info()
{
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//Mam pier�cie� Constantina.
	b_giveinvitems(other,self,itri_prot_point_01_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//Gratulacje. Przeszed�e� inicjacj�. Teraz jeste� jednym z nas.
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//We� ten klucz. Otwiera drzwi do gospody. Nie b�dziesz musia� tapla� si� w wodzie za ka�dym razem.
	b_giveinvitems(self,other,itke_thiefguildkey_hotel_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//Co wi�cej, musisz wiedzie�, �e mamy tajny znak. Charakterystyczne kiwni�cie g�ow�.
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//W�a�nie tak. Kiedy b�dziesz z kim� rozmawia� i zrobisz ten znak, jasne b�dzie, �e jeste� jednym z nas.
	MIS_CASSIARING = LOG_SUCCESS;
	b_giveplayerxp(XP_CASSIARING);
	KNOWS_SECRETSIGN = TRUE;
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"Zosta�em przyj�ty do gildii z�odziei.");
	b_logentry(TOPIC_DIEBESGILDE,"Pozna�em tajny znak z�odziei. Je�li poka�� go innemu z�odziejowi, b�dzie wiedzia�, �e ja r�wnie� jestem cz�onkiem gildii.");
};


instance DIA_CASSIA_VERSTECK(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_versteck_condition;
	information = dia_cassia_versteck_info;
	permanent = FALSE;
	description = "Gdzie ukrywacie swoje �upy?";
};


func int dia_cassia_versteck_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_ramirez_beute))
	{
		return TRUE;
	};
};

func void dia_cassia_versteck_info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//Gdzie ukrywacie swoje �upy?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//Daj spok�j, nie my�la�e� chyba, �e ci to powiem?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//B�dziesz mia� do�� okazji, �eby po�o�y� �apki na maj�tku innych ludzi - zbyt chciwi ko�cz� z pustymi r�kami.
};


instance DIA_CASSIA_BLUTKELCHE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_blutkelche_condition;
	information = dia_cassia_blutkelche_info;
	permanent = FALSE;
	description = "Masz dla mnie jak�� robot�?";
};


func int dia_cassia_blutkelche_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (MIS_CASSIAKELCHE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cassia_blutkelche_info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//Masz dla mnie jak�� robot�?
	if(PETZCOUNTER_CITY_THEFT > 0)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_01");	//Nie, je�li w mie�cie jeste� �cigany za kradzie�e.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_02");	//Za�atw to - zap�a� grzywn� albo pozb�d� si� �wiadk�w. Nie obchodzi mnie jak, ale masz to zrobi�.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//Tak. Jest zestaw kielich�w - sze�ciu.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//Kr�l Rhobar zdoby� je podczas jednej z kampanii - ale po�wi�ci� wtedy wielu ludzi. Dlatego s� nazywane Krwawymi Kielichami.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//Pojedynczo nie s� zbyt cenne - ale razem s� warte okr�g�� sumk�.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//Gdzie znajduj� si� te kielichy?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//Nale�� do bogatych kupc�w w g�rnym mie�cie.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//Przynie� mi je. Ja tymczasem postaram si� znale�� na nie kupca.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//Co za to dostan�?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//Po�ow� zysku albo b�dziesz m�g� wybra� z mojego �upu jaki� specjalny przedmiot.
		MIS_CASSIAKELCHE = LOG_RUNNING;
		Log_CreateTopic(TOPIC_CASSIAKELCHE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIAKELCHE,LOG_RUNNING);
		b_logentry(TOPIC_CASSIAKELCHE,"Cassia chce, abym przyni�s� jej sze�� Krwawych Kielich�w. Wszystkie znajduj� si� w mie�cie.");
	};
};


instance DIA_CASSIA_ABGEBEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgeben_condition;
	information = dia_cassia_abgeben_info;
	permanent = TRUE;
	description = "Je�li chodzi o te Krwawe Kielichy...";
};


func int dia_cassia_abgeben_condition()
{
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cassia_abgeben_info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//Je�eli chodzi o te Krwawe Kielichy...
	if(b_giveinvitems(other,self,itmi_bloodcup_mis,6))
	{
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//Mam wszystkie sze�� kielich�w.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//Dobra robota. W mi�dzyczasie uda�o mi si� znale�� na nie kupca.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//Mo�esz odebra� swoj� nagrod�. Dzi�kuj�, �e to dla mnie zrobi�e�.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_04");	//Nie musz� dla ciebie robi� nic wi�cej - ale w ka�dej chwili mo�esz przyj�� do mnie na nauk�. A poza tym na tej wyspie jest do�� �up�w dla ka�dego.
		MIS_CASSIAKELCHE = LOG_SUCCESS;
		b_giveplayerxp(XP_CASSIABLUTKELCHE);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//Mog� sprzeda� te kielichy w komplecie. Przynie� mi wszystkie sze��.
	};
};


instance DIA_CASSIA_BELOHNUNG(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_belohnung_condition;
	information = dia_cassia_belohnung_info;
	permanent = FALSE;
	description = "Przyszed�em odebra� swoj� nagrod�.";
};


func int dia_cassia_belohnung_condition()
{
	if(MIS_CASSIAKELCHE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_cassia_belohnung_info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//Przyszed�em odebra� swoj� nagrod�.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//Co wybierasz?
	Info_ClearChoices(dia_cassia_belohnung);
	Info_AddChoice(dia_cassia_belohnung,"400 sztuk z�ota.",dia_cassia_belohnung_gold);
	Info_AddChoice(dia_cassia_belohnung,"4 eliksiry lecznicze",dia_cassia_belohnung_trank);
	Info_AddChoice(dia_cassia_belohnung,NAME_ADDON_CASSIASBELOHNUNGSRING,dia_cassia_belohnung_ring);
};

func void dia_cassia_belohnung_gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//Daj mi z�oto.
	b_giveinvitems(self,other,itmi_gold,400);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//Daj mi mikstury.
	b_giveinvitems(self,other,itpo_health_03,4);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//Daj mi pier�cie�.
	b_giveinvitems(self,other,itri_hp_01,1);
	Info_ClearChoices(dia_cassia_belohnung);
};

