
instance DIA_THEKLA_EXIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 999;
	condition = dia_thekla_exit_condition;
	information = dia_thekla_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thekla_exit_condition()
{
	return TRUE;
};

func void dia_thekla_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THEKLA_HALLO(C_INFO)
{
	npc = bau_913_thekla;
	nr = 1;
	condition = dia_thekla_hallo_condition;
	information = dia_thekla_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_hallo_condition()
{
	return TRUE;
};

func void dia_thekla_hallo_info()
{
	AI_Output(self,other,"DIA_Thekla_HALLO_17_00");	//Co robisz w mojej kuchni?
};


instance DIA_THEKLA_LECKER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 2;
	condition = dia_thekla_lecker_condition;
	information = dia_thekla_lecker_info;
	permanent = FALSE;
	description = "Co� tutaj wspaniale pachnie!";
};


func int dia_thekla_lecker_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_lecker_info()
{
	AI_Output(other,self,"DIA_Thekla_Lecker_15_00");	//Co� tutaj wspaniale pachnie!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_01");	//Och tak! Ju� ja znam takich jak ty! Myszkujecie po ca�ym domu.
	AI_Output(self,other,"DIA_Thekla_Lecker_17_02");	//Najpierw si� przymilacie, a kiedy cz�owiek chce was o co� poprosi� - nikogo nigdy nie ma!
};


var int thekla_gavestew;

instance DIA_THEKLA_HUNGER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 3;
	condition = dia_thekla_hunger_condition;
	information = dia_thekla_hunger_info;
	permanent = FALSE;
	description = "Jestem g�odny!";
};


func int dia_thekla_hunger_condition()
{
	if(THEKLA_GAVESTEW == FALSE)
	{
		return TRUE;
	};
};

func void dia_thekla_hunger_info()
{
	AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//Jestem g�odny!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//Nie karmi� w��cz�g�w. Jedzenie jest dla tych, kt�rzy pracuj�.
		AI_Output(self,other,"DIA_Thekla_Hunger_17_02");	//I dla tego najemnego mot�ochu, oczywi�cie.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//Hej, twoje �arcie.
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_04");	//Nie obs�ugujemy tu stra�nik�w.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_05");	//Jak mog�abym odm�wi� pro�bie przedstawiciela Innosa?
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	};
};


instance DIA_THEKLA_ARBEIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_arbeit_condition;
	information = dia_thekla_arbeit_info;
	permanent = FALSE;
	description = "Szukam pracy.";
};


func int dia_thekla_arbeit_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_arbeit_info()
{
	AI_Output(other,self,"DIA_Thekla_Arbeit_15_00");	//Szukam pracy...
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_01");	//Chcesz pracowa� na farmie?
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_02");	//Jedynie Onar mo�e o tym decydowa�. Farma, jak i ca�a dolina, nale�� do niego.
};


instance DIA_THEKLA_WANNAJOIN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 5;
	condition = dia_thekla_wannajoin_condition;
	information = dia_thekla_wannajoin_info;
	permanent = FALSE;
	description = "W�a�ciwie to chcia�em si� przy��czy� do najemnik�w...";
};


func int dia_thekla_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_thekla_arbeit))
	{
		return TRUE;
	};
};

func void dia_thekla_wannajoin_info()
{
	AI_Output(other,self,"DIA_Thekla_WannaJoin_15_00");	//W�a�ciwie to chcia�em si� przy��czy� do najemnik�w...
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_01");	//Jeste� wi�c jednym z tych przest�pc�w z kolonii karnej?
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_02");	//Mog�am si� domy�li�! Zostaw mnie w spokoju! Jest was tu woko�o ju� dostatecznie wielu!
};


instance DIA_THEKLA_SCHLAFEN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 6;
	condition = dia_thekla_schlafen_condition;
	information = dia_thekla_schlafen_info;
	permanent = FALSE;
	description = "Szukam miejsca na nocleg.";
};


func int dia_thekla_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_schlafen_info()
{
	AI_Output(other,self,"DIA_Thekla_Schlafen_15_00");	//Szukam miejsca na nocleg.
	AI_Output(self,other,"DIA_Thekla_Schlafen_17_01");	//Wybij sobie z g�owy spanie w mojej kuchni. Poszukaj sobie miejsca w stodole.
};


instance DIA_THEKLA_PROBLEM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_problem_condition;
	information = dia_thekla_problem_info;
	permanent = FALSE;
	description = "Dlaczego tak nie lubisz najemnik�w?";
};


func int dia_thekla_problem_condition()
{
	if((KAPITEL <= 3) && Npc_KnowsInfo(other,dia_thekla_wannajoin))
	{
		return TRUE;
	};
};

func void dia_thekla_problem_info()
{
	AI_Output(other,self,"DIA_Thekla_Problem_15_00");	//Dlaczego tak nie lubisz najemnik�w?
	AI_Output(self,other,"DIA_Thekla_Problem_17_01");	//Ci durnie strasznie graj� mi na nerwach! Szczeg�lnie Sylvio i jego t�usty kumpel, Bullko.
	AI_Output(self,other,"DIA_Thekla_Problem_17_02");	//Przesiaduj� tu ca�ymi dniami i uprzykrzaj� mi �ycie.
	AI_Output(self,other,"DIA_Thekla_Problem_17_03");	//Zupa za gor�ca, mi�so za twarde... I tak dalej, i tak dalej.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Thekla_Problem_15_04");	//Dlaczego wi�c nic z tym nie zrobisz?
		AI_Output(self,other,"DIA_Thekla_Problem_17_05");	//A co ja mog�, Panie M�dralo? Pogrozi� im wa�kiem? Na wie�niak�w to mo�e dzia�a, ale na tych �mierdz�cych drani nie.
	};
};


instance DIA_THEKLA_MANIEREN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_manieren_condition;
	information = dia_thekla_manieren_info;
	permanent = FALSE;
	description = "Mo�e ja nauczy�bym tych dw�ch dobrych manier?";
};


func int dia_thekla_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_thekla_problem) && (sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_thekla_manieren_info()
{
	AI_Output(other,self,"DIA_Thekla_Manieren_15_00");	//Mo�e ja nauczy�bym tych dw�ch dobrych manier?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_01");	//Lepiej uwa�aj, kochaniutki. Z tego co wiem, Sylvio nosi magiczn� zbroj�, trudno go pokona�.
	AI_Output(other,self,"DIA_Thekla_Manieren_15_02");	//A Bullko?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_03");	//Ten facet jest silny jak w�. Jak dot�d za�atwi� wszystkich, kt�rzy sprzeciwiali si� jemu b�d� Sylviowi.
};


instance DIA_THEKLA_AFTERFIGHT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_afterfight_condition;
	information = dia_thekla_afterfight_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_afterfight_condition()
{
	if((sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || ((bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (KAPITEL <= 3)))
	{
		return TRUE;
	};
};

func void dia_thekla_afterfight_info()
{
	if(bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_00");	//Pokaza�e� Bullkowi, gdzie jego miejsce, kochaniutki.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_01");	//Pokonanie tej opas�ej �wini musia�o by� strasznie m�cz�ce.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_02");	//Nie�le ci si� oberwa�o.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_03");	//A nie m�wi�am? Teraz ju� wiesz, co mia�am na my�li.
		AI_Output(other,self,"DIA_Thekla_AfterFight_15_04");	//Widz�, �e �wietnie si� bawisz.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_05");	//No ju�, nie r�b takiej miny. Nie ty pierwszy oberwa�e� od tego �miecia.
	};
	AI_Output(self,other,"DIA_Thekla_AfterFight_17_06");	//Masz, zjedz co� - to powinno doda� ci si�.
	b_giveinvitems(self,other,itfo_xpstew,1);
	THEKLA_GAVESTEW = TRUE;
};


instance DIA_THEKLA_SAGITTAPAKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_sagittapaket_condition;
	information = dia_thekla_sagittapaket_info;
	permanent = TRUE;
	description = "Mam tu przesy�k� od Sagitty.";
};


func int dia_thekla_sagittapaket_condition()
{
	if(Npc_HasItems(other,itmi_theklaspaket) && (MIS_THEKLA_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thekla_sagittapaket_info()
{
	b_giveinvitems(other,self,itmi_theklaspaket,1);
	AI_Output(other,self,"DIA_Thekla_SagittaPaket_15_00");	//Mam tu przesy�k� od Sagitty.
	AI_Output(self,other,"DIA_Thekla_SagittaPaket_17_01");	//Wielkie dzi�ki. Jednak na co� si� przyda�e�.
	MIS_THEKLA_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_THEKLASPAKET);
};


var int thekla_mehreintopfkap1;
var int thekla_mehreintopfkap3;
var int thekla_mehreintopfkap5;

instance DIA_THEKLA_PERM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_perm_condition;
	information = dia_thekla_perm_info;
	permanent = TRUE;
	description = "Dostan� jeszcze troch� gulaszu?";
};


func int dia_thekla_perm_condition()
{
	if(THEKLA_GAVESTEW == TRUE)
	{
		return TRUE;
	};
};

func void dia_thekla_perm_info()
{
	AI_Output(other,self,"DIA_Thekla_PERM_15_00");	//Dostan� jeszcze troch� gulaszu?
	if(MIS_THEKLA_PAKET == FALSE)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_01");	//Ju� nie ma.
		AI_Output(other,self,"DIA_Thekla_PERM_15_02");	//Nawet ma�ej miseczki?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//Nawet miseczki.
		AI_Output(other,self,"DIA_Thekla_PERM_15_04");	//Mog� wyliza� garnek?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//Daj spok�j!
		AI_Output(self,other,"DIA_Thekla_PERM_17_06");	//Skoro tak ci smakuje m�j gulasz, b�dziesz musia� co� zrobi�, by go dosta�.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//Co takiego?
		AI_Output(self,other,"DIA_Thekla_PERM_17_08");	//Udaj si� do Sagitty, wied�my mieszkaj�cej za farm� Sekoba, i przynie� mi od niej paczk� zi�.
		AI_Output(self,other,"DIA_Thekla_PERM_17_09");	//Je�li przyniesiesz zio�a, ugotuj� gulasz.
		MIS_THEKLA_PAKET = LOG_RUNNING;
		CreateInvItems(sagitta,itmi_theklaspaket,1);
		Log_CreateTopic(TOPIC_THEKLAEINTOPF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_THEKLAEINTOPF,LOG_RUNNING);
		b_logentry(TOPIC_THEKLAEINTOPF,"Je�li przynios� Thekli zio�a od uzdrawiaczki Sagitty, mog� liczy� na kolejny posi�ek. Sagitta mieszka za farm� Sekoba.");
	}
	else if(MIS_THEKLA_PAKET == LOG_SUCCESS)
	{
		if(KAPITEL <= 2)
		{
			if(THEKLA_MEHREINTOPFKAP1 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_10");	//W porz�dku. Znaj moje dobre serce. Prosz�, nie chc�, �eby� si� biedaczku zag�odzi�.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP1 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_11");	//Hej, hej, hej! Nie tak �apczywie! Dam ci zna�, je�li b�d� mia�a dla ciebie jakie� zadanie.
				AI_Output(self,other,"DIA_Thekla_PERM_17_12");	//Wtedy dostaniesz wi�cej gulaszu, zrozumiano?
			};
		};
		if((KAPITEL == 3) || (KAPITEL == 4))
		{
			if((THEKLA_MEHREINTOPFKAP3 == FALSE) && (MIS_RESCUEBENNET == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_13");	//S�ysza�am, �e pomog�e� Bennetowi. Dobra robota, ch�opcze.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP3 = TRUE;
			}
			else if(MIS_RESCUEBENNET != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_14");	//Te psubraty ze stra�y uwi�zi�y Benneta!
				AI_Output(self,other,"DIA_Thekla_PERM_17_15");	//Zr�b co� dla mnie i wyci�gnij tego nieszcz�nika. W mi�dzyczasie ugotuj� troch� smakowitego gulaszu.
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_16");	//Nic ju� nie zosta�o. Przyjd� p�niej.
			};
		};
		if(KAPITEL >= 5)
		{
			if(THEKLA_MEHREINTOPFKAP5 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_17");	//Nigdy nie przestajesz by� g�odny? Czym ty si� w�a�ciwie zajmujesz?
				AI_Output(other,self,"DIA_Thekla_PERM_15_18");	//W�a�nie posieka�em kilka smok�w.
				AI_Output(self,other,"DIA_Thekla_PERM_17_19");	//Och! W takim razie zas�u�y�e� chyba na porz�dn� mich� gulaszu.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP5 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_20");	//To wszystko, nie ma ju� wi�cej.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_21");	//Nie ma zi�, nie ma gulaszu - jasne?
	};
};


instance DIA_THEKLA_PICKPOCKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_pickpocket_condition;
	information = dia_thekla_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_thekla_pickpocket_condition()
{
	return c_beklauen(53,60);
};

func void dia_thekla_pickpocket_info()
{
	Info_ClearChoices(dia_thekla_pickpocket);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_BACK,dia_thekla_pickpocket_back);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_PICKPOCKET,dia_thekla_pickpocket_doit);
};

func void dia_thekla_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thekla_pickpocket);
};

func void dia_thekla_pickpocket_back()
{
	Info_ClearChoices(dia_thekla_pickpocket);
};

