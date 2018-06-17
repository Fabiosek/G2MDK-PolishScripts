
var int brahim_showedmaps;

func void b_brahimnewmaps()
{
	if(BRAHIM_SHOWEDMAPS == TRUE)
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//PrzyjdŸ do mnie póŸniej. Na pewno bêdê mia³ dla ciebie coœ nowego.
	};
};


instance DIA_BRAHIM_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_exit_condition;
	information = dia_brahim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brahim_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_brahim_exit_info()
{
	b_brahimnewmaps();
	AI_StopProcessInfos(self);
};


instance DIA_BRAHIM_PICKPOCKET(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 900;
	condition = dia_brahim_pickpocket_condition;
	information = dia_brahim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_brahim_pickpocket_condition()
{
	return c_beklauen(15,15);
};

func void dia_brahim_pickpocket_info()
{
	Info_ClearChoices(dia_brahim_pickpocket);
	Info_AddChoice(dia_brahim_pickpocket,DIALOG_BACK,dia_brahim_pickpocket_back);
	Info_AddChoice(dia_brahim_pickpocket,DIALOG_PICKPOCKET,dia_brahim_pickpocket_doit);
};

func void dia_brahim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brahim_pickpocket);
};

func void dia_brahim_pickpocket_back()
{
	Info_ClearChoices(dia_brahim_pickpocket);
};


instance DIA_BRAHIM_GREET(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 2;
	condition = dia_brahim_greet_condition;
	information = dia_brahim_greet_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_brahim_greet_condition()
{
	return TRUE;
};

func void dia_brahim_greet_info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//Nazywam siê Brahim. Zajmujê siê kreœleniem i sprzeda¿¹ map.
	AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//Skoro jesteœ tu od niedawna, to mo¿e potrzebujesz planu miasta.
	AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//Nie jest drogi - a na pewno bardzo ci siê przyda, zanim poznasz okolicê.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Brahim sprzedaje mapy w dzielnicy portowej.");
};


instance DIA_ADDON_BRAHIM_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 5;
	condition = dia_addon_brahim_missingpeople_condition;
	information = dia_addon_brahim_missingpeople_info;
	description = "To prawda, ¿e mieszkañcy miasta znikaj¹ bez œladu?";
};


func int dia_addon_brahim_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_brahim_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Brahim_MissingPeople_15_00");	//To prawda, ¿e mieszkañcy miasta znikaj¹ bez œladu?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_01");	//Taa, obi³o mi siê o uszy. Nie wiem jednak, czy to prawda.
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_02");	//Rozejrzyj siê po okolicy - chcia³byœ tu spêdziæ ca³e ¿ycie?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_03");	//Nic dziwnego, ¿e ludzie siê wynosz¹.
};


instance DIA_BRAHIM_BUY(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 9;
	condition = dia_brahim_buy_condition;
	information = dia_brahim_buy_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka¿ mi swoje mapy.";
};


func int dia_brahim_buy_condition()
{
	if(Npc_KnowsInfo(hero,dia_brahim_greet))
	{
		return TRUE;
	};
};

func void dia_brahim_buy_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//Poka¿ mi swoje mapy.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//W tym swoim klasztorze nie znajdziesz lepszych.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//Dobre mapy to podstawa, szczególnie dla ludzi, którzy przybyli z kontynentu, panie Paladynie.
	};
	BRAHIM_SHOWEDMAPS = TRUE;
};


instance DIA_BRAHIM_KAP3_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_kap3_exit_condition;
	information = dia_brahim_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brahim_kap3_exit_condition()
{
	if((KAPITEL >= 3) && (Npc_KnowsInfo(other,dia_brahim_kap3_first_exit) || (Npc_HasItems(other,itwr_shatteredgolem_mis) == 0)))
	{
		return TRUE;
	};
};

func void dia_brahim_kap3_exit_info()
{
	if(KAPITEL <= 4)
	{
		b_brahimnewmaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_BRAHIM_KAP3_FIRST_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_kap3_first_exit_condition;
	information = dia_brahim_kap3_first_exit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_brahim_kap3_first_exit_condition()
{
	if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_brahim_kap3_first_exit_info()
{
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//Wiedzia³em, ¿e to ciê zainteresuje.
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//Co to jest?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//Có¿, ta stara mapa, któr¹ w³aœnie kupi³eœ?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//Znam takich jak ty. Nie przepuœcicie ¿adnej szansy na znalezienie bogactwa.
	Info_ClearChoices(dia_brahim_kap3_first_exit);
	Info_AddChoice(dia_brahim_kap3_first_exit,DIALOG_BACK,dia_brahim_kap3_first_exit_back);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Sk¹d siê wzi¹³ ten dokument?",dia_brahim_kap3_first_exit_wheregetit);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Co to za dokument?",dia_brahim_kap3_first_exit_content);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Dlaczego nie zatrzymasz jej dla siebie?",dia_brahim_kap3_first_exit_keepit);
};

func void dia_brahim_kap3_first_exit_back()
{
	Info_ClearChoices(dia_brahim_kap3_first_exit);
};

func void dia_brahim_kap3_first_exit_wheregetit()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//Sk¹d masz tê mapê?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//Znalaz³em j¹ w stercie staroci, które niedawno kupi³em.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//Sprzedawca musia³ j¹ przeoczyæ.
};

func void dia_brahim_kap3_first_exit_content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//Co to za mapa?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//Wygl¹da na to, ¿e pokazuje, jak dotrzeæ do skarbu.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//A ty wygl¹dasz mi na osobê, która doœæ powa¿nie traktuje takie rzeczy.
};

func void dia_brahim_kap3_first_exit_keepit()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Dlaczego nie zatrzymasz jej dla siebie?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//Jestem ju¿ stary i czasy, kiedy wypuszcza³em siê na dalekie wêdrówki, dawno mam ju¿ za sob¹.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//Zostawiam to m³odszym.
};

