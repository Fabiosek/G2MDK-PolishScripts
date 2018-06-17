
instance DIA_AGON_EXIT(C_INFO)
{
	npc = nov_603_agon;
	nr = 999;
	condition = dia_agon_exit_condition;
	information = dia_agon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_agon_exit_condition()
{
	return TRUE;
};

func void dia_agon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AGON_HELLO(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_hello_condition;
	information = dia_agon_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_hello_info()
{
	AI_Output(self,other,"DIA_Agon_Hello_07_00");	//Czego chcesz?
};


instance DIA_AGON_WURST(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_wurst_condition;
	information = dia_agon_wurst_info;
	permanent = FALSE;
	description = "Masz, mam dla ciebie kie³basê z barana.";
};


func int dia_agon_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_agon_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Masz, mam dla ciebie kie³basê z barana.
	AI_Output(self,other,"DIA_Agon_Wurst_07_01");	//Kie³basa z owcy, owczy ser, owcze mleko... Nie mogê ju¿ na to patrzeæ.
	AI_Output(other,self,"DIA_Agon_Wurst_15_02");	//No to chcesz tê kie³basê czy nie?
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Och, dawaj!
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_AGON_NEW(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_new_condition;
	information = dia_agon_new_info;
	permanent = FALSE;
	description = "Jestem tu nowy.";
};


func int dia_agon_new_condition()
{
	if((MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_new_info()
{
	AI_Output(other,self,"DIA_Agon_New_15_00");	//Jestem tu nowy.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//To widzê.
	AI_Output(self,other,"DIA_Agon_New_07_02");	//Jeœli nadal nie masz pracy, porozmawiaj z Parlanem. On ci jak¹œ przydzieli.
};


instance DIA_AGON_YOUANDBABO(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_youandbabo_condition;
	information = dia_agon_youandbabo_info;
	permanent = FALSE;
	description = "Co zasz³o miêdzy tob¹ a Babo?";
};


func int dia_agon_youandbabo_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_youandbabo_info()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_15_00");	//Co zasz³o miêdzy tob¹ a Babo?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_01");	//Nie powinieneœ wierzyæ we wszystko co s³yszysz.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_02");	//Postawmy sprawê jasno. Pójdê w³asn¹ drog¹. Drog¹, któr¹ przeznaczy³ mi Innos.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_03");	//Nie pozwolê, ¿eby ktoœ mi przeszkodzi³, a ju¿ na pewno nie ten prostak Babo.
	Info_ClearChoices(dia_agon_youandbabo);
	Info_AddChoice(dia_agon_youandbabo,"Czy my, nowicjusze, nie powinniœmy trzymaæ siê razem?",dia_agon_youandbabo_alltogether);
	Info_AddChoice(dia_agon_youandbabo,"Tylko Innos zna œcie¿ki, którymi pod¹¿amy.",dia_agon_youandbabo_innosway);
	Info_AddChoice(dia_agon_youandbabo,"Dobrze siê rozumiemy.",dia_agon_youandbabo_understand);
};

func void dia_agon_youandbabo_alltogether()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_AllTogether_15_00");	//Czy my, nowicjusze, nie powinniœmy trzymaæ siê razem?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_01");	//Wy wszyscy mo¿ecie trzymaæ siê razem, jeœli chcecie.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_02");	//Ale proszê, nie marnujcie mojego czasu. I niech nikt mi nie wchodzi w drogê.
	Info_ClearChoices(dia_agon_youandbabo);
};

func void dia_agon_youandbabo_innosway()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_InnosWay_15_00");	//Tylko Innos zna œcie¿ki, którymi pod¹¿amy.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//Moja rodzina zawsze cieszy³a siê ³ask¹ Innosa i to siê nie zmieni.
	Info_ClearChoices(dia_agon_youandbabo);
};

func void dia_agon_youandbabo_understand()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_Understand_15_00");	//Dobrze siê rozumiemy.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_Understand_07_01");	//Mam nadziejê. Kiedy zostanê magiem, wstawiê siê za tob¹.
	Info_ClearChoices(dia_agon_youandbabo);
};


instance DIA_AGON_GETHERB(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_getherb_condition;
	information = dia_agon_getherb_info;
	permanent = TRUE;
	description = "Co tu sadzicie?";
};


func int dia_agon_getherb_condition()
{
	if(MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};

func void dia_agon_getherb_info()
{
	AI_Output(other,self,"DIA_Agon_GetHerb_15_00");	//Co tu sadzicie?
	AI_Output(self,other,"DIA_Agon_GetHerb_07_01");	//Próbujemy wyhodowaæ zio³a lecznicze, których Mistrz Neoras u¿ywa do warzenia mikstur.
};


instance DIA_AGON_GOLEMDEAD(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_golemdead_condition;
	information = dia_agon_golemdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_golemdead_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsDead(magic_golem))
	{
		return TRUE;
	};
};

func void dia_agon_golemdead_info()
{
	AI_Output(self,other,"DIA_Agon_GolemDead_07_00");	//Przyby³eœ za póŸno!
	AI_Output(self,other,"DIA_Agon_GolemDead_07_01");	//By³em pierwszy! Wygra³em!
	Info_ClearChoices(dia_agon_golemdead);
	Info_AddChoice(dia_agon_golemdead,"(groŸnie) Tylko wtedy, jeœli wyjdziesz st¹d ¿ywy.",dia_agon_golemdead_noway);
	Info_AddChoice(dia_agon_golemdead,"Zamknij siê!",dia_agon_golemdead_shutup);
	Info_AddChoice(dia_agon_golemdead,"Moje gratulacje, naprawdê na nie zas³ugujesz.",dia_agon_golemdead_congrat);
};

func void dia_agon_golemdead_noway()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_NoWay_15_00");	//Tylko wtedy, jeœli wyjdziesz st¹d ¿ywy.
	AI_Output(self,other,"DIA_Agon_GolemDead_NoWay_07_01");	//Chcesz mnie zabiæ? Nie uda ci siê.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_shutup()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//Zamknij siê!
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_01");	//To beznadziejne, przegra³eœ! PogódŸ siê z tym.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_02");	//Tylko mnie jest przeznaczone zostaæ magiem.
	Info_ClearChoices(dia_agon_golemdead);
	Info_AddChoice(dia_agon_golemdead,"Mam w dupie przeznaczenie. Skrzynia jest moja.",dia_agon_golemdead_shutup_mychest);
	Info_AddChoice(dia_agon_golemdead,"Wygra³eœ.",dia_agon_golemdead_shutup_youwin);
};

func void dia_agon_golemdead_shutup_mychest()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00");	//Mam w dupie przeznaczenie. Skrzynia jest moja.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01");	//Nie, nie mo¿esz tego zrobiæ, wczeœniej ciê zabijê.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_shutup_youwin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//Wygra³eœ.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01");	//Nie, nie zwiedziesz mnie. Próbujesz siê mnie pozbyæ.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02");	//Nie pozwolê na to!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_congrat()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_00");	//Moje gratulacje, naprawdê na nie zas³ugujesz.
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_01");	//Co to znaczy? Co zamierzasz?
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_02");	//O czym ty mówisz?
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_03");	//Chcesz podwa¿yæ moje zwyciêstwo. Chcesz mnie zabiæ i sobie przypisaæ chwa³ê!
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_04");	//Nigdy ci siê to nie uda!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_AGON_GOLEMLIVES(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_golemlives_condition;
	information = dia_agon_golemlives_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_golemlives_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		return TRUE;
	};
};

func void dia_agon_golemlives_info()
{
	AI_Output(self,other,"DIA_Agon_GolemLives_07_00");	//Znalaz³eœ kryjówkê przede mn¹. To niemo¿liwe...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_01");	//Tak nie powinno byæ! Nie pozwolê na to.
	AI_Output(self,other,"DIA_Agon_GolemLives_07_02");	//Nikt nawet nie znajdzie twoich zw³ok.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};


instance DIA_AGON_PERM(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_perm_condition;
	information = dia_agon_perm_info;
	permanent = TRUE;
	description = "I jak idzie?";
};


func int dia_agon_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_agon_perm_info()
{
	AI_Output(other,self,"DIA_Agon_Perm_15_00");	//I jak idzie?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_01");	//Och, dziêkujê za troskê, Panie Paladynie. Raduje mnie praca i jestem pewien, ¿e wkrótce zostanê magiem.
	}
	else
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_02");	//Jesteœ tylko goœciem w klasztorze Innosa. Dlatego powinieneœ zachowywaæ siê w³aœciwie i nie przeszkadzaæ mi w pracy. Do widzenia.
	};
};


instance DIA_AGON_PICKPOCKET(C_INFO)
{
	npc = nov_603_agon;
	nr = 900;
	condition = dia_agon_pickpocket_condition;
	information = dia_agon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_agon_pickpocket_condition()
{
	return c_beklauen(23,12);
};

func void dia_agon_pickpocket_info()
{
	Info_ClearChoices(dia_agon_pickpocket);
	Info_AddChoice(dia_agon_pickpocket,DIALOG_BACK,dia_agon_pickpocket_back);
	Info_AddChoice(dia_agon_pickpocket,DIALOG_PICKPOCKET,dia_agon_pickpocket_doit);
};

func void dia_agon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_agon_pickpocket);
};

func void dia_agon_pickpocket_back()
{
	Info_ClearChoices(dia_agon_pickpocket);
};

