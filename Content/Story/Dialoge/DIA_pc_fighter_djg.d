
instance DIA_GORNDJG_EXIT(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 999;
	condition = dia_gorndjg_exit_condition;
	information = dia_gorndjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorndjg_exit_condition()
{
	return TRUE;
};

func void dia_gorndjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_STARTCAMP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_startcamp_condition;
	information = dia_gorndjg_startcamp_info;
	description = "Widz�, �e przy��czy�e� si� do �owc�w smok�w.";
};


func int dia_gorndjg_startcamp_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_startcamp_info()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_15_00");	//Widz�, �e przy��czy�e� si� do �owc�w smok�w.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_01");	//Poszed�em z Sylviem do G�rniczej Doliny, bo nikt nie zna okolicy lepiej ode mnie. Zreszt� chcia�em sam rozejrze� si� w sytuacji.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_02");	//Wiesz, co ci powiem? Co� tu si� szykuje. Pierwszy raz widz� tylu ork�w naraz w jednym miejscu.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_03");	//Nie zdziwi�bym si�, gdyby Garond i jego paladyni zostali do tej pory wybici do nogi.
	Info_AddChoice(dia_gorndjg_startcamp,"Do zobaczenia!",dia_gorndjg_startcamp_by);
	Info_AddChoice(dia_gorndjg_startcamp,"Co zamierzasz teraz robi�?",dia_gorndjg_startcamp_wohin);
};

func void dia_gorndjg_startcamp_wohin()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_Wohin_15_00");	//Co zamierzasz teraz robi�?
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_01");	//Najpierw p�jd� z ch�opakami do G�rniczej Doliny. Potem pewnie si� st�d ulotni�.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_02");	//Musz� si� dowiedzie�, co planuj� orkowie.
};

func void dia_gorndjg_startcamp_by()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_By_15_00");	//Do zobaczenia!
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_By_12_01");	//Uwa�aj na siebie.
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_HALLO(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_hallo_condition;
	information = dia_gorndjg_hallo_info;
	description = "A wi�c tutaj si� schowa�e�!";
};


func int dia_gorndjg_hallo_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void dia_gorndjg_hallo_info()
{
	AI_Output(other,self,"DIA_GornDJG_HALLO_15_00");	//A wi�c tutaj si� schowa�e�!
	AI_Output(self,other,"DIA_GornDJG_HALLO_12_01");	//Ty te� nie dasz si� tak �atwo zabi�, co?
};


instance DIA_GORNDJG_WHATSUP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatsup_condition;
	information = dia_gorndjg_whatsup_info;
	description = "Znalaz�e� co� ciekawego?";
};


func int dia_gorndjg_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatsup_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_15_00");	//Znalaz�e� co� ciekawego?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_12_01");	//Ci�gle szukam. My�l�, �e co� dzieje si� w starych ruinach, w g�rach. W nocy wida� tam dziwne �wiat�a i s�ycha� jakie� wrzaski.
	Info_ClearChoices(dia_gorndjg_whatsup);
	Info_AddChoice(dia_gorndjg_whatsup,"Mo�e Lester?",dia_gorndjg_whatsup_lester);
	Info_AddChoice(dia_gorndjg_whatsup,"My�lisz, �e to sprawka smoka?",dia_gorndjg_whatsup_a_dragon);
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn przebywa u podn�a p�askowy�u przy fortecy ork�w. Dzi�ki temu mo�e obserwowa� jednocze�nie r�wnin� i orkowe barykady.");
};

func void dia_gorndjg_whatsup_lester()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_Lester_15_00");	//Mo�e Lester wr�ci� na swoje �mieci?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_Lester_12_01");	//Raczej nie. O ile wiem, Lester ju� tam nie mieszka.
};

func void dia_gorndjg_whatsup_a_dragon()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_A_Dragon_15_00");	//My�lisz, �e to sprawka smoka?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_01");	//Bardzo mo�liwe. Tamten p�askowy� jest lepiej strze�ony ni� kr�lewski skarbiec, a koniec ko�c�w - to jedyna droga do fortecy.
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_02");	//Jakby ma�o by�o samych smok�w - kr�ci si� tam mn�stwo innego plugastwa.
	GORNDJG_WHATMONSTERS = TRUE;
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn twierdzi, �e w starej skalnej fortecy przebywa smok.");
	Info_ClearChoices(dia_gorndjg_whatsup);
};


instance DIA_GORNDJG_WHATMONSTERS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatmonsters_condition;
	information = dia_gorndjg_whatmonsters_info;
	description = "O czym m�wisz?";
};


func int dia_gorndjg_whatmonsters_condition()
{
	if(GORNDJG_WHATMONSTERS == TRUE)
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatmonsters_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATMONSTERS_15_00");	//O czym m�wisz?
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_01");	//Nie przyjrza�em im si� jeszcze dok�adniej, ale czymkolwiek s� - chodz� wyprostowane i maj� �uskowat� sk�r�. Skacz� po ska�ach jak stado z�baczy w po�cigu za ofiar�.
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_02");	//S�ysza�em par� razy, jak w�szy�y po okolicy. My�l�, �e zaj�y ca�� wy�yn�.
};


instance DIA_GORNDJG_WAHTABOUTORCS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_wahtaboutorcs_condition;
	information = dia_gorndjg_wahtaboutorcs_info;
	description = "A co z orkami?";
};


func int dia_gorndjg_wahtaboutorcs_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_wahtaboutorcs_info()
{
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_00");	//A co z orkami?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_01");	//Obserwuj� je od d�u�szego czasu. Za t� ich palisad� musi si� kry� co� wa�nego. My�l�, �e trzymaj� tam swoje g��wne si�y.
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_02");	//My�lisz, �e jest ich tam jeszcze wi�cej ni� tutaj?!
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_03");	//Nie zdziwi�bym si�, gdyby pewnego dnia przewr�cili t� swoj� palisad� i zalali nas jak pow�d�. Nie podoba mi si� to...
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_04");	//Gdyby rzeczywi�cie ruszyli do ataku, b�d� musia� ostrzec Lee. On i tak chce si� wynie�� z tej wyspy, a w obecnej sytuacji to chyba niez�y pomys�.
};


instance DIA_GORNDJG_HELPKILLDRACONIANS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_helpkilldraconians_condition;
	information = dia_gorndjg_helpkilldraconians_info;
	description = "Pomo�esz mi dosta� si� do fortecy?";
};


func int dia_gorndjg_helpkilldraconians_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatmonsters) && Npc_KnowsInfo(other,dia_gorndjg_wahtaboutorcs) && (Npc_IsDead(rockdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_helpkilldraconians_info()
{
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_00");	//Pomo�esz mi dosta� si� do fortecy?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_01");	//Sam nie wiem. Boj� si� spu�ci� ork�w z oka, cho�by na chwil�.
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_02");	//Nie przesadzasz przypadkiem?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_03");	//Mo�e, ale nigdy sobie nie wybacz�, gdybym nie zd��y� ostrzec pozosta�ych. Chocia�, z drugiej strony...
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_04");	//A co mi tam! W ko�cu, po co tu jestem? W porz�dku, pomog� ci przebi� si� do fortecy.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_05");	//Troch� ruchu mi nie zaszkodzi. Zreszt� i tak chcia�em si� lepiej przyjrze� tym dziwnym bestiom.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_06");	//Daj mi zna�, kiedy b�dziesz gotowy.
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn chce mi pom�c przedosta� si� do skalnej fortecy na p�askowy�u.");
};


instance DIA_GORNDJG_LOSGEHTS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_losgehts_condition;
	information = dia_gorndjg_losgehts_info;
	description = "Mo�emy rusza�!";
};


func int dia_gorndjg_losgehts_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_helpkilldraconians))
	{
		return TRUE;
	};
};

func void dia_gorndjg_losgehts_info()
{
	AI_Output(other,self,"DIA_GornDJG_LOSGEHTS_15_00");	//Mo�emy rusza�!
	AI_Output(self,other,"DIA_GornDJG_LOSGEHTS_12_01");	//Jak za dawnych czas�w, co? Ale co� sobie wyja�nijmy: to MOJA bitwa. Tym razem to JA id� z przodu!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RunToRockRuinBridge");
};


instance DIA_GORNDJG_BISHIERHIN(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_bishierhin_condition;
	information = dia_gorndjg_bishierhin_info;
	important = TRUE;
};


func int dia_gorndjg_bishierhin_condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_bishierhin_info()
{
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_00");	//Ha! �atwizna! C�, przyjacielu, reszt� musisz zaj�� si� sam. Spu�� im ci�gi! Ja wr�c� na sw�j posterunek i b�d� dalej obserwowa� ork�w.
	AI_Output(other,self,"DIA_GornDJG_BISHIERHIN_15_01");	//Nie ma sprawy! Do zobaczenia!
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_02");	//No, mam nadziej�!
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn powr�ci� na sw�j posterunek. Zamierza nadal obserwowa� poczynania ork�w.");
	b_giveplayerxp(XP_GORNDJGPLATEAUCLEAR);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GORNDJG_DRAGONDEAD(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_dragondead_condition;
	information = dia_gorndjg_dragondead_info;
	description = "Kamienny smok nie �yje!";
};


func int dia_gorndjg_dragondead_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatsup) && (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1000) && (Npc_IsDead(rockdragon) == TRUE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_dragondead_info()
{
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_00");	//Kamienny smok nie �yje!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_01");	//Od jakiego� czasu nie s�ysz� �adnych wrzask�w. By�e� w fortecy?
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_02");	//Tak!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_03");	//Ha, ha! Tak my�la�em. Po tobie nie zostaje nawet kamie� na kamieniu!
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_04");	//Co zamierzasz robi� dalej?
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_05");	//Zostan� tu jeszcze troch�, a potem wr�c� do Lee. Mo�e spotkamy si� u niego!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_06");	//Mam ju� do�� tej okolicy. Najwy�sza pora zwija� manatki.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_07");	//Na razie!
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_FIGHTER_DJG_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 900;
	condition = dia_fighter_djg_pickpocket_condition;
	information = dia_fighter_djg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_djg_pickpocket_condition()
{
	return c_beklauen(10,35);
};

func void dia_fighter_djg_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_BACK,dia_fighter_djg_pickpocket_back);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_PICKPOCKET,dia_fighter_djg_pickpocket_doit);
};

func void dia_fighter_djg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

func void dia_fighter_djg_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

