
instance DIA_JORA_EXIT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 999;
	condition = dia_jora_exit_condition;
	information = dia_jora_exit_info;
	permanent = TRUE;
	description = "Muszê iœæ!";
};


func int dia_jora_exit_condition()
{
	return TRUE;
};

func void dia_jora_exit_info()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Jora_EXIT_08_00");	//Hej! Co z moimi pieniêdzmi?
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_SPERRE(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_sperre_condition;
	information = dia_jora_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_jora_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jora_sperre_info()
{
	AI_Output(self,other,"DIA_Jora_Sperre_08_00");	//Jesteœ skazañcem z kolonii górniczej. Nic ci nie sprzedam!
	AI_StopProcessInfos(self);
};


instance DIA_JORA_WAREZ(C_INFO)
{
	npc = vlk_408_jora;
	nr = 700;
	condition = dia_jora_warez_condition;
	information = dia_jora_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka¿ mi swoje towary.";
};


func int dia_jora_warez_condition()
{
	return TRUE;
};

func void dia_jora_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Jora_WAREZ_15_00");	//Poka¿ mi, co tam masz.
};


instance DIA_JORA_GREET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_greet_condition;
	information = dia_jora_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jora_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_greet_info()
{
	AI_Output(self,other,"DIA_Jora_GREET_08_00");	//Niech Innos bêdzie z tob¹, nieznajomy. Jeœli szukasz po¿¹dnych towarów dla podró¿nika, trafi³eœ we w³aœciwe miejsce.
	AI_Output(self,other,"DIA_Jora_GREET_08_01");	//Ale ostrzegam ciê - jeœli weŸmiesz coœ bez zap³aty, zawo³am stra¿ miejsk¹.
	AI_Output(other,self,"DIA_Jora_GREET_15_02");	//Chwileczkê, czy ja wygl¹dam na z³odzieja?
	AI_Output(self,other,"DIA_Jora_GREET_08_03");	//Ha! Nie by³byœ pierwszym, który ucieka dziœ z moimi rzeczami.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Jora handluje na targowisku wszelkiego rodzaju orê¿em.");
};


instance DIA_JORA_BESTOHLEN(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_bestohlen_condition;
	information = dia_jora_bestohlen_info;
	permanent = FALSE;
	description = "Ktoœ ciê okrad³?";
};


func int dia_jora_bestohlen_condition()
{
	return TRUE;
};

func void dia_jora_bestohlen_info()
{
	AI_Output(other,self,"DIA_Jora_Bestohlen_15_00");	//Ktoœ ciê okrad³?
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_01");	//Nie mogê tego udowodniæ. Goœæ by³ wyj¹tkowo przebieg³y. Przedstawi³ siê jako Rengaru - o ile to naprawdê jego imiê.
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_02");	//Przez kilka ostatnich dni krêci³ siê wokó³ targowiska.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Bestohlen_08_03");	//A co wieczór daje w szyjê przy stoisku z piwem w dolnej czêœci ulicy. Za³o¿ê siê, ¿e ten drañ pije za MOJE pieni¹dze.
	};
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_04");	//Na chwilê spuœci³em z niego wzrok, a moja sakiewka zniknê³a!
};

func void b_jora_goldforclue()
{
	AI_Output(self,other,"DIA_Jora_Add_08_04");	//S³uchaj, jeœli odzyskasz moje z³oto od tego Rengaru, powiem ci, co wiem.
};


instance DIA_JORA_HOLDEINGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_holdeingold_condition;
	information = dia_jora_holdeingold_info;
	permanent = FALSE;
	description = "Móg³bym odzyskaæ twoje z³oto.";
};


func int dia_jora_holdeingold_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_bestohlen))
	{
		return TRUE;
	};
};

func void dia_jora_holdeingold_info()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_15_00");	//Móg³bym odzyskaæ twoje z³oto.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_01");	//Hê? A czemu niby mia³byœ to zrobiæ?
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Chcê czêœæ z³ota jako nagrodê!",dia_jora_holdeingold_willbelohnung);
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		Info_AddChoice(dia_jora_holdeingold,"Szukam jakichœ informacji o gildii z³odziei!",dia_jora_holdeingold_ghdg);
	};
	if((other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		Info_AddChoice(dia_jora_holdeingold,"To zale¿y - pomo¿esz mi dostaæ siê do górnego miasta?",dia_jora_holdeingold_toov);
	};
};

func void dia_jora_holdeingold_toov()
{
	AI_Output(other,self,"DIA_Jora_Add_15_00");	//To zale¿y - pomo¿esz mi dostaæ siê do górnego miasta?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_03");	//Zwracasz siê do niew³aœciwego cz³owieka. Nie pochodzê z miasta - jak wiêkszoœæ kupców na targowisku.
	AI_Output(self,other,"DIA_Jora_Add_08_01");	//Jeœli chcesz dostaæ siê do górnego miasta, porozmawiaj z kupcami w dolnej czêœci Khorinis.
};

func void dia_jora_holdeingold_ghdg()
{
	AI_Output(other,self,"DIA_Jora_Add_15_02");	//Szukam informacji o gildii z³odziei!
	AI_Output(self,other,"DIA_Jora_Add_08_03");	//Mo¿liwe, ¿e móg³bym ci pomóc.
	b_jora_goldforclue();
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Zobaczê, co da siê zrobiæ.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"Ile by³o w sakiewce?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"Dlaczego nie zawo³a³eœ stra¿ników?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_willbelohnung()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_WillBelohnung_15_00");	//Chcê czêœæ z³ota jako nagrodê!
	AI_Output(self,other,"DIA_Jora_HolDeinGold_WillBelohnung_08_01");	//Najpierw odzyskaj moj¹ sakiewkê, a dopiero WTEDY pogadamy o twojej nagrodzie!
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Zobaczê, co da siê zrobiæ.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"Ile by³o w sakiewce?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"Dlaczego nie zawo³a³eœ stra¿ników?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_wache()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_Wache_15_00");	//Dlaczego nie zawo³a³eœ stra¿ników?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_01");	//Reaguj¹ tylko wtedy, jeœli siê z³apie z³odzieja na gor¹cym uczynku.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_02");	//A kiedy zauwa¿y³em, ¿e sakiewka zniknê³a, tego drania ju¿ nie by³o!
};

func void dia_jora_holdeingold_howmuch()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_HowMuch_15_00");	//Ile by³o w sakiewce?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_HowMuch_08_01");	//50 sztuk z³ota - to ca³kiem sporo w dzisiejszych, trudnych czasach.
};

func void dia_jora_holdeingold_doit()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_00");	//Zobaczê, co da siê zrobiæ.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_01");	//Ostro¿nie! Jeœli pobijesz tego drania, zajmie siê tym stra¿ miejska.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_02");	//Ostatnimi czasy zaczê³o siê tu robiæ naprawdê ciê¿ko. Od chwili gdy paladyni przybyli do miasta, stra¿nicy miejscy rozdaj¹ surowe kary za udzia³ w bijatykach.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_03");	//Wiêc lepiej coœ wymyœl...
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_04");	//Postaram siê.
	JORA_DIEB = LOG_RUNNING;
	JORA_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_JORADIEB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORADIEB,LOG_RUNNING);
	Log_CreateTopic(TOPIC_JORA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORA,LOG_RUNNING);
	b_logentry(TOPIC_JORA,"Niejaki Rengaru, który wiêkszoœæ czasu spêdza na targowisku, okrad³ handlarza imieniem Jora.");
	b_logentry(TOPIC_JORA,"Muszê odzyskaæ z³oto Jory.");
	b_logentry(TOPIC_JORADIEB,"Rengaru okrad³ kupca Jorê. Jeœli zdo³am go z³apaæ, dostanê nagrodê.");
	Info_ClearChoices(dia_jora_holdeingold);
};


instance DIA_JORA_WEGENDIEB(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_wegendieb_condition;
	information = dia_jora_wegendieb_info;
	permanent = TRUE;
	description = "Co do tego z³odzieja...";
};


func int dia_jora_wegendieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_wegendieb_info()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_15_00");	//Co do tego z³odzieja...
	AI_Output(self,other,"DIA_Jora_WegenDieb_08_01");	//Tak, i jak postêpy? Z³apa³eœ go? I - co najwa¿niejsze - czy masz moje z³oto?
	Info_ClearChoices(dia_jora_wegendieb);
	if(Npc_IsDead(rengaru))
	{
		Info_AddChoice(dia_jora_wegendieb,"Có¿, spotka³ go fatalny wypadek.",dia_jora_wegendieb_tot);
	}
	else if(RENGARU_INKNAST == TRUE)
	{
		Info_AddChoice(dia_jora_wegendieb,"Tak, z³apa³em go bez problemu.",dia_jora_wegendieb_imknast);
	}
	else if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		Info_AddChoice(dia_jora_wegendieb,"Uciek³ mi.",dia_jora_wegendieb_entkommen);
	};
	Info_AddChoice(dia_jora_wegendieb,"Wci¹¿ nad tym pracujê!",dia_jora_wegendieb_continue);
};

func void dia_jora_wegendieb_continue()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Continue_15_00");	//Wci¹¿ nad tym pracujê!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Continue_08_01");	//Wiêc dopilnuj, ¿ebym odzyska³ z³oto!
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_entkommen()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Entkommen_15_00");	//Uciek³ mi.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Entkommen_08_01");	//A co z moim z³otem? Uciek³o wraz z nim?
	JORA_DIEB = LOG_FAILED;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_imknast()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_ImKnast_15_00");	//Tak, z³apa³em go bez problemu. Przez jakiœ czas bêdzie gniæ w wiêzieniu.
	AI_Output(self,other,"DIA_Jora_WegenDieb_ImKnast_08_01");	//A co z moim z³otem?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_tot()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Tot_15_00");	//Có¿, spotka³ go fatalny wypadek.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_01");	//No to przynajmniej ju¿ nic nikomu nie ukradnie! Sprawiedliwoœæ Innosa zwyciê¿y³a.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_02");	//Gdzie jest moje z³oto?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};


instance DIA_JORA_BRINGGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_bringgold_condition;
	information = dia_jora_bringgold_info;
	permanent = TRUE;
	description = "Oto 50 sztuk z³ota, które ci ukrad³.";
};


func int dia_jora_bringgold_condition()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jora_bringgold_info()
{
	AI_Output(other,self,"DIA_Jora_BringGold_15_00");	//Oto 50 sztuk z³ota, które ci ukrad³.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_01");	//Chwa³a niech bêdzie Innosowi! W mieœcie wci¹¿ panuje sprawiedliwoœæ.
		JORA_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_JORA_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_03");	//Hej, to wcale nie jest 50 sztuk z³ota! Ty te¿ chcesz mnie okraœæ?
	};
};


var int jora_ghdghinweis;

instance DIA_JORA_GHDGINFO(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_ghdginfo_condition;
	information = dia_jora_ghdginfo_info;
	permanent = TRUE;
	description = "Co wiesz na temat gildii z³odziei?";
};


func int dia_jora_ghdginfo_condition()
{
	if((MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jora_bestohlen) && (JORA_GHDGHINWEIS == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_ghdginfo_info()
{
	AI_Output(other,self,"DIA_Jora_Add_15_05");	//Co wiesz na temat gildii z³odziei?
	if(JORA_GOLD != LOG_SUCCESS)
	{
		b_jora_goldforclue();
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_Add_08_06");	//Dobra - ale uwa¿aj - jakby co, to nie s³ysza³eœ nic z tego, co zaraz ci powiem, capisce?
		AI_Output(self,other,"DIA_Jora_Add_08_07");	//Jest paru podejrzanych osobników, którzy czêsto zagl¹daj¹ do knajpy w porcie.
		AI_Output(self,other,"DIA_Jora_Add_08_08");	//Za³o¿ê siê, ¿e jej gospodarz wie to i owo...
		AI_Output(self,other,"DIA_Jora_Add_08_09");	//Jeœli zamierzasz wyœledziæ z³odziei, to powinieneœ z NIM porozmawiaæ.
		AI_Output(self,other,"DIA_Jora_Add_08_10");	//Móg³byœ siê zachowywaæ, jakbyœ mia³ coœ na sumieniu. Mo¿e siê na to nabierze.
		AI_Output(self,other,"DIA_Jora_Add_08_11");	//Ale b¹dŸ bardzo ostro¿ny. Z tymi ludŸmi nie ma ¿artów.
		JORA_GHDGHINWEIS = TRUE;
	};
};


instance DIA_JORA_BELOHNUNG(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_belohnung_condition;
	information = dia_jora_belohnung_info;
	permanent = FALSE;
	description = "Chcê czêœæ z³ota jako nagrodê!";
};


func int dia_jora_belohnung_condition()
{
	if(JORA_GOLD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jora_belohnung_info()
{
	AI_Output(other,self,"DIA_Jora_Belohnung_15_00");	//Chcê czêœæ z³ota jako nagrodê!
	if(JORA_GHDGHINWEIS == TRUE)
	{
		AI_Output(self,other,"DIA_Jora_Add_08_12");	//Ale da³em ci ju¿ u¿yteczn¹ wskazówkê.
		AI_Output(self,other,"DIA_Jora_Add_08_13");	//To powinno ci wystarczyæ.
	};
	AI_Output(self,other,"DIA_Jora_Add_08_14");	//Jeœli chcesz z³ota, to schwytaj z³odziei i odbierz nagrodê od Lorda Andre.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Belohnung_08_03");	//A teraz muszê zaj¹æ siê swoimi klientami...
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_ALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_alriksschwert_condition;
	information = dia_jora_alriksschwert_info;
	permanent = FALSE;
	description = "Alrik mówi, ¿e masz jego miecz...";
};


func int dia_jora_alriksschwert_condition()
{
	if(MIS_ALRIK_SWORD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_alriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_00");	//Alrik mówi, ¿e masz jego miecz...
	AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_01");	//Chodzi ci o tego obdartusa, który wymieni³ swoj¹ broñ na parê pochodni i kawa³ków miêsa?
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_02");	//Tak, o niego.
	if(Npc_HasItems(self,itmw_alrikssword_mis) > 0)
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_03");	//Wci¹¿ mam ten miecz.
		AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_04");	//Ile za niego chcesz?
		if(JORA_GOLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_05");	//Có¿ - jak dla ciebie...
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_06");	//A co mi tam! Masz, trzymaj. W koñcu pomog³eœ mi odzyskaæ moje z³oto...
			b_giveinvitems(self,other,itmw_alrikssword_mis,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_07");	//Có¿ - dla ciebie - 50 sztuk z³ota.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_08");	//Ju¿ go nie mam! Diabli wiedz¹, gdzie teraz mo¿e byæ.
	};
};


instance DIA_JORA_BUYALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_buyalriksschwert_condition;
	information = dia_jora_buyalriksschwert_info;
	permanent = TRUE;
	description = "Oto 50 sztuk z³ota. Daj mi teraz miecz Alrika.";
};


func int dia_jora_buyalriksschwert_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_alriksschwert) && (Npc_HasItems(self,itmw_alrikssword_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_jora_buyalriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_BUYAlriksSchwert_15_00");	//Oto 50 sztuk z³ota. Daj mi teraz miecz Alrika.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_04");	//Proszê - to by³ dobry interes.
		b_giveinvitems(self,other,itmw_alrikssword_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_05");	//Nie masz doœæ z³ota. Ale nie martw siê - na jakiœ czas zatrzymam ten miecz. Zg³oœ siê po niego póŸniej...
	};
};


instance DIA_JORA_PICKPOCKET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 900;
	condition = dia_jora_pickpocket_condition;
	information = dia_jora_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jora_pickpocket_condition()
{
	return c_beklauen(31,45);
};

func void dia_jora_pickpocket_info()
{
	Info_ClearChoices(dia_jora_pickpocket);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_BACK,dia_jora_pickpocket_back);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_PICKPOCKET,dia_jora_pickpocket_doit);
};

func void dia_jora_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jora_pickpocket);
};

func void dia_jora_pickpocket_back()
{
	Info_ClearChoices(dia_jora_pickpocket);
};

