
instance DIA_ADDON_SENYAN_EXIT(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 999;
	condition = dia_addon_senyan_exit_condition;
	information = dia_addon_senyan_exit_info;
	permanent = TRUE;
	description = "To do zobaczenia...";
};


func int dia_addon_senyan_exit_condition()
{
	return TRUE;
};

func void dia_addon_senyan_exit_info()
{
	if(SENYAN_ERPRESSUNG == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Senyan_EXIT_12_00");	//Wiesz co robi�....
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SENYAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 900;
	condition = dia_addon_senyan_pickpocket_condition;
	information = dia_addon_senyan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_senyan_pickpocket_condition()
{
	return c_beklauen(45,88);
};

func void dia_addon_senyan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_senyan_pickpocket);
	Info_AddChoice(dia_addon_senyan_pickpocket,DIALOG_BACK,dia_addon_senyan_pickpocket_back);
	Info_AddChoice(dia_addon_senyan_pickpocket,DIALOG_PICKPOCKET,dia_addon_senyan_pickpocket_doit);
};

func void dia_addon_senyan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_senyan_pickpocket);
};

func void dia_addon_senyan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_senyan_pickpocket);
};

func void b_senyan_attack()
{
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_00");	//Do czego m�g�by� mi si� przyda�?
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_01");	//Hej, ch�opaki, patrzcie, kogo tu mamy!
	SENYAN_CALLED = TRUE;
	SENYAN_ERPRESSUNG = LOG_OBSOLETE;
	b_checklog();
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_senyan_erpressung()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_00");	//Ile chcesz?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_01");	//Och, nie. Nigdy bym nie pomy�la�, �eby ci� szanta�owa�, sk�d....
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_02");	//Ile?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_03");	//Nie tak dawno temu kto� pr�bowa� zabi� Estebana. Jednak zgin�� z r�k stra�nik�w.
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_04");	//Id� do Estabana i porozmawiaj z nim. Potem utniemy sobie pogaw�dk�.
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_ADDON_SENYAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SENYAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SENYAN,"Senyan mnie rozpozna�. Wie, kim jestem. Zamierza to wykorzysta� do w�asnych cel�w. Co� knuje i chce, �ebym porozmawia� z Estebanem.");
};


instance DIA_ADDON_BDT_1084_SENYAN_HI(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 1;
	condition = dia_addon_senyan_hi_condition;
	information = dia_addon_senyan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_senyan_hi_condition()
{
	return TRUE;
};


var int senyan_msg;
var int senyan_bad;
var int senyan_good;

func void dia_addon_senyan_hi_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_00");	//Ach. Kogo my tu mamy?
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_01");	//Patrzcie, patrzcie, to ty. Mam dla ciebie troch� dobrych i z�ych wie�ci.
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"Najpierw chc� us�ysze� te dobre.",dia_addon_bdt_1084_senyan_hi_good);
	Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"Chc� najpierw us�ysze� z�� wiadomo��.",dia_addon_bdt_1084_senyan_hi_bad);
};

func void dia_addon_bdt_1084_senyan_hi_good()
{
	if(SENYAN_MSG == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");	//Najpierw chc� us�ysze� te dobre.
		SENYAN_MSG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");	//A jaka jest dobra wiadomo��?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");	//Nie wiem dlaczego, ale z pewno�ci� masz tu teraz wp�ywowych wrog�w
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");	//Ciesz� si�, �e to JA ci� rozpozna�em, a nie kto� inny.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");	//Jestem cz�owiekiem pe�nym zrozumienia, kt�ry potrafi �y� w spo�eczno�ci.
	SENYAN_GOOD = TRUE;
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	if(SENYAN_BAD == TRUE)
	{
		b_senyan_erpressung();
	}
	else
	{
		Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"A jaka jest z�a wiadomo��?",dia_addon_bdt_1084_senyan_hi_bad);
	};
};

func void dia_addon_bdt_1084_senyan_hi_bad()
{
	if(SENYAN_MSG == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");	//Chc� najpierw us�ysze� z�� wiadomo��.
		SENYAN_MSG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");	//A jaka jest z�a wiadomo��?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");	//Kruk ci� szuka. Jego stra�nicy te�. W zasadzie wszyscy bandyci...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");	//Je�li si� na nich natkniesz, zabij� ci�.
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");	//Wielu ju� pr�bowa�o.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");	//Twoja sprawno�� w walce dor�wnuje przebieg�o�ci. Zak�adaj�c jeden z naszych pancerzy i przychodz�c do obozu...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");	//...zachowa�e� si� jak owca wst�puj�ca mi�dzy wilki. St�pasz po grz�skim gruncie, panie ryzykancie.
	SENYAN_BAD = TRUE;
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	if(SENYAN_GOOD == TRUE)
	{
		b_senyan_erpressung();
	}
	else
	{
		Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"A jaka jest dobra wiadomo��?",dia_addon_bdt_1084_senyan_hi_good);
	};
};


instance DIA_ADDON_SENYAN_UNTERWEGS(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 99;
	condition = dia_addon_senyan_unterwegs_condition;
	information = dia_addon_senyan_unterwegs_info;
	permanent = TRUE;
	description = "A co do Estebana....";
};


func int dia_addon_senyan_unterwegs_condition()
{
	if((MIS_JUDAS != LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_unterwegs_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_00");	//A co do Estebana....
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_01");	//Rozmawia�e� ju� z nim?
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_02");	//Jeszcze nie.
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_03");	//Nie zwlekaj zbyt d�ugo.
};


instance DIA_ADDON_SENYAN_ATTENTAT(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 2;
	condition = dia_addon_senyan_attentat_condition;
	information = dia_addon_senyan_attentat_info;
	permanent = FALSE;
	description = "Ju� z nim rozmawia�em.";
};


func int dia_addon_senyan_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_00");	//Ju� z nim rozmawia�em.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_01");	//Wspomina� co� o pr�bie zab�jstwa?
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_02");	//Mam si� dowiedzie�, kto za tym stoi. Wiesz co� o tej sprawie?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_03");	//Niewiele wi�cej ni� ty. Sam szukam tego cz�owieka. Ale najbardziej interesuj�ce jest to...
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_04");	//Zamieniam si� w s�uch.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_05");	//Chc�, �eby� dobrze wykona� swoje zdanie. Masz znale�� zdrajc�.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_06");	//A gdy go znajdziesz, zabij go - dla mnie.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_07");	//Nagroda przypadnie MNIE.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_08");	//Nie zapominaj, �e mam list go�czy na ciebie. R�b swoje i spraw si� dobrze. Wiesz, co stanie si� w przeciwnym wypadku.
	Info_ClearChoices(dia_addon_senyan_attentat);
	Info_AddChoice(dia_addon_senyan_attentat,"Wygl�da na to, �e nie mam wyboru...",dia_addon_senyan_attentat_ja);
	Info_AddChoice(dia_addon_senyan_attentat,"Nie ma mowy!",dia_addon_senyan_attentat_no);
};

func void dia_addon_senyan_attentat_no()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_NO_15_00");	//Nie ma mowy!
	b_senyan_attack();
	Info_ClearChoices(dia_addon_senyan_attentat);
};

func void dia_addon_senyan_attentat_ja()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_JA_15_00");	//Wygl�da na to, �e nie mam wyboru...
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_01");	//Wiedzia�em, �e dojdziemy do porozumienia.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_02");	//Gdy dowiesz si�, kto to jest, razem zabijemy drania. A teraz zje�d�aj!
	SENYAN_ERPRESSUNG = LOG_RUNNING;
	Info_ClearChoices(dia_addon_senyan_attentat);
	b_logentry(TOPIC_ADDON_SENYAN,"Senyan chce, �ebym znalaz� i zabi� spiskowca, a sam zabierze nagrod�.");
};


instance DIA_ADDON_SENYAN_CHANGEPLAN(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 3;
	condition = dia_addon_senyan_changeplan_condition;
	information = dia_addon_senyan_changeplan_info;
	permanent = FALSE;
	description = "Zastanowi�em si� nad tym. Nie chc� z tob� wsp�pracowa�!";
};


func int dia_addon_senyan_changeplan_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (SNAF_TIP_SENYAN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_changeplan_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_ChangePlan_15_00");	//Zastanowi�em si� nad tym. Nie chc� z tob� wsp�pracowa�!
	b_senyan_attack();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_1084_SENYAN_FOUND(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 3;
	condition = dia_addon_senyan_found_condition;
	information = dia_addon_senyan_found_info;
	permanent = FALSE;
	description = "Znalaz�em zdrajc�. To Fisk. ";
};


func int dia_addon_senyan_found_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (MIS_JUDAS == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_found_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Found_15_00");	//Znalaz�em zdrajc�. To Fisk.
	b_senyan_attack();
};


instance DIA_ADDON_BDT_1084_SENYAN_DERBE(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 1;
	condition = dia_addon_senyan_derbe_condition;
	information = dia_addon_senyan_derbe_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_senyan_derbe_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (MIS_JUDAS == LOG_SUCCESS) && (Npc_IsDead(fisk) || Npc_IsDead(esteban)))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_derbe_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_derbe_12_00");	//Z�ama�e� umow�.
	b_senyan_attack();
};

