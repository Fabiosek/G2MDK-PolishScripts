
instance DIA_ADDON_ALLIGATORJACK_EXIT(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 999;
	condition = dia_addon_alligatorjack_exit_condition;
	information = dia_addon_alligatorjack_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_alligatorjack_exit_condition()
{
	return TRUE;
};


var int dia_addon_alligatorjack_exit_info_onetime;

func void dia_addon_alligatorjack_exit_info()
{
	if((MIS_KROKOJAGD == LOG_SUCCESS) && (dia_addon_alligatorjack_exit_info_onetime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_00");	//Jeœli bêdziesz mnie szukaæ, to najprawdopodobniej bêdê siedzia³ gdzieœ w pobli¿u palisady.
		if(pir_1354_addon_henry.aivar[AIV_TALKEDTOPLAYER] == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_AlligatorJack_Exit_15_01");	//Palisady?
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_02");	//PrzejdŸ siê na zachód, a zobaczysz, o co mi chodzi.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		dia_addon_alligatorjack_exit_info_onetime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ALLIGATORJACK_PICKPOCKET(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 900;
	condition = dia_addon_alligatorjack_pickpocket_condition;
	information = dia_addon_alligatorjack_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_alligatorjack_pickpocket_condition()
{
	return c_beklauen(100,333);
};

func void dia_addon_alligatorjack_pickpocket_info()
{
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
	Info_AddChoice(dia_addon_alligatorjack_pickpocket,DIALOG_BACK,dia_addon_alligatorjack_pickpocket_back);
	Info_AddChoice(dia_addon_alligatorjack_pickpocket,DIALOG_PICKPOCKET,dia_addon_alligatorjack_pickpocket_doit);
};

func void dia_addon_alligatorjack_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
};

func void dia_addon_alligatorjack_pickpocket_back()
{
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
};


instance DIA_ADDON_ALLIGATORJACK_HELLO(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_hello_condition;
	information = dia_addon_alligatorjack_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_hello_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_hello_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_00");	//A kim ty w³aœciwie jesteœ? Ró¿nisz siê od pozosta³ych.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Hello_15_01");	//Jakich pozosta³ych?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_02");	//Mia³em na myœli wszystkich magów ganiaj¹cych po ruinach jak kot z pêcherzem.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_03");	//Jesteœ z nimi?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_04");	//Samotne szwendanie siê po tej okolicy to kiepski pomys³.
};


instance DIA_ADDON_ALLIGATORJACK_WERBISTDU(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_werbistdu_condition;
	information = dia_addon_alligatorjack_werbistdu_info;
	description = "Kim jesteœ?";
};


func int dia_addon_alligatorjack_werbistdu_condition()
{
	return TRUE;
};

func void dia_addon_alligatorjack_werbistdu_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WerBistDu_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_01");	//Na pewno o mnie s³ysza³eœ.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_02");	//Jestem Jack Aligator.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_03");	//Boj¹ siê mnie prawie wszyscy! Jesteœmy najstraszliwszymi piratami p³ywaj¹cymi po tych wodach.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_04");	//Pod wodz¹ kapitana Grega z³upiliœmy wiêcej statków kupieckich, ni¿ jestem w stanie zliczyæ.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_05");	//Rozmawiasz z ¿yw¹ legend¹, ¿e siê tak wyra¿ê.
};


instance DIA_ADDON_ALLIGATORJACK_VORSCHLAG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_vorschlag_condition;
	information = dia_addon_alligatorjack_vorschlag_info;
	description = "Znasz niejakiego Kruka?";
};


func int dia_addon_alligatorjack_vorschlag_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_vorschlag_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_15_00");	//Znasz niejakiego Kruka?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_01");	//Oczywiœcie. To herszt bandytów ze wschodu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_02");	//A czego od niego chcesz?
	b_logentry(TOPIC_ADDON_RAVENKDW,"Kruk i jego bandyci zaszyli siê we wschodniej czêœci doliny.");
	Info_ClearChoices(dia_addon_alligatorjack_vorschlag);
	Info_AddChoice(dia_addon_alligatorjack_vorschlag,"Chcê siê do niego przy³¹czyæ.",dia_addon_alligatorjack_vorschlag_join);
	Info_AddChoice(dia_addon_alligatorjack_vorschlag,"Muszê go zabiæ.",dia_addon_alligatorjack_vorschlag_tot);
};

func void b_alligatorjack_besser()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_00");	//Mam lepszy pomys³.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_01");	//Do³¹cz do nas.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_02");	//Razem wszystko obgadamy.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_03");	//A kiedy skosztujesz naszego rumu, œwiat od razu wyda ci siê piêkniejszy.
	Info_ClearChoices(dia_addon_alligatorjack_vorschlag);
};

func void dia_addon_alligatorjack_vorschlag_tot()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_tot_15_00");	//Muszê go zabiæ.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_01");	//Co ty? Myœlisz, ¿e da siê dopaœæ pierwszemu lepszemu awanturnikowi?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_02");	//Nie s¹dzisz, ¿e to zadanie ciê przerasta?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_03");	//Nawet go nie zobaczysz. Jego siepacze roznios¹ ciê na strzêpy, jeœli tylko zbli¿ysz siê do ich obozu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_04");	//Bêdzie dobrze, jeœli przejdziesz choæby przez jeden posterunek.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_05");	//Tak wygl¹dasz, ¿e bandyci najpewniej naszpikuj¹ ciê strza³ami, jak tylko ciê zobacz¹.
	b_alligatorjack_besser();
};

func void dia_addon_alligatorjack_vorschlag_join()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_join_15_00");	//Chcê siê do niego przy³¹czyæ.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_01");	//Serio?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_02");	//Nie wygl¹dasz na kogoœ, kto chcia³by zadawaæ siê z tymi szaleñcami.
	b_alligatorjack_besser();
};


instance DIA_ADDON_ALLIGATORJACK_BDTRUESTUNG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_bdtruestung_condition;
	information = dia_addon_alligatorjack_bdtruestung_info;
	description = "Potrzebny mi pancerz bandytów.";
};


func int dia_addon_alligatorjack_bdtruestung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_vorschlag) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_bdtruestung_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_15_00");	//Potrzebny mi pancerz bandytów.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_01");	//A na co ci on?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_02");	//Tylko napytasz sobie biedy, jeœli ktoœ ciê w nim zobaczy.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_03");	//Ka¿dy pomyœli, ¿e jesteœ bandyt¹, i bêdzie próbowa³ ciê zabiæ.
	Info_ClearChoices(dia_addon_alligatorjack_bdtruestung);
	Info_AddChoice(dia_addon_alligatorjack_bdtruestung,"Wiesz mo¿e, gdzie znaleŸæ taki pancerz?",dia_addon_alligatorjack_bdtruestung_wo);
	Info_AddChoice(dia_addon_alligatorjack_bdtruestung,"Brzmi nieŸle.",dia_addon_alligatorjack_bdtruestung_gut);
};

func void dia_addon_alligatorjack_bdtruestung_gut()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00");	//Brzmi nieŸle.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01");	//Chyba dla kogoœ, komu ¿ycie siê ju¿ znudzi³o.
};

func void dia_addon_alligatorjack_bdtruestung_wo()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00");	//Wiesz mo¿e, gdzie znaleŸæ taki pancerz?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01");	//Mieliœmy jeden w obozie piratów.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03");	//Ale nie wiem, czy wci¹¿ tam jest.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Piraci mieli kiedyœ zbrojê bandytów, ale Jack Aligator nie wie, co siê z ni¹ sta³o.");
	Info_ClearChoices(dia_addon_alligatorjack_bdtruestung);
};


instance DIA_ADDON_ALLIGATORJACK_GREG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_greg_condition;
	information = dia_addon_alligatorjack_greg_info;
	description = "Wasz kapitan ma na imiê Greg?";
};


func int dia_addon_alligatorjack_greg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_greg_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_00");	//Wasz kapitan ma na imiê Greg?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_01");	//Tak. To najwiêkszy pirat, jakiego kiedykolwiek spotka³em.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_02");	//Myœlê, ¿e go znam. Spotka³em siê z nim w Khorinis.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_03");	//Greg? W Khorinis? Niemo¿liwe...
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_04");	//Nasz kapitan wyp³yn¹³ na morze z czêœci¹ ch³opaków.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_05");	//Jeœli Greg kiedykolwiek przybêdzie do Khorinis, to tylko jako wiêzieñ na królewskiej galerze.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_06");	//Jest przecie¿ jednym z najbardziej poszukiwanych ludzi!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_07");	//Na pewno nie poszed³by do miasta z w³asnej woli. Zosta³by od razu pojmany przez królewsk¹ stra¿ i wtr¹cony do lochu.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_08");	//Jeœli tak mówisz...
};


instance DIA_ADDON_ALLIGATORJACK_PIRLAGER(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_pirlager_condition;
	information = dia_addon_alligatorjack_pirlager_info;
	description = "Gdzie znajduje siê wasz obóz?";
};


func int dia_addon_alligatorjack_pirlager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_pirlager_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_00");	//Gdzie znajduje siê wasz obóz?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_01");	//Widzisz ten tunel? Jeœli przejdziesz nim spory kawa³ek na zachód, prêdzej czy póŸniej trafisz na nasz¹ pla¿ê.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_02");	//Tam znajdziesz nasz obóz.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_03");	//Mogê pokazaæ ci drogê, jeœli chcesz. Chocia¿ bêdê ciê musia³ poprosiæ o ma³¹ przys³ugê.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_04");	//Co masz na myœli?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_05");	//Zanim wrócê do obozu, przyda³oby mi siê trochê miêsa dla ch³opaków.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_06");	//Wygl¹dasz na silnego.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_07");	//Mo¿e przydasz mi siê na polowaniu. To co, zainteresowany?
	Log_CreateTopic(TOPIC_ADDON_RATHUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RATHUNT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RATHUNT,"Jackowi Aligatorowi przyda³aby siê pomoc przy polowaniu.");
};


instance DIA_ADDON_ALLIGATORJACK_WASJAGEN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_wasjagen_condition;
	information = dia_addon_alligatorjack_wasjagen_info;
	description = "Na co polujesz?";
};


func int dia_addon_alligatorjack_wasjagen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_pirlager))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_wasjagen_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_00");	//Na co polujesz?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_01");	//Zwykle na aligatory, ale ich miêso jest raczej niejadalne.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_02");	//No i dawno ich tu nie widzia³em.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_03");	//Musi mi wiêc wystarczyæ to, co znajdê. Na przyk³ad bagienne szczury.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_04");	//Co takiego?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_05");	//Wiêkszoœæ bagiennych istot œmierdzi jak stary but i ma miêso twarde jak jego podeszwa.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_06");	//Bagienne szczury s¹ przynajmniej jadalne.
	b_logentry(TOPIC_ADDON_RATHUNT,"Jedyne po¿ywienie tutaj to bagienne szczury.");
};


instance DIA_ADDON_ALLIGATORJACK_PIRATES(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_pirates_condition;
	information = dia_addon_alligatorjack_pirates_info;
	permanent = FALSE;
	description = "Opowiedz mi o piratach.";
};


func int dia_addon_alligatorjack_pirates_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_pirlager))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_pirates_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Pirates_15_00");	//Opowiedz mi o piratach.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_01");	//Mieszkamy tu od lat. Przed wojn¹ byliœmy znani w tych okolicach i na kontynencie.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_02");	//Wystarczy³o wywiesiæ flagê, ¿eby kupcy natychmiast siê poddawali.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_03");	//Niestety, te czasy ju¿ minê³y. Od miesiêcy nie mieliœmy okazji napaœæ ¿adnego statku.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_04");	//Nasz kapitan w³aœnie wzi¹³ czêœæ ch³opaków i wyp³yn¹³, ¿eby przechwyciæ jakiœ towar.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_05");	//A reszta siedzi w obozie, wygrzewa siê na s³oñcu i czeka na powrót kapitana.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_06");	//Miejmy nadziejê, ¿e Greg wróci z porz¹dnym ³upem.
};


instance DIA_ADDON_ALLIGATORJACK_LETSGOHUNTING(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_letsgohunting_condition;
	information = dia_addon_alligatorjack_letsgohunting_info;
	permanent = TRUE;
	description = "ChodŸmy zapolowaæ.";
};


func int dia_addon_alligatorjack_letsgohunting_condition()
{
	if((MIS_KROKOJAGD == FALSE) && Npc_KnowsInfo(other,dia_addon_alligatorjack_wasjagen) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_letsgohunting_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00");	//ChodŸmy zapolowaæ.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01");	//Dobrze. Dla nas dwóch to betka.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02");	//Jesteœ gotowy?
	Info_ClearChoices(dia_addon_alligatorjack_letsgohunting);
	Info_AddChoice(dia_addon_alligatorjack_letsgohunting,"Jeszcze nie.",dia_addon_alligatorjack_letsgohunting_no);
	Info_AddChoice(dia_addon_alligatorjack_letsgohunting,"Tak.",dia_addon_alligatorjack_letsgohunting_yes);
};


const int ALLIGATORJACK_INTER1 = 1;
const int ALLIGATORJACK_KESSEL = 2;
const int ALLIGATORJACK_INTER2 = 3;
const int ALLIGATORJACK_CANYON = 4;

func void dia_addon_alligatorjack_letsgohunting_yes()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00");	//Tak.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01");	//Dobrze. Trzymaj siê blisko mnie.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"HUNT1");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_INTER1;
	MIS_KROKOJAGD = LOG_RUNNING;
};

func void dia_addon_alligatorjack_letsgohunting_no()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00");	//Jeszcze nie.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01");	//Wiêc pospiesz siê.
	Info_ClearChoices(dia_addon_alligatorjack_letsgohunting);
};


instance DIA_ADDON_ALLIGATORJACK_ALLIGATORJACKINTER1(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_alligatorjackinter1_condition;
	information = dia_addon_alligatorjack_alligatorjackinter1_info;
	important = TRUE;
};


func int dia_addon_alligatorjack_alligatorjackinter1_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_INTER1) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_alligatorjackinter1_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00");	//Kotlina.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01");	//To tutaj zaczniemy szukaæ tych bestii.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02");	//ChodŸ za mn¹.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT2");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_KESSEL;
};


instance DIA_ADDON_ALLIGATORJACK_THEHUNT(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_thehunt_condition;
	information = dia_addon_alligatorjack_thehunt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_thehunt_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_KESSEL) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_thehunt_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_00");	//Tego w³aœnie siê obawia³em.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_15_01");	//Czego?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_02");	//Nie wystarczy nam tego miêsa.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_03");	//Musimy iœæ do kanionu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_04");	//Uwa¿aj. Im dalej, tym bardziej niebezpiecznie.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_05");	//Jeœli cenisz swoje ¿ycie, trzymaj siê mnie.
	Wld_InsertNpc(waran,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(waran,"ADW_ENTRANCE_2_VALLEY_10");
	Info_ClearChoices(dia_addon_alligatorjack_thehunt);
	Info_AddChoice(dia_addon_alligatorjack_thehunt,"Co takiego ¿yje w kanionie?",dia_addon_alligatorjack_thehunt_enough);
	Info_AddChoice(dia_addon_alligatorjack_thehunt,"Dobrze, chodŸmy.",dia_addon_alligatorjack_thehunt_running);
};

func void dia_addon_alligatorjack_thehunt_enough()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00");	//Co takiego ¿yje w kanionie?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01");	//Nie chodzimy tam, jeœli nie musimy.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02");	//Siedz¹ tam brzytwiaki, a one potrafi¹ byæ cholernie twarde. Unikaj ich, jeœli ci ¿ycie mi³e.
};

func void dia_addon_alligatorjack_thehunt_running()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00");	//Dobrze, chodŸmy.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01");	//W porz¹dku.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT3");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_INTER2;
};


instance DIA_ADDON_ALLIGATORJACK_ALLIGATORJACKINTER2(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_alligatorjackinter2_condition;
	information = dia_addon_alligatorjack_alligatorjackinter2_info;
	important = TRUE;
};


func int dia_addon_alligatorjack_alligatorjackinter2_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_INTER2) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_alligatorjackinter2_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00");	//ChodŸ.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT4");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_CANYON;
};


instance DIA_ADDON_ALLIGATORJACK_HUNTEND(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_huntend_condition;
	information = dia_addon_alligatorjack_huntend_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_huntend_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_CANYON) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_huntend_info()
{
	if(ALLIGATORJACK_KROKOSKILLED == 0)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00");	//Powiedz mi, po co ja w ogóle ciê zabra³em?
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01");	//Nie upolowa³eœ ani jednego szczura.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02");	//Mo¿e potrafisz robiæ coœ innego.
	}
	else if(ALLIGATORJACK_KROKOSKILLED == 1)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03");	//Doskonale! Takich ludzi nam potrzeba.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04");	//Pierwsze polowanie i ju¿ z³apa³eœ jednego. NieŸle, nieŸle...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05");	//Masz dryg do polowania, nie ma co.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06");	//A niech mnie! Jeœli tak dalej pójdzie, to nie bêdê mia³ co robiæ na polowaniach.
	};
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_07");	//WeŸ szczura i zanieœ go temu leniowi Morganowi.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_08");	//Znajdziesz go w obozie.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_09");	//Pewnie bêdzie siê wygrzewa³ na pla¿y, czekaj¹c na ciebie.
	if(pir_1354_addon_henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_10");	//Przy wejœciu spotkasz Henry'ego, który pilnuje, ¿eby nie podkradli siê tu bandyci.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_11");	//Powiedz mu, ¿e to ja ciê przys³a³em.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_12");	//Powinien ciê wpuœciæ.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_13");	//Henry jest przewra¿liwiony, a przy tym lubi zgrywaæ wa¿niaka.
	};
	MIS_ALLIGATORJACK_BRINGMEAT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_BRINGMEAT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BRINGMEAT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BRINGMEAT,"Jack Aligator da³ mi 10 kawa³ków miêsa. Mam je zanieœæ Morganowi.");
	b_logentry(TOPIC_ADDON_RATHUNT,"Polowanie by³o udane. Zabiliœmy kilka bagiennych szczurów.");
	b_giveinvitems(self,other,itfomuttonraw,10);
	MIS_KROKOJAGD = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_KROKOJAGD);
};


instance DIA_ADDON_ALLIGATORJACK_ANGUS(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_angus_condition;
	information = dia_addon_alligatorjack_angus_info;
	permanent = FALSE;
	description = "Znasz mo¿e Angusa i jego kumpla, Hanka?";
};


func int dia_addon_alligatorjack_angus_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_angusnhank) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_angus_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_00");	//Znasz mo¿e Angusa i jego kumpla, Hanka?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_03");	//Nie widzia³em ich od jakiegoœ czasu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_04");	//W sumie nie mia³bym nic przeciwko temu, ¿eby przepadli na dobre.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_05");	//Dlaczego?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_06");	//Ci obwiesie krêc¹ siê zwykle w pobli¿u jeziora, skutecznie odstraszaj¹c zwierzynê.
};


instance DIA_ADDON_ALLIGATORJACK_LAKE(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_lake_condition;
	information = dia_addon_alligatorjack_lake_info;
	permanent = FALSE;
	description = "A jak myœlisz, nad którym jeziorem przebywaj¹ najczêœciej?";
};


func int dia_addon_alligatorjack_lake_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_alligatorjack_angus) == TRUE) && (MIS_ADDON_MORGAN_SEEKTRAITOR != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_lake_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_00");	//A jak myœlisz, nad którym jeziorem przebywaj¹ najczêœciej?
	if(MIS_KROKOJAGD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_01");	//Pamiêtasz nasze polowanie?
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_02");	//Tak.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_03");	//Chyba w kotlinie... Tam ich widywa³em najczêœciej.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_04");	//Nad jeziorem w kotlinie.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_05");	//Na wschód od naszego obozu. Nie sposób nie trafiæ.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_06");	//Wpada do niego kilka ma³ych wodospadów.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_07");	//Tylko uwa¿aj. Kiedy zejdziesz na ca³kowicie piaszczysty teren, to znaczy, ¿e Ÿle skrêci³eœ i wszed³eœ do kanionu.
	};
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Jaskinia zapewne znajduje siê w kotlinie na wschód od obozu, tu¿ przy jeziorze.");
};


instance DIA_ADDON_ALLIGATORJACK_CANLEARN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_canlearn_condition;
	information = dia_addon_alligatorjack_canlearn_info;
	permanent = TRUE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_addon_alligatorjack_canlearn_condition()
{
	if(ALLIGATORJACK_ADDON_TEACHPLAYER == FALSE)
	{
		if((Npc_KnowsInfo(other,dia_addon_alligatorjack_huntend) == TRUE) || (GREGISBACK == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_alligatorjack_canlearn_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_CanLearn_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	if(MIS_KROKOJAGD > LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_01");	//Pewnie. Jestem dobrym myœliwym i mogê ci powiedzieæ, jak najlepiej œcigaæ zwierzynê i pozyskiwaæ k³y.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_02");	//Wystarczy, ¿e zapytasz.
		Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_PIR_TEACHER,"Jack Aligator mo¿e pokazaæ mi, jak obdzieraæ zwierzêta ze skór i jak wyci¹gaæ ich zêby. Mo¿e te¿ nauczyæ mnie strzelania z ³uku.");
		ALLIGATORJACK_ADDON_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_03");	//Najpierw musisz jednak pokazaæ, ¿e wiesz cokolwiek o polowaniu.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_04");	// Jeœli pójdziesz ze mn¹ na polowanie, mogê ciê tego nauczyæ.
	};
};

func void b_aj_teach()
{
	Info_ClearChoices(dia_addon_alligatorjack_teach);
	Info_AddChoice(dia_addon_alligatorjack_teach,DIALOG_BACK,dia_addon_alligatorjack_teach_back);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_addon_alligatorjack_teach_bow_5);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_addon_alligatorjack_teach_bow_1);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring("Skórowanie zwierz¹t",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_REPTILESKIN)),dia_addon_alligatorjack_teach_fur);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring("Wyci¹ganie zêbów",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_addon_alligatorjack_teach_teeth);
};


instance DIA_ADDON_ALLIGATORJACK_TEACH(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_teach_condition;
	information = dia_addon_alligatorjack_teach_info;
	permanent = TRUE;
	description = "Naucz mnie.";
};


func int dia_addon_alligatorjack_teach_condition()
{
	if(ALLIGATORJACK_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_teach_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Teach_15_00");	//Naucz mnie.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_12_01");	//Czego chcesz siê dowiedzieæ?
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_back()
{
	Info_ClearChoices(dia_addon_alligatorjack_teach);
};

func void dia_addon_alligatorjack_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,75);
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,75);
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_fur()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_REPTILESKIN] == FALSE)
	{
		if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_REPTILESKIN))
		{
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_Fur_12_00");	//Zawsze rozcinaj skórê wzd³u¿ brzucha, inaczej nie bêdzie siê do niczego nadawaæ.
		};
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_teeth()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH);
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
	b_aj_teach();
};

func void b_allijack_alliklar()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Anheuern_12_01");	//Rozumiem.
};


instance DIA_ADDON_ALLIGATORJACK_ANHEUERN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 11;
	condition = dia_addon_alligatorjack_anheuern_condition;
	information = dia_addon_alligatorjack_anheuern_info;
	permanent = FALSE;
	description = "ChodŸmy na polowanie.";
};


func int dia_addon_alligatorjack_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Anheuern_15_00");	//ChodŸmy na polowanie.
	b_allijack_alliklar();
	AI_StopProcessInfos(self);
	b_addon_piratesfollowagain();
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_ALLIGATORJACK_COMEON(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 12;
	condition = dia_addon_alligatorjack_comeon_condition;
	information = dia_addon_alligatorjack_comeon_info;
	permanent = TRUE;
	description = "ChodŸ ze mn¹.";
};


func int dia_addon_alligatorjack_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_alligatorjack_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_KommMit_15_00");	//ChodŸ ze mn¹.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		b_allijack_alliklar();
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_ALLIGATORJACK_GOHOME(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 13;
	condition = dia_addon_alligatorjack_gohome_condition;
	information = dia_addon_alligatorjack_gohome_info;
	permanent = TRUE;
	description = "Nie potrzebujê ju¿ twojej pomocy.";
};


func int dia_addon_alligatorjack_gohome_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_DontNeedYou_15_00");	//Nie potrzebujê ju¿ twojej pomocy.
	b_allijack_alliklar();
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_ALLIGATORJACK_TOOFAR(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 14;
	condition = dia_addon_alligatorjack_toofar_condition;
	information = dia_addon_alligatorjack_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_alligatorjack_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_toofar_info()
{
	b_say(self,other,"$RUNAWAY");
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

