
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
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXIT_14_00");	//Niech ci� chroni Adanos.
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
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_00");	//Dzi�ki Adanosowi. Nareszcie jeste�. My�leli�my, �e ju� si� nie poka�esz.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_01");	//Co? Sk�d si� tu wzi�li�cie?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_02");	//Przeszed�e� przez portal, a my za tob�. Wkr�tce potem przybyli�my tutaj.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_03");	//Jeste�my tu ju� od kilku dni.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_04");	//KILKU DNI?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_05");	//Kiedy nie mogli�my ci� nigdzie znale��, Nefarius pr�bowa� ustali�, co si� mog�o sta�. Bez rezultat�w.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_06");	//No dobrze. W ko�cu jeste� i mo�esz rozpocz�� prac�.
	Wld_InsertNpc(giant_rat,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(giant_rat,"ADW_PORTALTEMPEL_11");
	Info_ClearChoices(dia_addon_saturas_adwstart);
	Info_AddChoice(dia_addon_saturas_adwstart,"Co dzia�o si� w mi�dzyczasie?",dia_addon_saturas_adwstart_was);
};

func void dia_addon_saturas_adwstart_was()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_was_15_00");	//Co dzia�o si� w mi�dzyczasie?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_01");	//Doszli�my do wielu wniosk�w.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_02");	//Trz�sienia ziemi s� coraz silniejsze. Znajdujemy si� blisko epicentrum.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_03");	//Tw�rcy tych starych budowli za�o�yli tu kiedy� miasto, kt�re uda�o nam si� odkry�.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_04");	//Jednak z jakiego� powodu ich cywilizacja zosta�a zniszczona.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_05");	//Mo�emy si� jedynie domy�la� dlaczego.
	Info_AddChoice(dia_addon_saturas_adwstart,"Odkry�e� jakie� �lady zaginionych ludzi?",dia_addon_saturas_adwstart_missingpeople);
	Info_AddChoice(dia_addon_saturas_adwstart,"Co si� dzieje z Krukiem?",dia_addon_saturas_adwstart_raven);
};

func void dia_addon_saturas_adwstart_raven()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_Raven_15_00");	//Co si� dzieje z Krukiem?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_01");	//W li�cie Kruk pisa� o �wi�tyni i o tym, �e spr�buje dosta� si� do �rodka.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_02");	//Jeste�my pewni, �e chodzi o �wi�tyni� Adanosa, kt�r� Kruk b�dzie pr�bowa� zbezcze�ci�.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_03");	//Trz�sienia ziemi s� bez w�tpienia wynikiem rzucania bezbo�nych czar�w, maj�cych prze�ama� pot�ne zakl�cie.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_04");	//Bramy �wi�tyni s� zamkni�te magi�, a to zakl�cie o�ywia kamiennych stra�nik�w.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_05");	//�wi�tynia si� broni. Musimy powstrzyma� Kruka, zanim dostanie si� do sanktuarium.
	Info_AddChoice(dia_addon_saturas_adwstart,"Co zrobimy p�niej?",dia_addon_saturas_adwstart_wastun);
	Info_AddChoice(dia_addon_saturas_adwstart,"Kruk jest by�ym magnatem, a nie magiem. ",dia_addon_saturas_adwstart_ravenonlybaron);
	Info_AddChoice(dia_addon_saturas_adwstart,"Co Kruk chce zrobi� w �wi�tyni?",dia_addon_saturas_adwstart_ravenaim);
};

func void dia_addon_saturas_adwstart_ravenaim()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenAim_15_00");	//Co Kruk chce zrobi� w �wi�tyni?
	AI_Output(self,other,"DIA_Addon_Bodo_14_01");	//Wiemy tylko, �e chodzi mu o pot�ny artefakt, zwi�zany z Adanosem i Beliarem.
	AI_Output(self,other,"DIA_Addon_Bodo_14_02");	//Na pewno nie ma dobrych zamiar�w...
};

func void dia_addon_saturas_adwstart_ravenonlybaron()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00");	//Kruk jest by�ym magnatem, a nie magiem. Jak m�g�by przygotowa� taki czar?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01");	//Mo�e to nie on. Mo�e jaki� mag renegat, kt�ry wype�nia jego rozkazy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02");	//Tak czy inaczej, MUSIMY zapobiec z�u.
};

func void dia_addon_saturas_adwstart_missingpeople()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_missingPeople_15_00");	//Odkry�e� jakie� �lady zaginionych ludzi?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_01");	//Zaledwie wczoraj, w ruinach na wschodzie, znale�li�my zw�oki rybaka.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_02");	//Wygl�da na to, �e pochodzi� z Khorinis. Powiniene� zobaczy� cia�o.
	SATURAS_ABOUTWILLIAM = TRUE;
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMLEICHE);
};

func void dia_addon_saturas_adwstart_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun_15_00");	//Co zrobimy p�niej?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_01");	//Zostaniemy tutaj i b�dziemy dalej badali t� pradawn� cywilizacj�.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_02");	//Stare zwoje budowniczych zawieraj� mn�stwo tajemnic, kt�re musimy odkry� � je�li chcemy zrozumie�, co sta�o si� w przesz�o�ci.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_03");	//A teraz musisz co� dla nas zrobi�...
	Info_AddChoice(dia_addon_saturas_adwstart,"O co chodzi?",dia_addon_saturas_adwstart_wastun2);
};

func void dia_addon_saturas_adwstart_wastun2()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_00");	//O co chodzi?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_01");	//Musisz znale�� Kruka i powstrzyma� go przed bezczeszczeniem �wi�tyni Adanosa.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_02");	//Mam go zabi�?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_03");	//Je�li to jedyny spos�b, by go powstrzyma�, to... TAK! W imi� Adanosa!
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_04");	//Zbierz wszystkie zapiski i relikty budowniczych, kt�re zdo�asz znale��, i przynie� je do nas.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_05");	//Musimy dowiedzie� si� wi�cej na temat tych ludzi i tego, co ich spotka�o.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_06");	//Kiedy przejrzymy zamiary Kruka, b�dziemy mogli mu przeszkodzi�.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_07");	//Musisz te� znale�� spos�b na uwolnienie niewolnik�w.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_08");	//To wszystko? Zrobi� to z zamkni�tymi oczami.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_09");	//Wiem, �e to nie�atwe zadanie. Zrozum, to twoja szansa na odzyskanie mojego zaufania.
	MIS_ADDON_SATURAS_GOTORAVEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RAVENKDW,"Kruk bezcze�ci �wi�tyni� Adanosa. Musz� go powstrzyma�, nawet je�li oznacza to jego zabicie.");
	Log_CreateTopic(TOPIC_ADDON_SKLAVEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKLAVEN,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_SKLAVEN,"Saturas chce, �ebym uwolni� niewolnik�w.");
	Log_CreateTopic(TOPIC_ADDON_RELICTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RELICTS,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_RELICTS,"Saturas chce, �ebym przyni�s� mu ka�d� rzecz, kt�ra pozwoli mu pozna� bli�ej prastar� kultur� budowniczych.");
	Info_AddChoice(dia_addon_saturas_adwstart,"W takim razie ruszam w drog�.",dia_addon_saturas_adwstart_back);
};

func void dia_addon_saturas_adwstart_back()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_back_15_00");	//W takim razie ruszam w drog�.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_01");	//Jeszcze jedno... Krukowi towarzyszy wielu bandyt�w.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_02");	//Podczas twojej nieobecno�ci przyj�li�my kolejnego cz�onka Wodnego Kr�gu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_03");	//Wys�ali�my go na bagna. Nie wr�ci�.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_04");	//S�dzimy, �e bandyci atakuj� ka�dego, kto nie wygl�da jak oni.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_05");	//Za�atw sobie ich zbroj�.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_06");	//B�dziesz m�g� podej�� bli�ej ich obozu, nie ryzykuj�c, �e ci� zaatakuj�.
	Log_CreateTopic(TOPIC_ADDON_BDTRUESTUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BDTRUESTUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Bandyci strzelaj� do wszystkich, kt�rzy nie wygl�daj� jak oni. B�d� potrzebowa� zbroi bandyt�w, je�li chc� si� do nich zbli�y�.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ADDON_SATURAS_POORRANGER(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_poorranger_condition;
	information = dia_addon_saturas_poorranger_info;
	description = "Kt�rego to nieszcz�nika wys�a�e� na bagna?";
};


func int dia_addon_saturas_poorranger_condition()
{
	return TRUE;
};

func void dia_addon_saturas_poorranger_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PoorRanger_15_00");	//Kt�rego to nieszcz�nika wys�a�e� na bagna?
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_01");	//Nazywa� si� Lance.
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_02");	//Chyba nie zaszed� daleko.
	Log_CreateTopic(TOPIC_ADDON_LANCE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LANCE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_LANCE,"Saturas wys�a� na bagna cz�owieka imieniem Lance. Boi si� jednak, �e nie zaszed� daleko.");
};


instance DIA_ADDON_SATURAS_PIRATEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_piraten_condition;
	information = dia_addon_saturas_piraten_info;
	description = "Gdzie znajd� pasuj�c� na mnie zbroj� bandyt�w?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_Piraten_15_00");	//Gdzie znajd� pasuj�c� na mnie zbroj� bandyt�w?
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_01");	//Na zachodzie jest ob�z pirat�w.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_02");	//Z tego, co wiem, utrzymuj� kontakty z bandytami.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_03");	//Nie s�dz�, �eby ci� zaatakowali.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_04");	//Mo�e uda ci si� znale�� u nich jak�� pomoc...
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Saturas uwa�a, �e piraci mog� pom�c mi zdoby� zbroj� bandyt�w.");
};


instance DIA_ADDON_SATURAS_LANCELEICHE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_lanceleiche_condition;
	information = dia_addon_saturas_lanceleiche_info;
	description = "Znalaz�em cia�o Lance'a.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_LanceLeiche_15_00");	//Znalaz�em cia�o Lance'a.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_01");	//Oby jego dusza dost�pi�a kr�lestwa Adanosa.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_02");	//Uwa�aj na siebie, synu. Nie chc� op�akiwa� kolejnej straty.
	TOPIC_END_LANCE = TRUE;
	b_giveplayerxp(XP_ADDON_LANCELEICHE);
};


instance DIA_ADDON_SATURAS_LANCERING(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_lancering_condition;
	information = dia_addon_saturas_lancering_info;
	description = "Mam akwamarynowy pier�cie� Lance'a.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_LanceRing_15_00");	//Mam akwamarynowy pier�cie� Lance'a.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceRing_14_01");	//Najlepiej oddaj mi go, zanim wpadnie w niepowo�ane r�ce.
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
	description = "Je�li chodzi o relikty...";
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
	AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_00");	//Je�li chodzi o relikty...
	if((DIA_ADDON_SATURAS_TOKENS_ONETIME == FALSE) && (c_schasmagicstoneplate() || Npc_HasItems(other,itwr_stoneplatecommon_addon)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_01");	//Wydaje mi si�, �e mam tu co� dla ciebie.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_02");	//Mamy ju� podobne kamienne tablice. Te ju� nam si� nie przydadz�.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_03");	//Tam musi by� co� wi�cej.
		DIA_ADDON_SATURAS_TOKENS_ONETIME = TRUE;
	};
	broughttoken = 0;
	xp_broughttokens = 0;
	if((Npc_HasItems(other,itmi_addon_stone_01) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_01 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_02) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_03) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_04) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_05) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_05 == FALSE)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_04");	//A to mo�ecie wykorzysta�?
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_05");	//Wygl�da nie�le. Gdzie to znalaz�e�?
		b_logentry(TOPIC_ADDON_RELICTS,"Saturas otrzyma� ode mnie nast�puj�ce relikty:");
		if(Npc_HasItems(other,itmi_addon_stone_01) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_01 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_01,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_01 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_06");	//Bandyci u�ywaj� tych tabliczek jako waluty.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_07");	//Na tablicach jest symbol Quarhodrona, wielkiego wojownika i dow�dcy.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_08");	//Jego syn � Rademes � doprowadzi� do zag�ady ca�ego miasta.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_09");	//Phi. Za�o�� si�, �e bandyci nie maj� poj�cia, co wpad�o im w r�ce.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Czerwon� kamienn� tablic�, kt�r� bandyci u�ywali jako walut�. Jest na niej znak wielkiego wodza Quarhodrona.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_02) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_02,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_02 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_10");	//T� tabliczk� znalaz�em w budynku na po�udniu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_11");	//Ach! Tablica stra�nik�w umar�ych. Przywo�uje duchy zmar�ych.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_12");	//Zwi�zki pomi�dzy budowniczymi i ich przodkami by�y bardzo silne.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Fioletow� kamienn� tablic� z posiad�o�ci stra�nik�w umar�ych na po�udniu.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_03) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_03,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_03 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_13");	//Znalaz�em t� tabliczk� w budynku na po�udniowym zachodzie.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_14");	//Z tego, co na niej napisano, wynika, �e by� to dom kap�an�w miasta.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_15");	//Najwy�szy kap�an nazywa� si� KHARDIMON. Nie wiemy wiele wi�cej na jego temat.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Niebiesk� kamienn� tablic� z domostwa kap�an�w na po�udniowym zachodzie.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_04) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_04,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_04 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_15");	//Ta tabliczka le�a�a w budynku niedaleko wielkiego bagna.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_16");	//Na pewno by� to dom uzdrowicieli.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_17");	//Nie wiemy o nich zbyt wiele. Wygl�da na to, �e znikn�li pierwsi.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- Zielon� kamienn� tablic� z domu uzdrowicieli w po�udniowej cz�ci bagna.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_05) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_05 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_05,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_05 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_18");	//Ta cz�� le�a�a w wielkim budynku w kanionie.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_19");	//To by�a biblioteka tego pradawnego ludu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_20");	//Najwyra�niej jest to tablica uczonych.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_80");	//Wi�kszo�� pism, kt�re znale�li�my, jest autorstwa przyw�dcy Kasty Uczonych.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_81");	//Co dziwne, nie zostawi� swojego imienia na �adnym z pism...
			Log_AddEntry(TOPIC_ADDON_RELICTS,"- ��t� kamienn� tablic� z biblioteki uczonych na p�nocy.");
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
				AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_21");	//Bardzo dobrze. Mamy coraz wyra�niejszy obraz miasta, ale jeszcze nie wiemy wszystkiego.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_22");	//Na tym terenie musi by� ukrytych pi�� takich kamiennych tablic.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_23");	//Znajd� je i przynie� do mnie.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_24");	//We� to z�oto jako swe wynagrodzenie.
		kohle = 200 * broughttoken;
		CreateInvItems(self,itmi_gold,kohle);
		b_giveinvitems(self,other,itmi_gold,kohle);
		SCBROUGHTTOKEN = TRUE;
	};
	if(SATURAS_BROUGHTTOKENAMOUNT == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_25");	//Mamy ju� wszystkie potrzebne relikty.
		if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_26");	//Odda�e� nam wielk� przys�ug�. Dzi�kujemy.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_27");	//To pozwoli nam wykona� decyduj�cy krok w naszych badaniach.
		};
		MIS_SATURAS_LOOKINGFORHOUSESOFRULERS = LOG_SUCCESS;
		SATURAS_SCBROUGHTALLTOKEN = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_28");	//Zobaczymy, co uda mi si� znale��.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_29");	//Dobrze. Tylko si� po�piesz. Czas ucieka.
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
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_00");	//Dobrze, �e jeste�. Mamy nowe informacje, kt�re chcemy ci przekaza�.
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_15_01");	//Zamieniam si� w s�uch.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_02");	//Zaginione miasto nosi�o nazw� Jarkendar. Mia�o 5 w�adc�w, kt�rzy wsp�lnie nim rz�dzili.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_03");	//Ka�dy z w�adc�w mia� posiad�o��, w kt�rej mieszka� i gdzie trzyma� swoje dobra.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_04");	//Wydaje si� konieczne, aby� w czasie poszukiwa� relikt�w tej zaginionej cywilizacji stara� si� r�wnie� odnale�� ich domostwa.
	MIS_SATURAS_LOOKINGFORHOUSESOFRULERS = LOG_RUNNING;
	Info_ClearChoices(dia_addon_saturas_stoneplatehint);
	Info_AddChoice(dia_addon_saturas_stoneplatehint,"A je�li �adna z nich ju� nie istnieje?",dia_addon_saturas_stoneplatehint_unter);
	Info_AddChoice(dia_addon_saturas_stoneplatehint,"Gdzie powinienem ich szuka�?",dia_addon_saturas_stoneplatehint_wo);
};

func void dia_addon_saturas_stoneplatehint_wo()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_wo_15_00");	//Gdzie powinienem ich szuka�?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_01");	//Riordian prowadzi� badania nad uk�adem budynk�w Jarkendaru.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_02");	//Powie ci, gdzie s� te posiad�o�ci.
	Log_CreateTopic(TOPIC_ADDON_HOUSESOFRULERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOUSESOFRULERS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOUSESOFRULERS,"Saturas chce, �ebym poszuka� czego� u�ytecznego w posiad�o�ciach budowniczych. Riordian powie mi, gdzie je znale��.");
};

func void dia_addon_saturas_stoneplatehint_unter()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_unter_15_00");	//A je�li �adna z tych posiad�o�ci ju� nie istnieje?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_01");	//Je�li nie uda ci si� znale�� tych dom�w, to znaczy, �e najprawdopodobniej zosta�y zniszczone w czasie upadku miasta.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_02");	//Ale je�li wci�� istniej�, to mog� okaza� si� bezcenne dla naszych bada�.
};


instance DIA_ADDON_SATURAS_SCBROUGHTALLTOKEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_scbroughtalltoken_condition;
	information = dia_addon_saturas_scbroughtalltoken_info;
	description = "Po co potrzebujesz tych pi�ciu kamiennych tabliczek?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_SCBroughtAllToken_15_00");	//Po co potrzebujesz tych pi�ciu kamiennych tabliczek?
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_01");	//Zapiski, kt�re znale�li�my w ruinach, s� niepe�ne.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_02");	//Ale pisma budowniczych wspominaj� o pi�ciu w�adcach rz�dz�cych miastem.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_03");	//Ka�dy z nich mia� jedn� z tablic, symbol swojej w�adzy.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_04");	//S�dz�, �e dzi�ki tym tablicom znajdziemy odpowiedzi na moje pytania.
};


instance DIA_ADDON_SATURAS_FLUT(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_flut_condition;
	information = dia_addon_saturas_flut_info;
	description = "Nefarius opowiedzia� mi o potopie...";
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
	AI_Output(other,self,"DIA_Addon_Saturas_Flut_15_00");	//Nefarius opowiedzia� mi o potopie...
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_02");	//Przekazy g�osz�, �e Adanos zst�pi� z nieba, aby ukara� niewierz�cych i wygna� ich do kr�lestwa umar�ych.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_03");	//W �wi�tym gniewie kaza� falom morskim zala� budowniczych tego miasta i zmy� ich z powierzchni.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_04");	//Bagno na wschodzie jest pozosta�o�ci� po tych wydarzeniach.
	TOPIC_END_FLUT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_SATURAS_ADANOSZORN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_adanoszorn_condition;
	information = dia_addon_saturas_adanoszorn_info;
	description = "Dlaczego Adanos tak si� rozgniewa�?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_AdanosZorn_15_00");	//Dlaczego Adanos tak si� rozgniewa�?
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_01");	//�wi�tynia w tym mie�cie by�a kiedy� wielkim, jasnym budynkiem.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_02");	//Wszyscy j� podziwiali i modlili si� do naszego boga � Adanosa.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_03");	//Rademes, syn dow�dcy Quarhodrona, zbezcze�ci� �wi�tyni�.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_04");	//Jeden po drugim budowniczowie schodzili na �cie�k� z�a.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_05");	//Adanos nie m�g� im wybaczy� i kraj zosta� dotkni�ty jego zemst�.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_06");	//Dlatego tak wa�ne jest, aby�my powstrzymali Kruka. Ma zamiar dosta� si� do �wi�tyni...
};


instance DIA_ADDON_SATURAS_RAVENINFOS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 9;
	condition = dia_addon_saturas_raveninfos_condition;
	information = dia_addon_saturas_raveninfos_info;
	permanent = TRUE;
	description = "Je�li chodzi o Kruka...";
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
	AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_00");	//Je�li chodzi o Kruka...
	ravenneuigkeit = 0;
	if((thorus.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME1 == FALSE) && (RAVENISINTEMPEL == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_01");	//By�em w obozie bandyt�w. Kruk jest ich przyw�dc�.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_02");	//Aby si� do niego zbli�y�, musz� si� pozby� niekt�rych bandyt�w.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_03");	//Dobrze. Powodzenia. Ale nie zapomnij, �e musisz si� spieszy�.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_04");	//Kruk nie mo�e zrealizowa� swoich plan�w.
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME1 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((SC_KNOWSRAVENSGOLDMINE == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME2 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_05");	//Ma kopalni� z�ota i ka�e w niej pracowa� swoim wi�niom.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_06");	//To podobne do niego. Musisz uwolni� wi�ni�w.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_07");	//Oczywi�cie. Pracuj� nad tym.
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME2 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((SC_KNOWSFORTUNOINFOS == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME3 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_08");	//Jeden z bandyt�w twierdzi, �e zna plany Kruka.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_09");	//Nazywa si� Fortuno. M�wi, �e Kruk chce si� dosta� do �wi�tyni, aby zdoby� pot�ny artefakt.
		AI_Output(self,other,"DIA_Addon_Bodo_14_03");	//I co? Wie co� wi�cej na temat tego artefaktu?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_11");	//Powiedzia� mi tylko, �e Kruk kaza� rozkopa� gr�b jednego z kap�an�w Adanosa.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_12");	//Mo�liwe, �e w tym grobie jest klucz do �wi�tyni. Powiniene� si� tam rozejrze�.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_13");	//Kruk kaza� wi�niom rozkopa� grobowiec.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_14");	//To niedobrze. Musisz si� pospieszy� i pozby� Kruka.
		ADDON_SATURAS_FORTUNO = TRUE;
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME3 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((RAVENISINTEMPEL == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME4 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_15");	//Wtargn��em do siedziby Kruka.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_16");	//Co z nim?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_17");	//Przyby�em za p�no. Na moich oczach znikn�� w �wi�tyni Adanosa.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_18");	//Co? To TRAGEDIA! Dlaczego nie wyruszy�e� za nim?!
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
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_19");	//Przynosisz jakie� wie�ci?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_20");	//Nie tym razem.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_21");	//Dam ci rad� � nie lekcewa� Kruka. Rozumiesz?
	};
};


instance DIA_ADDON_SATURAS_TUERZU(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_tuerzu_condition;
	information = dia_addon_saturas_tuerzu_info;
	description = "Nie mog�em i�� za nim!";
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
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_00");	//Nie mog�em i�� za nim. Zablokowa� bram� od wewn�trz.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_02");	//Musz� pomy�le�...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_03");	//Ciekawe, jak Kruk dosta� si� do �wi�tyni...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_04");	//Co zrobi�, zanim przeszed� przez portal?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_05");	//Wypowiedzia� zakl�cie przy bramie.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_06");	//A przedtem?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_07");	//Otworzy� gr�b.
	if(ADDON_SATURAS_FORTUNO == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_09");	//Ju� ci m�wi�em...
		AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_10");	//Dok�adnie!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_08");	//Wiem, �e musia� odprawi� jaki� rytua�...
	};
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_11");	//Rytua�...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_12");	//Tak! W�a�nie to!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_13");	//Obawiam si�, �e Kruk zyska� moc stra�nik�w umar�ych.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_14");	//Zdoby� wiedz� na temat �wi�tyni od ducha!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_15");	//Musisz uda� si� do Myxira i mu o tym opowiedzie�.
	Log_CreateTopic(TOPIC_ADDON_QUARHODRON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_QUARHODRON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Kruk posiad� moc Stra�nika Umar�ych i od ducha zdoby� informacje o �wi�tyni Adanosa. Powinienem przekaza� te wiadomo�ci Myxirowi.");
	SATURAS_RIESENPLAN = TRUE;
};


instance DIA_ADDON_SATURAS_GHOSTQUESTIONS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_ghostquestions_condition;
	information = dia_addon_saturas_ghostquestions_info;
	description = "Rozmawia�em z Quarhodronem.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_00");	//Rozmawia�em z Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_01");	//I co powiedzia�?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_02");	//�e pomo�e mi tylko wtedy, je�li odpowiem mu na kilka pyta�.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_03");	//W czym problem?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_04");	//Nie jestem pewien, co mam mu powiedzie�.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_05");	//Hm... wiemy, �e uczeni z tego miasta zbudowali na p�nocy bibliotek�.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_06");	//Bardzo dok�adnie spisywali wszystkie wydarzenia przesz�o�ci.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_07");	//Mo�e tam znajdziesz odpowiedzi na pytania Quarhodrona.
	b_logentry(TOPIC_ADDON_QUARHODRON,"Saturas s�dzi, �e odpowiedzi na pytania Quarhodrona mog� znale�� w bibliotece uczonych. Le�y ona daleko na p�nocy.");
};


instance DIA_ADDON_SATURAS_TALKEDTOGHOST(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_talkedtoghost_condition;
	information = dia_addon_saturas_talkedtoghost_info;
	description = "Problem z bram� u wej�cia do �wi�tyni zosta� rozwi�zany.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_00");	//Problem z bram� u wej�cia do �wi�tyni zosta� rozwi�zany.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_01");	//Duch przem�wi�?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_02");	//Tak.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_03");	//Wiesz, jak dosta� si� do �wi�tyni?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_04");	//Tak. Zdradzi� te�, co si� w niej znajduje.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_05");	//M�wi� o pot�nym mieczu oraz o komnatach Adanosa.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_06");	//Na Adanosa! Jak mogli�my by� tak kr�tkowzroczni?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_07");	//Wskaz�wki w tych dokumentach...
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_08");	//Tym mieczem mo�e by� jedynie Szpon Beliara.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_09");	//Musimy jak najszybciej przej�� przez komnaty i zdoby� t� bro�.
	Info_ClearChoices(dia_addon_saturas_talkedtoghost);
	Info_AddChoice(dia_addon_saturas_talkedtoghost,"Co to za Szpon Beliara?",dia_addon_saturas_talkedtoghost_wasistdas);
	Info_AddChoice(dia_addon_saturas_talkedtoghost,"Czym s� komnaty Adanosa?",dia_addon_saturas_talkedtoghost_kammern);
};

func void dia_addon_saturas_talkedtoghost_wasistdas()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00");	//Co to za Szpon Beliara?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01");	//To wcielenie z�a. Beliar stworzy� ten miecz w�asnor�cznie.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02");	//Ka�dy, kto nim w�ada, posiada pot�ne narz�dzie zniszczenia.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03");	//Im silniejszy jest w�a�ciciel broni, tym wi�ksza moc Szpona.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04");	//Jedynie kto� wielkiego ducha i silnej wiary mo�e oprze� si� jego mocy.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05");	//To jasne, dlaczego budowniczowie odci�li od �wiata t� dolin�.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06");	//Przynie�li to narz�dzie z�a do swojego miasta i ulegli jego czarowi.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07");	//Chciwo�� sprawi�a, �e ci aroganccy g�upcy pozabijali si� nawzajem.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08");	//Na tym si� nie sko�czy�o. Gniew Adanosa przetoczy� si� po ca�ym kraju i wszystko zatopi�o morze.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09");	//W rzeczy samej, tw�rcy portalu dobrze zrobili, ukrywaj�c te rzeczy przed reszt� �wiata.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10");	//C� za tragiczny koniec tak wspania�ej kultury.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11");	//Teraz rozumiesz donios�o�� swojej misji?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12");	//Kruk jest silnym wojownikiem za�lepionym rz�dz� w�adzy.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13");	//W jego r�ku Szpon stanie si� narz�dziem zniszczenia.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14");	//Nie wolno mu dosta� tej broni. Inaczej czeka nas zag�ada.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KLAUE,"W �wi�tyni Adanosa znajduje si� pot�na bro�, Szpon Beliara. Nie mo�na dopu�ci�, by wpad�a w r�ce Kruka.");
};

func void dia_addon_saturas_talkedtoghost_kammern()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_kammern_15_00");	//Czym s� komnaty Adanosa?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_01");	//Wiem, �e brama ma tylko przeszkadza� w wej�ciu do �wi�tyni.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_02");	//Jednak w �rodku s� trzy komnaty, kt�re powinny zatrzyma� ka�dego intruza.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_03");	//Kluczem do nich s� kolorowe relikty budowniczych.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_04");	//Je�li zdob�dziemy wszystkie relikty i rozwi��emy ich zagadki, b�dziemy mogli dosta� si� do sanktuarium �wi�tyni.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_05");	//Nie wiem, czy Kruk rozszyfrowa� sekrety �wi�tyni. Je�li tak zrobi�, to mamy du�y problem.
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
	description = "Co dok�adnie powinienem zrobi� z reliktami w �wi�tyni?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_RelictsBack_15_00");	//Co dok�adnie powinienem zrobi� z reliktami w �wi�tyni?
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_03");	//Nie wiemy wiele na ten temat. Ale miejmy nadziej�, �e rozpoznasz ich znaczenie, kiedy dostaniesz si� do �wi�tyni.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_05");	//Naprawd� bardzo mi przykro, �e nie mog� bardziej ci pom�c. Teraz wszystko zale�y od ciebie.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_06");	//We� relikty i natychmiast id� do �wi�tyni.
	CreateInvItems(hero,itmi_addon_stone_01,1);
	CreateInvItems(hero,itmi_addon_stone_02,1);
	CreateInvItems(hero,itmi_addon_stone_03,1);
	CreateInvItems(hero,itmi_addon_stone_04,1);
	CreateInvItems(hero,itmi_addon_stone_05,1);
	AI_PrintScreen(PRINT_ITEMSERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	b_logentry(TOPIC_ADDON_KAMMERN,"Saturas wysy�a mnie do �wi�tyni Adanosa z pi�cioma reliktami budowniczych. Musz� przedosta� si� przez komnaty i zatrzyma� Kruka.");
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_07");	//Niech Adanos zmi�uje si� nad nami i ma nas w swej opiece.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_08");	//Mo�e nie jest jeszcze za p�no.
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
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_00");	//Trz�sienia ziemi usta�y, a ty wci�� �yjesz.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_01");	//Twoja misja powiod�a si�?
	AI_Output(other,self,"DIA_Addon_Saturas_RavensDead_15_02");	//Tak. Kruk nie �yje.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_03");	//A wi�c wszystko si� sko�czy�o. Dzi�ki Adanosowi!
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_04");	//Dobrze zrobi�e�, m�j synu. Jeste�my twoimi d�u�nikami.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_05");	//Odebra�e� s�ugom z�a pot�n� bro� i przywr�ci�e� r�wnowag� w tej cz�ci �wiata.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_06");	//Kiedy trz�sienia ziemi usta�y, ustalili�my, co trzeba zrobi� w nast�pnej kolejno�ci.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_07");	//Zdob�d� Szpon Beliara. Ta bro� jest tobie przeznaczona.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_08");	//W twoich r�kach powinna sta� si� naszym pot�nym sprzymierze�cem.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_09");	//U�ywaj jej m�drze, synu. Niech Adanos ci pomo�e.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_11");	//My zostaniemy tutaj i postaramy si�, aby �wi�tynia odzyska�a dawny blask.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_12");	//Tylko Myxir wyruszy� do Khorinis, aby wesprze� Vatrasa.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_13");	//Vatras zbyt d�ugo by� sam w mie�cie.
	Log_CreateTopic(TOPIC_ADDON_VATRASABLOESUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_VATRASABLOESUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_VATRASABLOESUNG,"Myxir uda� si� do miasta portowego, aby pom�c Vatrasowi.");
	b_giveplayerxp(XP_ADDON_SATURAS_RAVENSDEAD);
};


instance DIA_ADDON_SATURAS_FREEDMISSINGPEOPLE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_freedmissingpeople_condition;
	information = dia_addon_saturas_freedmissingpeople_info;
	description = "Uwolni�em wi�ni�w.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_FreedMissingPeople_15_00");	//Uwolni�em wi�ni�w.
	AI_Output(self,other,"DIA_Addon_Saturas_FreedMissingPeople_14_01");	//Bardzo dobrze. Oby szcz�liwie dotarli do swej ojczyzny.
	b_giveplayerxp(XP_ADDON_SATURAS_FREEDMISSINGPEOPLE);
};


instance DIA_ADDON_SATURAS_BELIARSWEAPON(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_beliarsweapon_condition;
	information = dia_addon_saturas_beliarsweapon_info;
	description = "Zabra�em Szpon Beliara.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_00");	//Zabra�em Szpon Beliara.
	if(Npc_HasItems(hero,itmw_beliarweapon_raven) && (SC_FAILEDTOEQUIPBELIARSWEAPON == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_01");	//Ale nie mog� go u�y�.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_02");	//Szpon Beliara to wyj�tkowa bro�.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_03");	//Ma swoj� dusz� i w�asn� wol�.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_04");	//Ty, w�a�ciciel tej pot�nej broni, jeste� jej panem.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_05");	//Bro� jest teraz cz�ci� ciebie i dostosuje si� do twoich umiej�tno�ci.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_06");	//Ale nie zrobi tego z w�asnej woli.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_07");	//Jedynie sam BELIAR mo�e zmusi� j�, by ci s�u�y�a.
	Info_ClearChoices(dia_addon_saturas_beliarsweapon);
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"Dlaczego Beliar mia�by mi pom�c?",dia_addon_saturas_beliarsweapon_besser);
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"Co mog� zrobi� z t� broni�?",dia_addon_saturas_beliarsweapon_wastun);
};

func void dia_addon_saturas_beliarsweapon_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00");	//Co mog� zrobi� z t� broni�?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01");	//To zale�y od ciebie. Zdoby�e� j� i jeste� teraz jej panem.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02");	//Mog� ci jednak s�u�y� rad�.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03");	//Albo przeka�esz j� MNIE, a ja upewni� si�, �e nie spowoduje wi�cej szk�d...
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04");	//...albo przyswoisz sobie jej moc i b�dziesz u�ywa� miecza do walki.
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"Nie m�g�by� przechowa� broni?",dia_addon_saturas_beliarsweapon_geben);
};

func void dia_addon_saturas_beliarsweapon_geben()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_geben_15_00");	//Nie m�g�by� przechowa� broni?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_03");	//Je�li mi j� oddasz, sprawi�, �e nie b�dzie mo�na jej u�y�. Nigdy wi�cej nie zostanie wykorzystana do z�ych cel�w.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_04");	//Wi�c dok�adnie przemy�l, co zrobi�.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KLAUE,"Mog� przekaza� Szpon Beliara Saturasowi albo zatrzyma� go dla siebie.");
};

func void dia_addon_saturas_beliarsweapon_besser()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_besser_15_00");	//Dlaczego Beliar mia�by mi pom�c?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_01");	//Tylko modlitwa mo�e go przekona�.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_02");	//Ale uwa�aj. Beliar jest nikczemny.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_03");	//Je�li go rozw�cieczysz, odczujesz na sobie jego furi�.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_KLAUE,"Aby podporz�dkowa� Szpon Beliara swojej woli, musz� pomodli� si� do Beliara.");
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
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_01");	//Zostaniemy tutaj i postaramy si�, �eby �wi�tynia odzyska�a sw� dawn� �wietno��.
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_02");	//Te stare mury zbyt d�ugo sta�y w ruinie.
	if(DIA_ADDON_SATURAS_PERMENDE_ADDON_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_03");	//A je�li chodzi o ciebie, m�j synu...
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_04");	//Jestem bardzo szcz�liwy, widz�c, �e myli�em si� co do ciebie. Jeste� Stra�nikiem R�wnowagi. Nie ma co do tego w�tpliwo�ci.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_05");	//Bez twojej si�y i odwagi wysp� Khorinis czeka�aby zag�ada. Dzi�kujemy ci. Chwa�a twemu m�stwu.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_06");	//Skoncentruj si� na pozosta�ych czekaj�cych ci� zadaniach i przywr�� temu �wiatu r�wnowag� i pok�j.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_07");	//Id� i wype�nij swoje przeznaczenie, Stra�niku. B�d� ci towarzyszy� nasze modlitwy.
		DIA_ADDON_SATURAS_PERMENDE_ADDON_ONETIME = TRUE;
	};
};


instance DIA_ADDON_SATURAS_BELIARWEAPGEBEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_beliarweapgeben_condition;
	information = dia_addon_saturas_beliarweapgeben_info;
	description = "We� Szpon Beliara i zniszcz go.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGeben_15_00");	//We� Szpon Beliara i zniszcz go.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_01");	//Jak sobie �yczysz, synu. Oddaj mi bro�.
	b_clearbeliarsweapon();
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_02");	//Nie wyrz�dzi ju� nikomu krzywdy, gdy zatopi� j� w morskich odm�tach.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_03");	//Na jej stra�y sta� b�dzie m�dro�� Adanosa.
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
	description = "Mo�esz mnie nauczy� kr�g�w magii?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_00");	//Mo�esz mnie nauczy� kr�g�w magii?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_01");	//Jeste� magiem ognia. Co powie na to Pyrokar?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_02");	//Nie musi o tym wiedzie�.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_03");	//Widz�, �e my�lisz o tym powa�nie. Spe�ni� twoj� pro�b�.
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_04");	//Je�li odnios� wra�enie, �e wykorzystasz sw� wiedz�, aby czyni� z�o, nie b�dziesz m�g� wi�cej na mnie liczy�.
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
	description = "Chc� dowiedzie� si� wi�cej o wy�szych kr�gach magii.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CIRCLE_15_00");	//Chc� dowiedzie� si� wi�cej o wy�szych kr�gach magii.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (KAPITEL >= 2))
	{
		if(b_teachmagiccircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_01");	//Tak, jeste� got�w na dalsz� nauk�.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_02");	//Wst�p do drugiego kr�gu magii. Niech Adanos obdarzy ci� m�dro�ci�, by� roztropnie u�ywa� swych nowych mocy.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (KAPITEL >= 3))
	{
		if(b_teachmagiccircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_03");	//Tak, nasta� ku temu czas. Wst�p do trzeciego kr�gu magii.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_04");	//Twoja wiedza pozwoli ci rzuca� nowe, pot�ne zakl�cia. U�ywaj ich roztropnie.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_05");	//Nadszed� ju� czas. Jeste� got�w wst�pi� do czwartego kr�gu magii.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_06");	//Twoje s�owa i gesty maj� teraz wielk� moc. Zawsze rozs�dnie i uwa�nie dobieraj nowe zakl�cia.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (KAPITEL >= 5))
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_07");	//Masz przywilej wst�pienia do pi�tego kr�gu magii.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_08");	//Zakl�cia, kt�rych si� teraz nauczysz, maj� niszczycielsk� si��.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_09");	//B�d� �wiadom swej wielkiej mocy i nie popadaj w samouwielbienie.
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_10");	//To zadanie nie nale�y ju� do mnie.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_11");	//Aby pozna� sz�sty i ostatni kr�g zakl��, musisz odwiedzi� klasztor, Magu Ognia.
		DIA_ADDON_SATURAS_ADW_CIRCLE_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_12");	//Jest zbyt wcze�nie. Wr�� p�niej.
	};
};

