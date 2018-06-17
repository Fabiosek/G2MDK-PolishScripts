
instance DIA_ADDON_SATURAS_EXIT(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 999;
	condition = dia_addon_saturas_exit_condition;
	information = dia_addon_saturas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_saturas_exit_condition()
{
	return TRUE;
};

func void dia_addon_saturas_exit_info()
{
	if(MIS_ADDON_SATURAS_BRINGRIORDIAN2ME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_01");	//Poniewa¿ nie s¹dzê, ¿eby uda³o ci siê odci¹gn¹æ innych magów od pracy, mo¿esz zanieœæ jednemu z nich wiadomoœæ ode mnie.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_02");	//Powiedz Riordianowi, ¿e chcê z nim porozmawiaæ.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_03");	//Przebywa w g³êbi krypty.
		MIS_ADDON_SATURAS_BRINGRIORDIAN2ME = LOG_RUNNING;
		Log_CreateTopic(TOPIC_ADDON_HOLRIORDIAN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_HOLRIORDIAN,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_HOLRIORDIAN,"Saturas chce, ¿ebym przys³a³ do niego Maga Wody, Riordiana. Znajdê go gdzieœ g³êboko w tunelach wykopalisk.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_NEFARIUS(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 2;
	condition = dia_addon_saturas_nefarius_condition;
	information = dia_addon_saturas_nefarius_info;
	description = "Mam znaleŸæ zaginione czêœci ornamentu dla Nefariusa.";
};


func int dia_addon_saturas_nefarius_condition()
{
	if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_nefarius_info()
{
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_00");	//Mam znaleŸæ zaginione czêœci ornamentu dla Nefariusa.
	AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_01");	//Co? Niemo¿liwe! Te¿ siê w to wpl¹ta³eœ?
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_02");	//Nie obawiaj siê. Znajdê je i przyniosê tutaj.
	if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_HasItems(other,itwr_map_newworld_ornaments_addon))
	{
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_03");	//Wiesz przynajmniej, gdzie masz szukaæ?
		AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_04");	//Nefarius da³ mi mapê...
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_05");	//Poka¿ mi j¹!
		b_usefakescroll();
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_06");	//Hmmm. W wielkim lesie jest bardzo niebezpiecznie. Nie powinieneœ iœæ tam sam.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_07");	//Poszukaj w Khorinis kogoœ, kto bêdzie ci towarzyszyæ.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_08");	//Nie chcê, ¿eby po¿ar³y ciê potwory – a razem z tob¹ ornament.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_09");	//Oddajê ci twoj¹ mapê...
		Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_ORNAMENT,"Saturas uwa¿a, ¿e nie powinienem samotnie chodziæ po lesie, szukaj¹c fragmentów. Mam udaæ siê do Khorinis i znaleŸæ kogoœ, kto bêdzie mi towarzyszyæ.");
	};
};


instance DIA_ADDON_SATURAS_HALLO(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 2;
	condition = dia_addon_saturas_hallo_condition;
	information = dia_addon_saturas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_hallo_condition()
{
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,gobbo_skeleton,zs_mm_attack,-1) == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_hallo_weißtdu()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_00");	//Wiesz, co uczyni³eœ?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_01");	//Wprowadzi³eœ taki chaos w strukturze magii, ¿e bêdzie to s³ychaæ a¿ w Khorinis.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_02");	//Podziêkuj swoim gwiazdom za to, ¿e bariera przesta³a istnieæ.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_weißtdu_15_03");	//Dlaczego w takim razie narzekasz? Wszystko posz³o dobrze.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_04");	//Milcz!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_05");	//Czego chcesz, u licha?
	Info_ClearChoices(dia_addon_saturas_hallo);
};

func void dia_addon_saturas_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_00");	//Zwariowa³eœ? OdejdŸ st¹d.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_01");	//Krypty s¹ zbyt niebezpieczne dla niedzielnych poszukiwaczy przygód.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_02");	//Ale czy my siê aby nie znamy? Oczywiœcie. Ty sukinsynu...
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_03");	//Nie myœl, ¿e zapomnieliœmy, jak zdradzi³eœ nas w Nowym Obozie.
	Info_ClearChoices(dia_addon_saturas_hallo);
	Info_AddChoice(dia_addon_saturas_hallo,"Ja...",dia_addon_saturas_hallo_video);
};

func void dia_addon_saturas_hallo_video()
{
	PlayVideo("oreheap.bik");
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_00");	//Œci¹gn¹³eœ ca³¹ energiê magiczn¹ z naszych z³ó¿ rudy i po prostu znikn¹³eœ!
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_01");	//Dlaczego to zrobi³eœ?
	Info_ClearChoices(dia_addon_saturas_hallo);
	Info_AddChoice(dia_addon_saturas_hallo,"Przepraszam. Nie wiedzia³em, co czyniê.",dia_addon_saturas_hallo_sorry);
	Info_AddChoice(dia_addon_saturas_hallo,"Wasz plan i tak by siê nie powiód³. ",dia_addon_saturas_hallo_spott);
	Info_AddChoice(dia_addon_saturas_hallo,"Musia³em. Bez tej energii nie zdo³a³bym pokonaæ Œni¹cego.",dia_addon_saturas_hallo_notwendig);
};

func void dia_addon_saturas_hallo_notwendig()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_notwendig_15_00");	//Musia³em. Bez tej energii nie zdo³a³bym pokonaæ Œni¹cego.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_notwendig_14_01");	//O czym ty mówisz? Œni¹cy? Pokonaæ?
	dia_addon_saturas_hallo_weißtdu();
};

func void dia_addon_saturas_hallo_spott()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_00");	//Wasz plan i tak by siê nie powiód³. Wysadzanie bariery za pomoc¹ rudy to najwiêksza bzdura, o jakiej s³ysza³em.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_01");	//Prêdzej sami wysadzilibyœcie siê w powietrze.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_02");	//No nie! Kto da³ ci prawo oceniaæ nas i nasze intencje?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_03");	//Gdybym nie by³ cz³owiekiem mi³uj¹cym pokój, sprowadzi³bym na ciebie gniew Adanosa.
	dia_addon_saturas_hallo_weißtdu();
};

func void dia_addon_saturas_hallo_sorry()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_sorry_15_00");	//Przepraszam. Nie wiedzia³em, co czyniê.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_sorry_14_01");	//Naprawdê? I myœlisz, ¿e ju¿ wszystko jest w porz¹dku?
	dia_addon_saturas_hallo_weißtdu();
};


instance DIA_ADDON_SATURAS_KEINEAHNUNG(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_keineahnung_condition;
	information = dia_addon_saturas_keineahnung_info;
	description = "Nie mam pojêcia.";
};


func int dia_addon_saturas_keineahnung_condition()
{
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS == 0)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_keineahnung_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_keineAhnung_15_00");	//Nie mam pojêcia. Myœla³em, ¿e po prostu siê tu pojawiê.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_01");	//Marnujesz mój czas. OdejdŸ.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_02");	//PóŸniej siê tob¹ zajmê.
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KDW,"Znalaz³em Magów Wody. Najpierw muszê siê dowiedzieæ, co oni tu w³aœciwie robi¹. Saturas nie chcia³ mi powiedzieæ. Nadal jest trochê spiêty z powodu tej starej sprawy z kolonii karnej.");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_RAUS(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_raus_condition;
	information = dia_addon_saturas_raus_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_saturas_raus_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_keineahnung) && (MIS_ADDON_LARES_ORNAMENT2SATURAS == 0) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_raus_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_raus_14_00");	//Lepiej szybko st¹d odejdŸ, zanim coœ ci siê stanie.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_LARES(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_lares_condition;
	information = dia_addon_saturas_lares_info;
	description = "Przyby³em tu z Laresem.";
};


func int dia_addon_saturas_lares_condition()
{
	if(LARES_ANGEKOMMEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_lares_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_00");	//Przyby³em tu z Laresem.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_01");	//Z Laresem? Naprawdê? A gdzie on jest?
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_02");	//Zostawi³ mnie i wróci³ do miasta.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_03");	//Co? Przys³a³ ciê tutaj samego? O co mu chodzi?
};


instance DIA_ADDON_SATURAS_ORNAMENT(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_ornament_condition;
	information = dia_addon_saturas_ornament_info;
	description = "Przynoszê twój ornament.";
};


func int dia_addon_saturas_ornament_condition()
{
	if((Npc_HasItems(other,itmi_ornament_addon_vatras) && (LARES_ANGEKOMMEN == FALSE)) || ((LARES_ANGEKOMMEN == TRUE) && Npc_KnowsInfo(other,dia_addon_saturas_lares) && Npc_HasItems(other,itmi_ornament_addon_vatras)))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_00");	//Przynoszê twój ornament.
	b_giveinvitems(other,self,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_ADD_14_00");	//Jak to?
	if(LARES_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_01");	//Kto ci to da³? Nie dosta³eœ go chyba od Laresa?
	};
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_02");	//Spokojnie. Przynios³em go dla ciebie. Jesteœ zainteresowany?
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_03");	//Pewnie. Ale martwi mnie, ¿e maczasz w tym palce.
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_04");	//Dlaczego tak siê przejmujesz t¹ star¹ histori¹?
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_05");	//Pracowa³em dla ciebie ostatnim razem. Przecie¿ mog³eœ wtedy na mnie liczyæ.
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_06");	//I co z tego mia³em? Hê, nie myœl, ¿e ci ufam...
	MIS_ADDON_LARES_ORNAMENT2SATURAS = LOG_SUCCESS;
	Wld_InsertNpc(bloodfly,"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc(giant_bug,"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc(lurker,"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(gobbo_green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(gobbo_green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(gobbo_green,"NW_CITY_TO_FARM2_02");
	Wld_InsertNpc(giant_rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(giant_rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(giant_rat,"NW_TROLLAREA_RATS_01");
};


instance DIA_ADDON_SATURAS_GEHEIMBUND(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_geheimbund_condition;
	information = dia_addon_saturas_geheimbund_info;
	description = "Chcê wst¹piæ do Wodnego Krêgu.";
};


func int dia_addon_saturas_geheimbund_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && (SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_geheimbund_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_00");	//Chcê wst¹piæ do Wodnego Krêgu.
	if(LARES_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_01");	//CO? Sk¹d siê o tym dowiedzia³eœ? Kto...? LARES... Zabijê go!
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//Z³ama³ nasze zasady. Nikt nie mo¿e mówiæ o Wodnym Krêgu.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_03");	//Brakuje mi s³ów. Mogê ci zaufaæ tylko wtedy, kiedy bêdê mia³ na ciebie oko.
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_04");	//Vatras powiedzia³ mi o pierœcieniu.
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_05");	//Co? Vatras? Œwietnie! Ze wszystkich Magów Wody spotka³eœ jedynego, który ciebie NIE zna³...
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_06");	//S³uchaj uwa¿nie: Nie rób g³upot!
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_07");	//Bêdê uwa¿aæ...
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Saturas nie chce podj¹æ decyzji o przyjêciu mnie do Wodnego Krêgu. Woli, ¿eby zaj¹³ siê tym Vatras.");
};


instance DIA_ADDON_SATURAS_WASMACHSTDU(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_wasmachstdu_condition;
	information = dia_addon_saturas_wasmachstdu_info;
	description = "Co tu robisz?";
};


func int dia_addon_saturas_wasmachstdu_condition()
{
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_wasmachstdu_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_01");	//W tych salach kryj¹ siê dawne tajemnice. Niesamowite tajemnice.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_02");	//Te inskrypcje i freski wskazuj¹ na bardzo star¹ cywilizacjê.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_03");	//Wszystko, co widzisz, napisano w nieznanym jêzyku.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_04");	//Próbujemy zrozumieæ ten jêzyk.
};


instance DIA_ADDON_SATURAS_ERDBEBEN(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 6;
	condition = dia_addon_saturas_erdbeben_condition;
	information = dia_addon_saturas_erdbeben_info;
	description = "A co z tymi dziwnymi trzêsieniami ziemi?";
};


func int dia_addon_saturas_erdbeben_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_saturas_wasmachstdu) && Npc_KnowsInfo(other,dia_addon_merdarion_bedrohung))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_erdbeben_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Erdbeben_15_00");	//A co z tymi dziwnymi trzêsieniami ziemi?
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_01");	//To tajemnica, któr¹ staram siê rozwi¹zaæ.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_02");	//Gdzieœ za tymi górami zosta³a zaburzona struktura magii.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_03");	//NajwyraŸniej ktoœ ze wszystkich si³ próbuje rozproszyæ jakieœ potê¿ne zaklêcie.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_04");	//Obawiam siê, ¿e nied³ugo trzêsienia ziemi bêd¹ odczuwalne na ca³ej wyspie.
};


instance DIA_ADDON_SATURAS_WHATSORNAMENT(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_whatsornament_condition;
	information = dia_addon_saturas_whatsornament_info;
	description = "Dlaczego ten ornament jest taki wa¿ny?";
};


func int dia_addon_saturas_whatsornament_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && (SC_KNOWSORNAMENT == FALSE) && (RITUALRINGRUNS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_whatsornament_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatsOrnament_15_00");	//Dlaczego ten ornament jest taki wa¿ny?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_01");	//To klucz do portalu.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_02");	//Nie powiem ci o tym nic wiêcej.
};


instance DIA_ADDON_SATURAS_SCRANGER(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_scranger_condition;
	information = dia_addon_saturas_scranger_info;
	permanent = TRUE;
	description = "Teraz nale¿ê do Wodnego Krêgu.";
};


func int dia_addon_saturas_scranger_condition()
{
	if((SATURASKNOWS_SC_ISRANGER == FALSE) && (SC_ISRANGER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_scranger_info()
{
	var C_ITEM itm;
	AI_Output(other,self,"DIA_Addon_Saturas_ScRanger_15_00");	//Teraz nale¿ê do Wodnego Krêgu.
	itm = Npc_GetEquippedArmor(other);
	if(((SCISWEARINGRANGERRING == TRUE) && (RANGERRINGISLARESRING == FALSE)) || (Hlp_IsItem(itm,itar_ranger_addon) == TRUE))
	{
		if(Hlp_IsItem(itm,itar_ranger_addon) == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_01");	//Widzê, ¿e nosisz zbrojê naszego bractwa.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_02");	//Widzê, ¿e masz na palcu nasz tajemny, wyj¹tkowy znak. Pierœcieñ z akwamarynem.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_03");	//Widzê te¿ po twoich oczach, ¿e mówisz prawdê.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_04");	//Dobrze. Pozwolê ci wst¹piæ w nasze szeregi.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_05");	//Pamiêtaj, ¿e wi¹¿e siê to z wielk¹ odpowiedzialnoœci¹.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_06");	//I mam nadziejê, ¿e oka¿esz siê godny.
		SATURASKNOWS_SC_ISRANGER = TRUE;
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Saturas przyj¹³ mnie do Wodnego Krêgu.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_07");	//A sk¹d masz wiedzieæ, ¿e jesteœ jednym z nas?
		if(RANGERRINGISLARESRING == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_08");	//Pierœcieñ z akwamarynem noszony przez ciebie nale¿y do Laresa. Rozpoznajê go.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_09");	//Chcesz mnie oszukaæ? W sumie nie oczekiwa³em niczego innego.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_SATURAS_OPENPORTAL(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_openportal_condition;
	information = dia_addon_saturas_openportal_info;
	permanent = TRUE;
	description = "Daj mi pierœcieñ. Otworzê portal.";
};


var int dia_addon_saturas_openportal_noperm;

func int dia_addon_saturas_openportal_condition()
{
	if((RITUALRINGRUNS == LOG_SUCCESS) && (DIA_ADDON_SATURAS_OPENPORTAL_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_openportal_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_00");	//Daj mi pierœcieñ. Otworzê portal.
	if(SATURASKNOWS_SC_ISRANGER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_01");	//Dobrze! Jako nowy cz³onek naszego bractwa zas³ugujesz na ten honor.
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_02");	//Ale ca³y czas czekam na wiadomoœæ od Vatrasa. Wyruszymy, gdy j¹ otrzymam.
		if((RANGERMEETINGRUNNING == LOG_SUCCESS) && (Npc_HasItems(other,itwr_vatras2saturas_findraven) || Npc_HasItems(other,itwr_vatras2saturas_findraven_opened)))
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_03");	//MAM dla ciebie wiadomoœæ od Vatrasa.
			b_giveinvitems(other,self,itwr_vatras2saturas_findraven,Npc_HasItems(other,itwr_vatras2saturas_findraven));
			b_giveinvitems(other,self,itwr_vatras2saturas_findraven_opened,Npc_HasItems(other,itwr_vatras2saturas_findraven_opened));
			b_usefakescroll();
			if(VATRAS2SATURAS_FINDRAVEN_OPEN == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_04");	//Hmm. I oczywiœcie nie mog³eœ siê powstrzymaæ przed jej otwarciem, prawda?
				AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_05");	//Có¿, eee...
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_06");	//Dla twojego dobra... obym nie po¿a³owa³, ¿e ci zaufa³em.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_07");	//Bardzo interesuj¹ce.
				b_giveplayerxp(XP_AMBIENT);
			};
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_08");	//WeŸ ten pierœcieñ. Spotkamy siê przy portalu. Bêdê tam na ciebie czekaæ.
			CreateInvItems(self,itmi_portalring_addon,1);
			b_giveinvitems(self,other,itmi_portalring_addon,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_09");	//Jeœli Nefarius ma racjê, portal otworzy siê, kiedy tylko umieœcisz tam pierœcieñ.
			DIA_ADDON_SATURAS_OPENPORTAL_NOPERM = TRUE;
			b_logentry(TOPIC_ADDON_ORNAMENT,"Saturas da³ mi zdobiony pierœcieñ. Chce, ¿ebym go wsadzi³ w mechanizm portalu i przeszed³ na drug¹ stronê.");
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"OpenPortal");
			b_startotherroutine(kdw_1401_addon_cronos_nw,"OpenPortal");
			b_startotherroutine(kdw_1402_addon_nefarius_nw,"OpenPortal");
			b_startotherroutine(kdw_1403_addon_myxir_nw,"OpenPortal");
			b_startotherroutine(kdw_1404_addon_riordian_nw,"OpenPortal");
			b_startotherroutine(kdw_1405_addon_merdarion_nw,"OpenPortal");
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_10");	//Dopóki Vatras nie da mi znaku, ¿e mogê ci zaufaæ, pierœcieñ bêdzie u mnie.
		SATURAS_WILLVERTRAUENSBEWEIS = TRUE;
		b_logentry(TOPIC_ADDON_ORNAMENT,"Saturas nie da mi zdobionego pierœcienia, dopóki nie otrzyma znaku od Vatrasa, ¿e jestem godny zaufania.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_SATURAS_PERM(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 99;
	condition = dia_addon_saturas_perm_condition;
	information = dia_addon_saturas_perm_info;
	permanent = TRUE;
	description = "Mo¿esz nauczyæ mnie czegoœ o magii?";
};


func int dia_addon_saturas_perm_condition()
{
	if(MIS_ADDON_SATURAS_BRINGRIORDIAN2ME != 0)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PERM_15_00");	//Mo¿esz nauczyæ mnie czegoœ o magii?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_01");	//Abyœ jeszcze bardziej naruszy³ jej strukturê?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_02");	//Nie. Nie mam czasu na takie zabawy.
};

