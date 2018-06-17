
instance DIA_HILDA_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_exit_condition;
	information = dia_hilda_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hilda_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_HALLO(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_hallo_condition;
	information = dia_hilda_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hilda_hallo_condition()
{
	if((MIS_LOBART_RUEBEN != LOG_SUCCESS) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_00");	//Hej, kto ci� tu zaprasza�? Natychmiast wyno� si� z mojego domu. Nic tutaj nie dostaniesz.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_01");	//Tak, o co chodzi?
	};
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_WASZUESSEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_waszuessen_condition;
	information = dia_hilda_waszuessen_info;
	permanent = TRUE;
	description = "Czy mo�esz mi da� co� do jedzenia?";
};


func int dia_hilda_waszuessen_condition()
{
	if((Npc_KnowsInfo(other,dia_hilda_hallo) || (MIS_LOBART_RUEBEN == LOG_SUCCESS)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_waszuessen_info()
{
	var int rueben_tagnull;
	if(hero.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Hilda_WasZuEssen_15_00");	//Czy mo�esz mi da� co� do jedzenia?
		if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
		{
			if(!Npc_KnowsInfo(other,dia_hilda_pfannetoolate))
			{
				if(HILDA_STEW_DAY != Wld_GetDay())
				{
					b_giveinvitems(self,other,itfo_stew,1);
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_01");	//Prosz�, to dla ciebie.
					HILDA_STEW_DAY = Wld_GetDay();
				}
				else if((Wld_GetDay() == 0) && (rueben_tagnull == FALSE))
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_02");	//Jutro mo�esz wr�ci� po wi�cej.
					b_giveinvitems(self,other,itfo_stew,1);
					HILDA_STEW_DAY = Wld_GetDay();
					rueben_tagnull = TRUE;
					Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
					b_logentry(TOPIC_BONUS,"Codziennie mog� dosta� u Hildy troch� gotowanej rzepy.");
				}
				else
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_03");	//Przecie� ju� dosta�e� swoj� dzisiejsz� porcj�! Przyjd� kiedy indziej.
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_04");	//Nie karmimy tutaj darmozjad�w. Wyno� si�!
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_05");	//Tutaj jadaj� tylko uczciwie pracuj�cy ludzie!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_06");	//Jestem pewna, �e sta� ci� na obiad w mie�cie.
	};
};


instance DIA_HILDA_BRINGBEET(C_INFO)
{
	npc = bau_951_hilda;
	nr = 1;
	condition = dia_hilda_bringbeet_condition;
	information = dia_hilda_bringbeet_info;
	permanent = FALSE;
	description = "Mam tu dla ciebie kilka rzep...";
};


func int dia_hilda_bringbeet_condition()
{
	if((MIS_LOBART_RUEBENTOHILDA == LOG_RUNNING) && (Npc_HasItems(other,itpl_beet) >= 1) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_bringbeet_info()
{
	AI_Output(other,self,"DIA_Hilda_BringBeet_15_00");	//Mam tu dla ciebie kilka rzep...
	if(Npc_HasItems(other,itpl_beet) >= 20)
	{
		b_giveinvitems(other,self,itpl_beet,Npc_HasItems(other,itpl_beet));
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_01");	//�wietnie! To powinno wystarczy� do nakarmienia tych wszystkich g�odomor�w!
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_02");	//Skoro ju� tu jeste� - kilka minut temu przechodzi� t�dy w�drowny handlarz.
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_03");	//Chyba zatrzyma� si� gdzie� po drodze do miasta. Znajd� go i zapytaj, czy nie ma dla mnie jakiej� porz�dnej patelni.
		MIS_LOBART_RUEBENTOHILDA = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_04");	//Co?! To ma by� ca�y zbi�r?!
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_05");	//To nie wystarczy.
		};
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_06");	//Id� na pole i przynie� wi�cej, przecie� musz� jako� nakarmi� tych wszystkich ludzi!
		AI_StopProcessInfos(self);
	};
};


instance DIA_HILDA_EINKAUFEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_einkaufen_condition;
	information = dia_hilda_einkaufen_info;
	permanent = FALSE;
	description = "Daj mi z�oto, a znajd� tego handlarza...";
};


func int dia_hilda_einkaufen_condition()
{
	if((MIS_LOBART_RUEBENTOHILDA == LOG_SUCCESS) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_einkaufen_info()
{
	AI_Output(other,self,"DIA_Hilda_Einkaufen_15_00");	//Daj mi z�oto, a znajd� tego handlarza...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Einkaufen_17_01");	//Chyba mog� ci zaufa�... Tylko nie wydaj wszystkiego na gorza��! S�yszysz?!
	};
	b_giveinvitems(self,other,itmi_gold,20);
	MIS_HILDA_PFANNEKAUFEN = LOG_RUNNING;
	MIS_HILDA_PFANNEKAUFEN_DAY = b_getdayplus();
	Log_CreateTopic(TOPIC_HILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HILDA,LOG_RUNNING);
	b_logentry(TOPIC_HILDA,"Hilda, �ona farmera Lobarta, chce, abym kupi� dla niej u w�drownego handlarza patelni�.");
};


instance DIA_HILDA_PFANNEGEHOLT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_pfannegeholt_condition;
	information = dia_hilda_pfannegeholt_info;
	permanent = FALSE;
	description = "Oto twoja patelnia.";
};


func int dia_hilda_pfannegeholt_condition()
{
	if((MIS_HILDA_PFANNEKAUFEN == LOG_RUNNING) && (Npc_HasItems(other,itmi_pan) > 0) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_pfannegeholt_info()
{
	AI_Output(other,self,"DIA_Hilda_PfanneGeholt_15_00");	//Oto twoja patelnia.
	b_giveinvitems(other,self,itmi_pan,1);
	AI_Output(self,other,"DIA_Hilda_PfanneGeholt_17_01");	//Dobrze. Wypr�bujmy j�...
	MIS_HILDA_PFANNEKAUFEN = LOG_SUCCESS;
	b_giveplayerxp(XP_HILDAHOLPFANNE);
};


instance DIA_HILDA_PFANNETOOLATE(C_INFO)
{
	npc = bau_951_hilda;
	nr = 1;
	condition = dia_hilda_pfannetoolate_condition;
	information = dia_hilda_pfannetoolate_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hilda_pfannetoolate_condition()
{
	if((MIS_HILDA_PFANNEKAUFEN == LOG_RUNNING) && (MIS_HILDA_PFANNEKAUFEN_DAY <= (Wld_GetDay() - 1)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_pfannetoolate_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_00");	//Masz czelno�� si� tutaj pokazywa�?! Gdzie s� moje pieni�dze, hultaju?!
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_01");	//Wystarczy tego dobrego. Gdzie s� pieni�dze, za kt�re mia�e� kupi� patelni�?
	};
	if(Npc_HasItems(other,itmi_pan) > 0)
	{
		AI_Output(other,self,"DIA_Hilda_PfanneTooLate_15_02");	//Przepraszam, �e zaj�o mi to tyle czasu. Oto twoja patelnia!
		b_giveinvitems(other,self,itmi_pan,1);
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_03");	//Daj j� tutaj wreszcie. Co� niebywa�ego!
		MIS_HILDA_PFANNEKAUFEN = LOG_SUCCESS;
		b_giveplayerxp(XP_HILDAHOLPFANNE / 2);
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) >= 20)
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_04");	//Ach! Jeszcze j� masz. Oddaj mi j�. W tej chwili.
			b_giveinvitems(other,self,itmi_gold,20);
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_05");	//Co� niebywa�ego!
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_06");	//Gdzie jest moja patelnia? Dosta�e� na ni� 20 sztuk z�ota!
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_07");	//Wyno� si� st�d, wstr�tny z�odzieju!
			b_memorizeplayercrime(self,other,CRIME_THEFT);
		};
		MIS_HILDA_PFANNEKAUFEN = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
	};
};


instance DIA_HILDA_KAP3_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap3_exit_condition;
	information = dia_hilda_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hilda_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KRANK(C_INFO)
{
	npc = bau_951_hilda;
	nr = 30;
	condition = dia_hilda_krank_condition;
	information = dia_hilda_krank_info;
	permanent = TRUE;
	description = "�le si� czujesz?";
};


func int dia_hilda_krank_condition()
{
	if((KAPITEL >= 3) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_HEALHILDA != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_hilda_krank_ontime;

func void dia_hilda_krank_info()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_15_00");	//�le si� czujesz?
	AI_Output(self,other,"DIA_Hilda_KRANK_17_01");	//Nie najlepiej. Znowu mam t� okropn� gor�czk�.
	AI_Output(self,other,"DIA_Hilda_KRANK_17_02");	//Powinnam p�j�� do uzdrawiacza, ale nawet na to jestem za s�aba.
	if(DIA_HILDA_KRANK_ONTIME == FALSE)
	{
		Info_ClearChoices(dia_hilda_krank);
		Info_AddChoice(dia_hilda_krank,"Wracaj do zdrowia. Ja musz� ju� i��.",dia_hilda_krank_besserung);
		Info_AddChoice(dia_hilda_krank,"Czy mog� jako� pom�c?",dia_hilda_krank_helfen);
		DIA_HILDA_KRANK_ONTIME = TRUE;
	};
	MIS_HEALHILDA = LOG_RUNNING;
};

func void dia_hilda_krank_besserung()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_besserung_15_00");	//Wracaj do zdrowia. Ja musz� ju� i��.
	AI_Output(self,other,"DIA_Hilda_KRANK_besserung_17_01");	//Miejmy nadziej�, �e wkr�tce przyjd� lepsze czasy.
	AI_StopProcessInfos(self);
};

func void dia_hilda_krank_helfen()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_helfen_15_00");	//Czy mog� jako� pom�c?
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_01");	//By�oby wspaniale, gdyby� uda� si� do Vatrasa i przyni�s� mi od niego moje lekarstwo.
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_02");	//On b�dzie wiedzia�, co zrobi�!
	Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
	b_logentry(TOPIC_HEALHILDA,"�ona Lobarta, Hilda, zachorowa�a. Vatras ma lekarstwo, kt�re mo�e j� wyleczy�.");
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_HEILUNGBRINGEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 31;
	condition = dia_hilda_heilungbringen_condition;
	information = dia_hilda_heilungbringen_info;
	description = "Przynios�em twoje lekarstwo.";
};


func int dia_hilda_heilungbringen_condition()
{
	if(Npc_HasItems(other,itpo_healhilda_mis))
	{
		return TRUE;
	};
};

func void dia_hilda_heilungbringen_info()
{
	AI_Output(other,self,"DIA_Hilda_HEILUNGBRINGEN_15_00");	//Przynios�em twoje lekarstwo.
	b_giveinvitems(other,self,itpo_healhilda_mis,1);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_01");	//Naprawd�, gdyby wszyscy byli tacy uczynni jak ty... Strasznie ci dzi�kuj�.
	b_useitem(self,itpo_healhilda_mis);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_02");	//Mam nadziej�, �e tych kilka monet wystarczy.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	MIS_HEALHILDA = LOG_SUCCESS;
	b_giveplayerxp(XP_HEALHILDA);
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_DISTURB(C_INFO)
{
	npc = bau_951_hilda;
	nr = 32;
	condition = dia_hilda_disturb_condition;
	information = dia_hilda_disturb_info;
	permanent = TRUE;
	description = "Jak si� masz?";
};


func int dia_hilda_disturb_condition()
{
	if((MIS_HEALHILDA == LOG_SUCCESS) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (KAPITEL > 3)))
	{
		return TRUE;
	};
};

func void dia_hilda_disturb_info()
{
	if(MIS_HEALHILDA == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Hilda_DISTURB_15_00");	//Jak si� czujesz?
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_01");	//Dzi�kuj�, dzi�ki tobie wracam do zdrowia.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_02");	//Niezbyt dobrze.
	};
};


instance DIA_HILDA_KAP4_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap4_exit_condition;
	information = dia_hilda_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hilda_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KAP5_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap5_exit_condition;
	information = dia_hilda_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hilda_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KAP6_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap6_exit_condition;
	information = dia_hilda_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_hilda_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_PICKPOCKET(C_INFO)
{
	npc = bau_951_hilda;
	nr = 900;
	condition = dia_hilda_pickpocket_condition;
	information = dia_hilda_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_hilda_pickpocket_condition()
{
	return c_beklauen(26,35);
};

func void dia_hilda_pickpocket_info()
{
	Info_ClearChoices(dia_hilda_pickpocket);
	Info_AddChoice(dia_hilda_pickpocket,DIALOG_BACK,dia_hilda_pickpocket_back);
	Info_AddChoice(dia_hilda_pickpocket,DIALOG_PICKPOCKET,dia_hilda_pickpocket_doit);
};

func void dia_hilda_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hilda_pickpocket);
};

func void dia_hilda_pickpocket_back()
{
	Info_ClearChoices(dia_hilda_pickpocket);
};

