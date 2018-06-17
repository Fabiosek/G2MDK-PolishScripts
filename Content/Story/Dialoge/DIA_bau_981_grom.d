
instance DIA_GROM_EXIT(C_INFO)
{
	npc = bau_981_grom;
	nr = 999;
	condition = dia_grom_exit_condition;
	information = dia_grom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_grom_exit_condition()
{
	return TRUE;
};

func void dia_grom_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GROM_HALLO(C_INFO)
{
	npc = bau_981_grom;
	nr = 3;
	condition = dia_grom_hallo_condition;
	information = dia_grom_hallo_info;
	description = "Wszystko w porz¹dku?";
};


func int dia_grom_hallo_condition()
{
	return TRUE;
};

func void dia_grom_hallo_info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Grom_HALLO_08_01");	//Ach, witaj nieznajomy wêdrowcze. Jestem trochê zajêty, wiêc lepiej mów szybko, czego chcesz.
	Info_ClearChoices(dia_grom_hallo);
	Info_AddChoice(dia_grom_hallo,"Czy s¹ tutaj jakieœ interesuj¹ce rzeczy?",dia_grom_hallo_waszusehen);
	Info_AddChoice(dia_grom_hallo,"Co tu porabiasz?",dia_grom_hallo_was);
};

func void dia_grom_hallo_waszusehen()
{
	AI_Output(other,self,"DIA_Grom_HALLO_waszusehen_15_00");	//Jest tu coœ interesuj¹cego?
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_01");	//Interesuj¹cego, powiadasz... Tak, interesuj¹cy to dobre s³owo. Jeœli wejdziesz nieco g³êbiej w te lasy, mo¿esz mieæ bardzo niemi³e spotkanie.
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_02");	//Mieszkaj¹ tam kud³ate bestie potê¿nej postury i wzrostu. Wiêc jeœli nie czujesz siê na si³ach, ¿eby je pokonaæ, lepiej tam nie idŸ.
};

func void dia_grom_hallo_was()
{
	AI_Output(other,self,"DIA_Grom_HALLO_was_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Grom_HALLO_was_08_01");	//Wszystko to, czym zwykle zajmuj¹ siê myœliwi i drwale.
	Info_AddChoice(dia_grom_hallo,DIALOG_BACK,dia_grom_hallo_back);
};

func void dia_grom_hallo_back()
{
	Info_ClearChoices(dia_grom_hallo);
};


instance DIA_GROM_ASKTEACHER(C_INFO)
{
	npc = bau_981_grom;
	nr = 10;
	condition = dia_grom_askteacher_condition;
	information = dia_grom_askteacher_info;
	description = "Mo¿esz nauczyæ mnie czegoœ o polowaniu?";
};


func int dia_grom_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_grom_hallo))
	{
		return TRUE;
	};
};

func void dia_grom_askteacher_info()
{
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");	//Mo¿esz mnie nauczyæ czegoœ o polowaniu?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");	//Jasne. Ale najpierw przynieœ mi coœ normalnego do jedzenia. Umieram tu z g³odu.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");	//Podzielê siê z tob¹ swoj¹ wiedz¹, jeœli dostanê butelkê mleka, bochenek chleba i kawa³ek t³ustej szynki.
	Log_CreateTopic(TOPIC_GROMASKTEACHER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GROMASKTEACHER,LOG_RUNNING);
	b_logentry(TOPIC_GROMASKTEACHER,"Myœliwy Grom nauczy mnie wszystkiego, co wie, jeœli przyniosê mu butelkê mleka, bochenek chleba i kawa³ szynki.");
};


instance DIA_GROM_PAYTEACHER(C_INFO)
{
	npc = bau_981_grom;
	nr = 11;
	condition = dia_grom_payteacher_condition;
	information = dia_grom_payteacher_info;
	description = "Oto jedzenie.";
};


func int dia_grom_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_grom_askteacher) && Npc_HasItems(other,itfo_milk) && Npc_HasItems(other,itfo_bread) && Npc_HasItems(other,itfo_bacon))
	{
		return TRUE;
	};
};

func void dia_grom_payteacher_info()
{
	b_giveinvitems(other,self,itfo_milk,1);
	b_giveinvitems(other,self,itfo_bread,1);
	b_giveinvitems(other,self,itfo_bacon,1);
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");	//Oto jedzenie.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");	//Doskonale. Co teraz?
	GROM_TEACHANIMALTROPHY = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GROM_TEACHHUNTING(C_INFO)
{
	npc = bau_981_grom;
	nr = 12;
	condition = dia_grom_teachhunting_condition;
	information = dia_grom_teachhunting_info;
	permanent = TRUE;
	description = "Naucz mnie, jak powinno siê polowaæ.";
};


func int dia_grom_teachhunting_condition()
{
	if(GROM_TEACHANIMALTROPHY == TRUE)
	{
		return TRUE;
	};
};

func void dia_grom_teachhunting_info()
{
	AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");	//Naucz mnie, jak powinno siê polowaæ.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//Czego chcia³byœ siê nauczyæ?
		Info_AddChoice(dia_grom_teachhunting,DIALOG_BACK,dia_grom_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Obedrzyj ze skóry",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_grom_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Usuñ k³y",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_grom_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Usuñ serce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_HEART)),dia_grom_teachhunting_heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Usuñ ¿uwaczkê",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_grom_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Róg cieniostwora",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_grom_teachhunting_shadowhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//Nie mogê ciê nauczyæ niczego, czego byœ ju¿ nie wiedzia³.
	};
};

func void dia_grom_teachhunting_back()
{
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");	//Natnij nogi na tyle g³êboko, ¿ebyœ móg³ bez problemu zdj¹æ ze zwierzêcia skórê. Zaczynaj zawsze od przodu.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");	//Usuwaj¹c zêby, musisz bardzo uwa¿aæ, ¿eby siê nie po³ama³y.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_heart()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");	//Serce zwierzêcia mo¿esz usun¹æ, wycinaj¹c je no¿em z klatki piersiowej. Op³aca siê to robiæ w przypadku niektórych niezwyk³ych lub magicznych zwierz¹t.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");	//¯uwaczki pe³zacza lub polnej bestii mo¿esz usun¹æ, u¿ywaj¹c do tego celu jakiejœ wytrzyma³ej, metalowej dŸwigni. S¹ bardzo mocno przytwierdzone do czaszki.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_shadowhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00");	//Aby wyrwaæ róg cieniostwora, musisz zaprzeæ siê o czaszkê i ci¹gn¹æ z ca³ej si³y, pomagaj¹c sobie przy tym ostrym no¿em.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};


instance DIA_GROM_PICKPOCKET(C_INFO)
{
	npc = bau_981_grom;
	nr = 900;
	condition = dia_grom_pickpocket_condition;
	information = dia_grom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_grom_pickpocket_condition()
{
	return c_beklauen(75,40);
};

func void dia_grom_pickpocket_info()
{
	Info_ClearChoices(dia_grom_pickpocket);
	Info_AddChoice(dia_grom_pickpocket,DIALOG_BACK,dia_grom_pickpocket_back);
	Info_AddChoice(dia_grom_pickpocket,DIALOG_PICKPOCKET,dia_grom_pickpocket_doit);
};

func void dia_grom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grom_pickpocket);
};

func void dia_grom_pickpocket_back()
{
	Info_ClearChoices(dia_grom_pickpocket);
};

