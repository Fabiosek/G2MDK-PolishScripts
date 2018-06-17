
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
		AI_Output(self,other,"DIA_Addon_Edgor_EXIT_06_00");	//Mi³o mi ciê poznaæ...
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
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_01");	//Chcesz wiedzieæ, jak leci? Ju¿ ja ci powiem, jak leci!
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_02");	//Pewnej sztormowej nocy przywieŸli mnie tu piraci. Zarzyga³em im ca³y statek.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_03");	//No a potem Kruk odci¹³ kopalniê, bo jacyœ durnie stali siê zbyt chciwi.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_04");	//Franko zosta³ przywódc¹ myœliwych i zabije ka¿dego, kto mu siê przeciwstawi.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_05");	//Czyli mówi¹c ogólnie, leci doœæ marnie.
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
	description = "W jaki sposób Franko zosta³ przywódc¹ tej bandy?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Franco_15_00");	//W jaki sposób Franko zosta³ przywódc¹ tej bandy?
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_01");	//Ca³kiem prosto: zabi³ Fletchera - poprzedniego przywódcê.
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_02");	//Fletcher by³ w porz¹dku. Franko jednak oszukuje nas, jak tylko mo¿e.
};


instance DIA_ADDON_EDGOR_MIS2(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_mis2_condition;
	information = dia_addon_edgor_mis2_info;
	permanent = FALSE;
	description = "Franko pyta³ mnie o tê kamienn¹ tabliczkê. Uda³o ci siê j¹ znaleŸæ?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_MIS2_15_00");	//Franko pyta³ mnie o tê kamienn¹ tabliczkê. Uda³o ci siê j¹ znaleŸæ?
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_01");	//Ch³opie, nawet jej nie szuka³em. Wiem tylko, ¿e podobno jest w starym budynku na bagnach.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_02");	//A mój wewnêtrzny g³os wci¹¿ mi powtarza: Edgor, trzymaj siê z daleka od starych budynków stoj¹cych gdzieœ poœrodku bagna.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_03");	//Nie bêdê nadstawia³ karku dla tego aroganckiego durnia - Franka!
	b_logentry(TOPIC_ADDON_STONEPLATE,"Edgor nie pójdzie szukaæ kamiennej tablicy. Wspomnia³, ¿e znajduje siê ona gdzieœ w starym budynku na bagnach.");
};


instance DIA_ADDON_EDGOR_WEG(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_weg_condition;
	information = dia_addon_edgor_weg_info;
	permanent = FALSE;
	description = "Mo¿esz powtórzyæ, gdzie jest ten stary budynek?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Weg_15_00");	//Mo¿esz powtórzyæ, gdzie jest ten stary budynek?
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_01");	//Widzisz tê wielk¹ ska³ê? IdŸ œcie¿k¹, która znajduje siê na lewo od niej. Kawa³ek dalej bêdzie nastêpna wielka ska³a.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_02");	//Tam pójdziesz œcie¿k¹ w lewo... Albo w prawo. Ch³opie, nie pamiêtam, to by³o dawno temu.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_03");	//Ruina stoi na niewielkim wzgórzu, ukryta wœród roœlin.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_04");	//Mo¿e bêdziesz mia³ szczêœcie i jej nie znajdziesz...
};


instance DIA_ADDON_EDGOR_FOUND(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_found_condition;
	information = dia_addon_edgor_found_info;
	permanent = FALSE;
	description = "Znalaz³em kamienn¹ tabliczkê!";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Found_15_00");	//Znalaz³em kamienn¹ tabliczkê!
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_01");	//Naprawdê? Ale z ciebie zuch.
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_02");	//Mo¿e dziêki temu pozwol¹ ci wejœæ do obozu.
};


instance DIA_ADDON_EDGOR_TEACH(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 9;
	condition = dia_addon_edgor_teach_condition;
	information = dia_addon_edgor_teach_info;
	permanent = FALSE;
	description = "Potrafisz mnie czegoœ nauczyæ?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Teach_15_00");	//Potrafisz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_01");	//Wiem co nieco o krwiopijcach. Nienawidzê tych bydlaków chyba nawet bardziej ni¿ Franka!
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_02");	//Wiem, jak oderwaæ z ich trupów skrzyd³a i ¿¹d³a. Taaak, oderwaæ...
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_03");	//Nie licz¹c tego, ¿e wiem, jak uzyskaæ wydzielinê z ¿¹d³a.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_04");	//Jeœli chcesz, mogê ciê tego wszystkiego nauczyæ.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_05");	//Oczywiœcie nie za darmo....
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Edgor wie du¿o na temat krwiopijców i ich oporz¹dzania.");
	EDGOR_TEACH = TRUE;
};

func void b_edgor_notenoughgold()
{
	AI_Output(self,other,"DIA_Addon_Edgor_NotEnoughGold_06_00");	//Za³atw trochê z³ota. Przyjmujê tylko monety, ¿adnych kawa³ków ani okruchów.
};


instance DIA_ADDON_EDGOR_TRAINSTART(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 9;
	condition = dia_addon_edgor_start_condition;
	information = dia_addon_edgor_start_info;
	permanent = TRUE;
	description = "A co do krwiopijców...";
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
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_SEKRET_15_00");	//A co do krwiopijców...
	AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_SEKRET_06_01");	//Co chcesz wiedzieæ?
	Info_ClearChoices(dia_addon_edgor_trainstart);
	Info_AddChoice(dia_addon_edgor_trainstart,DIALOG_BACK,dia_addon_edgor_trainstart_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Wyci¹gnij ¿¹d³o krwiopijcy. (Koszt: 1 PN, 100 szt. z³ota)",dia_addon_edgor_trainstart_sting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Oderwij skrzyd³a krwiopijcy. (Koszt: 1 PN, 100 szt. z³ota)",dia_addon_edgor_trainstart_wing);
	};
	if(KNOWS_BLOODFLY == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Wydob¹dŸ wydzielinê z krwiopijcy. (Koszt: 1 PN, 100 szt. z³ota)",dia_addon_edgor_trainstart_gift);
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
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Sting_15_00");	//Jak wydobyæ ¿¹d³o krwiopijcy?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_01");	//Trzeba przewróciæ truch³o i je rozp³ataæ. A potem przebiæ siê przez wnêtrznoœci w okolicy ogona.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_02");	//Wtedy ³atwo bêdzie wyrwaæ ¿¹d³o.
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
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Wing_15_00");	//Jaki jest najlepszy sposób, ¿eby usun¹æ skrzyd³a?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Wing_06_01");	//To doœæ proste. Z³ap jedn¹ rêk¹ za skrzyd³o, a drug¹ przetnij wierzchni¹ warstwê skóry.
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
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_GIFT_15_00");	//Jak uzyskaæ wydzielinê krwiopijcy?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_01");	//Trzeba rozci¹æ zewnêtrzn¹ warstwê ¿¹d³a. Wtedy powinieneœ zobaczyæ, jak œcieka uzdrawiaj¹ca wydzielina.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_02");	//Mo¿na wypiæ ten p³yn albo wykorzystaæ go do sporz¹dzenia mikstury.
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

