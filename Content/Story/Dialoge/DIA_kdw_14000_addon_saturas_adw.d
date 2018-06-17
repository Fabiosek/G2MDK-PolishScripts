
instance DIA_ADDON_SATURAS_ADW_EXIT(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 999;
	condition = dia_addon_saturas_adw_exit_condition;
	information = dia_addon_saturas_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_saturas_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_saturas_adw_exit_info()
{
	AI_StopProcessInfos(self);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXIT_14_00");	//Niech ciê chroni Adanos.
};


instance DIA_ADDON_SATURAS_ADWSTART(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 1;
	condition = dia_addon_saturas_adwstart_condition;
	information = dia_addon_saturas_adwstart_info;
	important = TRUE;
};


func int dia_addon_saturas_adwstart_condition()
{
	return TRUE;
};

func void dia_addon_saturas_adwstart_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_00");	//Dziêki Adanosowi. Nareszcie jesteœ. Myœleliœmy, ¿e ju¿ siê nie poka¿esz.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_01");	//Co? Sk¹d siê tu wziêliœcie?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_02");	//Przeszed³eœ przez portal, a my za tob¹. Wkrótce potem przybyliœmy tutaj.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_03");	//Jesteœmy tu ju¿ od kilku dni.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_04");	//KILKU DNI?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_05");	//Kiedy nie mogliœmy ciê nigdzie znaleŸæ, Nefarius próbowa³ ustaliæ, co siê mog³o staæ. Bez rezultatów.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_06");	//No dobrze. W koñcu jesteœ i mo¿esz rozpocz¹æ pracê.
	Wld_InsertNpc(giant_rat,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(giant_rat,"ADW_PORTALTEMPEL_11");
	Info_ClearChoices(dia_addon_saturas_adwstart);
	Info_AddChoice(dia_addon_saturas_adwstart,"Co dzia³o siê w miêdzyczasie?",dia_addon_saturas_adwstart_was);
};

func void dia_addon_saturas_adwstart_was()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_was_15_00");	//Co dzia³o siê w miêdzyczasie?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_01");	//Doszliœmy do wielu wniosków.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_02");	//Trzêsienia ziemi s¹ coraz silniejsze. Znajdujemy siê blisko epicentrum.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_03");	//Twórcy tych starych budowli za³o¿yli tu kiedyœ miasto, które uda³o nam siê odkryæ.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_04");	//Jednak z jakiegoœ powodu ich cywilizacja zosta³a zniszczona.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_05");	//Mo¿emy siê jedynie domyœlaæ dlaczego.
	Info_AddChoice(dia_addon_saturas_adwstart,"Odkry³eœ jakieœ œlady zaginionych ludzi?",dia_addon_saturas_adwstart_missingpeople);
	Info_AddChoice(dia_addon_saturas_adwstart,"Co siê dzieje z Krukiem?",dia_addon_saturas_adwstart_raven);
};

func void dia_addon_saturas_adwstart_raven()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_Raven_15_00");	//Co siê dzieje z Krukiem?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_01");	//W liœcie Kruk pisa³ o œwi¹tyni i o tym, ¿e spróbuje dostaæ siê do œrodka.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_02");	//Jesteœmy pewni, ¿e chodzi o œwi¹tyniê Adanosa, któr¹ Kruk bêdzie próbowa³ zbezczeœciæ.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_03");	//Trzêsienia ziemi s¹ bez w¹tpienia wynikiem rzucania bezbo¿nych czarów, maj¹cych prze³amaæ potê¿ne zaklêcie.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_04");	//Bramy œwi¹tyni s¹ zamkniête magi¹, a to zaklêcie o¿ywia kamiennych stra¿ników.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_05");	//Œwi¹tynia siê broni. Musimy powstrzymaæ Kruka, zanim dostanie siê do sanktuarium.
	Info_AddChoice(dia_addon_saturas_adwstart,"Co zrobimy póŸniej?",dia_addon_saturas_adwstart_wastun);
	Info_AddChoice(dia_addon_saturas_adwstart,"Kruk jest by³ym magnatem, a nie magiem. ",dia_addon_saturas_adwstart_ravenonlybaron);
	Info_AddChoice(dia_addon_saturas_adwstart,"Co Kruk chce zrobiæ w œwi¹tyni?",dia_addon_saturas_adwstart_ravenaim);
};

func void dia_addon_saturas_adwstart_ravenaim()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenAim_15_00");	//Co Kruk chce zrobiæ w œwi¹tyni?
	AI_Output(self,other,"DIA_Addon_Bodo_14_01");	//Wiemy tylko, ¿e chodzi mu o potê¿ny artefakt, zwi¹zany z Adanosem i Beliarem.
	AI_Output(self,other,"DIA_Addon_Bodo_14_02");	//Na pewno nie ma dobrych zamiarów...
};

func void dia_addon_saturas_adwstart_ravenonlybaron()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00");	//Kruk jest by³ym magnatem, a nie magiem. Jak móg³by przygotowaæ taki czar?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01");	//Mo¿e to nie on. Mo¿e jakiœ mag renegat, który wype³nia jego rozkazy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02");	//Tak czy inaczej, MUSIMY zapobiec z³u.
};

func void dia_addon_saturas_adwstart_missingpeople()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_missingPeople_15_00");	//Odkry³eœ jakieœ œlady zaginionych ludzi?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_01");	//Zaledwie wczoraj, w ruinach na wschodzie, znaleŸliœmy zw³oki rybaka.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_02");	//Wygl¹da na to, ¿e pochodzi³ z Khorinis. Powinieneœ zobaczyæ cia³o.
	SATURAS_ABOUTWILLIAM = TRUE;
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMLEICHE);
};

func void dia_addon_saturas_adwstart_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun_15_00");	//Co zrobimy póŸniej?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_01");	//Zostaniemy tutaj i bêdziemy dalej badali tê pradawn¹ cywilizacjê.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_02");	//Stare zwoje budowniczych zawieraj¹ mnóstwo tajemnic, które musimy odkryæ – jeœli chcemy zrozumieæ, co sta³o siê w przesz³oœci.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_03");	//A teraz musisz coœ dla nas zrobiæ...
	Info_AddChoice(dia_addon_saturas_adwstart,"O co chodzi?",dia_addon_saturas_adwstart_wastun2);
};

func void dia_addon_saturas_adwstart_wastun2()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_00");	//O co chodzi?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_01");	//Musisz znaleŸæ Kruka i powstrzymaæ go przed bezczeszczeniem œwi¹tyni Adanosa.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_02");	//Mam go zabiæ?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_03");	//Jeœli to jedyny sposób, by go powstrzymaæ, to... TAK! W imiê Adanosa!
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_04");	//Zbierz wszystkie zapiski i relikty budowniczych, które zdo³asz znaleŸæ, i przynieœ je do nas.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_05");	//Musimy dowiedzieæ siê wiêcej na temat tych ludzi i tego, co ich spotka³o.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_06");	//Kiedy przejrzymy zamiary Kruka, bêdziemy mogli mu przeszkodziæ.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_07");	//Musisz te¿ znaleŸæ sposób na uwolnienie niewolników.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_08");	//To wszystko? Zrobiê to z zamkniêtymi oczami.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_09");	//Wiem, ¿e to nie³atwe zadanie. Zrozum, to twoja szansa na odzyskanie mojego zaufania.
	MIS_ADDON_SATURAS_GOTORAVEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RAVENKDW,"Kruk bezczeœci œwi¹tyniê Adanosa. Muszê go powstrzymaæ, nawet jeœli oznacza to jego zabicie.");
	Log_CreateTopic(TOPIC_ADDON_SKLAVEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKLAVEN,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_SKLAVEN,"Saturas chce, ¿ebym uwolni³ niewolników.");
	Log_CreateTopic(TOPIC_ADDON_RELICTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RELICTS,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_RELICTS,"Saturas chce, ¿ebym przyniós³ mu ka¿d¹ rzecz, która pozwoli mu poznaæ bli¿ej prastar¹ kulturê budowniczych.");
	Info_AddChoice(dia_addon_saturas_adwstart,"W takim razie ruszam w drogê.",dia_addon_saturas_adwstart_back);
};

func void dia_addon_saturas_adwstart_back()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_back_15_00");	//W takim razie ruszam w drogê.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_01");	//Jeszcze jedno... Krukowi towarzyszy wielu bandytów.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_02");	//Podczas twojej nieobecnoœci przyjêliœmy kolejnego cz³onka Wodnego Krêgu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_03");	//Wys³aliœmy go na bagna. Nie wróci³.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_04");	//S¹dzimy, ¿e bandyci atakuj¹ ka¿dego, kto nie wygl¹da jak oni.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_05");	//Za³atw sobie ich zbrojê.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_06");	//Bêdziesz móg³ podejœæ bli¿ej ich obozu, nie ryzykuj¹c, ¿e ciê zaatakuj¹.
	Log_CreateTopic(TOPIC_ADDON_BDTRUESTUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BDTRUESTUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Bandyci strzelaj¹ do wszystkich, którzy nie wygl¹daj¹ jak oni. Bêdê potrzebowaæ zbroi bandytów, jeœli chcê siê do nich zbli¿yæ.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ADDON_SATURAS_POORRANGER(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_poorranger_condition;
	information = dia_addon_saturas_poorranger_info;
	description = "Którego to nieszczêœnika wys³a³eœ na bagna?";
};


func int dia_addon_saturas_poorranger_condition()
{
	return TRUE;
};

func void dia_addon_saturas_poorranger_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PoorRanger_15_00");	//Którego to nieszczêœnika wys³a³eœ na bagna?
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_01");	//Nazywa³ siê Lance.
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_02");	//Chyba nie zaszed³ daleko.
	Log_CreateTopic(TOPIC_ADDON_LANCE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LANCE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_LANCE,"Saturas wys³a³ na bagna cz³owieka imieniem Lance. Boi siê jednak, ¿e nie zaszed³ daleko.");
};


instance DIA_ADDON_SATURAS_PIRATEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_piraten_condition;
	information = dia_addon_saturas_piraten_info;
	description = "Gdzie znajdê pasuj¹c¹ na mnie zbrojê bandytów?";
};


func int dia_addon_saturas_piraten_condition()
{
	if((alligatorjack.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (greg.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_piraten_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Piraten_15_00");	//Gdzie znajdê pasuj¹c¹ na mnie zbrojê bandytów?
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_01");	//Na zachodzie jest obóz piratów.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_02");	//Z tego, co wiem, utrzymuj¹ kontakty z bandytami.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_03");	//Nie s¹dzê, ¿eby ciê zaatakowali.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_04");	//Mo¿e uda ci siê znaleŸæ u nich jak¹œ pomoc...
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Saturas uwa¿a, ¿e piraci mog¹ pomóc mi zdobyæ zbrojê bandytów.");
};


instance DIA_ADDON_SATURAS_LANCELEICHE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_lanceleiche_condition;
	information = dia_addon_saturas_lanceleiche_info;
	description = "Znalaz³em cia³o Lance'a.";
};


func int dia_addon_saturas_lanceleiche_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_poorranger) && (Npc_HasItems(none_addon_114_lance_adw,itri_lancering) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_lanceleiche_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceLeiche_15_00");	//Znalaz³em cia³o Lance'a.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_01");	//Oby jego dusza dost¹pi³a królestwa Adanosa.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_02");	//Uwa¿aj na siebie, synu. Nie chcê op³akiwaæ kolejnej straty.
	TOPIC_END_LANCE = TRUE;
	b_giveplayerxp(XP_ADDON_LANCELEICHE);
};


instance DIA_ADDON_SATURAS_LANCERING(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_lancering_condition;
	information = dia_addon_saturas_lancering_info;
	description = "Mam akwamarynowy pierœcieñ Lance'a.";
};


func int dia_addon_saturas_lancering_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_lanceleiche) && Npc_HasItems(other,itri_lancering))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_lancering_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceRing_15_00");	//Mam akwamarynowy pierœcieñ Lance'a.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceRing_14_01");	//Najlepiej oddaj mi go, zanim wpadnie w niepowo³ane rêce.
	b_giveinvitems(other,self,itri_lancering,1);
	b_giveplayerxp(XP_ADDON_LANCERING);
};


instance DIA_ADDON_SATURAS_TOKENS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 10;
	condition = dia_addon_saturas_tokens_condition;
	information = dia_addon_saturas_tokens_info;
	permanent = TRUE;
	description = "Jeœli chodzi o relikty...";
};


func int dia_addon_saturas_tokens_condition()
{
	if(SATURAS_SCBROUGHTALLTOKEN == FALSE)
	{
		return TRUE;
	};
};


var int dia_addon_saturas_tokens_onetime;
var int saturas_scbroughtalltoken;
var int saturas_broughttokenamount;
var int scbroughttoken;
var int saturas_scfound_itmi_addon_stone_01;
var int saturas_scfound_itmi_addon_stone_02;
var int saturas_scfound_itmi_addon_stone_03;
var int saturas_scfound_itmi_addon_stone_04;
var int saturas_scfound_itmi_addon_stone_05;

func void dia_addon_saturas_tokens_info()
{
	var int broughttoken;
	var int xp_broughttokens;
	var int kohle;
	AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_00");	//Jeœli chodzi o relikty...
	if((DIA_ADDON_SATURAS_TOKENS_ONETIME == FALSE) && (c_schasmagicstoneplate() || Npc_HasItems(other,itwr_stoneplatecommon_addon)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_01");	//Wydaje mi siê, ¿e mam tu coœ dla ciebie.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_02");	//Mamy ju¿ podobne kamienne tablice. Te ju¿ nam siê nie przydadz¹.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_03");	//Tam musi byæ coœ wiêcej.
		DIA_ADDON_SATURAS_TOKENS_ONETIME = TRUE;
	};
	broughttoken = 0;
	xp_broughttokens = 0;
	if((Npc_HasItems(other,itmi_addon_stone_01) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_01 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_02) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_03) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_04) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_05) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_05 == FALSE)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_04");	//A to mo¿ecie wykorzystaæ?
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_05");	//Wygl¹da nieŸle. Gdzie to znalaz³eœ?
		b_logentry(TOPIC_ADDON_RELICTS,"Saturas otrzyma³ ode mnie nastêpuj¹ce relikty:");
		if(Npc_HasItems(other,itmi_addon_stone_01) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_01 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_01,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_01 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_06");	//Bandyci u¿ywaj¹ tych tabliczek jako waluty.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_07");	//Na tablicach jest symbol Quarhodrona, wielkiego wojownika i dowódcy.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_08");	//Jego syn – Rademes – doprowadzi³ do zag³ady ca³ego miasta.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_09");	//Phi. Za³o¿ê siê, ¿e bandyci nie maj¹ pojêcia, co wpad³o im w rêce.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Czerwon¹ kamienn¹ tablicê, któr¹ bandyci u¿ywali jako walutê. Jest na niej znak wielkiego wodza Quarhodrona.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_02) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_02,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_02 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_10");	//Tê tabliczkê znalaz³em w budynku na po³udniu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_11");	//Ach! Tablica stra¿ników umar³ych. Przywo³uje duchy zmar³ych.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_12");	//Zwi¹zki pomiêdzy budowniczymi i ich przodkami by³y bardzo silne.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Fioletow¹ kamienn¹ tablicê z posiad³oœci stra¿ników umar³ych na po³udniu.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_03) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_03,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_03 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_13");	//Znalaz³em tê tabliczkê w budynku na po³udniowym zachodzie.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_14");	//Z tego, co na niej napisano, wynika, ¿e by³ to dom kap³anów miasta.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_15");	//Najwy¿szy kap³an nazywa³ siê KHARDIMON. Nie wiemy wiele wiêcej na jego temat.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Niebiesk¹ kamienn¹ tablicê z domostwa kap³anów na po³udniowym zachodzie.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_04) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_04,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_04 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_15");	//Ta tabliczka le¿a³a w budynku niedaleko wielkiego bagna.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_16");	//Na pewno by³ to dom uzdrowicieli.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_17");	//Nie wiemy o nich zbyt wiele. Wygl¹da na to, ¿e zniknêli pierwsi.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Zielon¹ kamienn¹ tablicê z domu uzdrowicieli w po³udniowej czêœci bagna.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_05) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_05 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_05,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_05 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_18");	//Ta czêœæ le¿a³a w wielkim budynku w kanionie.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_19");	//To by³a biblioteka tego pradawnego ludu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_20");	//NajwyraŸniej jest to tablica uczonych.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_80");	//Wiêkszoœæ pism, które znaleŸliœmy, jest autorstwa przywódcy Kasty Uczonych.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_81");	//Co dziwne, nie zostawi³ swojego imienia na ¿adnym z pism...
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- ¯ó³t¹ kamienn¹ tablicê z biblioteki uczonych na pó³nocy.");
		};
		if(SC_KNOWS_WEAPONINADANOSTEMPEL == TRUE)
		{
		};
		xp_broughttokens = XP_ADDON_FORONETOKEN * broughttoken;
		b_giveplayerxp(xp_broughttokens);
		SATURAS_BROUGHTTOKENAMOUNT = SATURAS_BROUGHTTOKENAMOUNT + broughttoken;
		if(SATURAS_BROUGHTTOKENAMOUNT < 5)
		{
			if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_21");	//Bardzo dobrze. Mamy coraz wyraŸniejszy obraz miasta, ale jeszcze nie wiemy wszystkiego.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_22");	//Na tym terenie musi byæ ukrytych piêæ takich kamiennych tablic.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_23");	//ZnajdŸ je i przynieœ do mnie.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_24");	//WeŸ to z³oto jako swe wynagrodzenie.
		kohle = 200 * broughttoken;
		CreateInvItems(self,itmi_gold,kohle);
		b_giveinvitems(self,other,itmi_gold,kohle);
		SCBROUGHTTOKEN = TRUE;
	};
	if(SATURAS_BROUGHTTOKENAMOUNT == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_25");	//Mamy ju¿ wszystkie potrzebne relikty.
		if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_26");	//Odda³eœ nam wielk¹ przys³ugê. Dziêkujemy.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_27");	//To pozwoli nam wykonaæ decyduj¹cy krok w naszych badaniach.
		};
		MIS_SATURAS_LOOKINGFORHOUSESOFRULERS = LOG_SUCCESS;
		SATURAS_SCBROUGHTALLTOKEN = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_28");	//Zobaczymy, co uda mi siê znaleŸæ.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_29");	//Dobrze. Tylko siê poœpiesz. Czas ucieka.
	};
};


instance DIA_ADDON_SATURAS_STONEPLATEHINT(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_stoneplatehint_condition;
	information = dia_addon_saturas_stoneplatehint_info;
	important = TRUE;
};


func int dia_addon_saturas_stoneplatehint_condition()
{
	if(((MERDARION_GOTFOCUSCOUNT >= 2) || (RAVENISINTEMPEL == TRUE)) && (SATURAS_SCBROUGHTALLTOKEN == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_stoneplatehint_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_00");	//Dobrze, ¿e jesteœ. Mamy nowe informacje, które chcemy ci przekazaæ.
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_15_01");	//Zamieniam siê w s³uch.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_02");	//Zaginione miasto nosi³o nazwê Jarkendar. Mia³o 5 w³adców, którzy wspólnie nim rz¹dzili.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_03");	//Ka¿dy z w³adców mia³ posiad³oœæ, w której mieszka³ i gdzie trzyma³ swoje dobra.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_04");	//Wydaje siê konieczne, abyœ w czasie poszukiwañ reliktów tej zaginionej cywilizacji stara³ siê równie¿ odnaleŸæ ich domostwa.
	MIS_SATURAS_LOOKINGFORHOUSESOFRULERS = LOG_RUNNING;
	Info_ClearChoices(dia_addon_saturas_stoneplatehint);
	Info_AddChoice(dia_addon_saturas_stoneplatehint,"A jeœli ¿adna z nich ju¿ nie istnieje?",dia_addon_saturas_stoneplatehint_unter);
	Info_AddChoice(dia_addon_saturas_stoneplatehint,"Gdzie powinienem ich szukaæ?",dia_addon_saturas_stoneplatehint_wo);
};

func void dia_addon_saturas_stoneplatehint_wo()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_wo_15_00");	//Gdzie powinienem ich szukaæ?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_01");	//Riordian prowadzi³ badania nad uk³adem budynków Jarkendaru.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_02");	//Powie ci, gdzie s¹ te posiad³oœci.
	Log_CreateTopic(TOPIC_ADDON_HOUSESOFRULERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOUSESOFRULERS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOUSESOFRULERS,"Saturas chce, ¿ebym poszuka³ czegoœ u¿ytecznego w posiad³oœciach budowniczych. Riordian powie mi, gdzie je znaleŸæ.");
};

func void dia_addon_saturas_stoneplatehint_unter()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_unter_15_00");	//A jeœli ¿adna z tych posiad³oœci ju¿ nie istnieje?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_01");	//Jeœli nie uda ci siê znaleŸæ tych domów, to znaczy, ¿e najprawdopodobniej zosta³y zniszczone w czasie upadku miasta.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_02");	//Ale jeœli wci¹¿ istniej¹, to mog¹ okazaæ siê bezcenne dla naszych badañ.
};


instance DIA_ADDON_SATURAS_SCBROUGHTALLTOKEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_scbroughtalltoken_condition;
	information = dia_addon_saturas_scbroughtalltoken_info;
	description = "Po co potrzebujesz tych piêciu kamiennych tabliczek?";
};


func int dia_addon_saturas_scbroughtalltoken_condition()
{
	if((SCBROUGHTTOKEN == TRUE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_scbroughtalltoken_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_SCBroughtAllToken_15_00");	//Po co potrzebujesz tych piêciu kamiennych tabliczek?
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_01");	//Zapiski, które znaleŸliœmy w ruinach, s¹ niepe³ne.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_02");	//Ale pisma budowniczych wspominaj¹ o piêciu w³adcach rz¹dz¹cych miastem.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_03");	//Ka¿dy z nich mia³ jedn¹ z tablic, symbol swojej w³adzy.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_04");	//S¹dzê, ¿e dziêki tym tablicom znajdziemy odpowiedzi na moje pytania.
};


instance DIA_ADDON_SATURAS_FLUT(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_flut_condition;
	information = dia_addon_saturas_flut_info;
	description = "Nefarius opowiedzia³ mi o potopie...";
};


func int dia_addon_saturas_flut_condition()
{
	if((NEFARIUSADW_TALK2SATURAS == TRUE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_flut_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Flut_15_00");	//Nefarius opowiedzia³ mi o potopie...
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_02");	//Przekazy g³osz¹, ¿e Adanos zst¹pi³ z nieba, aby ukaraæ niewierz¹cych i wygnaæ ich do królestwa umar³ych.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_03");	//W œwiêtym gniewie kaza³ falom morskim zalaæ budowniczych tego miasta i zmyæ ich z powierzchni.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_04");	//Bagno na wschodzie jest pozosta³oœci¹ po tych wydarzeniach.
	TOPIC_END_FLUT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_SATURAS_ADANOSZORN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_adanoszorn_condition;
	information = dia_addon_saturas_adanoszorn_info;
	description = "Dlaczego Adanos tak siê rozgniewa³?";
};


func int dia_addon_saturas_adanoszorn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_flut) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adanoszorn_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_AdanosZorn_15_00");	//Dlaczego Adanos tak siê rozgniewa³?
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_01");	//Œwi¹tynia w tym mieœcie by³a kiedyœ wielkim, jasnym budynkiem.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_02");	//Wszyscy j¹ podziwiali i modlili siê do naszego boga – Adanosa.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_03");	//Rademes, syn dowódcy Quarhodrona, zbezczeœci³ œwi¹tyniê.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_04");	//Jeden po drugim budowniczowie schodzili na œcie¿kê z³a.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_05");	//Adanos nie móg³ im wybaczyæ i kraj zosta³ dotkniêty jego zemst¹.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_06");	//Dlatego tak wa¿ne jest, abyœmy powstrzymali Kruka. Ma zamiar dostaæ siê do œwi¹tyni...
};


instance DIA_ADDON_SATURAS_RAVENINFOS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 9;
	condition = dia_addon_saturas_raveninfos_condition;
	information = dia_addon_saturas_raveninfos_info;
	permanent = TRUE;
	description = "Jeœli chodzi o Kruka...";
};


var int dia_addon_saturas_raveninfos_onetime1;
var int dia_addon_saturas_raveninfos_onetime2;
var int dia_addon_saturas_raveninfos_onetime3;
var int dia_addon_saturas_raveninfos_onetime4;
var int dia_addon_saturas_raveninfos_onetime5;
var int addon_saturas_fortuno;

func int dia_addon_saturas_raveninfos_condition()
{
	if((MIS_ADDON_SATURAS_GOTORAVEN == LOG_RUNNING) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_raveninfos_info()
{
	var int ravenneuigkeit;
	var int xp_ravenneuigkeit;
	AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_00");	//Jeœli chodzi o Kruka...
	ravenneuigkeit = 0;
	if((thorus.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME1 == FALSE) && (RAVENISINTEMPEL == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_01");	//By³em w obozie bandytów. Kruk jest ich przywódc¹.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_02");	//Aby siê do niego zbli¿yæ, muszê siê pozbyæ niektórych bandytów.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_03");	//Dobrze. Powodzenia. Ale nie zapomnij, ¿e musisz siê spieszyæ.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_04");	//Kruk nie mo¿e zrealizowaæ swoich planów.
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME1 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((SC_KNOWSRAVENSGOLDMINE == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME2 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_05");	//Ma kopalniê z³ota i ka¿e w niej pracowaæ swoim wiêŸniom.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_06");	//To podobne do niego. Musisz uwolniæ wiêŸniów.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_07");	//Oczywiœcie. Pracujê nad tym.
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME2 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((SC_KNOWSFORTUNOINFOS == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME3 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_08");	//Jeden z bandytów twierdzi, ¿e zna plany Kruka.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_09");	//Nazywa siê Fortuno. Mówi, ¿e Kruk chce siê dostaæ do œwi¹tyni, aby zdobyæ potê¿ny artefakt.
		AI_Output(self,other,"DIA_Addon_Bodo_14_03");	//I co? Wie coœ wiêcej na temat tego artefaktu?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_11");	//Powiedzia³ mi tylko, ¿e Kruk kaza³ rozkopaæ grób jednego z kap³anów Adanosa.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_12");	//Mo¿liwe, ¿e w tym grobie jest klucz do œwi¹tyni. Powinieneœ siê tam rozejrzeæ.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_13");	//Kruk kaza³ wiêŸniom rozkopaæ grobowiec.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_14");	//To niedobrze. Musisz siê pospieszyæ i pozbyæ Kruka.
		ADDON_SATURAS_FORTUNO = TRUE;
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME3 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((RAVENISINTEMPEL == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME4 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_15");	//Wtargn¹³em do siedziby Kruka.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_16");	//Co z nim?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_17");	//Przyby³em za póŸno. Na moich oczach znikn¹³ w œwi¹tyni Adanosa.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_18");	//Co? To TRAGEDIA! Dlaczego nie wyruszy³eœ za nim?!
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME4 = TRUE;
		MIS_ADDON_SATURAS_GOTORAVEN = LOG_SUCCESS;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if(ravenneuigkeit != 0)
	{
		xp_ravenneuigkeit = ravenneuigkeit * XP_AMBIENT;
		b_giveplayerxp(xp_ravenneuigkeit);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_19");	//Przynosisz jakieœ wieœci?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_20");	//Nie tym razem.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_21");	//Dam ci radê – nie lekcewa¿ Kruka. Rozumiesz?
	};
};


instance DIA_ADDON_SATURAS_TUERZU(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_tuerzu_condition;
	information = dia_addon_saturas_tuerzu_info;
	description = "Nie mog³em iœæ za nim!";
};


func int dia_addon_saturas_tuerzu_condition()
{
	if((MIS_ADDON_SATURAS_GOTORAVEN == LOG_SUCCESS) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_tuerzu_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_00");	//Nie mog³em iœæ za nim. Zablokowa³ bramê od wewn¹trz.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_02");	//Muszê pomyœleæ...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_03");	//Ciekawe, jak Kruk dosta³ siê do œwi¹tyni...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_04");	//Co zrobi³, zanim przeszed³ przez portal?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_05");	//Wypowiedzia³ zaklêcie przy bramie.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_06");	//A przedtem?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_07");	//Otworzy³ grób.
	if(ADDON_SATURAS_FORTUNO == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_09");	//Ju¿ ci mówi³em...
		AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_10");	//Dok³adnie!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_08");	//Wiem, ¿e musia³ odprawiæ jakiœ rytua³...
	};
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_11");	//Rytua³...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_12");	//Tak! W³aœnie to!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_13");	//Obawiam siê, ¿e Kruk zyska³ moc stra¿ników umar³ych.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_14");	//Zdoby³ wiedzê na temat œwi¹tyni od ducha!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_15");	//Musisz udaæ siê do Myxira i mu o tym opowiedzieæ.
	Log_CreateTopic(TOPIC_ADDON_QUARHODRON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_QUARHODRON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Kruk posiad³ moc Stra¿nika Umar³ych i od ducha zdoby³ informacje o œwi¹tyni Adanosa. Powinienem przekazaæ te wiadomoœci Myxirowi.");
	SATURAS_RIESENPLAN = TRUE;
};


instance DIA_ADDON_SATURAS_GHOSTQUESTIONS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_ghostquestions_condition;
	information = dia_addon_saturas_ghostquestions_info;
	description = "Rozmawia³em z Quarhodronem.";
};


func int dia_addon_saturas_ghostquestions_condition()
{
	if((Npc_IsDead(quarhodron) == FALSE) && (SC_TALKEDTOGHOST == TRUE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_ghostquestions_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_00");	//Rozmawia³em z Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_01");	//I co powiedzia³?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_02");	//¯e pomo¿e mi tylko wtedy, jeœli odpowiem mu na kilka pytañ.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_03");	//W czym problem?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_04");	//Nie jestem pewien, co mam mu powiedzieæ.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_05");	//Hm... wiemy, ¿e uczeni z tego miasta zbudowali na pó³nocy bibliotekê.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_06");	//Bardzo dok³adnie spisywali wszystkie wydarzenia przesz³oœci.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_07");	//Mo¿e tam znajdziesz odpowiedzi na pytania Quarhodrona.
	b_logentry(TOPIC_ADDON_QUARHODRON,"Saturas s¹dzi, ¿e odpowiedzi na pytania Quarhodrona mogê znaleŸæ w bibliotece uczonych. Le¿y ona daleko na pó³nocy.");
};


instance DIA_ADDON_SATURAS_TALKEDTOGHOST(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_talkedtoghost_condition;
	information = dia_addon_saturas_talkedtoghost_info;
	description = "Problem z bram¹ u wejœcia do œwi¹tyni zosta³ rozwi¹zany.";
};


func int dia_addon_saturas_talkedtoghost_condition()
{
	if((GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == TRUE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_talkedtoghost_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_00");	//Problem z bram¹ u wejœcia do œwi¹tyni zosta³ rozwi¹zany.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_01");	//Duch przemówi³?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_02");	//Tak.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_03");	//Wiesz, jak dostaæ siê do œwi¹tyni?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_04");	//Tak. Zdradzi³ te¿, co siê w niej znajduje.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_05");	//Mówi³ o potê¿nym mieczu oraz o komnatach Adanosa.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_06");	//Na Adanosa! Jak mogliœmy byæ tak krótkowzroczni?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_07");	//Wskazówki w tych dokumentach...
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_08");	//Tym mieczem mo¿e byæ jedynie Szpon Beliara.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_09");	//Musimy jak najszybciej przejœæ przez komnaty i zdobyæ tê broñ.
	Info_ClearChoices(dia_addon_saturas_talkedtoghost);
	Info_AddChoice(dia_addon_saturas_talkedtoghost,"Co to za Szpon Beliara?",dia_addon_saturas_talkedtoghost_wasistdas);
	Info_AddChoice(dia_addon_saturas_talkedtoghost,"Czym s¹ komnaty Adanosa?",dia_addon_saturas_talkedtoghost_kammern);
};

func void dia_addon_saturas_talkedtoghost_wasistdas()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00");	//Co to za Szpon Beliara?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01");	//To wcielenie z³a. Beliar stworzy³ ten miecz w³asnorêcznie.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02");	//Ka¿dy, kto nim w³ada, posiada potê¿ne narzêdzie zniszczenia.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03");	//Im silniejszy jest w³aœciciel broni, tym wiêksza moc Szpona.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04");	//Jedynie ktoœ wielkiego ducha i silnej wiary mo¿e oprzeæ siê jego mocy.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05");	//To jasne, dlaczego budowniczowie odciêli od œwiata tê dolinê.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06");	//Przynieœli to narzêdzie z³a do swojego miasta i ulegli jego czarowi.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07");	//Chciwoœæ sprawi³a, ¿e ci aroganccy g³upcy pozabijali siê nawzajem.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08");	//Na tym siê nie skoñczy³o. Gniew Adanosa przetoczy³ siê po ca³ym kraju i wszystko zatopi³o morze.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09");	//W rzeczy samej, twórcy portalu dobrze zrobili, ukrywaj¹c te rzeczy przed reszt¹ œwiata.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10");	//Có¿ za tragiczny koniec tak wspania³ej kultury.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11");	//Teraz rozumiesz donios³oœæ swojej misji?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12");	//Kruk jest silnym wojownikiem zaœlepionym rz¹dz¹ w³adzy.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13");	//W jego rêku Szpon stanie siê narzêdziem zniszczenia.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14");	//Nie wolno mu dostaæ tej broni. Inaczej czeka nas zag³ada.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KLAUE,"W œwi¹tyni Adanosa znajduje siê potê¿na broñ, Szpon Beliara. Nie mo¿na dopuœciæ, by wpad³a w rêce Kruka.");
};

func void dia_addon_saturas_talkedtoghost_kammern()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_kammern_15_00");	//Czym s¹ komnaty Adanosa?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_01");	//Wiem, ¿e brama ma tylko przeszkadzaæ w wejœciu do œwi¹tyni.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_02");	//Jednak w œrodku s¹ trzy komnaty, które powinny zatrzymaæ ka¿dego intruza.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_03");	//Kluczem do nich s¹ kolorowe relikty budowniczych.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_04");	//Jeœli zdobêdziemy wszystkie relikty i rozwi¹¿emy ich zagadki, bêdziemy mogli dostaæ siê do sanktuarium œwi¹tyni.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_05");	//Nie wiem, czy Kruk rozszyfrowa³ sekrety œwi¹tyni. Jeœli tak zrobi³, to mamy du¿y problem.
	Log_CreateTopic(TOPIC_ADDON_KAMMERN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KAMMERN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KAMMERN,LOGTEXT_ADDON_RELICTS);
	Log_CreateTopic(TOPIC_ADDON_RELICTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RELICTS,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_RELICTS,LOGTEXT_ADDON_RELICTS);
	SATURAS_KNOWSHOW2GETINTEMPEL = TRUE;
};


instance DIA_ADDON_SATURAS_RELICTSBACK(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_relictsback_condition;
	information = dia_addon_saturas_relictsback_info;
	description = "Co dok³adnie powinienem zrobiæ z reliktami w œwi¹tyni?";
};


func int dia_addon_saturas_relictsback_condition()
{
	if((SATURAS_SCBROUGHTALLTOKEN == TRUE) && (SATURAS_KNOWSHOW2GETINTEMPEL == TRUE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_relictsback_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_RelictsBack_15_00");	//Co dok³adnie powinienem zrobiæ z reliktami w œwi¹tyni?
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_03");	//Nie wiemy wiele na ten temat. Ale miejmy nadziejê, ¿e rozpoznasz ich znaczenie, kiedy dostaniesz siê do œwi¹tyni.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_05");	//Naprawdê bardzo mi przykro, ¿e nie mogê bardziej ci pomóc. Teraz wszystko zale¿y od ciebie.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_06");	//WeŸ relikty i natychmiast idŸ do œwi¹tyni.
	CreateInvItems(hero,itmi_addon_stone_01,1);
	CreateInvItems(hero,itmi_addon_stone_02,1);
	CreateInvItems(hero,itmi_addon_stone_03,1);
	CreateInvItems(hero,itmi_addon_stone_04,1);
	CreateInvItems(hero,itmi_addon_stone_05,1);
	AI_PrintScreen(PRINT_ITEMSERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	b_logentry(TOPIC_ADDON_KAMMERN,"Saturas wysy³a mnie do œwi¹tyni Adanosa z piêcioma reliktami budowniczych. Muszê przedostaæ siê przez komnaty i zatrzymaæ Kruka.");
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_07");	//Niech Adanos zmi³uje siê nad nami i ma nas w swej opiece.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_08");	//Mo¿e nie jest jeszcze za póŸno.
};


instance DIA_ADDON_SATURAS_RAVENSDEAD(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_ravensdead_condition;
	information = dia_addon_saturas_ravensdead_info;
	important = TRUE;
};


func int dia_addon_saturas_ravensdead_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_ravensdead_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_00");	//Trzêsienia ziemi usta³y, a ty wci¹¿ ¿yjesz.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_01");	//Twoja misja powiod³a siê?
	AI_Output(other,self,"DIA_Addon_Saturas_RavensDead_15_02");	//Tak. Kruk nie ¿yje.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_03");	//A wiêc wszystko siê skoñczy³o. Dziêki Adanosowi!
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_04");	//Dobrze zrobi³eœ, mój synu. Jesteœmy twoimi d³u¿nikami.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_05");	//Odebra³eœ s³ugom z³a potê¿n¹ broñ i przywróci³eœ równowagê w tej czêœci œwiata.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_06");	//Kiedy trzêsienia ziemi usta³y, ustaliliœmy, co trzeba zrobiæ w nastêpnej kolejnoœci.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_07");	//Zdob¹dŸ Szpon Beliara. Ta broñ jest tobie przeznaczona.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_08");	//W twoich rêkach powinna staæ siê naszym potê¿nym sprzymierzeñcem.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_09");	//U¿ywaj jej m¹drze, synu. Niech Adanos ci pomo¿e.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_11");	//My zostaniemy tutaj i postaramy siê, aby œwi¹tynia odzyska³a dawny blask.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_12");	//Tylko Myxir wyruszy³ do Khorinis, aby wesprzeæ Vatrasa.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_13");	//Vatras zbyt d³ugo by³ sam w mieœcie.
	Log_CreateTopic(TOPIC_ADDON_VATRASABLOESUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_VATRASABLOESUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_VATRASABLOESUNG,"Myxir uda³ siê do miasta portowego, aby pomóc Vatrasowi.");
	b_giveplayerxp(XP_ADDON_SATURAS_RAVENSDEAD);
};


instance DIA_ADDON_SATURAS_FREEDMISSINGPEOPLE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_freedmissingpeople_condition;
	information = dia_addon_saturas_freedmissingpeople_info;
	description = "Uwolni³em wiêŸniów.";
};


func int dia_addon_saturas_freedmissingpeople_condition()
{
	if(MISSINGPEOPLERETURNEDHOME == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_freedmissingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_FreedMissingPeople_15_00");	//Uwolni³em wiêŸniów.
	AI_Output(self,other,"DIA_Addon_Saturas_FreedMissingPeople_14_01");	//Bardzo dobrze. Oby szczêœliwie dotarli do swej ojczyzny.
	b_giveplayerxp(XP_ADDON_SATURAS_FREEDMISSINGPEOPLE);
};


instance DIA_ADDON_SATURAS_BELIARSWEAPON(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_beliarsweapon_condition;
	information = dia_addon_saturas_beliarsweapon_info;
	description = "Zabra³em Szpon Beliara.";
};


func int dia_addon_saturas_beliarsweapon_condition()
{
	if(c_schasbeliarsweapon() && (RAVENISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_beliarsweapon_info()
{
	AI_UnequipWeapons(hero);
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_00");	//Zabra³em Szpon Beliara.
	if(Npc_HasItems(hero,itmw_beliarweapon_raven) && (SC_FAILEDTOEQUIPBELIARSWEAPON == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_01");	//Ale nie mogê go u¿yæ.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_02");	//Szpon Beliara to wyj¹tkowa broñ.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_03");	//Ma swoj¹ duszê i w³asn¹ wolê.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_04");	//Ty, w³aœciciel tej potê¿nej broni, jesteœ jej panem.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_05");	//Broñ jest teraz czêœci¹ ciebie i dostosuje siê do twoich umiejêtnoœci.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_06");	//Ale nie zrobi tego z w³asnej woli.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_07");	//Jedynie sam BELIAR mo¿e zmusiæ j¹, by ci s³u¿y³a.
	Info_ClearChoices(dia_addon_saturas_beliarsweapon);
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"Dlaczego Beliar mia³by mi pomóc?",dia_addon_saturas_beliarsweapon_besser);
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"Co mogê zrobiæ z t¹ broni¹?",dia_addon_saturas_beliarsweapon_wastun);
};

func void dia_addon_saturas_beliarsweapon_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00");	//Co mogê zrobiæ z t¹ broni¹?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01");	//To zale¿y od ciebie. Zdoby³eœ j¹ i jesteœ teraz jej panem.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02");	//Mogê ci jednak s³u¿yæ rad¹.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03");	//Albo przeka¿esz j¹ MNIE, a ja upewniê siê, ¿e nie spowoduje wiêcej szkód...
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04");	//...albo przyswoisz sobie jej moc i bêdziesz u¿ywaæ miecza do walki.
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"Nie móg³byœ przechowaæ broni?",dia_addon_saturas_beliarsweapon_geben);
};

func void dia_addon_saturas_beliarsweapon_geben()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_geben_15_00");	//Nie móg³byœ przechowaæ broni?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_03");	//Jeœli mi j¹ oddasz, sprawiê, ¿e nie bêdzie mo¿na jej u¿yæ. Nigdy wiêcej nie zostanie wykorzystana do z³ych celów.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_04");	//Wiêc dok³adnie przemyœl, co zrobiæ.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KLAUE,"Mogê przekazaæ Szpon Beliara Saturasowi albo zatrzymaæ go dla siebie.");
};

func void dia_addon_saturas_beliarsweapon_besser()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_besser_15_00");	//Dlaczego Beliar mia³by mi pomóc?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_01");	//Tylko modlitwa mo¿e go przekonaæ.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_02");	//Ale uwa¿aj. Beliar jest nikczemny.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_03");	//Jeœli go rozwœcieczysz, odczujesz na sobie jego furiê.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_KLAUE,"Aby podporz¹dkowaæ Szpon Beliara swojej woli, muszê pomodliæ siê do Beliara.");
	b_say(other,self,"$VERSTEHE");
};


instance DIA_ADDON_SATURAS_PERMENDE_ADDON(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_permende_addon_condition;
	information = dia_addon_saturas_permende_addon_info;
	permanent = TRUE;
	description = "Co teraz zrobisz?";
};


func int dia_addon_saturas_permende_addon_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_ravensdead))
	{
		return TRUE;
	};
};


var int dia_addon_saturas_permende_addon_onetime;

func void dia_addon_saturas_permende_addon_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PermENDE_ADDON_15_00");	//Co teraz zrobisz?
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_01");	//Zostaniemy tutaj i postaramy siê, ¿eby œwi¹tynia odzyska³a sw¹ dawn¹ œwietnoœæ.
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_02");	//Te stare mury zbyt d³ugo sta³y w ruinie.
	if(DIA_ADDON_SATURAS_PERMENDE_ADDON_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_03");	//A jeœli chodzi o ciebie, mój synu...
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_04");	//Jestem bardzo szczêœliwy, widz¹c, ¿e myli³em siê co do ciebie. Jesteœ Stra¿nikiem Równowagi. Nie ma co do tego w¹tpliwoœci.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_05");	//Bez twojej si³y i odwagi wyspê Khorinis czeka³aby zag³ada. Dziêkujemy ci. Chwa³a twemu mêstwu.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_06");	//Skoncentruj siê na pozosta³ych czekaj¹cych ciê zadaniach i przywróæ temu œwiatu równowagê i pokój.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_07");	//IdŸ i wype³nij swoje przeznaczenie, Stra¿niku. Bêd¹ ci towarzyszyæ nasze modlitwy.
		DIA_ADDON_SATURAS_PERMENDE_ADDON_ONETIME = TRUE;
	};
};


instance DIA_ADDON_SATURAS_BELIARWEAPGEBEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_beliarweapgeben_condition;
	information = dia_addon_saturas_beliarweapgeben_info;
	description = "WeŸ Szpon Beliara i zniszcz go.";
};


func int dia_addon_saturas_beliarweapgeben_condition()
{
	if(c_schasbeliarsweapon() && (RAVENISDEAD == TRUE) && Npc_KnowsInfo(other,dia_addon_saturas_beliarsweapon))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_beliarweapgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGeben_15_00");	//WeŸ Szpon Beliara i zniszcz go.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_01");	//Jak sobie ¿yczysz, synu. Oddaj mi broñ.
	b_clearbeliarsweapon();
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_02");	//Nie wyrz¹dzi ju¿ nikomu krzywdy, gdy zatopiê j¹ w morskich odmêtach.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_03");	//Na jej stra¿y staæ bêdzie m¹droœæ Adanosa.
	TOPIC_END_KLAUE = TRUE;
	b_giveplayerxp(XP_ADDON_BELIARSWEAPONABGEGEBEN);
	SATURAS_KLAUEINSMEER = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_PRETEACHCIRCLE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 10;
	condition = dia_addon_saturas_adw_preteachcircle_condition;
	information = dia_addon_saturas_adw_preteachcircle_info;
	description = "Mo¿esz mnie nauczyæ krêgów magii?";
};


func int dia_addon_saturas_adw_preteachcircle_condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_preteachcircle_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_00");	//Mo¿esz mnie nauczyæ krêgów magii?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_01");	//Jesteœ magiem ognia. Co powie na to Pyrokar?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_02");	//Nie musi o tym wiedzieæ.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_03");	//Widzê, ¿e myœlisz o tym powa¿nie. Spe³niê twoj¹ proœbê.
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_04");	//Jeœli odniosê wra¿enie, ¿e wykorzystasz sw¹ wiedzê, aby czyniæ z³o, nie bêdziesz móg³ wiêcej na mnie liczyæ.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_05");	//Lepiej mnie nie rozczaruj.
	};
	SATURAS_ADDON_TEACHCIRCLE = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_SATURASTEACH);
};


instance DIA_ADDON_SATURAS_ADW_CIRCLE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 99;
	condition = dia_addon_saturas_adw_circle_condition;
	information = dia_addon_saturas_adw_circle_info;
	permanent = TRUE;
	description = "Chcê dowiedzieæ siê wiêcej o wy¿szych krêgach magii.";
};


var int dia_addon_saturas_adw_circle_noperm;

func int dia_addon_saturas_adw_circle_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6) && (SATURAS_ADDON_TEACHCIRCLE == TRUE) && (DIA_ADDON_SATURAS_ADW_CIRCLE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_circle_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CIRCLE_15_00");	//Chcê dowiedzieæ siê wiêcej o wy¿szych krêgach magii.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (KAPITEL >= 2))
	{
		if(b_teachmagiccircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_01");	//Tak, jesteœ gotów na dalsz¹ naukê.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_02");	//Wst¹p do drugiego krêgu magii. Niech Adanos obdarzy ciê m¹droœci¹, byœ roztropnie u¿ywa³ swych nowych mocy.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (KAPITEL >= 3))
	{
		if(b_teachmagiccircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_03");	//Tak, nasta³ ku temu czas. Wst¹p do trzeciego krêgu magii.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_04");	//Twoja wiedza pozwoli ci rzucaæ nowe, potê¿ne zaklêcia. U¿ywaj ich roztropnie.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_05");	//Nadszed³ ju¿ czas. Jesteœ gotów wst¹piæ do czwartego krêgu magii.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_06");	//Twoje s³owa i gesty maj¹ teraz wielk¹ moc. Zawsze rozs¹dnie i uwa¿nie dobieraj nowe zaklêcia.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (KAPITEL >= 5))
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_07");	//Masz przywilej wst¹pienia do pi¹tego krêgu magii.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_08");	//Zaklêcia, których siê teraz nauczysz, maj¹ niszczycielsk¹ si³ê.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_09");	//B¹dŸ œwiadom swej wielkiej mocy i nie popadaj w samouwielbienie.
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_10");	//To zadanie nie nale¿y ju¿ do mnie.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_11");	//Aby poznaæ szósty i ostatni kr¹g zaklêæ, musisz odwiedziæ klasztor, Magu Ognia.
		DIA_ADDON_SATURAS_ADW_CIRCLE_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_12");	//Jest zbyt wczeœnie. Wróæ póŸniej.
	};
};

