
instance DIA_JORGEN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap3_exit_condition;
	information = dia_jorgen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_PICKPOCKET(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 900;
	condition = dia_jorgen_pickpocket_condition;
	information = dia_jorgen_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jorgen_pickpocket_condition()
{
	return c_beklauen(59,70);
};

func void dia_jorgen_pickpocket_info()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_BACK,dia_jorgen_pickpocket_back);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_PICKPOCKET,dia_jorgen_pickpocket_doit);
};

func void dia_jorgen_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jorgen_pickpocket);
};

func void dia_jorgen_pickpocket_back()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
};


instance DIA_JORGEN_HALLO(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 4;
	condition = dia_jorgen_hallo_condition;
	information = dia_jorgen_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_hallo_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_hallo_info()
{
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_00");	//Hej, ty!
	if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_01");	//Widzê, ¿e przybywasz z klasztoru magów?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_02");	//Tak, czemu pytasz?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_03");	//Nie przyda³by siê wam tam dodatkowy robotnik?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_04");	//Ej, ty! By³eœ kiedyœ w klasztorze?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_05");	//Mo¿e, a czemu pytasz?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_06");	//Ci¹gle przyjmuj¹ tam nowych ludzi?
	};
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_07");	//Nie wiem ju¿, do kogo móg³bym siê zwróciæ.
};


instance DIA_JORGEN_NOVICE(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 6;
	condition = dia_jorgen_novice_condition;
	information = dia_jorgen_novice_info;
	permanent = FALSE;
	description = "Nie przechodzi³ têdy jakiœ nowicjusz?";
};


func int dia_jorgen_novice_condition()
{
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_novice_info()
{
	AI_Output(other,self,"DIA_Jorgen_Novice_15_00");	//Nie przechodzi³ têdy jakiœ nowicjusz?
	AI_Output(self,other,"DIA_Jorgen_Novice_07_01");	//Jasne. Tam pobieg³.
	AI_PointAt(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self,other,"DIA_Jorgen_Novice_07_02");	//Skoczy³ z mostu do wody i pop³yn¹³, jakby ucieka³ przed stadem rekinów.
	AI_StopPointAt(self);
};


instance DIA_JORGEN_MILTEN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 5;
	condition = dia_jorgen_milten_condition;
	information = dia_jorgen_milten_info;
	permanent = FALSE;
	description = "Jeœli udajesz siê do klasztoru, porozmawiaj koniecznie z Miltenem.";
};


func int dia_jorgen_milten_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE) && (MIS_OLDWORLD == LOG_SUCCESS) && (miltennw.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_milten_info()
{
	AI_Output(other,self,"DIA_Jorgen_Milten_15_00");	//Jeœli udajesz siê do klasztoru, porozmawiaj koniecznie z Miltenem. On ci pomo¿e.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_01");	//Jak myœlisz, wpuszcz¹ mnie tam?
	AI_Output(other,self,"DIA_Jorgen_Milten_15_02");	//Mo¿e. Chocia¿ jakoœ nie wyobra¿am sobie ciebie w szatach nowicjusza.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_03");	//Doœæ tych bzdur. Szata nowicjusza, jasne! Jedzenie, przyjacielu, to jest podstawa! Jak tak dalej pójdzie, bêdê siê ¿ywi³ korzonkami!
};


instance DIA_JORGEN_HOME(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 7;
	condition = dia_jorgen_home_condition;
	information = dia_jorgen_home_info;
	description = "Sk¹d pochodzisz?";
};


func int dia_jorgen_home_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_home_info()
{
	AI_Output(other,self,"DIA_Jorgen_Home_15_00");	//Sk¹d pochodzisz?
	AI_Output(self,other,"DIA_Jorgen_Home_07_01");	//Kiedyœ by³em kapitanem wielorybniczego statku. Mój dom jest na morzu.
	AI_Output(self,other,"DIA_Jorgen_Home_07_02");	//Parê miesiêcy temu piraci pos³ali moj¹ 'Magdalenê' na dno i od tej pory tkwiê na tej wyspie.
	AI_Output(self,other,"DIA_Jorgen_Home_07_03");	//Próbowa³em zaci¹gn¹æ siê na jak¹œ ³ajbê, ale przez ca³y ten czas nie widzia³em tu nawet spróchnia³ego czó³na!
	AI_Output(self,other,"DIA_Jorgen_Home_07_04");	//Jedyny statek w Khorinis to ten przeklêty królewski galeon, ale tam mnie raczej nie przyjm¹.
	AI_Output(self,other,"DIA_Jorgen_Home_07_05");	//Wiêc co mam robiæ? W mieœcie nie ma dla mnie pracy. Próbowa³em chyba wszystkiego.
};


instance DIA_JORGEN_BECAREFULL(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 8;
	condition = dia_jorgen_becarefull_condition;
	information = dia_jorgen_becarefull_info;
	permanent = TRUE;
	description = "Lepiej zejdŸ z drogi.";
};


func int dia_jorgen_becarefull_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};

func void dia_jorgen_becarefull_info()
{
	AI_Output(other,self,"DIA_Jorgen_BeCarefull_15_00");	//Lepiej zejdŸ z drogi.
	AI_Output(self,other,"DIA_Jorgen_BeCarefull_07_01");	//Ech... Bez obaw. Zd¹¿y³em ju¿ zauwa¿yæ, ¿e od paru dni jest tu cholernie niebezpiecznie.
};


instance DIA_JORGEN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap4_exit_condition;
	information = dia_jorgen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NEUHIER(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 41;
	condition = dia_jorgen_neuhier_condition;
	information = dia_jorgen_neuhier_info;
	description = "Jak ci siê podoba ¿ycie w klasztorze?";
};


func int dia_jorgen_neuhier_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_neuhier_info()
{
	AI_Output(other,self,"DIA_Jorgen_NEUHIER_15_00");	//Jak ci siê podoba ¿ycie w klasztorze?
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_01");	//Ja tu chyba zwariujê!
	if(Npc_KnowsInfo(other,dia_jorgen_milten))
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_02");	//Ale dziêki za pomoc. Milten rzeczywiœcie znalaz³ tu dla mnie miejsce.
		b_giveplayerxp(XP_AMBIENT);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_03");	//G³upio siê czujê pomiêdzy tymi wszystkimi œwiêtoszkami.
	};
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_04");	//Ale z dwojga z³ego... wolê robiæ, co mi ka¿¹, ni¿ przymieraæ g³odem!
};


instance DIA_JORGEN_PERM4(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 400;
	condition = dia_jorgen_perm4_condition;
	information = dia_jorgen_perm4_info;
	permanent = TRUE;
	description = "Nic ci nie bêdzie.";
};


func int dia_jorgen_perm4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_jorgen_neuhier) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm4_onetime;

func void dia_jorgen_perm4_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM4_15_00");	//Nic ci nie bêdzie.
	if((DIA_JORGEN_PERM4_ONETIME == FALSE) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_PERM4_07_01");	//Kazali mi pieliæ grz¹dki! Wyobra¿asz sobie? Jak tak dalej pójdzie, zwariujê tu z kretesem.
		DIA_JORGEN_PERM4_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_PERM4_07_02");	//Solidny pok³ad pod nogami - oto czego mi trzeba!
};


instance DIA_JORGEN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap5_exit_condition;
	information = dia_jorgen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 51;
	condition = dia_jorgen_bemycaptain_condition;
	information = dia_jorgen_bemycaptain_info;
	permanent = TRUE;
	description = "Móg³bym ciê zatrudniæ jako kapitana na moim statku.";
};


func int dia_jorgen_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_PYROKARCLEARDEMONTOWER != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};


var int dia_jorgen_bemycaptain_onetime;

func void dia_jorgen_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN_15_00");	//Móg³bym ciê zatrudniæ jako kapitana na moim statku.
	if(DIA_JORGEN_BEMYCAPTAIN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//Ej, chyba mnie nie nabierasz, co? Jeœli mówisz serio, mo¿esz na mnie liczyæ!
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_02");	//Eeee... Jest tylko jeden ma³y problem. Wy¿ar³em nowicjuszom po³owê spi¿arni.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_03");	//Strasznie siê z tego powodu zez³oœcili. Obawiam siê, ¿e mog¹ nie chcieæ mnie st¹d wypuœciæ.
		DIA_JORGEN_BEMYCAPTAIN_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_04");	//Najpierw muszê odpracowaæ swój d³ug u Pyrokara. Przykro mi.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Jorgen zostanie moim kapitanem, jeœli sp³acê jego d³ugi wzglêdem klasztoru.");
};


instance DIA_JORGEN_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 52;
	condition = dia_jorgen_bemycaptain2_condition;
	information = dia_jorgen_bemycaptain2_info;
	description = "Zaj¹³em siê twoim d³ugiem.";
};


func int dia_jorgen_bemycaptain2_condition()
{
	if(MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_00");	//Zaj¹³em siê twoim d³ugiem. Jesteœ wolny.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_01");	//Naprawdê? Jak tego dokona³eœ?
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_02");	//Nie chcesz wiedzieæ.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_03");	//W sumie to prawda. Wielkie dziêki!
	if(SCGOTCAPTAIN == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_04");	//A co z twoj¹ ofert¹? Nadal widzisz mnie w swojej za³odze?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_05");	//To œwietnie. Ruszajmy w drogê.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 53;
	condition = dia_jorgen_bemycaptain3_condition;
	information = dia_jorgen_bemycaptain3_info;
	description = "Zostañ kapitanem mojego statku.";
};


func int dia_jorgen_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_00");	//Zostañ kapitanem mojego statku.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_01");	//Czujê siê zaszczycony, ale czy ty w ogóle MASZ ten statek? A za³ogê?
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_02");	//Myœlê, ¿e piêciu ludzi powinno wystarczyæ.
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_03");	//Dobrze. Zobaczê, co siê da zrobiæ. Czekaj na mnie na przystani.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_04");	//Tak jest!
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JORGENISCAPTAIN = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JORGEN_LOSFAHREN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_losfahren_condition;
	information = dia_jorgen_losfahren_info;
	permanent = TRUE;
	description = "Jesteœ gotów, by pop³yn¹æ na wyspê?";
};


func int dia_jorgen_losfahren_condition()
{
	if((JORGENISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_losfahren_info()
{
	AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_15_00");	//Jesteœ gotów, by pop³yn¹æ na wyspê?
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_01");	//Oczywiœcie. Daj mi tê mapê.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_02");	//Œwietnie. Zatem ¿agle na maszt i ruszamy w drogê!
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_03");	//Tylko sprawdŸ, czy masz wszystko, czego potrzebujesz. Jak ju¿ wyruszymy, nie bêdziemy mogli zawróciæ.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_04");	//Potem mo¿esz siê trochê zdrzemn¹æ. W kajucie kapitana jest wolna koja. Mi³ych snów!
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_05");	//Musisz mieæ statek, co najmniej piêciu cz³onków za³ogi i mapê, której bêdê potrzebowa³ do nawigacji.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_06");	//Nie wyp³yniemy, póki nie bêdziesz mia³ wszystkich potrzebnych rzeczy.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JORGEN_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_perm5_notcaptain_condition;
	information = dia_jorgen_perm5_notcaptain_info;
	permanent = TRUE;
	description = "Jak siê masz?";
};


func int dia_jorgen_perm5_notcaptain_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm5_notcaptain_xpgiven;

func void dia_jorgen_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//Jak siê masz?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_01");	//NieŸle. Da siê tu wytrzymaæ.
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_02");	//Dalej przydzielaj¹ mi jakieœ g³upie zadania, jak pilnowanie owiec, ale w porównaniu z klasztorem to prawdziwy raj!
		if(DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//Muszê sobie poszukaæ jakiegoœ innego miejsca. Ciekawe, dok¹d zanios¹ mnie wiatry tym razem?
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap6_exit_condition;
	information = dia_jorgen_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

