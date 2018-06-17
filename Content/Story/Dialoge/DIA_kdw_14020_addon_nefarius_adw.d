
instance DIA_ADDON_NEFARIUS_ADW_EXIT(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 999;
	condition = dia_addon_nefarius_adw_exit_condition;
	information = dia_addon_nefarius_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_nefarius_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_NEFARIUS_ADWHELLO(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 5;
	condition = dia_addon_nefarius_adwhello_condition;
	information = dia_addon_nefarius_adwhello_info;
	important = TRUE;
};


func int dia_addon_nefarius_adwhello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_adwhello_info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_00");	//Cieszy mnie, �e dotar�e� tu bezpiecznie.
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_01");	//Jak to si� sta�o, �e przyby�e� tu przede mn�?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_02");	//Podr�owali�my przez dziwny wymiar. Kto wie, w jak� odnog� zboczy�e�.
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_03");	//No i? Czy b�d� m�g� jeszcze skorzysta� z portalu?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_04");	//Dotarli�my dok�adnie na miejsce. Najwyra�niej dzia�a bardzo dobrze.
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_05");	//Poinformuj� ci�, je�li b�d� podejrzewa�, �e mo�e by� inaczej.
};


instance DIA_ADDON_NEFARIUS_NEUES(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 5;
	condition = dia_addon_nefarius_neues_condition;
	information = dia_addon_nefarius_neues_info;
	description = "Co robi�e� do tej pory?";
};


func int dia_addon_nefarius_neues_condition()
{
	if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_neues_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_15_00");	//Co robi�e� do tej pory?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_01");	//Badam histori� budowniczych i pr�buj� zrozumie�, dlaczego zamkn�li portal.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_02");	//Wygl�da na to, �e usi�owali ukry� miasto przed reszt� �wiata.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_03");	//Wiele lat temu dzia�y si� tu straszne rzeczy. Zostali op�tani przez jak�� potworn� moc.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_04");	//Je�li wierzy� ich zapiskom, przed zag�ad� miasta mia�a tu miejsce straszna wojna domowa.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_05");	//Drogi stan�y w p�omieniach, a w ko�cu niszcz�ca pow�d� przypiecz�towa�a los budowniczych.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_06");	//Ci, kt�rym uda�o si� prze�y� to piek�o, odci�li t� cz�� wyspy w nadziei, �e uda im si� powstrzyma� chaos.
	Info_ClearChoices(dia_addon_nefarius_neues);
	Info_AddChoice(dia_addon_nefarius_neues,"Jak my�lisz, co tu znajdziemy?",dia_addon_nefarius_neues_find);
	Info_AddChoice(dia_addon_nefarius_neues,"A my, g�upcy, ponownie otworzyli�my portal.",dia_addon_nefarius_neues_auf);
	Info_AddChoice(dia_addon_nefarius_neues,"Czemu budowniczowie oszaleli?",dia_addon_nefarius_neues_was);
	Info_AddChoice(dia_addon_nefarius_neues,"Powiedzia�e�, �e nadesz�a pow�d�?",dia_addon_nefarius_neues_flut);
};

func void dia_addon_nefarius_neues_find()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_find_15_00");	//Jak my�lisz, co tu znajdziemy?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_01");	//Mog� si� tylko domy�la�. Lepiej porozmawiaj z Saturasem.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_02");	//On ma jaki� pomys�.
	Log_CreateTopic(TOPIC_ADDON_FLUT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FLUT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FLUT,"Nefarius uwa�a, �e powinienem porozmawia� z Saturasem o zaginionym mie�cie.");
	NEFARIUSADW_TALK2SATURAS = TRUE;
};

func void dia_addon_nefarius_neues_flut()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_flut_15_00");	//Powiedzia�e�, �e nadesz�a pow�d�?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_01");	//Pojawi� si� przed nimi sam Adanos, chc�c po�o�y� kres ich szale�stwu.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_02");	//Zr�wna� miasto z ziemi�.
};

func void dia_addon_nefarius_neues_was()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_was_15_00");	//Czemu budowniczowie oszaleli?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_01");	//Jeden spo�r�d nich odda� si� z�u. By� to wielki dow�dca o imieniu Quarhodron.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_02");	//Powr�ciwszy do domu po zwyci�skiej bitwie za murami miasta, przywi�d� ze sob� samo z�o.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_03");	//Wszyscy jego towarzysze w kr�tkim czasie popadli w szale�stwo i zacz�li walczy� ze zwyk�ymi lud�mi.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_04");	//Rozpocz�a si� wojna domowa i wszystko zosta�o zniszczone.
};

func void dia_addon_nefarius_neues_auf()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_auf_15_00");	//A my, g�upcy, ponownie otworzyli�my portal.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_01");	//Mnie si� to te� nie podoba.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_02");	//Ale jaki mieli�my wyb�r?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_03");	//Je�li nie powstrzymamy tego, co tu si� dzieje, Khorinis mo�e spotka� ten sam los, kt�ry dotkn�� mieszka�c�w tego pradawnego miasta.
};


instance DIA_ADDON_NEFARIUS_PERMADW(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 10;
	condition = dia_addon_nefarius_permadw_condition;
	information = dia_addon_nefarius_permadw_info;
	permanent = TRUE;
	description = "Podr� przez portal jest bezpieczna?";
};


func int dia_addon_nefarius_permadw_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_permadw_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PermADW_15_00");	//Podr� przez portal jest bezpieczna?
	AI_Output(self,other,"DIA_Addon_Nefarius_PermADW_05_01");	//Jak na razie nie mam co do tego w�tpliwo�ci.
};


instance DIA_ADDON_NEFARIUS_PRETEACH(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 99;
	condition = dia_addon_nefarius_preteach_condition;
	information = dia_addon_nefarius_preteach_info;
	description = "M�g�by� mi przekaza� sw� wiedz� na temat magii?";
};


func int dia_addon_nefarius_preteach_condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PreTeach_15_00");	//M�g�by� mi przekaza� sw� wiedz� na temat magii?
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_01");	//Mog� nauczy� ci� tworzenia run, a Cronos sprzeda ci instrukcje.
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_02");	//Zawsze nosi przy sobie ksi�gi o runach.
	NEFARIUS_ADDON_TEACHRUNES = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_NEFARIUSTEACH);
};


instance DIA_ADDON_NEFARIUS_ADW_RUNEN(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 99;
	condition = dia_addon_nefarius_adw_runen_condition;
	information = dia_addon_nefarius_adw_runen_info;
	permanent = TRUE;
	description = "Naucz mnie (tworzenia run)";
};


func int dia_addon_nefarius_adw_runen_condition()
{
	if(NEFARIUS_ADDON_TEACHRUNES == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_adw_runen_info()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"6. kr�gu magii",dia_addon_nefarius_adw_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"5. kr�gu magii",dia_addon_nefarius_adw_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"4. kr�gu magii",dia_addon_nefarius_adw_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"3. kr�gu magii",dia_addon_nefarius_adw_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"2. kr�gu magii",dia_addon_nefarius_adw_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"1. kr�gu magii",dia_addon_nefarius_adw_runen_1);
	};
};

func void dia_addon_nefarius_adw_runen_back()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
};

func void dia_addon_nefarius_adw_runen_1()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOBLINSKELETON)),dia_addon_nefarius_adw_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTHEAL)),dia_addon_nefarius_adw_runen_circle_1_spl_lightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_ZAP] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ZAP)),dia_addon_nefarius_adw_runen_circle_1_spl_zap);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_FIREBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIREBOLT)),dia_addon_nefarius_adw_runen_circle_1_spl_firebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHT)),dia_addon_nefarius_adw_runen_circle_1_spl_light);
	};
};

func void dia_addon_nefarius_adw_runen_2()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_addon_nefarius_adw_runen_circle_2_spl_instantfireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_addon_nefarius_adw_runen_circle_2_spl_icebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONWOLF)),dia_addon_nefarius_adw_runen_circle_2_spl_summonwolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_addon_nefarius_adw_runen_circle_2_spl_windfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SLEEP)),dia_addon_nefarius_adw_runen_circle_2_spl_sleep);
	};
	if(PLAYER_TALENT_RUNES[SPL_WHIRLWIND] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_WHIRLWIND,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WHIRLWIND)),dia_addon_nefarius_adw_runen_circle_2_spl_whirlwind);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICELANCE] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ICELANCE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICELANCE)),dia_addon_nefarius_adw_runen_circle_2_spl_icelance);
	};
};

func void dia_addon_nefarius_adw_runen_3()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MEDIUMHEAL)),dia_addon_nefarius_adw_runen_circle_3_spl_mediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_CHARGEZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEZAP)),dia_addon_nefarius_adw_runen_circle_3_spl_thunderball);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRESTORM)),dia_addon_nefarius_adw_runen_circle_3_spl_firestorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONSKELETON)),dia_addon_nefarius_adw_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FEAR)),dia_addon_nefarius_adw_runen_circle_3_spl_fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICECUBE] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ICECUBE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICECUBE)),dia_addon_nefarius_adw_runen_circle_3_spl_icecube);
	};
	if(PLAYER_TALENT_RUNES[SPL_THUNDERSTORM] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_THUNDERSTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_THUNDERSTORM)),dia_addon_nefarius_adw_runen_circle_3_spl_thunderstorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_GEYSER] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_GEYSER,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_GEYSER)),dia_addon_nefarius_adw_runen_circle_3_spl_geyser);
	};
};

func void dia_addon_nefarius_adw_runen_4()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),dia_addon_nefarius_adw_runen_circle_4_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),dia_addon_nefarius_adw_runen_circle_4_spl_destroyundead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTNINGFLASH)),dia_addon_nefarius_adw_runen_circle_4_spl_lightningflash);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),dia_addon_nefarius_adw_runen_circle_4_spl_chargefireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_WATERFIST] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_WATERFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WATERFIST)),dia_addon_nefarius_adw_runen_circle_4_spl_waterfist);
	};
};

func void dia_addon_nefarius_adw_runen_5()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEWAVE)),dia_addon_nefarius_adw_runen_circle_5_spl_icewave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),dia_addon_nefarius_adw_runen_circle_5_spl_summondemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),dia_addon_nefarius_adw_runen_circle_5_spl_fullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),dia_addon_nefarius_adw_runen_circle_5_spl_pyrokinesis);
	};
};

func void dia_addon_nefarius_adw_runen_6()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_addon_nefarius_adw_runen_circle_6_spl_firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_BREATHOFDEATH)),dia_addon_nefarius_adw_runen_circle_6_spl_breathofdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MASSDEATH)),dia_addon_nefarius_adw_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),dia_addon_nefarius_adw_runen_circle_6_spl_armyofdarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SHRINK)),dia_addon_nefarius_adw_runen_circle_6_spl_shrink);
	};
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_firebolt()
{
	b_teachplayertalentrunes(self,other,SPL_FIREBOLT);
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_zap()
{
	b_teachplayertalentrunes(self,other,SPL_ZAP);
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_lightheal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_summongoblinskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_whirlwind()
{
	b_teachplayertalentrunes(self,other,SPL_WHIRLWIND);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_icelance()
{
	b_teachplayertalentrunes(self,other,SPL_ICELANCE);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_icebolt()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_summonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_thunderstorm()
{
	b_teachplayertalentrunes(self,other,SPL_THUNDERSTORM);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_geyser()
{
	b_teachplayertalentrunes(self,other,SPL_GEYSER);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_icecube()
{
	b_teachplayertalentrunes(self,other,SPL_ICECUBE);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_thunderball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEZAP);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_waterfist()
{
	b_teachplayertalentrunes(self,other,SPL_WATERFIST);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};

