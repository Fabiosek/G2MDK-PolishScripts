
instance DIA_RAOUL_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_exit_condition;
	information = dia_raoul_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_raoul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_NOSENTENZA(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_nosentenza_condition;
	information = dia_raoul_nosentenza_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_raoul_nosentenza_condition()
{
	if(!Npc_KnowsInfo(other,dia_sentenza_hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_raoul_nosentenza_info()
{
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_00");	//Zaczekaj no, przyjacielu!
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_01");	//Nie zauwa�y�em, �eby Sentenza ci� przeszukiwa�.
	if(Hlp_IsValidNpc(sentenza) && !c_npcisdown(sentenza))
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_02");	//SENTENZA! Chod� no tu!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_03");	//Chwileczk�, zaraz tu b�dzie!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_04");	//To ci niemi�a niespodzianka.
		b_attack(sentenza,other,AR_NONE,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_05");	//Gdzie� on u diabla jest? C�, niewa�ne, tym razem ci si� uda�o...
	};
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_HELLO(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_hello_condition;
	information = dia_raoul_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_raoul_hello_condition()
{
	if((other.guild == GIL_NONE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_raoul_hello_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_00");	//Czego chcesz?
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_01");	//Czego chcesz tym razem?
	};
};


var int raoul_gesagt;

instance DIA_RAOUL_PERMNONE(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_permnone_condition;
	information = dia_raoul_permnone_info;
	permanent = TRUE;
	description = "Chcia�bym obejrze� farm�.";
};


func int dia_raoul_permnone_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_permnone_info()
{
	if(RAOUL_GESAGT == FALSE)
	{
		AI_Output(other,self,"DIA_Raoul_PERMNone_15_00");	//Chcia�bym obejrze� farm�.
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_01");	//Nie zagl�daj do budynku po lewej stronie. Siedzi tam Sylvio i lepiej mu teraz nie przeszkadza�. Jest w nie najlepszym nastroju.
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_02");	//Je�li zobaczy takiego s�abeusza, i to jeszcze nie pracuj�cego na farmie, mo�e chcie� wy�adowa� na nim swoj� z�o��.
		RAOUL_GESAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_03");	//Baw si� dobrze!
		AI_StopProcessInfos(self);
	};
};


instance DIA_RAOUL_WANNAJOIN(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_wannajoin_condition;
	information = dia_raoul_wannajoin_info;
	permanent = FALSE;
	description = "Chc� si� przy��czy� do Lee.";
};


func int dia_raoul_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_wannajoin_info()
{
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_00");	//Chc� si� przy��czy� do Lee.
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_01");	//Jak tak dalej p�jdzie, to wkr�tce Lee nie b�dzie mia� tu nic do gadania.
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_02");	//Co masz na my�li?
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_03");	//Ka�e nam tu tylko siedzie� i nic nie robi�. Od czasu do czasu mamy tylko postraszy� kilku wie�niak�w, i tyle.
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_04");	//Sylvio zawsze powtarza, �e najlepsz� obron� jest atak, i ma do cholery racj�.
};


instance DIA_RAOUL_ABOUTSYLVIO(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_aboutsylvio_condition;
	information = dia_raoul_aboutsylvio_info;
	permanent = FALSE;
	description = "Kim jest Sylvio?";
};


func int dia_raoul_aboutsylvio_condition()
{
	if((RAOUL_GESAGT == TRUE) || Npc_KnowsInfo(other,dia_raoul_wannajoin))
	{
		return TRUE;
	};
};

func void dia_raoul_aboutsylvio_info()
{
	AI_Output(other,self,"DIA_Raoul_AboutSylvio_15_00");	//Kim jest Sylvio?
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_01");	//To nasz nast�pny przyw�dca, je�li chcesz zna� moje zdanie. Je�eli zamierzasz go prosi� o to, by pozwoli� ci si� do nas przy��czy�, to lepiej o tym zapomnij!
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_02");	//Nawet pastuch by�by z ciebie marny.
};


instance DIA_RAOUL_STIMME(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_stimme_condition;
	information = dia_raoul_stimme_info;
	permanent = FALSE;
	description = "Chcia�bym zosta� najemnikiem, co ty na to?";
};


func int dia_raoul_stimme_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_raoul_stimme_info()
{
	AI_Output(other,self,"DIA_Raoul_Stimme_15_00");	//Chcia�bym zosta� najemnikiem, co ty na to?
	AI_Output(self,other,"DIA_Raoul_Stimme_01_01");	//Eee, r�b sobie, co chcesz...
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"Raoul nie sprzeciwia si� mojemu wst�pieniu w szeregi najemnik�w.");
};


instance DIA_RAOUL_DUELL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_duell_condition;
	information = dia_raoul_duell_info;
	permanent = TRUE;
	description = "Chyba przywal� ci w mord�...";
};


func int dia_raoul_duell_condition()
{
	if((RAOUL_GESAGT == TRUE) || Npc_KnowsInfo(other,dia_raoul_aboutsylvio) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_raoul_duell_info()
{
	AI_Output(other,self,"DIA_Raoul_Duell_15_00");	//Chyba przywal� ci w mord�...
	AI_Output(self,other,"DIA_Raoul_Duell_01_01");	//Co?
	AI_Output(other,self,"DIA_Raoul_Duell_15_02");	//W�a�nie tego ci teraz trzeba...
	AI_Output(self,other,"DIA_Raoul_Duell_01_03");	//Do tej pory by�em mi�y, nieprawda�?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_RAOUL_PERM(C_INFO)
{
	npc = sld_822_raoul;
	nr = 900;
	condition = dia_raoul_perm_condition;
	information = dia_raoul_perm_info;
	permanent = TRUE;
	description = "Opr�cz tego, wszystko w porz�dku?";
};


func int dia_raoul_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_perm_info()
{
	AI_Output(other,self,"DIA_Raoul_PERM_15_00");	//Opr�cz tego, wszystko w porz�dku?
	if(MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_01");	//Przesta� mle� ozorem. Id� i przynie� mi sk�r� tego czarnego trolla.
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_02");	//Pr�bujesz mnie podej��, co ? Spadaj!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Raoul_PERM_01_03");	//Nie zapomnia�em jeszcze co� mi zrobi�.
		};
	};
};


instance DIA_RAOUL_TROLL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_troll_condition;
	information = dia_raoul_troll_info;
	important = TRUE;
};


func int dia_raoul_troll_condition()
{
	if(hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_troll_info()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_01_00");	//Sp�jrzcie na niego!
	AI_Output(other,self,"DIA_Raoul_TROLL_15_01");	//Czego chcesz?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_02");	//A ty co? Przy��czy�e� si� do bandy �ebrak�w? Na to wygl�da.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_03");	//Nie my�l sobie, �e oka�� ci szacunek, tylko dlatego, �e jeste� teraz jednym z nas.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_04");	//Udajesz wielkiego maga, co?
	};
	AI_Output(self,other,"DIA_Raoul_TROLL_01_05");	//Powiem ci co�, cokolwiek by� na siebie za�o�y�, nie ukryjesz swojego prawdziwego 'ja'.
	AI_Output(self,other,"DIA_Raoul_TROLL_01_06");	//Dla mnie jeste� tylko ma�ym, zawszonym obibokiem.
	Info_ClearChoices(dia_raoul_troll);
	Info_AddChoice(dia_raoul_troll,"Musz� ju� i��.",dia_raoul_troll_weg);
	Info_AddChoice(dia_raoul_troll,"W czym problem?",dia_raoul_troll_rechnung);
};

func void dia_raoul_troll_weg()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_weg_15_00");	//Musz� ju� i��.
	AI_Output(self,other,"DIA_Raoul_TROLL_weg_01_01");	//Taak. Spadaj.
	AI_StopProcessInfos(self);
};

func void dia_raoul_troll_rechnung()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_00");	//W czym problem?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_01");	//Znam ja takich jak ty. Mocni tylko w g�bie.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_02");	//Gardz� lud�mi, kt�rzy stroj� si� jak pawie, i chwal� si� swoimi bohaterskimi czynami.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_03");	//Nie dalej ni� wczoraj musia�em zdzieli� w pysk jednego z ch�opak�w, bo przechwala� si�, �e nawet z jedn� r�k� uwi�zan� za plecami mo�e powali� czarnego trolla.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_04");	//I co w tym dziwnego?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_05");	//Czy ty w og�le wiesz, co m�wisz? Jak to 'co w tym dziwnego'?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_06");	//Czy� ty kiedy� widzia� czarnego trolla, m�dralo? Nie masz nawet poj�cia, jakie to wielkie i gro�ne bestie.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_07");	//Podejdziesz krok za blisko, a rozszarpi� ci� na strz�py.
	Info_ClearChoices(dia_raoul_troll);
	Info_AddChoice(dia_raoul_troll,"Nie jestem zainteresowany.",dia_raoul_troll_rechnung_hastrecht);
	if(Npc_IsDead(troll_black))
	{
		Info_AddChoice(dia_raoul_troll,"Zabi�em ju� czarnego trolla.",dia_raoul_troll_rechnung_ich);
	}
	else
	{
		Info_AddChoice(dia_raoul_troll,"Czarnego trolla? �aden problem.",dia_raoul_troll_rechnung_noprob);
	};
};

func void b_raoul_blame()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00");	//Sam si� o to prosisz. Powinienem ju� dawno da� ci w mord�, ale mam lepszy pomys�.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01");	//Skoro taki wspania�y z ciebie wojownik, udowodnij to.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02");	//A co ja b�d� z tego mia�?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03");	//G�upie pytanie. Honor i szcz�k� w jednym kawa�ku.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04");	//Nie jest tego wiele, sam przyznasz.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05");	//Mmm. Powiedzmy, �e je�li przyniesiesz mi sk�r� czarnego trolla, obsypi� ci� z�otem. Co ty na to?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06");	//Lepiej.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07");	//Na co wi�c czekasz?
	Log_CreateTopic(TOPIC_KILLTROLLBLACK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTROLLBLACK,LOG_RUNNING);
	b_logentry(TOPIC_KILLTROLLBLACK,"Raoul chce, abym przyni�s� mu sk�r� czarnego trolla.");
	MIS_RAOUL_KILLTROLLBLACK = LOG_RUNNING;
	Info_ClearChoices(dia_raoul_troll);
};

func void dia_raoul_troll_rechnung_hastrecht()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_hastrecht_15_00");	//Nie jestem zainteresowany.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_hastrecht_01_01");	//Mo�e to i lepiej dla ciebie.
	Info_ClearChoices(dia_raoul_troll);
};

func void dia_raoul_troll_rechnung_ich()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_ich_15_00");	//Zabi�em ju� czarnego trolla.
	b_raoul_blame();
};

func void dia_raoul_troll_rechnung_noprob()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_noProb_15_00");	//Czarnego trolla? �aden problem.
	b_raoul_blame();
};


instance DIA_RAOUL_TROPHYFUR(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_trophyfur_condition;
	information = dia_raoul_trophyfur_info;
	permanent = TRUE;
	description = "Najpierw mi powiedz, jak �ci�gn�� sk�r� z czarnego trolla.";
};


func int dia_raoul_trophyfur_condition()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) && (MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_raoul_trophyfur_info()
{
	AI_Output(other,self,"DIA_Raoul_TrophyFur_15_00");	//Najpierw mi powiedz, jak �ci�gn�� sk�r� z czarnego trolla.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_01");	//S�uchaj uwa�nie, bo rzadko udzielam rad za darmo.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_02");	//Z�ap besti� i natnij sk�r� na ka�dej z jego n�g.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_03");	//Potem mocno �ci�gnij sk�r� przez g�ow�. To chyba nie trudne.
	};
};


instance DIA_RAOUL_TROLLFELL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_trollfell_condition;
	information = dia_raoul_trollfell_info;
	description = "Mam sk�r� czarnego trolla.";
};


func int dia_raoul_trollfell_condition()
{
	if(Npc_HasItems(other,itat_trollblackfur) && Npc_KnowsInfo(other,dia_raoul_troll))
	{
		return TRUE;
	};
};

func void dia_raoul_trollfell_info()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_00");	//Mam sk�r� czarnego trolla.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_01");	//To niemo�liwe. Poka� mi j�.
	b_giveinvitems(other,self,itat_trollblackfur,1);
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_02");	//Nieprawdopodobne. Co za ni� chcesz?
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_03");	//Dawaj wszystko, co masz.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_04");	//Dobra. Dam ci 500 sztuk z�ota i dorzuc� trzy silne mikstury lecznicze, co ty na to?
	Info_ClearChoices(dia_raoul_trollfell);
	Info_AddChoice(dia_raoul_trollfell,"To za ma�o.",dia_raoul_trollfell_nein);
	Info_AddChoice(dia_raoul_trollfell,"Zrobione.",dia_raoul_trollfell_ja);
	MIS_RAOUL_KILLTROLLBLACK = LOG_SUCCESS;
	b_giveplayerxp(XP_RAOUL_KILLTROLLBLACK);
};

func void dia_raoul_trollfell_ja()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_ja_15_00");	//Sprzedane.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_ja_01_01");	//Interesy z tob� to sama przyjemno��.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
	Info_ClearChoices(dia_raoul_trollfell);
};

func void dia_raoul_trollfell_nein()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_nein_15_00");	//To za ma�o.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_01");	//Jak uwa�asz, sk�ra i tak b�dzie moja.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_02");	//Nie pozwol�, by omin�a mnie taka okazja.
	MIS_RAOUL_DOESNTPAYTROLLFUR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_FELLZURUECK(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_fellzurueck_condition;
	information = dia_raoul_fellzurueck_info;
	permanent = TRUE;
	description = "Oddawaj sk�r� trolla.";
};


func int dia_raoul_fellzurueck_condition()
{
	if((MIS_RAOUL_DOESNTPAYTROLLFUR == LOG_RUNNING) && Npc_HasItems(self,itat_trollblackfur))
	{
		return TRUE;
	};
};

func void dia_raoul_fellzurueck_info()
{
	AI_Output(other,self,"DIA_Raoul_FELLZURUECK_15_00");	//Oddawaj sk�r� trolla.
	AI_Output(self,other,"DIA_Raoul_FELLZURUECK_01_01");	//Nie.
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_GOTTROLLFURBACK(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_gottrollfurback_condition;
	information = dia_raoul_gottrollfurback_info;
	description = "Nigdy wi�cej nie pr�buj mnie okrada�, zrozumiano?";
};


func int dia_raoul_gottrollfurback_condition()
{
	if((MIS_RAOUL_DOESNTPAYTROLLFUR == LOG_RUNNING) && (Npc_HasItems(self,itat_trollblackfur) == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_raoul_gottrollfurback_info()
{
	AI_Output(other,self,"DIA_Raoul_GotTrollFurBack_15_00");	//Nigdy wi�cej nie pr�buj mnie okrada�, zrozumiano?
	AI_Output(self,other,"DIA_Raoul_GotTrollFurBack_01_01");	//W porz�dku. Nie masz poj�cia, jakie panuj� tu zasady, prawda? W takim razie uspok�j si�.
	MIS_RAOUL_DOESNTPAYTROLLFUR = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP3_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap3_exit_condition;
	information = dia_raoul_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_raoul_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP4_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap4_exit_condition;
	information = dia_raoul_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_raoul_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP5_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap5_exit_condition;
	information = dia_raoul_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_raoul_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_SHIP(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_ship_condition;
	information = dia_raoul_ship_info;
	description = "Mo�e chcia�by� si� st�d wyrwa�, zobaczy� ocean...";
};


func int dia_raoul_ship_condition()
{
	if((KAPITEL >= 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_raoul_ship_info()
{
	AI_Output(other,self,"DIA_Raoul_Ship_15_00");	//Mo�e chcia�by� si� st�d wyrwa�, zobaczy� ocean...
	AI_Output(self,other,"DIA_Raoul_Ship_01_01");	//Co masz na my�li? Chcesz porwa� statek paladyn�w?
	AI_Output(other,self,"DIA_Raoul_Ship_15_02");	//A je�li nawet?
	AI_Output(self,other,"DIA_Raoul_Ship_01_03");	//Czy� ty do ko�ca oszala�? Nie, dzi�ki, to nie dla mnie.
	AI_Output(self,other,"DIA_Raoul_Ship_01_04");	//Nie wiem, dlaczego mia�bym opuszcza� Khorinis. Czy zarobi� tutaj, czy na kontynencie, to dla mnie bez r�nicy.
	AI_Output(self,other,"DIA_Raoul_Ship_01_05");	//Poszukaj sobie kogo innego.
	if(Npc_IsDead(torlof) == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Ship_01_06");	//Pogadaj z Torlofem, z tego co wiem, sp�dzi� wiele czasu na morzu.
	};
};


instance DIA_RAOUL_KAP6_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap6_exit_condition;
	information = dia_raoul_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_raoul_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_PICKPOCKET(C_INFO)
{
	npc = sld_822_raoul;
	nr = 900;
	condition = dia_raoul_pickpocket_condition;
	information = dia_raoul_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_raoul_pickpocket_condition()
{
	return c_beklauen(45,85);
};

func void dia_raoul_pickpocket_info()
{
	Info_ClearChoices(dia_raoul_pickpocket);
	Info_AddChoice(dia_raoul_pickpocket,DIALOG_BACK,dia_raoul_pickpocket_back);
	Info_AddChoice(dia_raoul_pickpocket,DIALOG_PICKPOCKET,dia_raoul_pickpocket_doit);
};

func void dia_raoul_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_raoul_pickpocket);
};

func void dia_raoul_pickpocket_back()
{
	Info_ClearChoices(dia_raoul_pickpocket);
};

