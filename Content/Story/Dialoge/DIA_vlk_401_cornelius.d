
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
	description = "Widzia�e� zab�jstwo Lothara, prawda?";
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
	AI_Output(other,self,"DIA_Cornelius_SeeMurder_15_00");	//Widzia�e� zab�jstwo Lothara, prawda?
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_01");	//Nie musz� odpowiada� na �adne pytania dotycz�ce �ledztwa w toku.
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_02");	//Lord Hagen wie ju� o wszystkim.
};


instance DIA_CORNELIUS_WHATYOUSEE(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 5;
	condition = dia_cornelius_whatyousee_condition;
	information = dia_cornelius_whatyousee_info;
	permanent = FALSE;
	description = "Co widzia�e�?";
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
	AI_Output(other,self,"DIA_Cornelius_WhatYouSee_15_00");	//Co widzia�e�?
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01");	//Naprawd�, nie mam teraz czasu.
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_02");	//Musisz wyj��, zamykamy biuro.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius nie chce ze mn� rozmawia�.");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_ENOUGH(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 6;
	condition = dia_cornelius_enough_condition;
	information = dia_cornelius_enough_info;
	permanent = FALSE;
	description = "Do�� tego! Co widzia�e�?";
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
	AI_Output(other,self,"DIA_Cornelius_Enough_15_00");	//Do�� tego! Co widzia�e�?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_01");	//Ja... widzia�em, jak najemnik zaatakowa� paladyna od ty�u.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_02");	//A potem wyj�� miecz i wbi� mu go w klatk� piersiow�.
	AI_Output(other,self,"DIA_Cornelius_Enough_15_03");	//Jeste� tego pewien?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_04");	//Tak, oczywi�cie, widzia�em to na w�asne oczy.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_05");	//Ale teraz naprawd� nie mam czasu, przede mn� ca�a masa papierkowej roboty.
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_DONTBELIEVEYOU(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_dontbelieveyou_condition;
	information = dia_cornelius_dontbelieveyou_info;
	permanent = TRUE;
	description = "Nie wierz� ci.";
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
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_15_00");	//Nie wierz� ci.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_13_01");	//No i co, powiedz mi, co zamierzasz z tym zrobi�?
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"Czego chcesz?",dia_cornelius_dontbelieveyou_whatyouwant);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"Cenisz chyba w�asne �ycie, prawda?",dia_cornelius_dontbelieveyou_wantsurvive);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"W klasztorze z pewno�ci� nak�oni� ci� do m�wienia.",dia_cornelius_dontbelieveyou_monastery);
	};
	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"M�g�bym powiedzie� najemnikom, gdzie mieszkasz.",dia_cornelius_dontbelieveyou_knowyourhome);
	};
	if(hero.guild == GIL_MIL)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"Za krzywoprzysi�stwo mo�esz trafi� do paki - i to na d�ugi czas!",dia_cornelius_dontbelieveyou_perjury);
	};
};

func void dia_cornelius_dontbelieveyou_whatyouwant()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00");	//Czego chcesz?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01");	//Nawet nie starczy ci z�ota, �eby mi zap�aci�.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02");	//Ile?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03");	//2000 sztuk z�ota. Hm, to mog�oby mnie sk�oni� do przemy�lenia tej kwestii ponownie.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius zgodzi si� ze mn� porozmawia� za 2000 sztuk z�ota.");
	CORNELIUS_PAYFORPROOF = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_wantsurvive()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00");	//Cenisz chyba w�asne �ycie, prawda?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01");	//Je�li mnie zaatakujesz, zawi�niesz na stryczku.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02");	//Mam wp�ywowych przyjaci�. Spr�buj mnie tylko tkn��, a po�a�ujesz.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03");	//Wyno� si� st�d! Albo wezw� stra�nik�w!
	AI_StopProcessInfos(self);
};

func void dia_cornelius_dontbelieveyou_monastery()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_00");	//W klasztorze z pewno�ci� nak�oni� ci� do m�wienia.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01");	//Co to ma niby znaczy�?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_02");	//Mamy swoje sposoby na poznanie prawdy. Bolesne sposoby.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03");	//Nie, prosz�, nie r�b tego. Powiem wszystko, co zechcesz.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_knowyourhome()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00");	//M�g�bym powiedzie� najemnikom, gdzie mieszkasz.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01");	//Co to ma niby znaczy�?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02");	//Jestem pewien, �e z wielk� ch�ci� ci� odwiedz�. Zapewne nie b�d� bardzo mili.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03");	//Nie mo�esz tego zrobi�, zabij� mnie.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04");	//To bardzo prawdopodobne.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05");	//Powiem, co tylko zechcesz, ale nie r�b tego.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_perjury()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Perjury_15_00");	//Za krzywoprzysi�stwo mo�esz trafi� do paki - i to na d�ugi czas!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01");	//Pr�bujesz mnie zastraszy�? Jaki� stra�nik grozi sekretarzowi gubernatora?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02");	//Je�li natychmiast nie opu�cisz tego miejsca, dopilnuj�, aby ci� zdegradowano.
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
	description = "Oto z�oto.";
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
	AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");	//Tu jest z�oto.
	b_giveinvitems(other,self,itmi_gold,2000);
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_01");	//Lepiej, �ebym nie wiedzia�, sk�d to wzi��e�.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_02");	//Szczerze m�wi�c, to mnie nie obchodzi.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_03");	//Ale mamy pewien interes do za�atwienia.
	CORNELIUS_TELLTRUTH = TRUE;
};


instance DIA_CORNELIUS_REALSTORY(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_realstory_condition;
	information = dia_cornelius_realstory_info;
	permanent = TRUE;
	description = "Wi�c co tak naprawd� si� wydarzy�o?";
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
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_00");	//Wi�c co tak naprawd� si� wydarzy�o?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_01");	//Nie widzia�em, co zasz�o. Dosta�em z�oto za obci��enie win� najemnika.
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_02");	//W dzisiejszych czasach ka�dy musi zadba� o siebie. Potrzebowa�em pieni�dzy.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_03");	//Kto ci zap�aci�?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_04");	//Wystarczy. Zabije mnie, je�li go wydam.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_05");	//Czy zgodzisz si� powiedzie� to samo Lordowi Hagenowi?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_06");	//Nie jestem szalony. Nie mog� zosta� w mie�cie.
	if(Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Cornelius_RealStory_13_07");	//Dam ci m�j pami�tnik, powinien by� wystarczaj�cym dowodem.
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
	};
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius k�ama�. Zap�acono mu za z�o�enie fa�szywych zezna�. Boi si� jednak powiedzie�, komu zale�a�o na obci��eniu win� Benneta.");
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
	description = "(Kradzie� tej ksi��ki b�dzie ryzykownym zadaniem)";
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

