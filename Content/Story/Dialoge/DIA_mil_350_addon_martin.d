
instance DIA_ADDON_MARTIN_EXIT(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 999;
	condition = dia_addon_martin_exit_condition;
	information = dia_addon_martin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_martin_exit_condition()
{
	return TRUE;
};

func void dia_addon_martin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MARTIN_PICKPOCKET(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 900;
	condition = dia_addon_martin_pickpocket_condition;
	information = dia_addon_martin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_martin_pickpocket_condition()
{
	return c_beklauen(65,77);
};

func void dia_addon_martin_pickpocket_info()
{
	Info_ClearChoices(dia_addon_martin_pickpocket);
	Info_AddChoice(dia_addon_martin_pickpocket,DIALOG_BACK,dia_addon_martin_pickpocket_back);
	Info_AddChoice(dia_addon_martin_pickpocket,DIALOG_PICKPOCKET,dia_addon_martin_pickpocket_doit);
};

func void dia_addon_martin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_martin_pickpocket);
};

func void dia_addon_martin_pickpocket_back()
{
	Info_ClearChoices(dia_addon_martin_pickpocket);
};


instance DIA_ADDON_MARTIN_MEETINGISRUNNING(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 1;
	condition = dia_addon_martin_meetingisrunning_condition;
	information = dia_addon_martin_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_martin_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int dia_addon_martin_meetingisrunning_onetime;

func void dia_addon_martin_meetingisrunning_info()
{
	if(DIA_ADDON_MARTIN_MEETINGISRUNNING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_00");	//A wiêc to ty jesteœ ten nowy? Witaj wœród nas, bracie Krêgu.
		DIA_ADDON_MARTIN_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_01");	//IdŸ, zobacz siê teraz z Vatrasem. Mo¿e póŸniej znajdê czas dla ciebie.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MARTIN_HALLO(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_hallo_condition;
	information = dia_addon_martin_hallo_info;
	important = TRUE;
};


func int dia_addon_martin_hallo_condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (RANGERMEETINGRUNNING != LOG_SUCCESS) && (SC_ISRANGER == FALSE) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_addon_martin_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Martin_Hallo_07_00");	//Hej, ty! Nie masz tu czego szukaæ. Mog¹ tu wchodziæ tylko paladyni i stra¿ miejska.
};


instance DIA_ADDON_MARTIN_WASMACHSTDU(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_wasmachstdu_condition;
	information = dia_addon_martin_wasmachstdu_info;
	description = "Co to za miejsce?";
};


func int dia_addon_martin_wasmachstdu_condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000)
	{
		return TRUE;
	};
};

func void dia_addon_martin_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_WasMachstDu_15_00");	//Co to za miejsce?
	AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_01");	//Jesteœ w magazynie królewskich paladynów.
	if((other.guild == GIL_NONE) && (SC_ISRANGER == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_02");	//Jestem tu kwatermistrzem i mam zadanie dopilnowaæ, ¿eby z zapasu paladynów nic nie znik³o. A ty nie jesteœ tu mile widziany.
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_03");	//Wiêc trzymaj rêce przy sobie albo ci je obetnê.
	};
};


instance DIA_ADDON_MARTIN_PRETRADE(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_pretrade_condition;
	information = dia_addon_martin_pretrade_info;
	description = "Nie mo¿esz mi sprzedaæ czegoœ z rzeczy paladynów?";
};


func int dia_addon_martin_pretrade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_martin_pretrade_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_00");	//Nie mo¿esz mi sprzedaæ czegoœ z rzeczy paladynów?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_01");	//Chcesz coœ kupiæ? Pozwól, ¿e ujmê to w ten sposób – jeœli bêdziesz w stanie zrewan¿owaæ mi siê za k³opoty, które bêdê mia³, gdy coœ zginie, to mo¿emy siê jakoœ dogadaæ.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_02");	//Czêsto siê zdarza, ¿e coœ nagle znika?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_03");	//Nie, jeœli kwatermistrz twierdzi, ¿e wszystko jest w porz¹dku.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_04");	//Rozumiem.
};


instance DIA_ADDON_MARTIN_FARIM(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_farim_condition;
	information = dia_addon_martin_farim_info;
	description = "Rybak Farim ma problemy ze stra¿¹ miejsk¹. ";
};


func int dia_addon_martin_farim_condition()
{
	if((MIS_ADDON_FARIM_PALADINFISCH == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_martin_pretrade))
	{
		return TRUE;
	};
};

func void dia_addon_martin_farim_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_00");	//Rybak Farim ma problemy ze stra¿¹ miejsk¹. Ca³y czas go okradaj¹.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_01");	//Czemu powinienem siê tym przejmowaæ?
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_02");	//Cieszysz siê szacunkiem paladynów.
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_03");	//Farim potrzebuje twojej ochrony. Z chêci¹ odda ci w zamian czêœæ tego, co wy³owi.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_04");	//Ju¿ wiem, o co ci chodzi.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_05");	//Ryby! Jakbym nie mia³ doœæ innych problemów.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_06");	//Powiedz swojemu kole¿ce, ¿eby siê ze mn¹ spotka³. Chcê dok³adnie wiedzieæ, o co chodzi z t¹ stra¿¹ miejsk¹.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_07");	//Zajmê siê tym.
	b_logentry(TOPIC_ADDON_FARIMSFISH,"T¹ spraw¹ zajmie siê kwatermistrz Martin.");
	MARTIN_KNOWSFARIM = TRUE;
	b_giveplayerxp(XP_ADDON_FARIMSCHUTZ);
};


instance DIA_ADDON_MARTIN_TRADE(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 80;
	condition = dia_addon_martin_trade_condition;
	information = dia_addon_martin_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co masz do zaoferowania?";
};


func int dia_addon_martin_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_pretrade))
	{
		return TRUE;
	};
};


var int dia_addon_martin_trade_onetime;

func void dia_addon_martin_trade_info()
{
	if(DIA_ADDON_MARTIN_TRADE_ONETIME == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,LOGTEXT_ADDON_MARTINTRADE);
		DIA_ADDON_MARTIN_TRADE_ONETIME = TRUE;
	};
	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Co masz do zaoferowania?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Addon_Martin_Trade_07_01");	//Przyjrzyj siê bli¿ej.
};


instance DIA_ADDON_MARTIN_RANGERHELP(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_rangerhelp_condition;
	information = dia_addon_martin_rangerhelp_info;
	description = "Przysy³a mnie Lares. ";
};


func int dia_addon_martin_rangerhelp_condition()
{
	if((RANGERHELP_GILDEMIL == TRUE) && Npc_KnowsInfo(other,dia_addon_martin_wasmachstdu) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_martin_rangerhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_00");	//Przysy³a mnie Lares. Powiedzia³, ¿e mo¿esz mi pomóc.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_01");	//Czy¿by? Wiêc przejdŸmy do rzeczy. Czego ode mnie chcesz?
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_02");	//Chcê wst¹piæ do stra¿y.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_03");	//Chcia³oby siê, co? Zwykle nie przyjmujemy takich szemranych typków. Chyba ¿e mamy dobry powód.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_04");	//Hmm, najpierw musia³byœ...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_05");	//Przestañ zrzêdziæ. Powiedz, co mam zrobiæ, ¿ebyœ móg³ mnie przyj¹æ.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_06");	//Dobra. Nadstaw uszu.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_07");	//Praca kwatermistrza to prawdziwe piek³o, uwierz mi. Ju¿ samo ustawianie tych wszystkich worków jest dobijaj¹ce.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_08");	//Na dodatek ktoœ majstruje przy skrzyniach, gdy wieczorkiem idê do karczmy Kardifa. Kiedy wracam rano, zawsze czegoœ brakuje.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_09");	//Co dziwne, paladyni nigdy nikogo nie zauwa¿yli.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_10");	//Szlag mnie trafia. Przecie¿ nie bêdê tu sta³ ca³¹ noc jak jakiœ idiota, nie?
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_11");	//Ale ty...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_12");	//Dobra, ³apiê. Mam tu staæ na warcie ca³¹ noc, podczas gdy ty bêdziesz siê zabawia³ w karczmie.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_13");	//Bierzesz robotê albo nie.
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Mam pilnowaæ w nocy skrzyñ kwatermistrza Martina. Jeœli z³apiê ³obuza, który grzebie w zapasach, Martin pomo¿e mi wst¹piæ do stra¿y.");
};


instance DIA_ADDON_MARTIN_AUFTRAG(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_auftrag_condition;
	information = dia_addon_martin_auftrag_info;
	description = "Dobrze. Przypilnujê dziœ w nocy twoich skrzyñ z prowiantem.";
};


func int dia_addon_martin_auftrag_condition()
{
	if((RANGERHELP_GILDEMIL == TRUE) && Npc_KnowsInfo(other,dia_addon_martin_rangerhelp) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};


var int mis_addon_martin_getrangar_day;

func void dia_addon_martin_auftrag_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Auftrag_15_00");	//Dobrze. Przypilnujê dziœ w nocy twoich skrzyñ z prowiantem.
	AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_01");	//Œwietnie.
	if(Wld_IsTime(23,0,4,0))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_02");	//W takim razie idê do knajpy Kardifa. I ¿eby mi niczego nie brakowa³o, kiedy wrócê!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_03");	//Dobrze. Wróæ w nocy i przypilnuj ca³ego ³adunku. Bêdê siedzia³ w knajpie Kardifa.
	};
	b_startotherroutine(mil_321_rangar,"PrePalCampKlau");
	Info_ClearChoices(dia_addon_martin_auftrag);
	Info_AddChoice(dia_addon_martin_auftrag,"(DALEJ)",dia_addon_martin_auftrag_weiter);
};

func void dia_addon_martin_auftrag_weiter()
{
	MIS_ADDON_MARTIN_GETRANGAR = LOG_RUNNING;
	MIS_ADDON_MARTIN_GETRANGAR_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(mil_321_rangar,"PalCampKlau");
};


instance DIA_ADDON_MARTIN_FROMVATRAS(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_fromvatras_condition;
	information = dia_addon_martin_fromvatras_info;
	description = "Szukasz cz³owieka, który sprzedaje broñ bandytom?";
};


func int dia_addon_martin_fromvatras_condition()
{
	if(VATRAS_TOMARTIN == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_martin_fromvatras_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_00");	//Szukasz cz³owieka, który sprzedaje broñ bandytom?
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_01");	//A kto tak mówi?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_02");	//Vatras.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_03");	//Co wiesz na ten temat?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_04");	//Niezbyt du¿o, ale mogê dowiedzieæ siê wiêcej.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_05");	//Widzê, do czego zmierzasz...
};


instance DIA_ADDON_MARTIN_TELLALL(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_tellall_condition;
	information = dia_addon_martin_tellall_info;
	description = "Co wiesz na temat tego handlarza broni¹?";
};


func int dia_addon_martin_tellall_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_fromvatras))
	{
		return TRUE;
	};
};

func void dia_addon_martin_tellall_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_TellAll_15_00");	//Co wiesz na temat tego handlarza broni¹?
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_01");	//Dobra, s³uchaj. Wiemy, ¿e musi za tym staæ wp³ywowy obywatel górnego miasta.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_02");	//Powiadaj¹ nawet, ¿e czêœæ broni pochodzi ze zbrojowni stra¿y.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_03");	//Ale nie wiemy dok³adnie, kto poci¹ga za sznurki.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_04");	//Jeœli masz doœæ odwagi, by poradziæ sobie z grup¹ co najmniej piêciu bandytów, to mo¿e uda ci siê czegoœ dowiedzieæ...
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin twierdzi, ¿e handlarz broni¹ jest wp³ywowym obywatelem z górnego miasta.");
};


instance DIA_ADDON_MARTIN_ABOUTBANDITS(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_aboutbandits_condition;
	information = dia_addon_martin_aboutbandits_info;
	description = "O co chodzi z tymi bandytami?";
};


func int dia_addon_martin_aboutbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_tellall))
	{
		return TRUE;
	};
};

func void dia_addon_martin_aboutbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_AboutBandits_15_00");	//O co chodzi z tymi bandytami?
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_01");	//Wiemy, ¿e zablokowali drogi pomiêdzy farmami i miastem.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_02");	//Wiem te¿, ¿e w ci¹gu kilku ostatnich dni otrzymali dostawê broni.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_03");	//Mo¿e wœród samych bandytów znajdziemy jakieœ wskazówki, które pomog¹ nam zdemaskowaæ tego handlarza broni¹.
	MIS_MARTIN_FINDTHEBANDITTRADER = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Bandyci blokuj¹ drogê miêdzy miastem portowym a gospodarstwami. Byæ mo¿e dadz¹ mi wskazówkê, jak trafiæ do handlarza broni¹.");
};


instance DIA_ADDON_MARTIN_FERNANDO(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_fernando_condition;
	information = dia_addon_martin_fernando_info;
	permanent = TRUE;
	description = "Jeœli chodzi o tego handlarza broni¹...";
};


func int dia_addon_martin_fernando_condition()
{
	if(MIS_MARTIN_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int martin_irrlichthint;

func void dia_addon_martin_fernando_info()
{
	var int fernandohints;
	AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_00");	//Jeœli chodzi o tego handlarza broni¹...
	if(Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE)) || (FERNANDO_HATSZUGEGEBEN == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_01");	//Poka¿, co tam masz.
		fernandohints = 0;
		if(Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE)))
		{
			if(Npc_HasItems(other,itmw_addon_bandittrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_02");	//Ten pa³asz zabra³em bandytom. Na g³owicy wyciêto literê F.
				fernandohints = fernandohints + 1;
			};
			if(Npc_HasItems(other,itri_addon_bandittrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_03");	//To pierœcieñ od jednego z bandytów. Nale¿a³ do zamorskiego kupca.
				fernandohints = fernandohints + 1;
			};
			if(Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_04");	//Na liœcie broni i innych towarów dostarczonych bandytom widnieje podpis niejakiego Fernando.
				fernandohints = fernandohints + 3;
			};
			if(FERNANDO_HATSZUGEGEBEN == TRUE)
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_05");	//Fernando, kupiec z górnego miasta, przyzna³ siê do robienia interesów z bandytami.
				fernandohints = fernandohints + 1;
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_06");	//Fernando przyzna³ siê do dostarczania broni bandytom.
		};
		if(fernandohints >= 3)
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_07");	//S¹dzê, ¿e to wystarczy. A wiêc to Fernando. No to nieŸle wpad³.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_08");	//W sumie to dziwne. Zawsze wydawa³ siê takim praworz¹dnym obywatelem.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_09");	//Przypilnujê, ¿eby przez d³ugi czas nie wyszed³ z wiêzienia.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_10");	//Naprawdê siê spisa³eœ. Czapki z g³ów.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_11");	//Vatras bêdzie zachwycony tymi wiadomoœciami.
			b_startotherroutine(fernando,"Prison");
			FERNANDO_IMKNAST = TRUE;
			MIS_MARTIN_FINDTHEBANDITTRADER = LOG_SUCCESS;
			b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin przypilnuje, by Fernando zap³aci³ za swoje grzechy. Muszê powiedzieæ o tym Vatrasowi.");
			b_giveplayerxp(XP_ADDON_FERNANDOMARTIN);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_12");	//Coœ jeszcze?
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_13");	//To wszystko.
			if(FERNANDO_HATSZUGEGEBEN == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_14");	//Mi³o z jego strony, ¿e tak powiedzia³, ale bez dowodów nic nie mogê zrobiæ.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_15");	//Nie mam zamiaru siê oœmieszyæ przed Lordem Hagenem. Bêdziesz musia³ dostarczyæ wiêcej dowodów.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_16");	//To nie wystarczy. To móg³by byæ niemal ka¿dy z górnego miasta.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_17");	//Wychodzi na to, ¿e trzeba bêdzie pójœæ trochê dalej œladem bandytów i ich ³upów. A¿ dowiemy siê, kto za tym stoi.
				if(MARTIN_IRRLICHTHINT == FALSE)
				{
					AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_18");	//Mo¿e znów powinieneœ porozmawiaæ z Vatrasem.
					MARTIN_IRRLICHTHINT = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_19");	//Przypomnij, o co chodzi³o?
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_20");	//Musisz siê dowiedzieæ, kto jest odpowiedzialny za dostawy broni dla bandytów, oraz przynieœæ mi jakiœ dowód.
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_21");	//Musi to byæ niepodwa¿alny materia³, bo inaczej nie zdo³am niczego udowodniæ.
	};
};


instance DIA_ADDON_MARTIN_PERM(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 90;
	condition = dia_addon_martin_perm_condition;
	information = dia_addon_martin_perm_info;
	permanent = TRUE;
	description = "Skrzynie wci¹¿ tu s¹?";
};


func int dia_addon_martin_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_martin_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Perm_15_00");	//Skrzynie wci¹¿ tu s¹?
	if((MIS_ADDON_MARTIN_GETRANGAR_DAY <= (Wld_GetDay() - 2)) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_01");	//Ty sukinsynu! Mia³eœ przecie¿ pilnowaæ tych skrzyñ. Teraz znik³o coœ jeszcze.
		if(Wld_IsTime(24,0,3,0))
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_02");	//Pójdziesz do magazynu na nabrze¿u i dorwiesz gnoja, który mnie okrad³.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_03");	//Dziœ w nocy lepiej uwa¿aj, kiedy mnie nie bêdzie, jasne?
		};
	}
	else if((MIS_ADDON_MARTIN_GETRANGAR != 0) || (hero.guild != GIL_NONE) || (SC_ISRANGER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_04");	//Tak, tak, œmiej siê, ile chcesz. Chêtnie bym zobaczy³, jak stoisz tu przez ca³y dzieñ, próbuj¹c zapanowaæ nad tym chaosem.
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_05");	//Paladyni przywieŸli tyle z³omu, ¿e g³owa ma³a.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_06");	//Nie dotykaj niczego albo zawo³am stra¿e. S³yszysz?
	};
};


instance DIA_ADDON_MARTIN_GOTRANGAR(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_gotrangar_condition;
	information = dia_addon_martin_gotrangar_info;
	description = "Dowiedzia³em siê, kim jest z³odziej.";
};


func int dia_addon_martin_gotrangar_condition()
{
	if((MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING) && (SC_GOTRANGAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_martin_gotrangar_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_00");	//Dowiedzia³em siê, kim jest z³odziej.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_01");	//To Rangar majstrowa³ przy twoich rzeczach.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_02");	//W koñcu. Przynajmniej wiem, na kogo teraz uwa¿aæ. Co za szuja. Dostanie niez³e baty, jeœli z³apiê go na gor¹cym uczynku.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_03");	//Zastanawia³em siê, dlaczego ¿aden z paladynów nigdy nic nie zauwa¿y³?
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_04");	//No? Dlaczego?
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_05");	//Czy to nie oczywiste? Ci durnie nie potrafi¹ odró¿niæ nas od stra¿ników. Dla nich wygl¹damy tak samo.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_06");	//Dobra robota, kolego.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_07");	//Daj mi znaæ, jeœli mogê ci w czymœ pomóc.
	MIS_ADDON_MARTIN_GETRANGAR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MARTIN_GOTRANGAR_REPORT);
};


instance DIA_ADDON_MARTIN_GETMILIZ(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_getmiliz_condition;
	information = dia_addon_martin_getmiliz_info;
	description = "Wiesz, czego chcê.";
};


func int dia_addon_martin_getmiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_gotrangar))
	{
		return TRUE;
	};
};

func void dia_addon_martin_getmiliz_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GetMiliz_15_00");	//Wiesz, czego chcê.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_01");	//Tak, oczywiœcie. Chcia³eœ wst¹piæ do stra¿y, prawda?
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_02");	//Ju¿ zademonstrowa³eœ wyj¹tkowe zdolnoœci.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_03");	//No dobra, ujmê to inaczej – wola³bym mieæ ciê po naszej stronie.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_04");	//Dlatego ci pomagam. WeŸ ten list polecaj¹cy i poka¿ go Andre, naszemu g³ównodowodz¹cemu paladynowi.
	CreateInvItems(self,itwr_martin_milizempfehlung_addon,1);
	b_giveinvitems(self,other,itwr_martin_milizempfehlung_addon,1);
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_05");	//Znajdziesz go w koszarach. Jestem pewien, ¿e znajdzie zajêcie dla kogoœ takiego jak ty.
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Martin da³ mi list polecaj¹cy do g³ównodowodz¹cego paladyna, Andre, dziêki czemu zostanê przyjêty do stra¿y. Andre mo¿na znaleŸæ w koszarach.");
};

