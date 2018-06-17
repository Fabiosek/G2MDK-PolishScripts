
instance DIA_LEHMAR_EXIT(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 999;
	condition = dia_lehmar_exit_condition;
	information = dia_lehmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lehmar_exit_condition()
{
	return TRUE;
};

func void dia_lehmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEHMAR_ENTSCHULDIGUNG(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 2;
	condition = dia_lehmar_entschuldigung_condition;
	information = dia_lehmar_entschuldigung_info;
	permanent = FALSE;
	description = "Co s³ychaæ?";
};


func int dia_lehmar_entschuldigung_condition()
{
	return TRUE;
};

func void dia_lehmar_entschuldigung_info()
{
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_01");	//Ile chcesz?
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_02");	//Co masz na myœli?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_03");	//Zajmujê siê po¿yczkami. Skoro do mnie przychodzisz, to czego móg³byœ chcieæ? Oczywiœcie - pieniêdzy!
};


instance DIA_LEHMAR_GELDLEIHEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 3;
	condition = dia_lehmar_geldleihen_condition;
	information = dia_lehmar_geldleihen_info;
	permanent = TRUE;
	description = "Po¿ycz mi trochê pieniêdzy!";
};


var int dia_lehmar_geldleihen_noperm;

func int dia_lehmar_geldleihen_condition()
{
	if(Npc_KnowsInfo(other,dia_lehmar_entschuldigung) && (DIA_LEHMAR_GELDLEIHEN_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldleihen_info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_15_00");	//Po¿ycz mi trochê pieniêdzy!
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_09_01");	//Jasne. Ile chcesz? Pobieram 20 procent od po¿yczanej sumy.
	Info_ClearChoices(dia_lehmar_geldleihen);
	Info_AddChoice(dia_lehmar_geldleihen,"Muszê siê zastanowiæ.",dia_lehmar_geldleihen_back);
	Info_AddChoice(dia_lehmar_geldleihen,"1000 sztuk z³ota.",dia_lehmar_geldleihen_1000);
	Info_AddChoice(dia_lehmar_geldleihen," 200 sztuk z³ota.",dia_lehmar_geldleihen_200);
	Info_AddChoice(dia_lehmar_geldleihen,"   50 sztuk z³ota.",dia_lehmar_geldleihen_50);
};

func void dia_lehmar_geldleihen_back()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_back_15_00");	//Muszê siê zastanowiæ.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_back_09_01");	//Zdecyduj siê! Nie marnuj mojego czasu!
	AI_StopProcessInfos(self);
};

func void dia_lehmar_geldleihen_50()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_50_15_00");	//50 sztuk z³ota.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_50_09_01");	//Tak na próbê, co? Jutro chcê je z powrotem, jasne?
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 50;
	Info_ClearChoices(dia_lehmar_geldleihen);
};

func void dia_lehmar_geldleihen_200()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_200_15_00");	//200 sztuk z³ota.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_200_09_01");	//To sporo pieniêdzy. Jutro masz siê tutaj zjawiæ wraz z moim z³otem, jasne?
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 200;
	Info_ClearChoices(dia_lehmar_geldleihen);
};

func void dia_lehmar_geldleihen_1000()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_15_00");	//1000 sztuk z³ota.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_01");	//Chyba nie masz zbyt równo pod sufitem?
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_02");	//Dam ci 100. I pamiêtaj, jutro chcê je z powrotem!
	CreateInvItems(self,itmi_gold,100);
	b_giveinvitems(self,other,itmi_gold,100);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 100;
	Info_ClearChoices(dia_lehmar_geldleihen);
};


instance DIA_LEHMAR_WARUMGELD(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 3;
	condition = dia_lehmar_warumgeld_condition;
	information = dia_lehmar_warumgeld_info;
	permanent = FALSE;
	description = "Czy po¿yczasz pieni¹dze ka¿demu, kto o nie prosi?";
};


func int dia_lehmar_warumgeld_condition()
{
	if(LEHMAR_GELDGELIEHEN != 0)
	{
		return TRUE;
	};
};

func void dia_lehmar_warumgeld_info()
{
	AI_Output(other,self,"DIA_Lehmar_WARUMGELD_15_00");	//Czy po¿yczasz pieni¹dze ka¿demu, kto o nie prosi?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_01");	//Spokojnie, wszyscy zwracaj¹ je na czas. Ty te¿ jutro tu przyjdziesz albo znajdê ciê i zabijê. Proste, prawda?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_02");	//Masz tak charakterystyczn¹ facjatê, ¿e znalezienie ciê nie zajê³oby mi du¿o czasu.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_03");	//Wiêc niech ci siê nawet nie œni, ¿e móg³byœ mnie wykiwaæ.
};


var int lehmar_vorbei;

instance DIA_LEHMAR_GELDEINTREIBEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 5;
	condition = dia_lehmar_geldeintreiben_condition;
	information = dia_lehmar_geldeintreiben_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lehmar_geldeintreiben_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0) && (RANGERHELP_LEHMARKOHLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldeintreiben_info()
{
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_00");	//Ty draniu, oddawaj moje pieni¹dze! A poniewa¿ spóŸni³eœ siê ze sp³at¹, twój d³ug w³aœnie urós³.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_01");	//Zamiast standardowych 20 procent bêdziesz mi teraz musia³ oddaæ 30.
	Info_ClearChoices(dia_lehmar_geldeintreiben);
	Info_AddChoice(dia_lehmar_geldeintreiben,"Chcê sp³aciæ moje d³ugi.",dia_lehmar_geldeintreiben_schuldenzahlen);
	Info_AddChoice(dia_lehmar_geldeintreiben,"Nic z tego, nie oddam ci ¿adnych pieniêdzy.",dia_lehmar_geldeintreiben_kannstmich);
};

func void dia_lehmar_geldeintreiben_kannstmich()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00");	//Nic z tego, nie oddam ci ¿adnych pieniêdzy.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01");	//O tak, zapewniam ciê, ¿e dasz.
	LEHMAR_VORBEI = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_lehmar_geldeintreiben_schuldenzahlen()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00");	//Chcê sp³aciæ moje d³ugi.
	if(LEHMAR_GELDGELIEHEN == 50)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 65;
	};
	if(LEHMAR_GELDGELIEHEN == 200)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 260;
	};
	if(LEHMAR_GELDGELIEHEN == 100)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 130;
	};
	IntToFloat(LEHMAR_GELDGELIEHEN_MITZINSEN);
	if(Npc_HasItems(other,itmi_gold) >= LEHMAR_GELDGELIEHEN_MITZINSEN)
	{
		b_giveinvitems(other,self,itmi_gold,LEHMAR_GELDGELIEHEN_MITZINSEN);
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01");	//Twoje szczêœcie! A teraz spadaj!
		LEHMAR_GELDGELIEHEN = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02");	//Nie masz wystarczaj¹co du¿o pieniêdzy! No dobrze, widzê, ¿e bêdê musia³ daæ ci nauczkê.
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03");	//Nie bierz tego do siebie. Po prostu muszê dbaæ o swoj¹ z³¹ reputacjê.
		LEHMAR_VORBEI = TRUE;
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_LEHMAR_GELDZURUECK(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 6;
	condition = dia_lehmar_geldzurueck_condition;
	information = dia_lehmar_geldzurueck_info;
	permanent = TRUE;
	description = "Oto twoje pieni¹dze!";
};


func int dia_lehmar_geldzurueck_condition()
{
	if(!Npc_KnowsInfo(other,dia_lehmar_geldeintreiben) && (LEHMAR_GELDGELIEHEN != 0))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldzurueck_info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDZURUECK_15_00");	//Oto twoje pieni¹dze!
	if((RANGERHELP_LEHMARKOHLE == TRUE) && (LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)))
	{
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_00");	//Nie zajmuj siê tym - Lares ju¿ rozwi¹za³ ten problem.
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_01");	//Ten osio³, z którym siê kumplujesz? To nie moja sprawa - mi³ego dnia ¿yczê.
		LEHMAR_GELDGELIEHEN = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		if(LEHMAR_GELDGELIEHEN == 50)
		{
			LEHMAR_GELDGELIEHEN_MITZINSEN = 60;
		};
		if(LEHMAR_GELDGELIEHEN == 200)
		{
			LEHMAR_GELDGELIEHEN_MITZINSEN = 240;
		};
		if(LEHMAR_GELDGELIEHEN == 100)
		{
			LEHMAR_GELDGELIEHEN_MITZINSEN = 120;
		};
		IntToFloat(LEHMAR_GELDGELIEHEN_MITZINSEN);
		if(Npc_HasItems(other,itmi_gold) >= LEHMAR_GELDGELIEHEN_MITZINSEN)
		{
			b_giveinvitems(other,self,itmi_gold,LEHMAR_GELDGELIEHEN_MITZINSEN);
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_01");	//Wspaniale! Interesy z tob¹ to czysta przyjemnoœæ.
			LEHMAR_GELDGELIEHEN = 0;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_02");	//Jesteœ kompletnie sp³ukany! Wróæ, kiedy ju¿ zdobêdziesz pieni¹dze. Termin jeszcze nie up³yn¹³. I pamiêtaj, 20 procent!
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_LEHMAR_NOCHMALGELD(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 8;
	condition = dia_lehmar_nochmalgeld_condition;
	information = dia_lehmar_nochmalgeld_info;
	permanent = TRUE;
	description = "Czy móg³bym od ciebie po¿yczyæ trochê pieniêdzy?";
};


func int dia_lehmar_nochmalgeld_condition()
{
	if((LEHMAR_GELDGELIEHEN == 0) && (LEHMAR_GELDGELIEHEN_MITZINSEN != 0))
	{
		return TRUE;
	};
};

func void dia_lehmar_nochmalgeld_info()
{
	AI_Output(other,self,"DIA_Lehmar_NOCHMALGELD_15_00");	//Czy móg³bym od ciebie po¿yczyæ trochê pieniêdzy?
	if(Npc_KnowsInfo(other,dia_lehmar_geldeintreiben) || Npc_KnowsInfo(other,dia_lehmar_buchweg))
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_01");	//Czy masz mnie za g³upca? Spadaj st¹d!
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_02");	//Nic nie dostaniesz! Mia³em ostatnio spore wydatki i potrzebujê ka¿dej monety.
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_03");	//Wróæ za parê dni!
	};
};


instance DIA_LEHMAR_PICKPOCKET(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 900;
	condition = dia_lehmar_pickpocket_condition;
	information = dia_lehmar_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tej ma³ej ksi¹¿eczki bêdzie dziecinnie ³atwa)";
};


func int dia_lehmar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_schuldenbuch) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_lehmar_pickpocket_info()
{
	Info_ClearChoices(dia_lehmar_pickpocket);
	Info_AddChoice(dia_lehmar_pickpocket,DIALOG_BACK,dia_lehmar_pickpocket_back);
	Info_AddChoice(dia_lehmar_pickpocket,DIALOG_PICKPOCKET,dia_lehmar_pickpocket_doit);
};

func void dia_lehmar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itwr_schuldenbuch,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_lehmar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_lehmar_pickpocket_back()
{
	Info_ClearChoices(dia_canthar_pickpocket);
};


instance DIA_LEHMAR_BUCHWEG(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 1;
	condition = dia_lehmar_buchweg_condition;
	information = dia_lehmar_buchweg_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lehmar_buchweg_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == TRUE))
	{
		return TRUE;
	};
};

func void dia_lehmar_buchweg_info()
{
	AI_Output(self,other,"DIA_Lehmar_Add_09_00");	//Jakiœ drañ ukrad³ moj¹ ksiêgê rachunkow¹...
	AI_Output(self,other,"DIA_Lehmar_Add_09_01");	//Nie mia³eœ z tym chyba nic wspólnego, prawda?
	AI_Output(other,self,"DIA_Addon_Lehmar_Add_15_02");	//Ja? Nie.
	AI_Output(self,other,"DIA_Lehmar_Add_09_03");	//Tak, tak, oczywiœcie. A teraz wynoœ siê st¹d.
	AI_StopProcessInfos(self);
};


instance DIA_LEHMAR_VERHAUEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 1;
	condition = dia_lehmar_verhauen_condition;
	information = dia_lehmar_verhauen_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lehmar_verhauen_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_KnowsInfo(other,dia_lehmar_buchweg) || (LEHMAR_VORBEI == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_lehmar_verhauen_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

