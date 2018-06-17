
instance DIA_SEKOB_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_exit_condition;
	information = dia_sekob_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_sekob_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_HALLO(C_INFO)
{
	npc = bau_930_sekob;
	nr = 3;
	condition = dia_sekob_hallo_condition;
	information = dia_sekob_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sekob_hallo_condition()
{
	if((KAPITEL < 3) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_hallo_info()
{
	AI_Output(self,other,"DIA_Sekob_HALLO_01_00");	//Czego szukasz na mojej ziemi? Nie ma tu nawet co ukraœæ. Wynocha.
	AI_Output(other,self,"DIA_Sekob_HALLO_15_01");	//Czy w tym kraju jest choæ skrawek ziemi, który do nikogo nie nale¿y?
	AI_Output(self,other,"DIA_Sekob_HALLO_01_02");	//ZnajdŸ sobie pracê, mo¿e wtedy, pewnego dnia, i ty dorobisz siê swojego kawa³ka ziemi. Póki co idŸ siê pow³óczyæ gdzie indziej.
};


instance DIA_SEKOB_PERMVORMIS(C_INFO)
{
	npc = bau_930_sekob;
	nr = 3;
	condition = dia_sekob_permvormis_condition;
	information = dia_sekob_permvormis_info;
	permanent = TRUE;
	description = "Pos³uchaj...";
};


func int dia_sekob_permvormis_condition()
{
	if((KAPITEL < 3) && (MIS_TORLOF_HOLPACHTVONSEKOB == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_permvormis_info()
{
	AI_Output(other,self,"DIA_Sekob_PermVorMis_15_00");	//Pos³uchaj...
	AI_Output(self,other,"DIA_Sekob_PermVorMis_01_01");	//Nie mam w tej chwili ¿adnej pracy dla ciebie.
};


instance DIA_SEKOB_ZAHLPACHT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_zahlpacht_condition;
	information = dia_sekob_zahlpacht_info;
	permanent = FALSE;
	description = "Onar chce, ¿ebyœ w koñcu zap³aci³ czynsz.";
};


func int dia_sekob_zahlpacht_condition()
{
	if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_sekob_zahlpacht_info()
{
	AI_Output(other,self,"DIA_Sekob_ZAHLPACHT_15_00");	//Ta ziemia nale¿y do Onara, ty j¹ tylko wynajmujesz. Musisz zap³aciæ czynsz. Zalegasz ju¿ za kilka tygodni.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_01");	//Co? I przys³a³ tu takiego zbira? Sam w to chyba nie wierzysz.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_02");	//Wynoœ siê, nim stracê panowanie nad sob¹.
	self.aivar[AIV_DEFEATEDBYPLAYER] = FALSE;
};


instance DIA_SEKOB_KOHLERAUS(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_kohleraus_condition;
	information = dia_sekob_kohleraus_info;
	permanent = TRUE;
	description = "Oddawaj kasê albo porachujê ci koœci.";
};


func int dia_sekob_kohleraus_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_kohleraus_info()
{
	AI_Output(other,self,"DIA_Sekob_KohleRaus_15_00");	//Oddawaj kasê albo porachujê ci koœci.
	AI_Output(self,other,"DIA_Sekob_KohleRaus_01_01");	//Nie dostaniesz moich pieniêdzy, zbóju. NIE TY!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SEKOB_INFORMONAR(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_informonar_condition;
	information = dia_sekob_informonar_info;
	permanent = FALSE;
	description = "Có¿, w takim razie bêdê musia³ poinformowaæ o tym Onara.";
};


func int dia_sekob_informonar_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_informonar_info()
{
	AI_Output(other,self,"DIA_Sekob_InformOnar_15_00");	//Có¿, w takim razie bêdê musia³ poinformowaæ o tym Onara.
	AI_Output(self,other,"DIA_Sekob_InformOnar_01_01");	//Nic mnie to nie obchodzi! Powiedz Onarowi, ¿e nic nie mam. To zreszt¹ smutna prawda.
	MIS_SEKOB_REDEMITONAR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_DEFEATED(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_defeated_condition;
	information = dia_sekob_defeated_info;
	permanent = FALSE;
	description = "Gdzieœ schowa³ pieni¹dze!?!";
};


func int dia_sekob_defeated_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) && Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (SEKOB_PACHTBEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_defeated_info()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_15_00");	//Gdzieœ schowa³eœ pieni¹dze!?!
	AI_Output(self,other,"DIA_Sekob_Defeated_01_01");	//Nie bij mnie, proszê. Zrobiê, co tylko ka¿esz.
	AI_Output(other,self,"DIA_Sekob_Defeated_15_02");	//Zap³aæ wiec zaleg³y czynsz.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_03");	//Ale¿ Panie no, nie mam ni miedziaka. Jestem zag³odzonym biedakiem.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_04");	//Ostatnie zbiory zniszczy³a susza. CHCÊ zap³aciæ czynsz, ale NIE MAM czym. Miej¿e litoœæ.
	Info_ClearChoices(dia_sekob_defeated);
	Info_AddChoice(dia_sekob_defeated,"P³aæ albo po¿egnasz siê z ¿yciem.",dia_sekob_defeated_hart);
	Info_AddChoice(dia_sekob_defeated,"W porz¹dku, pogadam z Onarem.",dia_sekob_defeated_weich);
};

func void dia_sekob_defeated_weich()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_weich_15_00");	//W porz¹dku, pogadam z Onarem.
	AI_Output(self,other,"DIA_Sekob_Defeated_weich_01_01");	//Dziêkujê Panie, po tysi¹ckroæ dziêkujê!
	MIS_SEKOB_REDEMITONAR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

func void b_sekob_kassieren()
{
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_00");	//Daruj sobie tê gadkê. Deszcz pada tu niemal bez przerwy, a i twoje spi¿arnie pustkami nie œwiec¹. P³aæ albo po¿egnasz siê z ¿yciem.
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_01");	//Nie no, proszê, weŸ z³oto. Zap³acê nawet wiêcej, ale nie zabijaj mnie.
	b_giveinvitems(self,other,itmi_gold,60);
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_02");	//No widzisz. Nie by³o tak Ÿle.
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_03");	//Jestem zrujnowany.
	SEKOB_PACHTBEZAHLT = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_sekob_defeated_hart()
{
	b_sekob_kassieren();
};


instance DIA_SEKOB_AGAIN(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_again_condition;
	information = dia_sekob_again_info;
	permanent = TRUE;
	description = "Jeœli chodzi o czynsz...";
};


func int dia_sekob_again_condition()
{
	if((MIS_SEKOB_REDEMITONAR == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sekob_defeated) && (SEKOB_PACHTBEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_again_info()
{
	AI_Output(other,self,"DIA_Sekob_Again_15_00");	//Jeœli chodzi o czynsz...
	AI_Output(self,other,"DIA_Sekob_Again_01_01");	//Porozmawiasz z Onarem, prawda?
	Info_ClearChoices(dia_sekob_again);
	Info_AddChoice(dia_sekob_again,"Rozmyœli³em siê.",dia_sekob_again_nein);
	if(ONAR_WEGENSEKOB == TRUE)
	{
		Info_AddChoice(dia_sekob_again,"Ju¿ to zrobi³em...",dia_sekob_again_verarscht);
	}
	else
	{
		Info_AddChoice(dia_sekob_again,"Jasne.",dia_sekob_again_ja);
	};
};

func void dia_sekob_again_nein()
{
	AI_Output(other,self,"DIA_Sekob_Again_Nein_15_00");	//Rozmyœli³em siê.
	b_sekob_kassieren();
};

func void dia_sekob_again_ja()
{
	AI_Output(other,self,"DIA_Sekob_Again_Ja_15_00");	//Oczywiœcie.
	AI_Output(self,other,"DIA_Sekob_Again_Ja_01_01");	//Proszê, zrób to.
	AI_StopProcessInfos(self);
};

func void dia_sekob_again_verarscht()
{
	MIS_SEKOB_REDEMITONAR = LOG_SUCCESS;
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_00");	//Ju¿ to zrobi³em...
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_01");	//I co? Co powiedzia³?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_02");	//Przykro mi, ale muszê ciê zabiæ.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_03");	//Ale dlaczego? Có¿ ja takiego zrobi³em?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_04");	//Zrobi³eœ ze mnie idiotê.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_05");	//Powiedzia³em prawdê - przysiêgam!
	b_sekob_kassieren();
};


instance DIA_SEKOB_PERMKAP1(C_INFO)
{
	npc = bau_930_sekob;
	nr = 6;
	condition = dia_sekob_permkap1_condition;
	information = dia_sekob_permkap1_info;
	permanent = TRUE;
	description = "Nastêpnym razem p³aæ na czas, zrozumiano?";
};


func int dia_sekob_permkap1_condition()
{
	if((SEKOB_PACHTBEZAHLT == TRUE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_sekob_permkap1_info()
{
	AI_Output(other,self,"DIA_Sekob_PERMKAP1_15_00");	//Nastêpnym razem p³aæ na czas, zrozumiano?
	AI_Output(self,other,"DIA_Sekob_PERMKAP1_01_01");	//Czym sobie na to zas³u¿y³em...
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_KAP3_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap3_exit_condition;
	information = dia_sekob_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_sekob_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_DMT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 30;
	condition = dia_sekob_dmt_condition;
	information = dia_sekob_dmt_info;
	description = "Czy coœ siê sta³o?";
};


func int dia_sekob_dmt_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_sekob_dmt_info()
{
	AI_Output(other,self,"DIA_Sekob_DMT_15_00");	//Czy coœ siê sta³o?
	AI_Output(self,other,"DIA_Sekob_DMT_01_01");	//Musisz mi pomóc. Ludzie w czarnych szatach w³amali siê do mojego domu.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_02");	//Stra¿ królewska powinna dbaæ o bezpieczeñstwo wszystkich mieszkañców, nie mam racji?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_03");	//Wiem, ¿e was, najemników, nie staæ na dobre serce, ale ja zap³acê...
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04");	//Musisz mi pomóc, magu.
	};
	AI_Output(self,other,"DIA_Sekob_DMT_01_05");	//Ci ludzi mówili, ¿e czegoœ szukaj¹. Ale nie w moim domu.
	AI_Output(self,other,"DIA_Sekob_DMT_01_06");	//Proszê, pomó¿ mi! Spraw, by st¹d odeszli!
	Log_CreateTopic(TOPIC_SEKOBDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SEKOBDMT,LOG_RUNNING);
	b_logentry(TOPIC_SEKOBDMT,"Czarni magowie wygnali Sekoba z domu. Sekob prosi mnie, abym siê ich pozby³.");
};


instance DIA_SEKOB_DMTWEG(C_INFO)
{
	npc = bau_930_sekob;
	nr = 31;
	condition = dia_sekob_dmtweg_condition;
	information = dia_sekob_dmtweg_info;
	description = "Twój dom jest pusty.";
};


func int dia_sekob_dmtweg_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_sekob_dmt) && Npc_IsDead(dmt_dementorambientsekob1) && Npc_IsDead(dmt_dementorambientsekob2) && Npc_IsDead(dmt_dementorambientsekob3) && Npc_IsDead(dmt_dementorambientsekob4))
	{
		return TRUE;
	};
};

func void dia_sekob_dmtweg_info()
{
	AI_Output(other,self,"DIA_Sekob_DMTWEG_15_00");	//Twój dom jest pusty. Ludzie w czarnych kapturach odeszli.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_01");	//Wiedzia³em, ¿e na stra¿nika zawsze mo¿na liczyæ.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_02");	//Wspaniale siê spisa³eœ. Onar powinien siê cieszyæ, ¿e pracuj¹ dla niego ludzie tacy jak ty.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_03");	//Dziêkujê ci Panie Magu. Gdyby nie potê¿ni kap³ani, bylibyœmy zgubieni.
	};
	TOPIC_END_SEKOBDMT = TRUE;
	b_giveplayerxp(XP_SEKOBDMTWEG);
	if(KAPITEL < 5)
	{
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Obsessed");
	};
	if(ROSI_FLEEFROMSEKOB_KAP5 == FALSE)
	{
		b_startotherroutine(rosi,"Start");
		b_startotherroutine(till,"Start");
	};
	b_startotherroutine(balthasar,"Start");
	b_startotherroutine(bau_933_rega,"Start");
	b_startotherroutine(bau_934_babera,"Start");
	b_startotherroutine(bau_937_bauer,"Start");
	b_startotherroutine(bau_938_bauer,"Start");
};


instance DIA_SEKOB_BELOHNUNG(C_INFO)
{
	npc = bau_930_sekob;
	nr = 32;
	condition = dia_sekob_belohnung_condition;
	information = dia_sekob_belohnung_info;
	description = "Nie tak szybko, przyjacielu.";
};


func int dia_sekob_belohnung_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_dmtweg) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_sekob_belohnung_info()
{
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_00");	//Nie tak szybko, przyjacielu.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu))
		{
			AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_01");	//Od dzisiaj porzucisz swoje ciemne machlojki i zajmiesz siê uczciw¹ prac¹ dla wspólnego dobra, chyba ¿e chcesz, bym tu wróci³.
		};
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_02");	//Nie rozumiem, czego jeszcze chcesz?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_03");	//Be³kota³eœ coœ wczeœniej o nagrodzie, nieprawda¿? A mo¿e coœ mi siê przes³ysza³o?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_04");	//Interesuje mnie tylko jedna kwestia. Czego czarne kaptury szuka³y w twoim domu?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_05");	//Nie potrafiê odpowiedzieæ na to pytanie, o czcigodny Magu. Mo¿e ma to zwi¹zek...
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_06");	//Z czym?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_07");	//Wybacz. Wiele lat temu przysi¹g³em, ¿e nie powiem... Nie mogê z³amaæ danego s³owa.
	};
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_08");	//Mogê jedynie daæ ci odrobinê z³ota i prosiæ, byœ mnie oszczêdzi³.
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_09");	//W takim razie dawaj. Spieszy mi siê.
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_10");	//Proszê.
	CreateInvItems(self,itmi_gold,250);
	b_giveinvitems(self,other,itmi_gold,250);
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_PERM(C_INFO)
{
	npc = bau_930_sekob;
	nr = 80;
	condition = dia_sekob_perm_condition;
	information = dia_sekob_perm_info;
	permanent = TRUE;
	description = "Czy wydarzy³o siê coœ ostatnio?";
};


func int dia_sekob_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_belohnung) && (KAPITEL >= 3) && (NPCOBSESSEDBYDMT_SEKOB == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_perm_info()
{
	if((hero.guild == GIL_KDF) && (KAPITEL >= 5))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Sekob_PERM_15_00");	//Czy wydarzy³o siê coœ ostatnio?
		if(MIS_BRINGROSIBACKTOSEKOB == LOG_FAILED)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_01");	//Wynoœ siê.
		}
		else if(MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_02");	//Nie. Nic specjalnego.
		}
		else if((KAPITEL >= 5) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_03");	//Moja ¿ona zniknê³a. Na pocz¹tku nie zwróci³em na to uwagi, ale ona po prostu przepad³a.
			AI_Output(self,other,"DIA_Sekob_PERM_01_04");	//Podejrzewam, ¿e uciek³a do lasu, chc¹c siê schroniæ przed polnymi bestiami.
			AI_Output(self,other,"DIA_Sekob_PERM_01_05");	//Zrób coœ dla mnie, jeœli j¹ odnajdziesz, przyprowadŸ j¹ tutaj.
			MIS_BRINGROSIBACKTOSEKOB = LOG_RUNNING;
			Log_CreateTopic(TOPIC_BRINGROSIBACKTOSEKOB,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BRINGROSIBACKTOSEKOB,LOG_RUNNING);
			b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,"¯ona Sekoba, Rosi, zaginê³a. Sekob prosi o jej odnalezienie.");
		}
		else
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_06");	//Nic... Od czasu wizyty tych drani w czerni.
		};
	};
};


instance DIA_SEKOB_KAP4_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap4_exit_condition;
	information = dia_sekob_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_sekob_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_KAP5_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap5_exit_condition;
	information = dia_sekob_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_sekob_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_SEKOB_HEILUNG(C_INFO)
{
	npc = bau_930_sekob;
	nr = 55;
	condition = dia_sekob_heilung_condition;
	information = dia_sekob_heilung_info;
	permanent = TRUE;
	description = "Masz jakiœ problem.";
};


func int dia_sekob_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_SEKOB == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};


var int dia_sekob_heilung_onetime;

func void dia_sekob_heilung_info()
{
	AI_Output(other,self,"DIA_Sekob_Heilung_15_00");	//Masz problem.
	if(DIA_SEKOB_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_01");	//Tak, w³aœciwie tak. TY jesteœ moim problemem, paskudny magu. Wynoœ siê, albo klnê siê na wszystko, ¿e obedrê ciê ¿ywcem ze skóry.
		AI_Output(other,self,"DIA_Sekob_Heilung_15_02");	//Ciê¿ki przypadek.
		b_npcclearobsessionbydmt(self);
		DIA_SEKOB_HEILUNG_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_03");	//Chyba mnie nie s³ysza³eœ, co?
		AI_Output(other,self,"DIA_Sekob_Heilung_15_04");	//Beznadziejny przypadek.
		b_npcclearobsessionbydmt(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_SEKOB_ROSIBACKATSEKOB(C_INFO)
{
	npc = bau_930_sekob;
	nr = 53;
	condition = dia_sekob_rosibackatsekob_condition;
	information = dia_sekob_rosibackatsekob_info;
	description = "Przyprowadzê twoj¹ ¿onê z powrotem.";
};


func int dia_sekob_rosibackatsekob_condition()
{
	if((KAPITEL >= 5) && (hero.guild != GIL_KDF) && (Npc_GetDistToWP(rosi,"NW_FARM4_SEKOB") < 3000) && (MIS_BRINGROSIBACKTOSEKOB == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_sekob_rosibackatsekob_info()
{
	AI_Output(other,self,"DIA_Sekob_ROSIBACKATSEKOB_15_00");	//Przyprowadzê twoj¹ ¿onê z powrotem.
	AI_Output(self,other,"DIA_Sekob_ROSIBACKATSEKOB_01_01");	//Doskonale, proszê, to za fatygê.
	MIS_BRINGROSIBACKTOSEKOB = LOG_SUCCESS;
	CreateInvItems(self,itmi_gold,650);
	b_giveinvitems(self,other,itmi_gold,650);
	b_giveplayerxp(XP_AMBIENT);
	b_npcclearobsessionbydmt(self);
	b_startotherroutine(rosi,"Start");
	b_startotherroutine(till,"Start");
};


instance DIA_SEKOB_ROSINEVERBACK(C_INFO)
{
	npc = bau_930_sekob;
	nr = 56;
	condition = dia_sekob_rosineverback_condition;
	information = dia_sekob_rosineverback_info;
	description = "Rosi ju¿ do ciebie nie wróci.";
};


func int dia_sekob_rosineverback_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_OBSOLETE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sekob_rosineverback_info()
{
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_00");	//Rosi ju¿ do ciebie nie wróci. Zaprowadzi³em j¹ w bezpieczne miejsce.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_01");	//Bezpieczne, a przed kim j¹ chronisz?
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_02");	//Przed tob¹.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_03");	//Po¿a³ujesz tego, ty œwinio!
	b_npcclearobsessionbydmt(self);
	b_attack(self,other,AR_NONE,1);
	b_giveplayerxp(XP_AMBIENT);
	MIS_BRINGROSIBACKTOSEKOB = LOG_FAILED;
};


instance DIA_SEKOB_KAP6_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap6_exit_condition;
	information = dia_sekob_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_sekob_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_SEKOB_PICKPOCKET(C_INFO)
{
	npc = bau_930_sekob;
	nr = 900;
	condition = dia_sekob_pickpocket_condition;
	information = dia_sekob_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_sekob_pickpocket_condition()
{
	return c_beklauen(75,230);
};

func void dia_sekob_pickpocket_info()
{
	Info_ClearChoices(dia_sekob_pickpocket);
	Info_AddChoice(dia_sekob_pickpocket,DIALOG_BACK,dia_sekob_pickpocket_back);
	Info_AddChoice(dia_sekob_pickpocket,DIALOG_PICKPOCKET,dia_sekob_pickpocket_doit);
};

func void dia_sekob_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sekob_pickpocket);
};

func void dia_sekob_pickpocket_back()
{
	Info_ClearChoices(dia_sekob_pickpocket);
};

