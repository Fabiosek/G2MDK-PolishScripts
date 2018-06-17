
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
	description = "Czy mogê kupiæ coœ do picia?";
};


func int dia_coragon_hallo_condition()
{
	return TRUE;
};

func void dia_coragon_hallo_info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Czy mogê kupiæ coœ do picia?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_00");	//Mo¿esz siê tu najeœæ - o ile ciê na to staæ.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Jedzenie i napoje mogê kupiæ u w³aœciciela gospody, Coragona.");
};


instance DIA_CORAGON_TRADE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_trade_condition;
	information = dia_coragon_trade_info;
	permanent = TRUE;
	description = "Poka¿ mi swoje towary.";
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
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Poka¿ mi swoje towary.
};


instance DIA_CORAGON_WHATSUP(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 3;
	condition = dia_coragon_whatsup_condition;
	information = dia_coragon_whatsup_info;
	permanent = FALSE;
	description = "Jak id¹ interesy?";
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
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Jak id¹ interesy?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_01");	//Taa... Lord Andre rozdaje piwo za darmo na placu wisielców.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_02");	//Z tego powodu zachodz¹ do mnie ostatnio tylko bogacze z górnego miasta...
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//Coœ z nimi nie tak?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_04");	//Niektórzy z nich naprawdê mog¹ ciê zdenerwowaæ...
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_05");	//Taki na przyk³ad Valentino - nie mogê znieœæ faceta.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_06");	//Ale niestety nie mogê sobie wybieraæ klientów - potrzeba mi ka¿dego szel¹ga.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_07");	//Ukradziono mi ca³e oszczêdnoœci, nawet moje srebro.
};


instance DIA_ADDON_CORAGON_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_addon_coragon_missingpeople_condition;
	information = dia_addon_coragon_missingpeople_info;
	description = "Wiesz mo¿e coœ o zaginionych mieszkañcach miasta?";
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
	AI_Output(other,self,"DIA_Addon_Coragon_MissingPeople_15_00");	//Wiesz mo¿e coœ o zaginionych mieszkañcach miasta?
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_01");	//Podobno to w wiêkszoœci mieszkañcy portu. Ma³o mnie to dziwi, bior¹c pod uwagê reputacjê tego miejsca...
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_02");	//Nawet stolarz Thorben wspomina³, ¿e zagin¹³ jego czeladnik.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_03");	//Jeden z kupców - goœæ imieniem Hakon - opowiedzia³ mi ostatnio dziwn¹ historiê.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_04");	//Wspomnia³, ¿e by³ taki facet, którego widywa³ codziennie... A¿ nagle przesta³ go widywaæ. Pyta³ siê nawet o to cz³onków stra¿y.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_05");	//Wiêkszoœæ mieszkañców miasta zaczê³a panikowaæ. Nie wiem, co o tym wszystkim s¹dziæ, ale to chyba jakaœ bzdura.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_06");	//Khorinis to niebezpieczne miejsce, a i za jego bramami czyha na cz³owieka wiele zagro¿eñ.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_07");	//Grasuj¹ tam dzikie bestie i bandyci. To proste...
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Hakon, kupiec z targowiska, i stolarz Thorben podobno wiedz¹ coœ na temat zaginionych ludzi.");
};


instance DIA_CORAGON_BESTOHLEN(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 4;
	condition = dia_coragon_bestohlen_condition;
	information = dia_coragon_bestohlen_info;
	permanent = FALSE;
	description = "Obrabowano ciê?";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Obrabowano ciê?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_09");	//To by³o ju¿ jakiœ czas temu - w gospodzie by³o pe³no ludzi, a i ja nieŸle wtedy popi³em.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_10");	//Nie by³o mnie za szynkwasem tylko przez chwilê, ale tym ³obuzom to wystarczy³o.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_11");	//Donios³em o wszystkim stra¿y, ale oni oczywiœcie nic nie znaleŸli. Wypili za to du¿o darmowego piwa 'na potrzeby œledztwa'.
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
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_21");	//To wyj¹tkowe piwo - ostatnia beczka, któr¹ dysponujê.
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_22");	//To ostatni ³yk!
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
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//Niemo¿liwe!
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
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_16");	//Hmm... To spis d³u¿ników Lehmara!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_17");	//Co masz zamiar z nim zrobiæ?
};


instance DIA_CORAGON_GIVEBOOK(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 7;
	condition = dia_coragon_givebook_condition;
	information = dia_coragon_givebook_info;
	permanent = FALSE;
	description = "Oto twoja ksiêga.";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Oto twoja ksiêga.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_19");	//Dziêki! Ratujesz mi ¿ycie - Lehmar bywa niebezpieczny, gdy w grê wchodz¹ jego pieni¹dze.
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
	description = "W jaki sposób mogê siê dostaæ do górnego miasta?";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//W jaki sposób mogê siê dostaæ do górnego miasta?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_24");	//Musisz zostaæ obywatelem tego miasta. ZnajdŸ jak¹œ pracê.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_25");	//Popytaj mo¿e robotników w dolnym mieœcie.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_26");	//Jeœli to nic nie da, mo¿esz równie¿ skontaktowaæ siê z Lordem Andre - znajdziesz go w koszarach.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_27");	//Byæ mo¿e pozwoli ci do³¹czyæ do stra¿y - jej cz³onkowie równie¿ maj¹ wstêp do górnego miasta.
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
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_29");	//Ma z³ota jak lodu i nie musi nic robiæ. Co wiêcej, chwali siê tym na prawo i na lewo.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_30");	//Niezale¿nie od tego, czy ktoœ chce go s³uchaæ...
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_31");	//Sporo pije i zwykle siedzi a¿ do zamkniêcia, po czym wytacza siê nad ranem na ulice górnego miasta.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_32");	//I tak dzieñ w dzieñ...
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
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_33");	//Valentino nie by³ w stanie uregulowaæ wczorajszego rachunku.
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_34");	//Be³kota³ coœ o tym, ¿e go okradziono i ¿e zap³aci póŸniej. Co za tupet!
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_35");	//Wczeœniej siê puszy³, ile to kasy on nie ma...
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_36");	//A nagle wk³ada rêkê do kieszeni, a jego twarz przybiera jeszcze g³upszy wyraz ni¿ zwykle. Za chwilê gada, ¿e go okradziono.
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//No... I co zrobi³eœ?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_38");	//Porachowa³em mu koœci.
};


instance DIA_CORAGON_RING(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 10;
	condition = dia_coragon_ring_condition;
	information = dia_coragon_ring_info;
	permanent = FALSE;
	description = "Proszê - przyjmij ten pierœcieñ.";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Proszê - przyjmij ten pierœcieñ.
	b_giveinvitems(other,self,itri_valentinosring,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_40");	//Co? Nie rozumiem...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Nale¿a³ do Valentina.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//Zawsze mo¿esz ofiarowaæ ten pierœcieñ komuœ, kto zdo³a go schwytaæ...
	b_giveplayerxp(300);
	AI_StopProcessInfos(self);
};

