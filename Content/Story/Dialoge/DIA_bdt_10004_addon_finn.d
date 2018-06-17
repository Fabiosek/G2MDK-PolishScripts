
instance DIA_ADDON_FINN_EXIT(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 999;
	condition = dia_addon_finn_exit_condition;
	information = dia_addon_finn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_finn_exit_condition()
{
	return TRUE;
};

func void dia_addon_finn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FINN_PICKPOCKET(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 900;
	condition = dia_addon_finn_pickpocket_condition;
	information = dia_addon_finn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_finn_pickpocket_condition()
{
	return c_beklauen(35,50);
};

func void dia_addon_finn_pickpocket_info()
{
	Info_ClearChoices(dia_addon_finn_pickpocket);
	Info_AddChoice(dia_addon_finn_pickpocket,DIALOG_BACK,dia_addon_finn_pickpocket_back);
	Info_AddChoice(dia_addon_finn_pickpocket,DIALOG_PICKPOCKET,dia_addon_finn_pickpocket_doit);
};

func void dia_addon_finn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_finn_pickpocket);
};

func void dia_addon_finn_pickpocket_back()
{
	Info_ClearChoices(dia_addon_finn_pickpocket);
};


instance DIA_ADDON_FINN_HACKER(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 9;
	condition = dia_addon_finn_hacker_condition;
	information = dia_addon_finn_hacker_info;
	permanent = TRUE;
	description = "Znowu w pracy?";
};


func int dia_addon_finn_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_finn_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hacker_15_00");	//Znowu w pracy?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hacker_07_01");	//Tak, mam zamiar zdobyæ ostatni kawa³ek z³ota z tej kopalni.
};


instance DIA_ADDON_FINN_HI(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 1;
	condition = dia_addon_finn_hi_condition;
	information = dia_addon_finn_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_finn_hi_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_finn_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hi_15_00");	//Czeœæ.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hi_07_01");	//Czego chcesz?
};


instance DIA_ADDON_FINN_HACKE(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 2;
	condition = dia_addon_finn_hacke_condition;
	information = dia_addon_finn_hacke_info;
	permanent = FALSE;
	description = "Gdzie dostanê kilof?";
};


func int dia_addon_finn_hacke_condition()
{
	return TRUE;
};

func void dia_addon_finn_hacke_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Hacke_15_00");	//Gdzie dostanê kilof?
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_01");	//IdŸ do Huno, kowala. Ale posiadanie kilofa wcale nie otworzy ci drogi do kopalni.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_02");	//Jeœli chcesz wejœæ, musisz najpierw porozmawiaæ z Estebanem.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_03");	//Do Thorusa mo¿esz nawet nie iœæ - jeœli nie masz czerwonego kamienia, to ciê nie wpuœci.
};


instance DIA_ADDON_FINN_ESTEBAN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 3;
	condition = dia_addon_finn_esteban_condition;
	information = dia_addon_finn_esteban_info;
	permanent = FALSE;
	description = "Co myœlisz o Estebanie?";
};


func int dia_addon_finn_esteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_hacke))
	{
		return TRUE;
	};
};

func void dia_addon_finn_esteban_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Esteban_15_00");	//Co myœlisz o Estebanie?
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_01");	//On tu jest szefem... Myœlê, ¿e jest w porz¹dku.
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_02");	//Porz¹dnych ch³opaków zawsze wpuszcza do kopalni. To znaczy takich, którzy maj¹ pojêcie o górnictwie.
};


instance DIA_ADDON_FINN_PROFI(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 4;
	condition = dia_addon_finn_profi_condition;
	information = dia_addon_finn_profi_info;
	permanent = FALSE;
	description = "Znasz siê na górnictwie?";
};


func int dia_addon_finn_profi_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_finn_profi_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Profi_15_00");	//Znasz siê na górnictwie?
	AI_Output(self,other,"DIA_Addon_Finn_Profi_07_01");	//Jestem najlepszy!
};


instance DIA_ADDON_BDT_10004_FINN_MINE(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 5;
	condition = dia_addon_finn_mine_condition;
	information = dia_addon_finn_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_finn_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_finn_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_00");	//W porz¹dku, szefie. Chcesz, ¿eby w kopalni pracowali najlepsi? Czyli znowu wkraczam do akcji.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_01");	//I jeszcze jedno: zdradzê ci sekret Kopaczy.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_02");	//Czas po³upaæ nieco g³azów.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_03");	//Jak uderzy³eœ ju¿ kilka razy, ale nic nie odkopa³eœ, to przeci¹gnij ostrzem kilofa po skale.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_04");	//Przy odrobinie szczêœcia zdobêdziesz sporo kawa³ków.
	b_upgrade_hero_hackchance(10);
	KNOWS_TRUEMMERSCHLAG = TRUE;
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_FINN_GOLD(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 6;
	condition = dia_addon_finn_gold_condition;
	information = dia_addon_finn_gold_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_finn_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_profi))
	{
		return TRUE;
	};
};

func void dia_addon_finn_gold_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_00");	//Trzeba wiedzieæ kilka rzeczy. Z³oto to nie ruda. To piekielnie du¿a ró¿nica.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_01");	//Jaka kobieta nosi³aby na szyi ³añcuch wykonany z rudy?
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_02");	//Zacznij kopaæ od góry do do³u. Tym sposobem naj³atwiej odkopaæ samorodki.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_03");	//Niektórzy kopacze robi¹ odwrotnie, ale to o wiele trudniejsze.
	b_upgrade_hero_hackchance(10);
};


instance DIA_ADDON_FINN_EIN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 7;
	condition = dia_addon_finn_ein_condition;
	information = dia_addon_finn_ein_info;
	permanent = TRUE;
	description = "Potrafisz oceniæ moje umiejêtnoœci kopania z³ota?";
};


func int dia_addon_finn_ein_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_profi))
	{
		return TRUE;
	};
};


var int finn_einmal;
var int finn_gratulation;

func void dia_addon_finn_ein_info()
{
	var string concattext;
	AI_Output(other,self,"DIA_Addon_Finn_ein_15_00");	//Potrafisz oceniæ moje umiejêtnoœci kopania z³ota?
	if(FINN_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_01");	//Pewnie. Robiê tu ju¿ od ponad 35 lat. Wszystko poznam!
		FINN_EINMAL = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Finn_ein_07_02");	//Powiedzia³bym, ¿e jesteœ...
	if(HERO_HACKCHANCE < 20)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_03");	//nieopierzonym ¿ó³todziobem.
	}
	else if(HERO_HACKCHANCE < 40)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_04");	//przeciêtnym kopaczem.
	}
	else if(HERO_HACKCHANCE < 55)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_05");	//doœwiadczonym kopaczem.
	}
	else if(HERO_HACKCHANCE < 75)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_06");	//urodzonym kopaczem.
	}
	else if(HERO_HACKCHANCE < 90)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_07");	//piekielnie dobrym kopaczem.
	}
	else if(HERO_HACKCHANCE < 98)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_08");	//mistrzem kopania.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_09");	//guru kopaczy.
		if(FINN_GRATULATION == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Finn_ein_07_10");	//Teraz jesteœ tak dobry, jak ja. Gratulujê, partnerze!
			b_giveplayerxp(XP_AMBIENT * 2);
			Snd_Play("LevelUP");
			FINN_GRATULATION = TRUE;
		};
	};
	concattext = ConcatStrings("Kopanie z³ota: ",IntToString(HERO_HACKCHANCE));
	concattext = ConcatStrings(concattext," procent");
	PrintScreen(concattext,-1,-1,FONT_SCREENSMALL,2);
};


instance DIA_ADDON_FINN_ATTENTAT(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 8;
	condition = dia_addon_finn_attentat_condition;
	information = dia_addon_finn_attentat_info;
	permanent = FALSE;
	description = "A co do próby zabójstwa Estebana...";
};


func int dia_addon_finn_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_finn_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_00");	//Tak?
	AI_Output(other,self,"DIA_Addon_Finn_Attentat_15_01");	//Wiesz, kto stoi za tym wszystkim?
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_02");	//Dlaczego chcesz to wiedzieæ?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"Chcê porozmawiaæ z tym goœciem.",dia_addon_finn_attentat_wannatalk);
	Info_AddChoice(dia_addon_finn_attentat,"Esteban chce go widzieæ martwym!",dia_addon_finn_attentat_fortheboss);
};

func void b_addon_finn_tellall()
{
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_00");	//Po próbie zabójstwa chcia³em odebraæ swój kilof od kowala Huno.
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_01");	//Nie by³o go tam jednak.
	AI_Output(other,self,"DIA_Addon_Finn_TellAll_15_02");	//No i?
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_03");	//On ZAWSZE tam jest. Wed³ug mnie to DOŒÆ podejrzane.
	FINN_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Finn mówi, ¿e Huno by³ nieobecny w czasie próby zabójstwa.");
};

func void dia_addon_finn_attentat_fortheboss()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForTheBoss_15_00");	//Esteban chce go widzieæ martwym!
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_01");	//Och! Pracujesz dla szefa?
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_02");	//W takim razie powiem ci, co wiem.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_attentat);
};

func void dia_addon_finn_attentat_wannatalk()
{
	AI_Output(other,self,"DIA_Addon_Finn_WannaTalk_15_00");	//Chcê porozmawiaæ z tym goœciem.
	AI_Output(self,other,"DIA_Addon_Finn_WannaTalk_07_01");	//A czego od niego chcesz?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"To nie twoja sprawa!",dia_addon_finn_attentat_forgetit);
	Info_AddChoice(dia_addon_finn_attentat,"Mam dla niego ciekawe informacje!",dia_addon_finn_attentat_haveinfos);
	Info_AddChoice(dia_addon_finn_attentat,"Chcê za³atwiæ Estebana i szukam sprzymierzeñca!",dia_addon_finn_attentat_killesteban);
};

func void dia_addon_finn_attentat_killesteban()
{
	AI_Output(other,self,"DIA_Addon_Finn_KillEsteban_15_00");	//Chcê za³atwiæ Estebana i szukam sprzymierzeñca!
	AI_Output(self,other,"DIA_Addon_Finn_KillEsteban_07_01");	//Nie chcê mieæ z tym nic wspólnego!
	FINN_PETZT = TRUE;
	Info_ClearChoices(dia_addon_finn_attentat);
	AI_StopProcessInfos(self);
};

func void dia_addon_finn_attentat_haveinfos()
{
	AI_Output(other,self,"DIA_Addon_Finn_HaveInfos_15_00");	//Mam dla niego ciekawe informacje!
	AI_Output(self,other,"DIA_Addon_Finn_HaveInfos_07_01");	//Nie jesteœ w zmowie z tym klientem, prawda?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"Chcê za³atwiæ Estebana i szukam sprzymierzeñca!",dia_addon_finn_attentat_killesteban);
	Info_AddChoice(dia_addon_finn_attentat,"To nie twoja sprawa!",dia_addon_finn_attentat_forgetit);
	Info_AddChoice(dia_addon_finn_attentat,"W ¿adnym razie!",dia_addon_finn_attentat_nono);
};

func void dia_addon_finn_attentat_nono()
{
	AI_Output(other,self,"DIA_Addon_Finn_NoNo_15_00");	//W ¿adnym razie!
	AI_Output(self,other,"DIA_Addon_Finn_NoNo_07_01");	//Dobrze! Powiem ci, co wiem.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_attentat);
};

func void dia_addon_finn_attentat_forgetit()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForgetIt_15_00");	//To nie twoja sprawa!
	AI_Output(self,other,"DIA_Addon_Finn_ForgetIt_07_01");	//No i? Có¿, na ten temat tak¿e nic nie wiem.
	Info_ClearChoices(dia_addon_finn_attentat);
};


instance DIA_ADDON_FINN_AGAIN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 9;
	condition = dia_addon_finn_again_condition;
	information = dia_addon_finn_again_info;
	permanent = TRUE;
	description = "A wracaj¹c do tej próby zabójstwa...";
};


func int dia_addon_finn_again_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_attentat) && !Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_finn_again_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_15_00");	//A wracaj¹c do tej próby zabójstwa...
	if(FINN_TELLALL == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_01");	//Powiedzia³em ci ju¿ wszystko...
		Info_ClearChoices(dia_addon_finn_again);
		Info_AddChoice(dia_addon_finn_again,"Dobrze... (wróæ)",dia_addon_finn_again_exit);
		Info_AddChoice(dia_addon_finn_again,"No có¿, opowiedz mi to raz jeszcze.",dia_addon_finn_again_nochmal);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_02");	//Zostaw mnie samego z tym badziewiem!
		AI_StopProcessInfos(self);
	};
};

func void dia_addon_finn_again_exit()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Exit_15_00");	//Dobrze...
	Info_ClearChoices(dia_addon_finn_again);
};

func void dia_addon_finn_again_nochmal()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Nochmal_15_00");	//No có¿, opowiedz mi to raz jeszcze.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_again);
};

