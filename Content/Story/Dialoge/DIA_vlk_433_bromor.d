
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
	description = "To twój interes?";
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
	AI_Output(other,self,"DIA_Addon_Bromor_GIRLS_15_00");	//To twój interes?
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Jestem Bromor. To mój przybytek, a to moje dziewczyny. Lubiê je.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//A jeœli ty te¿ je lubisz, to za nie zap³acisz - 50 sztuk z³ota.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//I lepiej nie myœl o wszczynaniu tutaj burd.
};


instance DIA_ADDON_BROMOR_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_addon_bromor_missingpeople_condition;
	information = dia_addon_bromor_missingpeople_info;
	description = "Wszystkie dziewczyny w porz¹dku?";
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
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_00");	//Wszystkie dziewczyny w porz¹dku?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_01");	//Oczywiœcie! S¹dzisz, ¿e chcia³bym pójœæ do wiêzienia z powodu czegoœ takiego?
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_02");	//Nie chodzi mi o ich wiek. ¯adna nie zaginê³a?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_03");	//A, rozumiem. Owszem, jednej brakuje - ma na imiê Lucia.
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_04");	//Powiadomi³em o tym stra¿, ale nie zdo³ali trafiæ na jej trop.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Zaginê³a jedna z dziewcz¹t z portowego burdelu, Lucia.");
};


instance DIA_ADDON_BROMOR_LUCIA(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 5;
	condition = dia_addon_bromor_lucia_condition;
	information = dia_addon_bromor_lucia_info;
	description = "Jak d³ugo jej nie ma?";
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
	AI_Output(other,self,"DIA_Addon_Bromor_Lucia_15_00");	//Jak d³ugo jej nie ma?
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_01");	//Pewnie kilka dni. Nie pamiêtam dok³adnie.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_02");	//Musia³a uciec z jednym z klientów.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_03");	//Nie mówi¹c ju¿ o tym, ¿e ukrad³a moj¹ cenn¹ misê ze z³ota.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_04");	//Jak tylko j¹ dorwê... Na d³ugo mnie zapamiêta.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_05");	//Co ciê to obchodzi? Chcesz siê zabawiæ czy nie?
	Log_CreateTopic(TOPIC_ADDON_BROMORSGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BROMORSGOLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BROMORSGOLD,"Weso³a panienka Lucia ukrad³a z³ot¹ misê swojemu szefowi, Bromorowi. Bromor chce odzyskaæ swoj¹ w³asnoœæ.");
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_RUNNING;
};


instance DIA_ADDON_BROMOR_LUCIAGOLD(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 5;
	condition = dia_addon_bromor_luciagold_condition;
	information = dia_addon_bromor_luciagold_info;
	permanent = TRUE;
	description = "Mam misê, któr¹ ukrad³a ci Lucia.";
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
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_15_00");	//Mam misê, któr¹ ukrad³a ci Lucia.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_07_01");	//No, czas najwy¿szy.
	Info_ClearChoices(dia_addon_bromor_luciagold);
	if(BROMOR_HAUSVERBOT == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"A mo¿e jakaœ nagroda?",dia_addon_bromor_luciagold_lohn);
	};
	Info_AddChoice(dia_addon_bromor_luciagold,"Oto misa.",dia_addon_bromor_luciagold_einfachgeben);
	if(DIA_ADDON_BROMOR_LUCIAGOLD_LUCIA_ONETIME == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"Nie chcesz wiedzieæ, co siê sta³o z Luci¹?",dia_addon_bromor_luciagold_lucia);
	};
};

func void dia_addon_bromor_luciagold_einfachgeben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00");	//Oto misa.
	b_giveinvitems(other,self,itmi_bromorsgeld_addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01");	//Dziêki - robisz dobr¹ rzecz. Chcesz czegoœ jeszcze?
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_SUCCESS;
	BROMOR_HAUSVERBOT = FALSE;
	b_giveplayerxp(XP_ADDON_BROMOR_LUCIAGOLD);
	Info_ClearChoices(dia_addon_bromor_luciagold);
};


var int dia_addon_bromor_luciagold_lucia_onetime;

func void dia_addon_bromor_luciagold_lucia()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lucia_15_00");	//Nie chcesz wiedzieæ, co siê sta³o z Luci¹?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_01");	//Nie. Niby czemu? Misa w koñcu do mnie wróci³a.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_02");	//A interes dzia³a³, dzia³a i bêdzie dzia³a³, i bez niej. Przecie¿ nie mogê jej zmuszaæ do pracy dla mnie...
	dia_addon_bromor_luciagold_lucia_onetime = TRUE;
};

func void dia_addon_bromor_luciagold_lohn()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lohn_15_00");	//A mo¿e jakaœ nagroda?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01");	//Mo¿esz za darmo zabawiæ siê z jedn¹ z moich dziewcz¹t. Pasuje?
	Info_ClearChoices(dia_addon_bromor_luciagold);
	if(DIA_ADDON_BROMOR_LUCIAGOLD_LUCIA_ONETIME == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"Nie chcesz wiedzieæ, co siê sta³o z Luci¹?",dia_addon_bromor_luciagold_lucia);
	};
	Info_AddChoice(dia_addon_bromor_luciagold,"Nie bardzo.",dia_addon_bromor_luciagold_mehr);
	Info_AddChoice(dia_addon_bromor_luciagold,"Umowa stoi - oto twoja misa.",dia_addon_bromor_luciagold_geben);
};

func void dia_addon_bromor_luciagold_mehr()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_mehr_15_00");	//Nie bardzo.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01");	//To mo¿esz równie dobrze siê odwaliæ.
	Info_AddChoice(dia_addon_bromor_luciagold,"Niewa¿ne.",dia_addon_bromor_luciagold_nein);
};

func void dia_addon_bromor_luciagold_nein()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_nein_15_00");	//Niewa¿ne.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_01");	//Won st¹d, bandziorze!
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_02");	//Nie licz na to, ¿e ktoœ ciê tu kiedyœ jeszcze obs³u¿y.
	Info_ClearChoices(dia_addon_bromor_luciagold);
	BROMOR_HAUSVERBOT = TRUE;
	BROMOR_PAY = 0;
};

func void dia_addon_bromor_luciagold_geben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_geben_15_00");	//Umowa stoi - oto twoja misa.
	b_giveinvitems(other,self,itmi_bromorsgeld_addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_geben_07_01");	//Dziêkujê. IdŸ do Nadji - ona uda siê z tob¹ na piêterko.
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
	description = "Chcê siê troszkê zabawiæ (zap³aæ 50 sztuk z³ota).";
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
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//Chcê siê zabawiæ.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Dobra. Najbli¿szych kilku godzin d³ugo nie zapomnisz.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Zatem idŸ na górê z Nadj¹.
		if(DIA_BROMOR_PAY_ONETIME == FALSE)
		{
			DIA_BROMOR_PAY_ONETIME = TRUE;
		};
		BROMOR_PAY = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nie znoszê, kiedy ludzie próbuj¹ ze mnie ¿artowaæ. Skoro nie mo¿esz zap³aciæ, to wynoœ siê st¹d.
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
	description = "Czy mogê tutaj dostaæ tak¿e 'wyj¹tkowe' towary?";
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
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//Czy mogê tutaj dostaæ tak¿e 'wyj¹tkowe' towary?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Pewnie, wszystkie moje dziewczyny s¹ wyj¹tkowe.
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Je¿eli masz doœæ z³ota, mo¿esz iœæ na górê z Nadj¹.
};


instance DIA_BROMOR_OBSESSION(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 30;
	condition = dia_bromor_obsession_condition;
	information = dia_bromor_obsession_info;
	description = "Wszystko w porz¹dku?";
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
	description = "Jesteœ opêtany.";
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
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Jesteœ opêtany.
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
	description = "(Kradzie¿ tego klucza bêdzie ryzykownym zadaniem)";
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

