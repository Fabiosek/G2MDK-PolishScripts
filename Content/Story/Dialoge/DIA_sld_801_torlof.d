
instance DIA_TORLOF_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_exit_condition;
	information = dia_torlof_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_torlof_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_HALLO(C_INFO)
{
	npc = sld_801_torlof;
	nr = 1;
	condition = dia_torlof_hallo_condition;
	information = dia_torlof_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_hallo_info()
{
	AI_Output(self,other,"DIA_Torlof_Hallo_01_00");	//Oj czego ode mnie chcesz?
};


instance DIA_TORLOF_WANNAJOIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 2;
	condition = dia_torlof_wannajoin_condition;
	information = dia_torlof_wannajoin_info;
	permanent = FALSE;
	description = "Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?";
};


func int dia_torlof_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_torlof_wannajoin_info()
{
	AI_Output(other,self,"DIA_Torlof_WannaJoin_15_00");	//Chc� si� przy��czy� do najemnik�w.
	AI_Output(self,other,"DIA_Torlof_WannaJoin_01_01");	//Tak? A dlaczego niby mia�bym pozwoli�, �eby� do nas do��czy�?
};


var int torlof_go;

instance DIA_TORLOF_PROBE(C_INFO)
{
	npc = sld_801_torlof;
	nr = 3;
	condition = dia_torlof_probe_condition;
	information = dia_torlof_probe_info;
	permanent = TRUE;
	description = "Poddaj mnie pr�bie!";
};


func int dia_torlof_probe_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_wannajoin) && (hero.guild == GIL_NONE) && (TORLOF_GO == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_probe_info()
{
	AI_Output(other,self,"DIA_Torlof_Probe_15_00");	//Poddaj mnie pr�bie!
	AI_Output(self,other,"DIA_Torlof_Probe_01_01");	//Czy to Lee przys�a� ci� do mnie?
	if(Npc_KnowsInfo(other,dia_lee_othersld))
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_02");	//Powiedzia�, �e mo�esz mi pom�c.
		AI_Output(self,other,"DIA_Torlof_Probe_01_03");	//Aj... No dobra, niech ju� b�dzie. Zanim pozwolimy ci do nas do��czy�, musisz zrobi� dwie rzeczy.
		AI_Output(self,other,"DIA_Torlof_Probe_01_04");	//Po pierwsze: musisz udowodni�, �e nadajesz si� do roboty najemnika. W tym celu poddam ci� pr�bie.
		AI_Output(self,other,"DIA_Torlof_Probe_01_05");	//Po drugie: musisz zas�u�y� na szacunek pozosta�ych ch�opak�w.
		TORLOF_GO = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
		b_logentry(TOPIC_BECOMESLD,"Aby m�c zosta� najemnikiem, musz� podda� si� pr�bie Torlofa i zyska� szacunek pozosta�ych najemnik�w.");
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//Nie.
		AI_Output(self,other,"DIA_Torlof_Probe_01_07");	//Wi�c po choler� zawracasz mi g�ow�?
		AI_StopProcessInfos(self);
	};
};


instance DIA_TORLOF_RESPEKT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 4;
	condition = dia_torlof_respekt_condition;
	information = dia_torlof_respekt_info;
	permanent = FALSE;
	description = "Jak mog� zdoby� szacunek pozosta�ych najemnik�w?";
};


func int dia_torlof_respekt_condition()
{
	if((TORLOF_GO == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_respekt_info()
{
	AI_Output(other,self,"DIA_Torlof_Respekt_15_00");	//Jak mog� zdoby� szacunek pozosta�ych najemnik�w?
	AI_Output(self,other,"DIA_Torlof_Respekt_01_01");	//Wi�kszo�ci z nich wystarczy, �e wype�nisz moje zadanie.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_02");	//Ale cz�� z nich trzeba b�dzie przekona� w inny spos�b.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_03");	//Niekt�rzy spr�buj� wykorzysta� sytuacj�, innym mo�e si� po prostu nie spodoba� twoja bu�ka.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_04");	//Spr�buj skumplowa� si� z mo�liwie du�� cz�ci� grupy. Ostatecznie zawsze mo�esz wzi�� udzia� w pojedynku.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_05");	//Je�li wygrasz, zdob�dziesz szacunek wi�kszo�ci najemnik�w. Tylko w �adnym razie nie zabij kt�rego� z nich, bo dopiero wtedy b�dziesz mia� problem.
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"Je�li chc� zyska� szacunek pozosta�ych najemnik�w, musz� przej�� przez pr�b� Torlofa albo pokona� ich w pojedynku.");
};


instance DIA_TORLOF_DUELLREGELN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 5;
	condition = dia_torlof_duellregeln_condition;
	information = dia_torlof_duellregeln_info;
	permanent = FALSE;
	description = "Jakie s� regu�y pojedynku?";
};


func int dia_torlof_duellregeln_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_respekt) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_torlof_duellregeln_info()
{
	AI_Output(other,self,"DIA_Torlof_Duellregeln_15_00");	//Jakie s� zasady pojedynku?
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_01");	//Bardzo proste. Uczestnicy musz� mie� szans� na wyci�gni�cie or�a, nim padnie pierwszy cios.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_02");	//Nie mo�esz tak po prostu przy�o�y� komu�, bez ostrze�enia.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_03");	//Walk� musi poprzedzi� s�owne wyzwanie. Wystarczy solidna obelga lub inny pow�d do bitki.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_04");	//�aden z widz�w nie ma prawa w��czy� si� do walki, chyba �e jeden z jej uczestnik�w zostanie zabity.
	b_logentry(TOPIC_SLDRESPEKT,"Zasady pojedynku: nale�y zacz�� od wyzwania przeciwnika, dzi�ki czemu w walk� nie zaanga�uj� si� osoby postronne. Nie wolno zabi� rywala.");
};


instance DIA_TORLOF_DEINESTIMME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 6;
	condition = dia_torlof_deinestimme_condition;
	information = dia_torlof_deinestimme_info;
	permanent = FALSE;
	description = "A co z tob�? Mog� liczy� na tw�j g�os?";
};


func int dia_torlof_deinestimme_condition()
{
	if((TORLOF_GO == TRUE) && (other.guild == GIL_NONE) && (MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_torlof_deinestimme_info()
{
	AI_Output(other,self,"DIA_Torlof_DeineStimme_15_00");	//A co z tob�? Mog� liczy� na tw�j g�os?
	AI_Output(self,other,"DIA_Torlof_DeineStimme_01_01");	//Je�li udowodnisz mi, �e poradzisz sobie jako najemnik - tak.
};


var int points_sld;

instance DIA_TORLOF_RUF(C_INFO)
{
	npc = sld_801_torlof;
	nr = 7;
	condition = dia_torlof_ruf_condition;
	information = dia_torlof_ruf_info;
	permanent = TRUE;
	description = "Co s�dz� o mnie najemnicy?";
};


func int dia_torlof_ruf_condition()
{
	if((TORLOF_GO == TRUE) && (TORLOF_GENUGSTIMMEN == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_ruf_info()
{
	AI_Output(other,self,"DIA_Torlof_RUF_15_00");	//Co s�dz� o mnie najemnicy?
	AI_Output(self,other,"DIA_Torlof_RUF_01_01");	//Pomy�lmy...
	POINTS_SLD = 0;
	if(Npc_IsDead(sld_wolf))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(sld_wolf.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_02");	//Wilk m�wi, �e nie ma nic przeciwko tobie.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(Npc_IsDead(jarvis))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(MIS_JARVIS_SLDKO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_03");	//Jarvis s�dzi, �e si� nadasz.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(jarvis.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_04");	//Jarvis ci�gle nie jest pewien, czy si� nadasz.
		AI_Output(self,other,"DIA_Torlof_RUF_01_05");	//Nie chce tutaj wi�cej idiot�w pokroju Sylvia. Prawd� m�wi�c - ja te� nie.
	};
	if(Npc_IsDead(cord))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(CORD_APPROVED == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_06");	//Cord uwa�a, �e mo�esz do nas do��czy�.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cord.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_07");	//Cord uwa�a, �e musisz najpierw podszkoli� si� troch� w walce or�em.
	};
	if(Npc_IsDead(cipher))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if((MIS_CIPHER_PAKET == LOG_SUCCESS) || (MIS_CIPHER_BRINGWEED == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_08");	//Cipher m�wi, �e musimy ci� koniecznie przyj��. Chyba ma o tobie bardzo wysokie mniemanie.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cipher.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_09");	//Cipher m�wi, �e jeste� mu winien przys�ug�, i �e b�dziesz wiedzia�, o co chodzi.
	};
	if(Npc_IsDead(rod))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(rod,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_10");	//Rod chce po prostu odzyska� sw�j miecz.
	}
	else if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_11");	//Chyba przekona�e� Roda, �e jeste� wystarczaj�co silny.
		if(rod.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			POINTS_SLD = POINTS_SLD + 1;
		};
	}
	else if(rod.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_12");	//Rod uwa�a ci� za mi�czaka.
	};
	if(Npc_IsDead(sentenza))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(sentenza,itmi_gold) >= 50)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_13");	//Sentenza b�dzie na ciebie g�osowa�. Twierdzi, �e r�wny z ciebie go��.
		POINTS_SLD = POINTS_SLD + 1;
		TORLOF_SENTENZACOUNTED = TRUE;
	}
	else if(sentenza.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_14");	//Sentenza nie b�dzie na ciebie g�osowa�. Podobno jeste� mu winien 50 sztuk z�ota.
	};
	if(Npc_IsDead(raoul))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(raoul.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_15");	//Raoul jest przeciw tobie. Facet chyba ci� po prostu nie lubi.
	};
	if(Npc_IsDead(bullco))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(bullco.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_16");	//O Sylviu i Bullku nie musz� chyba nawet m�wi�. Ci dwaj kretyni nie popr� nikogo.
	};
	if(Npc_IsDead(buster))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(BUSTER_DUELL == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_17");	//Buster m�wi, �e jeste� w porz�dku.
		if(buster.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_18");	//Chocia� z nim przegra�e�.
		};
	}
	else if(buster.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_19");	//Buster powiedzia� mi, �e stch�rzy�e�, gdy wyzwa� ci� na pojedynek.
		AI_Output(self,other,"DIA_Torlof_RUF_01_20");	//To by� kiepski pomys�. Mo�e powiniene� wr�ci� i wyzwa� go jeszcze raz?
	};
	if(Npc_IsDead(dar))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_21");	//A Dar ma ci� za kapusia. Na szcz�cie dla ciebie jego g�osem nikt si� tutaj nie przejmuje.
	};
	if(POINTS_SLD > 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_22");	//Reszta najemnik�w nie zaj�a �adnego stanowiska.
	};
	if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_23");	//Wi�kszo�� z nich czeka, aby przekona� si�, czy przejdziesz moj� pr�b�.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_24");	//Wi�kszo�� z nich przekona�e�, przechodz�c pr�b�.
		if(CORD_RANGERHELP_TORLOFSPROBE == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Torlof_RUF_01_00");	//Nawet je�li Cord si� temu troch� przys�u�y�...
			POINTS_SLD = POINTS_SLD + 4;
		}
		else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_25");	//Chocia� niekt�rzy s�dz�, �e zmuszenie farmera do zap�acenia czynszu to zbyt �atwe zadanie.
			POINTS_SLD = POINTS_SLD + 3;
		}
		else
		{
			POINTS_SLD = POINTS_SLD + 5;
		};
		AI_Output(self,other,"DIA_Torlof_RUF_01_26");	//Na m�j g�os mo�esz w ka�dym razie liczy�.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(SLD_DUELLE_GEWONNEN >= 3)
	{
		POINTS_SLD = POINTS_SLD + 1;
		if(POINTS_SLD >= 9)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_27");	//I wygra�e� kilka uczciwych pojedynk�w.
			AI_Output(self,other,"DIA_Torlof_RUF_01_28");	//Dla najemnik�w to bardzo wa�ne.
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_29");	//W ka�dym razie wygra�e� ju� par� uczciwych pojedynk�w.
		};
	};
	if(POINTS_SLD >= 9)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_30");	//Wi�kszo�� najemnik�w stoi za tob�. Je�li o mnie chodzi - mo�esz zaczyna� od zaraz.
		AI_Output(self,other,"DIA_Torlof_RUF_01_31");	//Id� do Lee. On ci wyja�ni ca�� reszt�.
		TORLOF_GENUGSTIMMEN = TRUE;
		b_logentry(TOPIC_BECOMESLD,"Zdoby�em szacunek najemnik�w. Czas na rozmow� z Lee.");
	}
	else if(POINTS_SLD >= 7)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_32");	//Ca�kiem nie�le, ale to ci�gle za ma�o.
		AI_Output(self,other,"DIA_Torlof_RUF_01_33");	//Musisz si� jeszcze troch� powysila�.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_34");	//Musisz si� jeszcze d�ugo stara�, ch�opcze. Je�li chcesz do nas do��czy�, musisz si� troch� pom�czy�.
	};
};


instance DIA_TORLOF_AUFGABEN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 8;
	condition = dia_torlof_aufgaben_condition;
	information = dia_torlof_aufgaben_info;
	permanent = FALSE;
	description = "Jakie b�d� moje obowi�zki?";
};


func int dia_torlof_aufgaben_condition()
{
	if((TORLOF_GO == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_aufgaben_info()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_15_00");	//Jakie b�d� moje obowi�zki?
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_01");	//Onar wynaj�� nas z dw�ch powod�w: mamy trzyma� na dystans stra�nik�w i pilnowa� porz�dku na farmach.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_02");	//A to obejmuje tak�e �ci�ganie czynszu, gdy pomniejsi farmerzy nie chc� p�aci�.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_03");	//No wi�c, jak b�dzie?
	Info_ClearChoices(dia_torlof_aufgaben);
	Info_AddChoice(dia_torlof_aufgaben,"Zdob�d� te pieni�dze!",dia_torlof_aufgaben_pacht);
	Info_AddChoice(dia_torlof_aufgaben,"Bez obaw. Zajm� si� tymi stra�nikami.",dia_torlof_aufgaben_miliz);
};

func void b_torlof_holpachtvonsekob()
{
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_00");	//Dobrze. S�uchaj: od kilku tygodni farmer Sekob nie p�aci Onarowi czynszu.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_01");	//Onar chce, �eby�my wydusili z niego 50 sztuk z�ota. Jakie� pytania?
	AI_Output(other,self,"B_Torlof_HolPachtvonSekob_15_02");	//Gdzie le�y farma Sekoba?
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_03");	//W p�nocnej cz�ci doliny. Patrz�c st�d, musisz skr�ci� w prawo na du�ych rozstajach dr�g.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_04");	//Gdyby� si� zgubi�, wie�niacy na polach wska�� ci w�a�ciw� drog�.
	MIS_TORLOF_HOLPACHTVONSEKOB = LOG_RUNNING;
	sekob.flags = 0;
	CreateInvItems(sekob,itmi_gold,50);
	Log_CreateTopic(TOPIC_TORLOFPACHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFPACHT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFPACHT,"Torlof prosi� mnie o odebranie czynszu od farmera Sekoba, kt�ry jest winien 50 sztuk z�ota.");
};

func void b_torlof_bengarmilizklatschen()
{
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_00");	//Farmer Bengar marudzi, �e miejscy stra�nicy strasznie mu si� ostatnio naprzykrzaj�.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_01");	//Utrudniaj� mu �ycie, jak mog�. Pewnie chc�, �eby zerwa� z Onarem.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_02");	//Chc�, �eby� poszed� na jego farm� i wbi� tym stra�nikom do g�owy, �e nie maj� tam czego szuka�. Jakie� pytania?
	AI_Output(other,self,"B_Torlof_BengarMilizKlatschen_15_03");	//Gdzie le�y farma Bengara?
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_04");	//W po�udniowo-zachodniej cz�ci doliny znajdziesz wielkie schody, prowadz�ce na p�askowy�. Tam le�y farma Bengara.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_05");	//Gdyby� si� zgubi�, wie�niacy na polach wska�� ci w�a�ciw� drog�.
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_RUNNING;
	bengar.flags = 0;
	Wld_InsertNpc(mil_335_rumbold,"FARM3");
	Wld_InsertNpc(mil_336_rick,"FARM3");
	b_initnpcglobals();
	Log_CreateTopic(TOPIC_TORLOFMILIZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFMILIZ,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFMILIZ,"Torlof prosi� mnie o pozbycie si� najemnik�w z farmy Bengara, znajduj�cej si� na p�askowy�u.");
};

func void dia_torlof_aufgaben_pacht()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Pacht_15_00");	//Zdob�d� te pieni�dze!
	b_torlof_holpachtvonsekob();
	TORLOF_PROBE = PROBE_SEKOB;
	Info_ClearChoices(dia_torlof_aufgaben);
};

func void dia_torlof_aufgaben_miliz()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Miliz_15_00");	//Bez obaw. Zajm� si� tymi stra�nikami.
	b_torlof_bengarmilizklatschen();
	TORLOF_PROBE = PROBE_BENGAR;
	Info_ClearChoices(dia_torlof_aufgaben);
};


var int torlof_theothermission_day;

func void b_torlof_theothermissionday()
{
	if(TORLOF_THEOTHERMISSION_DAY < (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_00");	//Cholernie d�ugo ci zesz�o. Onar nie b�dzie zachwycony.
		TORLOF_THEOTHERMISSION_TOOLATE = TRUE;
		if(ENTEROW_KAPITEL2 == TRUE)
		{
			AI_Output(self,other,"DIA_Torlof_Add_01_00");	//A los paladyn�w w G�rniczej Dolinie ma g��boko... w powa�aniu.
		};
	}
	else
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_01");	//Dobra robota! Gdyby pojawi�o si� co� nowego, dam ci zna�!
	};
};


instance DIA_TORLOF_SEKOBSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 9;
	condition = dia_torlof_sekobsuccess_condition;
	information = dia_torlof_sekobsuccess_info;
	permanent = TRUE;
	description = "Odebra�em zaleg�y czynsz od Sekoba.";
};


func int dia_torlof_sekobsuccess_condition()
{
	if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING)
	{
		if((sekob.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_IsDead(sekob))
		{
			return TRUE;
		};
	};
};

func void dia_torlof_sekobsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_00");	//Odebra�em zaleg�y czynsz od Sekoba.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_01");	//Tak? Stwarza jakie� problemy?
		if(Npc_IsDead(sekob))
		{
			AI_Output(other,self,"DIA_Torlof_SekobTot_15_00");	//C�, mia�... �miertelny wypadek.
		}
		else
		{
			AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_02");	//Musia�em go najpierw przekona�.
		};
		if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_03");	//Dobra robota! Przeszed�e� pr�b�. To powinno przekona� wielu najemnik�w, �e nadajesz si� do tej roboty.
		}
		else
		{
			b_torlof_theothermissionday();
		};
		MIS_TORLOF_HOLPACHTVONSEKOB = LOG_SUCCESS;
		b_giveplayerxp(XP_TORLOF_SEKOBSKOHLEBEKOMMEN);
		b_logentry(TOPIC_BECOMESLD,"Wykona�em zadanie, kt�re otrzyma�em od Torlofa.");
		TORLOF_PROBEBESTANDEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_04");	//I co? Przepi�e� wszystko? Dawaj pieni�dze, i to szybko!
	};
};


instance DIA_TORLOF_BENGARSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 10;
	condition = dia_torlof_bengarsuccess_condition;
	information = dia_torlof_bengarsuccess_info;
	permanent = FALSE;
	description = "Rozwi�za�em problemy Bengara ze stra�nikami.";
};


func int dia_torlof_bengarsuccess_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_IsDead(rumbold) && Npc_IsDead(rick))
	{
		return TRUE;
	};
};

func void dia_torlof_bengarsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_00");	//Rozwi�za�em problemy Bengara ze stra�nikami.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_01");	//Upewni�e� si�, �e nie wr�c� na jego farm� nast�pnego dnia?
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_02");	//No c�, raczej im si� to nie uda... zwi�le m�wi�c.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//Dobra robota!
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_04");	//Przeszed�e� pr�b�. Kto�, kto poradzi� sobie ze stra�nikami, zas�uguje na nasz szacunek.
	}
	else
	{
		b_torlof_theothermissionday();
	};
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
	b_logentry(TOPIC_BECOMESLD,"Wykona�em zadanie, kt�re otrzyma�em od Torlofa.");
	TORLOF_PROBEBESTANDEN = TRUE;
};


instance DIA_TORLOF_WELCOME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 11;
	condition = dia_torlof_welcome_condition;
	information = dia_torlof_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_welcome_condition()
{
	if((other.guild == GIL_SLD) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_welcome_info()
{
	AI_Output(self,other,"DIA_Torlof_Welcome_01_00");	//Witamy w�r�d najemnik�w!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//Dzi�ki!
	AI_Output(self,other,"DIA_Torlof_Welcome_01_02");	//Jak tylko pojawi si� jaka� robota, dam ci zna�.
};


var int torlof_knowsdragons;

func void b_torlof_dragons()
{
	AI_Output(self,other,"DIA_Torlof_Add_01_01");	//Gdzie si� podziewa�e�?
	AI_Output(other,self,"DIA_Torlof_Add_15_02");	//By�em w G�rniczej Dolinie. Tam s� smoki! Paladynom nie�le si� od nich oberwa�o.
	AI_Output(self,other,"DIA_Torlof_Add_01_03");	//Czy�by? Zatem w tych opowie�ciach jest jednak troch� prawdy.
	AI_Output(self,other,"DIA_Torlof_Add_01_04");	//Lee na pewno si� tym zainteresuje.
	TORLOF_KNOWSDRAGONS = TRUE;
};


instance DIA_TORLOF_THEOTHERMISSION(C_INFO)
{
	npc = sld_801_torlof;
	nr = 11;
	condition = dia_torlof_theothermission_condition;
	information = dia_torlof_theothermission_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_theothermission_condition()
{
	if((other.guild == GIL_SLD) && (KAPITEL >= 2))
	{
		return TRUE;
	};
};

func void dia_torlof_theothermission_info()
{
	if((TORLOF_KNOWSDRAGONS == FALSE) && (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE))
	{
		b_torlof_dragons();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_00");	//Dobrze, �e tu jeste�. Mam dla ciebie rob�tk�...
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//O co chodzi?
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		b_torlof_holpachtvonsekob();
	}
	else
	{
		b_torlof_bengarmilizklatschen();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_02");	//Tylko masz sko�czy� do jutra!
	TORLOF_THEOTHERMISSION_DAY = Wld_GetDay();
};


instance DIA_TORLOF_DRAGONS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 12;
	condition = dia_torlof_dragons_condition;
	information = dia_torlof_dragons_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_dragons_condition()
{
	if((ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE) && (KAPITEL <= 3) && (other.guild == GIL_SLD) && (TORLOF_KNOWSDRAGONS == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_dragons_info()
{
	b_torlof_dragons();
};


instance DIA_TORLOF_WHATCANYOUTEACH(C_INFO)
{
	npc = sld_801_torlof;
	nr = 140;
	condition = dia_torlof_whatcanyouteach_condition;
	information = dia_torlof_whatcanyouteach_info;
	permanent = FALSE;
	description = "Pomo�esz mi popracowa� nad moimi umiej�tno�ciami?";
};


func int dia_torlof_whatcanyouteach_condition()
{
	return TRUE;
};

func void dia_torlof_whatcanyouteach_info()
{
	AI_Output(other,self,"DIA_Torlof_WhatCanYouTeach_15_00");	//Pomo�esz mi popracowa� nad moimi umiej�tno�ciami?
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_01");	//M�g�bym ci pokaza�, jak wykorzystywa� swoj� si�� w bezpo�redniej walce.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_02");	//Wielu wojownik�w dostaje baty, bo nie potrafi odpowiednio spo�ytkowa� swojej si�y.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_03");	//Podobnie jest ze zr�czno�ci� i walk� na dystans.
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Torlof mo�e mi pokaza�, jak sta� si� zr�czniejszym i silniejszym.");
};


var int torlof_merke_str;
var int torlof_merke_dex;

instance DIA_TORLOF_TEACH(C_INFO)
{
	npc = sld_801_torlof;
	nr = 150;
	condition = dia_torlof_teach_condition;
	information = dia_torlof_teach_info;
	permanent = TRUE;
	description = "Pom� mi popracowa� nad moimi umiej�tno�ciami.";
};


func int dia_torlof_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_whatcanyouteach))
	{
		return TRUE;
	};
};

func void dia_torlof_teach_info()
{
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//Chc� zwi�kszy� moje umiej�tno�ci.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE))
	{
		TORLOF_MERKE_STR = other.attribute[ATR_STRENGTH];
		TORLOF_MERKE_DEX = other.attribute[ATR_DEXTERITY];
		Info_ClearChoices(dia_torlof_teach);
		Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_Teach_01_01");	//Powiedzia�em, �e M�G�BYM ci pom�c, a nie, �e to ZROBI�.
		AI_Output(self,other,"DIA_Torlof_Teach_01_02");	//Dop�ki nie zostaniesz jednym z nas, szukaj sobie innego nauczyciela.
	};
};

func void dia_torlof_teach_back()
{
	if((TORLOF_MERKE_STR < other.attribute[ATR_STRENGTH]) || (TORLOF_MERKE_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_Torlof_Teach_Back_01_00");	//�wietnie! Teraz mo�esz skuteczniej wykorzystywa� swoje umiej�tno�ci.
	};
	Info_ClearChoices(dia_torlof_teach);
};

func void dia_torlof_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};


instance DIA_TORLOF_KAP3_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap3_exit_condition;
	information = dia_torlof_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_torlof_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_DEMENTOREN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dementoren_condition;
	information = dia_torlof_dementoren_info;
	description = "Masz dla mnie jakie� nowe zadania?";
};


func int dia_torlof_dementoren_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_torlof_dementoren_info()
{
	AI_Output(other,self,"DIA_Torlof_DEMENTOREN_15_00");	//Masz dla mnie jakie� nowe zadania?
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_01");	//Widzia�e� tych go�ci w czarnych kapturach, kt�rzy kr�c� si� w pobli�u? Jest z nimi co� nie tak, m�wi� ci.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_02");	//Gdy by�em na morzu, widywa�em r�ne dziwne rzeczy, ale tych zakapturzonych naprawd� si� boj�.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_03");	//Poszli w kierunku obozu bandyt�w, pod g�rami na po�udniowym kra�cu doliny.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_04");	//Mo�e powiniene� si� tam wybra� i zrobi� z nimi porz�dek?
	Wld_InsertNpc(castleminedmt,"FP_STAND_DEMENTOR_KDF_12");
	Log_CreateTopic(TOPIC_TORLOF_DMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOF_DMT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOF_DMT,"W g�rskim obozie bandyt�w, znajduj�cym si� na po�udnie od doliny, pono� przebywa kilku z tych zakapturzonych m�czyzn, kt�rzy ostatnio sprawiali problemy Torlofowi. Zamierzam rozwi�za� ten problem raz na zawsze.");
	MIS_TORLOF_DMT = LOG_RUNNING;
};


instance DIA_TORLOF_DMTSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dmtsuccess_condition;
	information = dia_torlof_dmtsuccess_info;
	description = "Nie musisz si� ju� obawia� tych zakapturzonych postaci z g�r.";
};


func int dia_torlof_dmtsuccess_condition()
{
	if((MIS_TORLOF_DMT == LOG_RUNNING) && Npc_IsDead(castleminedmt))
	{
		return TRUE;
	};
};

func void dia_torlof_dmtsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_DmtSuccess_15_00");	//Nie musisz ju� si� obawia� tych zakapturzonych postaci z g�r.
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_01");	//Za�atwi�e� ich? Gratuluj�.
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_02");	//Co� mi si� w nich nie podoba�o. Za�o�� si�, �e mieliby�my przez nich niez�e k�opoty.
	MIS_TORLOF_DMT = LOG_SUCCESS;
	b_giveplayerxp(XP_TORLOF_DMT);
};


instance DIA_TORLOF_KAP4_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap4_exit_condition;
	information = dia_torlof_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_torlof_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_WOISTSYLVIO(C_INFO)
{
	npc = sld_801_torlof;
	nr = 40;
	condition = dia_torlof_woistsylvio_condition;
	information = dia_torlof_woistsylvio_info;
	description = "Cz�� najemnik�w odesz�a chyba z farmy?";
};


func int dia_torlof_woistsylvio_condition()
{
	if((MIS_READYFORCHAPTER4 == TRUE) || (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_torlof_woistsylvio_info()
{
	AI_Output(other,self,"DIA_Torlof_WOISTSYLVIO_15_00");	//Cz�� najemnik�w odesz�a chyba z farmy?
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_01");	//Sylvio zabra� kilku ch�opak�w i poprowadzi� ich na prze��cz.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_02");	//Plotka g�osi, �e pokaza�y si� tam smoki. Jak Sylvio si� o tym dowiedzia�, nie mo�na go by�o powstrzyma�.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_03");	//Kto wie? Za smoczy �eb mo�na pewnie dosta� kup� pieni�dzy.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_04");	//Ale to nie dla mnie. Jestem �eglarzem. Moje miejsce jest na morzu, a nie w cuchn�cej smoczej jamie.
};


instance DIA_TORLOF_KAP5_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap5_exit_condition;
	information = dia_torlof_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_torlof_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_BEMYCAPTAIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 51;
	condition = dia_torlof_bemycaptain_condition;
	information = dia_torlof_bemycaptain_info;
	description = "Jeste� �eglarzem?";
};


func int dia_torlof_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//Jeste� �eglarzem?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_01");	//No, nareszcie za�apa�e�! Tak, do diaska, jestem. Czemu pytasz?
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_02");	//Przyda�by mi si� kto� taki jak ty. Zamierzam pop�yn�� na pewn� wysp�.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_03");	//Na wysp�? Nie masz nawet statku, nie m�wi�c o za�odze.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_04");	//Nie nie nie, ch�opcze. Je�li mam by� twoim kapitanem i nauczycielem, musisz mi najpierw udowodni�, �e wiesz, o co w tym wszystkim chodzi.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_05");	//Mam zreszt� teraz inne zmartwienie. Wbrew naszym przewidywaniom, paladyni nie opu�cili miasta.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_06");	//Potrzeba nie lada powodu, by ich wyci�gn�� w pole.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_07");	//Id� do zamku w G�rniczej Dolinie, wykradnij stra�nikowi klucz do g��wnej bramy i otw�rz j�. Reszt� zajm� si� orkowie.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Zanim Torlof przyjmie posad� kapitana, musz� pozby� si� z miasta paladyn�w. Torlof wpad� na pomys� zaaran�owania niewielkiego wypadku na zamku w G�rniczej Dolinie - chce, abym ukrad� stra�nikowi klucz od g��wnej bramy i wpu�ci� ork�w do �rodka. Ma nadziej�, �e paladyni z miasta wyrusz� wtedy z odsiecz�.");
};


instance DIA_TORLOF_BEMYCAPTAIN2(C_INFO)
{
	npc = sld_801_torlof;
	nr = 52;
	condition = dia_torlof_bemycaptain2_condition;
	information = dia_torlof_bemycaptain2_info;
	description = "Brama do zamku w G�rniczej Dolinie jest ju� otwarta...";
};


func int dia_torlof_bemycaptain2_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_torlof_bemycaptain))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_00");	//Brama do zamku w G�rniczej Dolinie jest ju� otwarta i zablokowana. Nic teraz nie powstrzyma szturmu ork�w.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_01");	//Za�oga zamku ponios�a ci�kie straty.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_02");	//Paladyni z miasta powinni wkr�tce wyruszy� do Doliny, by wyci�gn�� swoich towarzyszy z obl�onego zamku.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN2_01_03");	//To �wietna wiadomo��. Teraz nic mnie ju� nie powstrzyma przed wyrwaniem si� z tego przekl�tego miejsca.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_TORLOF_BEMYCAPTAIN3(C_INFO)
{
	npc = sld_801_torlof;
	nr = 53;
	condition = dia_torlof_bemycaptain3_condition;
	information = dia_torlof_bemycaptain3_info;
	permanent = TRUE;
	description = "Czy teraz pomo�esz mi dosta� si� na wysp�?";
};


var int torlof_paidtobecaptain;

func int dia_torlof_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_bemycaptain2) && (TORLOF_PAIDTOBECAPTAIN == FALSE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_15_00");	//Czy teraz pomo�esz mi dosta� si� na wysp�?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_01");	//A, fakt. Chcia�e�, �ebym z tob� pop�yn��. S�uchaj, zrobimy tak:
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_02");	//Zap�a� mi 2500 sztuk z�ota, a ja poprowadz� tw�j okr�t.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_03");	//Za t� sum� naucz� ci� tak�e wszystkiego, co wiem o sile i zr�czno�ci.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	Info_AddChoice(dia_torlof_bemycaptain3,"To bardzo du�a suma.",dia_torlof_bemycaptain3_zuviel);
	Info_AddChoice(dia_torlof_bemycaptain3,"W porz�dku. Oto twoje z�oto.",dia_torlof_bemycaptain3_ok);
};

func void dia_torlof_bemycaptain3_zuviel()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00");	//To bardzo du�a suma.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01");	//Pomoc specjalisty musi kosztowa�. Poza tym, nie masz wyboru. Nie znajdziesz tutaj nikogo innego, kto potrafi dowodzi� okr�tem.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02");	//Tak wi�c p�a� i nie marud�.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	b_logentry(TOPIC_CAPTAIN,"Torlof zgadza si� obj�� obowi�zki kapitana statku, jednak ��da za to zap�aty w wysoko�ci 2500 sztuk z�ota.");
};

func void dia_torlof_bemycaptain3_ok()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_ok_15_00");	//W porz�dku. Oto twoje z�oto.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_01");	//�wietnie. Teraz musisz mi tylko powiedzie�, co mam zrobi�.
		TORLOF_PAIDTOBECAPTAIN = TRUE;
		b_logentry(TOPIC_CAPTAIN,"Torlof dosta� ode mnie 2500 sztuk z�ota i jest got�w wyruszy� w ka�dej chwili.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_02");	//Chcesz mi zmydli� oczy paroma monetami? Zdob�d� ca�� sum�, a wtedy pogadamy.
	};
	Info_ClearChoices(dia_torlof_bemycaptain3);
};


instance DIA_TORLOF_BEMYCAPTAIN4(C_INFO)
{
	npc = sld_801_torlof;
	nr = 54;
	condition = dia_torlof_bemycaptain4_condition;
	information = dia_torlof_bemycaptain4_info;
	permanent = TRUE;
	description = "Zosta� kapitanem mojego statku.";
};


func int dia_torlof_bemycaptain4_condition()
{
	if((SCGOTCAPTAIN == FALSE) && (TORLOF_PAIDTOBECAPTAIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain4_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_00");	//Zosta� kapitanem mojego statku.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_01");	//W porz�dku. Daj mi statek i odpowiedni� za�og�, a pop�yn� z tob� nawet na koniec �wiata.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_02");	//A masz odpowiedni� map� morsk�? Bez niej daleko nie dop�yniemy.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_03");	//To ju� moje zmartwienie. Spotkamy si� na przystani.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_04");	//Ciekaw jestem. jak tego dokonasz.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	TORLOFISCAPTAIN = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_TORLOF_LOSFAHREN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 59;
	condition = dia_torlof_losfahren_condition;
	information = dia_torlof_losfahren_info;
	permanent = TRUE;
	description = "Mo�emy rusza� w drog�.";
};


func int dia_torlof_losfahren_condition()
{
	if((TORLOFISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_losfahren_info()
{
	AI_Output(other,self,"DIA_Torlof_LOSFAHREN_15_00");	//Mo�emy rusza� w drog�.
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_01");	//Dobra. Daj mi map� i odp�ywamy.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_02");	//Wszyscy na pok�ad!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_03");	//Na pewno masz wszystko, czego potrzeba? Nie b�dziemy zawraca� w p� drogi!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_04");	//Je�li jeste� pewien, walnij si� na koj� w kajucie kapitana. Podr� troch� potrwa.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_05");	//Nie ma statku, nie ma za�ogi, nie ma mapy, nie ma podr�y!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_06");	//Potrzebuj� co najmniej pi�ciu ludzi zdatnych do pomocy na morzu.
		AI_StopProcessInfos(self);
	};
};


instance DIA_TORLOF_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 59;
	condition = dia_torlof_perm5_notcaptain_condition;
	information = dia_torlof_perm5_notcaptain_info;
	permanent = TRUE;
	description = "Zdecydowa�em si� na innego kapitana.";
};


func int dia_torlof_perm5_notcaptain_condition()
{
	if((SCGOTCAPTAIN == TRUE) && (TORLOFISCAPTAIN == FALSE) && (TORLOF_PAIDTOBECAPTAIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Torlof_PERM5_NOTCAPTAIN_15_00");	//Zdecydowa�em si� na innego kapitana. Mo�esz mi odda� moje pieni�dze.
	AI_Output(self,other,"DIA_Torlof_PERM5_NOTCAPTAIN_01_01");	//Chyba �nisz! Nie ma mowy! Jak p�acisz z g�ry, a potem zmieniasz zdanie, to ju� tw�j problem.
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_KAP6_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap6_exit_condition;
	information = dia_torlof_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_torlof_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_PICKPOCKET(C_INFO)
{
	npc = sld_801_torlof;
	nr = 900;
	condition = dia_torlof_pickpocket_condition;
	information = dia_torlof_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_torlof_pickpocket_condition()
{
	return c_beklauen(76,120);
};

func void dia_torlof_pickpocket_info()
{
	Info_ClearChoices(dia_torlof_pickpocket);
	Info_AddChoice(dia_torlof_pickpocket,DIALOG_BACK,dia_torlof_pickpocket_back);
	Info_AddChoice(dia_torlof_pickpocket,DIALOG_PICKPOCKET,dia_torlof_pickpocket_doit);
};

func void dia_torlof_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_torlof_pickpocket);
};

func void dia_torlof_pickpocket_back()
{
	Info_ClearChoices(dia_torlof_pickpocket);
};

