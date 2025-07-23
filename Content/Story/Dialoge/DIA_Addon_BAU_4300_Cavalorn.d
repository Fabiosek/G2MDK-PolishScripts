
func int c_bragobanditsdead()
{
	if((Npc_IsDead(ambusher_1013) || (BDT_1013_AWAY == TRUE)) && Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015))
	{
		return TRUE;
	};
};


instance DIA_ADDON_CAVALORN_EXIT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 999;
	condition = dia_addon_cavalorn_exit_condition;
	information = dia_addon_cavalorn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_cavalorn_exit_condition()
{
	return TRUE;
};

func void dia_addon_cavalorn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CAVALORN_PICKPOCKET(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 900;
	condition = dia_addon_cavalorn_pickpocket_condition;
	information = dia_addon_cavalorn_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego ko�czanu b�dzie do�� �atwa)";
};


func int dia_addon_cavalorn_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (25 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_pickpocket_info()
{
	Info_ClearChoices(dia_addon_cavalorn_pickpocket);
	Info_AddChoice(dia_addon_cavalorn_pickpocket,DIALOG_BACK,dia_addon_cavalorn_pickpocket_back);
	Info_AddChoice(dia_addon_cavalorn_pickpocket,DIALOG_PICKPOCKET,dia_addon_cavalorn_pickpocket_doit);
};

func void dia_addon_cavalorn_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 25)
	{
		b_giveinvitems(self,other,itrw_arrow,44);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_addon_cavalorn_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_addon_cavalorn_pickpocket_back()
{
	Info_ClearChoices(dia_addon_cavalorn_pickpocket);
};


instance DIA_ADDON_CAVALORN_MEETINGISRUNNING(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_meetingisrunning_condition;
	information = dia_addon_cavalorn_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_cavalorn_meetingisrunning_onetime;

func int dia_addon_cavalorn_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_meetingisrunning_info()
{
	if(DIA_ADDON_CAVALORN_MEETINGISRUNNING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//Witaj w Kr�gu, przyjacielu.
		DIA_ADDON_CAVALORN_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//Vatras da ci kolejne zadanie.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CAVALORN_HALLO(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_hallo_condition;
	information = dia_addon_cavalorn_hallo_info;
	description = "Jakie� k�opoty?";
};


func int dia_addon_cavalorn_hallo_condition()
{
	return TRUE;
};

func void dia_addon_cavalorn_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Jakie� k�opoty?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//Do diab�a. Nie wiem, gdzie si� ukrywaj�. Zabijesz jednego, ale zaraz wracaj�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//Chwila. Ja ciebie znam. To ty ci�gle �ebra�e� u mnie o strza�y, jeszcze w G�rniczej Dolinie.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Nazywasz si� Cavalorn, tak?",dia_addon_cavalorn_hallo_ja);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Nie przypominam sobie...",dia_addon_cavalorn_hallo_weissnicht);
};

func void dia_addon_cavalorn_hallo_weissnicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//Nie przypominam sobie...
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//Daj spok�j! Nauczy�em ci� �ucznictwa i skradania si� w mojej chatce niedaleko Starego Obozu! Przypominasz sobie?
};

func void dia_addon_cavalorn_hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Nazywasz si� Cavalorn, tak?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//Ach, nie zapomnia�e� o mnie. Koniec ko�c�w obaj przeszli�my przez t� przekl�t� koloni�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Dok�d idziesz?
	Info_ClearChoices(dia_addon_cavalorn_hallo);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Nie mam okre�lonego celu.",dia_addon_cavalorn_hallo_keinziel);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Z powrotem do G�rniczej Doliny.",dia_addon_cavalorn_hallo_bauern);
	if(mil_310_stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice(dia_addon_cavalorn_hallo,"Do miasta.",dia_addon_cavalorn_hallo_stadt);
	};
};

func void dia_addon_cavalorn_hallo_stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//Do miasta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//Ach, te� do miasta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//Mia�by� k�opoty ze stra��. Teraz, gdy a� roi si� tu od bandyt�w, nie ka�dy mo�e wej�� do miasta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//Kilka dni temu przechodzi� t�dy jeden ze starych Psionik�w z G�rniczej Doliny. M�wi�, �e mo�e wchodzi� i wychodzi� z Khorinis, kiedy tylko chce.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//Poszed� do doliny pod t� du�� wie��. Gdzie� w okolicy wodospadu musi by� przej�cie.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Mo�e powiniene� z nim porozmawia�.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};

func void dia_addon_cavalorn_hallo_bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Z powrotem do G�rniczej Doliny.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//Naprawd�? Hmm. Szkoda, �e nie mog� z tob� i��, ale musz� za�atwi� kilka spraw.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//Je�eli dostaniesz si� do G�rniczej Doliny, sprawd�, czy moja chata jeszcze stoi, dobrze? Pewnego dnia chcia�bym tam wr�ci�.
	MIS_ADDON_CAVALORN_THEHUT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_CAVALORNTHEHUT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CAVALORNTHEHUT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CAVALORNTHEHUT,"Cavalorn chce, �ebym sprawdzi�, czy w G�rniczej Dolinie wci�� stoi jego stara chata. Z tego, co pami�tam, znajdowa�a si� ona na wzg�rzach na zach�d od Starego Obozu. Wydaje mi si�, �e co� tam mog�o zosta�.");
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};

func void dia_addon_cavalorn_hallo_keinziel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//Nie mam okre�lonego celu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//Nie chcesz powiedzie�, co? Nie ma sprawy.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};


instance DIA_ADDON_CAVALORN_BEUTEL(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_beutel_condition;
	information = dia_addon_cavalorn_beutel_info;
	description = "By�em w twojej chacie w G�rniczej Dolinie.";
};


func int dia_addon_cavalorn_beutel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (Npc_HasItems(other,itse_addon_cavalornsbeutel) || (SC_OPENEDCAVALORNSBEUTEL == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_beutel_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//By�em w twojej chacie w G�rniczej Dolinie.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//A zatem jeszcze stoi.
	if(MIS_ADDON_CAVALORN_THEHUT == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Tak. I wiem, co stamt�d chcia�e�.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Uda�o ci si� to znale��?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//Je�eli m�wisz o torbie pe�nej rudy... Tak, mam j�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//Ale z ciebie spryciula, wiesz o tym?
	if(MIS_ADDON_CAVALORN_THEHUT == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//A czego m�g�by� potrzebowa� z tej starej chaty? Nic tam nie zosta�o.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//Masz j� ze sob�? Dam ci za ni� 100 sztuk z�ota.
	TOPIC_END_CAVALORNTHEHUT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	if(Npc_HasItems(other,itse_addon_cavalornsbeutel))
	{
		Info_AddChoice(dia_addon_cavalorn_beutel,"Pewnie.",dia_addon_cavalorn_beutel_ja);
	}
	else if(Npc_HasItems(other,itmi_nugget))
	{
		Info_AddChoice(dia_addon_cavalorn_beutel,"Nie, ale mam kawa�ki rudy.",dia_addon_cavalorn_beutel_jaerz);
	};
	Info_AddChoice(dia_addon_cavalorn_beutel,"Nie.",dia_addon_cavalorn_beutel_no);
};

func void dia_addon_cavalorn_beutel_back()
{
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//Mam nadziej�, �e wkr�tce j� odzyskam.
};

func void dia_addon_cavalorn_beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//Nie, ale mam kawa�ki rudy.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Te� dobrze.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"A dlaczego j� zostawi�e�?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Pewnie.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//�wietnie.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"A dlaczego j� zostawi�e�?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//Nie.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Wi�c przynie� mi to! Koniec ko�c�w sam bym chyba poszed� po ten towar do tej przekl�tej G�rniczej Doliny.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//Jestem wzruszony.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"A dlaczego j� zostawi�e�?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_why()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//A dlaczego j� zostawi�e�?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//Kto m�g�by przypuszcza�, �e w Khorinis ruda jest tak cenna.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//W kolonii za g�upi kawa�ek rudy nie dosta�by� nawet miejsca do spania.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//W porcie mo�na dosta� po g�owie za kawa�ek rudy.
};


instance DIA_ADDON_CAVALORN_ERZGEBEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_erzgeben_condition;
	information = dia_addon_cavalorn_erzgeben_info;
	description = "Daj mi 100 sztuk z�ota, a przynios� ci t� rud�.";
};


func int dia_addon_cavalorn_erzgeben_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_beutel) && (Npc_HasItems(other,itse_addon_cavalornsbeutel) || Npc_HasItems(other,itmi_nugget)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_erzgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Daj mi 100 sztuk z�ota, a przynios� ci t� rud�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//Zgoda. Masz.
	CreateInvItems(self,itmi_gold,100);
	b_giveinvitems(self,other,itmi_gold,100);
	if(b_giveinvitems(other,self,itse_addon_cavalornsbeutel,1) == FALSE)
	{
		b_giveinvitems(other,self,itmi_nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//Prawdziwy z ciebie przyjaciel. Dzi�kuj�.
	MIS_ADDON_CAVALORN_THEHUT = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_CAVALORNSBEUTEL);
};


instance DIA_ADDON_CAVALORN_WASMACHSTDU(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_wasmachstdu_condition;
	information = dia_addon_cavalorn_wasmachstdu_info;
	description = "Co tu robisz?";
};


func int dia_addon_cavalorn_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//Utkn��em. Gdyby nie ci przekl�ci bandyci, w og�le by mnie tu nie by�o.
};


instance DIA_ADDON_CAVALORN_BANDITEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 10;
	condition = dia_addon_cavalorn_banditen_condition;
	information = dia_addon_cavalorn_banditen_info;
	description = "O co chodzi z tymi bandytami?";
};


func int dia_addon_cavalorn_banditen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_wasmachstdu) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_banditen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//O co chodzi z tymi bandytami?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Przespa�e� ca�y ostatni tydzie�?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Ech...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//M�wi� o tych szczurach z kolonii karnej - rozle�li si� po ca�ej okolicy; �upi� i morduj�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//Ciesz� si�, �e darowali mi �ycie. Nie uwa�a�em i dosta�em w czaszk�.
	if(c_bragobanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//Nie wiem, jak mam teraz odzyska� swoje rzeczy.
	};
};


instance DIA_ADDON_CAVALORN_ARTEFAKT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_artefakt_condition;
	information = dia_addon_cavalorn_artefakt_info;
	description = "Zosta�e� obrabowany przez bandyt�w?";
};


func int dia_addon_cavalorn_artefakt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_banditen) && (MIS_ADDON_CAVALORN_KILLBRAGO != LOG_SUCCESS) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_artefakt_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//Zosta�e� obrabowany przez bandyt�w?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//Tak. Og�uszyli mnie i zostawili jako �arcie dla goblin�w.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//To by�y piekielnie wa�ne rzeczy. List i ca�a moja got�wka. Musz� je odzyska�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//Nie p�jd� tam jednak bez wsparcia. Ta tch�rzliwa ha�astra bandyt�w...
};


instance DIA_ADDON_CAVALORN_HELFEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_helfen_condition;
	information = dia_addon_cavalorn_helfen_info;
	description = "Mog� ci pom�c z tymi bandytami?";
};


func int dia_addon_cavalorn_helfen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_artefakt) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS) && (c_bragobanditsdead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_helfen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//Mog� ci pom�c z tymi bandytami?
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//Mo�e. Ale s�dz�c po twoim mizernym wygl�dzie, mog� powiedzie�, �e od tygodni nie mia�e� w r�kach prawdziwego miecza.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//No c�. Musz� chyba przyj�� twoj� ofert�. Nie mam zbyt wiele czasu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//Dobra, s�uchaj. W dole tej �cie�ki jest jedna z tych brudnych dziur, w kt�rych ukrywaj� si� bandyci.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//To te �otry ukrad�y moje rzeczy.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//Daj zna�, gdy b�dziesz got�w. Ruszymy za tymi szczurami!
	MIS_ADDON_CAVALORN_KILLBRAGO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KILLBRAGO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KILLBRAGO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLBRAGO,"Bandyci ukradli co� cennego Cavalornowi. Chce, �eby�my razem ich zabili.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_CAVALORN_AUSRUESTUNG(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_ausruestung_condition;
	information = dia_addon_cavalorn_ausruestung_info;
	description = "Potrzebuj� lepszego sprz�tu.";
};


func int dia_addon_cavalorn_ausruestung_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO != 0) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ausruestung_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//Potrzebuj� lepszego sprz�tu.
	if(c_bragobanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Te �winie nie zostawi�y mi zbyt wiele.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//Mog� ci da� n� na wilki. Wystarczy?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//Tak, n� b�dzie dobry.
	CreateInvItems(self,itmw_addon_knife01,1);
	b_giveinvitems(self,other,itmw_addon_knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//A co z leczeniem?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//Zosta�y mi dwie mikstury uzdrawiaj�ce. Chcesz?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Pewnie. Wezm� je.
	CreateInvItems(self,itpo_health_01,2);
	b_giveinvitems(self,other,itpo_health_01,2);
};


instance DIA_ADDON_CAVALORN_LETSKILLBANDITS(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_letskillbandits_condition;
	information = dia_addon_cavalorn_letskillbandits_info;
	description = "Chod�my zabi� tych gnojk�w.";
};


func int dia_addon_cavalorn_letskillbandits_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS) && (c_bragobanditsdead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_letskillbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//Chod�my zabi� tych gnojk�w.
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Dobra. Tylko mnie os�aniaj, jasne?
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//A teraz czeka ich paskudna niespodzianka.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KillBandits");
	if(BDT_1013_AWAY == FALSE)
	{
		ambusher_1013.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	ambusher_1014.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	ambusher_1015.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

func void b_addon_cavalorn_vatrasbrief()
{
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//Przynajmniej mog� wykona� zadanie. I tak zmarnowa�em ju� zbyt wiele czasu.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//Jakie zadanie...?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//Ech. Musz� si� dosta� do miasta, a p�niej...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//Nie wiem tylko, jak mam zd��y�.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//A co ze mn�?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//Hmm. Czemu nie. M�g�by� zanie�� list do miasta.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//Dzi�ki temu b�d� mia� czas, �eby pozbiera� sprz�t.
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//Jeden z tych bandyt�w powinien mie� list w kieszeni.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Zanie� go do miasta i oddaj magowi Kr�gu Wody, Vatrasowi. Znajdziesz go w �wi�tyni Adanosa. Naucza tam ca�ymi dniami.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//Powiedz mu, �e nie zd��y�em na czas.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//A gdyby ci� zapyta�, gdzie jestem, powiedz, �e w drodze na miejsce spotkania, dobrze?
		b_logentry(TOPIC_ADDON_KDW,"Maga Wody, Vatrasa, mo�na znale�� w portowym mie�cie Khorinis. G�osi tam kazania w �wi�tyni Adanosa.");
	};
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//Aha, jeszcze jedno: kup sobie od jakiego� wie�niaka porz�dne ubranie.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Inaczej wezm� ci� za bandyt�. Masz, tu jest par� monet.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
	};
	MIS_ADDON_CAVALORN_KILLBRAGO = LOG_SUCCESS;
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS == 0)
	{
		MIS_ADDON_CAVALORN_LETTER2VATRAS = LOG_RUNNING;
	};
	Npc_ExchangeRoutine(self,"Start");
	b_giveplayerxp(XP_ADDON_CAVALORN_KILLBRAGO);
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_ADDON_CAVALORN_BRAGOKILLED(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_bragokilled_condition;
	information = dia_addon_cavalorn_bragokilled_info;
	important = TRUE;
};


func int dia_addon_cavalorn_bragokilled_condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_bragokilled_info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//No to za�atwione. Ech. Mogli ze mn� nie zaczyna�.
	b_addon_cavalorn_vatrasbrief();
};


instance DIA_ADDON_CAVALORN_PCKILLEDBRAGO(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_pckilledbrago_condition;
	information = dia_addon_cavalorn_pckilledbrago_info;
	description = "Bandyci s� ju� martwi.";
};


func int dia_addon_cavalorn_pckilledbrago_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO == 0) && Npc_KnowsInfo(other,dia_addon_cavalorn_banditen) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_pckilledbrago_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//Bandyci s� ju� martwi.
	b_addon_cavalorn_vatrasbrief();
};


instance DIA_ADDON_CAVALORN_JUNGS(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 2;
	condition = dia_addon_cavalorn_jungs_condition;
	information = dia_addon_cavalorn_jungs_info;
	description = "Masz na sobie interesuj�cy pancerz.";
};


func int dia_addon_cavalorn_jungs_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_jungs_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Masz na sobie interesuj�cy pancerz. Nie nale�ysz ju� do Cieni?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//Cieni? Od upadku bariery ju� nie istniej�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//Gdy tylko mogli�my opu�ci� G�rnicz� Dolin�, nie by�o powodu, �eby tam d�u�ej zostawa�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Teraz pracuj� dla mag�w wody. Jestem cz�onkiem Wodnego Kr�gu.
	SC_KNOWSRANGER = TRUE;
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Cavalorn powiedzia� mi, �e nale�y do grupy zw�cej si� Wodny Kr�g.");
	CAVALORN_RANGERHINT = TRUE;
};


instance DIA_ADDON_CAVALORN_RING(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_ring_condition;
	information = dia_addon_cavalorn_ring_info;
	permanent = FALSE;
	description = "Powiedz mi co� wi�cej o Wodnym Kr�gu!";
};


func int dia_addon_cavalorn_ring_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ring_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//Powiedz mi co� wi�cej o Wodnym Kr�gu!
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//Nie wolno mi o tym m�wi�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//Mog� ci� jedynie wys�a� do Vartasa. On reprezentuje Mag�w Wody w Khorinis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//Najlepiej b�dzie, jak z nim porozmawiasz. Powiedz, �e ja ci� przys�a�em.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Mo�e pozwoli ci wst�pi� do Kr�gu. Bardzo potrzeba nam dobrych ludzi...
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras, Mag Wody, mo�e powiedzie� mi wi�cej o Wodnym Kr�gu.");
};


instance DIA_ADDON_CAVALORN_FEINDE(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 6;
	condition = dia_addon_cavalorn_feinde_condition;
	information = dia_addon_cavalorn_feinde_info;
	permanent = FALSE;
	description = "Czy ty i twoi ludzie nie byli�cie czasem przeciwnikami Mag�w Wody?";
};


func int dia_addon_cavalorn_feinde_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_feinde_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Czy ty i twoi ludzie nie byli�cie czasem przeciwnikami Mag�w Wody?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Szalona przesz�o�� jest ju� za nami. Nie ma ju� Nowego ani Starego Obozu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//A teraz, gdy nie ma ju� kolonii karnej, ka�dy odpowiada za siebie.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//Wi�kszo�� z nas - by�ych wi�ni�w - nie zosta�a uniewinniona.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//Magowie Wody zdo�ali uzyska� dla mnie u�askawienie i mog� teraz porusza� si� swobodnie.
};


instance DIA_ADDON_CAVALORN_KDWTASK(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 6;
	condition = dia_addon_cavalorn_kdwtask_condition;
	information = dia_addon_cavalorn_kdwtask_info;
	permanent = FALSE;
	description = "Co porabiaj� teraz Magowie Wody?";
};


func int dia_addon_cavalorn_kdwtask_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_kdwtask_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//Co porabiaj� teraz Magowie Wody?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//Maj� wielki plan. Chodzi o niezbadan� cz�� wyspy.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//Niezbadan� cz��? Gdzie ona jest?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//Nie mog� ci powiedzie� nic wi�cej. Porozmawiaj z Vatrasem w Khorinis.
};


instance DIA_ADDON_CAVALORN_BROUGHTLETTER(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_broughtletter_condition;
	information = dia_addon_cavalorn_broughtletter_info;
	description = "Da�em Vatrasowi tw�j list.";
};


func int dia_addon_cavalorn_broughtletter_condition()
{
	if((MIS_ADDON_CAVALORN_LETTER2VATRAS == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_broughtletter_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//Da�em Vatrasowi tw�j list.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//Nie oczekiwa�em od ciebie niczego innego. Dzi�kuj�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_CAVALORN_ORNAMENT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 2;
	condition = dia_addon_cavalorn_ornament_condition;
	information = dia_addon_cavalorn_ornament_info;
	description = "Szukasz czego�?";
};


func int dia_addon_cavalorn_ornament_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_cavalorn_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Szukasz czego�?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//To takie oczywiste? Tak, Magowie Wody kazali mi szuka� zgubionych ornament�w.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//Interesuj�cy zbieg okoliczno�ci. Otrzyma�em taki sam rozkaz od Nefariusa.
	if(SC_KNOWSRANGER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//Nale�ysz wi�c do Wodnego Kr�gu?
		if(SC_ISRANGER == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Tak.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Jeszcze nie, ale pracuj� nad tym.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//To dobrze. W takim razie nie musz� tego robi� sam.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//Znalaz�e� ju� jaki� ornament?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//Znam miejsce, w kt�rym powinni�my co� znale��.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//Ten kamienny kr�g mo�e by� jedn� z tych budowli, kt�re opisa� Nefarius.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Teraz musimy tylko znale�� mechanizm.
};


instance DIA_ADDON_CAVALORN_TRIGGERED(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_triggered_condition;
	information = dia_addon_cavalorn_triggered_info;
	description = "Uruchomi�em mechanizm. Nic si� nie sta�o.";
};


func int dia_addon_cavalorn_triggered_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_cavalorn_ornament) && (ORNAMENT_SWITCHED_FARM == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_triggered_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//Uruchomi�em mechanizm. Nic si� nie sta�o.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//W takim razie wie�niacy Lobarta mieli racj�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//Powiedzieli, �e kto� ju� kr�ci� si� przy tych kamieniach.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//Nagle znik�d pojawi� si� kamienny stra�nik i ich zaatakowa�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//Farmerzy wezwali stra�, �o�nierze paladyn�w, a ci przyszli i zniszczyli potwora.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//Przeszuka�em ju� ca�y teren. Je�eli by� tu jaki� ornament, maj� go teraz paladyni.
	Info_ClearChoices(dia_addon_cavalorn_triggered);
	Info_AddChoice(dia_addon_cavalorn_triggered,"Jeden z nas musi p�j�� do g�rnego miasta.",dia_addon_cavalorn_triggered_pal);
	Info_AddChoice(dia_addon_cavalorn_triggered,"W takim razie p�jd� do nich i odzyskam ornament.",dia_addon_cavalorn_triggered_oback);
};

func void b_cavalorn_triggered_wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//P�jd� do miasta. Spotkamy si� u Vatrasa.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");
	Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ORNAMENT,"Jeden z brakuj�cych fragment�w ornamentu jest w posiadaniu paladyn�w w g�rnym mie�cie.");
	MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL = LOG_RUNNING;
	self.flags = 0;
};

func void dia_addon_cavalorn_triggered_oback()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,itar_bau_l,1);
	Npc_RemoveInvItems(self,itar_ranger_addon,Npc_HasItems(self,itar_ranger_addon));
	Npc_RemoveInvItems(self,itar_fake_ranger,Npc_HasItems(self,itar_fake_ranger));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//W takim razie p�jd� do nich i odzyskam ornament.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//Dobrze.
	b_cavalorn_triggered_wohin();
};

func void dia_addon_cavalorn_triggered_pal()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,itar_bau_l,1);
	Npc_RemoveInvItems(self,itar_ranger_addon,Npc_HasItems(self,itar_ranger_addon));
	Npc_RemoveInvItems(self,itar_fake_ranger,Npc_HasItems(self,itar_fake_ranger));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Jeden z nas musi p�j�� do g�rnego miasta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//Nie mam na to czasu. Ty musisz to zrobi�.
	b_cavalorn_triggered_wohin();
};


instance DIA_ADDON_CAVALORN_GOTORNAFROMHAGEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_gotornafromhagen_condition;
	information = dia_addon_cavalorn_gotornafromhagen_info;
	description = "Dosta�em brakuj�cy ornament od Lorda Hagena.";
};


func int dia_addon_cavalorn_gotornafromhagen_condition()
{
	if(LORD_HAGEN_GOTORNAMENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_gotornafromhagen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//Dosta�em brakuj�cy ornament od Lorda Hagena.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//Widzisz? Wiedzia�em, �e mieli go paladyni.
	b_giveplayerxp(XP_AMBIENT);
	MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL = LOG_SUCCESS;
};


instance DIA_ADDON_CAVALORN_WANNALEARN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 7;
	condition = dia_addon_cavalorn_wannalearn_condition;
	information = dia_addon_cavalorn_wannalearn_info;
	permanent = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_addon_cavalorn_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wannalearn_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Pewnie. Przecie� wiesz. Oj, ch�opie, nie�le ci� przegonili.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//Niczego nie pami�tasz, prawda?
	CAVALORN_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_OUTTEACHER,LOG_NOTE);
	b_logentry(TOPIC_OUTTEACHER,LOGTEXT_ADDON_CAVALORN_TEACH);
};


var int addon_cavalorn_merke_bow;
var int addon_cavalorn_merke_1h;

instance DIA_ADDON_CAVALORN_TEACH(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 8;
	condition = dia_addon_cavalorn_teach_condition;
	information = dia_addon_cavalorn_teach_info;
	permanent = TRUE;
	description = "Chc� si� czego� od ciebie nauczy�.";
};


func int dia_addon_cavalorn_teach_condition()
{
	if(CAVALORN_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_teach_choices()
{
	Info_ClearChoices(dia_addon_cavalorn_teach);
	Info_AddChoice(dia_addon_cavalorn_teach,DIALOG_BACK,dia_addon_cavalorn_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring("Skradanie si�",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),dia_addon_cavalorn_teach_sneak);
	};
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_addon_cavalorn_teach_bow_1);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_addon_cavalorn_teach_bow_5);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_cavalorn_teach_1h_1);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_cavalorn_teach_1h_5);
};

func void dia_addon_cavalorn_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//Chc� si� czego� od ciebie nauczy�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Pewnie. Co chcesz wiedzie�?
	ADDON_CAVALORN_MERKE_BOW = other.hitchance[NPC_TALENT_BOW];
	ADDON_CAVALORN_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_Sneak_08_00");	//Na mi�kkich podeszwach mamy wi�ksze szanse podkra�� si� niezauwa�enie do przeciwnika.
	};
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,90);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,90);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,30);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,30);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_back()
{
	if((ADDON_CAVALORN_MERKE_BOW < other.hitchance[NPC_TALENT_BOW]) || (ADDON_CAVALORN_MERKE_1H < other.hitchance[NPC_TALENT_1H]))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//Od razu lepiej. Wiele zapomnia�e�, ale doprowadzimy ci� do formy.
	};
	Info_ClearChoices(dia_addon_cavalorn_teach);
};

