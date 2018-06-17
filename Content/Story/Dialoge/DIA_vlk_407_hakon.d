
instance DIA_HAKON_EXIT(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 999;
	condition = dia_hakon_exit_condition;
	information = dia_hakon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hakon_exit_condition()
{
	return TRUE;
};

func void dia_hakon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_SPERRE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_sperre_condition;
	information = dia_hakon_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hakon_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hakon_sperre_info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//Uciekaj st�d, skaza�cu! Canthar powiedzia� mi, jaki z ciebie dra�!
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_HALLO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_hallo_condition;
	information = dia_hakon_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_hakon_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hakon_hallo_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//Jestem Hakon, handlarz broni�.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//W dzisiejszych czasach ka�dy powinien nosi� bro�. Szczeg�lnie poza miastem.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Hakon sprzedaje bro� na targowisku.");
};


instance DIA_HAKON_TRADE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 99;
	condition = dia_hakon_trade_condition;
	information = dia_hakon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka� mi swoje towary.";
};


func int dia_hakon_trade_condition()
{
	return TRUE;
};

func void dia_hakon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//Poka� mi swoje towary.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//To dla mnie zaszczyt, �e reprezentant naszego �wi�tego ko�cio�a okazuje zainteresowanie moimi towarami.
	};
};


instance DIA_ADDON_HAKON_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_addon_hakon_missingpeople_condition;
	information = dia_addon_hakon_missingpeople_info;
	description = "Co wiesz o zaginionych mieszka�cach Khorinis?";
};


func int dia_addon_hakon_missingpeople_condition()
{
	if(SC_HEAREDABOUTMISSINGPEOPLE == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_hakon_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Hakon_MissingPeople_15_00");	//Co wiesz o zaginionych mieszka�cach Khorinis?
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_01");	//Wielu z nich przechodzi przez wschodni� bram� miasta.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_02");	//Cz�ci z tych, kt�rzy przychodz�, nie widzia�em nigdy w �yciu... A wielu takich, kt�rzy wychodz�, nigdy ju� nie wraca.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_03");	//Tylko... Ostatnio wydarzy�o si� co� niezwyk�ego.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_04");	//By� taki go��... Chyba Joe mia� na imi�. Gada� na lewo i na prawo, jaki to wkr�tce b�dzie bogaty.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_05");	//Twierdzi�, �e zna spos�b na dostanie si� do wie�, w kt�rych stra� przechowuje bro�.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_06");	//Od tej pory przesta� si� pojawia� - nie zobaczy�em go ju� nigdy, cho� wcze�niej widywa�em go codziennie o tej samej porze.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_07");	//Pomy�la�em, �e mo�e aresztowa�a go stra� i ich o to zapyta�em.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_08");	//Lord Andre nie mia� poj�cia, o co mi chodzi - nigdy nawet nie s�ysza� o tym go�ciu.
	Log_CreateTopic(TOPIC_ADDON_JOE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_JOE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_JOE,"Hakon, kupiec z Khorinis, twierdzi, �e cz�owiek o imieniu Joe znikn�� bez �ladu. Podobno Joe wiedzia�, jak dosta� si� do wie� miejskich, w kt�rych przechowywana jest bro� stra�y.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_OUTOFTOWN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_outoftown_condition;
	information = dia_hakon_outoftown_info;
	permanent = FALSE;
	description = "Opowiedz mi o terenach wok� miasta.";
};


func int dia_hakon_outoftown_condition()
{
	return TRUE;
};

func void dia_hakon_outoftown_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//Opowiedz mi o terenach wok� miasta.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//Zrobi�o si� tam cholernie niebezpiecznie.
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//Po pierwsze - z powodu bandyt�w, po drugie - z powodu dzikich bestii.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//Nawet zwierz�ta g�oduj� w dzisiejszych czasach.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//Dlatego zapuszczaj� si� coraz bli�ej miasta.
};


instance DIA_HAKON_PALADINE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_paladine_condition;
	information = dia_hakon_paladine_info;
	permanent = FALSE;
	description = "Co wiesz na temat paladyn�w?";
};


func int dia_hakon_paladine_condition()
{
	return TRUE;
};

func void dia_hakon_paladine_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//Co wiesz na temat paladyn�w?
	AI_Output(self,other,"DIA_Hakon_Add_12_08");	//Ci go�cie doprowadzaj� mnie do ruiny!
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//W mie�cie mo�na kupi� co najwy�ej kr�tkie miecze.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//Wszystko, co jest d�u�sze ni� p� metra, zostaje przez nich skonfiskowane.
	AI_Output(self,other,"DIA_Hakon_Add_12_11");	//A w zamian mog� sobie za darmo pomieszka� w gospodzie - ha!
};


instance DIA_HAKON_WOWAFFEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_wowaffen_condition;
	information = dia_hakon_wowaffen_info;
	permanent = FALSE;
	description = "Sk�d bierzesz bro�?";
};


func int dia_hakon_wowaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_paladine))
	{
		return TRUE;
	};
};

func void dia_hakon_wowaffen_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//Sk�d bierzesz bro�?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//Znik�d! Do tej pory moim dostawc� by� Harad.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//Do tej pory kupowa�em bro� od kowala Harada.
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_15");	//Jednak teraz Harad produkuje miecze tylko i wy��cznie na u�ytek paladyn�w.
	AI_Output(self,other,"DIA_Hakon_Add_12_16");	//Pracuje dla nich jak szalony dzie� i noc, i to za darmo. Uwa�a to za sw�j obowi�zek.
	AI_Output(self,other,"DIA_Hakon_Add_12_17");	//Dlatego mog� ci zaoferowa� jedynie resztki moich towar�w...
};


instance DIA_HAKON_HARADBANDITS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_haradbandits_condition;
	information = dia_hakon_haradbandits_info;
	permanent = FALSE;
	description = "Harad powiedzia� mi o ataku bandyt�w...";
};


func int dia_hakon_haradbandits_condition()
{
	if(HARAD_HAKONMISSION == TRUE)
	{
		return TRUE;
	};
};

func void dia_hakon_haradbandits_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//Harad powiedzia� mi o ataku bandyt�w...
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//Doprawdy?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//Obieca� udzieli� mi poparcia, je�li zrobi� z nimi porz�dek.
	AI_Output(self,other,"DIA_Hakon_Add_12_21");	//Poczciwy stary Harad. Pewnie w ten spos�b daje do zrozumienia, jak mu przykro, �e nie mo�e mi sprzeda� �adnej broni.
};


instance DIA_HAKON_BANDITEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_banditen_condition;
	information = dia_hakon_banditen_info;
	permanent = FALSE;
	description = "Co wiesz na temat bandyt�w?";
};


func int dia_hakon_banditen_condition()
{
	if(Npc_KnowsInfo(hero,dia_hakon_haradbandits) || Npc_KnowsInfo(hero,dia_hakon_outoftown))
	{
		return TRUE;
	};
};

func void dia_hakon_banditen_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//Co wiesz na temat bandyt�w?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//Co wiem na temat bandyt�w? Obrabowali mnie w drodze do miasta!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//I nie tylko mnie. Kr��� po okolicy ju� od jakiego� czasu.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//Stra� pr�bowa�a ich znale��, ale nic z tego.
	MIS_HAKONBANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HAKONBANDITEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HAKONBANDITEN,LOG_RUNNING);
	b_logentry(TOPIC_HAKONBANDITEN,"Handlarz broni�, Hakon, zosta� obrabowany poza murami miasta przez bandyt�w.");
};


instance DIA_HAKON_WIEVIEL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_wieviel_condition;
	information = dia_hakon_wieviel_info;
	permanent = FALSE;
	description = "Zajm� si� tym...";
};


func int dia_hakon_wieviel_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wieviel_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//Zajm� si� tym...
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//Co, TY si� nimi zajmiesz? Zupe�nie sam? Chyba musisz by� niez�ym wojownikiem, co?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//Ile mi za to zap�acisz?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//Chcesz si� wkupi� w �aski Harada, co?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//Nie s�dz�, abym musia� ci za to p�aci�...
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//To niebezpieczne zadanie.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//No dobrze. Je�li pokonasz bandyt�w, dostaniesz ode mnie 100 sztuk z�ota.
		MIS_HAKONBANDITSPAY = TRUE;
	};
	Info_ClearChoices(dia_hakon_banditen);
};


instance DIA_HAKON_MILIZ(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_miliz_condition;
	information = dia_hakon_miliz_info;
	permanent = FALSE;
	description = "Czy wiesz, kto ze stra�y bra� udzia� w poszukiwaniach?";
};


func int dia_hakon_miliz_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_miliz_info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//Czy wiesz, kto ze stra�y bra� udzia� w poszukiwaniach?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//Nazywa si� Pablo. On i jeszcze par� os�b pr�bowali odnale�� kryj�wk� bandyt�w. Na pr�no.
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//Czy wiesz, gdzie przebywa Pablo?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//Patroluje miasto. Znajdziesz go albo na placu �wi�tynnym, albo w dolnej cz�ci miasta.
	b_logentry(TOPIC_HAKONBANDITEN,"Pablo, cz�onek stra�y miejskiej, bra� udzia� w bezowocnych poszukiwaniach bandyt�w.");
};


instance DIA_HAKON_WO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_wo_condition;
	information = dia_hakon_wo_info;
	permanent = FALSE;
	description = "Gdzie ci� napadli?";
};


func int dia_hakon_wo_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wo_info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//Gdzie ci� napadli?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//W pobli�u farmy Akila. Id� do bramy miasta i udaj si� drog� w prawo.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//Po jakim� czasie dojdziesz do schod�w. To stamt�d nadeszli ci dranie. Za�o�� si�, �e maj� kryj�wk� w lesie.
};


instance DIA_HAKON_SUCCESS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_success_condition;
	information = dia_hakon_success_info;
	permanent = FALSE;
	description = "Zaj��em si� bandytami.";
};


func int dia_hakon_success_condition()
{
	if((MIS_HAKONBANDITS == LOG_RUNNING) && Npc_IsDead(bandit_1) && Npc_IsDead(bandit_2) && Npc_IsDead(bandit_3))
	{
		return TRUE;
	};
};

func void dia_hakon_success_info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//Zaj��em si� bandytami.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//Doprawdy? Ka�dy mo�e tak powiedzie�. Masz na to jaki� dow�d?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//Czy mam tam wr�ci� i obci�� im g�owy?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//Nie - to chyba nie b�dzie konieczne. Wierz� ci.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//Odda�e� miastu i kupcom ogromn� przys�ug�.
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//S�dz�, �e Harada ucieszy ta wiadomo��.
	};
	if(MIS_HAKONBANDITSPAY == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//Oto obiecane pieni�dze.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	MIS_HAKONBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_HAKON_BANDITS);
};


instance DIA_HAKON_MINENANTEIL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_minenanteil_condition;
	information = dia_hakon_minenanteil_info;
	permanent = FALSE;
	description = "Sprzedajesz udzia�y w kopalni? Sk�d je wzi��e�?";
};


func int dia_hakon_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_hakon_minenanteil_info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//Sprzedajesz udzia�y w kopalni? Sk�d je wzi��e�?
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//Przykro mi, nie mog� ci powiedzie�. Mog�oby si� to dla mnie �le sko�czy�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_PICKPOCKET(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 900;
	condition = dia_hakon_pickpocket_condition;
	information = dia_hakon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_hakon_pickpocket_condition()
{
	return c_beklauen(45,65);
};

func void dia_hakon_pickpocket_info()
{
	Info_ClearChoices(dia_hakon_pickpocket);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_BACK,dia_hakon_pickpocket_back);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_PICKPOCKET,dia_hakon_pickpocket_doit);
};

func void dia_hakon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hakon_pickpocket);
};

func void dia_hakon_pickpocket_back()
{
	Info_ClearChoices(dia_hakon_pickpocket);
};


instance DIA_HAKON_KAPITEL2(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_kapitel2_condition;
	information = dia_hakon_kapitel2_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hakon_kapitel2_condition()
{
	if((KAPITEL >= 2) && (CANTHAR_SPERRE == FALSE) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_kapitel2_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//To znowu ty!
	AI_Output(self,other,"DIA_Hakon_Add_12_23");	//Harad wreszcie sko�czy� produkowa� bro� dla paladyn�w.
	AI_Output(self,other,"DIA_Hakon_Add_12_24");	//W zwi�zku z tym m�j wyb�r towar�w znacznie si� powi�kszy�. Zainteresowany?
};

