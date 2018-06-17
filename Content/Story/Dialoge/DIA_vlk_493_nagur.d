
instance DIA_NAGUR_EXIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 999;
	condition = dia_nagur_exit_condition;
	information = dia_nagur_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nagur_exit_condition()
{
	return TRUE;
};

func void dia_nagur_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PICKPOCKET(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 900;
	condition = dia_nagur_pickpocket_condition;
	information = dia_nagur_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_nagur_pickpocket_condition()
{
	return c_beklauen(75,150);
};

func void dia_nagur_pickpocket_info()
{
	Info_ClearChoices(dia_nagur_pickpocket);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_BACK,dia_nagur_pickpocket_back);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_PICKPOCKET,dia_nagur_pickpocket_doit);
};

func void dia_nagur_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nagur_pickpocket);
};

func void dia_nagur_pickpocket_back()
{
	Info_ClearChoices(dia_nagur_pickpocket);
};


instance DIA_NAGUR_HALLO(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 2;
	condition = dia_nagur_hallo_condition;
	information = dia_nagur_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_hallo_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_00");	//Hej, nie mam czasu na pogaw�dki. Je�li szukasz informacji, porozmawiaj z Kardifem.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_01");	//Cz�owieku, zostaw mnie w spokoju, rozumiesz?!
		AI_StopProcessInfos(self);
	};
};


var int nagurhack;

func void b_nagur_abfertigen()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(heroarmor,itar_mil_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_mil_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_h) == FALSE) && (Hlp_IsItem(heroarmor,itar_nov_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_h) == FALSE))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_02");	//I nie my�l, �e ci� nie poznam tylko dlatego, �e za�o�y�e� inne szaty.
	};
	AI_Output(self,other,"DIA_Nagur_Add_08_03");	//Radz� ci jak przyjaciel, nie wtykaj nosa w cudze sprawy!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//Spadaj!
	MIS_NAGUR_BOTE = LOG_SUCCESS;
	NAGURHACK = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_JOB(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 3;
	condition = dia_nagur_job_condition;
	information = dia_nagur_job_info;
	permanent = FALSE;
	description = "Kardif powiedzia�, �e masz dla mnie prac�.";
};


func int dia_nagur_job_condition()
{
	if(DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_nagur_job_info()
{
	AI_Output(other,self,"DIA_Nagur_Job_15_00");	//Kardif powiedzia�, �e masz dla mnie prac�.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_00");	//NIE MA w porcie pracy dla ludzi z klasztoru!
		b_nagur_abfertigen();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_01");	//Je�li nale�ysz do ludzi Kr�la, to raczej nie licz na jak�kolwiek prac� w porcie.
		b_nagur_abfertigen();
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Job_08_01");	//Prosz�, prosz�... C�, powiadasz, �e szukasz jakiego� specjalnego zaj�cia? W porz�dku, ale pami�taj - ja tu rz�dz�.
		AI_Output(other,self,"DIA_Nagur_Job_15_02");	//Co masz na my�li?
		AI_Output(self,other,"DIA_Nagur_Job_08_03");	//Ano to, �e s�uchasz tylko mnie. Pr�cz tego przys�uguje ci jedna trzecia zysku.
		AI_Output(self,other,"DIA_Nagur_Job_08_04");	//Je�li takie warunki ci nie odpowiadaj�, poszukaj sobie innej pracy.
		Info_ClearChoices(dia_nagur_job);
		Info_AddChoice(dia_nagur_job,"Jeste�my partnerami. Dzielimy si� po po�owie.",dia_nagur_job_halbe);
		Info_AddChoice(dia_nagur_job,"W porz�dku, ty tu jeste� szefem.",dia_nagur_job_klar);
	};
};

func void dia_nagur_job_klar()
{
	AI_Output(other,self,"DIA_Nagur_Job_Klar_15_00");	//W porz�dku, ty tu jeste� szefem.
	AI_Output(self,other,"DIA_Nagur_Job_Klar_08_01");	//Wszystko jasne. W takim razie przygotuj si� na �atw� kas�.
	NAGUR_DEAL = 80;
	Info_ClearChoices(dia_nagur_job);
};

func void dia_nagur_job_halbe()
{
	AI_Output(other,self,"DIA_Nagur_Job_Halbe_15_00");	//Jeste�my partnerami. Dzielimy si� po po�owie.
	AI_Output(self,other,"DIA_Nagur_Job_Halbe_08_01");	//No dobra ju�, dobra. Tylko ci� sprawdza�em. Oczywi�cie, �e podzielimy si� zyskami sprawiedliwie.
	NAGUR_DEAL = 120;
	Info_ClearChoices(dia_nagur_job);
};


instance DIA_NAGUR_AUFTRAG(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 4;
	condition = dia_nagur_auftrag_condition;
	information = dia_nagur_auftrag_info;
	permanent = FALSE;
	description = "Dobra, wi�c jaki masz plan?";
};


func int dia_nagur_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_job) && (MIS_NAGUR_BOTE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_nagur_auftrag_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_15_00");	//Dobra, wi�c jaki masz plan?
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_01");	//Znasz chyba kupca Baltrama? Je�li nie, to najwy�szy czas by� go pozna� i porozmawia� z nim.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_02");	//Baltram zatrudnia pos�a�ca, kt�ry dostarcza mu towary z farmy Akila.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_03");	//W�a�ciwie to ZATRUDNIA� pos�a�ca, p�ki nie poder�n��em mu gard�a. Obecnie Baltram poszukuje kogo� na to miejsce i tu zaczyna si� twoje zadanie.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_04");	//Zatrudnisz si� u Baltrama, a przesy�k� od Akila przyniesiesz do mnie.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_05");	//Ja za� sprzedam j� temu, kto zdecyduje si� zap�aci� najwi�cej.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_06");	//I niech ci nie przyjdzie do g�owy sprzeda� przesy�k� gdzie� po drodze do mnie. Kapujesz?
	Info_ClearChoices(dia_nagur_auftrag);
	Info_AddChoice(dia_nagur_auftrag,"Ja jestem gotowy (KONIEC)",dia_nagur_auftrag_okay);
	Info_AddChoice(dia_nagur_auftrag,"Gdzie znajd� Baltrama?",dia_nagur_auftrag_baltram);
	Info_AddChoice(dia_nagur_auftrag,"Kiedy mam si� spotka� z Baltramem?",dia_nagur_auftrag_wann);
	Info_AddChoice(dia_nagur_auftrag,"Jak doj�� do farmy Akila?",dia_nagur_auftrag_akil);
	Info_AddChoice(dia_nagur_auftrag,"A co ja b�d� z tego mia�?",dia_nagur_auftrag_gewinn);
};

func void dia_nagur_auftrag_akil()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Akil_15_00");	//Jak doj�� do farmy Akila?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_01");	//Wyjd� z placu targowego przez wschodni� bram�.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_02");	//Je�li pod��ysz �cie�k� w prawo, wkr�tce dojdziesz do kilku wykutych w skale stopni.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_03");	//Wejd� na g�r�, a znajdziesz si� na farmie Akila.
};

func void dia_nagur_auftrag_gewinn()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Gewinn_15_00");	//A co ja b�d� z tego mia�?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Gewinn_08_01");	//Hmmm, dok�adnie ci teraz nie powiem. My�l� jednak, �e mo�esz liczy� na 400 sztuk z�ota.
};

func void dia_nagur_auftrag_baltram()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Baltram_15_00");	//Gdzie znajd� Baltrama?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Baltram_08_01");	//Jego kram znajduje si� na placu targowym.
};

func void dia_nagur_auftrag_wann()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Wann_15_00");	//Kiedy mam si� spotka� z Baltramem?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01");	//W ka�dej chwili. Chyba ju� si� domy�li�, �e jego poprzedni pos�aniec nie wr�ci.
};

func void dia_nagur_auftrag_okay()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Okay_15_00");	//W porz�dku, zgadzam si�.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01");	//Doskonale, w takim razie ruszaj w drog�. Pami�taj jednak, �e nieuczciwy pos�aniec to martwy pos�aniec, je�li wiesz, co mam na my�li!
	MIS_NAGUR_BOTE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NAGUR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NAGUR,LOG_RUNNING);
	b_logentry(TOPIC_NAGUR,"Kiedy Baltram zatrudni mnie jako ch�opca na posy�ki, odbior� dostaw� od farmera Akila i przeka�� j� Nagurowi.");
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SUCCESS(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 5;
	condition = dia_nagur_success_condition;
	information = dia_nagur_success_info;
	permanent = FALSE;
	description = "Przynios�em przesy�k�.";
};


func int dia_nagur_success_condition()
{
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (Npc_HasItems(other,itmi_baltrampaket) >= 1) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_success_info()
{
	AI_Output(other,self,"DIA_Nagur_Success_15_00");	//Przynios�em przesy�k�.
	AI_Output(self,other,"DIA_Nagur_Success_08_01");	//Doskonale, postaram si� wszystko sprzeda�. Wr�� do mnie jutro.
	b_logentry(TOPIC_NAGUR,"Nagur odebra� dostaw�. Jutro wyp�aci mi moje z�oto.");
	AI_StopProcessInfos(self);
	if(b_giveinvitems(other,self,itmi_baltrampaket,1))
	{
		Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	};
	NAGURDAY = b_getdayplus();
};


instance DIA_NAGUR_DEAL(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 6;
	condition = dia_nagur_deal_condition;
	information = dia_nagur_deal_info;
	permanent = TRUE;
	description = "I co, sprzeda�e� ju� ca�y towar?";
};


var int dia_nagur_deal_permanent;

func int dia_nagur_deal_condition()
{
	if((DIA_NAGUR_DEAL_PERMANENT == FALSE) && (MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE) && Npc_KnowsInfo(other,dia_nagur_success))
	{
		return TRUE;
	};
};

func void dia_nagur_deal_info()
{
	AI_Output(other,self,"DIA_Nagur_Deal_15_00");	//I co, sprzeda�e� ju� ca�y towar?
	if(b_getdayplus() > NAGURDAY)
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_01");	//Tak, ale za mniej, ni� si� spodziewa�em. Za wszystko dosta�em jedynie 300 sztuk z�ota.
		AI_Output(self,other,"DIA_Nagur_Deal_08_02");	//A jeszcze cz�� z tego musia�em odda� prze�o�onym.
		AI_Output(self,other,"DIA_Nagur_Deal_08_03");	//Do tego jeszcze zwyczajowa premia dla Kardifa i op�ata za twoje zlecenie.
		AI_Output(self,other,"DIA_Nagur_Deal_08_04");	//W sumie dla mnie pozostaje 240 sztuk z�ota. Dzielimy si� wi�c wedle umowy, oto twoja cz��.
		AI_Output(self,other,"DIA_Nagur_Deal_08_05");	//Wykona�e� kawa� dobrej roboty, moi zwierzchnicy ju� o tym wiedz�.
		AI_Output(self,other,"DIA_Nagur_Deal_08_06");	//Co b�dzie dalej... To ju� nie zale�y ode mnie.
		b_giveinvitems(self,other,itmi_gold,NAGUR_DEAL);
		MIS_NAGUR_BOTE = LOG_SUCCESS;
		MIS_BALTRAM_SCOUTAKIL = LOG_FAILED;
		b_giveplayerxp(XP_NAGUR_BOTE);
		DIA_NAGUR_DEAL_PERMANENT = TRUE;
		DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_07");	//Nie, jeszcze nie. W handlu nie szybko�� jest najwa�niejsza a osi�gni�ta cena.
	};
};


instance DIA_NAGUR_AUFTRAGGEBER(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_auftraggeber_condition;
	information = dia_nagur_auftraggeber_info;
	permanent = FALSE;
	description = "Kto jest twoim pracodawc�?";
};


func int dia_nagur_auftraggeber_condition()
{
	if(MIS_NAGUR_BOTE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_nagur_auftraggeber_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftraggeber_15_00");	//Kto jest twoim pracodawc�?
	AI_Output(self,other,"DIA_Nagur_Auftraggeber_08_01");	//Chyba nie s�dzisz, �e odpowiem na to pytanie, hm?
};


instance DIA_NAGUR_FAZIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_fazit_condition;
	information = dia_nagur_fazit_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_fazit_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_auftraggeber) && Npc_IsInState(self,zs_talk) && (KNOWS_SECRETSIGN == FALSE) && (NAGURHACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_fazit_info()
{
	AI_Output(self,other,"DIA_Nagur_Fazit_08_00");	//Wszystko w porz�dku, nic nie powiem moim prze�o�onym. Mo�esz by� spokojny.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_KNAST(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_knast_condition;
	information = dia_nagur_knast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_knast_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000) && (NAGUR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_knast_info()
{
	AI_Output(self,other,"DIA_Nagur_Knast_08_00");	//Zdradzi�e� mnie! To by� wielki b��d - spieprzaj!
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SIGN(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_sign_condition;
	information = dia_nagur_sign_info;
	permanent = FALSE;
	description = "(Poka� z�odziejski gest)";
};


func int dia_nagur_sign_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && (KNOWS_SECRETSIGN == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Nagur_Sign_08_00");	//Zrobi�e�, co mia�e� zrobi�. Wi�c musia�e� pozna� moich zwierzchnik�w.
	AI_Output(self,other,"DIA_Nagur_Sign_08_01");	//Pami�taj, s�uchaj tego, co m�wi ci Cassia - zreszt� nie obchodzi nas, kim jeste�. Liczy si� tylko to, �e przy��czy�e� si� do nas.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PERM(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_perm_condition;
	information = dia_nagur_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_perm_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_nagur_sign) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_nagur_perm_info()
{
	AI_Output(self,other,"DIA_Nagur_Perm_08_00");	//Poszukaj sobie kogo� innego. Naoko�o jest sporo ludzi. My nie mamy ju� o czym rozmawia�.
	AI_StopProcessInfos(self);
};

