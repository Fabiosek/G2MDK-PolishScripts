
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
	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//Jestem Bosper. Wyrabiam ³uki i handlujê futrami.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//Co ciê sprowadza do Khorinis?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Bosper produkuje ³uki i handluje skórami. Jego sklep mieœci siê przy wschodniej bramie, w dolnej czêœci miasta.");
};


instance DIA_BOSPER_INTOOV(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_intoov_condition;
	information = dia_bosper_intoov_info;
	permanent = FALSE;
	description = "Muszê siê dostaæ go górnego miasta...";
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
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//Muszê siê dostaæ go górnego miasta...
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//Tam, gdzie s¹ paladyni? Zapomnij o tym.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//Musia³byœ byæ szanowanym obywatelem albo przynajmniej mieæ porz¹dn¹ pracê.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//Obcy nie ma szans siê tam dostaæ.
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//Zauwa¿y³em..
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"Aby uzyskaæ dostêp do górnego miasta, muszê zostaæ szanowanym obywatelem albo znaleŸæ sobie jak¹œ pracê.");
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
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//Hmmm - przyda³by mi siê nowy czeladnik.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//Poprzedni zrezygnowa³ dwa dni temu.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//A wiêc, znasz siê trochê na polowaniu?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Hmm... Có¿...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//Mogê ciê nauczyæ, jak siê obdziera ze skóry zwierzêta.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//Dobrze ci zap³acê za ka¿d¹ skórê, jak¹ mi przyniesiesz.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//Jeœli o to chodzi, to mogê ci dostarczyæ trochê skór.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//Wspaniale! Przynieœ mi tyle skór, ile zdo³asz. Zap³acê ci za nie dobr¹ cenê.
	};
	b_logentry(TOPIC_LEHRLING,"Bosper potrzebuje nowego czeladnika. Móg³bym siê u niego zatrudniæ.");
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
	description = "Chcê zostaæ twoim czeladnikiem.";
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
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//Chcê zostaæ twoim czeladnikiem.
	if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//Hej... Wspaniale! Wygl¹da na to, ¿e ju¿ znasz podstawy.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//Harad uwa¿a, ¿e jesteœ dobrym cz³owiekiem.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//Ale Harad w¹tpi w twoje umiejêtnoœci.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//Ale Harad mówi, ¿e nigdy ciê nie widzia³.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//Thorben da³ ci swoje b³ogos³awieñstwo. Nie jestem zbyt pobo¿ny, ale mnie to nie przeszkadza.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//Thorben poprze ciê tylko wtedy, kiedy zdobêdziesz b³ogos³awieñstwo bogów.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//Thorben nie wie, kim jesteœ.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//Constantino powiedzia³, ¿e jeœli o niego chodzi, to mo¿esz siê zapisaæ, gdzie chcesz.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//Constantino powiedzia³, ¿e zosta³eœ tu w mieœcie oskar¿ony o pope³nienie przestêpstwa. Mam nadziejê, ¿e to jakiœ drobiazg?
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//Dopilnuj, ¿eby ta sprawa siê wyjaœni³a.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//Constantino nigdy o tobie nie s³ysza³.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//A Matteo mówi, ¿e jesteœ wart swojej wagi w z³ocie.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//A Matteo wspomina³ coœ o d³ugach - lepiej z nim porozmawiaj.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//Matteo mówi, ¿e jeszcze z tob¹ o tym nie rozmawia³.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//Matteo mówi, ¿e nigdy ciê nie widzia³.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//A to oznacza, ¿e masz poparcie wszystkich mistrzów!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//Popiera ciê teraz czterech mistrzów. To wystarczy, ¿eby ciê przyj¹æ na czeladnika.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//Mo¿esz dla mnie pracowaæ, kiedy tylko chcesz.
			Info_ClearChoices(dia_bosper_lehrling);
			Info_AddChoice(dia_bosper_lehrling,"Dobrze. Pomyœlê o tym.",dia_bosper_lehrling_later);
			Info_AddChoice(dia_bosper_lehrling,"Wchodzê w to!",dia_bosper_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//Musisz mieæ poparcie co najmniej czterech mistrzów, ¿eby zostaæ czeladnikiem w tym mieœcie.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//To znaczy, ¿e powinieneœ porozmawiaæ z tymi, którzy na razie niezbyt ciê popieraj¹.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//Zanim ciê przyjmê, muszê oczywiœcie wiedzieæ, czy w ogóle siê nadajesz.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//Zwróci³eœ mi mój ³uk, ale to nie œwiadczy o twoich talentach myœliwskich.
		};
		BOSPER_HINTTOJOB = TRUE;
	};
};

func void dia_bosper_lehrling_ok()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//Wchodzê w to!
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//Nie po¿a³ujesz! Myœlê, ¿e dobrze nam siê bêdzie razem pracowa³o.
	PLAYER_ISAPPRENTICE = APP_BOSPER;
	Npc_ExchangeRoutine(lothar,"START");
	BOSPER_STARTGUILD = other.guild;
	BOSPER_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Bosper przyj¹³ mnie na swojego czeladnika. Droga do górnego miasta stoi przede mn¹ otworem.");
	Info_ClearChoices(dia_bosper_lehrling);
};

func void dia_bosper_lehrling_later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//Dobrze. Pomyœlê o tym.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//Podejmij dobr¹ decyzjê! By³byœ dla mnie œwietnym kandydatem.
	Info_ClearChoices(dia_bosper_lehrling);
};


instance DIA_BOSPER_OTHERMASTERS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_othermasters_condition;
	information = dia_bosper_othermasters_info;
	permanent = FALSE;
	description = "A co, jeœli chcê pracowaæ dla innego mistrza?";
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
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//A co, jeœli chcê pracowaæ dla innego mistrza?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//Bzdura!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//Harad i Matteo maj¹ czeladników.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//Alchemik Constantino to samotnik - od lat nie mia³ ucznia.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//A co do Thorbena... Wszyscy wiedz¹, ¿e jest kompletnie sp³ukany. Pewnie nie mia³by ci nawet czym zap³aciæ.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//Z kolei ja pilnie potrzebujê czeladnika. No i dobrze p³acê.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//Ale niezale¿nie, gdzie siê chcesz zatrudniæ i tak potrzebna ci bêdzie zgoda wszystkich mistrzów z dolnej czêœci miasta...
};


instance DIA_BOSPER_BARTOK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 4;
	condition = dia_bosper_bartok_condition;
	information = dia_bosper_bartok_info;
	permanent = FALSE;
	description = "Dlaczego twój czeladnik zrezygnowa³?";
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
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//Dlaczego twój czeladnik zrezygnowa³?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//Powiedzia³ tylko, ¿e w okolicy zrobi³o siê zbyt niebezpiecznie.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//Jeœli to ciê naprawdê ciekawi, mo¿esz go zapytaæ.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//Nazywa siê Bartok. Pewnie krêci siê gdzieœ ko³o ober¿y Coragona.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//PrzejdŸ ko³o kuŸni, a dalej prosto.
};


instance DIA_BOSPER_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_zustimmung_condition;
	information = dia_bosper_zustimmung_info;
	permanent = TRUE;
	description = "Czy zgodzisz siê, ¿ebym zawar³ umowê z innym mistrzem?";
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
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//Czy zgodzisz siê, ¿ebym zawar³ umowê z innym mistrzem?
	if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//Mia³em nadziejê, ¿e bêdziesz pracowa³ dla mnie.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//Ale skoro tego chcesz...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//Czy to znaczy, ¿e mnie poprzesz?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//Jeœli pozostali mistrzowie nie zaprotestuj¹ - tak.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//W koñcu zwróci³eœ mi mój ³uk.
		};
		if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//Ale na pewno by³byœ dobrym myœliwym.
		};
		if(BOSPER_ZUSTIMMUNG_ONCE == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			BOSPER_ZUSTIMMUNG_ONCE = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Jeœli zechcê zostaæ czeladnikiem, Bosper udzieli mi swojego poparcia.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//W porz¹dku! Dostaniesz moj¹ zgodê - ale pod jednym warunkiem.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//Pracuj dla mnie, przynajmniej przez jakiœ czas.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//Wtedy sam ocenisz, czy odpowiada ci moje rzemios³o.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//A kto wie - mo¿e to polubisz i zostaniesz ze mn¹.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//Jeœli jesteœ doœæ dobry, by pracowaæ dla mnie, to u innych te¿ sobie poradzisz.
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
	description = "Co mam dla ciebie zrobiæ?";
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
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//Co mam dla ciebie zrobiæ?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//Nauczê ciê, jak obdzieraæ ze skóry zwierzynê, a ty mi przyniesiesz, no powiedzmy, pó³ tuzina wilczych futer.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Bosper mo¿e mnie nauczyæ, jak obdzieraæ ze skóry zwierzêta.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//Przynieœ mi pó³ tuzina wilczych futer.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//Wtedy bêdê wiedzia³, ¿e opanowa³eœ swój fach.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//Jeœli nie zajmie ci to ca³ego ¿ycia i skóry bêd¹ w znoœnym stanie, to ciê przyjmê.
	if(Npc_KnowsInfo(other,dia_bosper_othermasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//Albo bêdziesz móg³ naj¹æ siê u innego mistrza. Jeœli tego naprawdê chcesz.
	};
	MIS_BOSPER_WOLFFURS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOSPERWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERWOLF,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERWOLF,"Mam przynieœæ Bosperowi szeœæ wilczych skór. Kiedy ju¿ wykonam zadanie, zatrudni mnie jako swojego czeladnika albo udzieli poparcia, jeœli zechcê pracowaæ u innego mistrza.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		b_logentry(TOPIC_BOSPERWOLF,"Chcia³bym, ¿eby Bosper nauczy³ mnie oprawiaæ zwierzêta.");
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
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//Jesteœ teraz czeladnikiem innego mistrza. Kupiê od ciebie skóry po zwyk³ej cenie.
		MIS_BOSPER_WOLFFURS = LOG_OBSOLETE;
		return;
	};
	if(b_giveinvitems(other,self,itat_wolffur,6))
	{
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//Mam je, proszê.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//Wspaniale! Wiedzia³em, ¿e nadajesz siê do tej pracy.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//A oto zap³ata, tak jak obiecywa³em.
		b_giveinvitems(self,other,itmi_gold,VALUE_WOLFFUR * 6);
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//I co? Co myœlisz? Czy to nie lepsza praca ni¿ kucie mieczy po ca³ych dniach albo nape³nianie ma³ych buteleczek w zakurzonej komnacie?
		MIS_BOSPER_WOLFFURS = LOG_SUCCESS;
		b_logentry(TOPIC_LEHRLING,"Bosper przyjmie mnie na czeladnika, jeœli pozostali mistrzowie udziel¹ mi swojego poparcia.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//Umawialiœmy siê na pó³ tuzina, ale masz jeszcze czas. Ruszaj i przynieœ mi te skóry.
	};
};


instance DIA_BOSPER_TEACHFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_teachfur_condition;
	information = dia_bosper_teachfur_info;
	permanent = TRUE;
	description = "Naucz mnie, jak obdzieraæ zwierzynê ze skóry.";
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
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Naucz mnie, jak obdzieraæ zwierzynê ze skóry.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Dobrze. S³uchaj. To doœæ proste.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//Ostrym no¿em rozcinasz brzuch zwierzêcia. Potem robisz ma³e naciêcia po wewnêtrznej stronie ³ap i œci¹gasz skórê.
		if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//Przynieœ mi te wilcze skóry, to zobaczymy...
			b_logentry(TOPIC_BOSPERWOLF,"Bosper nauczy³ mnie, jak obdzieraæ zwierzynê ze skóry.");
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
	description = "Poka¿ mi swoje towary.";
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
	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//Poka¿ mi swoje towary.
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
		AI_Output(self,other,"DIA_Bosper_Trade_11_01");	//Nie jesteœ tu po to, ¿eby ogl¹daæ moje towary! Masz mi przynieœæ te skóry!
		AI_Output(self,other,"DIA_Bosper_Trade_11_02");	//Wiêc do roboty!
	};
};


instance DIA_BOSPER_BOGENRUNNING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 5;
	condition = dia_bosper_bogenrunning_condition;
	information = dia_bosper_bogenrunning_info;
	permanent = FALSE;
	description = "S³ysza³em, ¿e ktoœ ciê okrad³.";
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
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//S³ysza³em, ¿e ktoœ ciê okrad³.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//Kto ci to powiedzia³? Pewnie Bartok, co? Nie mia³ nic ciekawszego do powiedzenia? No có¿.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//Mówiê ci, jak dorwê tego drania, to niech siê lepiej modli!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//Wyszed³em ze sklepu tylko na chwilê. Kiedy wróci³em, zd¹¿y³em tylko zobaczyæ, jak wychodzi - z moim ³ukiem na ramieniu.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//Od razu wezwa³em stra¿ników, ale ten niegodziwiec uciek³ do portu. I tam go zgubili.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//Narobi³em takiego szumu, ¿e stra¿ przetrz¹snê³a ca³¹ dzielnicê portow¹. Ale nic nie znaleŸli.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//Cholerne obiboki!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//Za³o¿ê siê, ¿e mój ³uk jest ci¹gle w mieœcie. Poinformowa³em stra¿e przy obu bramach i nie widzieli, ¿eby ktoœ wychodzi³ z moim ³ukiem.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//Jak dorwê tego ³obuza...
	Log_CreateTopic(TOPIC_BOSPERBOGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERBOGEN,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERBOGEN,"Bosperowi skradziono ³uk. Z³odziej skierowa³ siê do przystani i tam przepad³ jak kamieñ w wodê. Stra¿nicy miejscy przeszukali ca³¹ dzielnicê portow¹, lecz nie uda³o im siê nic znaleŸæ. Istnieje jednak du¿e prawdopodobieñstwo, ¿e z³odziej nie opuœci³ jeszcze miasta.");
};


instance DIA_BOSPER_BOGENSUCCESS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 6;
	condition = dia_bosper_bogensuccess_condition;
	information = dia_bosper_bogensuccess_info;
	permanent = FALSE;
	description = "S¹dzê, ¿e to twój ³uk...";
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
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//S¹dzê, ¿e to twój ³uk...
	b_giveinvitems(other,self,itrw_bow_l_03_mis,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//Mój ³uk! Gdzie go znalaz³eœ?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//W ciemnej norze pe³nej szczurów.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//Mam nadziejê, ¿e nie wpakowa³eœ siê w k³opoty...
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//Nie - robi³em ju¿ takie rzeczy wczeœniej.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//Hmmm. Tak czy inaczej, dziêkujê. Jestem twoim d³u¿nikiem.
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
	description = "Co s³ychaæ w mieœcie?";
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
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//Co s³ychaæ w mieœcie?
	if(BOSPER_ISLAND == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//Jeœli orkowie naprawdê zaczn¹ oblegaæ miasto, to bêdzie tu nieprzyjemnie.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//Jest tylko jeden statek i pilnuj¹ go paladyni. Nie s¹dzê, ¿eby u¿yli go do ewakuacji obywateli.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//Nie ma innego sposobu, ¿eby siê st¹d wydostaæ?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//Nie. Nikt nie opuœci wyspy bez statku.
		BOSPER_ISLAND = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//Jak na razie nic nowego. Wpadnij póŸniej.
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
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//Zaci¹gn¹³eœ siê do stra¿y, co?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//Nie, ¿eby mnie to obchodzi³o. Dopóki poluj¹c na orków i bandytów, nie zapomnisz upolowaæ kilku wilków.
		BOSPER_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (BOSPER_STARTGUILD != GIL_PAL) && (BOSPER_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//Wygl¹da na to, ¿e twoja kariera toczy siê jak lawina. Paladyn Króla!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//Nie zapomnij o swoim starym mistrzu...
		BOSPER_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (BOSPER_STARTGUILD != GIL_NOV) && (BOSPER_STARTGUILD != GIL_KDF) && (BOSPER_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//Poszed³eœ do klasztoru, co? Mam nadziejê, ¿e bêd¹ ciê wystarczaj¹co czêsto wypuszczaæ, ¿ebyœ nadal zaopatrywa³ mnie w skóry...
		BOSPER_INNOSKOMMENTAR = TRUE;
	}
	else if((BOSPER_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//Gdzie siê szwenda³eœ tyle czasu?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//Potrzebujê wiêcej skór, przynios³eœ jakieœ?
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
	description = "Co mam robiæ jako czeladnik?";
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
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//Co mam robiæ jako czeladnik?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//To proste. Przynieœ mi tyle futer, ile zdo³asz.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//Zap³acê ci za nie lepsz¹ cenê ni¿ ka¿dy inny handlarz.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//Poza tym, mo¿esz siê w ogóle nie pokazywaæ w sklepie. Poradzê sobie œwietnie sam.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//A gdzie mam spaæ?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//Nie mam tu dla ciebie pokoju. Powinieneœ znaleŸæ jakieœ ³ó¿ko w gospodzie ko³o placu targowego.
	};
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Bosper skupuje skóry zwierzêce po wyj¹tkowo dobrej cenie.");
};


var int bosper_trollfursold;

instance DIA_BOSPER_SELLFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 600;
	condition = dia_bosper_sellfur_condition;
	information = dia_bosper_sellfur_info;
	permanent = TRUE;
	description = "Mam dla ciebie kilka skór...";
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
	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//Mam dla ciebie kilka skór...
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
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//Owcze skóry? Chyba nie zat³uk³eœ jakiemuœ wieœniakowi jego owiec, co?
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//Nawet bym o tym nie pomyœla³...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_sheepfur) * VALUE_SHEEPFUR);
			b_giveinvitems(other,self,itat_sheepfur,Npc_HasItems(other,itat_sheepfur));
		};
		if(Npc_HasItems(other,itat_wolffur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//Wilcza skóra, nieŸle...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wolffur) * VALUE_WOLFFUR);
			b_giveinvitems(other,self,itat_wolffur,Npc_HasItems(other,itat_wolffur));
		};
		if(Npc_HasItems(other,itat_wargfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//Skóra warga? Te bestie s¹ niebezpieczne...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wargfur) * VALUE_WARGFUR);
			b_giveinvitems(other,self,itat_wargfur,Npc_HasItems(other,itat_wargfur));
		};
		if(Npc_HasItems(other,itat_shadowfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//Och, nawet skóra cieniostwora - takie s¹ sporo warte.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_shadowfur) * VALUE_SHADOWFUR);
			b_giveinvitems(other,self,itat_shadowfur,Npc_HasItems(other,itat_shadowfur));
		};
		if((Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0))
		{
			if(BOSPER_TROLLFURSOLD == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//A co TO za skóra?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//Zdar³em j¹ z trolla.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//To... to jest warte ma³¹ fortunê.
				BOSPER_TROLLFURSOLD = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//Kolejna trollowa skóra... Czy ty na nie polujesz?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//Nie, po prostu korzystam z ka¿dej okazji...
			};
			if(Npc_HasItems(other,itat_trollfur) > 0)
			{
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollfur) * VALUE_TROLLFUR);
				b_giveinvitems(other,self,itat_trollfur,Npc_HasItems(other,itat_trollfur));
			};
			if(Npc_HasItems(other,itat_trollblackfur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//No proszê, skóra czarnego trolla!
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollblackfur) * VALUE_TROLLBLACKFUR);
				b_giveinvitems(other,self,itat_trollblackfur,Npc_HasItems(other,itat_trollblackfur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//Dobra robota. PrzyjdŸ do mnie, jak bêdziesz mia³ nastêpne...
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//Ale pamiêtaj - interesuj¹ mnie tylko skóry wilków, cieniostworów i tym podobne...
	};
};


instance DIA_BOSPER_MINENANTEIL(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_minenanteil_condition;
	information = dia_bosper_minenanteil_info;
	description = "Widzê, ¿e masz na sprzeda¿ udzia³y w kopalni.";
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
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//Widzê, ¿e masz na sprzeda¿ udzia³y w kopalni.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//Eee... Ja nic o tym nie wiem. Mo¿esz je zatrzymaæ, jeœli chcesz.
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

