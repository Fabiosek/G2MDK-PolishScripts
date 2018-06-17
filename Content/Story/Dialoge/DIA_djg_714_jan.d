
instance DIA_JAN_EXIT(C_INFO)
{
	npc = djg_714_jan;
	nr = 999;
	condition = dia_jan_exit_condition;
	information = dia_jan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jan_exit_condition()
{
	return TRUE;
};

func void dia_jan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JAN_HELLO(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_hello_condition;
	information = dia_jan_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jan_hello_condition()
{
	if((KAPITEL >= 4) && Npc_IsInState(self,zs_talk) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_hello_info()
{
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//Przyj�cie tutaj by�o bardzo g�upim pomys�em.
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//My�la�em, �e co� tu zdob�d�. Ale w okolicy nie ma nic pr�cz paru aroganckich paladyn�w oraz ork�w.
};


instance DIA_JAN_DRAGONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragons_condition;
	information = dia_jan_dragons_info;
	permanent = FALSE;
	description = "Zapomnia�e� o smokach!";
};


func int dia_jan_dragons_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (MIS_JANBECOMESSMITH == FALSE) && (KAPITEL == 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_dragons_info()
{
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//Zapomnia�e� o smokach!
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//Jak m�g�bym zapomnie�. Powiem ci co�. Jestem kowalem, nie wojownikiem.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//Wyrabiam bro�. Walk� zostawiam innym.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//Wobec tego dlaczego nie stoisz za kowad�em?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//Paladyni nie wpuszcz� mnie do ku�ni. Nie mog� nic zrobi�, chyba �e chc� sko�czy� w lochu.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//Te� jeste� jednym z nich. Wi�c mo�e wstawisz si� za mn�?
	};
	Info_ClearChoices(dia_jan_dragons);
	Info_AddChoice(dia_jan_dragons,"Musz� rusza� w drog�.",dia_jan_dragons_shithappen);
	Info_AddChoice(dia_jan_dragons,"Co b�d� z tego mia�?",dia_jan_dragons_reward);
	Info_AddChoice(dia_jan_dragons,"Spr�buj� ci pom�c.",dia_jan_dragons_helpyou);
};

func void dia_jan_dragons_helpyou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//Spr�buj� ci pom�c.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//Jak tego dokonasz? Parcival rozkaza� nas pilnowa�.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//Nikt nie odwa�y si� tego zlekcewa�y�.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//Zrobi�, co w mojej mocy.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//Nie s�dz�, �eby zechcia� ci� wys�ucha�.
	Log_CreateTopic(TOPIC_JANBECOMESSMITH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JANBECOMESSMITH,LOG_RUNNING);
	b_logentry(TOPIC_JANBECOMESSMITH,"Jan, �owca smok�w z zamku w G�rniczej Dolinie, chce pracowa� w ku�ni, jednak Parcival mu tego zabrania.");
	MIS_JANBECOMESSMITH = LOG_RUNNING;
	Info_ClearChoices(dia_jan_dragons);
};

func void dia_jan_dragons_reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//Co b�d� mia� z tego, �e ci pomog�?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//Nic nie mam. Co najwy�ej b�d� m�g� ci� czego� nauczy�.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//Znam metod�, dzi�ki kt�rej ostrza z magicznej rudy s� jeszcze mocniejsze.
	};
	JAN_TEACHPLAYER = TRUE;
};

func void dia_jan_dragons_shithappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//Musz� rusza� w drog�.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//Wspaniale. Nie mog� opu�ci� teraz zamku ani nic wyku�.
	Info_ClearChoices(dia_jan_dragons);
};


instance DIA_JAN_HOME(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_home_condition;
	information = dia_jan_home_info;
	permanent = FALSE;
	description = "Sk�d pochodzisz?";
};


func int dia_jan_home_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (KAPITEL >= 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_home_info()
{
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//Sk�d pochodzisz?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//Do��czy�em do paru ludzi z g�r. Ruszyli�my do Doliny, aby zbi� fortun�, poluj�c na smoki.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//Ich przyw�dca zwa� si� Sylvio. Ch�opie, co to by� mu�! Traktowa� mnie, jakbym by� jego w�asno�ci�.
};


instance DIA_JAN_OLDCAMP(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_oldcamp_condition;
	information = dia_jan_oldcamp_info;
	permanent = TRUE;
	description = "Co si� wydarzy�o w zamku?";
};


func int dia_jan_oldcamp_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (KAPITEL == 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_oldcamp_info()
{
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//Co w og�le sta�o si� w zamku?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//Nic, o czym bym s�ysza�. Oczywi�cie martwi mnie to, co sta�o si� POZA zamkiem.
};


instance DIA_JAN_PARCIVAL(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_parcival_condition;
	information = dia_jan_parcival_info;
	permanent = FALSE;
	description = "Rozmawia�em z Parcivalem.";
};


func int dia_jan_parcival_condition()
{
	if((MIS_JANBECOMESSMITH != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_parcival_info()
{
	AI_Output(other,self,"DIA_Jan_Parcival_15_00");	//Rozmawia�em z Parcivalem.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//No i?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//Nie ufa nam, �owcom smok�w.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//Nie ufa wam, �owcom smok�w.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//Szlag by to trafi�. Ja chc� jedynie pracowa�.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//No to pozostaje mi si� podda�. Jedynie Garond m�g�by mi teraz pom�c.
};


instance DIA_JAN_JANISSMITH(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_janissmith_condition;
	information = dia_jan_janissmith_info;
	permanent = FALSE;
	description = "Id� po sw�j m�ot, jest dla ciebie robota.";
};


func int dia_jan_janissmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_janissmith_info()
{
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//Id� po sw�j m�ot, jest dla ciebie robota.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//Uda�o ci si�? Jak to zrobi�e�?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//Musia�em za ciebie por�czy�, wi�c lepiej mnie nie zawied�.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//Nie martw si�. Na pewno ci� nie zawiod�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SMITH");
};


instance DIA_JAN_SELLWEAPONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_sellweapons_condition;
	information = dia_jan_sellweapons_info;
	permanent = FALSE;
	description = "Sprzedajesz jak�� bro�?";
};


func int dia_jan_sellweapons_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (JAN_TEACHPLAYER == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_sellweapons_info()
{
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//Sprzedajesz jak�� bro�?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//Oczywi�cie, �e nie. Wtedy twoi koledzy wrzuciliby mnie do wi�zienia za nielegalny handel, co? Nie, zapomnij o tym.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//Robi�bym to, gdybym m�g�. Ale najpierw musz� dostarczy� bro� paladynom w zamku.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//Ale mog� ci pokaza�, jak samemu wyku� bro�.
	JAN_TEACHPLAYER = TRUE;
};


instance JAN_TRAINING_TALENTE(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = jan_training_talente_condition;
	information = jan_training_talente_info;
	permanent = TRUE;
	description = "Naucz mnie kowalstwa.";
};


func int jan_training_talente_condition()
{
	if((JAN_TEACHPLAYER == TRUE) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void jan_training_talente_info()
{
	AI_Output(other,self,"DIA_Jan_TeachPlayer_15_00");	//Naucz mnie kowalstwa.
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//Co konkretnie planujesz zrobi�?
	Info_ClearChoices(jan_training_talente);
	Info_AddChoice(jan_training_talente,DIALOG_BACK,jan_training_smith_back);
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		Info_AddChoice(jan_training_talente,b_buildlearnstring("Nauka kowalstwa",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_COMMON)),jan_training_smith_common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_01)),jan_training_smith_1hspecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_01)),jan_training_smith_2hspecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_02)),jan_training_smith_1hspecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_02)),jan_training_smith_2hspecial2);
		};
	};
};

func void jan_training_smith_back()
{
	Info_ClearChoices(jan_training_talente);
};

func void jan_training_smith_common()
{
	b_teachplayertalentsmith(self,other,WEAPON_COMMON);
};

func void jan_training_smith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void jan_training_smith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void jan_training_smith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void jan_training_smith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};


var int dia_jan_sellarmor_permanent;

instance DIA_JAN_SELLARMOR(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_sellarmor_condition;
	information = dia_jan_sellarmor_info;
	permanent = TRUE;
	description = "Mog� kupi� od ciebie jak�� zbroj�?";
};


func int dia_jan_sellarmor_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE) && (DIA_JAN_SELLARMOR_PERMANENT == FALSE))
	{
		return 1;
	};
};

func void dia_jan_sellarmor_info()
{
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//Mog� kupi� od ciebie jak�� zbroj�?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//Nie mam nic, co by�oby lepsze od twojej zbroi. Zapomnijmy o tym.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//Mag, kt�ry chce nosi� zbroj�? Zapomnij. Id� do krawca. Nie mog� zrobi� dla ciebie zbroi.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//Gdybym jak�� mia�, ch�tnie bym ci j� sprzeda�. Niestety, nie mam �adnej zbroi.
		Info_ClearChoices(dia_jan_sellarmor);
		Info_AddChoice(dia_jan_sellarmor,"No to chyba nic nie mo�na zrobi�.",dia_jan_sellarmor_sorry);
		Info_AddChoice(dia_jan_sellarmor,"Mo�e w takim razie zrobisz mi zbroj�?",dia_jan_sellarmor_buildone);
	};
};

func void dia_jan_sellarmor_sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//No to chyba nic nie mo�na zrobi�.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//Jak ju� co� b�dziesz mia�, to daj mi zna�.
	Info_ClearChoices(dia_jan_sellarmor);
};

func void dia_jan_sellarmor_buildone()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//Mo�e w takim razie zrobisz mi zbroj�?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//C�, je�li chcesz czego� lepszego, musisz mi dostarczy� odpowiednie materia�y.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//Czego potrzebujesz?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//Chcesz walczy� ze smokami, prawda? Przynie� mi kilka smoczych �usek. M�g�bym z nich co� dla ciebie zmajstrowa�.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//20 powinno wystarczy�.
	DIA_JAN_SELLARMOR_PERMANENT = TRUE;
	Info_ClearChoices(dia_jan_sellarmor);
};


var int jan_sells_armor;

instance DIA_JAN_DRAGONSCALES(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragonscales_condition;
	information = dia_jan_dragonscales_info;
	permanent = TRUE;
	description = "Mam te smocze �uski dla ciebie.";
};


func int dia_jan_dragonscales_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE) && (DIA_JAN_SELLARMOR_PERMANENT == TRUE) && (JAN_SELLS_ARMOR == FALSE) && (Npc_HasItems(other,itat_dragonscale) >= 1))
	{
		return 1;
	};
};


var int dia_jan_dragonscales_onetime;

func void dia_jan_dragonscales_info()
{
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//Mam te smocze �uski dla ciebie.
	if(Npc_HasItems(other,itat_dragonscale) >= 20)
	{
		b_giveinvitems(other,self,itat_dragonscale,20);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//Dobrze, da si� co� z tego zrobi�.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//Wr�� jutro. Ta cz�� powinna by� ju� gotowa.
		if(DIA_JAN_DRAGONSCALES_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_ADDON_JANSELLSARMOR);
			DIA_JAN_DRAGONSCALES_ONETIME = TRUE;
		};
		JAN_SELLS_ARMOR = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//Potrzebuj� 20 smoczych �usek. Inaczej nie b�d� w stanie zrobi� ci �adnej zbroi.
	};
};


var int djg_armor_is_offered;
var int dia_jan_armorready_noperm;

instance DIA_JAN_ARMORREADY(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_armorready_condition;
	information = dia_jan_armorready_info;
	permanent = TRUE;
	description = "Zbroja jest gotowa?";
};


func int dia_jan_armorready_condition()
{
	if((MIS_OCGATEOPEN == FALSE) && (JAN_SELLS_ARMOR != FALSE) && (DIA_JAN_ARMORREADY_NOPERM == FALSE))
	{
		return 1;
	};
};

func void dia_jan_armorready_info()
{
	AI_Output(other,self,"DIA_JAN_ArmorReady_15_00");	//Zbroja jest gotowa?
	if(JAN_SELLS_ARMOR == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//Nie, jeszcze nie. Przyjd� jutro.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//Tak, to prawdziwy majstersztyk. Mo�esz j� kupi�, je�li chcesz.
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_03");	//Dam ci specjaln� cen� - 12,000 sztuk z�ota.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//Co? Po tym wszystkim, co dla ciebie zrobi�em?
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//Musz� jako� zarobi� na �ycie. Bierzesz albo do widzenia.
		DJG_ARMOR_IS_OFFERED = TRUE;
		DIA_JAN_ARMORREADY_NOPERM = TRUE;
	};
};


var int jan_dia_jan_djg_armor_m_permanent;

instance DIA_JAN_DJG_ARMOR_M(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_djg_armor_m_condition;
	information = dia_jan_djg_armor_m_info;
	permanent = TRUE;
	description = "�redni pancerz �owcy smok�w. Ochrona (bro� i strza�y) 80, 12000 sztuk z�ota.";
};


func int dia_jan_djg_armor_m_condition()
{
	if((JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (DJG_ARMOR_IS_OFFERED == TRUE))
	{
		return TRUE;
	};
};

func void dia_jan_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//Chc� kupi� zbroj�.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//Sam widzisz, �e warta jest ka�dej sztuki z�ota.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//Nie masz do�� z�ota.
	};
};


instance DIA_JAN_DRAGONPLETTBERICHT(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonplettbericht_condition;
	information = dia_jan_dragonplettbericht_info;
	description = "Co do tych smok�w...";
};


var int dia_jan_dragonplettbericht_noperm;

func int dia_jan_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jan_dragons) && (DIA_JAN_DRAGONPLETTBERICHT_NOPERM == FALSE) && (MIS_OCGATEOPEN == FALSE) && (MIS_KILLEDDRAGONS != 0))
	{
		return TRUE;
	};
};

func void dia_jan_dragonplettbericht_info()
{
	if(MIS_KILLEDDRAGONS == 1)
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_00");	//Zabi�em smoka.
	}
	else if((MIS_KILLEDDRAGONS == 2) || (MIS_KILLEDDRAGONS == 3))
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//Zabi�em kilka smok�w.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//Zabi�em wszystkie smoki.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//No i co? Jeste� przecie� �owc� smok�w, prawda?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//A czy ty r�wnie� nim nie jeste�?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//To �adnie. Ale szczerze powiedziawszy, niewiele mnie to interesuje.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//Ju� ci powiedzia�em, �e wol� robi� bro�, ni� bra� udzia� w polowaniu na smoki.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//Jest jednak pewna rzecz, kt�ra by mnie interesowa�a.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//Gdyby� przyni�s� mi troch� smoczej krwi, zap�aci�bym ci za ni� niez�� sumk�.
		JAN_WANTSDRAGONBLOOD = TRUE;
	};
};


instance DIA_JAN_DRAGONBLOOD(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonblood_condition;
	information = dia_jan_dragonblood_info;
	permanent = TRUE;
	description = "Mam dla ciebie troch� smoczej krwi.";
};


func int dia_jan_dragonblood_condition()
{
	if((JAN_WANTSDRAGONBLOOD == TRUE) && (MIS_OCGATEOPEN == FALSE) && Npc_HasItems(other,itat_dragonblood) && ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD)))
	{
		return TRUE;
	};
};

func void dia_jan_dragonblood_info()
{
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//Mam dla ciebie troch� smoczej krwi.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//�wietnie. Sprzedaj mi wszystko, co masz.
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(wszystko)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(jedna buteleczka)",dia_jan_dragonblood_1);
	};
};

func void dia_jan_dragonblood_back()
{
	Info_ClearChoices(dia_jan_dragonblood);
};

func void dia_jan_dragonblood_1()
{
	var int dragonbloodcount;
	var int dragonbloodgeld;
	var int xp_djg_bringdragonbloods;
	var string bloodtext;
	var string bloodleft;
	dragonbloodcount = 1;
	b_giveinvitems(other,self,itat_dragonblood,dragonbloodcount);
	xp_djg_bringdragonbloods = dragonbloodcount * XP_AMBIENTKAP4;
	b_giveplayerxp(xp_djg_bringdragonbloods);
	dragonbloodgeld = dragonbloodcount * VALUE_DRAGONBLOOD;
	CreateInvItems(self,itmi_gold,dragonbloodgeld);
	b_giveinvitems(self,other,itmi_gold,dragonbloodgeld);
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(wszystko)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(jedna buteleczka)",dia_jan_dragonblood_1);
	};
	bloodleft = IntToString(Npc_HasItems(other,itat_dragonblood));
	bloodtext = ConcatStrings(bloodleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(bloodtext,-1,-1,FONT_SCREENSMALL,2);
};

func void dia_jan_dragonblood_all()
{
	var int dragonbloodcount;
	var int dragonbloodgeld;
	var int xp_djg_bringdragonbloods;
	var string bloodtext;
	var string bloodleft;
	dragonbloodcount = Npc_HasItems(other,itat_dragonblood);
	b_giveinvitems(other,self,itat_dragonblood,dragonbloodcount);
	xp_djg_bringdragonbloods = dragonbloodcount * XP_AMBIENTKAP4;
	b_giveplayerxp(xp_djg_bringdragonbloods);
	dragonbloodgeld = dragonbloodcount * VALUE_DRAGONBLOOD;
	CreateInvItems(self,itmi_gold,dragonbloodgeld);
	b_giveinvitems(self,other,itmi_gold,dragonbloodgeld);
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(wszystko)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(jedna buteleczka)",dia_jan_dragonblood_1);
	};
	bloodleft = IntToString(Npc_HasItems(other,itat_dragonblood));
	bloodtext = ConcatStrings(bloodleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(bloodtext,-1,-1,FONT_SCREENSMALL,2);
};


instance DIA_JAN_NACHOCGATEOPEN(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_nachocgateopen_condition;
	information = dia_jan_nachocgateopen_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int dia_jan_nachocgateopen_condition()
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_jan_nachocgateopen_info()
{
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//Absolutnie nic nie jest w porz�dku!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//Idioci! Dlaczego otworzyli�cie bram�? Zawsze wiedzia�em, �e paladynom brakuje pi�tej klepki!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//Tak po prostu otwieraj� sobie bram�. T�paki! W g�owie mi si� to nie mie�ci.
	};
	AI_StopProcessInfos(self);
};


instance DIA_JAN_PICKPOCKET(C_INFO)
{
	npc = djg_714_jan;
	nr = 900;
	condition = dia_jan_pickpocket_condition;
	information = dia_jan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jan_pickpocket_condition()
{
	return c_beklauen(37,95);
};

func void dia_jan_pickpocket_info()
{
	Info_ClearChoices(dia_jan_pickpocket);
	Info_AddChoice(dia_jan_pickpocket,DIALOG_BACK,dia_jan_pickpocket_back);
	Info_AddChoice(dia_jan_pickpocket,DIALOG_PICKPOCKET,dia_jan_pickpocket_doit);
};

func void dia_jan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jan_pickpocket);
};

func void dia_jan_pickpocket_back()
{
	Info_ClearChoices(dia_jan_pickpocket);
};

