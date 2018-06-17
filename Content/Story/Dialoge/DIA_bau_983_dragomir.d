
instance DIA_DRAGOMIR_EXIT(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 999;
	condition = dia_dragomir_exit_condition;
	information = dia_dragomir_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragomir_exit_condition()
{
	return TRUE;
};

func void dia_dragomir_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAGOMIR_HELLO(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 1;
	condition = dia_dragomir_hello_condition;
	information = dia_dragomir_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragomir_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_dragomir_hello_info()
{
	AI_Output(self,other,"DIA_Dragomir_Hello_12_00");	//Zapuszczasz siê tak daleko od domu?
	AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//Tam trzeba mieæ oczy z ty³u g³owy, szczególnie jeœli podró¿ujesz sam.
};


instance DIA_DRAGOMIR_OUTHERE(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_outhere_condition;
	information = dia_dragomir_outhere_info;
	permanent = FALSE;
	description = "Co tutaj robisz?";
};


func int dia_dragomir_outhere_condition()
{
	return TRUE;
};

func void dia_dragomir_outhere_info()
{
	AI_Output(other,self,"DIA_Dragomir_OutHere_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_01");	//No có¿, gospoda jest dla mnie za droga, dlatego zamieszka³em tutaj.
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_02");	//Wygl¹da na to, ¿e poprzedni mieszkañcy tego miejsca ju¿ go nie potrzebuj¹.
};


instance DIA_DRAGOMIR_SETTLERS(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_settlers_condition;
	information = dia_dragomir_settlers_info;
	permanent = FALSE;
	description = "Kto mieszka³ w tym obozie?";
};


func int dia_dragomir_settlers_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_outhere))
	{
		return TRUE;
	};
};

func void dia_dragomir_settlers_info()
{
	AI_Output(other,self,"DIA_Dragomir_Settlers_15_00");	//Kto mieszka³ w tym obozie?
	AI_Output(self,other,"DIA_Dragomir_Settlers_12_01");	//Nie mam pojêcia, pewnie jacyœ myœliwi. Podejrzewam, ¿e zrobi³o siê tu dla nich zbyt niebezpiecznie.
};


instance DIA_DRAGOMIR_DANGEROUS(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_dangerous_condition;
	information = dia_dragomir_dangerous_info;
	permanent = FALSE;
	description = "A czy tutaj nie JEST zbyt niebezpiecznie?";
};


func int dia_dragomir_dangerous_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_outhere))
	{
		return TRUE;
	};
};

func void dia_dragomir_dangerous_info()
{
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//A czy tutaj nie JEST zbyt niebezpiecznie?
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//Nie, jeœli potrafisz siê broniæ. Moja kusza wiele razy sprawdzi³a siê w walce.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//Wygl¹da niepozornie.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//Zapewniam ciê, to œmiercionoœna broñ w rêkach kogoœ, kto umie siê ni¹ pos³ugiwaæ. Kiedyœ mia³em zreszt¹ wiêksz¹, ale j¹ straci³em.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//Podczas wyprawy w góry zapuœci³em siê zbyt g³êboko na pó³noc. Znajduje siê tam wielki kamienny kr¹g z o³tarzem ofiarnym.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//Polowa³em tam na œcierwojady, kiedy z lasu wy³oni³a siê nagle grupa tych wstrêtnych o¿ywieñców i zaatakowa³a mnie.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//Mog³em jedynie ratowaæ siê ucieczk¹.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//Kiedy bieg³em, moja ulubiona kusza zeœliznê³a mi siê z ramienia. Z pewnoœci¹ wci¹¿ tam le¿y, gdzieœ w okolicach tego kamiennego krêgu na pó³nocy.
	Log_CreateTopic(TOPIC_DRAGOMIRSARMBRUST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRAGOMIRSARMBRUST,LOG_RUNNING);
	b_logentry(TOPIC_DRAGOMIRSARMBRUST,"Dragomir zostawi³ swoj¹ kuszê w kamiennym krêgu w wysokich górach na pó³nocy.");
	MIS_DRAGOMIRSARMBRUST = LOG_RUNNING;
};


instance DIA_DRAGOMIR_ARMBRUST(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_armbrust_condition;
	information = dia_dragomir_armbrust_info;
	permanent = FALSE;
	description = "Proszê. Znalaz³em twoj¹ kuszê.";
};


func int dia_dragomir_armbrust_condition()
{
	if((MIS_DRAGOMIRSARMBRUST == LOG_RUNNING) && Npc_HasItems(other,itrw_dragomirsarmbrust_mis))
	{
		return TRUE;
	};
};

func void dia_dragomir_armbrust_info()
{
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//Proszê. Znalaz³em twoj¹ kuszê.
	b_giveinvitems(other,self,itrw_dragomirsarmbrust_mis,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//Rzeczywiœcie, to nale¿y do mnie! Nie powiesz mi chyba, ¿e uda³eœ siê do kamiennego krêgu?!
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//Oczywiœcie!
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//To by³o bardzo nierozwa¿ne z twojej strony. Mimo to dziêkujê.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_04");	//Oczywiœcie, odp³acê ci siê za tê przys³ugê. Mam nadziejê, ¿e to wystarczy.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MIS_DRAGOMIRSARMBRUST = LOG_SUCCESS;
	b_giveplayerxp(XP_DRAGOMIRSARMBRUST);
};


var int dragomir_teachplayer;
const int DRAGOMIR_TEACHINGCOST = 150;

instance DIA_DRAGOMIR_LEARN(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_learn_condition;
	information = dia_dragomir_learn_info;
	permanent = TRUE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_dragomir_learn_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_dangerous) && (DRAGOMIR_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_learn_info()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	if(other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_01");	//Zanim czegokolwiek ciê nauczê, bêdziesz musia³ popracowaæ nad swoj¹ zrêcznoœci¹.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//Jeœli jesteœ w stanie zap³aciæ za naukê. Jak ju¿ mówi³em, w obecnej chwili krucho u mnie z gotówk¹.
		AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//Ile sobie ¿yczysz?
		b_say_gold(self,other,DRAGOMIR_TEACHINGCOST);
		Info_ClearChoices(dia_dragomir_learn);
		Info_AddChoice(dia_dragomir_learn,"Mo¿e póŸniej.",dia_dragomir_learn_later);
		if(Npc_HasItems(other,itmi_gold) >= DRAGOMIR_TEACHINGCOST)
		{
			Info_AddChoice(dia_dragomir_learn,"Oto twoje z³oto.",dia_dragomir_learn_here);
		};
	};
};

func void dia_dragomir_learn_later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//Mo¿e póŸniej.
	Info_ClearChoices(dia_dragomir_learn);
};

func void dia_dragomir_learn_here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_00");	//Oto twoje z³oto.
	b_giveinvitems(other,self,itmi_gold,DRAGOMIR_TEACHINGCOST);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//Dobrze, jeœli o mnie chodzi, mo¿emy zaczynaæ natychmiast.
	DRAGOMIR_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_dragomir_learn);
};


var int dia_dragomir_teach_permanent;

instance DIA_DRAGOMIR_TEACH(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_teach_condition;
	information = dia_dragomir_teach_info;
	permanent = TRUE;
	description = "Naucz mnie czegoœ.";
};


func int dia_dragomir_teach_condition()
{
	if((DRAGOMIR_TEACHPLAYER == TRUE) && (DIA_DRAGOMIR_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_teach_info()
{
	AI_Output(other,self,"DIA_Dragomir_Teach_15_00");	//Naucz mnie czegoœ.
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_1h_5);
};

func void dia_dragomir_teach_back()
{
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//Nie potrafiê ciê ju¿ niczego nauczyæ. Czas, abyœ poszuka³ sobie innego nauczyciela.
		DIA_DRAGOMIR_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_dragomir_teach);
};

func void dia_dragomir_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_1h_5);
};

func void dia_dragomir_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_1h_5);
};


instance DIA_DRAGOMIR_PICKPOCKET(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 900;
	condition = dia_dragomir_pickpocket_condition;
	information = dia_dragomir_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_dragomir_pickpocket_condition()
{
	return c_beklauen(47,70);
};

func void dia_dragomir_pickpocket_info()
{
	Info_ClearChoices(dia_dragomir_pickpocket);
	Info_AddChoice(dia_dragomir_pickpocket,DIALOG_BACK,dia_dragomir_pickpocket_back);
	Info_AddChoice(dia_dragomir_pickpocket,DIALOG_PICKPOCKET,dia_dragomir_pickpocket_doit);
};

func void dia_dragomir_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dragomir_pickpocket);
};

func void dia_dragomir_pickpocket_back()
{
	Info_ClearChoices(dia_dragomir_pickpocket);
};

