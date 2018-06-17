
instance DIA_HARAD_EXIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 999;
	condition = dia_harad_exit_condition;
	information = dia_harad_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_harad_exit_condition()
{
	return TRUE;
};

func void dia_harad_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARAD_HALLO(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_hallo_condition;
	information = dia_harad_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_harad_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_hallo_info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//Czego chcesz?
};


instance DIA_HARAD_ARBEIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_arbeit_condition;
	information = dia_harad_arbeit_info;
	permanent = FALSE;
	description = "Szukam pracy.";
};


func int dia_harad_arbeit_condition()
{
	return TRUE;
};

func void dia_harad_arbeit_info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//Szukam pracy!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Hmmm... przyda�by mi si� nowy czeladnik.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Brian nied�ugo sko�czy terminowanie i wyjedzie z miasta.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//Umiesz co�?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//Je�li pytasz, czy znam si� troch� na kowalstwie...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//Nie. Nie o to mi chodzi�o.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//Wcze�niej czy p�niej orkowie zaczn� obl�enie miasta, a wtedy liczy� si� b�d� tylko ci, kt�rzy mog� stan�� w jego obronie.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//Nie przyjm� na czeladnika kogo�, kto przyniesie mi ha�b�, uciekaj�c z miasta razem z kobietami i nierobami, zamiast walczy� rami� w rami� z prawdziwymi m�czyznami.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Je�li zdo�am przekona� Harada, �e jestem godny zaufania, przyjmie mnie na swojego czeladnika.");
};


instance DIA_HARAD_TAUGENICHTS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_taugenichts_condition;
	information = dia_harad_taugenichts_info;
	permanent = FALSE;
	description = "Nie jestem �adnym nierobem!";
};


func int dia_harad_taugenichts_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};

func void dia_harad_taugenichts_info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//Nie jestem �adnym nierobem!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//To wielkie s�owa! Potrafisz je poprze� wielkimi czynami?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//Do czego zmierzasz?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//Przynie� mi bro� orka.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//W pobli�u miasta widziano ork�w. Przy odrobinie szcz�cia nie b�dziesz musia� d�ugo szuka�.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//Je�eli uda ci si� pokona� jednego z nich, przyjm� ci� na czeladnika.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Zak�adaj�c oczywi�cie, �e zgodz� si� na to pozostali mistrzowie.
	MIS_HARAD_ORC = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HARADORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARADORK,LOG_RUNNING);
	b_logentry(TOPIC_HARADORK,"Poza murami miasta zauwa�ono orka. Kowal Harad chce, abym go zabi�. Kiedy wykonam zadanie, mam przynie�� jego bro�.");
};


instance DIA_HARAD_ORCRUNNING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcrunning_condition;
	information = dia_harad_orcrunning_info;
	permanent = FALSE;
	description = "Porozmawiajmy jeszcze raz o tej sprawie z orkiem...";
};


func int dia_harad_orcrunning_condition()
{
	if((MIS_HARAD_ORC == LOG_RUNNING) && (HARAD_HAKONMISSION == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_orcrunning_info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//Porozmawiajmy jeszcze raz o tej sprawie z orkiem...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//Co?
	Info_ClearChoices(dia_harad_orcrunning);
	Info_AddChoice(dia_harad_orcrunning,"Tw�j ork jest ju� martwy!",dia_harad_orcrunning_done);
	Info_AddChoice(dia_harad_orcrunning,"Ork to diabelnie twardy przeciwnik...",dia_harad_orcrunning_toohard);
};

func void dia_harad_orcrunning_toohard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//Ork to diabelnie twardy przeciwnik...
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Hmmm... kiedy na ciebie patrz�, to my�l�, �e mo�esz mie� racj�. Na twoich ko�ciach nie ma za wiele mi�sa. Ale potrafi� to zmieni�.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Niemniej jednak musisz mi dowie��, �e nie brak ci odwagi do walki.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//Nie mo�e to by� co� troszk� mniejszego?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Hmmm... Hakon, handlarz broni� z targowiska, powiedzia� mi, �e kilka dni temu napadli go bandyci.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//Te bydlaki w��cz� si� podobno gdzie� za wschodni� bram�.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Te tch�rzliwe �otry raczej nie grzesz� rozumem.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Dorwij ich! Wszystkich. Wtedy b�d� wiedzia�, �e przydasz nam si� w mie�cie.
	HARAD_HAKONMISSION = TRUE;
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	if(MIS_HAKONBANDITS != LOG_RUNNING)
	{
		b_logentry(TOPIC_LEHRLING,"Harad powiedzia� mi, �e bandyci napadli poza murami miasta na kupca Hakona. Mo�e od niego dowiem si�, gdzie mog� ich znale��.");
	}
	else
	{
		b_logentry(TOPIC_LEHRLING,"Harad powiedzia� mi, �e bandyci napadli poza murami miasta na kupca Hakona. Je�li zrobi� z nimi porz�dek, udowodni� swoj� warto��.");
	};
	Info_ClearChoices(dia_harad_orcrunning);
};

func void dia_harad_orcrunning_done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Tw�j ork jest ju� martwy!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Dobrze! Wi�c nie gadaj wi�cej i pozw�l, �eby twoje czyny m�wi�y za siebie.
	Info_ClearChoices(dia_harad_orcrunning);
};


instance DIA_HARAD_ORCSUCCESS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcsuccess_condition;
	information = dia_harad_orcsuccess_info;
	permanent = FALSE;
	description = "Mam orkow� bro�, o kt�r� prosi�e�.";
};


func int dia_harad_orcsuccess_condition()
{
	if(MIS_HARAD_ORC == LOG_RUNNING)
	{
		if((Npc_HasItems(other,itmw_2h_orcaxe_01) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_02) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_03) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_04) > 0) || (Npc_HasItems(other,itmw_2h_orcsword_01) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_harad_orcsuccess_info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//Mam orkow� bro�, o kt�r� prosi�e�.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Poka�...
	if(Npc_HasItems(other,itmw_2h_orcaxe_01) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_01,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_02) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_02,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_03) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_03,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_04) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_04,1);
	}
	else
	{
		b_giveinvitems(other,self,itmw_2h_orcsword_01,1);
	};
	if(HARAD_HAKONMISSION == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//JEDNAK TO ZROBI�E�? Znakomicie!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//Dawno ju� nie mia�em w r�kach takiej broni - podczas wojny z orkami by�em �o�nierzem.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//To by�y ci�kie czasy, m�wi� ci.
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//Wiedzia�em, co robi�, kiedy przyjmowa�em ci� na czeladnika. Dobra robota!
	}
	else if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//My�la�em, �e nie zdo�asz tego dokona�. Jestem pod wra�eniem.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//Szkoda, �e wybra�e� inn� drog�.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//Przyda�by� mi si�.
	};
	MIS_HARAD_ORC = LOG_SUCCESS;
	b_giveplayerxp(XP_HARAD_ORC);
	b_logentry(TOPIC_LEHRLING,"Harad przyjmie mnie na swojego czeladnika, je�li zdob�d� poparcie pozosta�ych mistrz�w.");
};


var int harad_startguild;

instance DIA_HARAD_LEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_lehrling_condition;
	information = dia_harad_lehrling_info;
	permanent = TRUE;
	description = "Kiedy mog� zacz�� prac� jako tw�j czeladnik?";
};


func int dia_harad_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_harad_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//Kiedy mog� zacz�� prac� jako tw�j czeladnik?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		if(MIS_HARAD_ORC == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//Przyda�by si� nam kto�, kto potrafi st�uc orka.
			if(MIS_HAKONBANDITS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Poza tym Hakon powiedzia� mi, jak za�atwi�e� spraw� z bandytami. Dobra robota!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//Nie zabi�e� orka, ale Hakon powiedzia� mi, jak za�atwi�e� spraw� z bandytami. Dobra robota.
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//Je�li chodzi o mnie, mo�esz zacz�� od zaraz.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//Ale je�li chodzi o pozosta�ych mistrz�w...
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Thorben da� ci swoje b�ogos�awie�stwo.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Stary dobry Thorben chce tylko, by� otrzyma� b�ogos�awie�stwo bog�w. Uwa�am, �e to dobry pomys�.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Thorben powiedzia�, �e z nim nie rozmawia�e�.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Bosper chcia� mnie od tego odwie��. Sam chce, �eby� zosta� jego czeladnikiem.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//Odby�em z nim kr�tk�, ale powa�n� rozmow� na ten temat.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//W ko�cu si� zgodzi�.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//Prosi� mnie, �ebym da� mu chocia� okazj� zainteresowania ci� jego zawodem.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Dowiedz si� co i jak - zawsze mo�esz podj�� decyzj� p�niej. No chyba �e nie zale�y ci na jego g�osie.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//A Bosper jeszcze ci� nie zna.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//Constantino, jak zwykle, o nic nie dba. Powiedzia�, �e je�li chodzi o niego, mo�esz si� uczy�, czego tylko chcesz.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Constantino powiedzia�, �e jeste� oskar�ony w mie�cie o przest�pstwo. Czy to prawda?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//Je�li tak, to powiniene� to jak najszybciej wyja�ni�!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Constantino nigdy o tobie nie s�ysza�.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//A Matteo powiedzia�, �e odda�e� mu jego z�oto. Widzi mi si�, �e jeste� honorowym m�odzie�cem.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//Matteo m�wi, �e ci�gle jeste� mu co� winien. Nie wiem, co jest mi�dzy wami, ale powiniene� to wyja�ni�.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//A Matteo twierdzi, �e nie rozmawia� z tob� na ten temat.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//A Matteo powiedzia�, �e nigdy ci� nie widzia� w swoim sklepie.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//To oznacza, �e zaskarbi�e� sobie przychylno�� wszystkich mistrz�w!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//To oznacza, �e zaskarbi�e� sobie przychylno�� czterech mistrz�w. Wystarczy, �eby� zosta� przyj�ty na czeladnika.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Jeste� got�w, by zacz�� u mnie terminowa�?
			Info_ClearChoices(dia_harad_lehrling);
			Info_AddChoice(dia_harad_lehrling,"Dobrze. Pomy�l� o tym.",dia_harad_lehrling_later);
			Info_AddChoice(dia_harad_lehrling,"Wchodz� w to!",dia_harad_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//Aby zosta� czeladnikiem w dolnej cz�ci miasta, musisz mie� zgod� co najmniej czterech mistrz�w.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//Powiniene� porozmawia� z wszystkimi, kt�rzy wci�� jeszcze nie podj�li decyzji w twojej sprawie.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Najpierw musisz udowodni�, �e co� potrafisz.
	};
};

func void dia_harad_lehrling_ok()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Wchodz� w to!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//Dobrze! Naucz� ci�, jak wyku� porz�dny miecz.
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//Ju� to potrafi�!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//C�, tym lepiej!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Poza tym czas, �eby� nabra� si�. Marniejesz mi w oczach!
	};
	PLAYER_ISAPPRENTICE = APP_HARAD;
	Npc_ExchangeRoutine(lothar,"START");
	HARAD_STARTGUILD = other.guild;
	HARAD_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_logentry(TOPIC_BONUS,"Harad przyj�� mnie na swojego czeladnika. Droga do g�rnego miasta stoi przede mn� otworem.");
	b_logentry(TOPIC_BONUS,"Harad dobrze mi zap�aci za wykut� przeze mnie bro�.");
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_CITYTEACHER,"Harad mo�e mnie nauczy� rzemios�a kowalskiego. Mo�e r�wnie� zwi�kszy� moj� si��.");
	Info_ClearChoices(dia_harad_lehrling);
};

func void dia_harad_lehrling_later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Dobrze - zastanowi� si� nad tym.
	if(!Npc_IsDead(brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//Nie �piesz si�. Brian b�dzie tu jeszcze przez jaki� czas.
	};
	Info_ClearChoices(dia_harad_lehrling);
};


instance DIA_HARAD_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_zustimmung_condition;
	information = dia_harad_zustimmung_info;
	permanent = TRUE;
	description = "Mog� zosta� czeladnikiem u innego mistrza?";
};


func int dia_harad_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};


var int dia_harad_zustimmung_permanent;

func void dia_harad_zustimmung_info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Mog� zosta� czeladnikiem u innego mistrza?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//Jeste� dobrym cz�owiekiem.
		if(MIS_HAKONBANDITS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Hakon powiedzia� mi, jak poradzi�e� sobie z bandytami.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//Masz moj� zgod�.
		if(DIA_HARAD_ZUSTIMMUNG_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			DIA_HARAD_ZUSTIMMUNG_PERMANENT = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Je�li zechc� zosta� czeladnikiem, Harad udzieli mi swojego poparcia.");
		if(!Npc_IsDead(brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Brian jeszcze przez jaki� czas tu b�dzie. A potem jego miejsce zajmie jaki� silny ch�opak.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//Inni mistrzowie mog� nie mie� nic przeciwko. Ja wyra�� jednak zgod�, dopiero kiedy dowiedziesz, �e co� umiesz!
	};
};


var int harad_milkommentar;
var int harad_palkommentar;
var int harad_innoskommentar;

instance DIA_HARAD_ALSLEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_alslehrling_condition;
	information = dia_harad_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_harad_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_HARAD) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_harad_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (HARAD_STARTGUILD != GIL_MIL) && (HARAD_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//Jeste� teraz w stra�y? Jestem z ciebie dumny!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//Tak d�ugo jak s�u�ysz w wojsku, nie b�d� od ciebie wymaga� wykonywania obowi�zk�w czeladniczych.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//Je�li jednak b�dziesz czego� potrzebowa�, zawsze mo�esz do mnie przyj��.
		HARAD_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (HARAD_STARTGUILD != GIL_PAL) && (HARAD_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//Uda�o ci si� wst�pi� w szeregi paladyn�w!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//Ciesz� si�, �e przyj��em ci� na czeladnika. Nawet pomimo tego, �e nie sp�dzi�e� za kowad�em zbyt du�o czasu.
		HARAD_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (HARAD_STARTGUILD != GIL_NOV) && (HARAD_STARTGUILD != GIL_KDF) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//Wst�pi�e� do klasztoru. Wola�bym, �eby� zosta� w mie�cie. Potrzebujemy ka�dego dobrego cz�owieka.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//Widocznie jednak przeznaczone ci by�o pod��a� za g�osem Innosa.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//Je�li b�dziesz czego� ode mnie potrzebowa�, to wiesz, gdzie mnie znale��.
		HARAD_INNOSKOMMENTAR = TRUE;
	}
	else if((HARAD_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (HARAD_MILKOMMENTAR == FALSE) && (HARAD_PALKOMMENTAR == FALSE) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//Dawno ci� tutaj nie by�o. Gdzie si� p�tasz, h�?
		HARAD_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//To znowu ty...
		HARAD_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_HARAD_WAFFEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_waffen_condition;
	information = dia_harad_waffen_info;
	permanent = FALSE;
	description = "Sprzedajesz te� bro�?";
};


func int dia_harad_waffen_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_harad_waffen_info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Sprzedajesz te� bro�?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Zapomnij o tym. Wszystko, co robi�, trafia do paladyn�w albo do stra�y.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//Mam zam�wienie na 100 mieczy od Lorda Hagena. Chce wyposa�y� w nie stra� miejsk�.
};


instance DIA_HARAD_AUFGABEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_aufgaben_condition;
	information = dia_harad_aufgaben_info;
	permanent = FALSE;
	description = "Co mam robi� jako czeladnik?";
};


func int dia_harad_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_aufgaben_info()
{
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//Jakie s� moje obowi�zki jako czeladnika?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Mo�esz zgadywa� trzy razy.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Ku�, ku� i jeszcze raz ku�?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//Nie jeste� tak g�upi, na jakiego wygl�dasz. P�ac� od ostrza. Nie pracujesz, nie dostajesz pieni�dzy. Proste.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Naucz� ci� te� wszystkiego, co musisz wiedzie�, �eby zrobi� zwyk�y miecz.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Wykuwanie magicznych mieczy to zadanie dla do�wiadczonych kowali - a do tego wiele ci jeszcze brakuje...
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//Je�li potrzebujesz miejsca do spania, mo�esz si� zadekowa� w moim domu. Jak do tej pory wszystko jasne?
};


instance DIA_HARAD_SELLBLADES(C_INFO)
{
	npc = vlk_412_harad;
	nr = 200;
	condition = dia_harad_sellblades_condition;
	information = dia_harad_sellblades_info;
	permanent = TRUE;
	description = "Chc� sprzeda� bro�, kt�r� wyku�em.";
};


func int dia_harad_sellblades_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_sellblades_info()
{
	var C_ITEM equipweap;
	var int anzahl_common;
	var int anzahl_schwert1;
	var int anzahl_schwert4;
	var int anzahl_rubinklinge;
	var int anzahl_elbastardo;
	var int gesamt;
	var string concattext;
	var int lohn;
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//Chc� sprzeda� bro�, kt�r� wyku�em.
	equipweap = Npc_GetEquippedMeleeWeapon(other);
	anzahl_common = Npc_HasItems(other,itmw_1h_common_01);
	if(Hlp_IsItem(equipweap,itmw_1h_common_01) == TRUE)
	{
		anzahl_common = anzahl_common - 1;
	};
	anzahl_schwert1 = Npc_HasItems(other,itmw_schwert1);
	if(Hlp_IsItem(equipweap,itmw_schwert1) == TRUE)
	{
		anzahl_schwert1 = anzahl_schwert1 - 1;
	};
	anzahl_schwert4 = Npc_HasItems(other,itmw_schwert4);
	if(Hlp_IsItem(equipweap,itmw_schwert4) == TRUE)
	{
		anzahl_schwert4 = anzahl_schwert4 - 1;
	};
	anzahl_rubinklinge = Npc_HasItems(other,itmw_rubinklinge);
	if(Hlp_IsItem(equipweap,itmw_rubinklinge) == TRUE)
	{
		anzahl_rubinklinge = anzahl_rubinklinge - 1;
	};
	anzahl_elbastardo = Npc_HasItems(other,itmw_elbastardo);
	if(Hlp_IsItem(equipweap,itmw_elbastardo) == TRUE)
	{
		anzahl_elbastardo = anzahl_elbastardo - 1;
	};
	gesamt = anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo;
	if(gesamt == 0)
	{
		if((Hlp_IsItem(equipweap,itmw_1h_common_01) == TRUE) || (Hlp_IsItem(equipweap,itmw_schwert1) == TRUE) || (Hlp_IsItem(equipweap,itmw_schwert4) == TRUE) || (Hlp_IsItem(equipweap,itmw_rubinklinge) == TRUE) || (Hlp_IsItem(equipweap,itmw_elbastardo) == TRUE))
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//Masz tylko t� przy pasie. Lepiej j� zatrzymaj.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Wi�c zr�b co�! Przyjmuj� tylko zwyk�e miecze.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//Dobrze - daj to tutaj.
		Npc_RemoveInvItems(other,itmw_1h_common_01,anzahl_common);
		Npc_RemoveInvItems(other,itmw_schwert1,anzahl_schwert1);
		Npc_RemoveInvItems(other,itmw_schwert4,anzahl_schwert4);
		Npc_RemoveInvItems(other,itmw_rubinklinge,anzahl_rubinklinge);
		Npc_RemoveInvItems(other,itmw_elbastardo,anzahl_elbastardo);
		concattext = ConcatStrings(IntToString(gesamt),PRINT_ITEMSGEGEBEN);
		AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Dobrze. Oto twoja zap�ata.
		lohn = (anzahl_common * VALUE_COMMON1) + (anzahl_schwert1 * VALUE_SCHWERT1) + (anzahl_schwert4 * VALUE_SCHWERT4) + (anzahl_rubinklinge * VALUE_RUBINKLINGE) + (anzahl_elbastardo * VALUE_ELBASTARDO);
		lohn = lohn / 3;
		b_giveinvitems(self,other,itmi_gold,lohn);
	};
};

func void b_harad_teachsmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//To do�� proste, ch�opcze. We� kawa�ek surowej stali i trzymaj j� w ogniu, a� rozgrzeje si� do bia�o�ci.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Wtedy nadaj broni kszta�t na kowadle.
};

func void b_haradsmithchoices()
{
	Info_ClearChoices(dia_harad_teachsmith);
	Info_AddChoice(dia_harad_teachsmith,DIALOG_BACK,dia_harad_teachsmith_back);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_04)),dia_harad_teachsmith_harad04);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_03)),dia_harad_teachsmith_harad03);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_02)),dia_harad_teachsmith_harad02);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_01)),dia_harad_teachsmith_harad01);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring("Nauka kowalstwa",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_COMMON)),dia_harad_teachsmith_common);
	};
};


instance DIA_HARAD_TEACHSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 50;
	condition = dia_harad_teachsmith_condition;
	information = dia_harad_teachsmith_info;
	permanent = TRUE;
	description = "Naucz mnie, jak wyku� porz�dny miecz!";
};


func int dia_harad_teachsmith_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_harad_teachsmith_info()
{
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Naucz mnie, jak wyku� porz�dny miecz!
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_back()
{
	Info_ClearChoices(dia_harad_teachsmith);
};

func void dia_harad_teachsmith_common()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		b_harad_teachsmith();
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Twoje pierwsze miecze nie b�d� doskona�e, ale powoli wszystkiego si� nauczysz.
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad01()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_01))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad02()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_02))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad03()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_03))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad04()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_04))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};


var int harad_merke_str;

instance DIA_HARAD_TEACHSTR(C_INFO)
{
	npc = vlk_412_harad;
	nr = 100;
	condition = dia_harad_teachstr_condition;
	information = dia_harad_teachstr_info;
	permanent = 1;
	description = "Chc� by� silniejszy!";
};


func int dia_harad_teachstr_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_teachstr_info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//Chc� by� silniejszy!
	HARAD_MERKE_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_back()
{
	if(HARAD_MERKE_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//Ju� nabra�e� muskulatury.
	};
	if(other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//Przyjd�, gdy b�dziesz chcia� si� nauczy� czego� wi�cej.
	};
	Info_ClearChoices(dia_harad_teachstr);
};

func void dia_harad_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};


instance DIA_HARAD_IMMERNOCH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_immernoch_condition;
	information = dia_harad_immernoch_info;
	permanent = FALSE;
	description = "Pracujesz jeszcze dla paladyn�w?";
};


func int dia_harad_immernoch_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_harad_immernoch_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Pracujesz jeszcze dla paladyn�w?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//Wykona�em zlecenie dla Lorda Hagena.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Teraz robi� dla niego miecze z magicznej rudy - tym razem nie za darmo.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//Mam te� czas, �eby zrobi� na boku par� sztuk broni dla kupc�w na targowisko.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//Je�li szukasz dobrego ostrza, powiniene� z nimi porozmawia�.
};


instance DIA_HARAD_ABOUTERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_abouterzklingen_condition;
	information = dia_harad_abouterzklingen_info;
	permanent = FALSE;
	description = "Powiedz mi co� wi�cej o mieczach z magicznej rudy!";
};


func int dia_harad_abouterzklingen_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_immernoch))
	{
		return TRUE;
	};
};

func void dia_harad_abouterzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Powiedz mi co� wi�cej o mieczach z magicznej rudy!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Tworzenie magicznego ostrza to bardzo z�o�ony i kosztowny proces. �atwo jednak w�ada� takim mieczem, a poza tym jest on praktycznie niezniszczalny.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//To dobre ostrze, ale swoj� prawdziw� moc ujawnia dopiero w r�kach paladyna.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//Miecz paladyna zostaje po�wi�cony przez Innosa. Dzi�ki temu magiczne ostrze staje si� zakl�t� broni�, kt�ra zadaje straszliwe rany!
};


instance DIA_HARAD_ERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_erzklingen_condition;
	information = dia_harad_erzklingen_info;
	permanent = TRUE;
	description = "Chc� kupi� miecz z magicznej rudy.";
};


func int dia_harad_erzklingen_condition()
{
	if((OREBLADEBOUGHT == FALSE) && Npc_KnowsInfo(other,dia_harad_abouterzklingen))
	{
		return TRUE;
	};
};


var int orebladebought;

func void dia_harad_erzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//Chc� kupi� miecz z magicznej rudy.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//Magiczne miecze mog� sprzedawa� tylko paladynom. I tylko po jednym na g�ow�.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//Powinni�cie si� cieszy�, �e mo�ecie dzier�y� tak doskona�e miecze.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//Na mocy dekretu Lorda Hagena mog� ci sprzeda� tylko jedn� magiczn� bro�.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//Co mog� ci zaproponowa�?
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Miecz dwur�czny (2000 sztuk z�ota)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Miecz jednor�czny (2000 sztuk z�ota)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_back()
{
	Info_ClearChoices(dia_harad_erzklingen);
};

func void b_harad_notenoughgold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//Masz za ma�o z�ota.
};

func void b_harad_havefunwithyoursword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Dbaj o swoj� now� bro�. Jest warta maj�tek.
	OREBLADEBOUGHT = TRUE;
	Info_ClearChoices(dia_harad_erzklingen);
};

func void dia_harad_erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//Wezm� miecz dwur�czny!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_2H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_2H_1);
		CreateInvItems(self,itmw_2h_blessed_01,1);
		b_giveinvitems(self,other,itmw_2h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Miecz dwur�czny (2000 sztuk z�ota)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Miecz jednor�czny (2000 sztuk z�ota)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//Wezm� miecz jednor�czny!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_1H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_1H_1);
		CreateInvItems(self,itmw_1h_blessed_01,1);
		b_giveinvitems(self,other,itmw_1h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Miecz dwur�czny (2000 sztuk z�ota)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Miecz jednor�czny (2000 sztuk z�ota)",dia_harad_erzklingen_1h);
	};
};


instance DIA_HARAD_REPAIRNECKLACE(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_repairnecklace_condition;
	information = dia_harad_repairnecklace_info;
	permanent = FALSE;
	description = "Potrafisz naprawi� bi�uteri�?";
};


func int dia_harad_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_harad_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Potrafisz naprawia� bi�uteri�?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//Nie jestem z�otnikiem. W mie�cie raczej nie znajdziesz nikogo, kto mo�e ci pom�c.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//Ludzie nie maj� pieni�dzy, a ostatnimi czasy nikt si� nie wzbogaci�.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//Wi�kszo�� z nich cieszy si�, �e maj� co je��.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_HARAD_GOLDSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_goldsmith_condition;
	information = dia_harad_goldsmith_info;
	permanent = FALSE;
	description = "Gdzie znajd� z�otnika?";
};


func int dia_harad_goldsmith_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_repairnecklace))
	{
		return TRUE;
	};
};

func void dia_harad_goldsmith_info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Gdzie znajd� z�otnika?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//Podobno w�r�d najemnik�w na farmie Onara jest dobry kowal.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Mo�e powiniene� z nim porozmawia�.
};


instance DIA_HARAD_PICKPOCKET(C_INFO)
{
	npc = vlk_412_harad;
	nr = 900;
	condition = dia_harad_pickpocket_condition;
	information = dia_harad_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_harad_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_harad_pickpocket_info()
{
	Info_ClearChoices(dia_harad_pickpocket);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_BACK,dia_harad_pickpocket_back);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_PICKPOCKET,dia_harad_pickpocket_doit);
};

func void dia_harad_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_harad_pickpocket);
};

func void dia_harad_pickpocket_back()
{
	Info_ClearChoices(dia_harad_pickpocket);
};

