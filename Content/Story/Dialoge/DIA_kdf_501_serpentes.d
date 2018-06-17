
instance DIA_SERPENTES_KAP1_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap1_exit_condition;
	information = dia_serpentes_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOTALK(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_notalk_condition;
	information = dia_serpentes_notalk_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_serpentes_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_notalk_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//Jak �miesz si� do mnie odzywa�, nowicjuszu? Wracaj do pracy!
	Info_ClearChoices(dia_serpentes_notalk);
	Info_AddChoice(dia_serpentes_notalk,"Ja tylko... (KONIEC)",dia_serpentes_notalk_exit);
	Info_AddChoice(dia_serpentes_notalk,"Mam jeszcze jedno pytanie...",dia_serpentes_notalk_question);
};

func void dia_serpentes_notalk_question()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//Mam jeszcze jedno pytanie...
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//Chyba nie rozumiesz. To ja decyduj�, czy chc� z tob� rozmawia�, czy te� nie. Co ty sobie wyobra�asz?
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_02");	//A teraz wracaj do pracy!
	AI_StopProcessInfos(self);
};

func void dia_serpentes_notalk_exit()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_GOAWAY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_goaway_condition;
	information = dia_serpentes_goaway_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_goaway_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_notalk) && Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_goaway_info()
{
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//Twoja obecno�� tutaj to nie tylko oznaka braku szacunku, ale i g�upoty, nowicjuszu!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_YOURSTORY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 24;
	condition = dia_serpentes_yourstory_condition;
	information = dia_serpentes_yourstory_info;
	permanent = FALSE;
	description = "S�ysza�em, �e przeszed�e� Pr�b� Ognia?";
};


func int dia_serpentes_yourstory_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_test) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(hero,dia_pyrokar_magican) == FALSE) && (MIS_GOLEM != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_serpentes_yourstory_info()
{
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//S�ysza�em, �e przeszed�e� Pr�b� Ognia?
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//Z ca�� pokor� musz� przyzna�, �e wszyscy inni, kt�rzy tego pr�bowali, ponie�li kl�sk�.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//Naprawd� nie powiniene� podejmowa� si� tej pr�by. Tw�j duch jest s�aby. Pracuj lepiej w klasztorze, a za kilka lat mo�e zostaniesz wybra�cem.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//Mam zamiar przej�� t� pr�b�.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//Je�li Innos tego zechce, uda ci si�. W przeciwnym wypadku - jeste� skazany na pora�k�.
};


instance DIA_SERPENTES_TEST(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_test_condition;
	information = dia_serpentes_test_info;
	permanent = FALSE;
	description = "Mistrzu, jestem got�w podda� si� Pr�bie.";
};


func int dia_serpentes_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_test_info()
{
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//Mistrzu, jestem got�w podda� si� pr�bie.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//M�wisz wi�c, �e chcesz przej�� pr�b�. Jedynie najodwa�niejszy z odwa�nych nowicjuszy mo�e o ni� prosi�. Odwaga to jednak nie wszystko.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//Czy jeste� dostatecznie m�dry, by przej�� pr�b�? Czy jeste� dostatecznie silny, by stawi� czo�o przeciwno�ciom?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//Je�li nie, zap�acisz za to w�asnym �yciem.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//Pos�uchaj wi�c, co ci� czeka: w Miejscu z Kamienia szukaj tego, kt�ry si� nie narodzi� - znajd� tego, kt�rego przywo�ano.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//Pokonaj tego, kt�ry nie mo�e zosta� pokonany - zmierz si� z �yw� ska��, walcz z nie�miertelnym kamieniem - i zniszcz go.
	Wld_InsertNpc(magicgolem,"FP_MAGICGOLEM");
	MAGIC_GOLEM = Hlp_GetNpc(magicgolem);
	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOLEM,LOG_RUNNING);
	b_logentry(TOPIC_GOLEM,"Serpentes poddaje mnie pr�bie. Chce, abym znalaz� 'tego, kt�rego onegdaj przywo�ano', �ywy g�az, i pokona� go.");
};


instance DIA_SERPENTES_NOIDEA(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_noidea_condition;
	information = dia_serpentes_noidea_info;
	permanent = FALSE;
	description = "A c� to za stworzenie?";
};


func int dia_serpentes_noidea_condition()
{
	if((MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_noidea_info()
{
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//�yw� ska��... ? A c� to za stworzenie?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//Powiedzia�em ci ju� wszystko. Mo�e pr�ba wydaje ci si� zbyt trudna?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//Wkr�tce przekonasz si�, czym jest Pr�ba Ognia - nie odpowiem na wi�cej pyta�.
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOHELP(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_nohelp_condition;
	information = dia_serpentes_nohelp_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_nohelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_noidea) && (Npc_IsDead(magic_golem) == FALSE) && (MIS_GOLEM == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((Npc_KnowsInfo(other,dia_ulthar_test) == FALSE) || Npc_KnowsInfo(other,dia_serpentes_yourstory)))
	{
		return TRUE;
	};
};

func void dia_serpentes_nohelp_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//Id�, nowicjuszu. Wykonaj swoje zadanie.
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_SUCCESS(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 3;
	condition = dia_serpentes_success_condition;
	information = dia_serpentes_success_info;
	permanent = FALSE;
	description = "Uda�o mi si� pokona� golema.";
};


func int dia_serpentes_success_condition()
{
	if(Npc_IsDead(magicgolem) && (MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_success_info()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc(nov_608_garwig);
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//Uda�o mi si� pokona� golema.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//Co? Naprawd�? Przecie� bez m�ota Innosa nie by�by� w stanie tego dokona�!
	if(Npc_IsDead(garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//Zdradzi�e� si�! To ty zamordowa�e� Garwiga!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//NIECH SPOTKA CI� KARA ZA ZAMORDOWANIE S�UGI INNOSA!!!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_HUMANMURDEREDHUMAN,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//Niemniej musz� przyzna�, �e wykona�e� powierzone ci zadanie.
	};
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//Pozw�l, �e wezm� m�ot.
		Npc_RemoveInvItems(other,holy_hammer_mis,1);
		Wld_InsertItem(holy_hammer_mis,"FP_HAMMER");
	};
	MIS_GOLEM = LOG_SUCCESS;
	b_giveplayerxp(XP_GOLEM);
};


instance DIA_SERPENTES_PERM(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 99;
	condition = dia_serpentes_perm_condition;
	information = dia_serpentes_perm_info;
	permanent = TRUE;
	description = "Czy chcia�by� powiedzie� mi co� jeszcze?";
};


func int dia_serpentes_perm_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_serpentes_success))
	{
		return TRUE;
	};
};

func void dia_serpentes_perm_info()
{
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//Czy chcia�by� mi powiedzie� co� jeszcze?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//Nie, Bracie, nie teraz.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//Odejd�. Wiesz, co masz robi�.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP2_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap2_exit_condition;
	information = dia_serpentes_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP3_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap3_exit_condition;
	information = dia_serpentes_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_MINENANTEILE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 30;
	condition = dia_serpentes_minenanteile_condition;
	information = dia_serpentes_minenanteile_info;
	important = TRUE;
};


func int dia_serpentes_minenanteile_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_serpentes_minenanteile_info()
{
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_00");	//Nie tak szybko, mam dla ciebie kolejne zadanie.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//A dok�adniej?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//Przynale�no�� do Bractwa Ognia niesie ze sob� wielk� odpowiedzialno��. S� pewne obowi�zki, kt�re ka�dy z nas musi wype�nia�.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//Jak wiesz, nasz ko�ci� zajmuje si� nie tylko sprawami magii - jest r�wnie� najwy�szym organem w�adzy s�downiczej.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//Wydarzenia ostatnich dni zaleg�y nam na sercu ogromnym ci�arem, a problem ten musi zosta� rozwi�zany raz na zawsze.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"Nie mam czasu na takie drobiazgi. Znajd� sobie kogo� innego.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"O co chodzi?",dia_serpentes_minenanteile_was);
		Info_AddChoice(dia_serpentes_minenanteile,"Czy stra� miejska nie powinna si� tym zaj��?",dia_serpentes_minenanteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//Najemnik taki jak ty by�by tu bardzo przydatny.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"Nie mam czasu na takie drobiazgi. Znajd� sobie kogo� innego.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"To kogo mam zlikwidowa�?",dia_serpentes_minenanteile_killsld);
	};
};

func void dia_serpentes_minenanteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//Czy stra� miejska nie powinna si� tym zaj��?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//Stra� odpowiada za bezpiecze�stwo w mie�cie. Ta sprawa wykracza daleko poza jej jurysdykcj�.
};

func void dia_serpentes_minenanteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//Nie mam czasu na takie drobiazgi. Znajd� sobie kogo� innego.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_01");	//To oburzaj�ce. Je�li nie b�dziesz wykonywa� zlece� Bractwa, wy�sze kr�gi magii na zawsze pozostan� dla ciebie tajemnic�.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//Udzielam ci nagany. Mam nadziej�, �e podobna sytuacja ju� si� nie powt�rzy - inaczej �le si� to dla ciebie sko�czy.
	AI_StopProcessInfos(self);
};

func void dia_serpentes_minenanteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//O co dok�adnie chodzi?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//Kto� w mie�cie sprzedaje fa�szywe udzia�y w kopalniach rudy znajduj�cych si� w by�ej kolonii karnej.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//Udzia�y te nie przedstawiaj� �adnej warto�ci. Mimo to mog� sta� si� zarzewiem konflikt�w w�r�d ludno�ci. Na to za� nie mo�emy sobie pozwoli�.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//Dosz�y mnie s�uchy, �e oszustowi uda�o si� dotrze� do kilku najbardziej wp�ywowych kupc�w w mie�cie i kraju. Ba! Zdo�a� im nawet sprzeda� fa�szywe udzia�y!
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//Musisz odnale�� tego z�oczy�c� i doprowadzi� go przed nasze oblicze. W tak ci�kich czasach nie mo�emy pozwoli�, by oszu�ci i hochsztaplerzy czuli si� bezkarni.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//Niech kara, jaka go spotka, b�dzie ostrze�eniem dla reszty zuchwalc�w.
	Info_AddChoice(dia_serpentes_minenanteile,"Postaram si� zaj�� t� spraw�.",dia_serpentes_minenanteile_was_ja);
};

func void dia_serpentes_minenanteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//Postaram si� zaj�� t� spraw�.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//Jest jeszcze co�. Kupcy nie powinni si� dowiedzie�, �e interesuje ci� sprawa udzia��w w kopalniach.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//Je�li dowiedz� si�, �e dzia�asz w imieniu ko�cio�a, nie b�d� ci chcieli zaproponowa� takiego towaru. Chyba to rozumiesz?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//Rozumiem.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//W takim razie bierz si� do pracy, Bracie. �ycz� szcz�cia.
	Info_ClearChoices(dia_serpentes_minenanteile);
	MIS_SERPENTES_MINENANTEIL_KDF = LOG_RUNNING;
	if(Npc_IsDead(salandril) == FALSE)
	{
		CreateInvItems(salandril,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(vlk_416_matteo) == FALSE)
	{
		CreateInvItems(vlk_416_matteo,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_413_bosper) == FALSE)
	{
		CreateInvItems(vlk_413_bosper,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_409_zuris) == FALSE)
	{
		CreateInvItems(vlk_409_zuris,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_911_elena) == FALSE)
	{
		CreateInvItems(bau_911_elena,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		CreateInvItems(bau_970_orlan,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_407_hakon) == FALSE)
	{
		CreateInvItems(vlk_407_hakon,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_936_rosi) == FALSE)
	{
		CreateInvItems(bau_936_rosi,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_468_canthar) == FALSE)
	{
		CreateInvItems(vlk_468_canthar,itwr_minenanteil_mis,3);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 3;
	};
	SALANDRILVERTEILTEMINENANTEIL = SALANDRILMINENANTEIL_MAINCOUNTER;
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"Kto� sprzedaje fa�szywe udzia�y w kopalni rudy. Musz� si� dowiedzie�, u kogo zaopatruj� si� miejscowi kupcy, a Serpentes chce dosta� wszystkie nielegalne udzia�y.");
};

func void dia_serpentes_minenanteile_killsld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//To kogo mam zlikwidowa�?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//Na Innosa! Nikogo! Ta sprawa wymaga nieco delikatno�ci, nie rozwi�za� si�owych.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//Salandril, alchemik z g�rnego miasta, dopu�ci� si� powa�nych przest�pstw i musi zosta� ukarany.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//Mimo to odmawia stawienia si� w klasztorze na sw�j proces. Przyprowad� go tutaj.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//Nie ma znaczenia, jak tego dokonasz. Za swe starania zostaniesz oczywi�cie odpowiednio wynagrodzony.
	Info_AddChoice(dia_serpentes_minenanteile,"Czy stra� miejska nie powinna si� tym zaj��?",dia_serpentes_minenanteile_miliz);
	Info_AddChoice(dia_serpentes_minenanteile,"�aden problem. Zajm� si� tym.",dia_serpentes_minenanteile_was_jasld);
};


var int mis_serpentes_bringsalandril_sld;

func void dia_serpentes_minenanteile_was_jasld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//�aden problem. Zajm� si� tym.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//Doskonale. Do zobaczenia za kilka dni.
	MIS_SERPENTES_BRINGSALANDRIL_SLD = LOG_RUNNING;
	Info_ClearChoices(dia_serpentes_minenanteile);
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"Mam przyprowadzi� Salandrila - alchemika z g�rnego miasta Khorinis - do klasztoru, gdzie zostanie os�dzony. Nie interesuje mnie, jakie pope�ni� wykroczenie, o ile dostan� swoj� zap�at�.");
};


instance DIA_SERPENTES_MINENANTEILEBRINGEN(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 2;
	condition = dia_serpentes_minenanteilebringen_condition;
	information = dia_serpentes_minenanteilebringen_info;
	permanent = TRUE;
	description = "Co do tych fa�szywych udzia��w w kopalni...";
};


func int dia_serpentes_minenanteilebringen_condition()
{
	if((MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_HasItems(other,itwr_minenanteil_mis) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int serpentesminenanteilcounter;

func void dia_serpentes_minenanteilebringen_info()
{
	var int serpentesminenanteilcount;
	var int xp_bringserpentesminenanteils;
	var int serpentesminenanteiloffer;
	var int serpentesminenanteilgeld;
	var string minenanteiltext;
	var string minenanteilleft;
	serpentesminenanteilcount = Npc_HasItems(other,itwr_minenanteil_mis);
	serpentesminenanteiloffer = 200;
	if(serpentesminenanteilcount == 1)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//Odzyska�em jeden z udzia��w w kopalni.
		b_giveplayerxp(XP_BRINGSERPENTESMINENANTEIL);
		b_giveinvitems(other,self,itwr_minenanteil_mis,1);
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//Uda�o mi si� odzyska� kilka udzia��w w kopalni.
		b_giveinvitems(other,self,itwr_minenanteil_mis,serpentesminenanteilcount);
		xp_bringserpentesminenanteils = serpentesminenanteilcount * XP_BRINGSERPENTESMINENANTEIL;
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + serpentesminenanteilcount;
		b_giveplayerxp(xp_bringserpentesminenanteils);
	};
	SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER - serpentesminenanteilcount;
	minenanteilleft = IntToString(SALANDRILMINENANTEIL_MAINCOUNTER);
	minenanteiltext = ConcatStrings(minenanteilleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(minenanteiltext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	if(SERPENTESMINENANTEILCOUNTER < SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//Doskonale. Nale�y je jak najszybciej wycofa� z obiegu. Przynie� je wszystkie do mnie.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//Prosz�. Zapewni� ci niezb�dne �rodki.
	}
	else if(SERPENTESMINENANTEILCOUNTER == SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//My�l�, �e to ju� wszystkie.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//Doskonale, zas�u�y�e� na nagrod�.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//We� ten ochronny amulet. Na pewno przyda ci si� w twoich dalszych wyprawach.
		CreateInvItems(self,itam_prot_mage_01,1);
		b_giveinvitems(self,other,itam_prot_mage_01,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//To ju� chyba ostatni, prawda?
	};
	serpentesminenanteilgeld = serpentesminenanteilcount * serpentesminenanteiloffer;
	CreateInvItems(self,itmi_gold,serpentesminenanteilgeld);
	b_giveinvitems(self,other,itmi_gold,serpentesminenanteilgeld);
};


instance DIA_SERPENTES_GOTSALANDRIL(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 32;
	condition = dia_serpentes_gotsalandril_condition;
	information = dia_serpentes_gotsalandril_info;
	description = "Wiem, kto wprowadzi� fa�szywe udzia�y do obrotu.";
};


func int dia_serpentes_gotsalandril_condition()
{
	if((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_serpentes_gotsalandril_info()
{
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//Wiem, kto wprowadzi� fa�szywe udzia�y do obrotu. To Salandril, alchemik z g�rnego miasta.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//Przyprowad� go tutaj. Musimy z nim powa�nie porozmawia�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_SALANDRILHERE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrilhere_condition;
	information = dia_serpentes_salandrilhere_info;
	description = "Salandril jest tutaj, w klasztorze.";
};


func int dia_serpentes_salandrilhere_condition()
{
	if(Npc_GetDistToWP(salandril,"ALTAR") < 10000)
	{
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(other,dia_serpentes_gotsalandril) && (hero.guild == GIL_KDF))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func void dia_serpentes_salandrilhere_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilHERE_15_00");	//Salandril jest tutaj, w klasztorze.
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//Dobra robota. Zajmiemy si� nim p�niej.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//Oto twoja nagroda. I pami�taj, nikomu ani s�owa.
		CreateInvItems(self,itmi_gold,400);
		b_giveinvitems(self,other,itmi_gold,400);
	};
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_SALANDRILINKLOSTER);
};


instance DIA_SERPENTES_SALANDRILDEAD(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrildead_condition;
	information = dia_serpentes_salandrildead_info;
	description = "Salandril nie �yje.";
};


func int dia_serpentes_salandrildead_condition()
{
	if((Npc_KnowsInfo(other,dia_serpentes_gotsalandril) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING))) && Npc_IsDead(salandril))
	{
		return TRUE;
	};
};

func void dia_serpentes_salandrildead_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//Salandril nie �yje.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//C�, jego wyst�pki zosta�y ukarane. Niech Innos zlituje si� nad dusz� tego nieszcz�nika.
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_KAP4_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap4_exit_condition;
	information = dia_serpentes_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP5_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap5_exit_condition;
	information = dia_serpentes_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_PICKPOCKET(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 900;
	condition = dia_serpentes_pickpocket_condition;
	information = dia_serpentes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_serpentes_pickpocket_condition()
{
	return c_beklauen(86,380);
};

func void dia_serpentes_pickpocket_info()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_BACK,dia_serpentes_pickpocket_back);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_PICKPOCKET,dia_serpentes_pickpocket_doit);
};

func void dia_serpentes_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_serpentes_pickpocket);
};

func void dia_serpentes_pickpocket_back()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
};

