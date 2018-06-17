
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
	description = "Co s�ycha�?";
};


func int dia_lehmar_entschuldigung_condition()
{
	return TRUE;
};

func void dia_lehmar_entschuldigung_info()
{
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_01");	//Ile chcesz?
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_02");	//Co masz na my�li?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_03");	//Zajmuj� si� po�yczkami. Skoro do mnie przychodzisz, to czego m�g�by� chcie�? Oczywi�cie - pieni�dzy!
};


instance DIA_LEHMAR_GELDLEIHEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 3;
	condition = dia_lehmar_geldleihen_condition;
	information = dia_lehmar_geldleihen_info;
	permanent = TRUE;
	description = "Po�ycz mi troch� pieni�dzy!";
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
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_15_00");	//Po�ycz mi troch� pieni�dzy!
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_09_01");	//Jasne. Ile chcesz? Pobieram 20 procent od po�yczanej sumy.
	Info_ClearChoices(dia_lehmar_geldleihen);
	Info_AddChoice(dia_lehmar_geldleihen,"Musz� si� zastanowi�.",dia_lehmar_geldleihen_back);
	Info_AddChoice(dia_lehmar_geldleihen,"1000 sztuk z�ota.",dia_lehmar_geldleihen_1000);
	Info_AddChoice(dia_lehmar_geldleihen," 200 sztuk z�ota.",dia_lehmar_geldleihen_200);
	Info_AddChoice(dia_lehmar_geldleihen,"   50 sztuk z�ota.",dia_lehmar_geldleihen_50);
};

func void dia_lehmar_geldleihen_back()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_back_15_00");	//Musz� si� zastanowi�.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_back_09_01");	//Zdecyduj si�! Nie marnuj mojego czasu!
	AI_StopProcessInfos(self);
};

func void dia_lehmar_geldleihen_50()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_50_15_00");	//50 sztuk z�ota.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_50_09_01");	//Tak na pr�b�, co? Jutro chc� je z powrotem, jasne?
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 50;
	Info_ClearChoices(dia_lehmar_geldleihen);
};

func void dia_lehmar_geldleihen_200()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_200_15_00");	//200 sztuk z�ota.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_200_09_01");	//To sporo pieni�dzy. Jutro masz si� tutaj zjawi� wraz z moim z�otem, jasne?
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 200;
	Info_ClearChoices(dia_lehmar_geldleihen);
};

func void dia_lehmar_geldleihen_1000()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_15_00");	//1000 sztuk z�ota.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_01");	//Chyba nie masz zbyt r�wno pod sufitem?
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_02");	//Dam ci 100. I pami�taj, jutro chc� je z powrotem!
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
	description = "Czy po�yczasz pieni�dze ka�demu, kto o nie prosi?";
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
	AI_Output(other,self,"DIA_Lehmar_WARUMGELD_15_00");	//Czy po�yczasz pieni�dze ka�demu, kto o nie prosi?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_01");	//Spokojnie, wszyscy zwracaj� je na czas. Ty te� jutro tu przyjdziesz albo znajd� ci� i zabij�. Proste, prawda?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_02");	//Masz tak charakterystyczn� facjat�, �e znalezienie ci� nie zaj�oby mi du�o czasu.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_03");	//Wi�c niech ci si� nawet nie �ni, �e m�g�by� mnie wykiwa�.
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
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_00");	//Ty draniu, oddawaj moje pieni�dze! A poniewa� sp�ni�e� si� ze sp�at�, tw�j d�ug w�a�nie ur�s�.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_01");	//Zamiast standardowych 20 procent b�dziesz mi teraz musia� odda� 30.
	Info_ClearChoices(dia_lehmar_geldeintreiben);
	Info_AddChoice(dia_lehmar_geldeintreiben,"Chc� sp�aci� moje d�ugi.",dia_lehmar_geldeintreiben_schuldenzahlen);
	Info_AddChoice(dia_lehmar_geldeintreiben,"Nic z tego, nie oddam ci �adnych pieni�dzy.",dia_lehmar_geldeintreiben_kannstmich);
};

func void dia_lehmar_geldeintreiben_kannstmich()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00");	//Nic z tego, nie oddam ci �adnych pieni�dzy.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01");	//O tak, zapewniam ci�, �e dasz.
	LEHMAR_VORBEI = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_lehmar_geldeintreiben_schuldenzahlen()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00");	//Chc� sp�aci� moje d�ugi.
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
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01");	//Twoje szcz�cie! A teraz spadaj!
		LEHMAR_GELDGELIEHEN = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02");	//Nie masz wystarczaj�co du�o pieni�dzy! No dobrze, widz�, �e b�d� musia� da� ci nauczk�.
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03");	//Nie bierz tego do siebie. Po prostu musz� dba� o swoj� z�� reputacj�.
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
	description = "Oto twoje pieni�dze!";
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
	AI_Output(other,self,"DIA_Lehmar_GELDZURUECK_15_00");	//Oto twoje pieni�dze!
	if((RANGERHELP_LEHMARKOHLE == TRUE) && (LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)))
	{
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_00");	//Nie zajmuj si� tym - Lares ju� rozwi�za� ten problem.
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_01");	//Ten osio�, z kt�rym si� kumplujesz? To nie moja sprawa - mi�ego dnia �ycz�.
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
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_01");	//Wspaniale! Interesy z tob� to czysta przyjemno��.
			LEHMAR_GELDGELIEHEN = 0;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_02");	//Jeste� kompletnie sp�ukany! Wr��, kiedy ju� zdob�dziesz pieni�dze. Termin jeszcze nie up�yn��. I pami�taj, 20 procent!
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
	description = "Czy m�g�bym od ciebie po�yczy� troch� pieni�dzy?";
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
	AI_Output(other,self,"DIA_Lehmar_NOCHMALGELD_15_00");	//Czy m�g�bym od ciebie po�yczy� troch� pieni�dzy?
	if(Npc_KnowsInfo(other,dia_lehmar_geldeintreiben) || Npc_KnowsInfo(other,dia_lehmar_buchweg))
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_01");	//Czy masz mnie za g�upca? Spadaj st�d!
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_02");	//Nic nie dostaniesz! Mia�em ostatnio spore wydatki i potrzebuj� ka�dej monety.
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_03");	//Wr�� za par� dni!
	};
};


instance DIA_LEHMAR_PICKPOCKET(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 900;
	condition = dia_lehmar_pickpocket_condition;
	information = dia_lehmar_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tej ma�ej ksi��eczki b�dzie dziecinnie �atwa)";
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
	AI_Output(self,other,"DIA_Lehmar_Add_09_00");	//Jaki� dra� ukrad� moj� ksi�g� rachunkow�...
	AI_Output(self,other,"DIA_Lehmar_Add_09_01");	//Nie mia�e� z tym chyba nic wsp�lnego, prawda?
	AI_Output(other,self,"DIA_Addon_Lehmar_Add_15_02");	//Ja? Nie.
	AI_Output(self,other,"DIA_Lehmar_Add_09_03");	//Tak, tak, oczywi�cie. A teraz wyno� si� st�d.
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

