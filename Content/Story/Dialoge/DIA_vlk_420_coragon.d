
instance DIA_CORAGON_EXIT(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 999;
	condition = dia_coragon_exit_condition;
	information = dia_coragon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_coragon_exit_condition()
{
	return TRUE;
};

func void dia_coragon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORAGON_PICKPOCKET(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 900;
	condition = dia_coragon_pickpocket_condition;
	information = dia_coragon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_coragon_pickpocket_condition()
{
	return c_beklauen(40,45);
};

func void dia_coragon_pickpocket_info()
{
	Info_ClearChoices(dia_coragon_pickpocket);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_BACK,dia_coragon_pickpocket_back);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_PICKPOCKET,dia_coragon_pickpocket_doit);
};

func void dia_coragon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_coragon_pickpocket);
};

func void dia_coragon_pickpocket_back()
{
	Info_ClearChoices(dia_coragon_pickpocket);
};


instance DIA_CORAGON_HALLO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_hallo_condition;
	information = dia_coragon_hallo_info;
	permanent = FALSE;
	description = "Czy mog� kupi� co� do picia?";
};


func int dia_coragon_hallo_condition()
{
	return TRUE;
};

func void dia_coragon_hallo_info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Czy mog� kupi� co� do picia?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_00");	//Mo�esz si� tu naje�� - o ile ci� na to sta�.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Jedzenie i napoje mog� kupi� u w�a�ciciela gospody, Coragona.");
};


instance DIA_CORAGON_TRADE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_trade_condition;
	information = dia_coragon_trade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int dia_coragon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Poka� mi swoje towary.
};


instance DIA_CORAGON_WHATSUP(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 3;
	condition = dia_coragon_whatsup_condition;
	information = dia_coragon_whatsup_info;
	permanent = FALSE;
	description = "Jak id� interesy?";
};


func int dia_coragon_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_whatsup_info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Jak id� interesy?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_01");	//Taa... Lord Andre rozdaje piwo za darmo na placu wisielc�w.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_02");	//Z tego powodu zachodz� do mnie ostatnio tylko bogacze z g�rnego miasta...
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//Co� z nimi nie tak?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_04");	//Niekt�rzy z nich naprawd� mog� ci� zdenerwowa�...
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_05");	//Taki na przyk�ad Valentino - nie mog� znie�� faceta.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_06");	//Ale niestety nie mog� sobie wybiera� klient�w - potrzeba mi ka�dego szel�ga.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_07");	//Ukradziono mi ca�e oszcz�dno�ci, nawet moje srebro.
};


instance DIA_ADDON_CORAGON_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_addon_coragon_missingpeople_condition;
	information = dia_addon_coragon_missingpeople_info;
	description = "Wiesz mo�e co� o zaginionych mieszka�cach miasta?";
};


func int dia_addon_coragon_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_coragon_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Coragon_MissingPeople_15_00");	//Wiesz mo�e co� o zaginionych mieszka�cach miasta?
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_01");	//Podobno to w wi�kszo�ci mieszka�cy portu. Ma�o mnie to dziwi, bior�c pod uwag� reputacj� tego miejsca...
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_02");	//Nawet stolarz Thorben wspomina�, �e zagin�� jego czeladnik.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_03");	//Jeden z kupc�w - go�� imieniem Hakon - opowiedzia� mi ostatnio dziwn� histori�.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_04");	//Wspomnia�, �e by� taki facet, kt�rego widywa� codziennie... A� nagle przesta� go widywa�. Pyta� si� nawet o to cz�onk�w stra�y.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_05");	//Wi�kszo�� mieszka�c�w miasta zacz�a panikowa�. Nie wiem, co o tym wszystkim s�dzi�, ale to chyba jaka� bzdura.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_06");	//Khorinis to niebezpieczne miejsce, a i za jego bramami czyha na cz�owieka wiele zagro�e�.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_07");	//Grasuj� tam dzikie bestie i bandyci. To proste...
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Hakon, kupiec z targowiska, i stolarz Thorben podobno wiedz� co� na temat zaginionych ludzi.");
};


instance DIA_CORAGON_BESTOHLEN(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 4;
	condition = dia_coragon_bestohlen_condition;
	information = dia_coragon_bestohlen_info;
	permanent = FALSE;
	description = "Obrabowano ci�?";
};


func int dia_coragon_bestohlen_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_bestohlen_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Obrabowano ci�?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_09");	//To by�o ju� jaki� czas temu - w gospodzie by�o pe�no ludzi, a i ja nie�le wtedy popi�em.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_10");	//Nie by�o mnie za szynkwasem tylko przez chwil�, ale tym �obuzom to wystarczy�o.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_11");	//Donios�em o wszystkim stra�y, ale oni oczywi�cie nic nie znale�li. Wypili za to du�o darmowego piwa 'na potrzeby �ledztwa'.
	MIS_CORAGON_SILBER = LOG_RUNNING;
};


var int coragon_bier;

func void b_coragon_bier()
{
	CORAGON_BIER = CORAGON_BIER + 1;
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_14");	//Oto nagroda.
	b_giveinvitems(self,other,itfo_coragonsbeer,1);
	if(CORAGON_BIER < 2)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_21");	//To wyj�tkowe piwo - ostatnia beczka, kt�r� dysponuj�.
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_22");	//To ostatni �yk!
	};
};


instance DIA_CORAGON_BRINGSILBER(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_coragon_bringsilber_condition;
	information = dia_coragon_bringsilber_info;
	permanent = FALSE;
	description = "Mam twoje srebra.";
};


func int dia_coragon_bringsilber_condition()
{
	if((MIS_CORAGON_SILBER == LOG_RUNNING) && (Npc_HasItems(other,itmi_coragonssilber) >= 8))
	{
		return TRUE;
	};
};

func void dia_coragon_bringsilber_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//Mam twoje srebra.
	if(b_giveinvitems(other,self,itmi_coragonssilber,8))
	{
		Npc_RemoveInvItems(self,itmi_coragonssilber,8);
	};
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//Niemo�liwe!
	b_giveplayerxp(XP_CORAGONSSILBER);
	b_coragon_bier();
	MIS_CORAGON_SILBER = LOG_SUCCESS;
};


instance DIA_CORAGON_SCHULDENBUCH(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 6;
	condition = dia_coragon_schuldenbuch_condition;
	information = dia_coragon_schuldenbuch_info;
	permanent = FALSE;
	description = "Popatrz, co tutaj mam.";
};


func int dia_coragon_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//Popatrz, co tutaj mam.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_16");	//Hmm... To spis d�u�nik�w Lehmara!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_17");	//Co masz zamiar z nim zrobi�?
};


instance DIA_CORAGON_GIVEBOOK(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 7;
	condition = dia_coragon_givebook_condition;
	information = dia_coragon_givebook_info;
	permanent = FALSE;
	description = "Oto twoja ksi�ga.";
};


func int dia_coragon_givebook_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_givebook_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Oto twoja ksi�ga.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_19");	//Dzi�ki! Ratujesz mi �ycie - Lehmar bywa niebezpieczny, gdy w gr� wchodz� jego pieni�dze.
	b_giveplayerxp(XP_SCHULDENBUCH);
	b_coragon_bier();
};


instance DIA_CORAGON_TOOV(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 9;
	condition = dia_coragon_toov_condition;
	information = dia_coragon_toov_info;
	permanent = FALSE;
	description = "W jaki spos�b mog� si� dosta� do g�rnego miasta?";
};


func int dia_coragon_toov_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup) && (other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_coragon_toov_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//W jaki spos�b mog� si� dosta� do g�rnego miasta?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_24");	//Musisz zosta� obywatelem tego miasta. Znajd� jak�� prac�.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_25");	//Popytaj mo�e robotnik�w w dolnym mie�cie.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_26");	//Je�li to nic nie da, mo�esz r�wnie� skontaktowa� si� z Lordem Andre - znajdziesz go w koszarach.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_27");	//By� mo�e pozwoli ci do��czy� do stra�y - jej cz�onkowie r�wnie� maj� wst�p do g�rnego miasta.
};


instance DIA_CORAGON_VALENTINO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 8;
	condition = dia_coragon_valentino_condition;
	information = dia_coragon_valentino_info;
	permanent = FALSE;
	description = "O co chodzi z tym Valentinem?";
};


func int dia_coragon_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_valentino_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//O co chodzi z tym Valentinem?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_29");	//Ma z�ota jak lodu i nie musi nic robi�. Co wi�cej, chwali si� tym na prawo i na lewo.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_30");	//Niezale�nie od tego, czy kto� chce go s�ucha�...
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_31");	//Sporo pije i zwykle siedzi a� do zamkni�cia, po czym wytacza si� nad ranem na ulice g�rnego miasta.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_32");	//I tak dzie� w dzie�...
};


instance DIA_CORAGON_NEWS(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 1;
	condition = dia_coragon_news_condition;
	information = dia_coragon_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_coragon_news_condition()
{
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		if(REGIS_RING == TRUE)
		{
			return TRUE;
		};
	};
};

func void dia_coragon_news_info()
{
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_33");	//Valentino nie by� w stanie uregulowa� wczorajszego rachunku.
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_34");	//Be�kota� co� o tym, �e go okradziono i �e zap�aci p�niej. Co za tupet!
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_35");	//Wcze�niej si� puszy�, ile to kasy on nie ma...
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_36");	//A nagle wk�ada r�k� do kieszeni, a jego twarz przybiera jeszcze g�upszy wyraz ni� zwykle. Za chwil� gada, �e go okradziono.
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//No... I co zrobi�e�?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_38");	//Porachowa�em mu ko�ci.
};


instance DIA_CORAGON_RING(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 10;
	condition = dia_coragon_ring_condition;
	information = dia_coragon_ring_info;
	permanent = FALSE;
	description = "Prosz� - przyjmij ten pier�cie�.";
};


func int dia_coragon_ring_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_news) && (Npc_HasItems(other,itri_valentinosring) > 0))
	{
		return TRUE;
	};
};

func void dia_coragon_ring_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Prosz� - przyjmij ten pier�cie�.
	b_giveinvitems(other,self,itri_valentinosring,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_40");	//Co? Nie rozumiem...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Nale�a� do Valentina.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//Zawsze mo�esz ofiarowa� ten pier�cie� komu�, kto zdo�a go schwyta�...
	b_giveplayerxp(300);
	AI_StopProcessInfos(self);
};

