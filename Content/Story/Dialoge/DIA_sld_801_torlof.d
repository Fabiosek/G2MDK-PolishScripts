
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
	description = "Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?";
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
	AI_Output(other,self,"DIA_Torlof_WannaJoin_15_00");	//Chcê siê przy³¹czyæ do najemników.
	AI_Output(self,other,"DIA_Torlof_WannaJoin_01_01");	//Tak? A dlaczego niby mia³bym pozwoliæ, ¿ebyœ do nas do³¹czy³?
};


var int torlof_go;

instance DIA_TORLOF_PROBE(C_INFO)
{
	npc = sld_801_torlof;
	nr = 3;
	condition = dia_torlof_probe_condition;
	information = dia_torlof_probe_info;
	permanent = TRUE;
	description = "Poddaj mnie próbie!";
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
	AI_Output(other,self,"DIA_Torlof_Probe_15_00");	//Poddaj mnie próbie!
	AI_Output(self,other,"DIA_Torlof_Probe_01_01");	//Czy to Lee przys³a³ ciê do mnie?
	if(Npc_KnowsInfo(other,dia_lee_othersld))
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_02");	//Powiedzia³, ¿e mo¿esz mi pomóc.
		AI_Output(self,other,"DIA_Torlof_Probe_01_03");	//Aj... No dobra, niech ju¿ bêdzie. Zanim pozwolimy ci do nas do³¹czyæ, musisz zrobiæ dwie rzeczy.
		AI_Output(self,other,"DIA_Torlof_Probe_01_04");	//Po pierwsze: musisz udowodniæ, ¿e nadajesz siê do roboty najemnika. W tym celu poddam ciê próbie.
		AI_Output(self,other,"DIA_Torlof_Probe_01_05");	//Po drugie: musisz zas³u¿yæ na szacunek pozosta³ych ch³opaków.
		TORLOF_GO = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
		b_logentry(TOPIC_BECOMESLD,"Aby móc zostaæ najemnikiem, muszê poddaæ siê próbie Torlofa i zyskaæ szacunek pozosta³ych najemników.");
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//Nie.
		AI_Output(self,other,"DIA_Torlof_Probe_01_07");	//Wiêc po cholerê zawracasz mi g³owê?
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
	description = "Jak mogê zdobyæ szacunek pozosta³ych najemników?";
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
	AI_Output(other,self,"DIA_Torlof_Respekt_15_00");	//Jak mogê zdobyæ szacunek pozosta³ych najemników?
	AI_Output(self,other,"DIA_Torlof_Respekt_01_01");	//Wiêkszoœci z nich wystarczy, ¿e wype³nisz moje zadanie.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_02");	//Ale czêœæ z nich trzeba bêdzie przekonaæ w inny sposób.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_03");	//Niektórzy spróbuj¹ wykorzystaæ sytuacjê, innym mo¿e siê po prostu nie spodobaæ twoja buŸka.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_04");	//Spróbuj skumplowaæ siê z mo¿liwie du¿¹ czêœci¹ grupy. Ostatecznie zawsze mo¿esz wzi¹æ udzia³ w pojedynku.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_05");	//Jeœli wygrasz, zdobêdziesz szacunek wiêkszoœci najemników. Tylko w ¿adnym razie nie zabij któregoœ z nich, bo dopiero wtedy bêdziesz mia³ problem.
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"Jeœli chcê zyskaæ szacunek pozosta³ych najemników, muszê przejœæ przez próbê Torlofa albo pokonaæ ich w pojedynku.");
};


instance DIA_TORLOF_DUELLREGELN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 5;
	condition = dia_torlof_duellregeln_condition;
	information = dia_torlof_duellregeln_info;
	permanent = FALSE;
	description = "Jakie s¹ regu³y pojedynku?";
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
	AI_Output(other,self,"DIA_Torlof_Duellregeln_15_00");	//Jakie s¹ zasady pojedynku?
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_01");	//Bardzo proste. Uczestnicy musz¹ mieæ szansê na wyci¹gniêcie orê¿a, nim padnie pierwszy cios.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_02");	//Nie mo¿esz tak po prostu przy³o¿yæ komuœ, bez ostrze¿enia.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_03");	//Walkê musi poprzedziæ s³owne wyzwanie. Wystarczy solidna obelga lub inny powód do bitki.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_04");	//¯aden z widzów nie ma prawa w³¹czyæ siê do walki, chyba ¿e jeden z jej uczestników zostanie zabity.
	b_logentry(TOPIC_SLDRESPEKT,"Zasady pojedynku: nale¿y zacz¹æ od wyzwania przeciwnika, dziêki czemu w walkê nie zaanga¿uj¹ siê osoby postronne. Nie wolno zabiæ rywala.");
};


instance DIA_TORLOF_DEINESTIMME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 6;
	condition = dia_torlof_deinestimme_condition;
	information = dia_torlof_deinestimme_info;
	permanent = FALSE;
	description = "A co z tob¹? Mogê liczyæ na twój g³os?";
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
	AI_Output(other,self,"DIA_Torlof_DeineStimme_15_00");	//A co z tob¹? Mogê liczyæ na twój g³os?
	AI_Output(self,other,"DIA_Torlof_DeineStimme_01_01");	//Jeœli udowodnisz mi, ¿e poradzisz sobie jako najemnik - tak.
};


var int points_sld;

instance DIA_TORLOF_RUF(C_INFO)
{
	npc = sld_801_torlof;
	nr = 7;
	condition = dia_torlof_ruf_condition;
	information = dia_torlof_ruf_info;
	permanent = TRUE;
	description = "Co s¹dz¹ o mnie najemnicy?";
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
	AI_Output(other,self,"DIA_Torlof_RUF_15_00");	//Co s¹dz¹ o mnie najemnicy?
	AI_Output(self,other,"DIA_Torlof_RUF_01_01");	//Pomyœlmy...
	POINTS_SLD = 0;
	if(Npc_IsDead(sld_wolf))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(sld_wolf.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_02");	//Wilk mówi, ¿e nie ma nic przeciwko tobie.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(Npc_IsDead(jarvis))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(MIS_JARVIS_SLDKO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_03");	//Jarvis s¹dzi, ¿e siê nadasz.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(jarvis.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_04");	//Jarvis ci¹gle nie jest pewien, czy siê nadasz.
		AI_Output(self,other,"DIA_Torlof_RUF_01_05");	//Nie chce tutaj wiêcej idiotów pokroju Sylvia. Prawdê mówi¹c - ja te¿ nie.
	};
	if(Npc_IsDead(cord))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(CORD_APPROVED == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_06");	//Cord uwa¿a, ¿e mo¿esz do nas do³¹czyæ.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cord.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_07");	//Cord uwa¿a, ¿e musisz najpierw podszkoliæ siê trochê w walce orê¿em.
	};
	if(Npc_IsDead(cipher))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if((MIS_CIPHER_PAKET == LOG_SUCCESS) || (MIS_CIPHER_BRINGWEED == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_08");	//Cipher mówi, ¿e musimy ciê koniecznie przyj¹æ. Chyba ma o tobie bardzo wysokie mniemanie.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cipher.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_09");	//Cipher mówi, ¿e jesteœ mu winien przys³ugê, i ¿e bêdziesz wiedzia³, o co chodzi.
	};
	if(Npc_IsDead(rod))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(rod,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_10");	//Rod chce po prostu odzyskaæ swój miecz.
	}
	else if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_11");	//Chyba przekona³eœ Roda, ¿e jesteœ wystarczaj¹co silny.
		if(rod.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			POINTS_SLD = POINTS_SLD + 1;
		};
	}
	else if(rod.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_12");	//Rod uwa¿a ciê za miêczaka.
	};
	if(Npc_IsDead(sentenza))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(sentenza,itmi_gold) >= 50)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_13");	//Sentenza bêdzie na ciebie g³osowa³. Twierdzi, ¿e równy z ciebie goœæ.
		POINTS_SLD = POINTS_SLD + 1;
		TORLOF_SENTENZACOUNTED = TRUE;
	}
	else if(sentenza.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_14");	//Sentenza nie bêdzie na ciebie g³osowa³. Podobno jesteœ mu winien 50 sztuk z³ota.
	};
	if(Npc_IsDead(raoul))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(raoul.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_15");	//Raoul jest przeciw tobie. Facet chyba ciê po prostu nie lubi.
	};
	if(Npc_IsDead(bullco))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(bullco.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_16");	//O Sylviu i Bullku nie muszê chyba nawet mówiæ. Ci dwaj kretyni nie popr¹ nikogo.
	};
	if(Npc_IsDead(buster))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(BUSTER_DUELL == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_17");	//Buster mówi, ¿e jesteœ w porz¹dku.
		if(buster.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_18");	//Chocia¿ z nim przegra³eœ.
		};
	}
	else if(buster.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_19");	//Buster powiedzia³ mi, ¿e stchórzy³eœ, gdy wyzwa³ ciê na pojedynek.
		AI_Output(self,other,"DIA_Torlof_RUF_01_20");	//To by³ kiepski pomys³. Mo¿e powinieneœ wróciæ i wyzwaæ go jeszcze raz?
	};
	if(Npc_IsDead(dar))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_21");	//A Dar ma ciê za kapusia. Na szczêœcie dla ciebie jego g³osem nikt siê tutaj nie przejmuje.
	};
	if(POINTS_SLD > 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_22");	//Reszta najemników nie zajê³a ¿adnego stanowiska.
	};
	if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_23");	//Wiêkszoœæ z nich czeka, aby przekonaæ siê, czy przejdziesz moj¹ próbê.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_24");	//Wiêkszoœæ z nich przekona³eœ, przechodz¹c próbê.
		if(CORD_RANGERHELP_TORLOFSPROBE == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Torlof_RUF_01_00");	//Nawet jeœli Cord siê temu trochê przys³u¿y³...
			POINTS_SLD = POINTS_SLD + 4;
		}
		else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_25");	//Chocia¿ niektórzy s¹dz¹, ¿e zmuszenie farmera do zap³acenia czynszu to zbyt ³atwe zadanie.
			POINTS_SLD = POINTS_SLD + 3;
		}
		else
		{
			POINTS_SLD = POINTS_SLD + 5;
		};
		AI_Output(self,other,"DIA_Torlof_RUF_01_26");	//Na mój g³os mo¿esz w ka¿dym razie liczyæ.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(SLD_DUELLE_GEWONNEN >= 3)
	{
		POINTS_SLD = POINTS_SLD + 1;
		if(POINTS_SLD >= 9)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_27");	//I wygra³eœ kilka uczciwych pojedynków.
			AI_Output(self,other,"DIA_Torlof_RUF_01_28");	//Dla najemników to bardzo wa¿ne.
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_29");	//W ka¿dym razie wygra³eœ ju¿ parê uczciwych pojedynków.
		};
	};
	if(POINTS_SLD >= 9)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_30");	//Wiêkszoœæ najemników stoi za tob¹. Jeœli o mnie chodzi - mo¿esz zaczynaæ od zaraz.
		AI_Output(self,other,"DIA_Torlof_RUF_01_31");	//IdŸ do Lee. On ci wyjaœni ca³¹ resztê.
		TORLOF_GENUGSTIMMEN = TRUE;
		b_logentry(TOPIC_BECOMESLD,"Zdoby³em szacunek najemników. Czas na rozmowê z Lee.");
	}
	else if(POINTS_SLD >= 7)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_32");	//Ca³kiem nieŸle, ale to ci¹gle za ma³o.
		AI_Output(self,other,"DIA_Torlof_RUF_01_33");	//Musisz siê jeszcze trochê powysilaæ.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_34");	//Musisz siê jeszcze d³ugo staraæ, ch³opcze. Jeœli chcesz do nas do³¹czyæ, musisz siê trochê pomêczyæ.
	};
};


instance DIA_TORLOF_AUFGABEN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 8;
	condition = dia_torlof_aufgaben_condition;
	information = dia_torlof_aufgaben_info;
	permanent = FALSE;
	description = "Jakie bêd¹ moje obowi¹zki?";
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
	AI_Output(other,self,"DIA_Torlof_Aufgaben_15_00");	//Jakie bêd¹ moje obowi¹zki?
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_01");	//Onar wynaj¹³ nas z dwóch powodów: mamy trzymaæ na dystans stra¿ników i pilnowaæ porz¹dku na farmach.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_02");	//A to obejmuje tak¿e œci¹ganie czynszu, gdy pomniejsi farmerzy nie chc¹ p³aciæ.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_03");	//No wiêc, jak bêdzie?
	Info_ClearChoices(dia_torlof_aufgaben);
	Info_AddChoice(dia_torlof_aufgaben,"Zdobêdê te pieni¹dze!",dia_torlof_aufgaben_pacht);
	Info_AddChoice(dia_torlof_aufgaben,"Bez obaw. Zajmê siê tymi stra¿nikami.",dia_torlof_aufgaben_miliz);
};

func void b_torlof_holpachtvonsekob()
{
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_00");	//Dobrze. S³uchaj: od kilku tygodni farmer Sekob nie p³aci Onarowi czynszu.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_01");	//Onar chce, ¿ebyœmy wydusili z niego 50 sztuk z³ota. Jakieœ pytania?
	AI_Output(other,self,"B_Torlof_HolPachtvonSekob_15_02");	//Gdzie le¿y farma Sekoba?
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_03");	//W pó³nocnej czêœci doliny. Patrz¹c st¹d, musisz skrêciæ w prawo na du¿ych rozstajach dróg.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_04");	//Gdybyœ siê zgubi³, wieœniacy na polach wska¿¹ ci w³aœciw¹ drogê.
	MIS_TORLOF_HOLPACHTVONSEKOB = LOG_RUNNING;
	sekob.flags = 0;
	CreateInvItems(sekob,itmi_gold,50);
	Log_CreateTopic(TOPIC_TORLOFPACHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFPACHT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFPACHT,"Torlof prosi³ mnie o odebranie czynszu od farmera Sekoba, który jest winien 50 sztuk z³ota.");
};

func void b_torlof_bengarmilizklatschen()
{
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_00");	//Farmer Bengar marudzi, ¿e miejscy stra¿nicy strasznie mu siê ostatnio naprzykrzaj¹.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_01");	//Utrudniaj¹ mu ¿ycie, jak mog¹. Pewnie chc¹, ¿eby zerwa³ z Onarem.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_02");	//Chcê, ¿ebyœ poszed³ na jego farmê i wbi³ tym stra¿nikom do g³owy, ¿e nie maj¹ tam czego szukaæ. Jakieœ pytania?
	AI_Output(other,self,"B_Torlof_BengarMilizKlatschen_15_03");	//Gdzie le¿y farma Bengara?
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_04");	//W po³udniowo-zachodniej czêœci doliny znajdziesz wielkie schody, prowadz¹ce na p³askowy¿. Tam le¿y farma Bengara.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_05");	//Gdybyœ siê zgubi³, wieœniacy na polach wska¿¹ ci w³aœciw¹ drogê.
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_RUNNING;
	bengar.flags = 0;
	Wld_InsertNpc(mil_335_rumbold,"FARM3");
	Wld_InsertNpc(mil_336_rick,"FARM3");
	b_initnpcglobals();
	Log_CreateTopic(TOPIC_TORLOFMILIZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFMILIZ,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFMILIZ,"Torlof prosi³ mnie o pozbycie siê najemników z farmy Bengara, znajduj¹cej siê na p³askowy¿u.");
};

func void dia_torlof_aufgaben_pacht()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Pacht_15_00");	//Zdobêdê te pieni¹dze!
	b_torlof_holpachtvonsekob();
	TORLOF_PROBE = PROBE_SEKOB;
	Info_ClearChoices(dia_torlof_aufgaben);
};

func void dia_torlof_aufgaben_miliz()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Miliz_15_00");	//Bez obaw. Zajmê siê tymi stra¿nikami.
	b_torlof_bengarmilizklatschen();
	TORLOF_PROBE = PROBE_BENGAR;
	Info_ClearChoices(dia_torlof_aufgaben);
};


var int torlof_theothermission_day;

func void b_torlof_theothermissionday()
{
	if(TORLOF_THEOTHERMISSION_DAY < (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_00");	//Cholernie d³ugo ci zesz³o. Onar nie bêdzie zachwycony.
		TORLOF_THEOTHERMISSION_TOOLATE = TRUE;
		if(ENTEROW_KAPITEL2 == TRUE)
		{
			AI_Output(self,other,"DIA_Torlof_Add_01_00");	//A los paladynów w Górniczej Dolinie ma g³êboko... w powa¿aniu.
		};
	}
	else
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_01");	//Dobra robota! Gdyby pojawi³o siê coœ nowego, dam ci znaæ!
	};
};


instance DIA_TORLOF_SEKOBSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 9;
	condition = dia_torlof_sekobsuccess_condition;
	information = dia_torlof_sekobsuccess_info;
	permanent = TRUE;
	description = "Odebra³em zaleg³y czynsz od Sekoba.";
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
	AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_00");	//Odebra³em zaleg³y czynsz od Sekoba.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_01");	//Tak? Stwarza jakieœ problemy?
		if(Npc_IsDead(sekob))
		{
			AI_Output(other,self,"DIA_Torlof_SekobTot_15_00");	//Có¿, mia³... œmiertelny wypadek.
		}
		else
		{
			AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_02");	//Musia³em go najpierw przekonaæ.
		};
		if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_03");	//Dobra robota! Przeszed³eœ próbê. To powinno przekonaæ wielu najemników, ¿e nadajesz siê do tej roboty.
		}
		else
		{
			b_torlof_theothermissionday();
		};
		MIS_TORLOF_HOLPACHTVONSEKOB = LOG_SUCCESS;
		b_giveplayerxp(XP_TORLOF_SEKOBSKOHLEBEKOMMEN);
		b_logentry(TOPIC_BECOMESLD,"Wykona³em zadanie, które otrzyma³em od Torlofa.");
		TORLOF_PROBEBESTANDEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_04");	//I co? Przepi³eœ wszystko? Dawaj pieni¹dze, i to szybko!
	};
};


instance DIA_TORLOF_BENGARSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 10;
	condition = dia_torlof_bengarsuccess_condition;
	information = dia_torlof_bengarsuccess_info;
	permanent = FALSE;
	description = "Rozwi¹za³em problemy Bengara ze stra¿nikami.";
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
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_00");	//Rozwi¹za³em problemy Bengara ze stra¿nikami.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_01");	//Upewni³eœ siê, ¿e nie wróc¹ na jego farmê nastêpnego dnia?
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_02");	//No có¿, raczej im siê to nie uda... zwiêŸle mówi¹c.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//Dobra robota!
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_04");	//Przeszed³eœ próbê. Ktoœ, kto poradzi³ sobie ze stra¿nikami, zas³uguje na nasz szacunek.
	}
	else
	{
		b_torlof_theothermissionday();
	};
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
	b_logentry(TOPIC_BECOMESLD,"Wykona³em zadanie, które otrzyma³em od Torlofa.");
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
	AI_Output(self,other,"DIA_Torlof_Welcome_01_00");	//Witamy wœród najemników!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//Dziêki!
	AI_Output(self,other,"DIA_Torlof_Welcome_01_02");	//Jak tylko pojawi siê jakaœ robota, dam ci znaæ.
};


var int torlof_knowsdragons;

func void b_torlof_dragons()
{
	AI_Output(self,other,"DIA_Torlof_Add_01_01");	//Gdzie siê podziewa³eœ?
	AI_Output(other,self,"DIA_Torlof_Add_15_02");	//By³em w Górniczej Dolinie. Tam s¹ smoki! Paladynom nieŸle siê od nich oberwa³o.
	AI_Output(self,other,"DIA_Torlof_Add_01_03");	//Czy¿by? Zatem w tych opowieœciach jest jednak trochê prawdy.
	AI_Output(self,other,"DIA_Torlof_Add_01_04");	//Lee na pewno siê tym zainteresuje.
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
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_00");	//Dobrze, ¿e tu jesteœ. Mam dla ciebie robótkê...
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//O co chodzi?
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		b_torlof_holpachtvonsekob();
	}
	else
	{
		b_torlof_bengarmilizklatschen();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_02");	//Tylko masz skoñczyæ do jutra!
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
	description = "Pomo¿esz mi popracowaæ nad moimi umiejêtnoœciami?";
};


func int dia_torlof_whatcanyouteach_condition()
{
	return TRUE;
};

func void dia_torlof_whatcanyouteach_info()
{
	AI_Output(other,self,"DIA_Torlof_WhatCanYouTeach_15_00");	//Pomo¿esz mi popracowaæ nad moimi umiejêtnoœciami?
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_01");	//Móg³bym ci pokazaæ, jak wykorzystywaæ swoj¹ si³ê w bezpoœredniej walce.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_02");	//Wielu wojowników dostaje baty, bo nie potrafi odpowiednio spo¿ytkowaæ swojej si³y.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_03");	//Podobnie jest ze zrêcznoœci¹ i walk¹ na dystans.
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Torlof mo¿e mi pokazaæ, jak staæ siê zrêczniejszym i silniejszym.");
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
	description = "Pomó¿ mi popracowaæ nad moimi umiejêtnoœciami.";
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
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//Chcê zwiêkszyæ moje umiejêtnoœci.
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
		AI_Output(self,other,"DIA_Torlof_Teach_01_01");	//Powiedzia³em, ¿e MÓG£BYM ci pomóc, a nie, ¿e to ZROBIÊ.
		AI_Output(self,other,"DIA_Torlof_Teach_01_02");	//Dopóki nie zostaniesz jednym z nas, szukaj sobie innego nauczyciela.
	};
};

func void dia_torlof_teach_back()
{
	if((TORLOF_MERKE_STR < other.attribute[ATR_STRENGTH]) || (TORLOF_MERKE_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_Torlof_Teach_Back_01_00");	//Œwietnie! Teraz mo¿esz skuteczniej wykorzystywaæ swoje umiejêtnoœci.
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
	description = "Masz dla mnie jakieœ nowe zadania?";
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
	AI_Output(other,self,"DIA_Torlof_DEMENTOREN_15_00");	//Masz dla mnie jakieœ nowe zadania?
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_01");	//Widzia³eœ tych goœci w czarnych kapturach, którzy krêc¹ siê w pobli¿u? Jest z nimi coœ nie tak, mówiê ci.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_02");	//Gdy by³em na morzu, widywa³em ró¿ne dziwne rzeczy, ale tych zakapturzonych naprawdê siê bojê.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_03");	//Poszli w kierunku obozu bandytów, pod górami na po³udniowym krañcu doliny.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_04");	//Mo¿e powinieneœ siê tam wybraæ i zrobiæ z nimi porz¹dek?
	Wld_InsertNpc(castleminedmt,"FP_STAND_DEMENTOR_KDF_12");
	Log_CreateTopic(TOPIC_TORLOF_DMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOF_DMT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOF_DMT,"W górskim obozie bandytów, znajduj¹cym siê na po³udnie od doliny, ponoæ przebywa kilku z tych zakapturzonych mê¿czyzn, którzy ostatnio sprawiali problemy Torlofowi. Zamierzam rozwi¹zaæ ten problem raz na zawsze.");
	MIS_TORLOF_DMT = LOG_RUNNING;
};


instance DIA_TORLOF_DMTSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dmtsuccess_condition;
	information = dia_torlof_dmtsuccess_info;
	description = "Nie musisz siê ju¿ obawiaæ tych zakapturzonych postaci z gór.";
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
	AI_Output(other,self,"DIA_Torlof_DmtSuccess_15_00");	//Nie musisz ju¿ siê obawiaæ tych zakapturzonych postaci z gór.
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_01");	//Za³atwi³eœ ich? Gratulujê.
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_02");	//Coœ mi siê w nich nie podoba³o. Za³o¿ê siê, ¿e mielibyœmy przez nich niez³e k³opoty.
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
	description = "Czêœæ najemników odesz³a chyba z farmy?";
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
	AI_Output(other,self,"DIA_Torlof_WOISTSYLVIO_15_00");	//Czêœæ najemników odesz³a chyba z farmy?
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_01");	//Sylvio zabra³ kilku ch³opaków i poprowadzi³ ich na prze³êcz.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_02");	//Plotka g³osi, ¿e pokaza³y siê tam smoki. Jak Sylvio siê o tym dowiedzia³, nie mo¿na go by³o powstrzymaæ.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_03");	//Kto wie? Za smoczy ³eb mo¿na pewnie dostaæ kupê pieniêdzy.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_04");	//Ale to nie dla mnie. Jestem ¿eglarzem. Moje miejsce jest na morzu, a nie w cuchn¹cej smoczej jamie.
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
	description = "Jesteœ ¿eglarzem?";
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
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//Jesteœ ¿eglarzem?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_01");	//No, nareszcie za³apa³eœ! Tak, do diaska, jestem. Czemu pytasz?
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_02");	//Przyda³by mi siê ktoœ taki jak ty. Zamierzam pop³yn¹æ na pewn¹ wyspê.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_03");	//Na wyspê? Nie masz nawet statku, nie mówi¹c o za³odze.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_04");	//Nie nie nie, ch³opcze. Jeœli mam byæ twoim kapitanem i nauczycielem, musisz mi najpierw udowodniæ, ¿e wiesz, o co w tym wszystkim chodzi.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_05");	//Mam zreszt¹ teraz inne zmartwienie. Wbrew naszym przewidywaniom, paladyni nie opuœcili miasta.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_06");	//Potrzeba nie lada powodu, by ich wyci¹gn¹æ w pole.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_07");	//IdŸ do zamku w Górniczej Dolinie, wykradnij stra¿nikowi klucz do g³ównej bramy i otwórz j¹. Reszt¹ zajm¹ siê orkowie.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Zanim Torlof przyjmie posadê kapitana, muszê pozbyæ siê z miasta paladynów. Torlof wpad³ na pomys³ zaaran¿owania niewielkiego wypadku na zamku w Górniczej Dolinie - chce, abym ukrad³ stra¿nikowi klucz od g³ównej bramy i wpuœci³ orków do œrodka. Ma nadziejê, ¿e paladyni z miasta wyrusz¹ wtedy z odsiecz¹.");
};


instance DIA_TORLOF_BEMYCAPTAIN2(C_INFO)
{
	npc = sld_801_torlof;
	nr = 52;
	condition = dia_torlof_bemycaptain2_condition;
	information = dia_torlof_bemycaptain2_info;
	description = "Brama do zamku w Górniczej Dolinie jest ju¿ otwarta...";
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
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_00");	//Brama do zamku w Górniczej Dolinie jest ju¿ otwarta i zablokowana. Nic teraz nie powstrzyma szturmu orków.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_01");	//Za³oga zamku ponios³a ciê¿kie straty.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_02");	//Paladyni z miasta powinni wkrótce wyruszyæ do Doliny, by wyci¹gn¹æ swoich towarzyszy z oblê¿onego zamku.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN2_01_03");	//To œwietna wiadomoœæ. Teraz nic mnie ju¿ nie powstrzyma przed wyrwaniem siê z tego przeklêtego miejsca.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_TORLOF_BEMYCAPTAIN3(C_INFO)
{
	npc = sld_801_torlof;
	nr = 53;
	condition = dia_torlof_bemycaptain3_condition;
	information = dia_torlof_bemycaptain3_info;
	permanent = TRUE;
	description = "Czy teraz pomo¿esz mi dostaæ siê na wyspê?";
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
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_15_00");	//Czy teraz pomo¿esz mi dostaæ siê na wyspê?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_01");	//A, fakt. Chcia³eœ, ¿ebym z tob¹ pop³yn¹³. S³uchaj, zrobimy tak:
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_02");	//Zap³aæ mi 2500 sztuk z³ota, a ja poprowadzê twój okrêt.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_03");	//Za tê sumê nauczê ciê tak¿e wszystkiego, co wiem o sile i zrêcznoœci.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	Info_AddChoice(dia_torlof_bemycaptain3,"To bardzo du¿a suma.",dia_torlof_bemycaptain3_zuviel);
	Info_AddChoice(dia_torlof_bemycaptain3,"W porz¹dku. Oto twoje z³oto.",dia_torlof_bemycaptain3_ok);
};

func void dia_torlof_bemycaptain3_zuviel()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00");	//To bardzo du¿a suma.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01");	//Pomoc specjalisty musi kosztowaæ. Poza tym, nie masz wyboru. Nie znajdziesz tutaj nikogo innego, kto potrafi dowodziæ okrêtem.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02");	//Tak wiêc p³aæ i nie marudŸ.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	b_logentry(TOPIC_CAPTAIN,"Torlof zgadza siê obj¹æ obowi¹zki kapitana statku, jednak ¿¹da za to zap³aty w wysokoœci 2500 sztuk z³ota.");
};

func void dia_torlof_bemycaptain3_ok()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_ok_15_00");	//W porz¹dku. Oto twoje z³oto.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_01");	//Œwietnie. Teraz musisz mi tylko powiedzieæ, co mam zrobiæ.
		TORLOF_PAIDTOBECAPTAIN = TRUE;
		b_logentry(TOPIC_CAPTAIN,"Torlof dosta³ ode mnie 2500 sztuk z³ota i jest gotów wyruszyæ w ka¿dej chwili.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_02");	//Chcesz mi zmydliæ oczy paroma monetami? Zdob¹dŸ ca³¹ sumê, a wtedy pogadamy.
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
	description = "Zostañ kapitanem mojego statku.";
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
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_00");	//Zostañ kapitanem mojego statku.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_01");	//W porz¹dku. Daj mi statek i odpowiedni¹ za³ogê, a pop³ynê z tob¹ nawet na koniec œwiata.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_02");	//A masz odpowiedni¹ mapê morsk¹? Bez niej daleko nie dop³yniemy.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_03");	//To ju¿ moje zmartwienie. Spotkamy siê na przystani.
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
	description = "Mo¿emy ruszaæ w drogê.";
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
	AI_Output(other,self,"DIA_Torlof_LOSFAHREN_15_00");	//Mo¿emy ruszaæ w drogê.
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_01");	//Dobra. Daj mi mapê i odp³ywamy.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_02");	//Wszyscy na pok³ad!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_03");	//Na pewno masz wszystko, czego potrzeba? Nie bêdziemy zawracaæ w pó³ drogi!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_04");	//Jeœli jesteœ pewien, walnij siê na kojê w kajucie kapitana. Podró¿ trochê potrwa.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_05");	//Nie ma statku, nie ma za³ogi, nie ma mapy, nie ma podró¿y!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_06");	//Potrzebujê co najmniej piêciu ludzi zdatnych do pomocy na morzu.
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
	description = "Zdecydowa³em siê na innego kapitana.";
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
	AI_Output(other,self,"DIA_Torlof_PERM5_NOTCAPTAIN_15_00");	//Zdecydowa³em siê na innego kapitana. Mo¿esz mi oddaæ moje pieni¹dze.
	AI_Output(self,other,"DIA_Torlof_PERM5_NOTCAPTAIN_01_01");	//Chyba œnisz! Nie ma mowy! Jak p³acisz z góry, a potem zmieniasz zdanie, to ju¿ twój problem.
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

