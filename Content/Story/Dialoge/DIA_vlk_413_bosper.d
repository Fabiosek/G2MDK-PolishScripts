
instance DIA_BOSPER_EXIT(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 999;
	condition = dia_bosper_exit_condition;
	information = dia_bosper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bosper_exit_condition()
{
	return TRUE;
};

func void dia_bosper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BOSPER_HALLO(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_hallo_condition;
	information = dia_bosper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bosper_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_hallo_info()
{
	AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//Witaj w moim sklepie, nieznajomy!
	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//Jestem Bosper. Wyrabiam �uki i handluj� futrami.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//Co ci� sprowadza do Khorinis?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Bosper produkuje �uki i handluje sk�rami. Jego sklep mie�ci si� przy wschodniej bramie, w dolnej cz�ci miasta.");
};


instance DIA_BOSPER_INTOOV(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_intoov_condition;
	information = dia_bosper_intoov_info;
	permanent = FALSE;
	description = "Musz� si� dosta� go g�rnego miasta...";
};


func int dia_bosper_intoov_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_intoov_info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//Musz� si� dosta� go g�rnego miasta...
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//Tam, gdzie s� paladyni? Zapomnij o tym.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//Musia�by� by� szanowanym obywatelem albo przynajmniej mie� porz�dn� prac�.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//Obcy nie ma szans si� tam dosta�.
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//Zauwa�y�em..
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"Aby uzyska� dost�p do g�rnego miasta, musz� zosta� szanowanym obywatelem albo znale�� sobie jak�� prac�.");
};


instance DIA_BOSPER_SEEKWORK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_seekwork_condition;
	information = dia_bosper_seekwork_info;
	permanent = FALSE;
	description = "Szukam pracy.";
};


func int dia_bosper_seekwork_condition()
{
	return TRUE;
};

func void dia_bosper_seekwork_info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//Szukam pracy.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//Hmmm - przyda�by mi si� nowy czeladnik.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//Poprzedni zrezygnowa� dwa dni temu.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//A wi�c, znasz si� troch� na polowaniu?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Hmm... C�...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//Mog� ci� nauczy�, jak si� obdziera ze sk�ry zwierz�ta.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//Dobrze ci zap�ac� za ka�d� sk�r�, jak� mi przyniesiesz.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//Je�li o to chodzi, to mog� ci dostarczy� troch� sk�r.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//Wspaniale! Przynie� mi tyle sk�r, ile zdo�asz. Zap�ac� ci za nie dobr� cen�.
	};
	b_logentry(TOPIC_LEHRLING,"Bosper potrzebuje nowego czeladnika. M�g�bym si� u niego zatrudni�.");
};


var int bosper_hinttojob;
var int bosper_startguild;

instance DIA_BOSPER_LEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_lehrling_condition;
	information = dia_bosper_lehrling_info;
	permanent = TRUE;
	description = "Chc� zosta� twoim czeladnikiem.";
};


func int dia_bosper_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//Chc� zosta� twoim czeladnikiem.
	if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//Hej... Wspaniale! Wygl�da na to, �e ju� znasz podstawy.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//Harad uwa�a, �e jeste� dobrym cz�owiekiem.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//Ale Harad w�tpi w twoje umiej�tno�ci.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//Ale Harad m�wi, �e nigdy ci� nie widzia�.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//Thorben da� ci swoje b�ogos�awie�stwo. Nie jestem zbyt pobo�ny, ale mnie to nie przeszkadza.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//Thorben poprze ci� tylko wtedy, kiedy zdob�dziesz b�ogos�awie�stwo bog�w.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//Thorben nie wie, kim jeste�.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//Constantino powiedzia�, �e je�li o niego chodzi, to mo�esz si� zapisa�, gdzie chcesz.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//Constantino powiedzia�, �e zosta�e� tu w mie�cie oskar�ony o pope�nienie przest�pstwa. Mam nadziej�, �e to jaki� drobiazg?
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//Dopilnuj, �eby ta sprawa si� wyja�ni�a.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//Constantino nigdy o tobie nie s�ysza�.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//A Matteo m�wi, �e jeste� wart swojej wagi w z�ocie.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//A Matteo wspomina� co� o d�ugach - lepiej z nim porozmawiaj.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//Matteo m�wi, �e jeszcze z tob� o tym nie rozmawia�.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//Matteo m�wi, �e nigdy ci� nie widzia�.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//A to oznacza, �e masz poparcie wszystkich mistrz�w!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//Popiera ci� teraz czterech mistrz�w. To wystarczy, �eby ci� przyj�� na czeladnika.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//Mo�esz dla mnie pracowa�, kiedy tylko chcesz.
			Info_ClearChoices(dia_bosper_lehrling);
			Info_AddChoice(dia_bosper_lehrling,"Dobrze. Pomy�l� o tym.",dia_bosper_lehrling_later);
			Info_AddChoice(dia_bosper_lehrling,"Wchodz� w to!",dia_bosper_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//Musisz mie� poparcie co najmniej czterech mistrz�w, �eby zosta� czeladnikiem w tym mie�cie.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//To znaczy, �e powiniene� porozmawia� z tymi, kt�rzy na razie niezbyt ci� popieraj�.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//Zanim ci� przyjm�, musz� oczywi�cie wiedzie�, czy w og�le si� nadajesz.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//Zwr�ci�e� mi m�j �uk, ale to nie �wiadczy o twoich talentach my�liwskich.
		};
		BOSPER_HINTTOJOB = TRUE;
	};
};

func void dia_bosper_lehrling_ok()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//Wchodz� w to!
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//Nie po�a�ujesz! My�l�, �e dobrze nam si� b�dzie razem pracowa�o.
	PLAYER_ISAPPRENTICE = APP_BOSPER;
	Npc_ExchangeRoutine(lothar,"START");
	BOSPER_STARTGUILD = other.guild;
	BOSPER_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Bosper przyj�� mnie na swojego czeladnika. Droga do g�rnego miasta stoi przede mn� otworem.");
	Info_ClearChoices(dia_bosper_lehrling);
};

func void dia_bosper_lehrling_later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//Dobrze. Pomy�l� o tym.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//Podejmij dobr� decyzj�! By�by� dla mnie �wietnym kandydatem.
	Info_ClearChoices(dia_bosper_lehrling);
};


instance DIA_BOSPER_OTHERMASTERS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_othermasters_condition;
	information = dia_bosper_othermasters_info;
	permanent = FALSE;
	description = "A co, je�li chc� pracowa� dla innego mistrza?";
};


func int dia_bosper_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_othermasters_info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//A co, je�li chc� pracowa� dla innego mistrza?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//Bzdura!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//Harad i Matteo maj� czeladnik�w.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//Alchemik Constantino to samotnik - od lat nie mia� ucznia.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//A co do Thorbena... Wszyscy wiedz�, �e jest kompletnie sp�ukany. Pewnie nie mia�by ci nawet czym zap�aci�.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//Z kolei ja pilnie potrzebuj� czeladnika. No i dobrze p�ac�.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//Ale niezale�nie, gdzie si� chcesz zatrudni� i tak potrzebna ci b�dzie zgoda wszystkich mistrz�w z dolnej cz�ci miasta...
};


instance DIA_BOSPER_BARTOK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 4;
	condition = dia_bosper_bartok_condition;
	information = dia_bosper_bartok_info;
	permanent = FALSE;
	description = "Dlaczego tw�j czeladnik zrezygnowa�?";
};


func int dia_bosper_bartok_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork))
	{
		return TRUE;
	};
};

func void dia_bosper_bartok_info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//Dlaczego tw�j czeladnik zrezygnowa�?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//Powiedzia� tylko, �e w okolicy zrobi�o si� zbyt niebezpiecznie.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//Je�li to ci� naprawd� ciekawi, mo�esz go zapyta�.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//Nazywa si� Bartok. Pewnie kr�ci si� gdzie� ko�o ober�y Coragona.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//Przejd� ko�o ku�ni, a dalej prosto.
};


instance DIA_BOSPER_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_zustimmung_condition;
	information = dia_bosper_zustimmung_info;
	permanent = TRUE;
	description = "Czy zgodzisz si�, �ebym zawar� umow� z innym mistrzem?";
};


func int dia_bosper_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_othermasters) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};


var int bosper_zustimmung_once;

func void dia_bosper_zustimmung_info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//Czy zgodzisz si�, �ebym zawar� umow� z innym mistrzem?
	if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//Mia�em nadziej�, �e b�dziesz pracowa� dla mnie.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//Ale skoro tego chcesz...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//Czy to znaczy, �e mnie poprzesz?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//Je�li pozostali mistrzowie nie zaprotestuj� - tak.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//W ko�cu zwr�ci�e� mi m�j �uk.
		};
		if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//Ale na pewno by�by� dobrym my�liwym.
		};
		if(BOSPER_ZUSTIMMUNG_ONCE == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			BOSPER_ZUSTIMMUNG_ONCE = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Je�li zechc� zosta� czeladnikiem, Bosper udzieli mi swojego poparcia.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//W porz�dku! Dostaniesz moj� zgod� - ale pod jednym warunkiem.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//Pracuj dla mnie, przynajmniej przez jaki� czas.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//Wtedy sam ocenisz, czy odpowiada ci moje rzemios�o.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//A kto wie - mo�e to polubisz i zostaniesz ze mn�.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//Je�li jeste� do�� dobry, by pracowa� dla mnie, to u innych te� sobie poradzisz.
		BOSPER_HINTTOJOB = TRUE;
	};
};


instance DIA_BOSPER_JOB(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_job_condition;
	information = dia_bosper_job_info;
	permanent = FALSE;
	description = "Co mam dla ciebie zrobi�?";
};


func int dia_bosper_job_condition()
{
	if(BOSPER_HINTTOJOB == TRUE)
	{
		return TRUE;
	};
};

func void dia_bosper_job_info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//Co mam dla ciebie zrobi�?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//Naucz� ci�, jak obdziera� ze sk�ry zwierzyn�, a ty mi przyniesiesz, no powiedzmy, p� tuzina wilczych futer.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Bosper mo�e mnie nauczy�, jak obdziera� ze sk�ry zwierz�ta.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//Przynie� mi p� tuzina wilczych futer.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//Wtedy b�d� wiedzia�, �e opanowa�e� sw�j fach.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//Je�li nie zajmie ci to ca�ego �ycia i sk�ry b�d� w zno�nym stanie, to ci� przyjm�.
	if(Npc_KnowsInfo(other,dia_bosper_othermasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//Albo b�dziesz m�g� naj�� si� u innego mistrza. Je�li tego naprawd� chcesz.
	};
	MIS_BOSPER_WOLFFURS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOSPERWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERWOLF,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERWOLF,"Mam przynie�� Bosperowi sze�� wilczych sk�r. Kiedy ju� wykonam zadanie, zatrudni mnie jako swojego czeladnika albo udzieli poparcia, je�li zechc� pracowa� u innego mistrza.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		b_logentry(TOPIC_BOSPERWOLF,"Chcia�bym, �eby Bosper nauczy� mnie oprawia� zwierz�ta.");
	};
};


instance DIA_BOSPER_BRINGFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 102;
	condition = dia_bosper_bringfur_condition;
	information = dia_bosper_bringfur_info;
	permanent = TRUE;
	description = "Co do tych wilczych futer...";
};


func int dia_bosper_bringfur_condition()
{
	if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bringfur_info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//Co do tych wilczych futer...
	if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//Jeste� teraz czeladnikiem innego mistrza. Kupi� od ciebie sk�ry po zwyk�ej cenie.
		MIS_BOSPER_WOLFFURS = LOG_OBSOLETE;
		return;
	};
	if(b_giveinvitems(other,self,itat_wolffur,6))
	{
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//Mam je, prosz�.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//Wspaniale! Wiedzia�em, �e nadajesz si� do tej pracy.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//A oto zap�ata, tak jak obiecywa�em.
		b_giveinvitems(self,other,itmi_gold,VALUE_WOLFFUR * 6);
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//I co? Co my�lisz? Czy to nie lepsza praca ni� kucie mieczy po ca�ych dniach albo nape�nianie ma�ych buteleczek w zakurzonej komnacie?
		MIS_BOSPER_WOLFFURS = LOG_SUCCESS;
		b_logentry(TOPIC_LEHRLING,"Bosper przyjmie mnie na czeladnika, je�li pozostali mistrzowie udziel� mi swojego poparcia.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//Umawiali�my si� na p� tuzina, ale masz jeszcze czas. Ruszaj i przynie� mi te sk�ry.
	};
};


instance DIA_BOSPER_TEACHFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_teachfur_condition;
	information = dia_bosper_teachfur_info;
	permanent = TRUE;
	description = "Naucz mnie, jak obdziera� zwierzyn� ze sk�ry.";
};


func int dia_bosper_teachfur_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_teachfur_info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Naucz mnie, jak obdziera� zwierzyn� ze sk�ry.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Dobrze. S�uchaj. To do�� proste.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//Ostrym no�em rozcinasz brzuch zwierz�cia. Potem robisz ma�e naci�cia po wewn�trznej stronie �ap i �ci�gasz sk�r�.
		if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//Przynie� mi te wilcze sk�ry, to zobaczymy...
			b_logentry(TOPIC_BOSPERWOLF,"Bosper nauczy� mnie, jak obdziera� zwierzyn� ze sk�ry.");
		};
	};
};


instance DIA_BOSPER_TRADE(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 700;
	condition = dia_bosper_trade_condition;
	information = dia_bosper_trade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
};


func int dia_bosper_trade_condition()
{
	if(MIS_BOSPER_WOLFFURS != LOG_RUNNING)
	{
		dia_bosper_trade.trade = TRUE;
	};
	return TRUE;
};

func void dia_bosper_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//Poka� mi swoje towary.
	if(dia_bosper_trade.trade == TRUE)
	{
		b_givetradeinv(self);
		Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
		mcbolzenamount = KAPITEL * 50;
		CreateInvItems(self,itrw_bolt,mcbolzenamount);
		Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
		mcarrowamount = KAPITEL * 50;
		CreateInvItems(self,itrw_arrow,mcarrowamount);
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Trade_11_01");	//Nie jeste� tu po to, �eby ogl�da� moje towary! Masz mi przynie�� te sk�ry!
		AI_Output(self,other,"DIA_Bosper_Trade_11_02");	//Wi�c do roboty!
	};
};


instance DIA_BOSPER_BOGENRUNNING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 5;
	condition = dia_bosper_bogenrunning_condition;
	information = dia_bosper_bogenrunning_info;
	permanent = FALSE;
	description = "S�ysza�em, �e kto� ci� okrad�.";
};


func int dia_bosper_bogenrunning_condition()
{
	if(MIS_BOSPER_BOGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bogenrunning_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//S�ysza�em, �e kto� ci� okrad�.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//Kto ci to powiedzia�? Pewnie Bartok, co? Nie mia� nic ciekawszego do powiedzenia? No c�.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//M�wi� ci, jak dorw� tego drania, to niech si� lepiej modli!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//Wyszed�em ze sklepu tylko na chwil�. Kiedy wr�ci�em, zd��y�em tylko zobaczy�, jak wychodzi - z moim �ukiem na ramieniu.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//Od razu wezwa�em stra�nik�w, ale ten niegodziwiec uciek� do portu. I tam go zgubili.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//Narobi�em takiego szumu, �e stra� przetrz�sn�a ca�� dzielnic� portow�. Ale nic nie znale�li.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//Cholerne obiboki!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//Za�o�� si�, �e m�j �uk jest ci�gle w mie�cie. Poinformowa�em stra�e przy obu bramach i nie widzieli, �eby kto� wychodzi� z moim �ukiem.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//Jak dorw� tego �obuza...
	Log_CreateTopic(TOPIC_BOSPERBOGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERBOGEN,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERBOGEN,"Bosperowi skradziono �uk. Z�odziej skierowa� si� do przystani i tam przepad� jak kamie� w wod�. Stra�nicy miejscy przeszukali ca�� dzielnic� portow�, lecz nie uda�o im si� nic znale��. Istnieje jednak du�e prawdopodobie�stwo, �e z�odziej nie opu�ci� jeszcze miasta.");
};


instance DIA_BOSPER_BOGENSUCCESS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 6;
	condition = dia_bosper_bogensuccess_condition;
	information = dia_bosper_bogensuccess_info;
	permanent = FALSE;
	description = "S�dz�, �e to tw�j �uk...";
};


func int dia_bosper_bogensuccess_condition()
{
	if(Npc_HasItems(other,itrw_bow_l_03_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_bosper_bogensuccess_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//S�dz�, �e to tw�j �uk...
	b_giveinvitems(other,self,itrw_bow_l_03_mis,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//M�j �uk! Gdzie go znalaz�e�?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//W ciemnej norze pe�nej szczur�w.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//Mam nadziej�, �e nie wpakowa�e� si� w k�opoty...
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//Nie - robi�em ju� takie rzeczy wcze�niej.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//Hmmm. Tak czy inaczej, dzi�kuj�. Jestem twoim d�u�nikiem.
	MIS_BOSPER_BOGEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BOSPER_BOGEN);
	Npc_RemoveInvItems(self,itrw_bow_l_03_mis,1);
};


var int bosper_island;

instance DIA_BOSPER_PERM(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 10;
	condition = dia_bosper_perm_condition;
	information = dia_bosper_perm_info;
	permanent = TRUE;
	description = "Co s�ycha� w mie�cie?";
};


func int dia_bosper_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_bosper_perm_info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//Co s�ycha� w mie�cie?
	if(BOSPER_ISLAND == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//Je�li orkowie naprawd� zaczn� oblega� miasto, to b�dzie tu nieprzyjemnie.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//Jest tylko jeden statek i pilnuj� go paladyni. Nie s�dz�, �eby u�yli go do ewakuacji obywateli.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//Nie ma innego sposobu, �eby si� st�d wydosta�?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//Nie. Nikt nie opu�ci wyspy bez statku.
		BOSPER_ISLAND = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//Jak na razie nic nowego. Wpadnij p�niej.
	};
};


var int bosper_milkommentar;
var int bosper_palkommentar;
var int bosper_innoskommentar;

instance DIA_BOSPER_ALSLEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_alslehrling_condition;
	information = dia_bosper_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bosper_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_BOSPER) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (BOSPER_STARTGUILD != GIL_MIL) && (BOSPER_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//Zaci�gn��e� si� do stra�y, co?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//Nie, �eby mnie to obchodzi�o. Dop�ki poluj�c na ork�w i bandyt�w, nie zapomnisz upolowa� kilku wilk�w.
		BOSPER_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (BOSPER_STARTGUILD != GIL_PAL) && (BOSPER_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//Wygl�da na to, �e twoja kariera toczy si� jak lawina. Paladyn Kr�la!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//Nie zapomnij o swoim starym mistrzu...
		BOSPER_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (BOSPER_STARTGUILD != GIL_NOV) && (BOSPER_STARTGUILD != GIL_KDF) && (BOSPER_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//Poszed�e� do klasztoru, co? Mam nadziej�, �e b�d� ci� wystarczaj�co cz�sto wypuszcza�, �eby� nadal zaopatrywa� mnie w sk�ry...
		BOSPER_INNOSKOMMENTAR = TRUE;
	}
	else if((BOSPER_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//Gdzie si� szwenda�e� tyle czasu?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//Potrzebuj� wi�cej sk�r, przynios�e� jakie�?
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//A ten znowu to samo...
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_BOSPER_AUFGABEN(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_aufgaben_condition;
	information = dia_bosper_aufgaben_info;
	permanent = FALSE;
	description = "Co mam robi� jako czeladnik?";
};


func int dia_bosper_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_aufgaben_info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//Co mam robi� jako czeladnik?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//To proste. Przynie� mi tyle futer, ile zdo�asz.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//Zap�ac� ci za nie lepsz� cen� ni� ka�dy inny handlarz.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//Poza tym, mo�esz si� w og�le nie pokazywa� w sklepie. Poradz� sobie �wietnie sam.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//A gdzie mam spa�?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//Nie mam tu dla ciebie pokoju. Powiniene� znale�� jakie� ��ko w gospodzie ko�o placu targowego.
	};
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Bosper skupuje sk�ry zwierz�ce po wyj�tkowo dobrej cenie.");
};


var int bosper_trollfursold;

instance DIA_BOSPER_SELLFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 600;
	condition = dia_bosper_sellfur_condition;
	information = dia_bosper_sellfur_info;
	permanent = TRUE;
	description = "Mam dla ciebie kilka sk�r...";
};


func int dia_bosper_sellfur_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_sellfur_info()
{
	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//Mam dla ciebie kilka sk�r...
	if((Npc_HasItems(other,itat_sheepfur) > 0) || (Npc_HasItems(other,itat_wolffur) > 0) || (Npc_HasItems(other,itat_wargfur) > 0) || (Npc_HasItems(other,itat_shadowfur) > 0) || (Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0) || (Npc_HasItems(other,itat_addon_keilerfur) > 0))
	{
		if(Npc_HasItems(other,itat_addon_keilerfur) > 0)
		{
			AI_Wait(self,3);
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_addon_keilerfur) * VALUE_KEILERFUR);
			b_giveinvitems(other,self,itat_addon_keilerfur,Npc_HasItems(other,itat_addon_keilerfur));
		};
		if(Npc_HasItems(other,itat_sheepfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//Owcze sk�ry? Chyba nie zat�uk�e� jakiemu� wie�niakowi jego owiec, co?
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//Nawet bym o tym nie pomy�la�...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_sheepfur) * VALUE_SHEEPFUR);
			b_giveinvitems(other,self,itat_sheepfur,Npc_HasItems(other,itat_sheepfur));
		};
		if(Npc_HasItems(other,itat_wolffur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//Wilcza sk�ra, nie�le...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wolffur) * VALUE_WOLFFUR);
			b_giveinvitems(other,self,itat_wolffur,Npc_HasItems(other,itat_wolffur));
		};
		if(Npc_HasItems(other,itat_wargfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//Sk�ra warga? Te bestie s� niebezpieczne...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wargfur) * VALUE_WARGFUR);
			b_giveinvitems(other,self,itat_wargfur,Npc_HasItems(other,itat_wargfur));
		};
		if(Npc_HasItems(other,itat_shadowfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//Och, nawet sk�ra cieniostwora - takie s� sporo warte.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_shadowfur) * VALUE_SHADOWFUR);
			b_giveinvitems(other,self,itat_shadowfur,Npc_HasItems(other,itat_shadowfur));
		};
		if((Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0))
		{
			if(BOSPER_TROLLFURSOLD == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//A co TO za sk�ra?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//Zdar�em j� z trolla.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//To... to jest warte ma�� fortun�.
				BOSPER_TROLLFURSOLD = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//Kolejna trollowa sk�ra... Czy ty na nie polujesz?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//Nie, po prostu korzystam z ka�dej okazji...
			};
			if(Npc_HasItems(other,itat_trollfur) > 0)
			{
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollfur) * VALUE_TROLLFUR);
				b_giveinvitems(other,self,itat_trollfur,Npc_HasItems(other,itat_trollfur));
			};
			if(Npc_HasItems(other,itat_trollblackfur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//No prosz�, sk�ra czarnego trolla!
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollblackfur) * VALUE_TROLLBLACKFUR);
				b_giveinvitems(other,self,itat_trollblackfur,Npc_HasItems(other,itat_trollblackfur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//Dobra robota. Przyjd� do mnie, jak b�dziesz mia� nast�pne...
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//Ale pami�taj - interesuj� mnie tylko sk�ry wilk�w, cieniostwor�w i tym podobne...
	};
};


instance DIA_BOSPER_MINENANTEIL(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_minenanteil_condition;
	information = dia_bosper_minenanteil_info;
	description = "Widz�, �e masz na sprzeda� udzia�y w kopalni.";
};


func int dia_bosper_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bosper_minenanteil_info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//Widz�, �e masz na sprzeda� udzia�y w kopalni.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//Eee... Ja nic o tym nie wiem. Mo�esz je zatrzyma�, je�li chcesz.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BOSPER_PICKPOCKET(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 900;
	condition = dia_bosper_pickpocket_condition;
	information = dia_bosper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_bosper_pickpocket_condition()
{
	return c_beklauen(67,120);
};

func void dia_bosper_pickpocket_info()
{
	Info_ClearChoices(dia_bosper_pickpocket);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_BACK,dia_bosper_pickpocket_back);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_PICKPOCKET,dia_bosper_pickpocket_doit);
};

func void dia_bosper_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bosper_pickpocket);
};

func void dia_bosper_pickpocket_back()
{
	Info_ClearChoices(dia_bosper_pickpocket);
};

