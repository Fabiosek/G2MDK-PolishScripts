
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
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//Przyjœcie tutaj by³o bardzo g³upim pomys³em.
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//Myœla³em, ¿e coœ tu zdobêdê. Ale w okolicy nie ma nic prócz paru aroganckich paladynów oraz orków.
};


instance DIA_JAN_DRAGONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragons_condition;
	information = dia_jan_dragons_info;
	permanent = FALSE;
	description = "Zapomnia³eœ o smokach!";
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
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//Zapomnia³eœ o smokach!
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//Jak móg³bym zapomnieæ. Powiem ci coœ. Jestem kowalem, nie wojownikiem.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//Wyrabiam broñ. Walkê zostawiam innym.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//Wobec tego dlaczego nie stoisz za kowad³em?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//Paladyni nie wpuszcz¹ mnie do kuŸni. Nie mogê nic zrobiæ, chyba ¿e chcê skoñczyæ w lochu.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//Te¿ jesteœ jednym z nich. Wiêc mo¿e wstawisz siê za mn¹?
	};
	Info_ClearChoices(dia_jan_dragons);
	Info_AddChoice(dia_jan_dragons,"Muszê ruszaæ w drogê.",dia_jan_dragons_shithappen);
	Info_AddChoice(dia_jan_dragons,"Co bêdê z tego mia³?",dia_jan_dragons_reward);
	Info_AddChoice(dia_jan_dragons,"Spróbujê ci pomóc.",dia_jan_dragons_helpyou);
};

func void dia_jan_dragons_helpyou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//Spróbujê ci pomóc.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//Jak tego dokonasz? Parcival rozkaza³ nas pilnowaæ.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//Nikt nie odwa¿y siê tego zlekcewa¿yæ.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//Zrobiê, co w mojej mocy.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//Nie s¹dzê, ¿eby zechcia³ ciê wys³uchaæ.
	Log_CreateTopic(TOPIC_JANBECOMESSMITH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JANBECOMESSMITH,LOG_RUNNING);
	b_logentry(TOPIC_JANBECOMESSMITH,"Jan, ³owca smoków z zamku w Górniczej Dolinie, chce pracowaæ w kuŸni, jednak Parcival mu tego zabrania.");
	MIS_JANBECOMESSMITH = LOG_RUNNING;
	Info_ClearChoices(dia_jan_dragons);
};

func void dia_jan_dragons_reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//Co bêdê mia³ z tego, ¿e ci pomogê?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//Nic nie mam. Co najwy¿ej bêdê móg³ ciê czegoœ nauczyæ.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//Znam metodê, dziêki której ostrza z magicznej rudy s¹ jeszcze mocniejsze.
	};
	JAN_TEACHPLAYER = TRUE;
};

func void dia_jan_dragons_shithappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//Muszê ruszaæ w drogê.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//Wspaniale. Nie mogê opuœciæ teraz zamku ani nic wykuæ.
	Info_ClearChoices(dia_jan_dragons);
};


instance DIA_JAN_HOME(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_home_condition;
	information = dia_jan_home_info;
	permanent = FALSE;
	description = "Sk¹d pochodzisz?";
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
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//Sk¹d pochodzisz?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//Do³¹czy³em do paru ludzi z gór. Ruszyliœmy do Doliny, aby zbiæ fortunê, poluj¹c na smoki.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//Ich przywódca zwa³ siê Sylvio. Ch³opie, co to by³ mu³! Traktowa³ mnie, jakbym by³ jego w³asnoœci¹.
};


instance DIA_JAN_OLDCAMP(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_oldcamp_condition;
	information = dia_jan_oldcamp_info;
	permanent = TRUE;
	description = "Co siê wydarzy³o w zamku?";
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
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//Co w ogóle sta³o siê w zamku?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//Nic, o czym bym s³ysza³. Oczywiœcie martwi mnie to, co sta³o siê POZA zamkiem.
};


instance DIA_JAN_PARCIVAL(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_parcival_condition;
	information = dia_jan_parcival_info;
	permanent = FALSE;
	description = "Rozmawia³em z Parcivalem.";
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
	AI_Output(other,self,"DIA_Jan_Parcival_15_00");	//Rozmawia³em z Parcivalem.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//No i?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//Nie ufa nam, ³owcom smoków.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//Nie ufa wam, ³owcom smoków.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//Szlag by to trafi³. Ja chcê jedynie pracowaæ.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//No to pozostaje mi siê poddaæ. Jedynie Garond móg³by mi teraz pomóc.
};


instance DIA_JAN_JANISSMITH(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_janissmith_condition;
	information = dia_jan_janissmith_info;
	permanent = FALSE;
	description = "IdŸ po swój m³ot, jest dla ciebie robota.";
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
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//IdŸ po swój m³ot, jest dla ciebie robota.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//Uda³o ci siê? Jak to zrobi³eœ?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//Musia³em za ciebie porêczyæ, wiêc lepiej mnie nie zawiedŸ.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//Nie martw siê. Na pewno ciê nie zawiodê.
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
	description = "Sprzedajesz jak¹œ broñ?";
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
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//Sprzedajesz jak¹œ broñ?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//Oczywiœcie, ¿e nie. Wtedy twoi koledzy wrzuciliby mnie do wiêzienia za nielegalny handel, co? Nie, zapomnij o tym.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//Robi³bym to, gdybym móg³. Ale najpierw muszê dostarczyæ broñ paladynom w zamku.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//Ale mogê ci pokazaæ, jak samemu wykuæ broñ.
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
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//Co konkretnie planujesz zrobiæ?
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
	description = "Mogê kupiæ od ciebie jak¹œ zbrojê?";
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
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//Mogê kupiæ od ciebie jak¹œ zbrojê?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//Nie mam nic, co by³oby lepsze od twojej zbroi. Zapomnijmy o tym.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//Mag, który chce nosiæ zbrojê? Zapomnij. IdŸ do krawca. Nie mogê zrobiæ dla ciebie zbroi.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//Gdybym jak¹œ mia³, chêtnie bym ci j¹ sprzeda³. Niestety, nie mam ¿adnej zbroi.
		Info_ClearChoices(dia_jan_sellarmor);
		Info_AddChoice(dia_jan_sellarmor,"No to chyba nic nie mo¿na zrobiæ.",dia_jan_sellarmor_sorry);
		Info_AddChoice(dia_jan_sellarmor,"Mo¿e w takim razie zrobisz mi zbrojê?",dia_jan_sellarmor_buildone);
	};
};

func void dia_jan_sellarmor_sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//No to chyba nic nie mo¿na zrobiæ.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//Jak ju¿ coœ bêdziesz mia³, to daj mi znaæ.
	Info_ClearChoices(dia_jan_sellarmor);
};

func void dia_jan_sellarmor_buildone()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//Mo¿e w takim razie zrobisz mi zbrojê?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//Có¿, jeœli chcesz czegoœ lepszego, musisz mi dostarczyæ odpowiednie materia³y.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//Czego potrzebujesz?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//Chcesz walczyæ ze smokami, prawda? Przynieœ mi kilka smoczych ³usek. Móg³bym z nich coœ dla ciebie zmajstrowaæ.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//20 powinno wystarczyæ.
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
	description = "Mam te smocze ³uski dla ciebie.";
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
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//Mam te smocze ³uski dla ciebie.
	if(Npc_HasItems(other,itat_dragonscale) >= 20)
	{
		b_giveinvitems(other,self,itat_dragonscale,20);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//Dobrze, da siê coœ z tego zrobiæ.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//Wróæ jutro. Ta czêœæ powinna byæ ju¿ gotowa.
		if(DIA_JAN_DRAGONSCALES_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_ADDON_JANSELLSARMOR);
			DIA_JAN_DRAGONSCALES_ONETIME = TRUE;
		};
		JAN_SELLS_ARMOR = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//Potrzebujê 20 smoczych ³usek. Inaczej nie bêdê w stanie zrobiæ ci ¿adnej zbroi.
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
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//Nie, jeszcze nie. PrzyjdŸ jutro.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//Tak, to prawdziwy majstersztyk. Mo¿esz j¹ kupiæ, jeœli chcesz.
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_03");	//Dam ci specjaln¹ cenê - 12,000 sztuk z³ota.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//Co? Po tym wszystkim, co dla ciebie zrobi³em?
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//Muszê jakoœ zarobiæ na ¿ycie. Bierzesz albo do widzenia.
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
	description = "Œredni pancerz ³owcy smoków. Ochrona (broñ i strza³y) 80, 12000 sztuk z³ota.";
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
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//Chcê kupiæ zbrojê.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//Sam widzisz, ¿e warta jest ka¿dej sztuki z³ota.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//Nie masz doœæ z³ota.
	};
};


instance DIA_JAN_DRAGONPLETTBERICHT(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonplettbericht_condition;
	information = dia_jan_dragonplettbericht_info;
	description = "Co do tych smoków...";
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
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_00");	//Zabi³em smoka.
	}
	else if((MIS_KILLEDDRAGONS == 2) || (MIS_KILLEDDRAGONS == 3))
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//Zabi³em kilka smoków.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//Zabi³em wszystkie smoki.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//No i co? Jesteœ przecie¿ ³owc¹ smoków, prawda?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//A czy ty równie¿ nim nie jesteœ?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//To ³adnie. Ale szczerze powiedziawszy, niewiele mnie to interesuje.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//Ju¿ ci powiedzia³em, ¿e wolê robiæ broñ, ni¿ braæ udzia³ w polowaniu na smoki.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//Jest jednak pewna rzecz, która by mnie interesowa³a.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//Gdybyœ przyniós³ mi trochê smoczej krwi, zap³aci³bym ci za ni¹ niez³¹ sumkê.
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
	description = "Mam dla ciebie trochê smoczej krwi.";
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
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//Mam dla ciebie trochê smoczej krwi.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//Œwietnie. Sprzedaj mi wszystko, co masz.
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
	description = "Wszystko w porz¹dku?";
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
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//Absolutnie nic nie jest w porz¹dku!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//Idioci! Dlaczego otworzyliœcie bramê? Zawsze wiedzia³em, ¿e paladynom brakuje pi¹tej klepki!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//Tak po prostu otwieraj¹ sobie bramê. Têpaki! W g³owie mi siê to nie mieœci.
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

