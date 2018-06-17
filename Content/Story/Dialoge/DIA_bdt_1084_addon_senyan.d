
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
		AI_Output(self,other,"DIA_Addon_Senyan_EXIT_12_00");	//Wiesz co robiæ....
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
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_00");	//Do czego móg³byœ mi siê przydaæ?
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_01");	//Hej, ch³opaki, patrzcie, kogo tu mamy!
	SENYAN_CALLED = TRUE;
	SENYAN_ERPRESSUNG = LOG_OBSOLETE;
	b_checklog();
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_senyan_erpressung()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_00");	//Ile chcesz?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_01");	//Och, nie. Nigdy bym nie pomyœla³, ¿eby ciê szanta¿owaæ, sk¹d....
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_02");	//Ile?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_03");	//Nie tak dawno temu ktoœ próbowa³ zabiæ Estebana. Jednak zgin¹³ z r¹k stra¿ników.
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_04");	//IdŸ do Estabana i porozmawiaj z nim. Potem utniemy sobie pogawêdkê.
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_ADDON_SENYAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SENYAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SENYAN,"Senyan mnie rozpozna³. Wie, kim jestem. Zamierza to wykorzystaæ do w³asnych celów. Coœ knuje i chce, ¿ebym porozmawia³ z Estebanem.");
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
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_01");	//Patrzcie, patrzcie, to ty. Mam dla ciebie trochê dobrych i z³ych wieœci.
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"Najpierw chcê us³yszeæ te dobre.",dia_addon_bdt_1084_senyan_hi_good);
	Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"Chcê najpierw us³yszeæ z³¹ wiadomoœæ.",dia_addon_bdt_1084_senyan_hi_bad);
};

func void dia_addon_bdt_1084_senyan_hi_good()
{
	if(SENYAN_MSG == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");	//Najpierw chcê us³yszeæ te dobre.
		SENYAN_MSG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");	//A jaka jest dobra wiadomoœæ?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");	//Nie wiem dlaczego, ale z pewnoœci¹ masz tu teraz wp³ywowych wrogów
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");	//Cieszê siê, ¿e to JA ciê rozpozna³em, a nie ktoœ inny.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");	//Jestem cz³owiekiem pe³nym zrozumienia, który potrafi ¿yæ w spo³ecznoœci.
	SENYAN_GOOD = TRUE;
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	if(SENYAN_BAD == TRUE)
	{
		b_senyan_erpressung();
	}
	else
	{
		Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"A jaka jest z³a wiadomoœæ?",dia_addon_bdt_1084_senyan_hi_bad);
	};
};

func void dia_addon_bdt_1084_senyan_hi_bad()
{
	if(SENYAN_MSG == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");	//Chcê najpierw us³yszeæ z³¹ wiadomoœæ.
		SENYAN_MSG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");	//A jaka jest z³a wiadomoœæ?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");	//Kruk ciê szuka. Jego stra¿nicy te¿. W zasadzie wszyscy bandyci...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");	//Jeœli siê na nich natkniesz, zabij¹ ciê.
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");	//Wielu ju¿ próbowa³o.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");	//Twoja sprawnoœæ w walce dorównuje przebieg³oœci. Zak³adaj¹c jeden z naszych pancerzy i przychodz¹c do obozu...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");	//...zachowa³eœ siê jak owca wstêpuj¹ca miêdzy wilki. St¹pasz po grz¹skim gruncie, panie ryzykancie.
	SENYAN_BAD = TRUE;
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	if(SENYAN_GOOD == TRUE)
	{
		b_senyan_erpressung();
	}
	else
	{
		Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"A jaka jest dobra wiadomoœæ?",dia_addon_bdt_1084_senyan_hi_good);
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
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_01");	//Rozmawia³eœ ju¿ z nim?
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_02");	//Jeszcze nie.
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_03");	//Nie zwlekaj zbyt d³ugo.
};


instance DIA_ADDON_SENYAN_ATTENTAT(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 2;
	condition = dia_addon_senyan_attentat_condition;
	information = dia_addon_senyan_attentat_info;
	permanent = FALSE;
	description = "Ju¿ z nim rozmawia³em.";
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
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_00");	//Ju¿ z nim rozmawia³em.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_01");	//Wspomina³ coœ o próbie zabójstwa?
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_02");	//Mam siê dowiedzieæ, kto za tym stoi. Wiesz coœ o tej sprawie?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_03");	//Niewiele wiêcej ni¿ ty. Sam szukam tego cz³owieka. Ale najbardziej interesuj¹ce jest to...
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_04");	//Zamieniam siê w s³uch.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_05");	//Chcê, ¿ebyœ dobrze wykona³ swoje zdanie. Masz znaleŸæ zdrajcê.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_06");	//A gdy go znajdziesz, zabij go - dla mnie.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_07");	//Nagroda przypadnie MNIE.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_08");	//Nie zapominaj, ¿e mam list goñczy na ciebie. Rób swoje i spraw siê dobrze. Wiesz, co stanie siê w przeciwnym wypadku.
	Info_ClearChoices(dia_addon_senyan_attentat);
	Info_AddChoice(dia_addon_senyan_attentat,"Wygl¹da na to, ¿e nie mam wyboru...",dia_addon_senyan_attentat_ja);
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
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_JA_15_00");	//Wygl¹da na to, ¿e nie mam wyboru...
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_01");	//Wiedzia³em, ¿e dojdziemy do porozumienia.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_02");	//Gdy dowiesz siê, kto to jest, razem zabijemy drania. A teraz zje¿d¿aj!
	SENYAN_ERPRESSUNG = LOG_RUNNING;
	Info_ClearChoices(dia_addon_senyan_attentat);
	b_logentry(TOPIC_ADDON_SENYAN,"Senyan chce, ¿ebym znalaz³ i zabi³ spiskowca, a sam zabierze nagrodê.");
};


instance DIA_ADDON_SENYAN_CHANGEPLAN(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 3;
	condition = dia_addon_senyan_changeplan_condition;
	information = dia_addon_senyan_changeplan_info;
	permanent = FALSE;
	description = "Zastanowi³em siê nad tym. Nie chcê z tob¹ wspó³pracowaæ!";
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
	AI_Output(other,self,"DIA_Addon_Senyan_ChangePlan_15_00");	//Zastanowi³em siê nad tym. Nie chcê z tob¹ wspó³pracowaæ!
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
	description = "Znalaz³em zdrajcê. To Fisk. ";
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
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Found_15_00");	//Znalaz³em zdrajcê. To Fisk.
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
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_derbe_12_00");	//Z³ama³eœ umowê.
	b_senyan_attack();
};

