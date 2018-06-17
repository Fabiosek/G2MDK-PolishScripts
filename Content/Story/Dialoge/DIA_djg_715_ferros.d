
instance DIA_DJG_715_FERROS_EXIT(C_INFO)
{
	npc = djg_715_ferros;
	nr = 999;
	condition = dia_djg_715_ferros_exit_condition;
	information = dia_djg_715_ferros_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_djg_715_ferros_exit_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_715_FERROS_HELLO(C_INFO)
{
	npc = djg_715_ferros;
	nr = 4;
	condition = dia_djg_715_ferros_hello_condition;
	information = dia_djg_715_ferros_hello_info;
	permanent = FALSE;
	description = "Sk¹d pochodzisz?";
};


func int dia_djg_715_ferros_hello_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_hello_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Hello_15_00");	//Sk¹d pochodzisz?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_01");	//Przybywam z kontynentu. Tam w³aœnie schroni³ siê mój lud.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_02");	//Sytuacja pogarsza siê z dnia na dzieñ. Orkowie pl¹druj¹ wioski, pozostawiaj¹c po sobie jedynie dymi¹ce zgliszcza.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_03");	//Król ca³kowicie straci³ kontrolê nad krajem.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_04");	//Wy, paladyni, te¿ zawiedliœcie.
	};
};


instance DIA_DJG_715_FERROS_FRIENDS(C_INFO)
{
	npc = djg_715_ferros;
	nr = 5;
	condition = dia_djg_715_ferros_friends_condition;
	information = dia_djg_715_ferros_friends_info;
	permanent = FALSE;
	description = "Gdzie jest teraz twój lud?";
};


func int dia_djg_715_ferros_friends_condition()
{
	if(Npc_KnowsInfo(other,dia_djg_715_ferros_hello))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_friends_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Friends_15_00");	//Gdzie jest teraz twój lud?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_01");	//Porzuci³em ich.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_02");	//Uwa¿ali, ¿e mog¹ przyw³aszczyæ sobie wszystko, nawet to, co im siê nie nale¿a³o. Ja nie podziela³em ich zdania.
};


instance DIA_DJG_715_FERROS_WAR(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_war_condition;
	information = dia_djg_715_ferros_war_info;
	permanent = FALSE;
	description = "Co jeszcze wiesz na temat wojny?";
};


func int dia_djg_715_ferros_war_condition()
{
	if(Npc_KnowsInfo(other,dia_djg_715_ferros_hello))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_war_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_War_15_00");	//Co jeszcze wiesz na temat wojny?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_01");	//Pewno od dawna nie widzia³eœ siê z Królem, co?
	};
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_02");	//Orkowie oblegaj¹ stolicê. Nie wiem, czy pad³a, czy mo¿e wci¹¿ opiera siê ich atakom.
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_03");	//Ostatni¹ informacj¹, któr¹ s³ysza³em, by³o to, ¿e Król nie ¿yje. Ale nie wierzê w to.
};


instance DIA_DJG_715_FERROS_OLDCAMP(C_INFO)
{
	npc = djg_715_ferros;
	nr = 7;
	condition = dia_djg_715_ferros_oldcamp_condition;
	information = dia_djg_715_ferros_oldcamp_info;
	permanent = FALSE;
	description = "Co porabiasz w zamku?";
};


func int dia_djg_715_ferros_oldcamp_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_oldcamp_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_15_00");	//Co porabiasz w zamku?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_01");	//Us³ysza³em o smokach i postanowi³em pomóc w ich pokonaniu.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_02");	//Niestety, gdy próbowa³em przemkn¹æ siê obok obozowiska orków, zgubi³em miecz. Teraz tkwiê tu bezczynnie.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_03");	//Bez broni nie mogê opuœciæ tego miejsca. Zaœ miecze oferowane przez tutejszych p³atnerzy to najgorszy z³om, jaki widzia³em.
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"¯yczê powodzenia w poszukiwaniach.",dia_djg_715_ferros_oldcamp_no);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"Co dostanê, jeœli uda mi siê odzyskaæ twój miecz?",dia_djg_715_ferros_oldcamp_price);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"Odnajdê twój miecz.",dia_djg_715_ferros_oldcamp_yes);
	Wld_InsertItem(itmw_1h_ferrossword_mis,"FP_OW_ITEM_08");
	MIS_FERROSSWORD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FERROSSWORD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERROSSWORD,LOG_RUNNING);
	b_logentry(TOPIC_FERROSSWORD,"Feros zostawi³ u orków swój miecz. To nie by³o zbyt m¹dre.");
};

func void dia_djg_715_ferros_oldcamp_no()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_No_15_00");	//¯yczê powodzenia w poszukiwaniach.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01");	//Chyba czas spytaæ samego siebie: po co ja tu w³aœciwie jestem?
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};

func void dia_djg_715_ferros_oldcamp_price()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Price_15_00");	//Co dostanê, jeœli uda mi siê odzyskaæ twój miecz?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01");	//Nie mogê ci nic zaoferowaæ, bo na ten miecz wyda³em ostatnie z³oto, jakie mia³em.
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};

func void dia_djg_715_ferros_oldcamp_yes()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00");	//Odnajdê twój miecz.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01");	//To wspaniale. Powinieneœ go poszukaæ na klifie, na po³udnie st¹d.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02");	//Prawdopodobnie upuœci³em go w pobli¿u orkowych namiotów.
	b_logentry(TOPIC_FERROSSWORD,"Wygl¹da na to, ¿e Feros zgubi³ miecz na wysokim klifie na po³udniu, gdzie znajduj¹ siê namioty orków.");
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};


instance DIA_DJG_715_FERROS_FERROSANYSWORD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_ferrosanysword_condition;
	information = dia_djg_715_ferros_ferrosanysword_info;
	permanent = FALSE;
	description = "Mo¿e mia³bym dla ciebie jakiœ inny miecz.";
};


func int dia_djg_715_ferros_ferrosanysword_condition()
{
	if((MIS_FERROSSWORD == LOG_RUNNING) && ((Npc_HasItems(other,itmw_1h_special_01) >= 1) || (Npc_HasItems(other,itmw_1h_special_02) >= 1)))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_ferrosanysword_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00");	//Mo¿e mia³bym dla ciebie jakiœ inny miecz.
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,DIALOG_BACK,dia_djg_715_ferros_ferrosanysword_back);
	if(Npc_HasItems(other,itmw_1h_special_01) >= 1)
	{
		Info_AddChoice(dia_djg_715_ferros_ferrosanysword,itmw_1h_special_01.name,dia_djg_715_ferros_ferrosanysword_silverblade);
	};
	if(Npc_HasItems(other,itmw_1h_special_02) >= 1)
	{
		Info_AddChoice(dia_djg_715_ferros_ferrosanysword,itmw_1h_special_02.name,dia_djg_715_ferros_ferrosanysword_oreblade);
	};
};

func void dia_djg_715_ferros_ferrosanysword_back()
{
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};

func void b_ferros_ferrosanysword_give()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00");	//To œwietne ostrze. Robota najwy¿szej klasy.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01");	//Jesteœ pewien, ¿e chcesz mi go tak po prostu oddaæ?
};

func void dia_djg_715_ferros_ferrosanysword_silverblade()
{
	b_ferros_ferrosanysword_give();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"Nie, potrzebujê go.",dia_djg_715_ferros_ferrosanysword_silverblade_no);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"Tak, weŸ go.",dia_djg_715_ferros_ferrosanysword_silverblade_yes);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade()
{
	b_ferros_ferrosanysword_give();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"Nie, potrzebujê go.",dia_djg_715_ferros_ferrosanysword_oreblade_no);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"Tak, weŸ go.",dia_djg_715_ferros_ferrosanysword_oreblade_yes);
};

func void b_ferros_ferrosanysword_yes1()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00");	//Tak, weŸ go.
};

func void b_ferros_ferrosanysword_yes2()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00");	//Dziêki, jestem twoim d³u¿nikiem.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01");	//W zamian poka¿ê ci kilka sztuczek, dziêki którym bêdziesz móg³ lepiej wykorzystaæ sw¹ si³ê i zrêcznoœæ podczas pojedynków.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Feros mo¿e mnie nauczyæ, jak zwiêkszyæ swoj¹ si³ê i zrêcznoœæ.");
};

func void b_ferros_ferrosanysword_no()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//Nie, potrzebujê go.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//Rozumiem.
};

func void dia_djg_715_ferros_ferrosanysword_silverblade_yes()
{
	b_ferros_ferrosanysword_yes1();
	b_giveinvitems(other,self,itmw_1h_special_01,1);
	b_ferros_ferrosanysword_yes2();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};

func void dia_djg_715_ferros_ferrosanysword_silverblade_no()
{
	b_ferros_ferrosanysword_no();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade_yes()
{
	b_ferros_ferrosanysword_yes1();
	b_giveinvitems(other,self,itmw_1h_special_02,1);
	b_ferros_ferrosanysword_yes2();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade_no()
{
	b_ferros_ferrosanysword_no();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};


instance DIA_DJG_715_FERROS_FERROSHISSWORD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_ferroshissword_condition;
	information = dia_djg_715_ferros_ferroshissword_info;
	permanent = FALSE;
	description = "Znalaz³em twój miecz.";
};


func int dia_djg_715_ferros_ferroshissword_condition()
{
	if((MIS_FERROSSWORD == LOG_RUNNING) && (Npc_HasItems(other,itmw_1h_ferrossword_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_ferroshissword_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosHisSword_15_00");	//Znalaz³em twój miecz.
	b_giveinvitems(other,self,itmw_1h_ferrossword_mis,1);
	b_ferros_ferrosanysword_yes2();
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};


instance DIA_FERROS_TEACH(C_INFO)
{
	npc = djg_715_ferros;
	nr = 1;
	condition = dia_ferros_teach_condition;
	information = dia_ferros_teach_info;
	permanent = TRUE;
	description = "Poka¿ mi, jak mogê udoskonaliæ swoje umiejêtnoœci.";
};


func int dia_ferros_teach_condition()
{
	if(MIS_FERROSSWORD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ferros_teach_info()
{
	AI_Output(other,self,"DIA_Ferros_Teach_15_00");	//Poka¿ mi, jak mogê udoskonaliæ swoje umiejêtnoœci.
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_01");	//Po tych atakach orków mam dosyæ. Szczêœcie, ¿e w ogóle jeszcze ¿yjê.
	}
	else
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_02");	//Dobry wojownik musi umieæ przekazaæ broni czêœæ swojej energii.
		Info_ClearChoices(dia_ferros_teach);
		Info_AddChoice(dia_ferros_teach,DIALOG_BACK,dia_ferros_teach_back);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ferros_teach_str_1);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ferros_teach_str_5);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ferros_teach_dex_1);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ferros_teach_dex_5);
	};
};

func void dia_ferros_teach_back()
{
	Info_ClearChoices(dia_ferros_teach);
};

func void dia_ferros_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ferros_teach_str_1);
};

func void dia_ferros_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ferros_teach_str_5);
};

func void dia_ferros_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ferros_teach_dex_1);
};

func void dia_ferros_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ferros_teach_dex_5);
};


instance DIA_FERROS_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 5;
	condition = dia_ferros_alldragonsdead_condition;
	information = dia_ferros_alldragonsdead_info;
	permanent = FALSE;
	description = "Wszystkie smoki nie ¿yj¹.";
};


func int dia_ferros_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_ferros_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Ferros_AllDragonsDead_15_00");	//Wszystkie smoki s¹ martwe.
	AI_Output(self,other,"DIA_Ferros_AllDragonsDead_01_01");	//Doskonale! Gdybyœmy mieli wiêcej ludzi takich jak ty, sprawy prawdopodobnie nigdy nie zasz³yby tak daleko.
};


instance DIA_FERROS_PICKPOCKET(C_INFO)
{
	npc = djg_715_ferros;
	nr = 900;
	condition = dia_ferros_pickpocket_condition;
	information = dia_ferros_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_ferros_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_ferros_pickpocket_info()
{
	Info_ClearChoices(dia_ferros_pickpocket);
	Info_AddChoice(dia_ferros_pickpocket,DIALOG_BACK,dia_ferros_pickpocket_back);
	Info_AddChoice(dia_ferros_pickpocket,DIALOG_PICKPOCKET,dia_ferros_pickpocket_doit);
};

func void dia_ferros_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ferros_pickpocket);
};

func void dia_ferros_pickpocket_back()
{
	Info_ClearChoices(dia_ferros_pickpocket);
};

