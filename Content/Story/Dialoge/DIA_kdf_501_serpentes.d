
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
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//Jak œmiesz siê do mnie odzywaæ, nowicjuszu? Wracaj do pracy!
	Info_ClearChoices(dia_serpentes_notalk);
	Info_AddChoice(dia_serpentes_notalk,"Ja tylko... (KONIEC)",dia_serpentes_notalk_exit);
	Info_AddChoice(dia_serpentes_notalk,"Mam jeszcze jedno pytanie...",dia_serpentes_notalk_question);
};

func void dia_serpentes_notalk_question()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//Mam jeszcze jedno pytanie...
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//Chyba nie rozumiesz. To ja decydujê, czy chcê z tob¹ rozmawiaæ, czy te¿ nie. Co ty sobie wyobra¿asz?
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
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//Twoja obecnoœæ tutaj to nie tylko oznaka braku szacunku, ale i g³upoty, nowicjuszu!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_YOURSTORY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 24;
	condition = dia_serpentes_yourstory_condition;
	information = dia_serpentes_yourstory_info;
	permanent = FALSE;
	description = "S³ysza³em, ¿e przeszed³eœ Próbê Ognia?";
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
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//S³ysza³em, ¿e przeszed³eœ Próbê Ognia?
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//Z ca³¹ pokor¹ muszê przyznaæ, ¿e wszyscy inni, którzy tego próbowali, ponieœli klêskê.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//Naprawdê nie powinieneœ podejmowaæ siê tej próby. Twój duch jest s³aby. Pracuj lepiej w klasztorze, a za kilka lat mo¿e zostaniesz wybrañcem.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//Mam zamiar przejœæ tê próbê.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//Jeœli Innos tego zechce, uda ci siê. W przeciwnym wypadku - jesteœ skazany na pora¿kê.
};


instance DIA_SERPENTES_TEST(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_test_condition;
	information = dia_serpentes_test_info;
	permanent = FALSE;
	description = "Mistrzu, jestem gotów poddaæ siê Próbie.";
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
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//Mistrzu, jestem gotów poddaæ siê próbie.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//Mówisz wiêc, ¿e chcesz przejœæ próbê. Jedynie najodwa¿niejszy z odwa¿nych nowicjuszy mo¿e o ni¹ prosiæ. Odwaga to jednak nie wszystko.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//Czy jesteœ dostatecznie m¹dry, by przejœæ próbê? Czy jesteœ dostatecznie silny, by stawiæ czo³o przeciwnoœciom?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//Jeœli nie, zap³acisz za to w³asnym ¿yciem.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//Pos³uchaj wiêc, co ciê czeka: w Miejscu z Kamienia szukaj tego, który siê nie narodzi³ - znajdŸ tego, którego przywo³ano.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//Pokonaj tego, który nie mo¿e zostaæ pokonany - zmierz siê z ¿yw¹ ska³¹, walcz z nieœmiertelnym kamieniem - i zniszcz go.
	Wld_InsertNpc(magicgolem,"FP_MAGICGOLEM");
	MAGIC_GOLEM = Hlp_GetNpc(magicgolem);
	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOLEM,LOG_RUNNING);
	b_logentry(TOPIC_GOLEM,"Serpentes poddaje mnie próbie. Chce, abym znalaz³ 'tego, którego onegdaj przywo³ano', ¿ywy g³az, i pokona³ go.");
};


instance DIA_SERPENTES_NOIDEA(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_noidea_condition;
	information = dia_serpentes_noidea_info;
	permanent = FALSE;
	description = "A có¿ to za stworzenie?";
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
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//¯yw¹ ska³¹... ? A có¿ to za stworzenie?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//Powiedzia³em ci ju¿ wszystko. Mo¿e próba wydaje ci siê zbyt trudna?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//Wkrótce przekonasz siê, czym jest Próba Ognia - nie odpowiem na wiêcej pytañ.
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
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//IdŸ, nowicjuszu. Wykonaj swoje zadanie.
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_SUCCESS(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 3;
	condition = dia_serpentes_success_condition;
	information = dia_serpentes_success_info;
	permanent = FALSE;
	description = "Uda³o mi siê pokonaæ golema.";
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
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//Uda³o mi siê pokonaæ golema.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//Co? Naprawdê? Przecie¿ bez m³ota Innosa nie by³byœ w stanie tego dokonaæ!
	if(Npc_IsDead(garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//Zdradzi³eœ siê! To ty zamordowa³eœ Garwiga!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//NIECH SPOTKA CIÊ KARA ZA ZAMORDOWANIE S£UGI INNOSA!!!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_HUMANMURDEREDHUMAN,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//Niemniej muszê przyznaæ, ¿e wykona³eœ powierzone ci zadanie.
	};
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//Pozwól, ¿e wezmê m³ot.
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
	description = "Czy chcia³byœ powiedzieæ mi coœ jeszcze?";
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
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//Czy chcia³byœ mi powiedzieæ coœ jeszcze?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//Nie, Bracie, nie teraz.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//OdejdŸ. Wiesz, co masz robiæ.
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
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//A dok³adniej?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//Przynale¿noœæ do Bractwa Ognia niesie ze sob¹ wielk¹ odpowiedzialnoœæ. S¹ pewne obowi¹zki, które ka¿dy z nas musi wype³niaæ.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//Jak wiesz, nasz koœció³ zajmuje siê nie tylko sprawami magii - jest równie¿ najwy¿szym organem w³adzy s¹downiczej.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//Wydarzenia ostatnich dni zaleg³y nam na sercu ogromnym ciê¿arem, a problem ten musi zostaæ rozwi¹zany raz na zawsze.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"Nie mam czasu na takie drobiazgi. ZnajdŸ sobie kogoœ innego.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"O co chodzi?",dia_serpentes_minenanteile_was);
		Info_AddChoice(dia_serpentes_minenanteile,"Czy stra¿ miejska nie powinna siê tym zaj¹æ?",dia_serpentes_minenanteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//Najemnik taki jak ty by³by tu bardzo przydatny.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"Nie mam czasu na takie drobiazgi. ZnajdŸ sobie kogoœ innego.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"To kogo mam zlikwidowaæ?",dia_serpentes_minenanteile_killsld);
	};
};

func void dia_serpentes_minenanteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//Czy stra¿ miejska nie powinna siê tym zaj¹æ?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//Stra¿ odpowiada za bezpieczeñstwo w mieœcie. Ta sprawa wykracza daleko poza jej jurysdykcjê.
};

func void dia_serpentes_minenanteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//Nie mam czasu na takie drobiazgi. ZnajdŸ sobie kogoœ innego.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_01");	//To oburzaj¹ce. Jeœli nie bêdziesz wykonywa³ zleceñ Bractwa, wy¿sze krêgi magii na zawsze pozostan¹ dla ciebie tajemnic¹.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//Udzielam ci nagany. Mam nadziejê, ¿e podobna sytuacja ju¿ siê nie powtórzy - inaczej Ÿle siê to dla ciebie skoñczy.
	AI_StopProcessInfos(self);
};

func void dia_serpentes_minenanteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//O co dok³adnie chodzi?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//Ktoœ w mieœcie sprzedaje fa³szywe udzia³y w kopalniach rudy znajduj¹cych siê w by³ej kolonii karnej.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//Udzia³y te nie przedstawiaj¹ ¿adnej wartoœci. Mimo to mog¹ staæ siê zarzewiem konfliktów wœród ludnoœci. Na to zaœ nie mo¿emy sobie pozwoliæ.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//Dosz³y mnie s³uchy, ¿e oszustowi uda³o siê dotrzeæ do kilku najbardziej wp³ywowych kupców w mieœcie i kraju. Ba! Zdo³a³ im nawet sprzedaæ fa³szywe udzia³y!
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//Musisz odnaleŸæ tego z³oczyñcê i doprowadziæ go przed nasze oblicze. W tak ciê¿kich czasach nie mo¿emy pozwoliæ, by oszuœci i hochsztaplerzy czuli siê bezkarni.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//Niech kara, jaka go spotka, bêdzie ostrze¿eniem dla reszty zuchwalców.
	Info_AddChoice(dia_serpentes_minenanteile,"Postaram siê zaj¹æ t¹ spraw¹.",dia_serpentes_minenanteile_was_ja);
};

func void dia_serpentes_minenanteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//Postaram siê zaj¹æ t¹ spraw¹.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//Jest jeszcze coœ. Kupcy nie powinni siê dowiedzieæ, ¿e interesuje ciê sprawa udzia³ów w kopalniach.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//Jeœli dowiedz¹ siê, ¿e dzia³asz w imieniu koœcio³a, nie bêd¹ ci chcieli zaproponowaæ takiego towaru. Chyba to rozumiesz?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//Rozumiem.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//W takim razie bierz siê do pracy, Bracie. ¯yczê szczêœcia.
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
	b_logentry(TOPIC_MINENANTEILE,"Ktoœ sprzedaje fa³szywe udzia³y w kopalni rudy. Muszê siê dowiedzieæ, u kogo zaopatruj¹ siê miejscowi kupcy, a Serpentes chce dostaæ wszystkie nielegalne udzia³y.");
};

func void dia_serpentes_minenanteile_killsld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//To kogo mam zlikwidowaæ?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//Na Innosa! Nikogo! Ta sprawa wymaga nieco delikatnoœci, nie rozwi¹zañ si³owych.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//Salandril, alchemik z górnego miasta, dopuœci³ siê powa¿nych przestêpstw i musi zostaæ ukarany.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//Mimo to odmawia stawienia siê w klasztorze na swój proces. PrzyprowadŸ go tutaj.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//Nie ma znaczenia, jak tego dokonasz. Za swe starania zostaniesz oczywiœcie odpowiednio wynagrodzony.
	Info_AddChoice(dia_serpentes_minenanteile,"Czy stra¿ miejska nie powinna siê tym zaj¹æ?",dia_serpentes_minenanteile_miliz);
	Info_AddChoice(dia_serpentes_minenanteile,"¯aden problem. Zajmê siê tym.",dia_serpentes_minenanteile_was_jasld);
};


var int mis_serpentes_bringsalandril_sld;

func void dia_serpentes_minenanteile_was_jasld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//¯aden problem. Zajmê siê tym.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//Doskonale. Do zobaczenia za kilka dni.
	MIS_SERPENTES_BRINGSALANDRIL_SLD = LOG_RUNNING;
	Info_ClearChoices(dia_serpentes_minenanteile);
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"Mam przyprowadziæ Salandrila - alchemika z górnego miasta Khorinis - do klasztoru, gdzie zostanie os¹dzony. Nie interesuje mnie, jakie pope³ni³ wykroczenie, o ile dostanê swoj¹ zap³atê.");
};


instance DIA_SERPENTES_MINENANTEILEBRINGEN(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 2;
	condition = dia_serpentes_minenanteilebringen_condition;
	information = dia_serpentes_minenanteilebringen_info;
	permanent = TRUE;
	description = "Co do tych fa³szywych udzia³ów w kopalni...";
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
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//Odzyska³em jeden z udzia³ów w kopalni.
		b_giveplayerxp(XP_BRINGSERPENTESMINENANTEIL);
		b_giveinvitems(other,self,itwr_minenanteil_mis,1);
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//Uda³o mi siê odzyskaæ kilka udzia³ów w kopalni.
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
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//Doskonale. Nale¿y je jak najszybciej wycofaæ z obiegu. Przynieœ je wszystkie do mnie.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//Proszê. Zapewniê ci niezbêdne œrodki.
	}
	else if(SERPENTESMINENANTEILCOUNTER == SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//Myœlê, ¿e to ju¿ wszystkie.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//Doskonale, zas³u¿y³eœ na nagrodê.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//WeŸ ten ochronny amulet. Na pewno przyda ci siê w twoich dalszych wyprawach.
		CreateInvItems(self,itam_prot_mage_01,1);
		b_giveinvitems(self,other,itam_prot_mage_01,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//To ju¿ chyba ostatni, prawda?
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
	description = "Wiem, kto wprowadzi³ fa³szywe udzia³y do obrotu.";
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
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//Wiem, kto wprowadzi³ fa³szywe udzia³y do obrotu. To Salandril, alchemik z górnego miasta.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//PrzyprowadŸ go tutaj. Musimy z nim powa¿nie porozmawiaæ.
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
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//Dobra robota. Zajmiemy siê nim póŸniej.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//Oto twoja nagroda. I pamiêtaj, nikomu ani s³owa.
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
	description = "Salandril nie ¿yje.";
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
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//Salandril nie ¿yje.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//Có¿, jego wystêpki zosta³y ukarane. Niech Innos zlituje siê nad dusz¹ tego nieszczêœnika.
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

