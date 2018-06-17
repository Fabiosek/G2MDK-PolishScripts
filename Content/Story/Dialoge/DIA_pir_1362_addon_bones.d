
instance DIA_ADDON_BONES_EXIT(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 999;
	condition = dia_addon_bones_exit_condition;
	information = dia_addon_bones_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bones_exit_condition()
{
	return TRUE;
};

func void dia_addon_bones_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BONES_PICKPOCKET(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 900;
	condition = dia_addon_bones_pickpocket_condition;
	information = dia_addon_bones_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_bones_pickpocket_condition()
{
	return c_beklauen(75,104);
};

func void dia_addon_bones_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bones_pickpocket);
	Info_AddChoice(dia_addon_bones_pickpocket,DIALOG_BACK,dia_addon_bones_pickpocket_back);
	Info_AddChoice(dia_addon_bones_pickpocket,DIALOG_PICKPOCKET,dia_addon_bones_pickpocket_doit);
};

func void dia_addon_bones_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bones_pickpocket);
};

func void dia_addon_bones_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bones_pickpocket);
};

func void b_addon_bones_keinezeit()
{
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_01");	//Przepraszam, ale nie mam czasu.
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_02");	//Muszê trenowaæ.
};


instance DIA_ADDON_BONES_ANHEUERN(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 1;
	condition = dia_addon_bones_anheuern_condition;
	information = dia_addon_bones_anheuern_info;
	description = "Kanion czeka.";
};


func int dia_addon_bones_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_bones_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Anheuern_15_01");	//Kanion czeka...
	b_addon_bones_keinezeit();
};


instance DIA_ADDON_BONES_HELLO(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_hello_condition;
	information = dia_addon_bones_hello_info;
	permanent = FALSE;
	description = "Co s³ychaæ?";
};


func int dia_addon_bones_hello_condition()
{
	return TRUE;
};

func void dia_addon_bones_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Hello_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Addon_Bones_Hello_01_01");	//Nie narzekam. Co prawda trochê siê nudzê, ale przynajmniej nie muszê pracowaæ.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_01");	//Czekam na nowe zadanie od Grega.
	AI_Output(other,self,"DIA_Addon_Bones_Work_15_02");	//Jakie zadanie?
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_03");	//Nie wolno mi o tym mówiæ.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_04");	//Bez urazy, ale ciê¿ko pracowa³em, by je dostaæ, i nie mam zamiaru go straciæ.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BONES_TRAIN(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_train_condition;
	information = dia_addon_bones_train_info;
	permanent = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_addon_bones_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bones_hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bones_train_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Train_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	b_addon_bones_keinezeit();
};


instance DIA_ADDON_BONES_TEACHER(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_teacher_condition;
	information = dia_addon_bones_teacher_info;
	permanent = FALSE;
	description = "Kto mo¿e mnie czegoœ nauczyæ?";
};


func int dia_addon_bones_teacher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bones_train) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bones_teacher_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_00");	//Kto mo¿e mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_04");	//Henry i Morgan dowodz¹ grupami aborda¿owymi.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_05");	//Mog¹ ciê podszkoliæ w walce wrêcz.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_07");	//Ludzie Henry'ego æwicz¹ siê w walce broni¹ dwurêczn¹.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_08");	//Morgan nad si³ê takiego orê¿a przedk³ada szybkoœæ broni jednorêcznej.
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_09");	//Kto jeszcze?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_10");	//Nie mam pojêcia. Nigdy nie interesowa³em siê innymi rzeczami.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_11");	//Wydaje mi siê jednak, ¿e Jack Aligator i Samuel mog¹ ci pokazaæ jak¹œ przydatn¹ sztuczkê.
	KNOWS_HENRYSENTERTRUPP = TRUE;
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_HENRYTEACH);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_MORGANTEACH);
};


instance DIA_ADDON_BONES_FRANCIS(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 3;
	condition = dia_addon_bones_francis_condition;
	information = dia_addon_bones_francis_info;
	permanent = FALSE;
	description = "Co mo¿esz mi powiedzieæ o Francisie?";
};


func int dia_addon_bones_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_bones_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Francis_15_00");	//Co mo¿esz mi powiedzieæ o Francisie?
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_03");	//A co tu mówiæ? Rozejrzyj siê. Jedynymi ludŸmi, którzy cokolwiek robi¹, s¹ ch³opaki Henry'ego.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_04");	//Morgan ca³ymi dniami wyleguje siê w ³ó¿ku albo chleje.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_05");	//Nie przejmuje siê Gregiem. Komu siê to nie podoba, dostaje kopniaka w ty³ek.
};


instance DIA_ADDON_BONES_WANTARMOR(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 2;
	condition = dia_addon_bones_wantarmor_condition;
	information = dia_addon_bones_wantarmor_info;
	permanent = TRUE;
	description = "Daj mi pancerz bandytów.";
};


func int dia_addon_bones_wantarmor_condition()
{
	if((GREG_GAVEARMORTOBONES == TRUE) && (MIS_GREG_SCOUTBANDITS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_bones_wantarmor_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_WantArmor_15_00");	//Daj mi pancerz bandytów.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_01");	//Wygl¹dam na wariata? Za coœ takiego Greg urwa³by mi g³owê!
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_02");	//Nawet specjalnie zaznaczy³, ¿ebym nie dawa³ nikomu tego pancerza bez jego wyraŸnego rozkazu.
	if(GREGISBACK == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_03");	//Nie mogê ci go daæ. Na pewno nie teraz, gdy Greg ju¿ wróci³.
	};
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Bones nie da mi zbroi bez zgody Grega.");
};


instance DIA_ADDON_BONES_GIVEARMOR(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 2;
	condition = dia_addon_bones_givearmor_condition;
	information = dia_addon_bones_givearmor_info;
	permanent = FALSE;
	description = "Greg kaza³ wydaæ mi pancerz.";
};


func int dia_addon_bones_givearmor_condition()
{
	if(MIS_GREG_SCOUTBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_bones_givearmor_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_00");	//Greg kaza³ wydaæ mi pancerz.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_01");	//To rozkaz samego kapitana? A ju¿ myœla³em, ¿e sam bêdê musia³ wykonaæ to zadanie.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_02");	//Szpiegowanie bandytów to samobójstwo.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_03");	//Wolê ju¿ najciê¿sz¹ robotê u Grega.
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_04");	//Pancerz.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_05");	//A, tak. Oto on.
	b_giveinvitems(self,other,itar_bdt_m,1);
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_06");	//Uwa¿aj na siebie. I lepiej nie rób g³upich ¿artów pod nosem tych bandziorów.
	self.flags = 0;
	pir_1320_addon_greg.flags = 0;
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Rozkaz Grega potrafi czyniæ cuda. Mam zbrojê bandytów!");
	b_giveplayerxp(XP_BONES_GETBDTARMOR);
};

