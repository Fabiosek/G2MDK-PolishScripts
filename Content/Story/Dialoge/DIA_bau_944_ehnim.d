
instance DIA_EHNIM_EXIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 999;
	condition = dia_ehnim_exit_condition;
	information = dia_ehnim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ehnim_exit_condition()
{
	return TRUE;
};

func void dia_ehnim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_HALLO(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 3;
	condition = dia_ehnim_hallo_condition;
	information = dia_ehnim_hallo_info;
	description = "Kim jeste�?";
};


func int dia_ehnim_hallo_condition()
{
	return TRUE;
};

func void dia_ehnim_hallo_info()
{
	AI_Output(other,self,"DIA_Ehnim_HALLO_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_01");	//Nazywam si� Ehnim. Pracuj� na farmie.
	if(Hlp_IsValidNpc(egill) && !c_npcisdown(egill))
	{
		AI_Output(self,other,"DIA_Ehnim_HALLO_12_02");	//A ten p�g��wek, kt�rego tam widzisz, to m�j brat Egill.
	};
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_03");	//Akil od lat zatrudnia nas na tej farmie.
};


instance DIA_EHNIM_FELDARBEIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 4;
	condition = dia_ehnim_feldarbeit_condition;
	information = dia_ehnim_feldarbeit_info;
	description = "Jak id� prace w polu?";
};


func int dia_ehnim_feldarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_hallo))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldarbeit_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDARBEIT_15_00");	//Jak id� prace w polu?
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_01");	//Chcesz pom�c? Chwytaj motyk�, jest tam z ty�u, i ruszaj na pole.
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_02");	//Bacz tylko, �eby si� nie da� zaskoczy� polnym bestiom. Te potwory potrafi� odgry�� ca�e rami� jednym k�apni�ciem z�b�w.
};


instance DIA_EHNIM_FELDRAEUBER(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 5;
	condition = dia_ehnim_feldraeuber_condition;
	information = dia_ehnim_feldraeuber_info;
	description = "Czemu nic z nimi nie zrobicie?";
};


func int dia_ehnim_feldraeuber_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_feldarbeit))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldraeuber_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDRAEUBER_15_00");	//Czemu nie zrobicie porz�dku z tymi polnymi bestiami?
	AI_Output(self,other,"DIA_Ehnim_FELDRAEUBER_12_01");	//Zabi�em ich wi�cej, ni� potrafi� zliczy�. Ale ci�gle przy�a�� nowe.
};


instance DIA_EHNIM_STREIT1(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 6;
	condition = dia_ehnim_streit1_condition;
	information = dia_ehnim_streit1_info;
	description = "Tw�j brat powiedzia� mi dok�adnie to samo.";
};


func int dia_ehnim_streit1_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_feldraeuber) && Npc_KnowsInfo(other,dia_ehnim_feldraeuber) && (Npc_KnowsInfo(other,dia_egill_streit2) == FALSE) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit1_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT1_15_00");	//Tw�j brat powiedzia� mi dok�adnie to samo.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_01");	//Co? Ten tch�rz? Zawsze znika, jak tylko bestie pojawi� si� w okolicy.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_02");	//Nie powinien gada� takich bzdur.
};


instance DIA_EHNIM_STREIT3(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 7;
	condition = dia_ehnim_streit3_condition;
	information = dia_ehnim_streit3_info;
	description = "Tw�j brat uwa�a, �e jeste� nad�tym bufonem.";
};


func int dia_ehnim_streit3_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit2) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit3_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT3_15_00");	//Tw�j brat uwa�a, �e jeste� nad�tym bufonem.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_01");	//Co? �e te� ma czelno�� tak bezwstydnie k�ama�!
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_02");	//Niech lepiej baczy, �ebym mu nie da� nauczki.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_03");	//Id�, powiedz mu to.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_STREIT5(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 8;
	condition = dia_ehnim_streit5_condition;
	information = dia_ehnim_streit5_info;
	permanent = TRUE;
	description = "Wydaje mi si�, �e obaj powinni�cie si� nieco uspokoi�.";
};


var int dia_ehnim_streit5_noperm;

func int dia_ehnim_streit5_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit4) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)) && (DIA_EHNIM_STREIT5_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit5_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_15_00");	//Wydaje mi si�, �e obaj powinni�cie si� nieco uspokoi�.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_01");	//Nie chce ust�pi�, co?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_02");	//Wyrw� mu wszystkie bebechy. Id� mu to powiedzie�.
	Info_ClearChoices(dia_ehnim_streit5);
	Info_AddChoice(dia_ehnim_streit5,"R�b, co chcesz. Ja odchodz�.",dia_ehnim_streit5_gehen);
	Info_AddChoice(dia_ehnim_streit5,"Czemu sam mu tego nie powiesz?",dia_ehnim_streit5_attack);
};

func void dia_ehnim_streit5_attack()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_Attack_15_00");	//Czemu sam mu tego nie powiesz?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_Attack_12_01");	//Zrobi� to.
	AI_StopProcessInfos(self);
	DIA_EHNIM_STREIT5_NOPERM = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,egill,AR_NONE,0);
	b_giveplayerxp(XP_EGILLEHNIMSTREIT);
};

func void dia_ehnim_streit5_gehen()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_gehen_15_00");	//R�b, co chcesz. Ja odchodz�.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_gehen_12_01");	//Tak, naj�atwiej jest sobie p�j��.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP1(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap1_condition;
	information = dia_ehnim_permkap1_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap1_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && Npc_IsInState(self,zs_talk) && ((KAPITEL < 3) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap1_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP1_12_00");	//Ma�o jeszcze narobi�e�? Lepiej, jak sobie p�jdziesz.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_MOLERATFETT(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_moleratfett_condition;
	information = dia_ehnim_moleratfett_info;
	important = TRUE;
};


func int dia_ehnim_moleratfett_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && (KAPITEL >= 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_ehnim_moleratfett_info()
{
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_00");	//DALEJ tu jeste�.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_01");	//Jak widzisz. Wci�� jeste� w�ciek�y?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_02");	//Niewa�ne, zapomnij. Powiedz, by�e� ostatnio na farmie Lobarta?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_03");	//Mo�e. A czemu pytasz?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_04");	//No... tak tylko. Chcia�em po prostu porozmawia� z Vino o tej jego gorzelni.
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"Nie mam teraz czasu.",dia_ehnim_moleratfett_nein);
	Info_AddChoice(dia_ehnim_moleratfett,"Gorzelni? Jakiej gorzelni?",dia_ehnim_moleratfett_was);
	if(Npc_IsDead(vino))
	{
		Info_AddChoice(dia_ehnim_moleratfett,"Vino nie �yje.",dia_ehnim_moleratfett_tot);
	};
};

func void dia_ehnim_moleratfett_tot()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_tot_15_00");	//Vino nie �yje.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_tot_12_01");	//O rety. Hm... No tak.
};

func void dia_ehnim_moleratfett_was()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_15_00");	//Gorzelni? Jakiej gorzelni?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_01");	//No... pewnie nie powinienem ci tego gada�. Vino zawsze bardzo zwa�a� na ten sw�j ma�y sekret.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_02");	//Niewa�ne, ju� i tak si� wygada�em. Vino ma w lesie ukryt� gorzelni�.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_03");	//Jaki� czas temu prosi� mnie o co�, czym m�g�by nasmarowa� wrota.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_04");	//A ostatnio sporo pada�o i brama zd��y�a doszcz�tnie zardzewie�. Mechanizm si� zaci�� i teraz nie spos�b dosta� si� do �rodka. Niez�y numer.
	Log_CreateTopic(TOPIC_FOUNDVINOSKELLEREI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FOUNDVINOSKELLEREI,LOG_RUNNING);
	b_logentry(TOPIC_FOUNDVINOSKELLEREI,"Ehnim powiedzia� mi, �e Vino ma sekretn� gorzelni� w lesie w pobli�u farmy Akila. Jednak mechanizm otwieraj�cy drzwi zaci�� si�, a do jego uruchomienia potrzebny jest ��j kretoszczura.");
	Info_AddChoice(dia_ehnim_moleratfett,"I co? Masz jaki� smar?",dia_ehnim_moleratfett_was_fett);
};

func void dia_ehnim_moleratfett_was_fett()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_15_00");	//I co? Masz jaki� smar?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_12_01");	//Tak, pewnie. ��j kretoszczura. Obrzydlistwo, ale bardzo skuteczne. U�ywa si� go do konserwacji dzia� okr�towych.
	Info_AddChoice(dia_ehnim_moleratfett,"Sprzedaj mi ten smar.",dia_ehnim_moleratfett_was_fett_habenwill);
};


var int ehnim_moleratfettoffer;

func void dia_ehnim_moleratfett_was_fett_habenwill()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00");	//Sprzedaj mi ten smar.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01");	//To b�dzie troch� kosztowa�o, kolego. W tych stronach to rzadko��.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02");	//Ile za niego chcesz?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03");	//Hm. 100 sztuk z�ota?
	EHNIM_MOLERATFETTOFFER = 100;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"To stanowczo za du�o!",dia_ehnim_moleratfett_was_fett_habenwill_zuviel);
	Info_AddChoice(dia_ehnim_moleratfett,"Umowa stoi.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_ja()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00");	//Zgoda.
	if(b_giveinvitems(other,self,itmi_gold,EHNIM_MOLERATFETTOFFER))
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01");	//Prosz�.
		if(Npc_HasItems(self,itmi_moleratlubric_mis))
		{
			b_giveinvitems(self,other,itmi_moleratlubric_mis,1);
			if(Npc_IsDead(vino) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02");	//O rety. Vino mnie zabije.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03");	//Niech to szlag, gdzie on si� podzia�? Co za cholerstwo. No tak, chyba mi si� sko�czy�. No to nie pozostaje mi nic innego, jak zwr�ci� ci twoj� fors�.
			b_giveinvitems(self,other,itmi_gold,EHNIM_MOLERATFETTOFFER);
			if(Npc_IsDead(egill) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04");	//Pewnikiem to sprawka mojego brata. Prawdziwy z niego dra�.
				AI_StopProcessInfos(self);
				other.aivar[AIV_INVINCIBLE] = FALSE;
				b_attack(self,egill,AR_NONE,0);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05");	//Wspaniale. Po co to ca�e gadanie, skoro nie masz czym zap�aci�? Szkoda mojego czasu.
	};
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00");	//To za du�o.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01");	//Dobra, dobra. 70 monet, ale to ostatnie s�owo.
	EHNIM_MOLERATFETTOFFER = 70;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"To wci�� za du�o.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch);
	Info_AddChoice(dia_ehnim_moleratfett,"Umowa stoi.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_immernoch_15_00");	//To wci�� za du�o.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_immernoch_12_01");	//No to zapomnij o ca�ej sprawie. Mi�ego dnia.
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_nein()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_nein_15_00");	//Nie mam teraz czasu.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_nein_12_01");	//Nie daj si� zatrzymywa�.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP3(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap3_condition;
	information = dia_ehnim_permkap3_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap3_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_moleratfett) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap3_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP3_12_00");	//Nie mam teraz czasu.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PICKPOCKET(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 900;
	condition = dia_ehnim_pickpocket_condition;
	information = dia_ehnim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ehnim_pickpocket_condition()
{
	return c_beklauen(76,35);
};

func void dia_ehnim_pickpocket_info()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_BACK,dia_ehnim_pickpocket_back);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_PICKPOCKET,dia_ehnim_pickpocket_doit);
};

func void dia_ehnim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ehnim_pickpocket);
};

func void dia_ehnim_pickpocket_back()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
};

