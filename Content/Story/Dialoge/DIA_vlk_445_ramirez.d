
instance DIA_RAMIREZ_EXIT(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 999;
	condition = dia_ramirez_exit_condition;
	information = dia_ramirez_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ramirez_exit_condition()
{
	return TRUE;
};

func void dia_ramirez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAMIREZ_PICKPOCKET(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 900;
	condition = dia_ramirez_pickpocket_condition;
	information = dia_ramirez_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_ramirez_pickpocket_condition()
{
	return c_beklauen(90,300);
};

func void dia_ramirez_pickpocket_info()
{
	Info_ClearChoices(dia_ramirez_pickpocket);
	Info_AddChoice(dia_ramirez_pickpocket,DIALOG_BACK,dia_ramirez_pickpocket_back);
	Info_AddChoice(dia_ramirez_pickpocket,DIALOG_PICKPOCKET,dia_ramirez_pickpocket_doit);
};

func void dia_ramirez_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ramirez_pickpocket);
};

func void dia_ramirez_pickpocket_back()
{
	Info_ClearChoices(dia_ramirez_pickpocket);
};


instance DIA_RAMIREZ_ZEICHEN(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_zeichen_condition;
	information = dia_ramirez_zeichen_info;
	permanent = FALSE;
	description = "(Poka¿ z³odziejski gest)";
};


func int dia_ramirez_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ramirez_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ramirez_Zeichen_14_00");	//No, no, widzê, ¿e ktoœ pokaza³ ci znak. Jestem pod wra¿eniem.
};


instance DIA_RAMIREZ_HALLO(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_hallo_condition;
	information = dia_ramirez_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ramirez_hallo_permanent;

func int dia_ramirez_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_RAMIREZ_HALLO_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_hallo_info()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (JOIN_THIEFS == FALSE))
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_00");	//Zab³¹dzi³eœ? To chyba nie jest odpowiednie miejsce dla ciebie.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_01");	//Jeœli coœ ci siê tutaj stanie, to mo¿esz byæ pewien, ¿e nikt nie przyjdzie ci na ratunek. Wiêc lepiej uwa¿aj.
	};
	if(JOIN_THIEFS == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_02");	//Uda³o ci siê wejœæ. Có¿, ¿yczê szczêœcia - i uwa¿aj na siebie, cokolwiek bêdziesz robi³.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_03");	//Och, i jeszcze coœ - nie obchodzi mnie, kim jesteœ na górze, ani dla kogo pracujesz.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_04");	//Tu, na dole, wszyscy jesteœmy z³odziejami. Ni mniej, ni wiêcej.
		DIA_RAMIREZ_HALLO_PERMANENT = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_RAMIREZ_BEUTE(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 3;
	condition = dia_ramirez_beute_condition;
	information = dia_ramirez_beute_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ramirez_beute_condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",itmi_gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",itmi_gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",itmi_silvercup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",itmi_gold) < 75))
	{
		return TRUE;
	};
};

func void dia_ramirez_beute_info()
{
	AI_Output(self,other,"DIA_Ramirez_Beute_14_00");	//S³uchaj, ty chyba nie masz w sobie za grosz godnoœci, co? Kradniesz nam nasze w³asne z³oto?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_01");	//Nie gor¹czkuj siê tak z powodu kilku monet.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_02");	//To znaczy, czy to jest wasz ca³y ³up? Czy tylko tyle ma do zaoferowania gildia z³odziei z Khorinis?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_03");	//A kto mówi, ¿e ³upy trzymamy tutaj?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_04");	//Mnie te¿ coœ nie chce siê w to uwierzyæ. Gdzie wiêc ukryliœcie skarby?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_05");	//W bardzo bezpiecznym miejscu.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_06");	//Rozumiem.
	AI_Output(self,other,"DIA_Ramirez_Beute_14_07");	//W porz¹dku, mo¿esz zatrzymaæ z³oto, ale uwa¿aj, bêdê mia³ na ciebie oko. Nie przesadzaj.
};


instance DIA_RAMIREZ_BEZAHLEN(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 9;
	condition = dia_ramirez_bezahlen_condition;
	information = dia_ramirez_bezahlen_info;
	permanent = TRUE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


var int dia_ramirez_bezahlen_permanent;

func int dia_ramirez_bezahlen_condition()
{
	if((JOIN_THIEFS == TRUE) && (DIA_RAMIREZ_BEZAHLEN_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_cassia_lernen))
	{
		return TRUE;
	};
};

func void dia_ramirez_bezahlen_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		RAMIREZ_COST = 150;
	}
	else
	{
		RAMIREZ_COST = 300;
	};
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_15_00");	//Czy móg³byœ mnie czegoœ nauczyæ?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_01");	//Nie mogê nauczyæ ciê nic wiêcej. Przekaza³em ci ca³¹ moj¹ wiedzê na temat otwierania zamków.
		if(other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self,other,"DIA_Ramirez_Add_14_00");	//Teraz musisz ju¿ tylko poprawiæ swoj¹ zrêcznoœæ.
		};
		DIA_RAMIREZ_BEZAHLEN_PERMANENT = TRUE;
		Info_ClearChoices(dia_ramirez_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_02");	//Mogê ci pokazaæ, jak otwieraæ zamki. Bêdzie ciê to kosztowaæ jakieœ...
		b_say_gold(self,other,RAMIREZ_COST);
		Info_ClearChoices(dia_ramirez_bezahlen);
		Info_AddChoice(dia_ramirez_bezahlen,"Mo¿e póŸniej... (POWRÓT)",dia_ramirez_bezahlen_spaeter);
		Info_AddChoice(dia_ramirez_bezahlen,"Dobra, zap³acê...",dia_ramirez_bezahlen_okay);
	};
};

func void dia_ramirez_bezahlen_spaeter()
{
	Info_ClearChoices(dia_ramirez_bezahlen);
};

func void dia_ramirez_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_00");	//Dobra, zap³acê...
	if(b_giveinvitems(other,self,itmi_gold,RAMIREZ_COST))
	{
		AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_01");	//...Oto twoje z³oto.
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_02");	//Œwietnie. S³u¿ê pomoc¹.
		RAMIREZ_TEACHPLAYER = TRUE;
		DIA_RAMIREZ_BEZAHLEN_PERMANENT = TRUE;
		Info_ClearChoices(dia_ramirez_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_03");	//Bierz wiêc z³oto i wracaj.
		Info_ClearChoices(dia_ramirez_bezahlen);
	};
};


instance DIA_RAMIREZ_TEACH(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 99;
	condition = dia_ramirez_teach_condition;
	information = dia_ramirez_teach_info;
	permanent = TRUE;
	description = "Naucz mnie otwieraæ zamki!";
};


func int dia_ramirez_teach_condition()
{
	if((RAMIREZ_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_teach_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_15_00");	//Poka¿ mi, jak otwieraæ zamki.
	if(RAMIREZ_ZWEIMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_06");	//Umiejêtnoœæ otwierania zamków to niemal sztuka.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_01");	//Potrzeba do tego wiele uczucia i intuicji. No, i kilka dobrych wytrychów.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_02");	//Niektóre skrzynie s¹ jednak zabezpieczone zamkami, daj¹cymi siê otworzyæ tylko przez u¿ycie odpowiedniego klucza.
		RAMIREZ_ZWEIMAL = TRUE;
	};
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_03");	//Tak wiêc, klêcz¹c przy zamku, nale¿y ³agodnie obróciæ wytrych, w lewo i w prawo.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_04");	//Jeœli obrócisz go zbyt szybko lub zbyt mocno - z³amie siê.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_05");	//Jednak z czasem nabierzesz wprawy w pos³ugiwaniu siê tym narzêdziem.
	};
};


instance DIA_RAMIREZ_VIERTEL(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 8;
	condition = dia_ramirez_viertel_condition;
	information = dia_ramirez_viertel_info;
	permanent = FALSE;
	description = "Gdzie warto siê w³amywaæ?";
};


func int dia_ramirez_viertel_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ramirez_viertel_info()
{
	AI_Output(other,self,"DIA_Ramirez_Viertel_15_00");	//Gdzie warto siê w³amywaæ?
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_01");	//Oczywiœcie w górnym mieœcie.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_02");	//Jednak jeœli przyjdzie ci do g³owy gdzieœ tam siê w³amywaæ, lepiej zaczekaj, a¿ zapadnie zmrok. Miasto zapada wtedy w sen, oczywiœcie pozostaj¹ jeszcze stra¿e.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_03");	//Stra¿nicy kontroluj¹ miasto noc¹. Znam jednego - Wambo, to jedyny z nich, którego interesuje tylko z³oto.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_04");	//Liczy sobie doœæ sporo, ale jeœli raz mu zap³acisz, nie bêdzie wiêcej sprawia³ k³opotów.
};


instance DIA_RAMIREZ_SEXTANT(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_sextant_condition;
	information = dia_ramirez_sextant_info;
	permanent = FALSE;
	description = "Masz dla mnie jak¹œ robotê?";
};


func int dia_ramirez_sextant_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (MIS_CASSIARING == LOG_SUCCESS) && (KAPITEL >= 2))
	{
		return TRUE;
	};
};

func void dia_ramirez_sextant_info()
{
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_00");	//Czy masz dla mnie jak¹œ pracê?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_01");	//Hmmm... Jest pewna rzecz, która mnie interesuje. Jednak dotychczas nie uda³o mi siê jej zdobyæ.
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_02");	//Có¿ to takiego?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_03");	//Sekstans. Przynieœ mi go, a dobrze zap³acê.
	Log_CreateTopic(TOPIC_RAMIREZSEXTANT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAMIREZSEXTANT,LOG_RUNNING);
	b_logentry(TOPIC_RAMIREZSEXTANT,"Ramirez chce, abym przyniós³ mu sekstans.");
	MIS_RAMIREZSEXTANT = LOG_RUNNING;
};


instance DIA_RAMIREZ_SUCCESS(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_success_condition;
	information = dia_ramirez_success_info;
	permanent = FALSE;
	description = "Mam dla ciebie sekstans.";
};


func int dia_ramirez_success_condition()
{
	if(Npc_KnowsInfo(other,dia_ramirez_sextant) && (Npc_HasItems(other,itmi_sextant) > 0))
	{
		return TRUE;
	};
};

func void dia_ramirez_success_info()
{
	AI_Output(other,self,"DIA_Ramirez_Success_15_00");	//Mam dla ciebie sekstans.
	b_giveinvitems(other,self,itmi_sextant,1);
	AI_Output(self,other,"DIA_Ramirez_Success_14_01");	//Niewiarygodne. Naprawdê uda³o ci siê go zdobyæ.
	AI_Output(self,other,"DIA_Ramirez_Success_14_02");	//Proszê, naprawdê zas³u¿y³eœ sobie na te pieni¹dze.
	b_giveinvitems(self,other,itmi_gold,VALUE_SEXTANT / 2);
	RAMIREZ_SEXTANT = TRUE;
	MIS_RAMIREZSEXTANT = LOG_SUCCESS;
	b_giveplayerxp(XP_RAMIREZSEXTANT);
};

