
instance DIA_CORD_EXIT(C_INFO)
{
	npc = sld_805_cord;
	nr = 999;
	condition = dia_cord_exit_condition;
	information = dia_cord_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cord_exit_condition()
{
	return TRUE;
};

func void dia_cord_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CORD_MEETINGISRUNNING(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_addon_cord_meetingisrunning_condition;
	information = dia_addon_cord_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_cord_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int dia_addon_cord_meetingisrunning_onetime;

func void dia_addon_cord_meetingisrunning_info()
{
	if(DIA_ADDON_CORD_MEETINGISRUNNING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_00");	//Witaj w Wodnym Kr�gu, bracie.
		DIA_ADDON_CORD_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_01");	//Powiniene� teraz i�� do Vatrasa.
	};
	AI_StopProcessInfos(self);
};


instance DIA_CORD_HALLO(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_cord_hallo_condition;
	information = dia_cord_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cord_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE) && (RANGERMEETINGRUNNING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_cord_hallo_info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Je�li masz problem z wilkami albo polnymi bestiami, porozmawiaj z kt�rym� z m�odszych najemnik�w.
	AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//Mo�esz do mnie przyj��, kiedy pojawi� si� tu paladyni.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Co?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Zawsze kiedy przychodzi do mnie jaki� wie�niak, chodzi o rze� na niewinnych zwierz�tach.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Nie jestem wie�niakiem.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Tak? A zatem czego chcesz?
	};
};


var int cord_schonmalgefragt;

instance DIA_CORD_WANNAJOIN(C_INFO)
{
	npc = sld_805_cord;
	nr = 5;
	condition = dia_cord_wannajoin_condition;
	information = dia_cord_wannajoin_info;
	permanent = TRUE;
	description = "Chc� zosta� najemnikiem!";
};


func int dia_cord_wannajoin_condition()
{
	if((CORD_APPROVED == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void b_cord_bebetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//Dop�ki nie nauczysz si� prawid�owo trzyma� bro�, nie masz tu czego szuka�!
};

func void dia_cord_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Chc� zosta� najemnikiem!
	if(CORD_SCHONMALGEFRAGT == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Wygl�dasz mi raczej na kogo�, kto urodzi� si� do pracy w polu, ch�opcze.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Potrafisz trzyma� bro�?
		CORD_SCHONMALGEFRAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Podszkoli�e� si� troch�?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//To mo�e bro� jednor�czna?
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Nie jestem w tym a� taki z�y...
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//No c�...
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//W takim razie dwur�czna?
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Poradz� sobie z tym.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//Z pewno�ci� szybko si� naucz�!
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//No c�, przynajmniej nie jeste� zupe�nie zielony. Dobrze, przyjmuj� ci�.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Mog� ci� nauczy�, czego tylko zapragniesz.
		CORD_APPROVED = TRUE;
		b_giveplayerxp(XP_CORD_APPROVED);
		b_logentry(TOPIC_SLDRESPEKT,"G�os Corda znajduje si� w sakwie.");
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Cord mo�e mnie szkoli� w zakresie walki or�em jedno- i dwur�cznym.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Innymi s�owy, jeste� cholernym amatorem!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Ka�dy najemnik musi wiedzie�, �e mo�e polega� na swoich kompanach. Od tego zale�y nasze �ycie.
		b_cord_bebetter();
		Log_CreateTopic(TOPIC_CORDPROVE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CORDPROVE,LOG_RUNNING);
		b_logentry(TOPIC_CORDPROVE,"Cord udzieli mi swojego poparcia, je�li stan� si� lepszym wojownikiem.");
	};
};


instance DIA_ADDON_CORD_YOUARERANGER(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_addon_cord_youareranger_condition;
	information = dia_addon_cord_youareranger_info;
	description = "Podobno nale�ysz do Wodnego Kr�gu.";
};


func int dia_addon_cord_youareranger_condition()
{
	if((RANGERHELP_GILDESLD == TRUE) && (CORD_SCHONMALGEFRAGT == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cord_youareranger_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_00");	//Podobno nale�ysz do Wodnego Kr�gu.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_01");	//Kt�ry dure� nie umia� siedzie� cicho?
		if(SC_KNOWSCORDASRANGERFROMLEE == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_02");	//Lee mi powiedzia�.
		};
		if(SC_KNOWSCORDASRANGERFROMLARES == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_03");	//Lares wspomina�, �e pomo�esz mi - je�li powiem, �e jestem jego protegowanym.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_04");	//Wygl�da wi�c na to, �e musz� si� z tym pogodzi�.
	AI_Output(self,other,"DIA_Addon_Cord_Add_14_01");	//Dobrze - czego ci potrzeba?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_06");	//Tylko uwa�aj, co teraz powiesz. Je�li nie spodobaj� mi si� twoje s�owa, to po�a�ujesz!
	Info_ClearChoices(dia_addon_cord_youareranger);
	Info_AddChoice(dia_addon_cord_youareranger,"Prawd� m�wi�c, to niczego mi nie potrzeba. Sam sobie jako� poradz�.",dia_addon_cord_youareranger_nix);
	Info_AddChoice(dia_addon_cord_youareranger,"Chc� twojego pancerza.",dia_addon_cord_youareranger_ruestung);
	Info_AddChoice(dia_addon_cord_youareranger,"Chc� twojej broni!",dia_addon_cord_youareranger_waffe);
	if(CORD_APPROVED == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"Naucz mnie walki.",dia_addon_cord_youareranger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
	};
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"Mo�esz pom�c mi w do��czeniu do najemnik�w.",dia_addon_cord_youareranger_sldaufnahme);
	};
};


var int cord_sc_dreist;

func void b_dia_addon_cord_youareranger_warn()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_WARN_14_00");	//Je�li si� dowiem, �e nie trzyma�e� g�by na k��dk�, lepiej trzymaj si� z daleka. Nie mam zamiaru powtarza� tego ostrze�enia!
};

func void b_dia_addon_cord_youareranger_fresse()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_FRESSE_14_00");	//Do�� tego - to ju� przesada. Po�a�ujesz tego!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	CORD_RANGERHELP_GETSLD = FALSE;
	CORD_RANGERHELP_FIGHT = FALSE;
	TOPIC_END_RANGERHELPSLD = TRUE;
};

func void dia_addon_cord_youareranger_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_ruestung_15_00");	//Chc� twojego pancerza.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_ruestung_14_01");	//Jeszcze jeden taki tekst, a b�dziesz zbiera� z�by z pod�ogi!
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_waffe()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Add_15_00");	//Chc� twojej broni!
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//Czy�by?
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_02");	//Ta, jasne...
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_weg()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_weg_15_00");	//Odwal si�. Albo mo�esz od razu wybiera� sobie kwater� na cmentarzu.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_weg_14_01");	//Lepiej ze mn� nie igraj, bo porachuj� ci ko�ci.
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};


var int dia_addon_cord_youareranger_scgotoffer;

func void dia_addon_cord_youareranger_kampf()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_kampf_15_00");	//Naucz mnie walki.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_kampf_14_01");	//Dobra. Co jeszcze?
	CORD_RANGERHELP_FIGHT = TRUE;
	if(DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"Do�� tego.",dia_addon_cord_youareranger_reicht);
		DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER = TRUE;
	};
};

func void dia_addon_cord_youareranger_sldaufnahme()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00");	//Mo�esz pom�c mi w do��czeniu do najemnik�w.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01");	//A to dobre. Jasne, spr�buj�. Co� jeszcze?
	CORD_RANGERHELP_GETSLD = TRUE;
	if(DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"Do�� tego.",dia_addon_cord_youareranger_reicht);
		DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER = TRUE;
	};
};

func void dia_addon_cord_youareranger_gold()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Gold_15_00");	//Zap�a� mi, a b�d� siedzie� cicho.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_Gold_14_01");	//Nie ma mowy - nie dam si� szanta�owa�.
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_nix()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_nix_15_00");	//Prawd� m�wi�c, to niczego mi nie potrzeba. Sam sobie jako� poradz�.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_nix_14_01");	//Jak sobie tam chcesz.
	b_dia_addon_cord_youareranger_warn();
	Info_ClearChoices(dia_addon_cord_youareranger);
};

func void dia_addon_cord_youareranger_reicht()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//To wystarczy.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_reicht_14_01");	//Skoro to ju� wszystko...
	b_dia_addon_cord_youareranger_warn();
	Info_ClearChoices(dia_addon_cord_youareranger);
};


instance DIA_ADDON_CORD_RANGERHELP2GETSLD(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_addon_cord_rangerhelp2getsld_condition;
	information = dia_addon_cord_rangerhelp2getsld_info;
	permanent = TRUE;
	description = "Pom� mi zosta� najemnikiem.";
};


var int dia_addon_cord_rangerhelp2getsld_noperm;

func int dia_addon_cord_rangerhelp2getsld_condition()
{
	if((CORD_RANGERHELP_GETSLD == TRUE) && (hero.guild == GIL_NONE) && (DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void b_cord_rangerhelpobsolete()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_00");	//Problem zosta� ju� rozwi�zany.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_01");	//W takim razie b�dzie ci�ko.
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_02");	//O co ci chodzi?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_03");	//O to, �e nie mog� ci ju� pom�c.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_04");	//Bo chyba nie liczysz na to, �e b�d� walczy� z ka�dym najemnikiem tylko po to, aby przyj�li ci� w swe szeregi?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_05");	//Nie... To musisz zrobi� sam.
	DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM = TRUE;
	TOPIC_END_RANGERHELPSLD = TRUE;
};

func void b_cord_comelaterwhendone()
{
	AI_Output(self,other,"DIA_Addon_Cord_ComeLaterWhenDone_14_00");	//Dobrze - bierz si� do roboty i wr��, gdy b�dzie ju� po wszystkim.
	AI_StopProcessInfos(self);
};

func void b_cord_idoitforyou()
{
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_00");	//Ach tak. To proste. Wr�� jutro - do tej pory sprawa b�dzie za�atwiona.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_01");	//Oczywi�cie - ale b�d� chcia� czego� w zamian.
	AI_Output(other,self,"DIA_Addon_Cord_IDoItForYou_15_02");	//Na przyk�ad?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_03");	//W g�rach na po�udniowy wsch�d st�d znajduje si� niedu�y ob�z bandyt�w.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_04");	//Je�li zwr�cisz si� w tamtym kierunku, to zobaczysz wie��.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_05");	//Jeden z moich ludzi - Patrick - poszed� tam par� dni temu. Chcia� handlowa� z tymi �obuzami...
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_06");	//M�wi�em mu, �e to kiepski pomys�, ale ten dure� nie chcia� mnie s�ucha�.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_07");	//Zak�adam, �e pad� ich ofiar�, cho� nie mog� mie� pewno�ci.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_08");	//Zweryfikujesz dla mnie to podejrzenie.
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"Cord zajmie si� pr�b� Torlofa. Patrick, kumpel Corda, zagin��. Mam i�� do obozu bandyt�w w g�rach na po�udniowym wschodzie i sprawdzi�, czy nie ma tam Patricka.");
	Info_ClearChoices(dia_addon_cord_rangerhelp2getsld);
	Info_AddChoice(dia_addon_cord_rangerhelp2getsld,"Nie ma mowy - to zadanie jest znacznie trudniejsze od tego, kt�re proponuje Torlof.",b_cord_idoitforyou_mist);
	Info_AddChoice(dia_addon_cord_rangerhelp2getsld,"A sk�d mam wiedzie�, �e nie zrobi� tego samego, gdy ujrz� mnie?",b_cord_idoitforyou_dexter);
	DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM = TRUE;
};

func void b_cord_idoitforyou_mist()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_mist_15_00");	//Nie ma mowy - to zadanie jest znacznie trudniejsze od tego, kt�re proponuje Torlof.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_01");	//Niekoniecznie - taki ma�y spryciarz, jak ty, nie powinien si� im wyda� podejrzany.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_02");	//Sam jednak tego nie zrobi� - gdy tylko zobacz� najemnika, natychmiast chwyc� za bro�.
};

func void b_cord_idoitforyou_dexter()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_Dexter_15_00");	//A sk�d mam wiedzie�, �e nie zrobi� tego samego, kiedy ujrz� mnie?
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_01");	//Bo znam imi� ich wodza - to Dexter. Udaj, �e go znasz.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_02");	//Zastanowi� si� dwa razy, zanim ci� zaatakuj�.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_03");	//Oczywi�cie ca�a afera i tak mo�e si� okaza� ca�kiem niebezpieczna.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_04");	//Ale jako� sobie poradzisz.
	Info_ClearChoices(dia_addon_cord_rangerhelp2getsld);
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"Przyw�dca bandyt�w nazywa si� Dexter.");
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Najemnik Cord szuka swojego kumpla, Patricka.");
	MIS_ADDON_CORD_LOOK4PATRICK = LOG_RUNNING;
	RANGER_SCKNOWSDEXTER = TRUE;
};

func void dia_addon_cord_rangerhelp2getsld_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_00");	//Pom� mi zosta� najemnikiem.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_01");	//Hmm... Pomy�lmy. Na pewno musisz w tym celu pogada� z Torlofem.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_02");	//Rozmawia�e� z nim na ten temat?
	if(TORLOF_GO == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//Nie bardzo.
		b_cord_comelaterwhendone();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_04");	//Taaa. To pr�ba.
		AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_05");	//Rozumiem. A na czym ta pr�ba polega, tak konkretnie?
		if((TORLOF_PROBEBESTANDEN == TRUE) || ((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_IsDead(rumbold) && Npc_IsDead(rick)) || ((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING) && ((sekob.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_IsDead(sekob))))
		{
			b_cord_rangerhelpobsolete();
		}
		else if(TORLOF_PROBE == 0)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_06");	//Tego jeszcze nie wiem.
			b_cord_comelaterwhendone();
		}
		else if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_07");	//Polecono mi odebra� akt w�asno�ci - d�ug Sekoba.
			b_cord_idoitforyou();
		}
		else if(TORLOF_PROBE == PROBE_BENGAR)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_08");	//Mam si� zaj�� stra�� na farmie Bengara.
			b_cord_idoitforyou();
		}
		else
		{
			b_cord_rangerhelpobsolete();
		};
	};
};


instance DIA_ADDON_CORD_TALKEDTODEXTER(C_INFO)
{
	npc = sld_805_cord;
	nr = 5;
	condition = dia_addon_cord_talkedtodexter_condition;
	information = dia_addon_cord_talkedtodexter_info;
	description = "Odwiedziny u Dextera mam ju� za sob�.";
};


func int dia_addon_cord_talkedtodexter_condition()
{
	if(((bdt_1060_dexter.aivar[AIV_TALKEDTOPLAYER] == TRUE) || Npc_IsDead(bdt_1060_dexter)) && (MIS_ADDON_CORD_LOOK4PATRICK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_cord_talkedtodexter_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_00");	//Odwiedziny u Dextera mam ju� za sob�.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//I?
	if(Npc_IsDead(bdt_1060_dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//Nie �yje.
	};
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_03");	//Nie znalaz�em �adnego �ladu tego twojego Patricka.
	if(DEXTER_KNOWSPATRICK == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_04");	//Dexter go zapami�ta�, ale m�wi�, �e Patrick od d�u�szego czasu ju� ich nie odwiedza�.
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_05");	//Masz pewno��, �e nie k�ama�?
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_06");	//Nie. Ale �adnymi innymi informacjami nie dysponuj�.
	};
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_07");	//Nie rozumiem. Go�� zagin�� bez wie�ci.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_08");	//Twoja cz�� umowy zosta�a jednak wype�niona...
	MIS_ADDON_CORD_LOOK4PATRICK = LOG_SUCCESS;
	TOPIC_END_RANGERHELPSLD = TRUE;
	b_giveplayerxp(XP_ADDON_CORD_LOOK4PATRICK);
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_09");	//Co wi�c z pr�b� Torlofa?
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_10");	//Wr�� do niego - pr�ba zako�czona pomy�lnie. M�wi�em, �e si� tym zajm�...
	CORD_RANGERHELP_TORLOFSPROBE = TRUE;
	if(TORLOF_PROBE == PROBE_SEKOB)
	{
		MIS_TORLOF_HOLPACHTVONSEKOB = LOG_SUCCESS;
	}
	else if(TORLOF_PROBE == PROBE_BENGAR)
	{
		MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_SUCCESS;
	};
};


instance DIA_CORD_RETURNPATRICK(C_INFO)
{
	npc = sld_805_cord;
	nr = 8;
	condition = dia_cord_returnpatrick_condition;
	information = dia_cord_returnpatrick_info;
	permanent = FALSE;
	description = "Patrick wr�ci�.";
};


func int dia_cord_returnpatrick_condition()
{
	if((Npc_GetDistToWP(patrick_nw,"NW_BIGFARM_PATRICK") <= 1000) && (MISSINGPEOPLERETURNEDHOME == TRUE))
	{
		return TRUE;
	};
};

func void dia_cord_returnpatrick_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_00");	//Patrick wr�ci�.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_01");	//Nie s�dzi�em, �e go jeszcze kiedy� ujrz�...
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_02");	//Zrobisz co� dla mnie?
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//Jasne.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_04");	//Nie dzi�kuj mi.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_05");	//Nie mia�em takiego zamiaru.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//Wi�c...?
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_07");	//Powiem ci tylko, �e niez�y z ciebie numer.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_09");	//Uwa�aj na siebie!
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_CORD_EXPLAINSKILLS(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_cord_explainskills_condition;
	information = dia_cord_explainskills_info;
	permanent = FALSE;
	description = "Od czego powinienem zacz��, od walki broni� jedno- czy dwur�czn�?";
};


func int dia_cord_explainskills_condition()
{
	if(CORD_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_cord_explainskills_info()
{
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Od czego powinienem zacz��, od walki broni� jedno- czy dwur�czn�?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Te dwa rodzaje broni s� do�� podobne.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_02");	//Dlatego za ka�dym razem, kiedy osi�gasz nast�pny stopie� do�wiadczenia w pos�ugiwaniu si� jedn� z nich, podnosz� si� twoje umiej�tno�ci w zakresie walki drug�.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_03");	//Oznacza to, �e je�li jeste� dobrze obeznany z mieczem jednor�cznym, ale wci�� brakuje ci do�wiadczenia w pos�ugiwaniu si� broni� dwur�czn�...
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_04");	//...twoje umiej�tno�ci w zakresie walki mieczem dwur�cznym wzrastaj� za ka�dym razem, kiedy trenujesz z mieczem jednor�cznym.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_05");	//Je�li trenujesz walk� jednym rodzajem broni, tw�j trening b�dzie bardziej wyczerpuj�cy.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_06");	//Je�li trenujesz walk� dwoma rodzajami broni, osi�gniesz ten sam efekt przy mniejszym wysi�ku.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//Ostatecznie wyjdzie na to samo - wyb�r nale�y do ciebie.
};


instance DIA_CORD_EXPLAINWEAPONS(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_cord_explainweapons_condition;
	information = dia_cord_explainweapons_info;
	permanent = FALSE;
	description = "Jakie s� zalety broni jedno- i dwur�cznych?";
};


func int dia_cord_explainweapons_condition()
{
	if(CORD_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_cord_explainweapons_info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Jakie s� zalety broni jedno- i dwur�cznych?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Dobre pytanie. Widz�, �e przemy�la�e� kwesti� swojego treningu.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Bro� jednor�czna jest szybsza, ale zadaje troch� mniejsze obra�enia.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Z kolei bro� dwur�czna zadaje wi�ksze obra�enia, ale nie mo�esz zadawa� ni� szybkich cios�w.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//Poza tym walka broni� dwur�czn� wymaga wi�kszej si�y, a to oznacza dodatkowy trening.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Dobre wyszkolenie wymaga sporo wysi�ku.
};


var int cord_merke_1h;
var int cord_merke_2h;

instance DIA_CORD_TEACH(C_INFO)
{
	npc = sld_805_cord;
	nr = 3;
	condition = dia_cord_teach_condition;
	information = dia_cord_teach_info;
	permanent = TRUE;
	description = "Naucz mnie walczy�!";
};


func int dia_cord_teach_condition()
{
	return TRUE;
};

func void b_cord_zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnuj� czasu na amator�w.
};

func void dia_cord_teach_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Naucz mnie walczy�!
	if((CORD_APPROVED == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (CORD_RANGERHELP_FIGHT == TRUE))
	{
		if(((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)) || (CORD_RANGERHELP_FIGHT == TRUE))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Mog� ci� nauczy� walki ka�d� broni�. Od czego zaczniemy?
			CORD_APPROVED = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_02");	//Mog� ci� nauczy� walki mieczem jednor�cznym. Do dwur�cznego brakuje ci jeszcze umiej�tno�ci.
			b_cord_zeitverschwendung();
			CORD_APPROVED = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Je�li chodzi o miecz jednor�czny, to jeste� jeszcze cholernie zielony! Natomiast z mieczem dwur�cznym idzie ci znacznie lepiej.
			AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Je�li potrzebujesz szkolenia w zakresie walki broni� jednor�czn�, musisz znale�� innego nauczyciela.
			CORD_APPROVED = TRUE;
		}
		else
		{
			b_cord_zeitverschwendung();
			b_cord_bebetter();
		};
		if(CORD_APPROVED == TRUE)
		{
			Info_ClearChoices(dia_cord_teach);
			Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
			if((Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0) || (CORD_RANGERHELP_FIGHT == TRUE))
			{
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
			};
			if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (CORD_RANGERHELP_FIGHT == TRUE))
			{
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
			};
			CORD_MERKE_1H = other.hitchance[NPC_TALENT_1H];
			CORD_MERKE_2H = other.hitchance[NPC_TALENT_2H];
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//Trenuj� tylko najemnik�w albo bardziej do�wiadczonych wojownik�w!
	};
};

func void dia_cord_teach_back()
{
	if((CORD_MERKE_1H < other.hitchance[NPC_TALENT_1H]) || (CORD_MERKE_2H < other.hitchance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Ju� jeste� lepszy - tak trzyma�!
	};
	Info_ClearChoices(dia_cord_teach);
};

func void dia_cord_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};


instance DIA_CORD_PICKPOCKET(C_INFO)
{
	npc = sld_805_cord;
	nr = 900;
	condition = dia_cord_pickpocket_condition;
	information = dia_cord_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_cord_pickpocket_condition()
{
	return c_beklauen(65,75);
};

func void dia_cord_pickpocket_info()
{
	Info_ClearChoices(dia_cord_pickpocket);
	Info_AddChoice(dia_cord_pickpocket,DIALOG_BACK,dia_cord_pickpocket_back);
	Info_AddChoice(dia_cord_pickpocket,DIALOG_PICKPOCKET,dia_cord_pickpocket_doit);
};

func void dia_cord_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cord_pickpocket);
};

func void dia_cord_pickpocket_back()
{
	Info_ClearChoices(dia_cord_pickpocket);
};

