
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
	description = "Co s�ycha�?";
};


func int dia_addon_merdarion_adwhello_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_adwhello_back()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_Back_15_00");	//Do�� ju� s�ysza�em.
	Info_ClearChoices(dia_addon_merdarion_adwhello);
};

func void dia_addon_merdarion_adwhello_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_01");	//S�yszysz? Dziwne, prawda?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//Hmm...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_03");	//Kamienie teleportacyjne nie dzia�aj�, ale wci�� s�ycha� szum.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_04");	//Cho� nie s� aktywne, to drzemie w nich u�piona energia.
	Info_ClearChoices(dia_addon_merdarion_adwhello);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Co zasila kamienie teleportacyjne?",dia_addon_merdarion_adwhello_reaktor);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Jak my�lisz, co mo�e by� potrzebne do ich uaktywnienia?",dia_addon_merdarion_adwhello_was);
};

func void dia_addon_merdarion_adwhello_was()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_was_15_00");	//Jak my�lisz, co mo�e by� potrzebne do ich uaktywnienia?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_01");	//Mam pewne podejrzenia. Potrzebuj� tylko dowodu na poparcie mojej teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_02");	//Kilka dni temu mia�em wra�enie, �e gdzie� ju� widzia�em obiekty w podobnym stylu.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_03");	//Podejrzewam, �e chc�c je ponownie uruchomi�, nale�a�oby w nie wt�oczy� ogromne ilo�ci magicznej energii.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Gdzie przedtem widzia�e� takie kamienie teleportacyjne?",dia_addon_merdarion_adwhello_wo);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Co mo�e zawiera� do�� energii?",dia_addon_merdarion_adwhello_focus);
};

func void dia_addon_merdarion_adwhello_focus()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_00");	//Co mo�e zawiera� do�� energii?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_01");	//Przychodzi mi na my�l tylko jedno.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_02");	//My�l� o jednym z pi�ciu kamieni ogniskuj�cych, kt�rych u�yto do stworzenia magicznej bariery w G�rniczej Dolinie.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_03");	//Z tego, co wiem, mia�e� je dla nas zdoby� jaki� czas temu.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_04");	//Tak. Pami�tam.
	Info_AddChoice(dia_addon_merdarion_adwhello,"M�wi�e�, �e potrzebujesz dowod�w na poparcie twych domys��w?",dia_addon_merdarion_adwhello_focusproof);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Gdzie s� teraz kamienie ogniskuj�ce?",dia_addon_merdarion_adwhello_focuswo);
};

func void dia_addon_merdarion_adwhello_focuswo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusWo_15_00");	//Gdzie s� teraz kamienie ogniskuj�ce?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_01");	//Zosta�y mi przekazane. Mam si� nimi opiekowa�, a� znajdziemy dla nich inne zastosowanie.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_02");	//Wygl�da na to, �e ten czas w�a�nie nasta�.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Do�� ju� s�ysza�em.",dia_addon_merdarion_adwhello_back);
};

func void dia_addon_merdarion_adwhello_focusproof()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusProof_15_00");	//M�wi�e�, �e potrzebujesz dowod�w na poparcie twych domys��w?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_01");	//Trzeba w�o�y� kamie� ogniskuj�cy do kamienia teleportacyjnego.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_02");	//Ale nie wiem, w kt�rym miejscu.
};

func void dia_addon_merdarion_adwhello_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_wo_15_00");	//Gdzie przedtem widzia�e� takie kamienie teleportacyjne?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_01");	//Przecie� ty te� by�e� w kolonii karnej. Te kamienie nie wydawa�y ci si� dziwne?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_02");	//Jestem pewien, �e mo�na je tu wci�� znale��.
};

func void dia_addon_merdarion_adwhello_reaktor()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_reaktor_15_00");	//Co zasila kamienie teleportacyjne?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_01");	//Budowniczowie byli bardzo wysoko rozwini�tym spo�ecze�stwem.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_02");	//Korzystali z magii w spos�b, jakiego nigdy przedtem nie widzieli�my.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_03");	//Stworzono sie� kamieni teleportacyjnych, aby umo�liwi� budowniczym szybkie przemieszczanie si� po mie�cie.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_04");	//Kamienie w TYM miejscu wygl�daj� na centralny punkt nawigacyjny.
};


instance DIA_ADDON_MERDARION_FOKUSGEBEN(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_fokusgeben_condition;
	information = dia_addon_merdarion_fokusgeben_info;
	description = "Daj mi kamie� ogniskuj�cy.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_FokusGeben_15_00");	//Daj mi kamie� ogniskuj�cy. Zobacz�, czy uda mi si� uruchomi� teleporty.
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_01");	//No c�, dobrze. Ale uwa�aj z nimi!
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_02");	//Saturas skr�ci�by mnie o g�ow�, gdyby�my je stracili.
	CreateInvItems(self,itmi_focus,1);
	b_giveinvitems(self,other,itmi_focus,1);
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSADW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSADW,"Mag Wody, Merdarion, da� mi jeden ze starych kamieni ogniskuj�cych, kt�rych u�yto do stworzenia bariery w G�rniczej Dolinie. Chce, bym uruchomi� kamie� teleportacyjny.");
};


instance DIA_ADDON_MERDARION_FIRSTFOCUS(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_firstfocus_condition;
	information = dia_addon_merdarion_firstfocus_info;
	description = "Uaktywni�em jeden z kamieni teleportacyjnych.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_00");	//Uaktywni�em jeden z kamieni teleportacyjnych.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_01");	//Widz�. A wi�c jednak mia�em racj�.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_02");	//Ju� rozmawia�em o tym z innymi.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_03");	//Chcemy, �eby� uruchomi� wszystkie kamienie teleportacyjne.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_04");	//W naszych badaniach bardzo przyda si� mo�liwo�� szybkiego przemieszczania si� pomi�dzy r�nymi dzielnicami.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_05");	//Oto kolejny kamie� ogniskuj�cy.
	CreateInvItems(self,itmi_focus,1);
	b_giveinvitems(self,other,itmi_focus,1);
	MERDARION_GOTFOCUSCOUNT = 1;
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_06");	//Postaraj si� uaktywni� je wszystkie.
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_07");	//Zobacz�, co da si� zrobi�.
	b_giveplayerxp(XP_ADDON_ACTIVATEDTELEPORTSTONE);
	b_logentry(TOPIC_ADDON_TELEPORTSADW,"Merdarion da� mi kolejny kamie� ogniskuj�cy. Je�li uruchomi� kamie� teleportacyjny, dostan� nast�pny kamie� ogniskuj�cy. Dzi�ki temu uruchomi� wszystkie kamienie teleportacyjne.");
};


instance DIA_ADDON_MERDARION_ACTIVATETELEPORTS(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_activateteleports_condition;
	information = dia_addon_merdarion_activateteleports_info;
	permanent = TRUE;
	description = "Uruchomi�em kolejny kamie� teleportacyjny.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_00");	//Uruchomi�em kolejny kamie� teleportacyjny.
	if(SC_ADW_ACTIVATEDALLTELEPORTSTONES == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_01");	//Daj mi nast�pny kamie� ogniskuj�cy.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_02");	//Oczywi�cie. Prosz�.
		CreateInvItems(self,itmi_focus,1);
		b_giveinvitems(self,other,itmi_focus,1);
	};
	if(DIA_ADDON_MERDARION_ACTIVATETELEPORTS_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_03");	//Czy to by�o trudne?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_04");	//I tak, i nie. Przyda�oby mi si� ma�e wsparcie.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_05");	//Mog� da� ci troch� z�ota. To ci pomo�e?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_06");	//Na pewno nie zaszkodzi.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_07");	//Niech zobacz�...
		DIA_ADDON_MERDARION_ACTIVATETELEPORTS_ONETIME = TRUE;
	};
	if(SC_ADW_ACTIVATEDALLTELEPORTSTONES == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_08");	//Naprawd� dobrze si� spisa�e�. Mog� ci jedynie pogratulowa� wykonanej pracy.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_09");	//Teraz dzia�aj� ju� wszystkie. Fascynuj�cy widok, nie s�dzisz?
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_10");	//Masz tu troch� z�otych monet.
	b_giveplayerxp(XP_ADDON_ACTIVATEDTELEPORTSTONE);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MERDARION_GOTFOCUSCOUNT = MERDARION_GOTFOCUSCOUNT + 1;
	if((MERDARION_GOTFOCUSCOUNT >= 1) && (SATURAS_SCBROUGHTALLTOKEN == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (MIS_SATURAS_LOOKINGFORHOUSESOFRULERS == 0))
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_11");	//O, zanim zapomn�... Saturas chcia�by si� z tob� widzie�.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_12");	//Powiniene� uda� si� do niego jak najszybciej.
	};
};


instance DIA_ADDON_MERDARION_ADW_PRETEACHMANA(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_adw_preteachmana_condition;
	information = dia_addon_merdarion_adw_preteachmana_info;
	description = "Mo�esz mnie nauczy� czego� na temat magii?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PreTeachMana_15_00");	//Mo�esz mnie nauczy� czego� na temat magii?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PreTeachMana_06_01");	//Mog� ci pokaza�, jak zwi�kszy� moc magiczn�.
	MERDARION_ADDON_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,"Merdarion mo�e zwi�kszy� moj� man�.");
};


instance DIA_ADDON_MERDARION_ADW_TEACH_MANA(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 99;
	condition = dia_addon_merdarion_adw_teach_mana_condition;
	information = dia_addon_merdarion_adw_teach_mana_info;
	permanent = TRUE;
	description = "Chc� zwi�kszy� swoje zasoby magicznej energii.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00");	//Chc� zwi�kszy� swoje zasoby magicznej energii.
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_addon_merdarion_adw_teach_mana_5);
};

func void dia_addon_merdarion_adw_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00");	//Nie mog� spe�ni� twojej pro�by.
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01");	//Nie mog� nauczy� ci� ju� nic wi�cej.
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

