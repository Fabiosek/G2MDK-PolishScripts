
var int edgor_exiteinmal;

instance DIA_ADDON_EDGOR_EXIT(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 999;
	condition = dia_addon_edgor_exit_condition;
	information = dia_addon_edgor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_edgor_exit_condition()
{
	return TRUE;
};

func void dia_addon_edgor_exit_info()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_mis2) && (EDGOR_EXITEINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Edgor_EXIT_06_00");	//Mi�o mi ci� pozna�...
		EDGOR_EXITEINMAL = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EDGOR_PICKPOCKET(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 900;
	condition = dia_addon_edgor_pickpocket_condition;
	information = dia_addon_edgor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_edgor_pickpocket_condition()
{
	return c_beklauen(10,7);
};

func void dia_addon_edgor_pickpocket_info()
{
	Info_ClearChoices(dia_addon_edgor_pickpocket);
	Info_AddChoice(dia_addon_edgor_pickpocket,DIALOG_BACK,dia_addon_edgor_pickpocket_back);
	Info_AddChoice(dia_addon_edgor_pickpocket,DIALOG_PICKPOCKET,dia_addon_edgor_pickpocket_doit);
};

func void dia_addon_edgor_pickpocket_doit()
{
	b_beklauen();
	b_say(self,self,"$AWAKE");
	Info_ClearChoices(dia_addon_edgor_pickpocket);
};

func void dia_addon_edgor_pickpocket_back()
{
	Info_ClearChoices(dia_addon_edgor_pickpocket);
};


instance DIA_ADDON_EDGOR_HI(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 2;
	condition = dia_addon_edgor_hi_condition;
	information = dia_addon_edgor_hi_info;
	permanent = FALSE;
	description = "Jak leci?";
};


func int dia_addon_edgor_hi_condition()
{
	return TRUE;
};

func void dia_addon_edgor_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Hi_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_01");	//Chcesz wiedzie�, jak leci? Ju� ja ci powiem, jak leci!
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_02");	//Pewnej sztormowej nocy przywie�li mnie tu piraci. Zarzyga�em im ca�y statek.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_03");	//No a potem Kruk odci�� kopalni�, bo jacy� durnie stali si� zbyt chciwi.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_04");	//Franko zosta� przyw�dc� my�liwych i zabije ka�dego, kto mu si� przeciwstawi.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_05");	//Czyli m�wi�c og�lnie, leci do�� marnie.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_EDGOR_FRANCO(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 2;
	condition = dia_addon_edgor_franco_condition;
	information = dia_addon_edgor_franco_info;
	permanent = FALSE;
	description = "W jaki spos�b Franko zosta� przyw�dc� tej bandy?";
};


func int dia_addon_edgor_franco_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_hi))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_franco_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Franco_15_00");	//W jaki spos�b Franko zosta� przyw�dc� tej bandy?
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_01");	//Ca�kiem prosto: zabi� Fletchera - poprzedniego przyw�dc�.
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_02");	//Fletcher by� w porz�dku. Franko jednak oszukuje nas, jak tylko mo�e.
};


instance DIA_ADDON_EDGOR_MIS2(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_mis2_condition;
	information = dia_addon_edgor_mis2_info;
	permanent = FALSE;
	description = "Franko pyta� mnie o t� kamienn� tabliczk�. Uda�o ci si� j� znale��?";
};


func int dia_addon_edgor_mis2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_hi) && (MIS_HLPEDGOR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_mis2_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_MIS2_15_00");	//Franko pyta� mnie o t� kamienn� tabliczk�. Uda�o ci si� j� znale��?
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_01");	//Ch�opie, nawet jej nie szuka�em. Wiem tylko, �e podobno jest w starym budynku na bagnach.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_02");	//A m�j wewn�trzny g�os wci�� mi powtarza: Edgor, trzymaj si� z daleka od starych budynk�w stoj�cych gdzie� po�rodku bagna.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_03");	//Nie b�d� nadstawia� karku dla tego aroganckiego durnia - Franka!
	b_logentry(TOPIC_ADDON_STONEPLATE,"Edgor nie p�jdzie szuka� kamiennej tablicy. Wspomnia�, �e znajduje si� ona gdzie� w starym budynku na bagnach.");
};


instance DIA_ADDON_EDGOR_WEG(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_weg_condition;
	information = dia_addon_edgor_weg_info;
	permanent = FALSE;
	description = "Mo�esz powt�rzy�, gdzie jest ten stary budynek?";
};


func int dia_addon_edgor_weg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_mis2))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_weg_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Weg_15_00");	//Mo�esz powt�rzy�, gdzie jest ten stary budynek?
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_01");	//Widzisz t� wielk� ska��? Id� �cie�k�, kt�ra znajduje si� na lewo od niej. Kawa�ek dalej b�dzie nast�pna wielka ska�a.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_02");	//Tam p�jdziesz �cie�k� w lewo... Albo w prawo. Ch�opie, nie pami�tam, to by�o dawno temu.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_03");	//Ruina stoi na niewielkim wzg�rzu, ukryta w�r�d ro�lin.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_04");	//Mo�e b�dziesz mia� szcz�cie i jej nie znajdziesz...
};


instance DIA_ADDON_EDGOR_FOUND(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_found_condition;
	information = dia_addon_edgor_found_info;
	permanent = FALSE;
	description = "Znalaz�em kamienn� tabliczk�!";
};


func int dia_addon_edgor_found_condition()
{
	if((Npc_HasItems(other,itmi_addon_stone_04) >= 1) && !Npc_IsDead(franco) && (MIS_HLPEDGOR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_found_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Found_15_00");	//Znalaz�em kamienn� tabliczk�!
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_01");	//Naprawd�? Ale z ciebie zuch.
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_02");	//Mo�e dzi�ki temu pozwol� ci wej�� do obozu.
};


instance DIA_ADDON_EDGOR_TEACH(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 9;
	condition = dia_addon_edgor_teach_condition;
	information = dia_addon_edgor_teach_info;
	permanent = FALSE;
	description = "Potrafisz mnie czego� nauczy�?";
};


func int dia_addon_edgor_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_hi))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Teach_15_00");	//Potrafisz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_01");	//Wiem co nieco o krwiopijcach. Nienawidz� tych bydlak�w chyba nawet bardziej ni� Franka!
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_02");	//Wiem, jak oderwa� z ich trup�w skrzyd�a i ��d�a. Taaak, oderwa�...
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_03");	//Nie licz�c tego, �e wiem, jak uzyska� wydzielin� z ��d�a.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_04");	//Je�li chcesz, mog� ci� tego wszystkiego nauczy�.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_05");	//Oczywi�cie nie za darmo....
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Edgor wie du�o na temat krwiopijc�w i ich oporz�dzania.");
	EDGOR_TEACH = TRUE;
};

func void b_edgor_notenoughgold()
{
	AI_Output(self,other,"DIA_Addon_Edgor_NotEnoughGold_06_00");	//Za�atw troch� z�ota. Przyjmuj� tylko monety, �adnych kawa�k�w ani okruch�w.
};


instance DIA_ADDON_EDGOR_TRAINSTART(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 9;
	condition = dia_addon_edgor_start_condition;
	information = dia_addon_edgor_start_info;
	permanent = TRUE;
	description = "A co do krwiopijc�w...";
};


func int dia_addon_edgor_start_condition()
{
	if(EDGOR_TEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_edgor_start_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_SEKRET_15_00");	//A co do krwiopijc�w...
	AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_SEKRET_06_01");	//Co chcesz wiedzie�?
	Info_ClearChoices(dia_addon_edgor_trainstart);
	Info_AddChoice(dia_addon_edgor_trainstart,DIALOG_BACK,dia_addon_edgor_trainstart_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Wyci�gnij ��d�o krwiopijcy. (Koszt: 1 PN, 100 szt. z�ota)",dia_addon_edgor_trainstart_sting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Oderwij skrzyd�a krwiopijcy. (Koszt: 1 PN, 100 szt. z�ota)",dia_addon_edgor_trainstart_wing);
	};
	if(KNOWS_BLOODFLY == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Wydob�d� wydzielin� z krwiopijcy. (Koszt: 1 PN, 100 szt. z�ota)",dia_addon_edgor_trainstart_gift);
	};
};

func void dia_addon_edgor_trainstart_back()
{
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

func void dia_addon_edgor_trainstart_sting()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Sting_15_00");	//Jak wydoby� ��d�o krwiopijcy?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_01");	//Trzeba przewr�ci� truch�o i je rozp�ata�. A potem przebi� si� przez wn�trzno�ci w okolicy ogona.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_02");	//Wtedy �atwo b�dzie wyrwa� ��d�o.
		};
	}
	else
	{
		b_edgor_notenoughgold();
	};
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

func void dia_addon_edgor_trainstart_wing()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Wing_15_00");	//Jaki jest najlepszy spos�b, �eby usun�� skrzyd�a?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Wing_06_01");	//To do�� proste. Z�ap jedn� r�k� za skrzyd�o, a drug� przetnij wierzchni� warstw� sk�ry.
		};
	}
	else
	{
		b_edgor_notenoughgold();
	};
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

func void dia_addon_edgor_trainstart_gift()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(other.lp >= 1)
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_GIFT_15_00");	//Jak uzyska� wydzielin� krwiopijcy?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_01");	//Trzeba rozci�� zewn�trzn� warstw� ��d�a. Wtedy powiniene� zobaczy�, jak �cieka uzdrawiaj�ca wydzielina.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_02");	//Mo�na wypi� ten p�yn albo wykorzysta� go do sporz�dzenia mikstury.
			other.lp = other.lp - 1;
			KNOWS_BLOODFLY = TRUE;
			PrintScreen(PRINT_ADDON_KNOWSBF,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_NOTENOUGHLP,-1,-1,FONT_SCREEN,2);
			b_say(self,other,"$NOLEARNNOPOINTS");
		};
	}
	else
	{
		b_edgor_notenoughgold();
	};
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

