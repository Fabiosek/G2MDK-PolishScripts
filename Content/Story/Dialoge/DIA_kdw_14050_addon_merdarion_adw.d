
instance DIA_ADDON_MERDARION_ADW_EXIT(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 999;
	condition = dia_addon_merdarion_adw_exit_condition;
	information = dia_addon_merdarion_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_merdarion_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MERDARION_ADWHELLO(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_adwhello_condition;
	information = dia_addon_merdarion_adwhello_info;
	description = "Co s³ychaæ?";
};


func int dia_addon_merdarion_adwhello_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_adwhello_back()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_Back_15_00");	//Doœæ ju¿ s³ysza³em.
	Info_ClearChoices(dia_addon_merdarion_adwhello);
};

func void dia_addon_merdarion_adwhello_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_01");	//S³yszysz? Dziwne, prawda?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//Hmm...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_03");	//Kamienie teleportacyjne nie dzia³aj¹, ale wci¹¿ s³ychaæ szum.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_04");	//Choæ nie s¹ aktywne, to drzemie w nich uœpiona energia.
	Info_ClearChoices(dia_addon_merdarion_adwhello);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Co zasila kamienie teleportacyjne?",dia_addon_merdarion_adwhello_reaktor);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Jak myœlisz, co mo¿e byæ potrzebne do ich uaktywnienia?",dia_addon_merdarion_adwhello_was);
};

func void dia_addon_merdarion_adwhello_was()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_was_15_00");	//Jak myœlisz, co mo¿e byæ potrzebne do ich uaktywnienia?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_01");	//Mam pewne podejrzenia. Potrzebujê tylko dowodu na poparcie mojej teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_02");	//Kilka dni temu mia³em wra¿enie, ¿e gdzieœ ju¿ widzia³em obiekty w podobnym stylu.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_03");	//Podejrzewam, ¿e chc¹c je ponownie uruchomiæ, nale¿a³oby w nie wt³oczyæ ogromne iloœci magicznej energii.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Gdzie przedtem widzia³eœ takie kamienie teleportacyjne?",dia_addon_merdarion_adwhello_wo);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Co mo¿e zawieraæ doœæ energii?",dia_addon_merdarion_adwhello_focus);
};

func void dia_addon_merdarion_adwhello_focus()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_00");	//Co mo¿e zawieraæ doœæ energii?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_01");	//Przychodzi mi na myœl tylko jedno.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_02");	//Myœlê o jednym z piêciu kamieni ogniskuj¹cych, których u¿yto do stworzenia magicznej bariery w Górniczej Dolinie.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_03");	//Z tego, co wiem, mia³eœ je dla nas zdobyæ jakiœ czas temu.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_04");	//Tak. Pamiêtam.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Mówi³eœ, ¿e potrzebujesz dowodów na poparcie twych domys³ów?",dia_addon_merdarion_adwhello_focusproof);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Gdzie s¹ teraz kamienie ogniskuj¹ce?",dia_addon_merdarion_adwhello_focuswo);
};

func void dia_addon_merdarion_adwhello_focuswo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusWo_15_00");	//Gdzie s¹ teraz kamienie ogniskuj¹ce?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_01");	//Zosta³y mi przekazane. Mam siê nimi opiekowaæ, a¿ znajdziemy dla nich inne zastosowanie.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_02");	//Wygl¹da na to, ¿e ten czas w³aœnie nasta³.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Doœæ ju¿ s³ysza³em.",dia_addon_merdarion_adwhello_back);
};

func void dia_addon_merdarion_adwhello_focusproof()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusProof_15_00");	//Mówi³eœ, ¿e potrzebujesz dowodów na poparcie twych domys³ów?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_01");	//Trzeba w³o¿yæ kamieñ ogniskuj¹cy do kamienia teleportacyjnego.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_02");	//Ale nie wiem, w którym miejscu.
};

func void dia_addon_merdarion_adwhello_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_wo_15_00");	//Gdzie przedtem widzia³eœ takie kamienie teleportacyjne?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_01");	//Przecie¿ ty te¿ by³eœ w kolonii karnej. Te kamienie nie wydawa³y ci siê dziwne?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_02");	//Jestem pewien, ¿e mo¿na je tu wci¹¿ znaleŸæ.
};

func void dia_addon_merdarion_adwhello_reaktor()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_reaktor_15_00");	//Co zasila kamienie teleportacyjne?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_01");	//Budowniczowie byli bardzo wysoko rozwiniêtym spo³eczeñstwem.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_02");	//Korzystali z magii w sposób, jakiego nigdy przedtem nie widzieliœmy.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_03");	//Stworzono sieæ kamieni teleportacyjnych, aby umo¿liwiæ budowniczym szybkie przemieszczanie siê po mieœcie.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_04");	//Kamienie w TYM miejscu wygl¹daj¹ na centralny punkt nawigacyjny.
};


instance DIA_ADDON_MERDARION_FOKUSGEBEN(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_fokusgeben_condition;
	information = dia_addon_merdarion_fokusgeben_info;
	description = "Daj mi kamieñ ogniskuj¹cy.";
};


func int dia_addon_merdarion_fokusgeben_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_fokusgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FokusGeben_15_00");	//Daj mi kamieñ ogniskuj¹cy. Zobaczê, czy uda mi siê uruchomiæ teleporty.
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_01");	//No có¿, dobrze. Ale uwa¿aj z nimi!
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_02");	//Saturas skróci³by mnie o g³owê, gdybyœmy je stracili.
	CreateInvItems(self,itmi_focus,1);
	b_giveinvitems(self,other,itmi_focus,1);
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSADW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSADW,"Mag Wody, Merdarion, da³ mi jeden ze starych kamieni ogniskuj¹cych, których u¿yto do stworzenia bariery w Górniczej Dolinie. Chce, bym uruchomi³ kamieñ teleportacyjny.");
};


instance DIA_ADDON_MERDARION_FIRSTFOCUS(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_firstfocus_condition;
	information = dia_addon_merdarion_firstfocus_info;
	description = "Uaktywni³em jeden z kamieni teleportacyjnych.";
};


func int dia_addon_merdarion_firstfocus_condition()
{
	if(TRIGGEREDTELEPORTERADW != 0)
	{
		return TRUE;
	};
};


var int merdarion_gotfocuscount;

func void dia_addon_merdarion_firstfocus_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_00");	//Uaktywni³em jeden z kamieni teleportacyjnych.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_01");	//Widzê. A wiêc jednak mia³em racjê.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_02");	//Ju¿ rozmawia³em o tym z innymi.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_03");	//Chcemy, ¿ebyœ uruchomi³ wszystkie kamienie teleportacyjne.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_04");	//W naszych badaniach bardzo przyda siê mo¿liwoœæ szybkiego przemieszczania siê pomiêdzy ró¿nymi dzielnicami.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_05");	//Oto kolejny kamieñ ogniskuj¹cy.
	CreateInvItems(self,itmi_focus,1);
	b_giveinvitems(self,other,itmi_focus,1);
	MERDARION_GOTFOCUSCOUNT = 1;
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_06");	//Postaraj siê uaktywniæ je wszystkie.
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_07");	//Zobaczê, co da siê zrobiæ.
	b_giveplayerxp(XP_ADDON_ACTIVATEDTELEPORTSTONE);
	b_logentry(TOPIC_ADDON_TELEPORTSADW,"Merdarion da³ mi kolejny kamieñ ogniskuj¹cy. Jeœli uruchomiê kamieñ teleportacyjny, dostanê nastêpny kamieñ ogniskuj¹cy. Dziêki temu uruchomiê wszystkie kamienie teleportacyjne.");
};


instance DIA_ADDON_MERDARION_ACTIVATETELEPORTS(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_activateteleports_condition;
	information = dia_addon_merdarion_activateteleports_info;
	permanent = TRUE;
	description = "Uruchomi³em kolejny kamieñ teleportacyjny.";
};


func int dia_addon_merdarion_activateteleports_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_firstfocus) && (TRIGGEREDTELEPORTERADW > MERDARION_GOTFOCUSCOUNT) && (MERDARION_GOTFOCUSCOUNT < 6))
	{
		return TRUE;
	};
};


var int dia_addon_merdarion_activateteleports_onetime;

func void dia_addon_merdarion_activateteleports_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_00");	//Uruchomi³em kolejny kamieñ teleportacyjny.
	if(SC_ADW_ACTIVATEDALLTELEPORTSTONES == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_01");	//Daj mi nastêpny kamieñ ogniskuj¹cy.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_02");	//Oczywiœcie. Proszê.
		CreateInvItems(self,itmi_focus,1);
		b_giveinvitems(self,other,itmi_focus,1);
	};
	if(DIA_ADDON_MERDARION_ACTIVATETELEPORTS_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_03");	//Czy to by³o trudne?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_04");	//I tak, i nie. Przyda³oby mi siê ma³e wsparcie.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_05");	//Mogê daæ ci trochê z³ota. To ci pomo¿e?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_06");	//Na pewno nie zaszkodzi.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_07");	//Niech zobaczê...
		DIA_ADDON_MERDARION_ACTIVATETELEPORTS_ONETIME = TRUE;
	};
	if(SC_ADW_ACTIVATEDALLTELEPORTSTONES == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_08");	//Naprawdê dobrze siê spisa³eœ. Mogê ci jedynie pogratulowaæ wykonanej pracy.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_09");	//Teraz dzia³aj¹ ju¿ wszystkie. Fascynuj¹cy widok, nie s¹dzisz?
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_10");	//Masz tu trochê z³otych monet.
	b_giveplayerxp(XP_ADDON_ACTIVATEDTELEPORTSTONE);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MERDARION_GOTFOCUSCOUNT = MERDARION_GOTFOCUSCOUNT + 1;
	if((MERDARION_GOTFOCUSCOUNT >= 1) && (SATURAS_SCBROUGHTALLTOKEN == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (MIS_SATURAS_LOOKINGFORHOUSESOFRULERS == 0))
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_11");	//O, zanim zapomnê... Saturas chcia³by siê z tob¹ widzieæ.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_12");	//Powinieneœ udaæ siê do niego jak najszybciej.
	};
};


instance DIA_ADDON_MERDARION_ADW_PRETEACHMANA(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_adw_preteachmana_condition;
	information = dia_addon_merdarion_adw_preteachmana_info;
	description = "Mo¿esz mnie nauczyæ czegoœ na temat magii?";
};


func int dia_addon_merdarion_adw_preteachmana_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_preteachmana_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PreTeachMana_15_00");	//Mo¿esz mnie nauczyæ czegoœ na temat magii?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PreTeachMana_06_01");	//Mogê ci pokazaæ, jak zwiêkszyæ moc magiczn¹.
	MERDARION_ADDON_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,"Merdarion mo¿e zwiêkszyæ moj¹ manê.");
};


instance DIA_ADDON_MERDARION_ADW_TEACH_MANA(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 99;
	condition = dia_addon_merdarion_adw_teach_mana_condition;
	information = dia_addon_merdarion_adw_teach_mana_info;
	permanent = TRUE;
	description = "Chcê zwiêkszyæ swoje zasoby magicznej energii.";
};


var int merdarion_adw_empty;

func int dia_addon_merdarion_adw_teach_mana_condition()
{
	if((MERDARION_ADW_EMPTY == FALSE) && (MERDARION_ADDON_TEACHMANA == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_teach_mana_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00");	//Chcê zwiêkszyæ swoje zasoby magicznej energii.
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_addon_merdarion_adw_teach_mana_5);
};

func void dia_addon_merdarion_adw_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00");	//Nie mogê spe³niæ twojej proœby.
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01");	//Nie mogê nauczyæ ciê ju¿ nic wiêcej.
		MERDARION_ADW_EMPTY = TRUE;
	};
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
};

func void dia_addon_merdarion_adw_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_addon_merdarion_adw_teach_mana_5);
};

func void dia_addon_merdarion_adw_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_addon_merdarion_adw_teach_mana_5);
};

