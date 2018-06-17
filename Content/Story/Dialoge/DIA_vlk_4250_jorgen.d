
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
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_01");	//Widz�, �e przybywasz z klasztoru mag�w?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_02");	//Tak, czemu pytasz?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_03");	//Nie przyda�by si� wam tam dodatkowy robotnik?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_04");	//Ej, ty! By�e� kiedy� w klasztorze?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_05");	//Mo�e, a czemu pytasz?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_06");	//Ci�gle przyjmuj� tam nowych ludzi?
	};
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_07");	//Nie wiem ju�, do kogo m�g�bym si� zwr�ci�.
};


instance DIA_JORGEN_NOVICE(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 6;
	condition = dia_jorgen_novice_condition;
	information = dia_jorgen_novice_info;
	permanent = FALSE;
	description = "Nie przechodzi� t�dy jaki� nowicjusz?";
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
	AI_Output(other,self,"DIA_Jorgen_Novice_15_00");	//Nie przechodzi� t�dy jaki� nowicjusz?
	AI_Output(self,other,"DIA_Jorgen_Novice_07_01");	//Jasne. Tam pobieg�.
	AI_PointAt(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self,other,"DIA_Jorgen_Novice_07_02");	//Skoczy� z mostu do wody i pop�yn��, jakby ucieka� przed stadem rekin�w.
	AI_StopPointAt(self);
};


instance DIA_JORGEN_MILTEN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 5;
	condition = dia_jorgen_milten_condition;
	information = dia_jorgen_milten_info;
	permanent = FALSE;
	description = "Je�li udajesz si� do klasztoru, porozmawiaj koniecznie z Miltenem.";
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
	AI_Output(other,self,"DIA_Jorgen_Milten_15_00");	//Je�li udajesz si� do klasztoru, porozmawiaj koniecznie z Miltenem. On ci pomo�e.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_01");	//Jak my�lisz, wpuszcz� mnie tam?
	AI_Output(other,self,"DIA_Jorgen_Milten_15_02");	//Mo�e. Chocia� jako� nie wyobra�am sobie ciebie w szatach nowicjusza.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_03");	//Do�� tych bzdur. Szata nowicjusza, jasne! Jedzenie, przyjacielu, to jest podstawa! Jak tak dalej p�jdzie, b�d� si� �ywi� korzonkami!
};


instance DIA_JORGEN_HOME(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 7;
	condition = dia_jorgen_home_condition;
	information = dia_jorgen_home_info;
	description = "Sk�d pochodzisz?";
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
	AI_Output(other,self,"DIA_Jorgen_Home_15_00");	//Sk�d pochodzisz?
	AI_Output(self,other,"DIA_Jorgen_Home_07_01");	//Kiedy� by�em kapitanem wielorybniczego statku. M�j dom jest na morzu.
	AI_Output(self,other,"DIA_Jorgen_Home_07_02");	//Par� miesi�cy temu piraci pos�ali moj� 'Magdalen�' na dno i od tej pory tkwi� na tej wyspie.
	AI_Output(self,other,"DIA_Jorgen_Home_07_03");	//Pr�bowa�em zaci�gn�� si� na jak�� �ajb�, ale przez ca�y ten czas nie widzia�em tu nawet spr�chnia�ego cz�na!
	AI_Output(self,other,"DIA_Jorgen_Home_07_04");	//Jedyny statek w Khorinis to ten przekl�ty kr�lewski galeon, ale tam mnie raczej nie przyjm�.
	AI_Output(self,other,"DIA_Jorgen_Home_07_05");	//Wi�c co mam robi�? W mie�cie nie ma dla mnie pracy. Pr�bowa�em chyba wszystkiego.
};


instance DIA_JORGEN_BECAREFULL(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 8;
	condition = dia_jorgen_becarefull_condition;
	information = dia_jorgen_becarefull_info;
	permanent = TRUE;
	description = "Lepiej zejd� z drogi.";
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
	AI_Output(other,self,"DIA_Jorgen_BeCarefull_15_00");	//Lepiej zejd� z drogi.
	AI_Output(self,other,"DIA_Jorgen_BeCarefull_07_01");	//Ech... Bez obaw. Zd��y�em ju� zauwa�y�, �e od paru dni jest tu cholernie niebezpiecznie.
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
	description = "Jak ci si� podoba �ycie w klasztorze?";
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
	AI_Output(other,self,"DIA_Jorgen_NEUHIER_15_00");	//Jak ci si� podoba �ycie w klasztorze?
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_01");	//Ja tu chyba zwariuj�!
	if(Npc_KnowsInfo(other,dia_jorgen_milten))
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_02");	//Ale dzi�ki za pomoc. Milten rzeczywi�cie znalaz� tu dla mnie miejsce.
		b_giveplayerxp(XP_AMBIENT);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_03");	//G�upio si� czuj� pomi�dzy tymi wszystkimi �wi�toszkami.
	};
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_04");	//Ale z dwojga z�ego... wol� robi�, co mi ka��, ni� przymiera� g�odem!
};


instance DIA_JORGEN_PERM4(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 400;
	condition = dia_jorgen_perm4_condition;
	information = dia_jorgen_perm4_info;
	permanent = TRUE;
	description = "Nic ci nie b�dzie.";
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
	AI_Output(other,self,"DIA_Jorgen_PERM4_15_00");	//Nic ci nie b�dzie.
	if((DIA_JORGEN_PERM4_ONETIME == FALSE) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_PERM4_07_01");	//Kazali mi pieli� grz�dki! Wyobra�asz sobie? Jak tak dalej p�jdzie, zwariuj� tu z kretesem.
		DIA_JORGEN_PERM4_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_PERM4_07_02");	//Solidny pok�ad pod nogami - oto czego mi trzeba!
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
	description = "M�g�bym ci� zatrudni� jako kapitana na moim statku.";
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
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN_15_00");	//M�g�bym ci� zatrudni� jako kapitana na moim statku.
	if(DIA_JORGEN_BEMYCAPTAIN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//Ej, chyba mnie nie nabierasz, co? Je�li m�wisz serio, mo�esz na mnie liczy�!
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_02");	//Eeee... Jest tylko jeden ma�y problem. Wy�ar�em nowicjuszom po�ow� spi�arni.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_03");	//Strasznie si� z tego powodu zez�o�cili. Obawiam si�, �e mog� nie chcie� mnie st�d wypu�ci�.
		DIA_JORGEN_BEMYCAPTAIN_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_04");	//Najpierw musz� odpracowa� sw�j d�ug u Pyrokara. Przykro mi.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Jorgen zostanie moim kapitanem, je�li sp�ac� jego d�ugi wzgl�dem klasztoru.");
};


instance DIA_JORGEN_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 52;
	condition = dia_jorgen_bemycaptain2_condition;
	information = dia_jorgen_bemycaptain2_info;
	description = "Zaj��em si� twoim d�ugiem.";
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
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_00");	//Zaj��em si� twoim d�ugiem. Jeste� wolny.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_01");	//Naprawd�? Jak tego dokona�e�?
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_02");	//Nie chcesz wiedzie�.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_03");	//W sumie to prawda. Wielkie dzi�ki!
	if(SCGOTCAPTAIN == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_04");	//A co z twoj� ofert�? Nadal widzisz mnie w swojej za�odze?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_05");	//To �wietnie. Ruszajmy w drog�.
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
	description = "Zosta� kapitanem mojego statku.";
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
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_00");	//Zosta� kapitanem mojego statku.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_01");	//Czuj� si� zaszczycony, ale czy ty w og�le MASZ ten statek? A za�og�?
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_02");	//My�l�, �e pi�ciu ludzi powinno wystarczy�.
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_03");	//Dobrze. Zobacz�, co si� da zrobi�. Czekaj na mnie na przystani.
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
	description = "Jeste� got�w, by pop�yn�� na wysp�?";
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
	AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_15_00");	//Jeste� got�w, by pop�yn�� na wysp�?
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_01");	//Oczywi�cie. Daj mi t� map�.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_02");	//�wietnie. Zatem �agle na maszt i ruszamy w drog�!
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_03");	//Tylko sprawd�, czy masz wszystko, czego potrzebujesz. Jak ju� wyruszymy, nie b�dziemy mogli zawr�ci�.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_04");	//Potem mo�esz si� troch� zdrzemn��. W kajucie kapitana jest wolna koja. Mi�ych sn�w!
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_05");	//Musisz mie� statek, co najmniej pi�ciu cz�onk�w za�ogi i map�, kt�rej b�d� potrzebowa� do nawigacji.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_06");	//Nie wyp�yniemy, p�ki nie b�dziesz mia� wszystkich potrzebnych rzeczy.
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
	description = "Jak si� masz?";
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
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//Jak si� masz?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_01");	//Nie�le. Da si� tu wytrzyma�.
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_02");	//Dalej przydzielaj� mi jakie� g�upie zadania, jak pilnowanie owiec, ale w por�wnaniu z klasztorem to prawdziwy raj!
		if(DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//Musz� sobie poszuka� jakiego� innego miejsca. Ciekawe, dok�d zanios� mnie wiatry tym razem?
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

