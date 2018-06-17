
instance DIA_JACK_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_exit_condition;
	information = dia_jack_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_jack_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_PICKPOCKET(C_INFO)
{
	npc = vlk_444_jack;
	nr = 900;
	condition = dia_jack_pickpocket_condition;
	information = dia_jack_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jack_pickpocket_condition()
{
	return c_beklauen(50,100);
};

func void dia_jack_pickpocket_info()
{
	Info_ClearChoices(dia_jack_pickpocket);
	Info_AddChoice(dia_jack_pickpocket,DIALOG_BACK,dia_jack_pickpocket_back);
	Info_AddChoice(dia_jack_pickpocket,DIALOG_PICKPOCKET,dia_jack_pickpocket_doit);
};

func void dia_jack_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jack_pickpocket);
};

func void dia_jack_pickpocket_back()
{
	Info_ClearChoices(dia_jack_pickpocket);
};


instance DIA_JACK_GREET(C_INFO)
{
	npc = vlk_444_jack;
	nr = 4;
	condition = dia_jack_greet_condition;
	information = dia_jack_greet_info;
	important = TRUE;
};


func int dia_jack_greet_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jack_greet_info()
{
	AI_Output(self,other,"DIA_Jack_GREET_14_00");	//Ahoj, szczurze l¹dowy! Utkn¹³eœ tu na dobre, co?
	AI_Output(self,other,"DIA_Jack_GREET_14_01");	//He, he... Trochê blado wygl¹dasz.
	AI_Output(self,other,"DIA_Jack_GREET_14_02");	//Ale nie przejmuj siê, ch³opcze. Przyda ci siê trochê œwie¿ej, morskiej bryzy, ot i wszystko!
};


instance DIA_JACK_JOB(C_INFO)
{
	npc = vlk_444_jack;
	nr = 5;
	condition = dia_jack_job_condition;
	information = dia_jack_job_info;
	description = "Co tu porabiasz?";
};


func int dia_jack_job_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_greet))
	{
		return TRUE;
	};
};

func void dia_jack_job_info()
{
	AI_Output(other,self,"DIA_Jack_Job_15_00");	//Czym siê tu zajmujesz?
	AI_Output(self,other,"DIA_Jack_Job_14_01");	//Dawno temu, kiedy by³em takim m³odzikiem jak ty, wyruszy³em w morze i ¿eglowa³em przez niejeden sztorm.
	AI_Output(self,other,"DIA_Jack_Job_14_02");	//Wiele lat temu osiad³em w Khorinis i zaj¹³em siê tutejsz¹ latarni¹.
	AI_Output(self,other,"DIA_Jack_Job_14_03");	//Gdzie tam, niby nic wielkiego... Ale tylko dziêki tej starej wie¿y mogê byæ blisko mojego prawdziwego domu.
	AI_Output(self,other,"DIA_Jack_Job_14_04");	//Nie by³em na górze od wieków...
	AI_Output(other,self,"DIA_Jack_Job_15_05");	//Dlaczego?
	AI_Output(self,other,"DIA_Jack_Job_14_06");	//Odk¹d te ³otry zajê³y moj¹ latarniê, ba³em siê do niej zbli¿yæ na dwadzieœcia kroków. Banda ³ajdaków.
	AI_Output(self,other,"DIA_Jack_Job_14_07");	//Wiesz, to ci bandyci z Górniczej Doliny.
	AI_Output(self,other,"DIA_Jack_Job_14_08");	//Najpierw po drugiej stronie gór by³ wielki huk, a potem ca³a ta zgraja zwali³a siê do miasta jak plaga szarañczy. Teraz kryj¹ siê, gdzie popadnie - nawet w mojej latarni.
	AI_Output(self,other,"DIA_Jack_Job_14_09");	//Myœlê, ¿e wypatruj¹ jakiegoœ statku, który mogliby zaj¹æ.
	AI_Output(self,other,"DIA_Jack_Job_14_10");	//I niech sobie zajmuj¹! Byle tylko wynieœli siê z mojej wie¿y.
	Log_CreateTopic(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_RUNNING);
	b_logentry(TOPIC_KILLLIGHTHOUSEBANDITS,"Stary marynarz, Jack, nie mo¿e wróciæ do latarni morskiej, dopóki przebywaj¹ tam bandyci.");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_RUNNING;
};


instance DIA_JACK_CITY(C_INFO)
{
	npc = vlk_444_jack;
	nr = 6;
	condition = dia_jack_city_condition;
	information = dia_jack_city_info;
	description = "Czêsto odwiedzasz miasto?";
};


func int dia_jack_city_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_job))
	{
		return TRUE;
	};
};

func void dia_jack_city_info()
{
	AI_Output(other,self,"DIA_Jack_City_15_00");	//Czêsto odwiedzasz miasto?
	AI_Output(self,other,"DIA_Jack_City_14_01");	//Miasto jest tylko tak dobre, jak jego przystañ. Zawsze to mówiê.
	AI_Output(self,other,"DIA_Jack_City_14_02");	//Przystañ jest oknem na œwiat. To tutaj spotykaj¹ siê ludzie. Tutaj wszystko siê zaczyna.
	AI_Output(self,other,"DIA_Jack_City_14_03");	//Gdy przystañ schodzi na psy, miasto wkrótce pod¹¿y jej œladem.
};


instance DIA_JACK_HARBOR(C_INFO)
{
	npc = vlk_444_jack;
	nr = 70;
	condition = dia_jack_harbor_condition;
	information = dia_jack_harbor_info;
	permanent = TRUE;
	description = "Opowiedz mi o przystani.";
};


func int dia_jack_harbor_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_city) && ((Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) == FALSE) && (JACKISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_harbor_info()
{
	AI_Output(other,self,"DIA_Jack_Harbor_15_00");	//Opowiedz mi o przystani.
	AI_Output(self,other,"DIA_Jack_Harbor_14_01");	//Przystañ w Khorinis to ju¿ nie to samo co kiedyœ.
	AI_Output(self,other,"DIA_Jack_Harbor_14_02");	//Zosta³y tu same szumowiny, statki przesta³y przyp³ywaæ, nie ma handlu. Ta przystañ to ju¿ stara historia.
	Info_ClearChoices(dia_jack_harbor);
	Info_AddChoice(dia_jack_harbor,DIALOG_BACK,dia_jack_harbor_back);
	Info_AddChoice(dia_jack_harbor,"Dlaczego statki przesta³y tu przyp³ywaæ?",dia_jack_harbor_ships);
	Info_AddChoice(dia_jack_harbor,"Co masz na myœli, mówi¹c 'szumowiny'?",dia_jack_harbor_rogue);
	Info_AddChoice(dia_jack_harbor,"Wiêc dlaczego st¹d nie odp³yniesz?",dia_jack_harbor_leave);
};

func void dia_jack_harbor_back()
{
	Info_ClearChoices(dia_jack_harbor);
};

func void dia_jack_harbor_ships()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Ships_15_00");	//Dlaczego statki przesta³y tu przyp³ywaæ?
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_01");	//Mówi¹, ¿e jak skoñczy siê wojna, wszystko bêdzie po staremu, ale to bzdury.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_02");	//Uwierz mi - marynarz zawsze wie, kiedy miasto schodzi na psy.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_03");	//Czuje to we krwi. A powiadam - ta przystañ jest ju¿ stracona. Nigdy nie wróci do dawnej œwietnoœci.
};

func void dia_jack_harbor_rogue()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Rogue_15_00");	//Co masz na myœli, mówi¹c 'szumowiny'?
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_01");	//Popatrz tylko na nich: leniwe obwiesie! Wiêkszoœæ z nich nie wie, co to uczciwa praca. Ca³ymi dniami nic tylko ¿³opi¹ piwsko i puszczaj¹ ostatnie pieni¹dze w burdelu.
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_02");	//Dobrze ci radzê - trzymaj siê od nich z dala!
};

func void dia_jack_harbor_leave()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_00");	//Wiêc dlaczego st¹d nie odp³yniesz?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_01");	//A kto by przyj¹³ na pok³ad takiego starego wilka jak ja?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_02");	//Ludzie myœl¹, ¿e Stary Jack nie nadaje siê ju¿ do ¿eglowania.
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_03");	//A maj¹ racjê?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_04");	//Do diaska to¿ to brednie. Jak tylko poczujê pod nogami deski pok³adu, dam jeszcze popaliæ niejednemu m³okosowi!
};


instance DIA_JACK_BANDITENWEG(C_INFO)
{
	npc = vlk_444_jack;
	nr = 7;
	condition = dia_jack_banditenweg_condition;
	information = dia_jack_banditenweg_info;
	description = "Nie musisz siê ju¿ martwiæ o bandytów zajmuj¹cych twoj¹ latarniê.";
};


func int dia_jack_banditenweg_condition()
{
	if(Npc_IsDead(leuchtturmbandit_1021) && Npc_IsDead(leuchtturmbandit_1022) && Npc_IsDead(leuchtturmbandit_1023) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jack_banditenweg_info()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_15_00");	//Nie musisz siê ju¿ martwiæ o bandytów zajmuj¹cych twoj¹ latarniê.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_01");	//Naprawdê? Œwietnie! Nareszcie mogê wróciæ do pracy!
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_02");	//ChodŸ ze mn¹ do latarni. Jest z niej wspania³y widok na morze.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_KILLLIGHTHOUSEBANDITS);
};


instance DIA_JACK_LIGHTHOUSEFREE(C_INFO)
{
	npc = vlk_444_jack;
	nr = 8;
	condition = dia_jack_lighthousefree_condition;
	information = dia_jack_lighthousefree_info;
	permanent = TRUE;
	description = "£adna latarnia.";
};


func int dia_jack_lighthousefree_condition()
{
	if((MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_lighthousefree_info()
{
	AI_Output(other,self,"DIA_Jack_LIGHTHOUSEFREE_15_00");	//£adna latarnia.
	AI_Output(self,other,"DIA_Jack_LIGHTHOUSEFREE_14_01");	//Dziêki! Wdrap siê po schodach na górê, a zobaczysz widok jakich ma³o, ch³opcze. Czuj siê jak u siebie w domu.
};


instance DIA_JACK_KAP3_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap3_exit_condition;
	information = dia_jack_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jack_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP4_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap4_exit_condition;
	information = dia_jack_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jack_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP5_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap5_exit_condition;
	information = dia_jack_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jack_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 51;
	condition = dia_jack_bemycaptain_condition;
	information = dia_jack_bemycaptain_info;
	permanent = TRUE;
	description = "Nie chcia³byœ znowu wyp³yn¹æ w morze?";
};


func int dia_jack_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == 0))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_15_00");	//Nie chcia³byœ znowu wyp³yn¹æ w morze?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_01");	//Ch³opcze, odda³bym praw¹ d³oñ, gdyby ktoœ zechcia³ wzi¹æ mnie na pok³ad porz¹dnej ³ajby.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_02");	//Ale w moim wieku nie mam ju¿ chyba o czym marzyæ. A poza tym - kto by siê zaj¹³ moj¹ latarni¹?
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"Mniejsza z tym. Tak siê tylko zastanawia³em.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"Przyda mi siê taki doœwiadczony ¿eglarz jak ty.",dia_jack_bemycaptain_seaman);
};

func void dia_jack_bemycaptain_seaman()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_00");	//Przyda mi siê taki doœwiadczony ¿eglarz jak ty.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_01");	//A niech mnie rekin! Co chcesz zrobiæ, ch³opcze? Chyba nie przymierzasz siê do porwania królewskiego okrêtu, co?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_02");	//Kto wie?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_03");	//A to ci dopiero heca! Ale nie mogê tak po prostu zostawiæ mojej latarni. Co z tym zrobimy, co?
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Jack, stary ¿eglarz z portu, by³by dobrym kapitanem. Jednak najpierw muszê znaleŸæ kogoœ, kto popilnowa³by jego latarni morskiej.");
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"Mniejsza z tym. Tak siê tylko zastanawia³em.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"A gdybym sprowadzi³ tu kogoœ...?",dia_jack_bemycaptain_seaman_newofficer);
};

func void dia_jack_bemycaptain_seaman_newofficer()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00");	//A gdybym sprowadzi³ tu kogoœ, kto zaj¹³by siê latarni¹ pod twoj¹ nieobecnoœæ?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01");	//Nieg³upi pomys³. Znam nawet odpowiedni¹ osobê.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02");	//Kowal Harad ma czeladnika imieniem Brian. Czêsto z nim rozmawia³em.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03");	//Tylko jemu mogê powierzyæ moj¹ latarniê. To sumienny ch³opak.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04");	//Porozmawiaj z nim. Mo¿e nam siê poszczêœci i zgodzi siê pomóc?
	Info_ClearChoices(dia_jack_bemycaptain);
	MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_RUNNING;
};

func void dia_jack_bemycaptain_no()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_no_15_00");	//Mniejsza z tym. Tak siê tylko zastanawia³em.
	Info_ClearChoices(dia_jack_bemycaptain);
};


instance DIA_JACK_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_444_jack;
	nr = 52;
	condition = dia_jack_bemycaptain2_condition;
	information = dia_jack_bemycaptain2_info;
	description = "Co do Briana...";
};


func int dia_jack_bemycaptain2_condition()
{
	if((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS) || ((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_RUNNING) && Npc_IsDead(brian)))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain2_info()
{
	if(Npc_IsDead(brian))
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_00");	//Brian nie ¿yje.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_01");	//O tak, ¿yjemy w paskudnych czasach. To by³ dobry cz³owiek.
		MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_02");	//Od dziœ o twoj¹ latarniê bêdzie siê troszczy³ Brian.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_03");	//Mia³em nadziejê, ¿e to powiesz.
		b_giveplayerxp(XP_JACK_NEWLIGHTHOUSEOFFICER);
		if(SCGOTCAPTAIN == FALSE)
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_04");	//Potrzebujesz mnie jeszcze?
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_05");	//Zobaczmy, czy ten ch³opak do czegoœ siê nadaje.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_JACK_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_444_jack;
	nr = 53;
	condition = dia_jack_bemycaptain3_condition;
	information = dia_jack_bemycaptain3_info;
	description = "Zostañ kapitanem mojego statku.";
};


func int dia_jack_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == FALSE) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_00");	//Zostañ kapitanem mojego statku.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_01");	//Swego czasu przemierzy³em siedem mórz, ch³opcze, ale jeszcze nigdy nie dowodzi³em okrêtem.
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_02");	//Nie mam bladego pojêcia o nawigacji. Bêdziesz musia³ siê tym zaj¹æ.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_03");	//Zrobiê co w mojej mocy!
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_04");	//Poka¿ mi tylko swój statek i za³ogê. Wiesz chocia¿, dok¹d p³yniemy? Masz jak¹œ mapê?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_05");	//Czekaj na mnie na przystani. O resztê siê nie martw.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_06");	//Jak uwa¿asz.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JACKISCAPTAIN = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JACK_LOSFAHREN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 59;
	condition = dia_jack_losfahren_condition;
	information = dia_jack_losfahren_info;
	permanent = TRUE;
	description = "No, staruszku. Ruszajmy w drogê.";
};


func int dia_jack_losfahren_condition()
{
	if((JACKISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_losfahren_info()
{
	AI_Output(other,self,"DIA_Jack_LOSFAHREN_15_00");	//No, staruszku. Ruszajmy w drogê.
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_01");	//Wszystko w najlepszym porz¹dku. Masz tê mapê?
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_02");	//Czeka nas niez³a przeprawa. Mam tylko nadziejê, ¿e dotrzemy na miejsce w jednym kawa³ku.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_03");	//Na pewno masz wszystko, co trzeba? Nie bêdziemy zawracaæ, jeœli w po³owie drogi przypomnisz sobie o czymœ wa¿nym.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_04");	//Jeœli jesteœ pewien, ¿e masz wszystko, idŸ do kajuty kapitana i walnij siê na kojê. Przyda ci siê trochê snu.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_05");	//Powoli, ch³opcze. Nie pokaza³eœ mi jeszcze swojej ³ajby. Wszystko w swoim czasie.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_06");	//Musisz mieæ co najmniej 5 osób w za³odze, swobodny dostêp do statku i mapê morsk¹. Inaczej nie mamy o czym mówiæ.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JACK_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 59;
	condition = dia_jack_perm5_notcaptain_condition;
	information = dia_jack_perm5_notcaptain_info;
	permanent = TRUE;
	description = "Co zamierzasz robiæ dalej?";
};


func int dia_jack_perm5_notcaptain_condition()
{
	if((Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JACKISCAPTAIN == FALSE)) || (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_jack_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jack_PERM5_NOTCAPTAIN_15_00");	//Co zamierzasz robiæ dalej?
	AI_Output(self,other,"DIA_Jack_PERM5_NOTCAPTAIN_14_01");	//Przemyœla³em sobie parê spraw. Chyba jednak zostanê w mojej latarni.
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP6_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap6_exit_condition;
	information = dia_jack_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jack_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

