
instance DIA_ADDON_BLOODWYN_EXIT(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 999;
	condition = dia_addon_bloodwyn_exit_condition;
	information = dia_addon_bloodwyn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bloodwyn_exit_condition()
{
	return TRUE;
};

func void dia_addon_bloodwyn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BLOODWYN_PICKPOCKET(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 900;
	condition = dia_addon_bloodwyn_pickpocket_condition;
	information = dia_addon_bloodwyn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_bloodwyn_pickpocket_condition()
{
	return c_beklauen(90,250);
};

func void dia_addon_bloodwyn_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bloodwyn_pickpocket);
	Info_AddChoice(dia_addon_bloodwyn_pickpocket,DIALOG_BACK,dia_addon_bloodwyn_pickpocket_back);
	Info_AddChoice(dia_addon_bloodwyn_pickpocket,DIALOG_PICKPOCKET,dia_addon_bloodwyn_pickpocket_doit);
};

func void dia_addon_bloodwyn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bloodwyn_pickpocket);
};

func void dia_addon_bloodwyn_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bloodwyn_pickpocket);
};


instance DIA_ADDON_BLOODWYN_DEAD(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 2;
	condition = dia_addon_bloodwyn_dead_condition;
	information = dia_addon_bloodwyn_dead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bloodwyn_dead_condition()
{
	if(Npc_GetDistToWP(self,"BL_RAVEN_09") <= 1000)
	{
		return TRUE;
	};
};

func void dia_addon_bloodwyn_dead_info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_00");	//Hej, jak siê tutaj dosta³eœ?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Dead_15_01");	//Przez wejœcie.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_02");	//¯artujesz sobie? NIENAWIDZÊ ¿artów.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void bloodwyn_choices_1()
{
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"A ju¿ myœla³em, ¿e ciê mam.",dia_addon_bloodwyn_wait_good1);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Wszystko siê koñczy.",dia_addon_bloodwyn_wait_bad1);
};

func void bloodwyn_choices_2()
{
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Wydaje ci siê, ¿e kto jest odpowiedzialny za upadek bariery?",dia_addon_bloodwyn_wait_good2);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Ty i wielu innych...",dia_addon_bloodwyn_wait_bad2);
};

func void bloodwyn_choices_3()
{
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Nie s¹dzê, ¿eby mia³ czas na staranne wybieranie...",dia_addon_bloodwyn_wait_good3);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Tak, to pewnie by³ jego najwiêkszy b³¹d....",dia_addon_bloodwyn_wait_bad3);
};


instance DIA_ADDON_BLOODWYN_WAIT(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 2;
	condition = dia_addon_bloodwyn_wait_condition;
	information = dia_addon_bloodwyn_wait_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bloodwyn_wait_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MINECRAWLER_KILLED >= 9))
	{
		return TRUE;
	};
};

func void dia_addon_bloodwyn_wait_info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_00");	//Zabi³eœ pe³zacze? Dobrze, ja zajmê siê reszt¹. Zje¿d¿aj.
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_01");	//Nie tak szybko.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_02");	//Jeszcze tu jesteœ?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_03");	//Musimy o czymœ porozmawiaæ.
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Szukam Kruka.",dia_addon_bloodwyn_wait_raven);
};

func void dia_addon_bloodwyn_wait_raven()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_00");	//Szukam Kruka.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_01");	//Taak. A co Kruk mo¿e chcieæ od CIEBIE... Zaraz... TY jesteœ... To TY?!
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_02");	//To ty jesteœ tym bydlakiem, którego szukamy. Co tu, u diab³a, robisz? Ju¿ dawno powinieneœ gryŸæ ziemiê!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_03");	//S³ysza³em to ju¿ nieraz.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_04");	//Nie uda³o siê ¿adnemu z tamtych nierobów... Ale ko³o mnie nie przejdziesz. Tu koñczy siê twoja podró¿!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_05");	//Jak ju¿ wspomina³em, szukam Kruka. Ty siê dla mnie nie liczysz.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_06");	//Zabijê ciê - wygra³em ka¿d¹ walkê!
	bloodwyn_choices_1();
};

func void dia_addon_bloodwyn_wait_fight()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00");	//Doœæ tego gadania. Poka¿, co umiesz.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01");	//I tak siê spóŸni³eœ. Kruk w³aœnie przygotowuje siê do otwarcia œwi¹tyni - giñ, robaku!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void bloodwyn_lach()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Lach_04_00");	//HAHAHA - I tak wygram!
};

func void bloodwyn_wut()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wut_04_00");	//Aaagh! Ty psie!
	self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] - 5;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
};

func void bloodwyn_next_1()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_2_04_00");	//Przetrwa³em upadek bariery bez najmniejszego zadrapania!
};

func void bloodwyn_next_2()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_3_04_00");	//Nie mo¿esz mnie pokonaæ! Jestem najbardziej zaufanym towarzyszem Kruka! Jego praw¹ rêk¹!
};

func void dia_addon_bloodwyn_wait_good1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00");	//A ju¿ myœla³em, ¿e ciê mam.
	bloodwyn_wut();
	bloodwyn_next_1();
	bloodwyn_choices_2();
};

func void dia_addon_bloodwyn_wait_bad1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00");	//Wszystko siê koñczy.
	bloodwyn_lach();
	bloodwyn_next_1();
	bloodwyn_choices_2();
};

func void dia_addon_bloodwyn_wait_good2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00");	//Wydaje ci siê, ¿e kto jest odpowiedzialny za upadek bariery?
	bloodwyn_wut();
	bloodwyn_next_2();
	bloodwyn_choices_3();
};

func void dia_addon_bloodwyn_wait_bad2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00");	//Ty i wielu innych...
	bloodwyn_lach();
	bloodwyn_next_2();
	bloodwyn_choices_3();
};

func void dia_addon_bloodwyn_wait_good3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00");	//Nie s¹dzê, ¿eby mia³ czas na staranne wybieranie...
	bloodwyn_wut();
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
};

func void dia_addon_bloodwyn_wait_bad3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00");	//Tak, to pewnie by³ jego najwiêkszy b³¹d....
	bloodwyn_wut();
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
};

