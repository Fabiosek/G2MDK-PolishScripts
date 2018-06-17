
instance DIA_ADDON_BILL_EXIT(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 999;
	condition = dia_addon_bill_exit_condition;
	information = dia_addon_bill_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bill_exit_condition()
{
	return TRUE;
};

func void dia_addon_bill_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BILL_PICKPOCKET(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 900;
	condition = dia_addon_bill_pickpocket_condition;
	information = dia_addon_bill_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_bill_pickpocket_condition()
{
	return c_beklauen(80,205);
};

func void dia_addon_bill_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bill_pickpocket);
	Info_AddChoice(dia_addon_bill_pickpocket,DIALOG_BACK,dia_addon_bill_pickpocket_back);
	Info_AddChoice(dia_addon_bill_pickpocket,DIALOG_PICKPOCKET,dia_addon_bill_pickpocket_doit);
};

func void dia_addon_bill_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bill_pickpocket);
};

func void dia_addon_bill_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bill_pickpocket);
};


instance DIA_ADDON_BILL_HELLO(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 1;
	condition = dia_addon_bill_hello_condition;
	information = dia_addon_bill_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bill_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Hello_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_01");	//Co si� dzieje? Henry ci� tu przys�a�?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_02");	//Powiedz mu, �e nied�ugo dostanie swoje deski.
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_03");	//Je�li go to nie urz�dza, to niech sam je sobie pi�uje.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BILL_PLANKS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 2;
	condition = dia_addon_bill_planks_condition;
	information = dia_addon_bill_planks_info;
	description = "Co robisz z tymi deskami?";
};


func int dia_addon_bill_planks_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_bill_planks_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Planks_15_00");	//Co robisz z tymi deskami?
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_01");	//A jak s�dzisz? S� potrzebne do budowy palisady, o�le!
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_02");	//Greg uzna�, �e warto lepiej ufortyfikowa� nasz ob�z.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_03");	//Ale uwa�am, �e nie ma to wi�kszego sensu.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_04");	//Je�li bandyci nas zaatakuj�, to ta �mieszna palisada ich nie zatrzyma.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_05");	//Powinni�my byli pozby� si� ich dawno temu.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_06");	//Gdybym wiedzia�, co tu si� b�dzie dzia�o, zosta�bym w Khorinis.
};


var int bill_perm_once;

instance DIA_ADDON_BILL_PERM(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 4;
	condition = dia_addon_bill_perm_condition;
	information = dia_addon_bill_perm_info;
	permanent = TRUE;
	description = "Mog� ci pom�c w pi�owaniu?";
};


func int dia_addon_bill_perm_condition()
{
	if((GREGISBACK == FALSE) && Npc_WasInState(self,zs_saw))
	{
		return TRUE;
	};
};

func void dia_addon_bill_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm_15_00");	//Mog� ci pom�c w pi�owaniu?
	AI_Output(self,other,"DIA_Addon_Bill_Perm_03_01");	//Nie trzeba, dam sobie rad�.
	if(BILL_PERM_ONCE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm_03_02");	//Niedawno przy��czy�em si� do obozu i je�li pozwol�, �eby inni za mnie pracowali, b�d� mieli mnie za lenia, rozumiesz?
		BILL_PERM_ONCE = TRUE;
	};
};


instance DIA_ADDON_BILL_PERM2(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 5;
	condition = dia_addon_bill_perm2_condition;
	information = dia_addon_bill_perm2_info;
	permanent = TRUE;
	description = "Co teraz b�dziesz robi�?";
};


func int dia_addon_bill_perm2_condition()
{
	if(GREGISBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bill_perm2_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm2_15_00");	//Co teraz b�dziesz robi�?
	AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_01");	//Musz� chwil� odpocz��.
	if(!Npc_IsDead(francis))
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_02");	//Francis zajmuje si� moj� dawn� robot�.
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_03");	//Je�li o mnie chodzi, to mo�e pi�owa� a� do ko�ca �wiata.
	};
};


instance DIA_ADDON_BILL_ANGUSNHANK(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 11;
	condition = dia_addon_bill_angusnhank_condition;
	information = dia_addon_bill_angusnhank_info;
	permanent = FALSE;
	description = "Szukam Angusa i Hanka.";
};


func int dia_addon_bill_angusnhank_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_angushank) && Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_bill_angusnhank_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_00");	//Szukam Angusa i Hanka.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_01");	//Nie mam poj�cia, gdzie teraz s� - mo�e dopadli ich bandyci?
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_02");	//Byli�cie przyjaci�mi, prawda?
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_03");	//Wiem tylko, �e chcieli spotka� si� z bandytami w jednej z pobliskich jaski�.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_04");	//Pewnie gdzie� na wsch�d od obozu.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_05");	//Ale nie wiem dok�adnie gdzie. Nigdy tam nie by�em.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_06");	//Najlepiej b�dzie, je�li zapytasz o to Jacka Aligatora. On wie wszystko o okolicy.
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Angus i Hank siedzieli w jaskini na wsch�d od obozu. Jack Aligator mo�e wiedzie� wi�cej na ten temat.");
};


instance DIA_ADDON_BILL_FOUNDFRIENDS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 12;
	condition = dia_addon_bill_foundfriends_condition;
	information = dia_addon_bill_foundfriends_info;
	permanent = FALSE;
	description = "Znalaz�em twoich przyjaci�.";
};


func int dia_addon_bill_foundfriends_condition()
{
	if(!Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_bill_foundfriends_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_00");	//Znalaz�em twoich przyjaci�.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_01");	//No i? Gdzie s�?
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_02");	//Nie �yj�.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_03");	//To sprawka tych cholernych bandyt�w!
	if(SC_KNOWS_JUANMURDEREDANGUS == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_06");	//By� mo�e.
	};
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_04");	//Przekl�te �otry! Niech ich piek�o poch�onie!
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_05");	//Du�o bym da�, �eby dowiedzie� si�, kto jest temu winien...
	MIS_ADDON_BILL_SEARCHANGUSMURDER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KILLJUAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KILLJUAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLJUAN,"Bill by� w�ciek�y, kiedy powiedzia�em mu o �mierci Angusa i Hanka. Chce zna� imi� mordercy.");
};


instance DIA_ADDON_BILL_JUANMURDER(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 13;
	condition = dia_addon_bill_juanmurder_condition;
	information = dia_addon_bill_juanmurder_info;
	description = "Wiem, kto zamordowa� Angusa i Hanka.";
};


func int dia_addon_bill_juanmurder_condition()
{
	if((MIS_ADDON_BILL_SEARCHANGUSMURDER == LOG_RUNNING) && (SC_KNOWS_JUANMURDEREDANGUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_juanmurder_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_00");	//Wiem, kto zamordowa� Angusa i Hanka.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_01");	//Kto? M�w, kto to zrobi�!
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_02");	//To jeden z bandyt�w - Juan.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_03");	//Musisz si� go pozby�, rozumiesz?
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_04");	//Ta zbrodnia nie mo�e uj�� mu p�azem!
	b_logentry(TOPIC_ADDON_KILLJUAN,"Mam zabi� Juana, �eby pom�ci� Angusa i Hanka.");
};


instance DIA_ADDON_BILL_KILLEDESTEBAN(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 14;
	condition = dia_addon_bill_killedesteban_condition;
	information = dia_addon_bill_killedesteban_info;
	description = "Juan ju� nie b�dzie sprawia� k�opot�w.";
};


func int dia_addon_bill_killedesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_juanmurder) && Npc_IsDead(juan))
	{
		return TRUE;
	};
};

func void dia_addon_bill_killedesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_00");	//Juan ju� nie b�dzie sprawia� k�opot�w.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_01");	//M�w, jak to si� sta�o? Bardzo cierpia�?
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_02");	//Lepiej o tym nie m�wmy.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_03");	//W sumie racja. Wa�ne, �e ta �winia niczego ju� nie zrobi.
	b_logentry(TOPIC_ADDON_KILLJUAN,"Juan zosta� za�atwiony, co ucieszy�o Billa.");
	MIS_ADDON_BILL_SEARCHANGUSMURDER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_BILL_KILLANGUSMURDER);
};


instance DIA_ADDON_BILL_KHORINIS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 21;
	condition = dia_addon_bill_khorinis_condition;
	information = dia_addon_bill_khorinis_info;
	description = "By�e� w Khorinis?";
};


func int dia_addon_bill_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_planks))
	{
		return TRUE;
	};
};

func void dia_addon_bill_khorinis_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Khorinis_15_00");	//By�e� w Khorinis?
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_01");	//Tak. Troch� tam si� kr�ci�em, podcinaj�c sakiewki i zajmuj�c si� drobnym szwindlem.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_02");	//Ale im mniej statk�w zawija�o do portu, tym gorzej szed� interes.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_03");	//Zabawa ze stra�� przesta�a si� op�aca�.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_04");	//I tak do��czy�em do Grega, a teraz siedz� tutaj.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_05");	//Ca�y dzie� pi�uj� drewno na palisad�, kt�ra i tak jest bezu�yteczna.
	};
};


instance DIA_ADDON_BILL_TEACHPLAYER(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 22;
	condition = dia_addon_bill_teachplayer_condition;
	information = dia_addon_bill_teachplayer_info;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_addon_bill_teachplayer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_khorinis))
	{
		return TRUE;
	};
};

func void dia_addon_bill_teachplayer_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_TeachPlayer_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_01");	//Mog� ci pokaza�, jak opr�nia� ludziom kieszenie tak, aby tego nie zauwa�yli.
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_02");	//Ale musisz by� co najmniej �rednio zr�czny, bo inaczej nie ma sensu zaczyna� nauki.
	BILL_ADDON_TEACHPICKPOCKET = TRUE;
};


instance DIA_ADDON_BILL_LEARNTALENT(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 23;
	condition = dia_addon_bill_learntalent_condition;
	information = dia_addon_bill_learntalent_info;
	permanent = TRUE;
	description = "Poka� mi, jak okrada� innych. (10 PN)";
};


func int dia_addon_bill_learntalent_condition()
{
	if((BILL_ADDON_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_learntalent_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_00");	//Poka� mi, jak okrada� innych.
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_01");	//Je�li chcesz kogo� okra��, musisz sprawi�, by poczu� si� bezpiecznie.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_02");	//Zawsze wci�gam ofiar� w pogaw�dk�. Dzia�a bez pud�a.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_03");	//Kiedy zabierasz si� za kradzie�, upewnij si�, �e ofiara niczego nie zauwa�y�a.
			AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_05");	//Co� jeszcze?
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_06");	//Tak. Potrenuj troch� zr�czno��, jako �e zr�czniejszemu z�odziejowi �atwiej spostrzec dobr� okazj�.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_07");	//I �atwiej unikn�� z�apania na gor�cym uczynku.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_08");	//Przynajmniej w teorii.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_09");	//Zapomnij o tym. Jeste� zbyt niezdarny!
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_10");	//Potrenuj zr�czno�� albo znajd� sobie lepszego nauczyciela.
	};
};

