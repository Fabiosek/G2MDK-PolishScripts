
instance DIA_ADDON_EREMIT_EXIT(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 999;
	condition = dia_addon_eremit_exit_condition;
	information = dia_addon_eremit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_eremit_exit_condition()
{
	return TRUE;
};

func void dia_addon_eremit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EREMIT_HELLO(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 1;
	condition = dia_addon_eremit_hello_condition;
	information = dia_addon_eremit_hello_info;
	important = TRUE;
};


func int dia_addon_eremit_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_eremit_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_00");	//Co ja tutaj robi�?! Do diab�a! Co TY tutaj robisz?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_01");	//Osiedli�em si� w najbardziej odosobnionej cz�ci wyspy, poniewa� potrzebowa�em troch� spokoju!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_02");	//Wojna domowa, nachalni bandyci, hordy ork�w u progu mego domu...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_03");	//To nie dla mnie. Ju� nie. Mia�em do�� tego ca�ego szale�stwa.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_04");	//Jest tu troch� ork�w, ale wcale nie tak du�o.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_05");	//A innych ludzi � chwa�a niech b�dzie Innosowi � ani widu, ani s�ychu. A� do dzisiaj!
};


instance DIA_ADDON_EREMIT_SEEKTAFELN(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 2;
	condition = dia_addon_eremit_seektafeln_condition;
	information = dia_addon_eremit_seektafeln_info;
	description = "Szukam kamiennych tabliczek. ";
};


func int dia_addon_eremit_seektafeln_condition()
{
	return TRUE;
};

func void dia_addon_eremit_seektafeln_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_02");	//Szukam kamiennych tabliczek. Nie znalaz�e� mo�e jakich�?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_06");	//No c�, znalaz�em... Ale nie oddam ci!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_07");	//To jedyne, co mam tu do czytania.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_08");	//Nie rozumiem jeszcze wszystkiego, ale potrafi� rozszyfrowa� wi�kszo�� z nich.
};


var int eremit_teach_once;

instance DIA_ADDON_EREMIT_TEACH(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 3;
	condition = dia_addon_eremit_teach_condition;
	information = dia_addon_eremit_teach_info;
	permanent = TRUE;
	description = "Je�li chodzi o te kamienne tablice...";
};


func int dia_addon_eremit_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_eremit_seektafeln) && (EREMIT_TEACH_ONCE == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_eremit_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_03");	//Je�li chodzi o te kamienne tablice...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_25");	//Mam ci pokaza�, jak je odczytywa�?
	if(MIS_EREMIT_KLAMOTTEN != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_26");	//Ale nie oddam ci moich! Musisz za�atwi� sobie w�asne.
	};
	Info_ClearChoices(dia_addon_eremit_teach);
	Info_AddChoice(dia_addon_eremit_teach,DIALOG_BACK,dia_addon_eremit_teach_no);
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice(dia_addon_eremit_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_1,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),dia_addon_eremit_teach_yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		Info_AddChoice(dia_addon_eremit_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_2,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),dia_addon_eremit_teach_yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		Info_AddChoice(dia_addon_eremit_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_3,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),dia_addon_eremit_teach_yes);
	};
};

func void b_addon_eremit_teachlanguage()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_27");	//To naprawd� bardzo proste. 'G' oznacza 'O', 'T' oznacza 'H', a 'I' to 'C'.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_28");	//Kiedy to opanujesz, reszta przyjdzie z �atwo�ci�...
	EREMIT_TEACH_ONCE = TRUE;
};

func void dia_addon_eremit_teach_no()
{
	Info_ClearChoices(dia_addon_eremit_teach);
};

func void dia_addon_eremit_teach_yes()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_29");	//Nie s�dz�, �ebym m�g� nauczy� ci� czego� wi�cej...
		EREMIT_TEACH_ONCE = TRUE;
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_3))
		{
			b_addon_eremit_teachlanguage();
		};
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_2))
		{
			b_addon_eremit_teachlanguage();
		};
	}
	else if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_1))
	{
		b_addon_eremit_teachlanguage();
	};
};


instance DIA_ADDON_EREMIT_KLAMOTTEN(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 4;
	condition = dia_addon_eremit_klamotten_condition;
	information = dia_addon_eremit_klamotten_info;
	permanent = TRUE;
	description = "Mam dla ciebie jakie� ubranie...";
};


func int dia_addon_eremit_klamotten_condition()
{
	if(MIS_EREMIT_KLAMOTTEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_eremit_klamotten_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_01");	//Mam dla ciebie jakie� ubranie...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_19");	//Serio? Dawaj! Zobaczymy, czy pasuje.
	Info_ClearChoices(dia_addon_eremit_klamotten);
	Info_AddChoice(dia_addon_eremit_klamotten,DIALOG_BACK,dia_addon_eremit_klamotten_back);
	if(Npc_HasItems(other,itar_pir_l_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj lekk� zbroj� pirat�w",dia_addon_eremit_klamotten_pir_l);
	};
	if(Npc_HasItems(other,itar_pir_m_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj �redni� zbroj� pirat�w",dia_addon_eremit_klamotten_pir_m);
	};
	if(Npc_HasItems(other,itar_pir_h_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj zbroj� kapitana pirat�w",dia_addon_eremit_klamotten_pir_h);
	};
	if(Npc_HasItems(other,itar_ranger_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj zbroj� Wodnego Kr�gu",dia_addon_eremit_klamotten_ranger);
	};
	if(Npc_HasItems(other,itar_kdw_l_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj lekk� tog� Maga Wody",dia_addon_eremit_klamotten_kdw_l);
	};
	if(Npc_HasItems(other,itar_kdw_h) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj ci�k� szat� Maga Wody",dia_addon_eremit_klamotten_kdw_h);
	};
	if(Npc_HasItems(other,itar_governor) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj tunik� gubernatora",dia_addon_eremit_klamotten_governor);
	};
	if(Npc_HasItems(other,itar_judge) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj s�dziowsk� tog�",dia_addon_eremit_klamotten_judge);
	};
	if(Npc_HasItems(other,itar_smith) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj fartuch kowalski",dia_addon_eremit_klamotten_smith);
	};
	if(Npc_HasItems(other,itar_barkeeper) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj fartuch obszarnika",dia_addon_eremit_klamotten_barkeeper);
	};
	if(Npc_HasItems(other,itar_vlk_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj str�j mieszczanina I",dia_addon_eremit_klamotten_vlk_l);
	};
	if(Npc_HasItems(other,itar_vlk_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj str�j mieszczanina II",dia_addon_eremit_klamotten_vlk_m);
	};
	if(Npc_HasItems(other,itar_vlk_h) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj str�j mieszczanina III",dia_addon_eremit_klamotten_vlk_h);
	};
	if(Npc_HasItems(other,itar_vlkbabe_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj sukni� mieszczanki I",dia_addon_eremit_klamotten_vlkbabe_l);
	};
	if(Npc_HasItems(other,itar_vlkbabe_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj sukni� mieszczanki II",dia_addon_eremit_klamotten_vlkbabe_m);
	};
	if(Npc_HasItems(other,itar_vlkbabe_h) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj sukni� mieszczanki III",dia_addon_eremit_klamotten_vlkbabe_h);
	};
	if(Npc_HasItems(other,itar_pal_skel) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj podniszczon� zbroj� paladyna",dia_addon_eremit_klamotten_pal_skel);
	};
	if(Npc_HasItems(other,itar_bau_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj lekki str�j farmera",dia_addon_eremit_klamotten_bau_l);
	};
	if(Npc_HasItems(other,itar_bau_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj �redni str�j farmera",dia_addon_eremit_klamotten_bau_m);
	};
	if(Npc_HasItems(other,itar_baubabe_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj lekk� sukni� farmerki",dia_addon_eremit_klamotten_baubabe_l);
	};
	if(Npc_HasItems(other,itar_baubabe_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj �redni� sukni� farmerki",dia_addon_eremit_klamotten_baubabe_m);
	};
	if(Npc_HasItems(other,itar_djg_crawler) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj zbroj� z pancerzy pe�zaczy",dia_addon_eremit_klamotten_djg_crawler);
	};
	if(Npc_HasItems(other,itar_leather_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj sk�rzan� zbroj�",dia_addon_eremit_klamotten_leather);
	};
	if(Npc_HasItems(other,itar_xardas) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj szat� mrocznych sztuk",dia_addon_eremit_klamotten_xardas);
	};
	if(Npc_HasItems(other,itar_lester) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj szat� Lestera",dia_addon_eremit_klamotten_lester);
	};
	if(Npc_HasItems(other,itar_diego) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj zbroj� Diego",dia_addon_eremit_klamotten_diego);
	};
	if(Npc_HasItems(other,itar_corangar) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj zbroj� Cor Angara",dia_addon_eremit_klamotten_corangar);
	};
	if(Npc_HasItems(other,itar_prisoner) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj spodnie kopacza",dia_addon_eremit_klamotten_prisoner);
	};
	if(Npc_HasItems(other,itar_dementor) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Daj szat� poszukiwacza",dia_addon_eremit_klamotten_dementor);
	};
};

func void b_eremit_tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_20");	//Jak ula�!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_21");	//Hmm, jak m�g�bym si� odwdzi�czy�? Ca�e z�oto odda�em piratowi za transport.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_22");	//Mog� ci da� par� starych kamiennych tablic.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_23");	//Masz, we� je. Zawsze mog� znale�� wi�cej.
	b_giveinvitems(self,other,itwr_dexstoneplate3_addon,1);
	b_giveinvitems(self,other,itwr_stoneplatecommon_addon,1);
	MIS_EREMIT_KLAMOTTEN = LOG_SUCCESS;
	b_giveplayerxp(200);
	Info_ClearChoices(dia_addon_eremit_klamotten);
};

func void dia_addon_eremit_klamotten_back()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_24");	//�wietnie. Najpierw robisz mi nadziej�, a potem...
	Info_ClearChoices(dia_addon_eremit_klamotten);
};

func void dia_addon_eremit_klamotten_pir_l()
{
	b_giveinvitems(other,self,itar_pir_l_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pir_m()
{
	b_giveinvitems(other,self,itar_pir_m_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pir_h()
{
	b_giveinvitems(other,self,itar_pir_h_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_thorus()
{
	b_giveinvitems(other,self,itar_thorus_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_orebaron()
{
	b_giveinvitems(other,self,itar_orebaron_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bloodwyn()
{
	b_giveinvitems(other,self,itar_bloodwyn_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_raven()
{
	b_giveinvitems(other,self,itar_raven_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_ranger()
{
	b_giveinvitems(other,self,itar_ranger_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdw_l()
{
	b_giveinvitems(other,self,itar_kdw_l_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdw_h()
{
	b_giveinvitems(other,self,itar_kdw_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_governor()
{
	b_giveinvitems(other,self,itar_governor,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_judge()
{
	b_giveinvitems(other,self,itar_judge,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_smith()
{
	b_giveinvitems(other,self,itar_smith,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_barkeeper()
{
	b_giveinvitems(other,self,itar_barkeeper,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_l()
{
	b_giveinvitems(other,self,itar_vlk_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_m()
{
	b_giveinvitems(other,self,itar_vlk_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_h()
{
	b_giveinvitems(other,self,itar_vlk_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_l()
{
	b_giveinvitems(other,self,itar_vlkbabe_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_m()
{
	b_giveinvitems(other,self,itar_vlkbabe_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_h()
{
	b_giveinvitems(other,self,itar_vlkbabe_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_mil_l()
{
	b_giveinvitems(other,self,itar_mil_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_mil_m()
{
	b_giveinvitems(other,self,itar_mil_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_m()
{
	b_giveinvitems(other,self,itar_pal_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_h()
{
	b_giveinvitems(other,self,itar_pal_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_skel()
{
	b_giveinvitems(other,self,itar_pal_skel,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bau_l()
{
	b_giveinvitems(other,self,itar_bau_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bau_m()
{
	b_giveinvitems(other,self,itar_bau_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_baubabe_l()
{
	b_giveinvitems(other,self,itar_baubabe_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_baubabe_m()
{
	b_giveinvitems(other,self,itar_baubabe_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_l()
{
	b_giveinvitems(other,self,itar_sld_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_m()
{
	b_giveinvitems(other,self,itar_sld_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_h()
{
	b_giveinvitems(other,self,itar_sld_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_crawler()
{
	b_giveinvitems(other,self,itar_djg_crawler,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_l()
{
	b_giveinvitems(other,self,itar_djg_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_m()
{
	b_giveinvitems(other,self,itar_djg_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_h()
{
	b_giveinvitems(other,self,itar_djg_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_nov_l()
{
	b_giveinvitems(other,self,itar_nov_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdf_l()
{
	b_giveinvitems(other,self,itar_kdf_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdf_h()
{
	b_giveinvitems(other,self,itar_kdf_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_leather()
{
	b_giveinvitems(other,self,itar_leather_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bdt_m()
{
	b_giveinvitems(other,self,itar_bdt_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bdt_h()
{
	b_giveinvitems(other,self,itar_bdt_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_xardas()
{
	b_giveinvitems(other,self,itar_xardas,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_lester()
{
	b_giveinvitems(other,self,itar_lester,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_diego()
{
	b_giveinvitems(other,self,itar_diego,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_corangar()
{
	b_giveinvitems(other,self,itar_corangar,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_prisoner()
{
	b_giveinvitems(other,self,itar_prisoner,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_dementor()
{
	b_giveinvitems(other,self,itar_dementor,1);
	b_eremit_tatsache();
};


instance DIA_ADDON_EREMIT_PERM(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 99;
	condition = dia_addon_eremit_perm_condition;
	information = dia_addon_eremit_perm_info;
	permanent = TRUE;
	description = "No i? Jak si� �yje jako wyrzutek?";
};


func int dia_addon_eremit_perm_condition()
{
	return TRUE;
};

func void dia_addon_eremit_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_04");	//No i? Jak si� �yje jako wyrzutek?
	if(MIS_EREMIT_KLAMOTTEN == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_09");	//Wszystko zrobi�em sam. Moj� bro�, narz�dzia, sza�as, po prostu wszystko.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_10");	//A przyby�em tu, nie maj�c nic opr�cz dobrego humoru.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_11");	//Jednak czasami...
		AI_Output(other,self,"DIA_Addon_Eremit_Doppelt_15_01");	//Tak?
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_12");	//Czasami �a�uj�, �e nie wzi��em �adnych ubra�.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_13");	//Nie mam poj�cia o tkactwie czy wyprawianiu sk�r...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_14");	//A noce w tej cz�ci wyspy nie s� szczeg�lnie ciep�e.
		MIS_EREMIT_KLAMOTTEN = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_15");	//Jako� sobie radz�.
		if(MIS_EREMIT_KLAMOTTEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_18");	//Maj�c te ubrania, przetrwam zim�! A p�niej... zobaczymy...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_16");	//W ka�dym razie i tak jest tu lepiej ni� w Khorinis!
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_17");	//Nawet mimo braku ubra�.
		};
	};
};

