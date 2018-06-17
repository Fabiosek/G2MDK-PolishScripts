
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
	AI_Output(self,other,"DIA_Jack_GREET_14_00");	//Ahoj, szczurze l�dowy! Utkn��e� tu na dobre, co?
	AI_Output(self,other,"DIA_Jack_GREET_14_01");	//He, he... Troch� blado wygl�dasz.
	AI_Output(self,other,"DIA_Jack_GREET_14_02");	//Ale nie przejmuj si�, ch�opcze. Przyda ci si� troch� �wie�ej, morskiej bryzy, ot i wszystko!
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
	AI_Output(other,self,"DIA_Jack_Job_15_00");	//Czym si� tu zajmujesz?
	AI_Output(self,other,"DIA_Jack_Job_14_01");	//Dawno temu, kiedy by�em takim m�odzikiem jak ty, wyruszy�em w morze i �eglowa�em przez niejeden sztorm.
	AI_Output(self,other,"DIA_Jack_Job_14_02");	//Wiele lat temu osiad�em w Khorinis i zaj��em si� tutejsz� latarni�.
	AI_Output(self,other,"DIA_Jack_Job_14_03");	//Gdzie tam, niby nic wielkiego... Ale tylko dzi�ki tej starej wie�y mog� by� blisko mojego prawdziwego domu.
	AI_Output(self,other,"DIA_Jack_Job_14_04");	//Nie by�em na g�rze od wiek�w...
	AI_Output(other,self,"DIA_Jack_Job_15_05");	//Dlaczego?
	AI_Output(self,other,"DIA_Jack_Job_14_06");	//Odk�d te �otry zaj�y moj� latarni�, ba�em si� do niej zbli�y� na dwadzie�cia krok�w. Banda �ajdak�w.
	AI_Output(self,other,"DIA_Jack_Job_14_07");	//Wiesz, to ci bandyci z G�rniczej Doliny.
	AI_Output(self,other,"DIA_Jack_Job_14_08");	//Najpierw po drugiej stronie g�r by� wielki huk, a potem ca�a ta zgraja zwali�a si� do miasta jak plaga szara�czy. Teraz kryj� si�, gdzie popadnie - nawet w mojej latarni.
	AI_Output(self,other,"DIA_Jack_Job_14_09");	//My�l�, �e wypatruj� jakiego� statku, kt�ry mogliby zaj��.
	AI_Output(self,other,"DIA_Jack_Job_14_10");	//I niech sobie zajmuj�! Byle tylko wynie�li si� z mojej wie�y.
	Log_CreateTopic(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_RUNNING);
	b_logentry(TOPIC_KILLLIGHTHOUSEBANDITS,"Stary marynarz, Jack, nie mo�e wr�ci� do latarni morskiej, dop�ki przebywaj� tam bandyci.");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_RUNNING;
};


instance DIA_JACK_CITY(C_INFO)
{
	npc = vlk_444_jack;
	nr = 6;
	condition = dia_jack_city_condition;
	information = dia_jack_city_info;
	description = "Cz�sto odwiedzasz miasto?";
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
	AI_Output(other,self,"DIA_Jack_City_15_00");	//Cz�sto odwiedzasz miasto?
	AI_Output(self,other,"DIA_Jack_City_14_01");	//Miasto jest tylko tak dobre, jak jego przysta�. Zawsze to m�wi�.
	AI_Output(self,other,"DIA_Jack_City_14_02");	//Przysta� jest oknem na �wiat. To tutaj spotykaj� si� ludzie. Tutaj wszystko si� zaczyna.
	AI_Output(self,other,"DIA_Jack_City_14_03");	//Gdy przysta� schodzi na psy, miasto wkr�tce pod��y jej �ladem.
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
	AI_Output(self,other,"DIA_Jack_Harbor_14_01");	//Przysta� w Khorinis to ju� nie to samo co kiedy�.
	AI_Output(self,other,"DIA_Jack_Harbor_14_02");	//Zosta�y tu same szumowiny, statki przesta�y przyp�ywa�, nie ma handlu. Ta przysta� to ju� stara historia.
	Info_ClearChoices(dia_jack_harbor);
	Info_AddChoice(dia_jack_harbor,DIALOG_BACK,dia_jack_harbor_back);
	Info_AddChoice(dia_jack_harbor,"Dlaczego statki przesta�y tu przyp�ywa�?",dia_jack_harbor_ships);
	Info_AddChoice(dia_jack_harbor,"Co masz na my�li, m�wi�c 'szumowiny'?",dia_jack_harbor_rogue);
	Info_AddChoice(dia_jack_harbor,"Wi�c dlaczego st�d nie odp�yniesz?",dia_jack_harbor_leave);
};

func void dia_jack_harbor_back()
{
	Info_ClearChoices(dia_jack_harbor);
};

func void dia_jack_harbor_ships()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Ships_15_00");	//Dlaczego statki przesta�y tu przyp�ywa�?
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_01");	//M�wi�, �e jak sko�czy si� wojna, wszystko b�dzie po staremu, ale to bzdury.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_02");	//Uwierz mi - marynarz zawsze wie, kiedy miasto schodzi na psy.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_03");	//Czuje to we krwi. A powiadam - ta przysta� jest ju� stracona. Nigdy nie wr�ci do dawnej �wietno�ci.
};

func void dia_jack_harbor_rogue()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Rogue_15_00");	//Co masz na my�li, m�wi�c 'szumowiny'?
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_01");	//Popatrz tylko na nich: leniwe obwiesie! Wi�kszo�� z nich nie wie, co to uczciwa praca. Ca�ymi dniami nic tylko ��opi� piwsko i puszczaj� ostatnie pieni�dze w burdelu.
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_02");	//Dobrze ci radz� - trzymaj si� od nich z dala!
};

func void dia_jack_harbor_leave()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_00");	//Wi�c dlaczego st�d nie odp�yniesz?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_01");	//A kto by przyj�� na pok�ad takiego starego wilka jak ja?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_02");	//Ludzie my�l�, �e Stary Jack nie nadaje si� ju� do �eglowania.
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_03");	//A maj� racj�?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_04");	//Do diaska to� to brednie. Jak tylko poczuj� pod nogami deski pok�adu, dam jeszcze popali� niejednemu m�okosowi!
};


instance DIA_JACK_BANDITENWEG(C_INFO)
{
	npc = vlk_444_jack;
	nr = 7;
	condition = dia_jack_banditenweg_condition;
	information = dia_jack_banditenweg_info;
	description = "Nie musisz si� ju� martwi� o bandyt�w zajmuj�cych twoj� latarni�.";
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
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_15_00");	//Nie musisz si� ju� martwi� o bandyt�w zajmuj�cych twoj� latarni�.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_01");	//Naprawd�? �wietnie! Nareszcie mog� wr�ci� do pracy!
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_02");	//Chod� ze mn� do latarni. Jest z niej wspania�y widok na morze.
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
	description = "�adna latarnia.";
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
	AI_Output(other,self,"DIA_Jack_LIGHTHOUSEFREE_15_00");	//�adna latarnia.
	AI_Output(self,other,"DIA_Jack_LIGHTHOUSEFREE_14_01");	//Dzi�ki! Wdrap si� po schodach na g�r�, a zobaczysz widok jakich ma�o, ch�opcze. Czuj si� jak u siebie w domu.
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
	description = "Nie chcia�by� znowu wyp�yn�� w morze?";
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
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_15_00");	//Nie chcia�by� znowu wyp�yn�� w morze?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_01");	//Ch�opcze, odda�bym praw� d�o�, gdyby kto� zechcia� wzi�� mnie na pok�ad porz�dnej �ajby.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_02");	//Ale w moim wieku nie mam ju� chyba o czym marzy�. A poza tym - kto by si� zaj�� moj� latarni�?
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"Mniejsza z tym. Tak si� tylko zastanawia�em.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"Przyda mi si� taki do�wiadczony �eglarz jak ty.",dia_jack_bemycaptain_seaman);
};

func void dia_jack_bemycaptain_seaman()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_00");	//Przyda mi si� taki do�wiadczony �eglarz jak ty.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_01");	//A niech mnie rekin! Co chcesz zrobi�, ch�opcze? Chyba nie przymierzasz si� do porwania kr�lewskiego okr�tu, co?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_02");	//Kto wie?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_03");	//A to ci dopiero heca! Ale nie mog� tak po prostu zostawi� mojej latarni. Co z tym zrobimy, co?
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Jack, stary �eglarz z portu, by�by dobrym kapitanem. Jednak najpierw musz� znale�� kogo�, kto popilnowa�by jego latarni morskiej.");
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"Mniejsza z tym. Tak si� tylko zastanawia�em.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"A gdybym sprowadzi� tu kogo�...?",dia_jack_bemycaptain_seaman_newofficer);
};

func void dia_jack_bemycaptain_seaman_newofficer()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00");	//A gdybym sprowadzi� tu kogo�, kto zaj��by si� latarni� pod twoj� nieobecno��?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01");	//Nieg�upi pomys�. Znam nawet odpowiedni� osob�.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02");	//Kowal Harad ma czeladnika imieniem Brian. Cz�sto z nim rozmawia�em.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03");	//Tylko jemu mog� powierzy� moj� latarni�. To sumienny ch�opak.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04");	//Porozmawiaj z nim. Mo�e nam si� poszcz�ci i zgodzi si� pom�c?
	Info_ClearChoices(dia_jack_bemycaptain);
	MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_RUNNING;
};

func void dia_jack_bemycaptain_no()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_no_15_00");	//Mniejsza z tym. Tak si� tylko zastanawia�em.
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
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_00");	//Brian nie �yje.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_01");	//O tak, �yjemy w paskudnych czasach. To by� dobry cz�owiek.
		MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_02");	//Od dzi� o twoj� latarni� b�dzie si� troszczy� Brian.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_03");	//Mia�em nadziej�, �e to powiesz.
		b_giveplayerxp(XP_JACK_NEWLIGHTHOUSEOFFICER);
		if(SCGOTCAPTAIN == FALSE)
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_04");	//Potrzebujesz mnie jeszcze?
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_05");	//Zobaczmy, czy ten ch�opak do czego� si� nadaje.
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
	description = "Zosta� kapitanem mojego statku.";
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
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_00");	//Zosta� kapitanem mojego statku.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_01");	//Swego czasu przemierzy�em siedem m�rz, ch�opcze, ale jeszcze nigdy nie dowodzi�em okr�tem.
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_02");	//Nie mam bladego poj�cia o nawigacji. B�dziesz musia� si� tym zaj��.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_03");	//Zrobi� co w mojej mocy!
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_04");	//Poka� mi tylko sw�j statek i za�og�. Wiesz chocia�, dok�d p�yniemy? Masz jak�� map�?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_05");	//Czekaj na mnie na przystani. O reszt� si� nie martw.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_06");	//Jak uwa�asz.
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
	description = "No, staruszku. Ruszajmy w drog�.";
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
	AI_Output(other,self,"DIA_Jack_LOSFAHREN_15_00");	//No, staruszku. Ruszajmy w drog�.
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_01");	//Wszystko w najlepszym porz�dku. Masz t� map�?
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_02");	//Czeka nas niez�a przeprawa. Mam tylko nadziej�, �e dotrzemy na miejsce w jednym kawa�ku.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_03");	//Na pewno masz wszystko, co trzeba? Nie b�dziemy zawraca�, je�li w po�owie drogi przypomnisz sobie o czym� wa�nym.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_04");	//Je�li jeste� pewien, �e masz wszystko, id� do kajuty kapitana i walnij si� na koj�. Przyda ci si� troch� snu.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_05");	//Powoli, ch�opcze. Nie pokaza�e� mi jeszcze swojej �ajby. Wszystko w swoim czasie.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_06");	//Musisz mie� co najmniej 5 os�b w za�odze, swobodny dost�p do statku i map� morsk�. Inaczej nie mamy o czym m�wi�.
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
	description = "Co zamierzasz robi� dalej?";
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
	AI_Output(other,self,"DIA_Jack_PERM5_NOTCAPTAIN_15_00");	//Co zamierzasz robi� dalej?
	AI_Output(self,other,"DIA_Jack_PERM5_NOTCAPTAIN_14_01");	//Przemy�la�em sobie par� spraw. Chyba jednak zostan� w mojej latarni.
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

