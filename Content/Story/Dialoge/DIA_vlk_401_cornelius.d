
instance DIA_CORNELIUS_EXIT(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 999;
	condition = dia_cornelius_exit_condition;
	information = dia_cornelius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cornelius_exit_condition()
{
	return TRUE;
};

func void dia_cornelius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_SEEMURDER(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_seemurder_condition;
	information = dia_cornelius_seemurder_info;
	permanent = FALSE;
	description = "Widzia³eœ zabójstwo Lothara, prawda?";
};


func int dia_cornelius_seemurder_condition()
{
	if(RECUEBENNET_KNOWSCORNELIUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_cornelius_seemurder_info()
{
	AI_Output(other,self,"DIA_Cornelius_SeeMurder_15_00");	//Widzia³eœ zabójstwo Lothara, prawda?
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_01");	//Nie muszê odpowiadaæ na ¿adne pytania dotycz¹ce œledztwa w toku.
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_02");	//Lord Hagen wie ju¿ o wszystkim.
};


instance DIA_CORNELIUS_WHATYOUSEE(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 5;
	condition = dia_cornelius_whatyousee_condition;
	information = dia_cornelius_whatyousee_info;
	permanent = FALSE;
	description = "Co widzia³eœ?";
};


func int dia_cornelius_whatyousee_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_seemurder))
	{
		return TRUE;
	};
};

func void dia_cornelius_whatyousee_info()
{
	AI_Output(other,self,"DIA_Cornelius_WhatYouSee_15_00");	//Co widzia³eœ?
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01");	//Naprawdê, nie mam teraz czasu.
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_02");	//Musisz wyjœæ, zamykamy biuro.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius nie chce ze mn¹ rozmawiaæ.");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_ENOUGH(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 6;
	condition = dia_cornelius_enough_condition;
	information = dia_cornelius_enough_info;
	permanent = FALSE;
	description = "Doœæ tego! Co widzia³eœ?";
};


func int dia_cornelius_enough_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_whatyousee))
	{
		return TRUE;
	};
};

func void dia_cornelius_enough_info()
{
	AI_Output(other,self,"DIA_Cornelius_Enough_15_00");	//Doœæ tego! Co widzia³eœ?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_01");	//Ja... widzia³em, jak najemnik zaatakowa³ paladyna od ty³u.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_02");	//A potem wyj¹³ miecz i wbi³ mu go w klatkê piersiow¹.
	AI_Output(other,self,"DIA_Cornelius_Enough_15_03");	//Jesteœ tego pewien?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_04");	//Tak, oczywiœcie, widzia³em to na w³asne oczy.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_05");	//Ale teraz naprawdê nie mam czasu, przede mn¹ ca³a masa papierkowej roboty.
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_DONTBELIEVEYOU(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_dontbelieveyou_condition;
	information = dia_cornelius_dontbelieveyou_info;
	permanent = TRUE;
	description = "Nie wierzê ci.";
};


func int dia_cornelius_dontbelieveyou_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_enough) && (CORNELIUS_TELLTRUTH != TRUE))
	{
		return TRUE;
	};
};

func void dia_cornelius_dontbelieveyou_info()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_15_00");	//Nie wierzê ci.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_13_01");	//No i co, powiedz mi, co zamierzasz z tym zrobiæ?
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"Czego chcesz?",dia_cornelius_dontbelieveyou_whatyouwant);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"Cenisz chyba w³asne ¿ycie, prawda?",dia_cornelius_dontbelieveyou_wantsurvive);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"W klasztorze z pewnoœci¹ nak³oni¹ ciê do mówienia.",dia_cornelius_dontbelieveyou_monastery);
	};
	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"Móg³bym powiedzieæ najemnikom, gdzie mieszkasz.",dia_cornelius_dontbelieveyou_knowyourhome);
	};
	if(hero.guild == GIL_MIL)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"Za krzywoprzysiêstwo mo¿esz trafiæ do paki - i to na d³ugi czas!",dia_cornelius_dontbelieveyou_perjury);
	};
};

func void dia_cornelius_dontbelieveyou_whatyouwant()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00");	//Czego chcesz?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01");	//Nawet nie starczy ci z³ota, ¿eby mi zap³aciæ.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02");	//Ile?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03");	//2000 sztuk z³ota. Hm, to mog³oby mnie sk³oniæ do przemyœlenia tej kwestii ponownie.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius zgodzi siê ze mn¹ porozmawiaæ za 2000 sztuk z³ota.");
	CORNELIUS_PAYFORPROOF = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_wantsurvive()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00");	//Cenisz chyba w³asne ¿ycie, prawda?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01");	//Jeœli mnie zaatakujesz, zawiœniesz na stryczku.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02");	//Mam wp³ywowych przyjació³. Spróbuj mnie tylko tkn¹æ, a po¿a³ujesz.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03");	//Wynoœ siê st¹d! Albo wezwê stra¿ników!
	AI_StopProcessInfos(self);
};

func void dia_cornelius_dontbelieveyou_monastery()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_00");	//W klasztorze z pewnoœci¹ nak³oni¹ ciê do mówienia.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01");	//Co to ma niby znaczyæ?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_02");	//Mamy swoje sposoby na poznanie prawdy. Bolesne sposoby.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03");	//Nie, proszê, nie rób tego. Powiem wszystko, co zechcesz.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_knowyourhome()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00");	//Móg³bym powiedzieæ najemnikom, gdzie mieszkasz.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01");	//Co to ma niby znaczyæ?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02");	//Jestem pewien, ¿e z wielk¹ chêci¹ ciê odwiedz¹. Zapewne nie bêd¹ bardzo mili.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03");	//Nie mo¿esz tego zrobiæ, zabij¹ mnie.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04");	//To bardzo prawdopodobne.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05");	//Powiem, co tylko zechcesz, ale nie rób tego.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_perjury()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Perjury_15_00");	//Za krzywoprzysiêstwo mo¿esz trafiæ do paki - i to na d³ugi czas!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01");	//Próbujesz mnie zastraszyæ? Jakiœ stra¿nik grozi sekretarzowi gubernatora?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02");	//Jeœli natychmiast nie opuœcisz tego miejsca, dopilnujê, aby ciê zdegradowano.
	CORNELIUS_THREATENBYMILSC = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_PAYCORNELIUS(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_paycornelius_condition;
	information = dia_cornelius_paycornelius_info;
	permanent = TRUE;
	description = "Oto z³oto.";
};


func int dia_cornelius_paycornelius_condition()
{
	if((CORNELIUS_PAYFORPROOF == TRUE) && (Npc_HasItems(other,itmi_gold) >= 2000))
	{
		return TRUE;
	};
};

func void dia_cornelius_paycornelius_info()
{
	AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");	//Tu jest z³oto.
	b_giveinvitems(other,self,itmi_gold,2000);
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_01");	//Lepiej, ¿ebym nie wiedzia³, sk¹d to wzi¹³eœ.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_02");	//Szczerze mówi¹c, to mnie nie obchodzi.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_03");	//Ale mamy pewien interes do za³atwienia.
	CORNELIUS_TELLTRUTH = TRUE;
};


instance DIA_CORNELIUS_REALSTORY(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_realstory_condition;
	information = dia_cornelius_realstory_info;
	permanent = TRUE;
	description = "Wiêc co tak naprawdê siê wydarzy³o?";
};


func int dia_cornelius_realstory_condition()
{
	if(CORNELIUS_TELLTRUTH == TRUE)
	{
		return TRUE;
	};
};

func void dia_cornelius_realstory_info()
{
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_00");	//Wiêc co tak naprawdê siê wydarzy³o?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_01");	//Nie widzia³em, co zasz³o. Dosta³em z³oto za obci¹¿enie win¹ najemnika.
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_02");	//W dzisiejszych czasach ka¿dy musi zadbaæ o siebie. Potrzebowa³em pieniêdzy.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_03");	//Kto ci zap³aci³?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_04");	//Wystarczy. Zabije mnie, jeœli go wydam.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_05");	//Czy zgodzisz siê powiedzieæ to samo Lordowi Hagenowi?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_06");	//Nie jestem szalony. Nie mogê zostaæ w mieœcie.
	if(Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Cornelius_RealStory_13_07");	//Dam ci mój pamiêtnik, powinien byæ wystarczaj¹cym dowodem.
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
	};
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius k³ama³. Zap³acono mu za z³o¿enie fa³szywych zeznañ. Boi siê jednak powiedzieæ, komu zale¿a³o na obci¹¿eniu win¹ Benneta.");
	CORNELIUSFLEE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEE");
};


instance DIA_CORNELIUS_FLEEING(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 1;
	condition = dia_cornelius_fleeing_condition;
	information = dia_cornelius_fleeing_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_cornelius_fleeing_condition()
{
	if((CORNELIUSFLEE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_cornelius_fleeing_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_PICKPOCKET(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 900;
	condition = dia_cornelius_pickpocket_condition;
	information = dia_cornelius_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tej ksi¹¿ki bêdzie ryzykownym zadaniem)";
};


func int dia_cornelius_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_cornelius_pickpocket_info()
{
	Info_ClearChoices(dia_cornelius_pickpocket);
	Info_AddChoice(dia_cornelius_pickpocket,DIALOG_BACK,dia_cornelius_pickpocket_back);
	Info_AddChoice(dia_cornelius_pickpocket,DIALOG_PICKPOCKET,dia_cornelius_pickpocket_doit);
};

func void dia_cornelius_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_cornelius_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_cornelius_pickpocket_back()
{
	Info_ClearChoices(dia_cornelius_pickpocket);
};

