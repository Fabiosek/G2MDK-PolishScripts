
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
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Hmmm... przyda³by mi siê nowy czeladnik.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Brian nied³ugo skoñczy terminowanie i wyjedzie z miasta.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//Umiesz coœ?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//Jeœli pytasz, czy znam siê trochê na kowalstwie...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//Nie. Nie o to mi chodzi³o.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//Wczeœniej czy póŸniej orkowie zaczn¹ oblê¿enie miasta, a wtedy liczyæ siê bêd¹ tylko ci, którzy mog¹ stan¹æ w jego obronie.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//Nie przyjmê na czeladnika kogoœ, kto przyniesie mi hañbê, uciekaj¹c z miasta razem z kobietami i nierobami, zamiast walczyæ ramiê w ramiê z prawdziwymi mê¿czyznami.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Jeœli zdo³am przekonaæ Harada, ¿e jestem godny zaufania, przyjmie mnie na swojego czeladnika.");
};


instance DIA_HARAD_TAUGENICHTS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_taugenichts_condition;
	information = dia_harad_taugenichts_info;
	permanent = FALSE;
	description = "Nie jestem ¿adnym nierobem!";
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
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//Nie jestem ¿adnym nierobem!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//To wielkie s³owa! Potrafisz je poprzeæ wielkimi czynami?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//Do czego zmierzasz?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//Przynieœ mi broñ orka.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//W pobli¿u miasta widziano orków. Przy odrobinie szczêœcia nie bêdziesz musia³ d³ugo szukaæ.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//Je¿eli uda ci siê pokonaæ jednego z nich, przyjmê ciê na czeladnika.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Zak³adaj¹c oczywiœcie, ¿e zgodz¹ siê na to pozostali mistrzowie.
	MIS_HARAD_ORC = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HARADORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARADORK,LOG_RUNNING);
	b_logentry(TOPIC_HARADORK,"Poza murami miasta zauwa¿ono orka. Kowal Harad chce, abym go zabi³. Kiedy wykonam zadanie, mam przynieœæ jego broñ.");
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
	Info_AddChoice(dia_harad_orcrunning,"Twój ork jest ju¿ martwy!",dia_harad_orcrunning_done);
	Info_AddChoice(dia_harad_orcrunning,"Ork to diabelnie twardy przeciwnik...",dia_harad_orcrunning_toohard);
};

func void dia_harad_orcrunning_toohard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//Ork to diabelnie twardy przeciwnik...
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Hmmm... kiedy na ciebie patrzê, to myœlê, ¿e mo¿esz mieæ racjê. Na twoich koœciach nie ma za wiele miêsa. Ale potrafiê to zmieniæ.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Niemniej jednak musisz mi dowieœæ, ¿e nie brak ci odwagi do walki.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//Nie mo¿e to byæ coœ troszkê mniejszego?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Hmmm... Hakon, handlarz broni¹ z targowiska, powiedzia³ mi, ¿e kilka dni temu napadli go bandyci.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//Te bydlaki w³ócz¹ siê podobno gdzieœ za wschodni¹ bram¹.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Te tchórzliwe ³otry raczej nie grzesz¹ rozumem.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Dorwij ich! Wszystkich. Wtedy bêdê wiedzia³, ¿e przydasz nam siê w mieœcie.
	HARAD_HAKONMISSION = TRUE;
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	if(MIS_HAKONBANDITS != LOG_RUNNING)
	{
		b_logentry(TOPIC_LEHRLING,"Harad powiedzia³ mi, ¿e bandyci napadli poza murami miasta na kupca Hakona. Mo¿e od niego dowiem siê, gdzie mogê ich znaleŸæ.");
	}
	else
	{
		b_logentry(TOPIC_LEHRLING,"Harad powiedzia³ mi, ¿e bandyci napadli poza murami miasta na kupca Hakona. Jeœli zrobiê z nimi porz¹dek, udowodniê swoj¹ wartoœæ.");
	};
	Info_ClearChoices(dia_harad_orcrunning);
};

func void dia_harad_orcrunning_done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Twój ork jest ju¿ martwy!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Dobrze! Wiêc nie gadaj wiêcej i pozwól, ¿eby twoje czyny mówi³y za siebie.
	Info_ClearChoices(dia_harad_orcrunning);
};


instance DIA_HARAD_ORCSUCCESS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcsuccess_condition;
	information = dia_harad_orcsuccess_info;
	permanent = FALSE;
	description = "Mam orkow¹ broñ, o któr¹ prosi³eœ.";
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
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//Mam orkow¹ broñ, o któr¹ prosi³eœ.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Poka¿...
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
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//JEDNAK TO ZROBI£EŒ? Znakomicie!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//Dawno ju¿ nie mia³em w rêkach takiej broni - podczas wojny z orkami by³em ¿o³nierzem.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//To by³y ciê¿kie czasy, mówiê ci.
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//Wiedzia³em, co robiê, kiedy przyjmowa³em ciê na czeladnika. Dobra robota!
	}
	else if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//Myœla³em, ¿e nie zdo³asz tego dokonaæ. Jestem pod wra¿eniem.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//Szkoda, ¿e wybra³eœ inn¹ drogê.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//Przyda³byœ mi siê.
	};
	MIS_HARAD_ORC = LOG_SUCCESS;
	b_giveplayerxp(XP_HARAD_ORC);
	b_logentry(TOPIC_LEHRLING,"Harad przyjmie mnie na swojego czeladnika, jeœli zdobêdê poparcie pozosta³ych mistrzów.");
};


var int harad_startguild;

instance DIA_HARAD_LEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_lehrling_condition;
	information = dia_harad_lehrling_info;
	permanent = TRUE;
	description = "Kiedy mogê zacz¹æ pracê jako twój czeladnik?";
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
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//Kiedy mogê zacz¹æ pracê jako twój czeladnik?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		if(MIS_HARAD_ORC == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//Przyda³by siê nam ktoœ, kto potrafi st³uc orka.
			if(MIS_HAKONBANDITS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Poza tym Hakon powiedzia³ mi, jak za³atwi³eœ sprawê z bandytami. Dobra robota!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//Nie zabi³eœ orka, ale Hakon powiedzia³ mi, jak za³atwi³eœ sprawê z bandytami. Dobra robota.
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//Jeœli chodzi o mnie, mo¿esz zacz¹æ od zaraz.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//Ale jeœli chodzi o pozosta³ych mistrzów...
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Thorben da³ ci swoje b³ogos³awieñstwo.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Stary dobry Thorben chce tylko, byœ otrzyma³ b³ogos³awieñstwo bogów. Uwa¿am, ¿e to dobry pomys³.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Thorben powiedzia³, ¿e z nim nie rozmawia³eœ.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Bosper chcia³ mnie od tego odwieœæ. Sam chce, ¿ebyœ zosta³ jego czeladnikiem.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//Odby³em z nim krótk¹, ale powa¿n¹ rozmowê na ten temat.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//W koñcu siê zgodzi³.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//Prosi³ mnie, ¿ebym da³ mu chocia¿ okazjê zainteresowania ciê jego zawodem.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Dowiedz siê co i jak - zawsze mo¿esz podj¹æ decyzjê póŸniej. No chyba ¿e nie zale¿y ci na jego g³osie.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//A Bosper jeszcze ciê nie zna.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//Constantino, jak zwykle, o nic nie dba. Powiedzia³, ¿e jeœli chodzi o niego, mo¿esz siê uczyæ, czego tylko chcesz.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Constantino powiedzia³, ¿e jesteœ oskar¿ony w mieœcie o przestêpstwo. Czy to prawda?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//Jeœli tak, to powinieneœ to jak najszybciej wyjaœniæ!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Constantino nigdy o tobie nie s³ysza³.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//A Matteo powiedzia³, ¿e odda³eœ mu jego z³oto. Widzi mi siê, ¿e jesteœ honorowym m³odzieñcem.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//Matteo mówi, ¿e ci¹gle jesteœ mu coœ winien. Nie wiem, co jest miêdzy wami, ale powinieneœ to wyjaœniæ.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//A Matteo twierdzi, ¿e nie rozmawia³ z tob¹ na ten temat.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//A Matteo powiedzia³, ¿e nigdy ciê nie widzia³ w swoim sklepie.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//To oznacza, ¿e zaskarbi³eœ sobie przychylnoœæ wszystkich mistrzów!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//To oznacza, ¿e zaskarbi³eœ sobie przychylnoœæ czterech mistrzów. Wystarczy, ¿ebyœ zosta³ przyjêty na czeladnika.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Jesteœ gotów, by zacz¹æ u mnie terminowaæ?
			Info_ClearChoices(dia_harad_lehrling);
			Info_AddChoice(dia_harad_lehrling,"Dobrze. Pomyœlê o tym.",dia_harad_lehrling_later);
			Info_AddChoice(dia_harad_lehrling,"Wchodzê w to!",dia_harad_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//Aby zostaæ czeladnikiem w dolnej czêœci miasta, musisz mieæ zgodê co najmniej czterech mistrzów.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//Powinieneœ porozmawiaæ z wszystkimi, którzy wci¹¿ jeszcze nie podjêli decyzji w twojej sprawie.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Najpierw musisz udowodniæ, ¿e coœ potrafisz.
	};
};

func void dia_harad_lehrling_ok()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Wchodzê w to!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//Dobrze! Nauczê ciê, jak wykuæ porz¹dny miecz.
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//Ju¿ to potrafiê!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//Có¿, tym lepiej!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Poza tym czas, ¿ebyœ nabra³ si³. Marniejesz mi w oczach!
	};
	PLAYER_ISAPPRENTICE = APP_HARAD;
	Npc_ExchangeRoutine(lothar,"START");
	HARAD_STARTGUILD = other.guild;
	HARAD_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_logentry(TOPIC_BONUS,"Harad przyj¹³ mnie na swojego czeladnika. Droga do górnego miasta stoi przede mn¹ otworem.");
	b_logentry(TOPIC_BONUS,"Harad dobrze mi zap³aci za wykut¹ przeze mnie broñ.");
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_CITYTEACHER,"Harad mo¿e mnie nauczyæ rzemios³a kowalskiego. Mo¿e równie¿ zwiêkszyæ moj¹ si³ê.");
	Info_ClearChoices(dia_harad_lehrling);
};

func void dia_harad_lehrling_later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Dobrze - zastanowiê siê nad tym.
	if(!Npc_IsDead(brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//Nie œpiesz siê. Brian bêdzie tu jeszcze przez jakiœ czas.
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
	description = "Mogê zostaæ czeladnikiem u innego mistrza?";
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
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Mogê zostaæ czeladnikiem u innego mistrza?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//Jesteœ dobrym cz³owiekiem.
		if(MIS_HAKONBANDITS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Hakon powiedzia³ mi, jak poradzi³eœ sobie z bandytami.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//Masz moj¹ zgodê.
		if(DIA_HARAD_ZUSTIMMUNG_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			DIA_HARAD_ZUSTIMMUNG_PERMANENT = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Jeœli zechcê zostaæ czeladnikiem, Harad udzieli mi swojego poparcia.");
		if(!Npc_IsDead(brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Brian jeszcze przez jakiœ czas tu bêdzie. A potem jego miejsce zajmie jakiœ silny ch³opak.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//Inni mistrzowie mog¹ nie mieæ nic przeciwko. Ja wyra¿ê jednak zgodê, dopiero kiedy dowiedziesz, ¿e coœ umiesz!
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
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//Jesteœ teraz w stra¿y? Jestem z ciebie dumny!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//Tak d³ugo jak s³u¿ysz w wojsku, nie bêdê od ciebie wymaga³ wykonywania obowi¹zków czeladniczych.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//Jeœli jednak bêdziesz czegoœ potrzebowaæ, zawsze mo¿esz do mnie przyjœæ.
		HARAD_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (HARAD_STARTGUILD != GIL_PAL) && (HARAD_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//Uda³o ci siê wst¹piæ w szeregi paladynów!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//Cieszê siê, ¿e przyj¹³em ciê na czeladnika. Nawet pomimo tego, ¿e nie spêdzi³eœ za kowad³em zbyt du¿o czasu.
		HARAD_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (HARAD_STARTGUILD != GIL_NOV) && (HARAD_STARTGUILD != GIL_KDF) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//Wst¹pi³eœ do klasztoru. Wola³bym, ¿ebyœ zosta³ w mieœcie. Potrzebujemy ka¿dego dobrego cz³owieka.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//Widocznie jednak przeznaczone ci by³o pod¹¿aæ za g³osem Innosa.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//Jeœli bêdziesz czegoœ ode mnie potrzebowaæ, to wiesz, gdzie mnie znaleŸæ.
		HARAD_INNOSKOMMENTAR = TRUE;
	}
	else if((HARAD_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (HARAD_MILKOMMENTAR == FALSE) && (HARAD_PALKOMMENTAR == FALSE) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//Dawno ciê tutaj nie by³o. Gdzie siê pêtasz, hê?
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
	description = "Sprzedajesz te¿ broñ?";
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
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Sprzedajesz te¿ broñ?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Zapomnij o tym. Wszystko, co robiê, trafia do paladynów albo do stra¿y.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//Mam zamówienie na 100 mieczy od Lorda Hagena. Chce wyposa¿yæ w nie stra¿ miejsk¹.
};


instance DIA_HARAD_AUFGABEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_aufgaben_condition;
	information = dia_harad_aufgaben_info;
	permanent = FALSE;
	description = "Co mam robiæ jako czeladnik?";
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
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//Jakie s¹ moje obowi¹zki jako czeladnika?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Mo¿esz zgadywaæ trzy razy.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Kuæ, kuæ i jeszcze raz kuæ?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//Nie jesteœ tak g³upi, na jakiego wygl¹dasz. P³acê od ostrza. Nie pracujesz, nie dostajesz pieniêdzy. Proste.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Nauczê ciê te¿ wszystkiego, co musisz wiedzieæ, ¿eby zrobiæ zwyk³y miecz.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Wykuwanie magicznych mieczy to zadanie dla doœwiadczonych kowali - a do tego wiele ci jeszcze brakuje...
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//Jeœli potrzebujesz miejsca do spania, mo¿esz siê zadekowaæ w moim domu. Jak do tej pory wszystko jasne?
};


instance DIA_HARAD_SELLBLADES(C_INFO)
{
	npc = vlk_412_harad;
	nr = 200;
	condition = dia_harad_sellblades_condition;
	information = dia_harad_sellblades_info;
	permanent = TRUE;
	description = "Chcê sprzedaæ broñ, któr¹ wyku³em.";
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
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//Chcê sprzedaæ broñ, któr¹ wyku³em.
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
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//Masz tylko tê przy pasie. Lepiej j¹ zatrzymaj.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Wiêc zrób coœ! Przyjmujê tylko zwyk³e miecze.
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
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Dobrze. Oto twoja zap³ata.
		lohn = (anzahl_common * VALUE_COMMON1) + (anzahl_schwert1 * VALUE_SCHWERT1) + (anzahl_schwert4 * VALUE_SCHWERT4) + (anzahl_rubinklinge * VALUE_RUBINKLINGE) + (anzahl_elbastardo * VALUE_ELBASTARDO);
		lohn = lohn / 3;
		b_giveinvitems(self,other,itmi_gold,lohn);
	};
};

func void b_harad_teachsmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//To doœæ proste, ch³opcze. WeŸ kawa³ek surowej stali i trzymaj j¹ w ogniu, a¿ rozgrzeje siê do bia³oœci.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Wtedy nadaj broni kszta³t na kowadle.
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
	description = "Naucz mnie, jak wykuæ porz¹dny miecz!";
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
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Naucz mnie, jak wykuæ porz¹dny miecz!
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
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Twoje pierwsze miecze nie bêd¹ doskona³e, ale powoli wszystkiego siê nauczysz.
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
	description = "Chcê byæ silniejszy!";
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
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//Chcê byæ silniejszy!
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
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//Ju¿ nabra³eœ muskulatury.
	};
	if(other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//PrzyjdŸ, gdy bêdziesz chcia³ siê nauczyæ czegoœ wiêcej.
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
	description = "Pracujesz jeszcze dla paladynów?";
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
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Pracujesz jeszcze dla paladynów?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//Wykona³em zlecenie dla Lorda Hagena.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Teraz robiê dla niego miecze z magicznej rudy - tym razem nie za darmo.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//Mam te¿ czas, ¿eby zrobiæ na boku parê sztuk broni dla kupców na targowisko.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//Jeœli szukasz dobrego ostrza, powinieneœ z nimi porozmawiaæ.
};


instance DIA_HARAD_ABOUTERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_abouterzklingen_condition;
	information = dia_harad_abouterzklingen_info;
	permanent = FALSE;
	description = "Powiedz mi coœ wiêcej o mieczach z magicznej rudy!";
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
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Powiedz mi coœ wiêcej o mieczach z magicznej rudy!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Tworzenie magicznego ostrza to bardzo z³o¿ony i kosztowny proces. £atwo jednak w³adaæ takim mieczem, a poza tym jest on praktycznie niezniszczalny.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//To dobre ostrze, ale swoj¹ prawdziw¹ moc ujawnia dopiero w rêkach paladyna.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//Miecz paladyna zostaje poœwiêcony przez Innosa. Dziêki temu magiczne ostrze staje siê zaklêt¹ broni¹, która zadaje straszliwe rany!
};


instance DIA_HARAD_ERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_erzklingen_condition;
	information = dia_harad_erzklingen_info;
	permanent = TRUE;
	description = "Chcê kupiæ miecz z magicznej rudy.";
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
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//Chcê kupiæ miecz z magicznej rudy.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//Magiczne miecze mogê sprzedawaæ tylko paladynom. I tylko po jednym na g³owê.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//Powinniœcie siê cieszyæ, ¿e mo¿ecie dzier¿yæ tak doskona³e miecze.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//Na mocy dekretu Lorda Hagena mogê ci sprzedaæ tylko jedn¹ magiczn¹ broñ.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//Co mogê ci zaproponowaæ?
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Miecz dwurêczny (2000 sztuk z³ota)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Miecz jednorêczny (2000 sztuk z³ota)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_back()
{
	Info_ClearChoices(dia_harad_erzklingen);
};

func void b_harad_notenoughgold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//Masz za ma³o z³ota.
};

func void b_harad_havefunwithyoursword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Dbaj o swoj¹ now¹ broñ. Jest warta maj¹tek.
	OREBLADEBOUGHT = TRUE;
	Info_ClearChoices(dia_harad_erzklingen);
};

func void dia_harad_erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//Wezmê miecz dwurêczny!
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
		Info_AddChoice(dia_harad_erzklingen,"Miecz dwurêczny (2000 sztuk z³ota)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Miecz jednorêczny (2000 sztuk z³ota)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//Wezmê miecz jednorêczny!
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
		Info_AddChoice(dia_harad_erzklingen,"Miecz dwurêczny (2000 sztuk z³ota)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Miecz jednorêczny (2000 sztuk z³ota)",dia_harad_erzklingen_1h);
	};
};


instance DIA_HARAD_REPAIRNECKLACE(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_repairnecklace_condition;
	information = dia_harad_repairnecklace_info;
	permanent = FALSE;
	description = "Potrafisz naprawiæ bi¿uteriê?";
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
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Potrafisz naprawiaæ bi¿uteriê?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//Nie jestem z³otnikiem. W mieœcie raczej nie znajdziesz nikogo, kto mo¿e ci pomóc.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//Ludzie nie maj¹ pieniêdzy, a ostatnimi czasy nikt siê nie wzbogaci³.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//Wiêkszoœæ z nich cieszy siê, ¿e maj¹ co jeœæ.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_HARAD_GOLDSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_goldsmith_condition;
	information = dia_harad_goldsmith_info;
	permanent = FALSE;
	description = "Gdzie znajdê z³otnika?";
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
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Gdzie znajdê z³otnika?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//Podobno wœród najemników na farmie Onara jest dobry kowal.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Mo¿e powinieneœ z nim porozmawiaæ.
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

