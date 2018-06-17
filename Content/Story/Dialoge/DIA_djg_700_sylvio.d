
instance DIA_SYLVIODJG_EXIT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 999;
	condition = dia_sylviodjg_exit_condition;
	information = dia_sylviodjg_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_sylviodjg_exit_condition()
{
	return 1;
};

func void dia_sylviodjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIODJG_HELLOAGAIN(C_INFO)
{
	npc = djg_700_sylvio;
	condition = dia_sylviodjg_helloagain_condition;
	information = dia_sylviodjg_helloagain_info;
	important = TRUE;
};


func int dia_sylviodjg_helloagain_condition()
{
	if((Npc_IsDead(icedragon) == FALSE) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_helloagain_info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00");	//A niech mnie! Szukasz ³atwej kasy, hê? Wiedzia³em! Masz duszê najemnika.
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01");	//S³uchaj no, jeœli myœlisz, ¿e tu zarobisz, to jesteœ w b³êdzie. Ja by³em pierwszy.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02");	//Hej, ty! Magowie strasznie mnie wkurzaj¹! Spadaj st¹d! Nie masz tu czego szukaæ.
	}
	else
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03");	//Hej, ty, paladyn! Wracaj do swojej kopalni rudy. Nic tu po tobie.
	};
	AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04");	//Rozumiem. Nikt nie lubi dzieliæ siê ³upem.
	AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05");	//Ty to powiedzia³eœ. Teraz znikaj.
};


instance DIA_SYLVIO_VERSAGER(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 6;
	condition = dia_sylvio_versager_condition;
	information = dia_sylvio_versager_info;
	description = "A jeœli tego nie zrobiê?";
};


func int dia_sylvio_versager_condition()
{
	if(Npc_KnowsInfo(other,dia_sylviodjg_helloagain) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_versager_info()
{
	AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");	//A jeœli tego nie zrobiê?
	AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");	//Nie zgrywaj mi tu wa¿nego, spadaj, albo skoñczysz jak ta œwinia, le¿¹c na œniegu z bebechami na wierzchu.
};


instance DIA_SYLVIO_DEINELEUTE(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 7;
	condition = dia_sylvio_deineleute_condition;
	information = dia_sylvio_deineleute_info;
	description = "To byli twoi ludzie?";
};


func int dia_sylvio_deineleute_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_versager) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_DJG_SYLVIO_KILLICEGOLEM == 0))
	{
		return TRUE;
	};
};

func void dia_sylvio_deineleute_info()
{
	AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");	//To byli twoi ludzie?
	AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");	//Ju¿ nie. ¯adna strata. Ci idioci byli nic niewarci.
};


instance DIA_SYLVIO_WASISTPASSIERT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 8;
	condition = dia_sylvio_wasistpassiert_condition;
	information = dia_sylvio_wasistpassiert_info;
	description = "Co im siê sta³o?";
};


func int dia_sylvio_wasistpassiert_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_versager) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_wasistpassiert_info()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");	//Co im siê sta³o?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");	//Nie potrafili poradziæ sobie z lodowymi gigantami, a teraz w¹chaj¹ kwiatki od strony pod³o¿a.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//Skoro taki z ciebie twardziel, to mo¿e ty spróbujesz.
	Info_AddChoice(dia_sylvio_wasistpassiert,"W porz¹dku, czemu nie?",dia_sylvio_wasistpassiert_ok);
	Info_AddChoice(dia_sylvio_wasistpassiert,"Dobra, a co TY bêdziesz z tego mia³?",dia_sylvio_wasistpassiert_washastdudavon);
	Info_AddChoice(dia_sylvio_wasistpassiert,"A co JA bêdê z tego mia³?",dia_sylvio_wasistpassiert_warum);
	Info_AddChoice(dia_sylvio_wasistpassiert,"Dlaczego sam siê ich nie pozbêdziesz?",dia_sylvio_wasistpassiert_selbst);
	Log_CreateTopic(TOPIC_SYLVIOKILLICEGOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SYLVIOKILLICEGOLEM,LOG_RUNNING);
	b_logentry(TOPIC_SYLVIOKILLICEGOLEM,"Sylvio boi siê dwóch lodowych golemów strzeg¹cych wejœcia do skutego lodem obszaru Górniczej Doliny.");
	MIS_DJG_SYLVIO_KILLICEGOLEM = LOG_RUNNING;
};

func void dia_sylvio_wasistpassiert_selbst()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00");	//Dlaczego sam siê ich nie pozbêdziesz?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01");	//Spokojnie, spokojnie. Nie strosz siê tak.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02");	//Jeœli chcesz znaæ moje zdanie, to robisz ze strachu pod siebie.
	Info_AddChoice(dia_sylvio_wasistpassiert,"Nie mam zamiaru uczestniczyæ w twoich gierkach.",dia_sylvio_wasistpassiert_keininteresse);
};


var int djg_sylvio_promisedmoney;

func void dia_sylvio_wasistpassiert_warum()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");	//Co ja bêdê z tego mia³?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");	//Ja wiem... Powiedzmy 1000 sztuk z³ota. Co ty na to?
	DJG_SYLVIO_PROMISEDMONEY = TRUE;
};

func void dia_sylvio_wasistpassiert_washastdudavon()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00");	//Dobra, a co TY bêdziesz z tego mia³?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01");	//Ten znowu to samo. Mam zamiar pow³óczyæ siê po lodowej krainie.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02");	//Jest parê spraw, z którymi mam problem.
	Info_AddChoice(dia_sylvio_wasistpassiert,"Co takiego kryje w sobie lodowa kraina?",dia_sylvio_wasistpassiert_eisregion);
};

func void dia_sylvio_wasistpassiert_keininteresse()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");	//Nie mam zamiaru uczestniczyæ w twoich gierkach.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");	//Taak. Wiêc wynoœ siê st¹d, tchórzu.
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasistpassiert_eisregion()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");	//Co takiego kryje w sobie lodowa kraina?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");	//Ty chyba nie masz doœæ tych swoich pytañ, co? Dobra, powiem ci.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//Tutaj, za klifami, rozci¹ga siê lodowa kraina, jakiej nigdy jeszcze nie widzia³eœ.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//Podobno znajduje siê tam wielki skarb lodowego smoka.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");	//Ja zaœ chcê tego skarbu. Wiêc jak? Zgadzasz siê, czy nie?
};

func void dia_sylvio_wasistpassiert_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");	//W porz¹dku, czemu nie?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");	//Poœpiesz siê wiêc. Nie mam dla ciebie ca³ego dnia.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_ICEGOLEMSKILLED(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 9;
	condition = dia_sylvio_icegolemskilled_condition;
	information = dia_sylvio_icegolemskilled_info;
	description = "Przejœcie jest bezpieczne!";
};


func int dia_sylvio_icegolemskilled_condition()
{
	if(Npc_IsDead(icegolem_sylvio1) && Npc_IsDead(icegolem_sylvio2) && (MIS_DJG_SYLVIO_KILLICEGOLEM == LOG_RUNNING) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_icegolemskilled_info()
{
	AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");	//Przejœcie jest bezpieczne! Pozby³em siê lodowych gigantów.
	AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");	//Œwietna robota. Niech no i ja siê przyjrzê.
	if(DJG_SYLVIO_PROMISEDMONEY == TRUE)
	{
		AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");	//Chwileczkê. A co z moimi pieniêdzmi?
		AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");	//Wszystko w swoim czasie.
	};
	AI_StopProcessInfos(self);
	MIS_DJG_SYLVIO_KILLICEGOLEM = LOG_SUCCESS;
	b_giveplayerxp(XP_SYLVIODJGICEGOLEMDEAD);
	Npc_ExchangeRoutine(self,"IceWait1");
	b_startotherroutine(djg_bullco,"IceWait1");
};


instance DIA_SYLVIO_WASJETZT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 10;
	condition = dia_sylvio_wasjetzt_condition;
	information = dia_sylvio_wasjetzt_info;
	description = "Co dalej?";
};


func int dia_sylvio_wasjetzt_condition()
{
	if((MIS_DJG_SYLVIO_KILLICEGOLEM == LOG_SUCCESS) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_wasjetzt_info()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");	//Co dalej?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");	//Có¿. Obawiam siê, ¿e nie jest dobrze.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");	//Najlepiej bêdzie, jeœli pójdziesz przodem, a ja za tob¹.
	Info_AddChoice(dia_sylvio_wasjetzt,"Niech ci bêdzie.",dia_sylvio_wasjetzt_ok);
	Info_AddChoice(dia_sylvio_wasjetzt,"Czy¿byœ siê ba³?",dia_sylvio_wasjetzt_trennen);
	Info_AddChoice(dia_sylvio_wasjetzt,"Nie bêdê odwala³ za ciebie brudnej roboty.",dia_sylvio_wasjetzt_nein);
	if(DJG_SYLVIO_PROMISEDMONEY == TRUE)
	{
		Info_AddChoice(dia_sylvio_wasjetzt,"Najpierw mi zap³aæ.",dia_sylvio_wasjetzt_geld);
	};
};

func void dia_sylvio_wasjetzt_trennen()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");	//Czy¿byœ siê ba³?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");	//Nonsens. Przestañ bredziæ, tylko prowadŸ.
};

func void dia_sylvio_wasjetzt_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_ok_15_00");	//Niech ci bêdzie.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");	//No dalej. Do dzie³a.
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasjetzt_nein()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00");	//Nie bêdê odwala³ za ciebie brudnej roboty.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01");	//Tchórz!
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasjetzt_geld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00");	//Najpierw mi zap³aæ.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01");	//Kiedy pozbêdziemy siê smoka, dostaniesz tyle z³ota, ile zdo³asz unieœæ.
	Info_AddChoice(dia_sylvio_wasjetzt,"Chcê moich pieniêdzy, natychmiast.",dia_sylvio_wasjetzt_jetztgeld);
};

func void dia_sylvio_wasjetzt_jetztgeld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");	//Chcê moich pieniêdzy, natychmiast.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");	//Albo idziesz przodem, albo bêdziesz mia³ ze mn¹ do czynienia.
};


instance DIA_SYLVIO_KOMMSTDU(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 11;
	condition = dia_sylvio_kommstdu_condition;
	information = dia_sylvio_kommstdu_info;
	permanent = TRUE;
	description = "Myœla³em, ¿e wybierasz siê do lodowej krainy.";
};


func int dia_sylvio_kommstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_wasjetzt) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_kommstdu_info()
{
	AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");	//Myœla³em, ¿e wybierasz siê do lodowej krainy.
	AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");	//No dalej, idŸ przodem. Bêdê zaraz za tob¹.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_DUHIER(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 11;
	condition = dia_sylvio_duhier_condition;
	information = dia_sylvio_duhier_info;
	permanent = TRUE;
	description = "Przyda³aby mi siê pomoc.";
};


func int dia_sylvio_duhier_condition()
{
	if((Npc_IsDead(icedragon) == FALSE) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_sylvio_duhier_info()
{
	AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");	//Przyda³aby mi siê pomoc.
	AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");	//Nonsens. Œwietnie sobie radzisz.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIODJG_WHATNEXT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 12;
	condition = dia_sylviodjg_whatnext_condition;
	information = dia_sylviodjg_whatnext_info;
	important = TRUE;
};


func int dia_sylviodjg_whatnext_condition()
{
	if(Npc_IsDead(icedragon))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_whatnext_info()
{
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");	//Lodowy smok nie ¿yje. Teraz dawaj wszystko, co masz przy sobie!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//Po moim trupie!
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");	//To mnie bêd¹ s³awiæ za zabicie smoka.
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");	//Twoja rola w tym przedstawieniu w³aœnie dobieg³a koñca!
	TOPIC_END_SYLVIOKILLICEGOLEM = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_sylviodjg_whatnext);
	Info_AddChoice(dia_sylviodjg_whatnext,DIALOG_ENDE,dia_sylviodjg_whatnext_attack);
};

func void dia_sylviodjg_whatnext_attack()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(djg_bullco,"Start");
	b_logentry(TOPIC_DRAGONHUNTER,"Sylvio, ta œwinia, próbowa³ sobie przyw³aszczyæ moje zas³ugi w pokonaniu lodowych smoków. Wysz³a z tego niez³a k³ótnia.");
	b_attack(self,other,AR_NONE,1);
	b_attack(djg_bullco,other,AR_NONE,1);
};


instance DIA_SYLVIODJG_BUTNOW(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 13;
	condition = dia_sylviodjg_butnow_condition;
	information = dia_sylviodjg_butnow_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_sylviodjg_butnow_condition()
{
	if(Npc_IsDead(icedragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,dia_sylviodjg_whatnext))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_butnow_info()
{
	AI_Output(self,other,"DIA_SylvioDJG_BUTNOW_09_00");	//Czas na zap³atê.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	b_attack(self,other,AR_NONE,1);
	b_attack(djg_bullco,other,AR_NONE,1);
};


instance DIA_SYLVIO_PICKPOCKET(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 900;
	condition = dia_sylvio_pickpocket_condition;
	information = dia_sylvio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_sylvio_pickpocket_condition()
{
	return c_beklauen(78,560);
};

func void dia_sylvio_pickpocket_info()
{
	Info_ClearChoices(dia_sylvio_pickpocket);
	Info_AddChoice(dia_sylvio_pickpocket,DIALOG_BACK,dia_sylvio_pickpocket_back);
	Info_AddChoice(dia_sylvio_pickpocket,DIALOG_PICKPOCKET,dia_sylvio_pickpocket_doit);
};

func void dia_sylvio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sylvio_pickpocket);
};

func void dia_sylvio_pickpocket_back()
{
	Info_ClearChoices(dia_sylvio_pickpocket);
};

