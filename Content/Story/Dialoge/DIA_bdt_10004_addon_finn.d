
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
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hacker_07_01");	//Tak, mam zamiar zdoby� ostatni kawa�ek z�ota z tej kopalni.
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
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hi_15_00");	//Cze��.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hi_07_01");	//Czego chcesz?
};


instance DIA_ADDON_FINN_HACKE(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 2;
	condition = dia_addon_finn_hacke_condition;
	information = dia_addon_finn_hacke_info;
	permanent = FALSE;
	description = "Gdzie dostan� kilof?";
};


func int dia_addon_finn_hacke_condition()
{
	return TRUE;
};

func void dia_addon_finn_hacke_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Hacke_15_00");	//Gdzie dostan� kilof?
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_01");	//Id� do Huno, kowala. Ale posiadanie kilofa wcale nie otworzy ci drogi do kopalni.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_02");	//Je�li chcesz wej��, musisz najpierw porozmawia� z Estebanem.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_03");	//Do Thorusa mo�esz nawet nie i�� - je�li nie masz czerwonego kamienia, to ci� nie wpu�ci.
};


instance DIA_ADDON_FINN_ESTEBAN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 3;
	condition = dia_addon_finn_esteban_condition;
	information = dia_addon_finn_esteban_info;
	permanent = FALSE;
	description = "Co my�lisz o Estebanie?";
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
	AI_Output(other,self,"DIA_Addon_Finn_Esteban_15_00");	//Co my�lisz o Estebanie?
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_01");	//On tu jest szefem... My�l�, �e jest w porz�dku.
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_02");	//Porz�dnych ch�opak�w zawsze wpuszcza do kopalni. To znaczy takich, kt�rzy maj� poj�cie o g�rnictwie.
};


instance DIA_ADDON_FINN_PROFI(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 4;
	condition = dia_addon_finn_profi_condition;
	information = dia_addon_finn_profi_info;
	permanent = FALSE;
	description = "Znasz si� na g�rnictwie?";
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
	AI_Output(other,self,"DIA_Addon_Finn_Profi_15_00");	//Znasz si� na g�rnictwie?
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
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_00");	//W porz�dku, szefie. Chcesz, �eby w kopalni pracowali najlepsi? Czyli znowu wkraczam do akcji.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_01");	//I jeszcze jedno: zdradz� ci sekret Kopaczy.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_02");	//Czas po�upa� nieco g�az�w.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_03");	//Jak uderzy�e� ju� kilka razy, ale nic nie odkopa�e�, to przeci�gnij ostrzem kilofa po skale.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_04");	//Przy odrobinie szcz�cia zdob�dziesz sporo kawa�k�w.
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
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_00");	//Trzeba wiedzie� kilka rzeczy. Z�oto to nie ruda. To piekielnie du�a r�nica.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_01");	//Jaka kobieta nosi�aby na szyi �a�cuch wykonany z rudy?
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_02");	//Zacznij kopa� od g�ry do do�u. Tym sposobem naj�atwiej odkopa� samorodki.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_03");	//Niekt�rzy kopacze robi� odwrotnie, ale to o wiele trudniejsze.
	b_upgrade_hero_hackchance(10);
};


instance DIA_ADDON_FINN_EIN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 7;
	condition = dia_addon_finn_ein_condition;
	information = dia_addon_finn_ein_info;
	permanent = TRUE;
	description = "Potrafisz oceni� moje umiej�tno�ci kopania z�ota?";
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
	AI_Output(other,self,"DIA_Addon_Finn_ein_15_00");	//Potrafisz oceni� moje umiej�tno�ci kopania z�ota?
	if(FINN_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_01");	//Pewnie. Robi� tu ju� od ponad 35 lat. Wszystko poznam!
		FINN_EINMAL = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Finn_ein_07_02");	//Powiedzia�bym, �e jeste�...
	if(HERO_HACKCHANCE < 20)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_03");	//nieopierzonym ��todziobem.
	}
	else if(HERO_HACKCHANCE < 40)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_04");	//przeci�tnym kopaczem.
	}
	else if(HERO_HACKCHANCE < 55)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_05");	//do�wiadczonym kopaczem.
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
			AI_Output(self,other,"DIA_Addon_Finn_ein_07_10");	//Teraz jeste� tak dobry, jak ja. Gratuluj�, partnerze!
			b_giveplayerxp(XP_AMBIENT * 2);
			Snd_Play("LevelUP");
			FINN_GRATULATION = TRUE;
		};
	};
	concattext = ConcatStrings("Kopanie z�ota: ",IntToString(HERO_HACKCHANCE));
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
	description = "A co do pr�by zab�jstwa Estebana...";
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
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_02");	//Dlaczego chcesz to wiedzie�?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"Chc� porozmawia� z tym go�ciem.",dia_addon_finn_attentat_wannatalk);
	Info_AddChoice(dia_addon_finn_attentat,"Esteban chce go widzie� martwym!",dia_addon_finn_attentat_fortheboss);
};

func void b_addon_finn_tellall()
{
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_00");	//Po pr�bie zab�jstwa chcia�em odebra� sw�j kilof od kowala Huno.
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_01");	//Nie by�o go tam jednak.
	AI_Output(other,self,"DIA_Addon_Finn_TellAll_15_02");	//No i?
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_03");	//On ZAWSZE tam jest. Wed�ug mnie to DO�� podejrzane.
	FINN_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Finn m�wi, �e Huno by� nieobecny w czasie pr�by zab�jstwa.");
};

func void dia_addon_finn_attentat_fortheboss()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForTheBoss_15_00");	//Esteban chce go widzie� martwym!
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_01");	//Och! Pracujesz dla szefa?
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_02");	//W takim razie powiem ci, co wiem.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_attentat);
};

func void dia_addon_finn_attentat_wannatalk()
{
	AI_Output(other,self,"DIA_Addon_Finn_WannaTalk_15_00");	//Chc� porozmawia� z tym go�ciem.
	AI_Output(self,other,"DIA_Addon_Finn_WannaTalk_07_01");	//A czego od niego chcesz?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"To nie twoja sprawa!",dia_addon_finn_attentat_forgetit);
	Info_AddChoice(dia_addon_finn_attentat,"Mam dla niego ciekawe informacje!",dia_addon_finn_attentat_haveinfos);
	Info_AddChoice(dia_addon_finn_attentat,"Chc� za�atwi� Estebana i szukam sprzymierze�ca!",dia_addon_finn_attentat_killesteban);
};

func void dia_addon_finn_attentat_killesteban()
{
	AI_Output(other,self,"DIA_Addon_Finn_KillEsteban_15_00");	//Chc� za�atwi� Estebana i szukam sprzymierze�ca!
	AI_Output(self,other,"DIA_Addon_Finn_KillEsteban_07_01");	//Nie chc� mie� z tym nic wsp�lnego!
	FINN_PETZT = TRUE;
	Info_ClearChoices(dia_addon_finn_attentat);
	AI_StopProcessInfos(self);
};

func void dia_addon_finn_attentat_haveinfos()
{
	AI_Output(other,self,"DIA_Addon_Finn_HaveInfos_15_00");	//Mam dla niego ciekawe informacje!
	AI_Output(self,other,"DIA_Addon_Finn_HaveInfos_07_01");	//Nie jeste� w zmowie z tym klientem, prawda?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"Chc� za�atwi� Estebana i szukam sprzymierze�ca!",dia_addon_finn_attentat_killesteban);
	Info_AddChoice(dia_addon_finn_attentat,"To nie twoja sprawa!",dia_addon_finn_attentat_forgetit);
	Info_AddChoice(dia_addon_finn_attentat,"W �adnym razie!",dia_addon_finn_attentat_nono);
};

func void dia_addon_finn_attentat_nono()
{
	AI_Output(other,self,"DIA_Addon_Finn_NoNo_15_00");	//W �adnym razie!
	AI_Output(self,other,"DIA_Addon_Finn_NoNo_07_01");	//Dobrze! Powiem ci, co wiem.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_attentat);
};

func void dia_addon_finn_attentat_forgetit()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForgetIt_15_00");	//To nie twoja sprawa!
	AI_Output(self,other,"DIA_Addon_Finn_ForgetIt_07_01");	//No i? C�, na ten temat tak�e nic nie wiem.
	Info_ClearChoices(dia_addon_finn_attentat);
};


instance DIA_ADDON_FINN_AGAIN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 9;
	condition = dia_addon_finn_again_condition;
	information = dia_addon_finn_again_info;
	permanent = TRUE;
	description = "A wracaj�c do tej pr�by zab�jstwa...";
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
	AI_Output(other,self,"DIA_Addon_Finn_Again_15_00");	//A wracaj�c do tej pr�by zab�jstwa...
	if(FINN_TELLALL == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_01");	//Powiedzia�em ci ju� wszystko...
		Info_ClearChoices(dia_addon_finn_again);
		Info_AddChoice(dia_addon_finn_again,"Dobrze... (wr��)",dia_addon_finn_again_exit);
		Info_AddChoice(dia_addon_finn_again,"No c�, opowiedz mi to raz jeszcze.",dia_addon_finn_again_nochmal);
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
	AI_Output(other,self,"DIA_Addon_Finn_Again_Nochmal_15_00");	//No c�, opowiedz mi to raz jeszcze.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_again);
};

