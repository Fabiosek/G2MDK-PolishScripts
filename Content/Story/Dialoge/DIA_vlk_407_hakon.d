
instance DIA_HAKON_EXIT(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 999;
	condition = dia_hakon_exit_condition;
	information = dia_hakon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hakon_exit_condition()
{
	return TRUE;
};

func void dia_hakon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_SPERRE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_sperre_condition;
	information = dia_hakon_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hakon_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hakon_sperre_info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//Uciekaj st¹d, skazañcu! Canthar powiedzia³ mi, jaki z ciebie drañ!
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_HALLO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_hallo_condition;
	information = dia_hakon_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_hakon_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hakon_hallo_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//Jestem Hakon, handlarz broni¹.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//W dzisiejszych czasach ka¿dy powinien nosiæ broñ. Szczególnie poza miastem.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Hakon sprzedaje broñ na targowisku.");
};


instance DIA_HAKON_TRADE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 99;
	condition = dia_hakon_trade_condition;
	information = dia_hakon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka¿ mi swoje towary.";
};


func int dia_hakon_trade_condition()
{
	return TRUE;
};

func void dia_hakon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//Poka¿ mi swoje towary.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//To dla mnie zaszczyt, ¿e reprezentant naszego œwiêtego koœcio³a okazuje zainteresowanie moimi towarami.
	};
};


instance DIA_ADDON_HAKON_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_addon_hakon_missingpeople_condition;
	information = dia_addon_hakon_missingpeople_info;
	description = "Co wiesz o zaginionych mieszkañcach Khorinis?";
};


func int dia_addon_hakon_missingpeople_condition()
{
	if(SC_HEAREDABOUTMISSINGPEOPLE == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_hakon_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Hakon_MissingPeople_15_00");	//Co wiesz o zaginionych mieszkañcach Khorinis?
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_01");	//Wielu z nich przechodzi przez wschodni¹ bramê miasta.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_02");	//Czêœci z tych, którzy przychodz¹, nie widzia³em nigdy w ¿yciu... A wielu takich, którzy wychodz¹, nigdy ju¿ nie wraca.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_03");	//Tylko... Ostatnio wydarzy³o siê coœ niezwyk³ego.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_04");	//By³ taki goœæ... Chyba Joe mia³ na imiê. Gada³ na lewo i na prawo, jaki to wkrótce bêdzie bogaty.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_05");	//Twierdzi³, ¿e zna sposób na dostanie siê do wie¿, w których stra¿ przechowuje broñ.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_06");	//Od tej pory przesta³ siê pojawiaæ - nie zobaczy³em go ju¿ nigdy, choæ wczeœniej widywa³em go codziennie o tej samej porze.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_07");	//Pomyœla³em, ¿e mo¿e aresztowa³a go stra¿ i ich o to zapyta³em.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_08");	//Lord Andre nie mia³ pojêcia, o co mi chodzi - nigdy nawet nie s³ysza³ o tym goœciu.
	Log_CreateTopic(TOPIC_ADDON_JOE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_JOE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_JOE,"Hakon, kupiec z Khorinis, twierdzi, ¿e cz³owiek o imieniu Joe znikn¹³ bez œladu. Podobno Joe wiedzia³, jak dostaæ siê do wie¿ miejskich, w których przechowywana jest broñ stra¿y.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_OUTOFTOWN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_outoftown_condition;
	information = dia_hakon_outoftown_info;
	permanent = FALSE;
	description = "Opowiedz mi o terenach wokó³ miasta.";
};


func int dia_hakon_outoftown_condition()
{
	return TRUE;
};

func void dia_hakon_outoftown_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//Opowiedz mi o terenach wokó³ miasta.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//Zrobi³o siê tam cholernie niebezpiecznie.
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//Po pierwsze - z powodu bandytów, po drugie - z powodu dzikich bestii.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//Nawet zwierzêta g³oduj¹ w dzisiejszych czasach.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//Dlatego zapuszczaj¹ siê coraz bli¿ej miasta.
};


instance DIA_HAKON_PALADINE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_paladine_condition;
	information = dia_hakon_paladine_info;
	permanent = FALSE;
	description = "Co wiesz na temat paladynów?";
};


func int dia_hakon_paladine_condition()
{
	return TRUE;
};

func void dia_hakon_paladine_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//Co wiesz na temat paladynów?
	AI_Output(self,other,"DIA_Hakon_Add_12_08");	//Ci goœcie doprowadzaj¹ mnie do ruiny!
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//W mieœcie mo¿na kupiæ co najwy¿ej krótkie miecze.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//Wszystko, co jest d³u¿sze ni¿ pó³ metra, zostaje przez nich skonfiskowane.
	AI_Output(self,other,"DIA_Hakon_Add_12_11");	//A w zamian mogê sobie za darmo pomieszkaæ w gospodzie - ha!
};


instance DIA_HAKON_WOWAFFEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_wowaffen_condition;
	information = dia_hakon_wowaffen_info;
	permanent = FALSE;
	description = "Sk¹d bierzesz broñ?";
};


func int dia_hakon_wowaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_paladine))
	{
		return TRUE;
	};
};

func void dia_hakon_wowaffen_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//Sk¹d bierzesz broñ?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//Znik¹d! Do tej pory moim dostawc¹ by³ Harad.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//Do tej pory kupowa³em broñ od kowala Harada.
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_15");	//Jednak teraz Harad produkuje miecze tylko i wy³¹cznie na u¿ytek paladynów.
	AI_Output(self,other,"DIA_Hakon_Add_12_16");	//Pracuje dla nich jak szalony dzieñ i noc, i to za darmo. Uwa¿a to za swój obowi¹zek.
	AI_Output(self,other,"DIA_Hakon_Add_12_17");	//Dlatego mogê ci zaoferowaæ jedynie resztki moich towarów...
};


instance DIA_HAKON_HARADBANDITS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_haradbandits_condition;
	information = dia_hakon_haradbandits_info;
	permanent = FALSE;
	description = "Harad powiedzia³ mi o ataku bandytów...";
};


func int dia_hakon_haradbandits_condition()
{
	if(HARAD_HAKONMISSION == TRUE)
	{
		return TRUE;
	};
};

func void dia_hakon_haradbandits_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//Harad powiedzia³ mi o ataku bandytów...
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//Doprawdy?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//Obieca³ udzieliæ mi poparcia, jeœli zrobiê z nimi porz¹dek.
	AI_Output(self,other,"DIA_Hakon_Add_12_21");	//Poczciwy stary Harad. Pewnie w ten sposób daje do zrozumienia, jak mu przykro, ¿e nie mo¿e mi sprzedaæ ¿adnej broni.
};


instance DIA_HAKON_BANDITEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_banditen_condition;
	information = dia_hakon_banditen_info;
	permanent = FALSE;
	description = "Co wiesz na temat bandytów?";
};


func int dia_hakon_banditen_condition()
{
	if(Npc_KnowsInfo(hero,dia_hakon_haradbandits) || Npc_KnowsInfo(hero,dia_hakon_outoftown))
	{
		return TRUE;
	};
};

func void dia_hakon_banditen_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//Co wiesz na temat bandytów?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//Co wiem na temat bandytów? Obrabowali mnie w drodze do miasta!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//I nie tylko mnie. Kr¹¿¹ po okolicy ju¿ od jakiegoœ czasu.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//Stra¿ próbowa³a ich znaleŸæ, ale nic z tego.
	MIS_HAKONBANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HAKONBANDITEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HAKONBANDITEN,LOG_RUNNING);
	b_logentry(TOPIC_HAKONBANDITEN,"Handlarz broni¹, Hakon, zosta³ obrabowany poza murami miasta przez bandytów.");
};


instance DIA_HAKON_WIEVIEL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_wieviel_condition;
	information = dia_hakon_wieviel_info;
	permanent = FALSE;
	description = "Zajmê siê tym...";
};


func int dia_hakon_wieviel_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wieviel_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//Zajmê siê tym...
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//Co, TY siê nimi zajmiesz? Zupe³nie sam? Chyba musisz byæ niez³ym wojownikiem, co?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//Ile mi za to zap³acisz?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//Chcesz siê wkupiæ w ³aski Harada, co?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//Nie s¹dzê, abym musia³ ci za to p³aciæ...
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//To niebezpieczne zadanie.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//No dobrze. Jeœli pokonasz bandytów, dostaniesz ode mnie 100 sztuk z³ota.
		MIS_HAKONBANDITSPAY = TRUE;
	};
	Info_ClearChoices(dia_hakon_banditen);
};


instance DIA_HAKON_MILIZ(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_miliz_condition;
	information = dia_hakon_miliz_info;
	permanent = FALSE;
	description = "Czy wiesz, kto ze stra¿y bra³ udzia³ w poszukiwaniach?";
};


func int dia_hakon_miliz_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_miliz_info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//Czy wiesz, kto ze stra¿y bra³ udzia³ w poszukiwaniach?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//Nazywa siê Pablo. On i jeszcze parê osób próbowali odnaleŸæ kryjówkê bandytów. Na pró¿no.
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//Czy wiesz, gdzie przebywa Pablo?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//Patroluje miasto. Znajdziesz go albo na placu œwi¹tynnym, albo w dolnej czêœci miasta.
	b_logentry(TOPIC_HAKONBANDITEN,"Pablo, cz³onek stra¿y miejskiej, bra³ udzia³ w bezowocnych poszukiwaniach bandytów.");
};


instance DIA_HAKON_WO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_wo_condition;
	information = dia_hakon_wo_info;
	permanent = FALSE;
	description = "Gdzie ciê napadli?";
};


func int dia_hakon_wo_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wo_info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//Gdzie ciê napadli?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//W pobli¿u farmy Akila. IdŸ do bramy miasta i udaj siê drog¹ w prawo.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//Po jakimœ czasie dojdziesz do schodów. To stamt¹d nadeszli ci dranie. Za³o¿ê siê, ¿e maj¹ kryjówkê w lesie.
};


instance DIA_HAKON_SUCCESS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_success_condition;
	information = dia_hakon_success_info;
	permanent = FALSE;
	description = "Zaj¹³em siê bandytami.";
};


func int dia_hakon_success_condition()
{
	if((MIS_HAKONBANDITS == LOG_RUNNING) && Npc_IsDead(bandit_1) && Npc_IsDead(bandit_2) && Npc_IsDead(bandit_3))
	{
		return TRUE;
	};
};

func void dia_hakon_success_info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//Zaj¹³em siê bandytami.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//Doprawdy? Ka¿dy mo¿e tak powiedzieæ. Masz na to jakiœ dowód?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//Czy mam tam wróciæ i obci¹æ im g³owy?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//Nie - to chyba nie bêdzie konieczne. Wierzê ci.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//Odda³eœ miastu i kupcom ogromn¹ przys³ugê.
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//S¹dzê, ¿e Harada ucieszy ta wiadomoœæ.
	};
	if(MIS_HAKONBANDITSPAY == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//Oto obiecane pieni¹dze.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	MIS_HAKONBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_HAKON_BANDITS);
};


instance DIA_HAKON_MINENANTEIL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_minenanteil_condition;
	information = dia_hakon_minenanteil_info;
	permanent = FALSE;
	description = "Sprzedajesz udzia³y w kopalni? Sk¹d je wzi¹³eœ?";
};


func int dia_hakon_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_hakon_minenanteil_info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//Sprzedajesz udzia³y w kopalni? Sk¹d je wzi¹³eœ?
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//Przykro mi, nie mogê ci powiedzieæ. Mog³oby siê to dla mnie Ÿle skoñczyæ.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_PICKPOCKET(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 900;
	condition = dia_hakon_pickpocket_condition;
	information = dia_hakon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_hakon_pickpocket_condition()
{
	return c_beklauen(45,65);
};

func void dia_hakon_pickpocket_info()
{
	Info_ClearChoices(dia_hakon_pickpocket);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_BACK,dia_hakon_pickpocket_back);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_PICKPOCKET,dia_hakon_pickpocket_doit);
};

func void dia_hakon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hakon_pickpocket);
};

func void dia_hakon_pickpocket_back()
{
	Info_ClearChoices(dia_hakon_pickpocket);
};


instance DIA_HAKON_KAPITEL2(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_kapitel2_condition;
	information = dia_hakon_kapitel2_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hakon_kapitel2_condition()
{
	if((KAPITEL >= 2) && (CANTHAR_SPERRE == FALSE) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_kapitel2_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//To znowu ty!
	AI_Output(self,other,"DIA_Hakon_Add_12_23");	//Harad wreszcie skoñczy³ produkowaæ broñ dla paladynów.
	AI_Output(self,other,"DIA_Hakon_Add_12_24");	//W zwi¹zku z tym mój wybór towarów znacznie siê powiêkszy³. Zainteresowany?
};

