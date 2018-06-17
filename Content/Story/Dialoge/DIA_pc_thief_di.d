
instance DIA_PC_THIEF_DI_EXIT(C_INFO)
{
	npc = pc_thief_di;
	nr = 999;
	condition = dia_pc_thief_di_exit_condition;
	information = dia_pc_thief_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pc_thief_di_exit_condition()
{
	return TRUE;
};

func void dia_pc_thief_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_THIEF_DI_HALLO(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_hallo_condition;
	information = dia_pc_thief_di_hallo_info;
	description = "No i jesteœmy.";
};


func int dia_pc_thief_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_pc_thief_di_hallo_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Hallo_15_00");	//No i jesteœmy.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_01");	//Ta wyspa le¿y bli¿ej Khorinis, ni¿ myœla³em.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_02");	//Nawet nie wiedzia³em o jej istnieniu. Oczywiœcie, teraz parê spraw sta³o siê jasnych.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_03");	//Zawsze by³em ciekaw, w jaki sposób orkowie tak szybko otrzymuj¹ zapasy.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_04");	//Nic dziwnego, skoro mieli tutaj taki posterunek.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_05");	//Po drodze do wnêtrza wyspy natkniesz siê pewnie na parê pu³apek.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_06");	//Gdybyœ nie móg³ sobie poradziæ, wróæ tutaj do mnie. Mo¿e bêdê móg³ ci pomóc.
};


instance DIA_PC_THIEF_DI_RAT(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_rat_condition;
	information = dia_pc_thief_di_rat_info;
	permanent = TRUE;
	description = "Potrzebujê twojej rady.";
};


func int dia_pc_thief_di_rat_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_pc_thief_di_hallo))
	{
		return TRUE;
	};
};


var int dia_pc_thief_di_rat_onetime;
var int dia_pc_thief_di_rat_onetime2;

func void dia_pc_thief_di_rat_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_00");	//Potrzebujê twojej rady.
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di) && (EVT_ORKOBERST_SWITCH_FOUND == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_01");	//Tam na górze znajduje siê kwatera orkowego pu³kownika. Nie widzia³em ¿adnej drogi, która prowadzi³aby dalej w g³¹b wyspy.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_02");	//Orkowie to cwane bestie. Zwykle ich nie doceniamy. Zak³adam, ¿e maj¹ tam jakieœ tajne przejœcie. Poszukaj na œcianach ukrytych prze³¹czników.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_03");	//Tylko pamiêtaj, ¿e zwykle u¿ywa siê ich w odpowiedniej kolejnoœci.
	}
	else if(Npc_IsDead(firedragonisland) && (EVT_DIBRIDGE_OPENED == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_04");	//Stoczy³em walkê ze smokiem i dotar³em na skraj otch³ani ze zwodzonym mostem. Most zosta³ jednak podniesiony i nie mogê przejœæ na drug¹ stronê.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_05");	//Hmmm... A próbowa³eœ ju¿ ³uku albo kuszy? Mo¿e mechanizm mo¿na uruchomiæ celnym strza³em?
	}
	else if(Npc_IsDead(skeleton_lord_archol) && (Npc_KnowsInfo(other,dia_schwarzmagier_hello) == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_06");	//Przysz³o mi walczyæ z o¿ywieñcami i ich skomplikowanymi pu³apkami.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_07");	//Przykro mi, ale w sprawie o¿ywieñców nie mogê ci pomóc. Musisz sobie poradziæ sam.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_08");	//Wróæ, gdybyœ potrzebowa³ pomocy w sprawie trochê bli¿szej mojemu fachowi.
		if((ORKSTURMDI == TRUE) && (DIA_PC_THIEF_DI_RAT_ONETIME2 == FALSE))
		{
			AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_09");	//I jeszcze coœ! Wola³bym, ¿ebyœ nie œci¹ga³ do statku wszystkich w³ócz¹cych siê po okolicy bestii. Mam nadziejê, ¿e nie przyjdzie nam tu odpieraæ kolejnego ataku orków.
			b_giveplayerxp(XP_AMBIENT);
			DIA_PC_THIEF_DI_RAT_ONETIME2 = TRUE;
		};
	};
};


instance DIA_DIEGO_DI_TRADE(C_INFO)
{
	npc = pc_thief_di;
	nr = 12;
	condition = dia_diego_di_trade_condition;
	information = dia_diego_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Potrzebujê amunicji.";
};


func int dia_diego_di_trade_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_diego_di_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Diego_DI_TRADE_15_00");	//Potrzebujê amunicji.
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Diego_DI_TRADE_11_01");	//Chyba bêdê móg³ ci pomóc.
};


instance DIA_PC_THIEF_DI_TRAINING_TALENTE(C_INFO)
{
	npc = pc_thief_di;
	nr = 10;
	condition = dia_pc_thief_di_training_talente_condition;
	information = dia_pc_thief_di_training_talente_info;
	permanent = TRUE;
	description = "Naucz mnie czegoœ.";
};


func int dia_pc_thief_di_training_talente_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_pc_thief_di_hallo))
	{
		return TRUE;
	};
};

func void dia_pc_thief_di_training_talente_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Training_15_00");	//Naucz mnie czegoœ.
	AI_Output(self,other,"DIA_PC_Thief_DI_Training_11_01");	//A czego potrzebujesz?
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Otwieranie zamków",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_dex_1()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00");	//Twoje ¿ycie bêdzie prostsze, jeœli postarasz siê trzymaæ z dala od linii ognia.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Otwieranie zamków",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_dex_5()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00");	//Staraj siê zawsze poruszaæ z koci¹ zwinnoœci¹. Reszta przyjdzie sama.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Otwieranie zamków",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_combat_bow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00");	//Trenuj przy ka¿dej nadarzaj¹cej siê okazji, nie tylko podczas walki.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Otwieranie zamków",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_combat_bow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00");	//Podczas celowania koniecznie uspokój swój oddech.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Otwieranie zamków",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_talente_picklock()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_PICKLOCK_11_00");	//Najwy¿szy czas. Dziwiê siê, ¿e nie nauczy³eœ siê tego wczeœniej.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Otwieranie zamków",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_talente_back()
{
	Info_ClearChoices(dia_pc_thief_di_training_talente);
};


instance DIA_PC_THIEF_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_undeaddragondead_condition;
	information = dia_pc_thief_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Ju¿ po wszystkim. Mo¿emy siê st¹d wynosiæ.";
};


func int dia_pc_thief_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_pc_thief_di_undeaddragondead_onetime;

func void dia_pc_thief_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_00");	//Ju¿ po wszystkim. Mo¿emy siê st¹d wynosiæ.
	if(Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01") < 4000)
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_01");	//No, popatrzcie tylko. Nigdy w ¿yciu czegoœ takiego nie widzia³em.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_02");	//Jak do diaska uda³o ci siê przez to przejœæ?
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_03");	//Pewnie mia³em szczêœcie.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_04");	//Skoro tak twierdzisz.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05");	//Dobrze.
	};
	if(DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_06");	//Co zamierzasz robiæ dalej?
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_07");	//Dobre pytanie. Na pocz¹tek chyba wrócê do Khorinis.
		if((DIEBESGILDE_VERRATEN == TRUE) || (MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_DiegoDI_Add_11_00");	//Nie ma tam ju¿ gildii z³odziei, a to otwiera pewne ciekawe mo¿liwoœci.
		};
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_09");	//Hmmm... A mo¿e po prostu przejmê interes Bromora? W tym fachu zawsze s¹ jakieœ pieni¹dze. Uczciwe pieni¹dze.
		DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_10");	//IdŸ do kapitana i wynoœmy siê st¹d wreszcie.
	AI_StopProcessInfos(self);
	if(LARES_ISONBOARD != LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"SittingShipDI");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_THIEF_DI_PICKPOCKET(C_INFO)
{
	npc = pc_thief_di;
	nr = 900;
	condition = dia_thief_di_pickpocket_condition;
	information = dia_thief_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_di_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_di_pickpocket_info()
{
	Info_ClearChoices(dia_thief_di_pickpocket);
	Info_AddChoice(dia_thief_di_pickpocket,DIALOG_BACK,dia_thief_di_pickpocket_back);
	Info_AddChoice(dia_thief_di_pickpocket,DIALOG_PICKPOCKET,dia_thief_di_pickpocket_doit);
};

func void dia_thief_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_di_pickpocket);
};

func void dia_thief_di_pickpocket_back()
{
	Info_ClearChoices(dia_thief_di_pickpocket);
};

