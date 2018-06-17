
instance DIA_ALBRECHT_EXIT(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 999;
	condition = dia_albrecht_exit_condition;
	information = dia_albrecht_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_albrecht_exit_condition()
{
	return TRUE;
};

func void dia_albrecht_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALBRECHT_HAGEN(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 1;
	condition = dia_albrecht_hagen_condition;
	information = dia_albrecht_hagen_info;
	permanent = FALSE;
	description = "Muszê porozmawiaæ z Lordem Hagenem!";
};


func int dia_albrecht_hagen_condition()
{
	if(lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_albrecht_hagen_info()
{
	AI_Output(other,self,"DIA_Albrecht_Hagen_15_00");	//Muszê porozmawiaæ z Lordem Hagenem!
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_01");	//Jest w wielkiej sali, na wprost st¹d.
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_02");	//Cokolwiek chcesz od niego, streszczaj siê - to zajêty cz³owiek!
};


instance DIA_ALBRECHT_HALLO(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 2;
	condition = dia_albrecht_hallo_condition;
	information = dia_albrecht_hallo_info;
	permanent = FALSE;
	description = "Czym siê zajmuje paladyn?";
};


func int dia_albrecht_hallo_condition()
{
	return TRUE;
};

func void dia_albrecht_hallo_info()
{
	AI_Output(other,self,"DIA_Albrecht_Hallo_15_00");	//Czym siê zajmuje paladyn?
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_01");	//Paladyn jest wojownikiem Innosa. ¯yje, by mu s³u¿yæ i walczy, by oddaæ mu czeœæ.
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_02");	//W zamian obdarzeni zostajemy darem magii. Magi¹ run - które otrzymujemy w uznaniu naszych czynów.
};


instance DIA_ALBRECHT_CANTEACH(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 99;
	condition = dia_albrecht_canteach_condition;
	information = dia_albrecht_canteach_info;
	permanent = TRUE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_albrecht_canteach_condition()
{
	if(ALBRECHT_TEACHMANA == FALSE)
	{
		return TRUE;
	};
};

func void dia_albrecht_canteach_info()
{
	AI_Output(other,self,"DIA_Albrecht_CanTeach_15_00");	//Czy mo¿esz mnie czegoœ nauczyæ?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_01");	//Jeœli udowodnisz, ¿e jesteœ tego godny, obdarzê ciê magicznymi runami paladynów.
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_02");	//Poza tym, mogê nauczyæ ciê, jak zwiêkszyæ swoj¹ magiczn¹ moc.
		ALBRECHT_TEACHMANA = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladyn Albrecht mo¿e mi pomóc w zwiêkszeniu moich mocy magicznych.");
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_03");	//Szkolê tylko paladynów.
	};
};


instance DIA_ALBRECHT_TEACHPALRUNES(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 100;
	condition = dia_albrecht_teachpalrunes_condition;
	information = dia_albrecht_teachpalrunes_info;
	permanent = TRUE;
	description = "Czy jestem godny otrzymania runy?";
};


func int dia_albrecht_teachpalrunes_condition()
{
	if(ALBRECHT_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_albrecht_teachpalrunes_info()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_15_00");	//Czy jestem godny otrzymania runy?
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHT] == FALSE)
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_01");	//Jako symbol twej rangi naznaczê ciê Run¹ Œwiat³a. To symbol prawdy i sprawiedliwoœci.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_02");	//Rozœwietla drogê wszystkim tym, którzy krocz¹ œcie¿k¹ Innosa.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_03");	//Musisz zas³u¿yæ na pozosta³e runy. Wróæ do mnie, kiedy uznasz, ¿e jesteœ ich godny.
		PLAYER_TALENT_RUNES[SPL_PALLIGHT] = TRUE;
		CreateInvItems(self,itru_pallight,1);
		b_giveinvitems(self,other,itru_pallight,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_04");	//Jak¹ drogê wybra³eœ?
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_05");	//Drogê uzdrawiania czy drogê walki?
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,"Wybieram drogê leczenia.",dia_albrecht_teachpalrunes_heal);
		Info_AddChoice(dia_albrecht_teachpalrunes,"Wybieram drogê walki.",dia_albrecht_teachpalrunes_combat);
	};
};

func void dia_albrecht_teachpalrunes_back()
{
	Info_ClearChoices(dia_albrecht_teachpalrunes);
};

func void b_albrecht_youarenotworthy()
{
	AI_Output(self,other,"B_Albrecht_YouAreNotWorthy_03_00");	//Nie jesteœ jeszcze godzien, by otrzymaæ kolejny czar z tej œcie¿ki.
};

func void dia_albrecht_teachpalrunes_heal()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Heal_15_00");	//Wybieram drogê leczenia.
	if((PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Leczenie lekkich ran",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_pallightheal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE) && (KAPITEL >= 5))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Leczenie œrednich ran",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palmediumheal);
	}
	else
	{
		b_albrecht_youarenotworthy();
	};
};

func void dia_albrecht_teachpalrunes_combat()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Combat_15_00");	//Wybieram drogê walki.
	if((PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Œwiêty pocisk",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palholybolt);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE) && (KAPITEL >= 5))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Wypêdzenie z³a",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palrepelevil);
	}
	else
	{
		b_albrecht_youarenotworthy();
	};
};

func int dia_albrecht_teachpalrunes_pallightheal()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] = TRUE;
	CreateInvItems(self,itru_pallightheal,1);
	b_giveinvitems(self,other,itru_pallightheal,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	Info_ClearChoices(dia_albrecht_teachpalrunes);
	return TRUE;
};

func int dia_albrecht_teachpalrunes_palmediumheal()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] = TRUE;
	CreateInvItems(self,itru_palmediumheal,1);
	b_giveinvitems(self,other,itru_palmediumheal,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	return TRUE;
};

func int dia_albrecht_teachpalrunes_palholybolt()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] = TRUE;
	CreateInvItems(self,itru_palholybolt,1);
	b_giveinvitems(self,other,itru_palholybolt,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	return TRUE;
};

func int dia_albrecht_teachpalrunes_palrepelevil()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] = TRUE;
	CreateInvItems(self,itru_palrepelevil,1);
	b_giveinvitems(self,other,itru_palrepelevil,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	return TRUE;
};


instance DIA_ALBRECHT_TEACH(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 101;
	condition = dia_albrecht_teach_condition;
	information = dia_albrecht_teach_info;
	permanent = TRUE;
	description = "Chcê zwiêkszyæ moje moce magiczne.";
};


func int dia_albrecht_teach_condition()
{
	if(ALBRECHT_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_albrecht_teach_info()
{
	AI_Output(other,self,"DIA_Albrecht_Teach_15_00");	//Chcê zwiêkszyæ moje moce magiczne.
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_albrecht_teach_5);
};

func void dia_albrecht_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Albrecht_Teach_03_00");	//Jeœli chcesz to zrobiæ, musisz poszukaæ innego nauczyciela.
	};
	Info_ClearChoices(dia_albrecht_teach);
};

func void dia_albrecht_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_albrecht_teach_5);
};

func void dia_albrecht_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_albrecht_teach_5);
};


instance DIA_ALBRECHT_PICKPOCKET(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 900;
	condition = dia_albrecht_pickpocket_condition;
	information = dia_albrecht_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_albrecht_pickpocket_condition()
{
	return c_beklauen(41,160);
};

func void dia_albrecht_pickpocket_info()
{
	Info_ClearChoices(dia_albrecht_pickpocket);
	Info_AddChoice(dia_albrecht_pickpocket,DIALOG_BACK,dia_albrecht_pickpocket_back);
	Info_AddChoice(dia_albrecht_pickpocket,DIALOG_PICKPOCKET,dia_albrecht_pickpocket_doit);
};

func void dia_albrecht_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_albrecht_pickpocket);
};

func void dia_albrecht_pickpocket_back()
{
	Info_ClearChoices(dia_albrecht_pickpocket);
};

