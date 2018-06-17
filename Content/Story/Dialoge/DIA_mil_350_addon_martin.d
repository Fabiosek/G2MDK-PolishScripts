
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
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_00");	//A wi�c to ty jeste� ten nowy? Witaj w�r�d nas, bracie Kr�gu.
		DIA_ADDON_MARTIN_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_01");	//Id�, zobacz si� teraz z Vatrasem. Mo�e p�niej znajd� czas dla ciebie.
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
	AI_Output(self,other,"DIA_Addon_Martin_Hallo_07_00");	//Hej, ty! Nie masz tu czego szuka�. Mog� tu wchodzi� tylko paladyni i stra� miejska.
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
	AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_01");	//Jeste� w magazynie kr�lewskich paladyn�w.
	if((other.guild == GIL_NONE) && (SC_ISRANGER == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_02");	//Jestem tu kwatermistrzem i mam zadanie dopilnowa�, �eby z zapasu paladyn�w nic nie znik�o. A ty nie jeste� tu mile widziany.
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_03");	//Wi�c trzymaj r�ce przy sobie albo ci je obetn�.
	};
};


instance DIA_ADDON_MARTIN_PRETRADE(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_pretrade_condition;
	information = dia_addon_martin_pretrade_info;
	description = "Nie mo�esz mi sprzeda� czego� z rzeczy paladyn�w?";
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
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_00");	//Nie mo�esz mi sprzeda� czego� z rzeczy paladyn�w?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_01");	//Chcesz co� kupi�? Pozw�l, �e ujm� to w ten spos�b � je�li b�dziesz w stanie zrewan�owa� mi si� za k�opoty, kt�re b�d� mia�, gdy co� zginie, to mo�emy si� jako� dogada�.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_02");	//Cz�sto si� zdarza, �e co� nagle znika?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_03");	//Nie, je�li kwatermistrz twierdzi, �e wszystko jest w porz�dku.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_04");	//Rozumiem.
};


instance DIA_ADDON_MARTIN_FARIM(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_farim_condition;
	information = dia_addon_martin_farim_info;
	description = "Rybak Farim ma problemy ze stra�� miejsk�. ";
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
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_00");	//Rybak Farim ma problemy ze stra�� miejsk�. Ca�y czas go okradaj�.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_01");	//Czemu powinienem si� tym przejmowa�?
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_02");	//Cieszysz si� szacunkiem paladyn�w.
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_03");	//Farim potrzebuje twojej ochrony. Z ch�ci� odda ci w zamian cz�� tego, co wy�owi.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_04");	//Ju� wiem, o co ci chodzi.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_05");	//Ryby! Jakbym nie mia� do�� innych problem�w.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_06");	//Powiedz swojemu kole�ce, �eby si� ze mn� spotka�. Chc� dok�adnie wiedzie�, o co chodzi z t� stra�� miejsk�.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_07");	//Zajm� si� tym.
	b_logentry(TOPIC_ADDON_FARIMSFISH,"T� spraw� zajmie si� kwatermistrz Martin.");
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
	AI_Output(self,other,"DIA_Addon_Martin_Trade_07_01");	//Przyjrzyj si� bli�ej.
};


instance DIA_ADDON_MARTIN_RANGERHELP(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_rangerhelp_condition;
	information = dia_addon_martin_rangerhelp_info;
	description = "Przysy�a mnie Lares. ";
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
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_00");	//Przysy�a mnie Lares. Powiedzia�, �e mo�esz mi pom�c.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_01");	//Czy�by? Wi�c przejd�my do rzeczy. Czego ode mnie chcesz?
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_02");	//Chc� wst�pi� do stra�y.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_03");	//Chcia�oby si�, co? Zwykle nie przyjmujemy takich szemranych typk�w. Chyba �e mamy dobry pow�d.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_04");	//Hmm, najpierw musia�by�...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_05");	//Przesta� zrz�dzi�. Powiedz, co mam zrobi�, �eby� m�g� mnie przyj��.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_06");	//Dobra. Nadstaw uszu.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_07");	//Praca kwatermistrza to prawdziwe piek�o, uwierz mi. Ju� samo ustawianie tych wszystkich work�w jest dobijaj�ce.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_08");	//Na dodatek kto� majstruje przy skrzyniach, gdy wieczorkiem id� do karczmy Kardifa. Kiedy wracam rano, zawsze czego� brakuje.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_09");	//Co dziwne, paladyni nigdy nikogo nie zauwa�yli.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_10");	//Szlag mnie trafia. Przecie� nie b�d� tu sta� ca�� noc jak jaki� idiota, nie?
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_11");	//Ale ty...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_12");	//Dobra, �api�. Mam tu sta� na warcie ca�� noc, podczas gdy ty b�dziesz si� zabawia� w karczmie.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_13");	//Bierzesz robot� albo nie.
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Mam pilnowa� w nocy skrzy� kwatermistrza Martina. Je�li z�api� �obuza, kt�ry grzebie w zapasach, Martin pomo�e mi wst�pi� do stra�y.");
};


instance DIA_ADDON_MARTIN_AUFTRAG(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_auftrag_condition;
	information = dia_addon_martin_auftrag_info;
	description = "Dobrze. Przypilnuj� dzi� w nocy twoich skrzy� z prowiantem.";
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
	AI_Output(other,self,"DIA_Addon_Martin_Auftrag_15_00");	//Dobrze. Przypilnuj� dzi� w nocy twoich skrzy� z prowiantem.
	AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_01");	//�wietnie.
	if(Wld_IsTime(23,0,4,0))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_02");	//W takim razie id� do knajpy Kardifa. I �eby mi niczego nie brakowa�o, kiedy wr�c�!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_03");	//Dobrze. Wr�� w nocy i przypilnuj ca�ego �adunku. B�d� siedzia� w knajpie Kardifa.
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
	description = "Szukasz cz�owieka, kt�ry sprzedaje bro� bandytom?";
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
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_00");	//Szukasz cz�owieka, kt�ry sprzedaje bro� bandytom?
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_01");	//A kto tak m�wi?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_02");	//Vatras.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_03");	//Co wiesz na ten temat?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_04");	//Niezbyt du�o, ale mog� dowiedzie� si� wi�cej.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_05");	//Widz�, do czego zmierzasz...
};


instance DIA_ADDON_MARTIN_TELLALL(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_tellall_condition;
	information = dia_addon_martin_tellall_info;
	description = "Co wiesz na temat tego handlarza broni�?";
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
	AI_Output(other,self,"DIA_Addon_Martin_TellAll_15_00");	//Co wiesz na temat tego handlarza broni�?
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_01");	//Dobra, s�uchaj. Wiemy, �e musi za tym sta� wp�ywowy obywatel g�rnego miasta.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_02");	//Powiadaj� nawet, �e cz�� broni pochodzi ze zbrojowni stra�y.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_03");	//Ale nie wiemy dok�adnie, kto poci�ga za sznurki.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_04");	//Je�li masz do�� odwagi, by poradzi� sobie z grup� co najmniej pi�ciu bandyt�w, to mo�e uda ci si� czego� dowiedzie�...
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin twierdzi, �e handlarz broni� jest wp�ywowym obywatelem z g�rnego miasta.");
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
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_01");	//Wiemy, �e zablokowali drogi pomi�dzy farmami i miastem.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_02");	//Wiem te�, �e w ci�gu kilku ostatnich dni otrzymali dostaw� broni.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_03");	//Mo�e w�r�d samych bandyt�w znajdziemy jakie� wskaz�wki, kt�re pomog� nam zdemaskowa� tego handlarza broni�.
	MIS_MARTIN_FINDTHEBANDITTRADER = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Bandyci blokuj� drog� mi�dzy miastem portowym a gospodarstwami. By� mo�e dadz� mi wskaz�wk�, jak trafi� do handlarza broni�.");
};


instance DIA_ADDON_MARTIN_FERNANDO(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_fernando_condition;
	information = dia_addon_martin_fernando_info;
	permanent = TRUE;
	description = "Je�li chodzi o tego handlarza broni�...";
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
	AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_00");	//Je�li chodzi o tego handlarza broni�...
	if(Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE)) || (FERNANDO_HATSZUGEGEBEN == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_01");	//Poka�, co tam masz.
		fernandohints = 0;
		if(Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE)))
		{
			if(Npc_HasItems(other,itmw_addon_bandittrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_02");	//Ten pa�asz zabra�em bandytom. Na g�owicy wyci�to liter� F.
				fernandohints = fernandohints + 1;
			};
			if(Npc_HasItems(other,itri_addon_bandittrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_03");	//To pier�cie� od jednego z bandyt�w. Nale�a� do zamorskiego kupca.
				fernandohints = fernandohints + 1;
			};
			if(Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_04");	//Na li�cie broni i innych towar�w dostarczonych bandytom widnieje podpis niejakiego Fernando.
				fernandohints = fernandohints + 3;
			};
			if(FERNANDO_HATSZUGEGEBEN == TRUE)
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_05");	//Fernando, kupiec z g�rnego miasta, przyzna� si� do robienia interes�w z bandytami.
				fernandohints = fernandohints + 1;
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_06");	//Fernando przyzna� si� do dostarczania broni bandytom.
		};
		if(fernandohints >= 3)
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_07");	//S�dz�, �e to wystarczy. A wi�c to Fernando. No to nie�le wpad�.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_08");	//W sumie to dziwne. Zawsze wydawa� si� takim praworz�dnym obywatelem.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_09");	//Przypilnuj�, �eby przez d�ugi czas nie wyszed� z wi�zienia.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_10");	//Naprawd� si� spisa�e�. Czapki z g��w.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_11");	//Vatras b�dzie zachwycony tymi wiadomo�ciami.
			b_startotherroutine(fernando,"Prison");
			FERNANDO_IMKNAST = TRUE;
			MIS_MARTIN_FINDTHEBANDITTRADER = LOG_SUCCESS;
			b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin przypilnuje, by Fernando zap�aci� za swoje grzechy. Musz� powiedzie� o tym Vatrasowi.");
			b_giveplayerxp(XP_ADDON_FERNANDOMARTIN);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_12");	//Co� jeszcze?
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_13");	//To wszystko.
			if(FERNANDO_HATSZUGEGEBEN == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_14");	//Mi�o z jego strony, �e tak powiedzia�, ale bez dowod�w nic nie mog� zrobi�.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_15");	//Nie mam zamiaru si� o�mieszy� przed Lordem Hagenem. B�dziesz musia� dostarczy� wi�cej dowod�w.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_16");	//To nie wystarczy. To m�g�by by� niemal ka�dy z g�rnego miasta.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_17");	//Wychodzi na to, �e trzeba b�dzie p�j�� troch� dalej �ladem bandyt�w i ich �up�w. A� dowiemy si�, kto za tym stoi.
				if(MARTIN_IRRLICHTHINT == FALSE)
				{
					AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_18");	//Mo�e zn�w powiniene� porozmawia� z Vatrasem.
					MARTIN_IRRLICHTHINT = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_19");	//Przypomnij, o co chodzi�o?
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_20");	//Musisz si� dowiedzie�, kto jest odpowiedzialny za dostawy broni dla bandyt�w, oraz przynie�� mi jaki� dow�d.
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_21");	//Musi to by� niepodwa�alny materia�, bo inaczej nie zdo�am niczego udowodni�.
	};
};


instance DIA_ADDON_MARTIN_PERM(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 90;
	condition = dia_addon_martin_perm_condition;
	information = dia_addon_martin_perm_info;
	permanent = TRUE;
	description = "Skrzynie wci�� tu s�?";
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
	AI_Output(other,self,"DIA_Addon_Martin_Perm_15_00");	//Skrzynie wci�� tu s�?
	if((MIS_ADDON_MARTIN_GETRANGAR_DAY <= (Wld_GetDay() - 2)) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_01");	//Ty sukinsynu! Mia�e� przecie� pilnowa� tych skrzy�. Teraz znik�o co� jeszcze.
		if(Wld_IsTime(24,0,3,0))
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_02");	//P�jdziesz do magazynu na nabrze�u i dorwiesz gnoja, kt�ry mnie okrad�.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_03");	//Dzi� w nocy lepiej uwa�aj, kiedy mnie nie b�dzie, jasne?
		};
	}
	else if((MIS_ADDON_MARTIN_GETRANGAR != 0) || (hero.guild != GIL_NONE) || (SC_ISRANGER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_04");	//Tak, tak, �miej si�, ile chcesz. Ch�tnie bym zobaczy�, jak stoisz tu przez ca�y dzie�, pr�buj�c zapanowa� nad tym chaosem.
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_05");	//Paladyni przywie�li tyle z�omu, �e g�owa ma�a.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_06");	//Nie dotykaj niczego albo zawo�am stra�e. S�yszysz?
	};
};


instance DIA_ADDON_MARTIN_GOTRANGAR(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_gotrangar_condition;
	information = dia_addon_martin_gotrangar_info;
	description = "Dowiedzia�em si�, kim jest z�odziej.";
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
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_00");	//Dowiedzia�em si�, kim jest z�odziej.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_01");	//To Rangar majstrowa� przy twoich rzeczach.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_02");	//W ko�cu. Przynajmniej wiem, na kogo teraz uwa�a�. Co za szuja. Dostanie niez�e baty, je�li z�api� go na gor�cym uczynku.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_03");	//Zastanawia�em si�, dlaczego �aden z paladyn�w nigdy nic nie zauwa�y�?
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_04");	//No? Dlaczego?
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_05");	//Czy to nie oczywiste? Ci durnie nie potrafi� odr�ni� nas od stra�nik�w. Dla nich wygl�damy tak samo.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_06");	//Dobra robota, kolego.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_07");	//Daj mi zna�, je�li mog� ci w czym� pom�c.
	MIS_ADDON_MARTIN_GETRANGAR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MARTIN_GOTRANGAR_REPORT);
};


instance DIA_ADDON_MARTIN_GETMILIZ(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_getmiliz_condition;
	information = dia_addon_martin_getmiliz_info;
	description = "Wiesz, czego chc�.";
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
	AI_Output(other,self,"DIA_Addon_Martin_GetMiliz_15_00");	//Wiesz, czego chc�.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_01");	//Tak, oczywi�cie. Chcia�e� wst�pi� do stra�y, prawda?
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_02");	//Ju� zademonstrowa�e� wyj�tkowe zdolno�ci.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_03");	//No dobra, ujm� to inaczej � wola�bym mie� ci� po naszej stronie.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_04");	//Dlatego ci pomagam. We� ten list polecaj�cy i poka� go Andre, naszemu g��wnodowodz�cemu paladynowi.
	CreateInvItems(self,itwr_martin_milizempfehlung_addon,1);
	b_giveinvitems(self,other,itwr_martin_milizempfehlung_addon,1);
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_05");	//Znajdziesz go w koszarach. Jestem pewien, �e znajdzie zaj�cie dla kogo� takiego jak ty.
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Martin da� mi list polecaj�cy do g��wnodowodz�cego paladyna, Andre, dzi�ki czemu zostan� przyj�ty do stra�y. Andre mo�na znale�� w koszarach.");
};

