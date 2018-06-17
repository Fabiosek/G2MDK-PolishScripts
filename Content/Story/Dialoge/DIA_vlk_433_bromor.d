
instance DIA_BROMOR_EXIT(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 999;
	condition = dia_bromor_exit_condition;
	information = dia_bromor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bromor_exit_condition()
{
	return TRUE;
};

func void dia_bromor_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_GIRLS(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_bromor_girls_condition;
	information = dia_bromor_girls_info;
	permanent = FALSE;
	description = "To tw�j interes?";
};


func int dia_bromor_girls_condition()
{
	if(NPCOBSESSEDBYDMT_BROMOR == FALSE)
	{
		return TRUE;
	};
};

func void dia_bromor_girls_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_GIRLS_15_00");	//To tw�j interes?
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Jestem Bromor. To m�j przybytek, a to moje dziewczyny. Lubi� je.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//A je�li ty te� je lubisz, to za nie zap�acisz - 50 sztuk z�ota.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//I lepiej nie my�l o wszczynaniu tutaj burd.
};


instance DIA_ADDON_BROMOR_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_addon_bromor_missingpeople_condition;
	information = dia_addon_bromor_missingpeople_info;
	description = "Wszystkie dziewczyny w porz�dku?";
};


func int dia_addon_bromor_missingpeople_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == FALSE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && Npc_KnowsInfo(other,dia_bromor_girls))
	{
		return TRUE;
	};
};

func void dia_addon_bromor_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_00");	//Wszystkie dziewczyny w porz�dku?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_01");	//Oczywi�cie! S�dzisz, �e chcia�bym p�j�� do wi�zienia z powodu czego� takiego?
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_02");	//Nie chodzi mi o ich wiek. �adna nie zagin�a?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_03");	//A, rozumiem. Owszem, jednej brakuje - ma na imi� Lucia.
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_04");	//Powiadomi�em o tym stra�, ale nie zdo�ali trafi� na jej trop.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Zagin�a jedna z dziewcz�t z portowego burdelu, Lucia.");
};


instance DIA_ADDON_BROMOR_LUCIA(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 5;
	condition = dia_addon_bromor_lucia_condition;
	information = dia_addon_bromor_lucia_info;
	description = "Jak d�ugo jej nie ma?";
};


func int dia_addon_bromor_lucia_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == FALSE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && Npc_KnowsInfo(other,dia_addon_bromor_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_bromor_lucia_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_Lucia_15_00");	//Jak d�ugo jej nie ma?
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_01");	//Pewnie kilka dni. Nie pami�tam dok�adnie.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_02");	//Musia�a uciec z jednym z klient�w.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_03");	//Nie m�wi�c ju� o tym, �e ukrad�a moj� cenn� mis� ze z�ota.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_04");	//Jak tylko j� dorw�... Na d�ugo mnie zapami�ta.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_05");	//Co ci� to obchodzi? Chcesz si� zabawi� czy nie?
	Log_CreateTopic(TOPIC_ADDON_BROMORSGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BROMORSGOLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BROMORSGOLD,"Weso�a panienka Lucia ukrad�a z�ot� mis� swojemu szefowi, Bromorowi. Bromor chce odzyska� swoj� w�asno��.");
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_RUNNING;
};


instance DIA_ADDON_BROMOR_LUCIAGOLD(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 5;
	condition = dia_addon_bromor_luciagold_condition;
	information = dia_addon_bromor_luciagold_info;
	permanent = TRUE;
	description = "Mam mis�, kt�r� ukrad�a ci Lucia.";
};


func int dia_addon_bromor_luciagold_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == FALSE) && (MIS_BROMOR_LUCIASTOLEGOLD == LOG_RUNNING) && Npc_HasItems(other,itmi_bromorsgeld_addon))
	{
		return TRUE;
	};
};

func void dia_addon_bromor_luciagold_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_15_00");	//Mam mis�, kt�r� ukrad�a ci Lucia.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_07_01");	//No, czas najwy�szy.
	Info_ClearChoices(dia_addon_bromor_luciagold);
	if(BROMOR_HAUSVERBOT == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"A mo�e jaka� nagroda?",dia_addon_bromor_luciagold_lohn);
	};
	Info_AddChoice(dia_addon_bromor_luciagold,"Oto misa.",dia_addon_bromor_luciagold_einfachgeben);
	if(DIA_ADDON_BROMOR_LUCIAGOLD_LUCIA_ONETIME == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"Nie chcesz wiedzie�, co si� sta�o z Luci�?",dia_addon_bromor_luciagold_lucia);
	};
};

func void dia_addon_bromor_luciagold_einfachgeben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00");	//Oto misa.
	b_giveinvitems(other,self,itmi_bromorsgeld_addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01");	//Dzi�ki - robisz dobr� rzecz. Chcesz czego� jeszcze?
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_SUCCESS;
	BROMOR_HAUSVERBOT = FALSE;
	b_giveplayerxp(XP_ADDON_BROMOR_LUCIAGOLD);
	Info_ClearChoices(dia_addon_bromor_luciagold);
};


var int dia_addon_bromor_luciagold_lucia_onetime;

func void dia_addon_bromor_luciagold_lucia()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lucia_15_00");	//Nie chcesz wiedzie�, co si� sta�o z Luci�?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_01");	//Nie. Niby czemu? Misa w ko�cu do mnie wr�ci�a.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_02");	//A interes dzia�a�, dzia�a i b�dzie dzia�a�, i bez niej. Przecie� nie mog� jej zmusza� do pracy dla mnie...
	dia_addon_bromor_luciagold_lucia_onetime = TRUE;
};

func void dia_addon_bromor_luciagold_lohn()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lohn_15_00");	//A mo�e jaka� nagroda?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01");	//Mo�esz za darmo zabawi� si� z jedn� z moich dziewcz�t. Pasuje?
	Info_ClearChoices(dia_addon_bromor_luciagold);
	if(DIA_ADDON_BROMOR_LUCIAGOLD_LUCIA_ONETIME == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"Nie chcesz wiedzie�, co si� sta�o z Luci�?",dia_addon_bromor_luciagold_lucia);
	};
	Info_AddChoice(dia_addon_bromor_luciagold,"Nie bardzo.",dia_addon_bromor_luciagold_mehr);
	Info_AddChoice(dia_addon_bromor_luciagold,"Umowa stoi - oto twoja misa.",dia_addon_bromor_luciagold_geben);
};

func void dia_addon_bromor_luciagold_mehr()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_mehr_15_00");	//Nie bardzo.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01");	//To mo�esz r�wnie dobrze si� odwali�.
	Info_AddChoice(dia_addon_bromor_luciagold,"Niewa�ne.",dia_addon_bromor_luciagold_nein);
};

func void dia_addon_bromor_luciagold_nein()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_nein_15_00");	//Niewa�ne.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_01");	//Won st�d, bandziorze!
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_02");	//Nie licz na to, �e kto� ci� tu kiedy� jeszcze obs�u�y.
	Info_ClearChoices(dia_addon_bromor_luciagold);
	BROMOR_HAUSVERBOT = TRUE;
	BROMOR_PAY = 0;
};

func void dia_addon_bromor_luciagold_geben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_geben_15_00");	//Umowa stoi - oto twoja misa.
	b_giveinvitems(other,self,itmi_bromorsgeld_addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_geben_07_01");	//Dzi�kuj�. Id� do Nadji - ona uda si� z tob� na pi�terko.
	BROMOR_PAY = 1;
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_SUCCESS;
	BROMOR_HAUSVERBOT = FALSE;
	b_giveplayerxp(XP_ADDON_BROMOR_LUCIAGOLD);
	Info_ClearChoices(dia_addon_bromor_luciagold);
};


instance DIA_BROMOR_PAY(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_bromor_pay_condition;
	information = dia_bromor_pay_info;
	permanent = TRUE;
	description = "Chc� si� troszk� zabawi� (zap�a� 50 sztuk z�ota).";
};


func int dia_bromor_pay_condition()
{
	if((BROMOR_PAY == FALSE) && (BROMOR_HAUSVERBOT == FALSE) && Npc_KnowsInfo(other,dia_bromor_girls) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (Npc_IsDead(nadja) == FALSE))
	{
		return TRUE;
	};
};


var int dia_bromor_pay_onetime;

func void dia_bromor_pay_info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//Chc� si� zabawi�.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Dobra. Najbli�szych kilku godzin d�ugo nie zapomnisz.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Zatem id� na g�r� z Nadj�.
		if(DIA_BROMOR_PAY_ONETIME == FALSE)
		{
			DIA_BROMOR_PAY_ONETIME = TRUE;
		};
		BROMOR_PAY = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nie znosz�, kiedy ludzie pr�buj� ze mnie �artowa�. Skoro nie mo�esz zap�aci�, to wyno� si� st�d.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_DOPE(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 3;
	condition = dia_bromor_dope_condition;
	information = dia_bromor_dope_info;
	permanent = FALSE;
	description = "Czy mog� tutaj dosta� tak�e 'wyj�tkowe' towary?";
};


func int dia_bromor_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (BROMOR_HAUSVERBOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_bromor_dope_info()
{
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//Czy mog� tutaj dosta� tak�e 'wyj�tkowe' towary?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Pewnie, wszystkie moje dziewczyny s� wyj�tkowe.
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Je�eli masz do�� z�ota, mo�esz i�� na g�r� z Nadj�.
};


instance DIA_BROMOR_OBSESSION(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 30;
	condition = dia_bromor_obsession_condition;
	information = dia_bromor_obsession_info;
	description = "Wszystko w porz�dku?";
};


func int dia_bromor_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_bromor_obsession_gotmoney;

func void dia_bromor_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_BROMOR_HEILUNG(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 55;
	condition = dia_bromor_heilung_condition;
	information = dia_bromor_heilung_info;
	permanent = TRUE;
	description = "Jeste� op�tany.";
};


func int dia_bromor_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_bromor_heilung_info()
{
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Jeste� op�tany.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//Co? O czym ty gadasz? Wynocha.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_PICKPOCKET(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 900;
	condition = dia_bromor_pickpocket_condition;
	information = dia_bromor_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego klucza b�dzie ryzykownym zadaniem)";
};


func int dia_bromor_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_bromor) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_bromor_pickpocket_info()
{
	Info_ClearChoices(dia_bromor_pickpocket);
	Info_AddChoice(dia_bromor_pickpocket,DIALOG_BACK,dia_bromor_pickpocket_back);
	Info_AddChoice(dia_bromor_pickpocket,DIALOG_PICKPOCKET,dia_bromor_pickpocket_doit);
};

func void dia_bromor_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itke_bromor,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_bromor_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_bromor_pickpocket_back()
{
	Info_ClearChoices(dia_bromor_pickpocket);
};

