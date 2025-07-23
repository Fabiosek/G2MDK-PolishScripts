
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
	description = "(Kradzie¿ tego ko³czanu bêdzie doœæ ³atwa)";
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
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//Witaj w Krêgu, przyjacielu.
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
	description = "Jakieœ k³opoty?";
};


func int dia_addon_cavalorn_hallo_condition()
{
	return TRUE;
};

func void dia_addon_cavalorn_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Jakieœ k³opoty?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//Do diab³a. Nie wiem, gdzie siê ukrywaj¹. Zabijesz jednego, ale zaraz wracaj¹.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//Chwila. Ja ciebie znam. To ty ci¹gle ¿ebra³eœ u mnie o strza³y, jeszcze w Górniczej Dolinie.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Nazywasz siê Cavalorn, tak?",dia_addon_cavalorn_hallo_ja);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Nie przypominam sobie...",dia_addon_cavalorn_hallo_weissnicht);
};

func void dia_addon_cavalorn_hallo_weissnicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//Nie przypominam sobie...
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//Daj spokój! Nauczy³em ciê ³ucznictwa i skradania siê w mojej chatce niedaleko Starego Obozu! Przypominasz sobie?
};

func void dia_addon_cavalorn_hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Nazywasz siê Cavalorn, tak?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//Ach, nie zapomnia³eœ o mnie. Koniec koñców obaj przeszliœmy przez tê przeklêt¹ koloniê.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Dok¹d idziesz?
	Info_ClearChoices(dia_addon_cavalorn_hallo);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Nie mam okreœlonego celu.",dia_addon_cavalorn_hallo_keinziel);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Z powrotem do Górniczej Doliny.",dia_addon_cavalorn_hallo_bauern);
	if(mil_310_stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice(dia_addon_cavalorn_hallo,"Do miasta.",dia_addon_cavalorn_hallo_stadt);
	};
};

func void dia_addon_cavalorn_hallo_stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//Do miasta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//Ach, te¿ do miasta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//Mia³byœ k³opoty ze stra¿¹. Teraz, gdy a¿ roi siê tu od bandytów, nie ka¿dy mo¿e wejœæ do miasta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//Kilka dni temu przechodzi³ têdy jeden ze starych Psioników z Górniczej Doliny. Mówi³, ¿e mo¿e wchodziæ i wychodziæ z Khorinis, kiedy tylko chce.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//Poszed³ do doliny pod t¹ du¿¹ wie¿¹. Gdzieœ w okolicy wodospadu musi byæ przejœcie.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Mo¿e powinieneœ z nim porozmawiaæ.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};

func void dia_addon_cavalorn_hallo_bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Z powrotem do Górniczej Doliny.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//Naprawdê? Hmm. Szkoda, ¿e nie mogê z tob¹ iœæ, ale muszê za³atwiæ kilka spraw.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//Je¿eli dostaniesz siê do Górniczej Doliny, sprawdŸ, czy moja chata jeszcze stoi, dobrze? Pewnego dnia chcia³bym tam wróciæ.
	MIS_ADDON_CAVALORN_THEHUT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_CAVALORNTHEHUT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CAVALORNTHEHUT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CAVALORNTHEHUT,"Cavalorn chce, ¿ebym sprawdzi³, czy w Górniczej Dolinie wci¹¿ stoi jego stara chata. Z tego, co pamiêtam, znajdowa³a siê ona na wzgórzach na zachód od Starego Obozu. Wydaje mi siê, ¿e coœ tam mog³o zostaæ.");
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};

func void dia_addon_cavalorn_hallo_keinziel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//Nie mam okreœlonego celu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//Nie chcesz powiedzieæ, co? Nie ma sprawy.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};


instance DIA_ADDON_CAVALORN_BEUTEL(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_beutel_condition;
	information = dia_addon_cavalorn_beutel_info;
	description = "By³em w twojej chacie w Górniczej Dolinie.";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//By³em w twojej chacie w Górniczej Dolinie.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//A zatem jeszcze stoi.
	if(MIS_ADDON_CAVALORN_THEHUT == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Tak. I wiem, co stamt¹d chcia³eœ.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Uda³o ci siê to znaleŸæ?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//Je¿eli mówisz o torbie pe³nej rudy... Tak, mam j¹.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//Ale z ciebie spryciula, wiesz o tym?
	if(MIS_ADDON_CAVALORN_THEHUT == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//A czego móg³byœ potrzebowaæ z tej starej chaty? Nic tam nie zosta³o.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//Masz j¹ ze sob¹? Dam ci za ni¹ 100 sztuk z³ota.
	TOPIC_END_CAVALORNTHEHUT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	if(Npc_HasItems(other,itse_addon_cavalornsbeutel))
	{
		Info_AddChoice(dia_addon_cavalorn_beutel,"Pewnie.",dia_addon_cavalorn_beutel_ja);
	}
	else if(Npc_HasItems(other,itmi_nugget))
	{
		Info_AddChoice(dia_addon_cavalorn_beutel,"Nie, ale mam kawa³ki rudy.",dia_addon_cavalorn_beutel_jaerz);
	};
	Info_AddChoice(dia_addon_cavalorn_beutel,"Nie.",dia_addon_cavalorn_beutel_no);
};

func void dia_addon_cavalorn_beutel_back()
{
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//Mam nadziejê, ¿e wkrótce j¹ odzyskam.
};

func void dia_addon_cavalorn_beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//Nie, ale mam kawa³ki rudy.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Te¿ dobrze.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"A dlaczego j¹ zostawi³eœ?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Pewnie.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//Œwietnie.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"A dlaczego j¹ zostawi³eœ?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//Nie.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Wiêc przynieœ mi to! Koniec koñców sam bym chyba poszed³ po ten towar do tej przeklêtej Górniczej Doliny.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//Jestem wzruszony.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"A dlaczego j¹ zostawi³eœ?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_why()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//A dlaczego j¹ zostawi³eœ?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//Kto móg³by przypuszczaæ, ¿e w Khorinis ruda jest tak cenna.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//W kolonii za g³upi kawa³ek rudy nie dosta³byœ nawet miejsca do spania.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//W porcie mo¿na dostaæ po g³owie za kawa³ek rudy.
};


instance DIA_ADDON_CAVALORN_ERZGEBEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_erzgeben_condition;
	information = dia_addon_cavalorn_erzgeben_info;
	description = "Daj mi 100 sztuk z³ota, a przyniosê ci tê rudê.";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Daj mi 100 sztuk z³ota, a przyniosê ci tê rudê.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//Zgoda. Masz.
	CreateInvItems(self,itmi_gold,100);
	b_giveinvitems(self,other,itmi_gold,100);
	if(b_giveinvitems(other,self,itse_addon_cavalornsbeutel,1) == FALSE)
	{
		b_giveinvitems(other,self,itmi_nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//Prawdziwy z ciebie przyjaciel. Dziêkujê.
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
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//Utkn¹³em. Gdyby nie ci przeklêci bandyci, w ogóle by mnie tu nie by³o.
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
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Przespa³eœ ca³y ostatni tydzieñ?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Ech...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//Mówiê o tych szczurach z kolonii karnej - rozleŸli siê po ca³ej okolicy; ³upi¹ i morduj¹.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//Cieszê siê, ¿e darowali mi ¿ycie. Nie uwa¿a³em i dosta³em w czaszkê.
	if(c_bragobanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//Nie wiem, jak mam teraz odzyskaæ swoje rzeczy.
	};
};


instance DIA_ADDON_CAVALORN_ARTEFAKT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_artefakt_condition;
	information = dia_addon_cavalorn_artefakt_info;
	description = "Zosta³eœ obrabowany przez bandytów?";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//Zosta³eœ obrabowany przez bandytów?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//Tak. Og³uszyli mnie i zostawili jako ¿arcie dla goblinów.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//To by³y piekielnie wa¿ne rzeczy. List i ca³a moja gotówka. Muszê je odzyskaæ.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//Nie pójdê tam jednak bez wsparcia. Ta tchórzliwa ha³astra bandytów...
};


instance DIA_ADDON_CAVALORN_HELFEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_helfen_condition;
	information = dia_addon_cavalorn_helfen_info;
	description = "Mogê ci pomóc z tymi bandytami?";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//Mogê ci pomóc z tymi bandytami?
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//Mo¿e. Ale s¹dz¹c po twoim mizernym wygl¹dzie, mogê powiedzieæ, ¿e od tygodni nie mia³eœ w rêkach prawdziwego miecza.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//No có¿. Muszê chyba przyj¹æ twoj¹ ofertê. Nie mam zbyt wiele czasu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//Dobra, s³uchaj. W dole tej œcie¿ki jest jedna z tych brudnych dziur, w których ukrywaj¹ siê bandyci.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//To te ³otry ukrad³y moje rzeczy.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//Daj znaæ, gdy bêdziesz gotów. Ruszymy za tymi szczurami!
	MIS_ADDON_CAVALORN_KILLBRAGO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KILLBRAGO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KILLBRAGO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLBRAGO,"Bandyci ukradli coœ cennego Cavalornowi. Chce, ¿ebyœmy razem ich zabili.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_CAVALORN_AUSRUESTUNG(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_ausruestung_condition;
	information = dia_addon_cavalorn_ausruestung_info;
	description = "Potrzebujê lepszego sprzêtu.";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//Potrzebujê lepszego sprzêtu.
	if(c_bragobanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Te œwinie nie zostawi³y mi zbyt wiele.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//Mogê ci daæ nó¿ na wilki. Wystarczy?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//Tak, nó¿ bêdzie dobry.
	CreateInvItems(self,itmw_addon_knife01,1);
	b_giveinvitems(self,other,itmw_addon_knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//A co z leczeniem?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//Zosta³y mi dwie mikstury uzdrawiaj¹ce. Chcesz?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Pewnie. Wezmê je.
	CreateInvItems(self,itpo_health_01,2);
	b_giveinvitems(self,other,itpo_health_01,2);
};


instance DIA_ADDON_CAVALORN_LETSKILLBANDITS(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_letskillbandits_condition;
	information = dia_addon_cavalorn_letskillbandits_info;
	description = "ChodŸmy zabiæ tych gnojków.";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//ChodŸmy zabiæ tych gnojków.
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Dobra. Tylko mnie os³aniaj, jasne?
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
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//Przynajmniej mogê wykonaæ zadanie. I tak zmarnowa³em ju¿ zbyt wiele czasu.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//Jakie zadanie...?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//Ech. Muszê siê dostaæ do miasta, a póŸniej...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//Nie wiem tylko, jak mam zd¹¿yæ.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//A co ze mn¹?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//Hmm. Czemu nie. Móg³byœ zanieœæ list do miasta.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//Dziêki temu bêdê mia³ czas, ¿eby pozbieraæ sprzêt.
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//Jeden z tych bandytów powinien mieæ list w kieszeni.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Zanieœ go do miasta i oddaj magowi Krêgu Wody, Vatrasowi. Znajdziesz go w œwi¹tyni Adanosa. Naucza tam ca³ymi dniami.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//Powiedz mu, ¿e nie zd¹¿y³em na czas.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//A gdyby ciê zapyta³, gdzie jestem, powiedz, ¿e w drodze na miejsce spotkania, dobrze?
		b_logentry(TOPIC_ADDON_KDW,"Maga Wody, Vatrasa, mo¿na znaleŸæ w portowym mieœcie Khorinis. G³osi tam kazania w œwi¹tyni Adanosa.");
	};
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//Aha, jeszcze jedno: kup sobie od jakiegoœ wieœniaka porz¹dne ubranie.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Inaczej wezm¹ ciê za bandytê. Masz, tu jest parê monet.
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
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//No to za³atwione. Ech. Mogli ze mn¹ nie zaczynaæ.
	b_addon_cavalorn_vatrasbrief();
};


instance DIA_ADDON_CAVALORN_PCKILLEDBRAGO(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_pckilledbrago_condition;
	information = dia_addon_cavalorn_pckilledbrago_info;
	description = "Bandyci s¹ ju¿ martwi.";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//Bandyci s¹ ju¿ martwi.
	b_addon_cavalorn_vatrasbrief();
};


instance DIA_ADDON_CAVALORN_JUNGS(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 2;
	condition = dia_addon_cavalorn_jungs_condition;
	information = dia_addon_cavalorn_jungs_info;
	description = "Masz na sobie interesuj¹cy pancerz.";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Masz na sobie interesuj¹cy pancerz. Nie nale¿ysz ju¿ do Cieni?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//Cieni? Od upadku bariery ju¿ nie istniej¹.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//Gdy tylko mogliœmy opuœciæ Górnicz¹ Dolinê, nie by³o powodu, ¿eby tam d³u¿ej zostawaæ.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Teraz pracujê dla magów wody. Jestem cz³onkiem Wodnego Krêgu.
	SC_KNOWSRANGER = TRUE;
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Cavalorn powiedzia³ mi, ¿e nale¿y do grupy zw¹cej siê Wodny Kr¹g.");
	CAVALORN_RANGERHINT = TRUE;
};


instance DIA_ADDON_CAVALORN_RING(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_ring_condition;
	information = dia_addon_cavalorn_ring_info;
	permanent = FALSE;
	description = "Powiedz mi coœ wiêcej o Wodnym Krêgu!";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//Powiedz mi coœ wiêcej o Wodnym Krêgu!
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//Nie wolno mi o tym mówiæ.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//Mogê ciê jedynie wys³aæ do Vartasa. On reprezentuje Magów Wody w Khorinis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//Najlepiej bêdzie, jak z nim porozmawiasz. Powiedz, ¿e ja ciê przys³a³em.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Mo¿e pozwoli ci wst¹piæ do Krêgu. Bardzo potrzeba nam dobrych ludzi...
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras, Mag Wody, mo¿e powiedzieæ mi wiêcej o Wodnym Krêgu.");
};


instance DIA_ADDON_CAVALORN_FEINDE(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 6;
	condition = dia_addon_cavalorn_feinde_condition;
	information = dia_addon_cavalorn_feinde_info;
	permanent = FALSE;
	description = "Czy ty i twoi ludzie nie byliœcie czasem przeciwnikami Magów Wody?";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Czy ty i twoi ludzie nie byliœcie czasem przeciwnikami Magów Wody?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Szalona przesz³oœæ jest ju¿ za nami. Nie ma ju¿ Nowego ani Starego Obozu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//A teraz, gdy nie ma ju¿ kolonii karnej, ka¿dy odpowiada za siebie.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//Wiêkszoœæ z nas - by³ych wiêŸniów - nie zosta³a uniewinniona.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//Magowie Wody zdo³ali uzyskaæ dla mnie u³askawienie i mogê teraz poruszaæ siê swobodnie.
};


instance DIA_ADDON_CAVALORN_KDWTASK(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 6;
	condition = dia_addon_cavalorn_kdwtask_condition;
	information = dia_addon_cavalorn_kdwtask_info;
	permanent = FALSE;
	description = "Co porabiaj¹ teraz Magowie Wody?";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//Co porabiaj¹ teraz Magowie Wody?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//Maj¹ wielki plan. Chodzi o niezbadan¹ czêœæ wyspy.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//Niezbadan¹ czêœæ? Gdzie ona jest?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//Nie mogê ci powiedzieæ nic wiêcej. Porozmawiaj z Vatrasem w Khorinis.
};


instance DIA_ADDON_CAVALORN_BROUGHTLETTER(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_broughtletter_condition;
	information = dia_addon_cavalorn_broughtletter_info;
	description = "Da³em Vatrasowi twój list.";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//Da³em Vatrasowi twój list.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//Nie oczekiwa³em od ciebie niczego innego. Dziêkujê.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_CAVALORN_ORNAMENT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 2;
	condition = dia_addon_cavalorn_ornament_condition;
	information = dia_addon_cavalorn_ornament_info;
	description = "Szukasz czegoœ?";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Szukasz czegoœ?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//To takie oczywiste? Tak, Magowie Wody kazali mi szukaæ zgubionych ornamentów.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//Interesuj¹cy zbieg okolicznoœci. Otrzyma³em taki sam rozkaz od Nefariusa.
	if(SC_KNOWSRANGER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//Nale¿ysz wiêc do Wodnego Krêgu?
		if(SC_ISRANGER == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Tak.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Jeszcze nie, ale pracujê nad tym.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//To dobrze. W takim razie nie muszê tego robiæ sam.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//Znalaz³eœ ju¿ jakiœ ornament?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//Znam miejsce, w którym powinniœmy coœ znaleŸæ.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//Ten kamienny kr¹g mo¿e byæ jedn¹ z tych budowli, które opisa³ Nefarius.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Teraz musimy tylko znaleŸæ mechanizm.
};


instance DIA_ADDON_CAVALORN_TRIGGERED(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_triggered_condition;
	information = dia_addon_cavalorn_triggered_info;
	description = "Uruchomi³em mechanizm. Nic siê nie sta³o.";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//Uruchomi³em mechanizm. Nic siê nie sta³o.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//W takim razie wieœniacy Lobarta mieli racjê.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//Powiedzieli, ¿e ktoœ ju¿ krêci³ siê przy tych kamieniach.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//Nagle znik¹d pojawi³ siê kamienny stra¿nik i ich zaatakowa³.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//Farmerzy wezwali stra¿, ¿o³nierze paladynów, a ci przyszli i zniszczyli potwora.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//Przeszuka³em ju¿ ca³y teren. Je¿eli by³ tu jakiœ ornament, maj¹ go teraz paladyni.
	Info_ClearChoices(dia_addon_cavalorn_triggered);
	Info_AddChoice(dia_addon_cavalorn_triggered,"Jeden z nas musi pójœæ do górnego miasta.",dia_addon_cavalorn_triggered_pal);
	Info_AddChoice(dia_addon_cavalorn_triggered,"W takim razie pójdê do nich i odzyskam ornament.",dia_addon_cavalorn_triggered_oback);
};

func void b_cavalorn_triggered_wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//Pójdê do miasta. Spotkamy siê u Vatrasa.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");
	Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ORNAMENT,"Jeden z brakuj¹cych fragmentów ornamentu jest w posiadaniu paladynów w górnym mieœcie.");
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//W takim razie pójdê do nich i odzyskam ornament.
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Jeden z nas musi pójœæ do górnego miasta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//Nie mam na to czasu. Ty musisz to zrobiæ.
	b_cavalorn_triggered_wohin();
};


instance DIA_ADDON_CAVALORN_GOTORNAFROMHAGEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_gotornafromhagen_condition;
	information = dia_addon_cavalorn_gotornafromhagen_info;
	description = "Dosta³em brakuj¹cy ornament od Lorda Hagena.";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//Dosta³em brakuj¹cy ornament od Lorda Hagena.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//Widzisz? Wiedzia³em, ¿e mieli go paladyni.
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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Pewnie. Przecie¿ wiesz. Oj, ch³opie, nieŸle ciê przegonili.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//Niczego nie pamiêtasz, prawda?
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
	description = "Chcê siê czegoœ od ciebie nauczyæ.";
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
		Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring("Skradanie siê",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),dia_addon_cavalorn_teach_sneak);
	};
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_addon_cavalorn_teach_bow_1);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_addon_cavalorn_teach_bow_5);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_cavalorn_teach_1h_1);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_cavalorn_teach_1h_5);
};

func void dia_addon_cavalorn_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//Chcê siê czegoœ od ciebie nauczyæ.
	AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Pewnie. Co chcesz wiedzieæ?
	ADDON_CAVALORN_MERKE_BOW = other.hitchance[NPC_TALENT_BOW];
	ADDON_CAVALORN_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_Sneak_08_00");	//Na miêkkich podeszwach mamy wiêksze szanse podkraœæ siê niezauwa¿enie do przeciwnika.
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
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//Od razu lepiej. Wiele zapomnia³eœ, ale doprowadzimy ciê do formy.
	};
	Info_ClearChoices(dia_addon_cavalorn_teach);
};

