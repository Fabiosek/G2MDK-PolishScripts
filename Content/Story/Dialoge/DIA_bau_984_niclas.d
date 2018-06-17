
instance DIA_NICLAS_EXIT(C_INFO)
{
	npc = bau_984_niclas;
	nr = 999;
	condition = dia_niclas_exit_condition;
	information = dia_niclas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_niclas_exit_condition()
{
	return TRUE;
};

func void dia_niclas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NICLAS_HELLO(C_INFO)
{
	npc = bau_984_niclas;
	nr = 1;
	condition = dia_niclas_hello_condition;
	information = dia_niclas_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_niclas_hello_condition()
{
	return TRUE;
};

func void dia_niclas_hello_info()
{
	AI_Output(self,other,"DIA_Niclas_Hello_03_00");	//Ty te¿ uciek³eœ?
	AI_Output(other,self,"DIA_Niclas_Hello_15_01");	//Dlaczego tak uwa¿asz?
	AI_Output(self,other,"DIA_Niclas_Hello_03_02");	//Inaczej po co byœ tu przychodzi³? Przecie¿ tu nic siê nie dzieje.
};


instance DIA_NICLAS_HAVEALOOK(C_INFO)
{
	npc = bau_984_niclas;
	nr = 1;
	condition = dia_niclas_havealook_condition;
	information = dia_niclas_havealook_info;
	permanent = FALSE;
	description = "Chcê siê tylko trochê rozejrzeæ.";
};


func int dia_niclas_havealook_condition()
{
	return TRUE;
};

func void dia_niclas_havealook_info()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_15_00");	//Chcê siê tylko trochê rozejrzeæ.
	AI_Output(self,other,"DIA_Niclas_HaveALook_03_01");	//Proszê bardzo. Mo¿e kawa³ek pieczystego?
	CreateInvItems(self,itfomutton,1);
	Info_ClearChoices(dia_niclas_havealook);
	Info_AddChoice(dia_niclas_havealook,"Nie, dziêkujê.",dia_niclas_havealook_no);
	Info_AddChoice(dia_niclas_havealook,"Chêtnie.",dia_niclas_havealook_yes);
};

func void dia_niclas_havealook_no()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_No_15_00");	//Nie, dziêkujê.
	AI_Output(self,other,"DIA_Niclas_HaveALook_No_03_01");	//Czuj siê jak u siebie. Mam nadzieje, ¿e nie bêdzie ci przeszkadzaæ, jeœli coœ zjem.
	b_useitem(self,itfomutton);
	Info_ClearChoices(dia_niclas_havealook);
};

func void dia_niclas_havealook_yes()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_Yes_15_00");	//Chêtnie.
	AI_Output(self,other,"DIA_Niclas_HaveALook_Yes_03_01");	//Proszê, najprzedniejszy udziec kretoszczura. Wed³ug mojego w³asnego przepisu.
	b_giveinvitems(self,other,itfomutton,1);
	Info_ClearChoices(dia_niclas_havealook);
};


instance DIA_NICLAS_WHYHERE(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_whyhere_condition;
	information = dia_niclas_whyhere_info;
	permanent = FALSE;
	description = "Wiêc co tu w³aœciwie robisz?";
};


func int dia_niclas_whyhere_condition()
{
	return TRUE;
};

func void dia_niclas_whyhere_info()
{
	AI_Output(other,self,"DIA_Niclas_WhyHere_15_00");	//Wiêc co tu w³aœciwie robisz?
	AI_Output(self,other,"DIA_Niclas_WhyHere_03_01");	//Jedynie tutaj odnajdujê spokój. W mieœcie czujê siê zniewolony i zaszczuty.
};


instance DIA_NICLAS_SHOULDNTWORK(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_shouldntwork_condition;
	information = dia_niclas_shouldntwork_info;
	permanent = FALSE;
	description = "Nie musisz pracowaæ?";
};


func int dia_niclas_shouldntwork_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_whyhere))
	{
		return TRUE;
	};
};

func void dia_niclas_shouldntwork_info()
{
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_00");	//Nie musisz pracowaæ?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_01");	//Wszystko, czego potrzebujê, zdobywam sam. Robiê strza³y, a natura dostarcza mi po¿ywienia.
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_02");	//A wiêc jesteœ myœliwym?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_03");	//Mo¿na tak to uj¹æ. Zabijam jednak tylko po to, by mieæ co jeœæ, nie dla pieniêdzy.
};


instance DIA_NICLAS_CANTEACHME(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_canteachme_condition;
	information = dia_niclas_canteachme_info;
	permanent = FALSE;
	description = "Mo¿e móg³byœ mnie czegoœ nauczyæ.";
};


func int dia_niclas_canteachme_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_shouldntwork))
	{
		return TRUE;
	};
};

func void dia_niclas_canteachme_info()
{
	AI_Output(other,self,"DIA_Niclas_CanTeachMe_15_00");	//Mo¿e móg³byœ mnie czegoœ nauczyæ.
	AI_Output(self,other,"DIA_Niclas_CanTeachMe_03_01");	//W³aœciwie, czemu nie. Mogê ci pokazaæ, jak siê pos³ugiwaæ ³ukiem.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Niclas mo¿e mi pokazaæ, jak skuteczniej pos³ugiwaæ siê ³ukiem.");
};


instance DIA_NICLAS_TEACH(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_teach_condition;
	information = dia_niclas_teach_info;
	permanent = TRUE;
	description = "Poka¿ mi proszê, jak siê pos³ugiwaæ ³ukiem.";
};


func int dia_niclas_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_canteachme))
	{
		return TRUE;
	};
};

func void dia_niclas_teach_info()
{
	AI_Output(other,self,"DIA_Niclas_Teach_15_00");	//Poka¿ mi proszê, jak siê pos³ugiwaæ ³ukiem.
	if(other.hitchance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01");	//Nauczy³em ciê ju¿ wszystkiego, co sam umia³em. Musisz sobie poszukaæ innego nauczyciela.
	}
	else
	{
		Info_ClearChoices(dia_niclas_teach);
		Info_AddChoice(dia_niclas_teach,DIALOG_BACK,dia_niclas_teach_back);
		Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_niclas_teach_bow_1);
		Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_niclas_teach_bow_5);
	};
};

func void dia_niclas_teach_back()
{
	if(other.hitchance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_00");	//Niczego wiêcej nie mogê ciê ju¿ nauczyæ.
	};
	Info_ClearChoices(dia_niclas_teach);
};

func void dia_niclas_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(dia_niclas_teach);
	Info_AddChoice(dia_niclas_teach,DIALOG_BACK,dia_niclas_teach_back);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_niclas_teach_bow_1);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_niclas_teach_bow_5);
};

func void dia_niclas_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(dia_niclas_teach);
	Info_AddChoice(dia_niclas_teach,DIALOG_BACK,dia_niclas_teach_back);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_niclas_teach_bow_1);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_niclas_teach_bow_5);
};


instance DIA_NICLAS_PICKPOCKET(C_INFO)
{
	npc = bau_984_niclas;
	nr = 900;
	condition = dia_niclas_pickpocket_condition;
	information = dia_niclas_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_niclas_pickpocket_condition()
{
	return c_beklauen(27,20);
};

func void dia_niclas_pickpocket_info()
{
	Info_ClearChoices(dia_niclas_pickpocket);
	Info_AddChoice(dia_niclas_pickpocket,DIALOG_BACK,dia_niclas_pickpocket_back);
	Info_AddChoice(dia_niclas_pickpocket,DIALOG_PICKPOCKET,dia_niclas_pickpocket_doit);
};

func void dia_niclas_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_niclas_pickpocket);
};

func void dia_niclas_pickpocket_back()
{
	Info_ClearChoices(dia_niclas_pickpocket);
};

