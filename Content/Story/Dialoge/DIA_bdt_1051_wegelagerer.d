
instance DIA_1051_WEGELAGERER_EXIT(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 999;
	condition = dia_1051_wegelagerer_exit_condition;
	information = dia_1051_wegelagerer_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int bdt_1051_wegelagerer_angriff;

func int dia_1051_wegelagerer_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_1051_wegelagerer_question) || (BDT_1051_WEGELAGERER_ANGRIFF == TRUE))
	{
		return TRUE;
	};
};

func void dia_1051_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
	if(BDT_1051_WEGELAGERER_ANGRIFF == TRUE)
	{
		self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		bdt_1052_wegelagerer.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_1051_WEGELAGERER_HELLO(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 4;
	condition = dia_wegelagerer_hello_condition;
	information = dia_wegelagerer_hello_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_wegelagerer_hello_condition()
{
	if(BDT_1051_WEGELAGERER_ANGRIFF == FALSE)
	{
		return TRUE;
	};
};

func void dia_wegelagerer_hello_info()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Hello_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_1051_Wegelagerer_Hello_07_01");	//A co ciê to obchodzi?
};


instance DIA_1051_WEGELAGERER_NOVICE(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 4;
	condition = dia_wegelagerer_novice_condition;
	information = dia_wegelagerer_novice_info;
	permanent = FALSE;
	description = "Szukam nowicjusza.";
};


func int dia_wegelagerer_novice_condition()
{
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE) && (BDT_1051_WEGELAGERER_ANGRIFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_novice_info()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Novice_15_00");	//Szukam nowicjusza.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Novice_07_01");	//To bardzo ciekawe. My te¿ kogoœ szukamy.
	Info_ClearChoices(dia_1051_wegelagerer_question);
	Info_AddChoice(dia_1051_wegelagerer_novice,"Kogo szukasz?",dia_1051_wegelagerer_question_novice_who);
};


instance DIA_1051_WEGELAGERER_QUESTION(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 4;
	condition = dia_wegelagerer_question_condition;
	information = dia_wegelagerer_question_info;
	permanent = FALSE;
	description = "Tak tylko pytam.";
};


func int dia_wegelagerer_question_condition()
{
	if(Npc_KnowsInfo(other,dia_1051_wegelagerer_hello) && (BDT_1051_WEGELAGERER_ANGRIFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_question_info()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_15_00");	//Tak tylko pytam.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_07_01");	//Zrozumia³em. Ale co TY tu robisz?
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_07_02");	//Tak czy inaczej, to nasza droga i nie lubimy, jak nam ktoœ tu przeszkadza.
	Info_ClearChoices(dia_1051_wegelagerer_question);
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		Info_AddChoice(dia_1051_wegelagerer_question,"Szukam nowicjusza.",dia_1051_wegelagerer_question_novice);
	};
	Info_AddChoice(dia_1051_wegelagerer_question,"Nie twój interes.",dia_1051_wegelagerer_question_myconcern);
	Info_AddChoice(dia_1051_wegelagerer_question,"Tylko siê rozgl¹dam.",dia_1051_wegelagerer_question_lookaround);
};

func void dia_1051_wegelagerer_question_novice()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_Novice_15_00");	//Szukam nowicjusza.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_Novice_07_01");	//To bardzo ciekawe. My te¿ kogoœ szukamy.
	Info_ClearChoices(dia_1051_wegelagerer_question);
	Info_AddChoice(dia_1051_wegelagerer_question,"Kogo szukasz?",dia_1051_wegelagerer_question_novice_who);
};

func void dia_1051_wegelagerer_question_novice_who()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_Novice_Who_15_00");	//Tak? A kogo?
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_Novice_Who_07_01");	//Ciebie!
	BDT_1051_WEGELAGERER_ANGRIFF = TRUE;
	Npc_SetRefuseTalk(self,40);
	Info_ClearChoices(dia_1051_wegelagerer_question);
};

func void dia_1051_wegelagerer_question_myconcern()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_MyConcern_15_00");	//Nie twoja sprawa.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_07_01");	//O co ci chodzi? Szukasz k³opotów?
	Info_ClearChoices(dia_1051_wegelagerer_question);
	Info_AddChoice(dia_1051_wegelagerer_question,"Nie, nie przeszkadzajcie sobie. ¿aden k³opot.",dia_1051_wegelagerer_question_myconcern_no);
	Info_AddChoice(dia_1051_wegelagerer_question,"Skoro nalegasz.",dia_1051_wegelagerer_question_myconcern_yes);
};

func void dia_1051_wegelagerer_question_myconcern_no()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_MyConcern_No_15_00");	//Nie, nie przeszkadzajcie sobie. ¯aden k³opot.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_No_07_01");	//Rozumiem. Zapaæka³eœ sobie portki ze strachu. Spadaj.
	AI_StopProcessInfos(self);
};

func void dia_1051_wegelagerer_question_myconcern_yes()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_15_00");	//Skoro nalegasz.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_01");	//He, he, mocny w gêbie.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_02");	//Pora ci j¹ zamkn¹æ.
	BDT_1051_WEGELAGERER_ANGRIFF = TRUE;
	Npc_SetRefuseTalk(self,40);
	Info_ClearChoices(dia_1051_wegelagerer_question);
};

func void dia_1051_wegelagerer_question_lookaround()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_LookAround_15_00");	//Tylko siê rozgl¹dam.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_LookAround_07_01");	//Dobra, ale przestañ nas denerwowaæ.
	AI_StopProcessInfos(self);
};


instance DIA_WEGELAGERER_ANGRIFF(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 2;
	condition = dia_wegelagerer_angriff_condition;
	information = dia_wegelagerer_angriff_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_wegelagerer_angriff_condition()
{
	var C_NPC pal;
	pal = Hlp_GetNpc(bdt_1052_wegelagerer);
	if((Npc_RefuseTalk(self) == FALSE) && ((BDT_1051_WEGELAGERER_ANGRIFF == TRUE) || c_npcisdown(pal)))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_angriff_info()
{
	AI_Output(self,other,"DIA_Wegelagerer_ANGRIFF_07_00");	//No dobra, doigra³eœ siê!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,40);
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	bdt_1052_wegelagerer.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

