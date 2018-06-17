
instance DIA_JORA_EXIT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 999;
	condition = dia_jora_exit_condition;
	information = dia_jora_exit_info;
	permanent = TRUE;
	description = "Musz� i��!";
};


func int dia_jora_exit_condition()
{
	return TRUE;
};

func void dia_jora_exit_info()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Jora_EXIT_08_00");	//Hej! Co z moimi pieni�dzmi?
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
	AI_Output(self,other,"DIA_Jora_Sperre_08_00");	//Jeste� skaza�cem z kolonii g�rniczej. Nic ci nie sprzedam!
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
	description = "Poka� mi swoje towary.";
};


func int dia_jora_warez_condition()
{
	return TRUE;
};

func void dia_jora_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Jora_WAREZ_15_00");	//Poka� mi, co tam masz.
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
	AI_Output(self,other,"DIA_Jora_GREET_08_00");	//Niech Innos b�dzie z tob�, nieznajomy. Je�li szukasz po��dnych towar�w dla podr�nika, trafi�e� we w�a�ciwe miejsce.
	AI_Output(self,other,"DIA_Jora_GREET_08_01");	//Ale ostrzegam ci� - je�li we�miesz co� bez zap�aty, zawo�am stra� miejsk�.
	AI_Output(other,self,"DIA_Jora_GREET_15_02");	//Chwileczk�, czy ja wygl�dam na z�odzieja?
	AI_Output(self,other,"DIA_Jora_GREET_08_03");	//Ha! Nie by�by� pierwszym, kt�ry ucieka dzi� z moimi rzeczami.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Jora handluje na targowisku wszelkiego rodzaju or�em.");
};


instance DIA_JORA_BESTOHLEN(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_bestohlen_condition;
	information = dia_jora_bestohlen_info;
	permanent = FALSE;
	description = "Kto� ci� okrad�?";
};


func int dia_jora_bestohlen_condition()
{
	return TRUE;
};

func void dia_jora_bestohlen_info()
{
	AI_Output(other,self,"DIA_Jora_Bestohlen_15_00");	//Kto� ci� okrad�?
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_01");	//Nie mog� tego udowodni�. Go�� by� wyj�tkowo przebieg�y. Przedstawi� si� jako Rengaru - o ile to naprawd� jego imi�.
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_02");	//Przez kilka ostatnich dni kr�ci� si� wok� targowiska.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Bestohlen_08_03");	//A co wiecz�r daje w szyj� przy stoisku z piwem w dolnej cz�ci ulicy. Za�o�� si�, �e ten dra� pije za MOJE pieni�dze.
	};
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_04");	//Na chwil� spu�ci�em z niego wzrok, a moja sakiewka znikn�a!
};

func void b_jora_goldforclue()
{
	AI_Output(self,other,"DIA_Jora_Add_08_04");	//S�uchaj, je�li odzyskasz moje z�oto od tego Rengaru, powiem ci, co wiem.
};


instance DIA_JORA_HOLDEINGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_holdeingold_condition;
	information = dia_jora_holdeingold_info;
	permanent = FALSE;
	description = "M�g�bym odzyska� twoje z�oto.";
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
	AI_Output(other,self,"DIA_Jora_HolDeinGold_15_00");	//M�g�bym odzyska� twoje z�oto.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_01");	//H�? A czemu niby mia�by� to zrobi�?
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Chc� cz�� z�ota jako nagrod�!",dia_jora_holdeingold_willbelohnung);
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		Info_AddChoice(dia_jora_holdeingold,"Szukam jakich� informacji o gildii z�odziei!",dia_jora_holdeingold_ghdg);
	};
	if((other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		Info_AddChoice(dia_jora_holdeingold,"To zale�y - pomo�esz mi dosta� si� do g�rnego miasta?",dia_jora_holdeingold_toov);
	};
};

func void dia_jora_holdeingold_toov()
{
	AI_Output(other,self,"DIA_Jora_Add_15_00");	//To zale�y - pomo�esz mi dosta� si� do g�rnego miasta?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_03");	//Zwracasz si� do niew�a�ciwego cz�owieka. Nie pochodz� z miasta - jak wi�kszo�� kupc�w na targowisku.
	AI_Output(self,other,"DIA_Jora_Add_08_01");	//Je�li chcesz dosta� si� do g�rnego miasta, porozmawiaj z kupcami w dolnej cz�ci Khorinis.
};

func void dia_jora_holdeingold_ghdg()
{
	AI_Output(other,self,"DIA_Jora_Add_15_02");	//Szukam informacji o gildii z�odziei!
	AI_Output(self,other,"DIA_Jora_Add_08_03");	//Mo�liwe, �e m�g�bym ci pom�c.
	b_jora_goldforclue();
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Zobacz�, co da si� zrobi�.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"Ile by�o w sakiewce?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"Dlaczego nie zawo�a�e� stra�nik�w?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_willbelohnung()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_WillBelohnung_15_00");	//Chc� cz�� z�ota jako nagrod�!
	AI_Output(self,other,"DIA_Jora_HolDeinGold_WillBelohnung_08_01");	//Najpierw odzyskaj moj� sakiewk�, a dopiero WTEDY pogadamy o twojej nagrodzie!
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Zobacz�, co da si� zrobi�.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"Ile by�o w sakiewce?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"Dlaczego nie zawo�a�e� stra�nik�w?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_wache()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_Wache_15_00");	//Dlaczego nie zawo�a�e� stra�nik�w?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_01");	//Reaguj� tylko wtedy, je�li si� z�apie z�odzieja na gor�cym uczynku.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_02");	//A kiedy zauwa�y�em, �e sakiewka znikn�a, tego drania ju� nie by�o!
};

func void dia_jora_holdeingold_howmuch()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_HowMuch_15_00");	//Ile by�o w sakiewce?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_HowMuch_08_01");	//50 sztuk z�ota - to ca�kiem sporo w dzisiejszych, trudnych czasach.
};

func void dia_jora_holdeingold_doit()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_00");	//Zobacz�, co da si� zrobi�.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_01");	//Ostro�nie! Je�li pobijesz tego drania, zajmie si� tym stra� miejska.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_02");	//Ostatnimi czasy zacz�o si� tu robi� naprawd� ci�ko. Od chwili gdy paladyni przybyli do miasta, stra�nicy miejscy rozdaj� surowe kary za udzia� w bijatykach.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_03");	//Wi�c lepiej co� wymy�l...
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_04");	//Postaram si�.
	JORA_DIEB = LOG_RUNNING;
	JORA_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_JORADIEB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORADIEB,LOG_RUNNING);
	Log_CreateTopic(TOPIC_JORA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORA,LOG_RUNNING);
	b_logentry(TOPIC_JORA,"Niejaki Rengaru, kt�ry wi�kszo�� czasu sp�dza na targowisku, okrad� handlarza imieniem Jora.");
	b_logentry(TOPIC_JORA,"Musz� odzyska� z�oto Jory.");
	b_logentry(TOPIC_JORADIEB,"Rengaru okrad� kupca Jor�. Je�li zdo�am go z�apa�, dostan� nagrod�.");
	Info_ClearChoices(dia_jora_holdeingold);
};


instance DIA_JORA_WEGENDIEB(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_wegendieb_condition;
	information = dia_jora_wegendieb_info;
	permanent = TRUE;
	description = "Co do tego z�odzieja...";
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
	AI_Output(other,self,"DIA_Jora_WegenDieb_15_00");	//Co do tego z�odzieja...
	AI_Output(self,other,"DIA_Jora_WegenDieb_08_01");	//Tak, i jak post�py? Z�apa�e� go? I - co najwa�niejsze - czy masz moje z�oto?
	Info_ClearChoices(dia_jora_wegendieb);
	if(Npc_IsDead(rengaru))
	{
		Info_AddChoice(dia_jora_wegendieb,"C�, spotka� go fatalny wypadek.",dia_jora_wegendieb_tot);
	}
	else if(RENGARU_INKNAST == TRUE)
	{
		Info_AddChoice(dia_jora_wegendieb,"Tak, z�apa�em go bez problemu.",dia_jora_wegendieb_imknast);
	}
	else if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		Info_AddChoice(dia_jora_wegendieb,"Uciek� mi.",dia_jora_wegendieb_entkommen);
	};
	Info_AddChoice(dia_jora_wegendieb,"Wci�� nad tym pracuj�!",dia_jora_wegendieb_continue);
};

func void dia_jora_wegendieb_continue()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Continue_15_00");	//Wci�� nad tym pracuj�!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Continue_08_01");	//Wi�c dopilnuj, �ebym odzyska� z�oto!
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_entkommen()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Entkommen_15_00");	//Uciek� mi.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Entkommen_08_01");	//A co z moim z�otem? Uciek�o wraz z nim?
	JORA_DIEB = LOG_FAILED;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_imknast()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_ImKnast_15_00");	//Tak, z�apa�em go bez problemu. Przez jaki� czas b�dzie gni� w wi�zieniu.
	AI_Output(self,other,"DIA_Jora_WegenDieb_ImKnast_08_01");	//A co z moim z�otem?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_tot()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Tot_15_00");	//C�, spotka� go fatalny wypadek.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_01");	//No to przynajmniej ju� nic nikomu nie ukradnie! Sprawiedliwo�� Innosa zwyci�y�a.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_02");	//Gdzie jest moje z�oto?
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
	description = "Oto 50 sztuk z�ota, kt�re ci ukrad�.";
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
	AI_Output(other,self,"DIA_Jora_BringGold_15_00");	//Oto 50 sztuk z�ota, kt�re ci ukrad�.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_01");	//Chwa�a niech b�dzie Innosowi! W mie�cie wci�� panuje sprawiedliwo��.
		JORA_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_JORA_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_03");	//Hej, to wcale nie jest 50 sztuk z�ota! Ty te� chcesz mnie okra��?
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
	description = "Co wiesz na temat gildii z�odziei?";
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
	AI_Output(other,self,"DIA_Jora_Add_15_05");	//Co wiesz na temat gildii z�odziei?
	if(JORA_GOLD != LOG_SUCCESS)
	{
		b_jora_goldforclue();
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_Add_08_06");	//Dobra - ale uwa�aj - jakby co, to nie s�ysza�e� nic z tego, co zaraz ci powiem, capisce?
		AI_Output(self,other,"DIA_Jora_Add_08_07");	//Jest paru podejrzanych osobnik�w, kt�rzy cz�sto zagl�daj� do knajpy w porcie.
		AI_Output(self,other,"DIA_Jora_Add_08_08");	//Za�o�� si�, �e jej gospodarz wie to i owo...
		AI_Output(self,other,"DIA_Jora_Add_08_09");	//Je�li zamierzasz wy�ledzi� z�odziei, to powiniene� z NIM porozmawia�.
		AI_Output(self,other,"DIA_Jora_Add_08_10");	//M�g�by� si� zachowywa�, jakby� mia� co� na sumieniu. Mo�e si� na to nabierze.
		AI_Output(self,other,"DIA_Jora_Add_08_11");	//Ale b�d� bardzo ostro�ny. Z tymi lud�mi nie ma �art�w.
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
	description = "Chc� cz�� z�ota jako nagrod�!";
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
	AI_Output(other,self,"DIA_Jora_Belohnung_15_00");	//Chc� cz�� z�ota jako nagrod�!
	if(JORA_GHDGHINWEIS == TRUE)
	{
		AI_Output(self,other,"DIA_Jora_Add_08_12");	//Ale da�em ci ju� u�yteczn� wskaz�wk�.
		AI_Output(self,other,"DIA_Jora_Add_08_13");	//To powinno ci wystarczy�.
	};
	AI_Output(self,other,"DIA_Jora_Add_08_14");	//Je�li chcesz z�ota, to schwytaj z�odziei i odbierz nagrod� od Lorda Andre.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Belohnung_08_03");	//A teraz musz� zaj�� si� swoimi klientami...
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
	description = "Alrik m�wi, �e masz jego miecz...";
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
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_00");	//Alrik m�wi, �e masz jego miecz...
	AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_01");	//Chodzi ci o tego obdartusa, kt�ry wymieni� swoj� bro� na par� pochodni i kawa�k�w mi�sa?
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_02");	//Tak, o niego.
	if(Npc_HasItems(self,itmw_alrikssword_mis) > 0)
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_03");	//Wci�� mam ten miecz.
		AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_04");	//Ile za niego chcesz?
		if(JORA_GOLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_05");	//C� - jak dla ciebie...
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_06");	//A co mi tam! Masz, trzymaj. W ko�cu pomog�e� mi odzyska� moje z�oto...
			b_giveinvitems(self,other,itmw_alrikssword_mis,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_07");	//C� - dla ciebie - 50 sztuk z�ota.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_08");	//Ju� go nie mam! Diabli wiedz�, gdzie teraz mo�e by�.
	};
};


instance DIA_JORA_BUYALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_buyalriksschwert_condition;
	information = dia_jora_buyalriksschwert_info;
	permanent = TRUE;
	description = "Oto 50 sztuk z�ota. Daj mi teraz miecz Alrika.";
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
	AI_Output(other,self,"DIA_Jora_BUYAlriksSchwert_15_00");	//Oto 50 sztuk z�ota. Daj mi teraz miecz Alrika.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_04");	//Prosz� - to by� dobry interes.
		b_giveinvitems(self,other,itmw_alrikssword_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_05");	//Nie masz do�� z�ota. Ale nie martw si� - na jaki� czas zatrzymam ten miecz. Zg�o� si� po niego p�niej...
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

