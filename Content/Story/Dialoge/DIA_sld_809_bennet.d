
instance DIA_BENNET_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_exit_condition;
	information = dia_bennet_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bennet_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_HALLO(C_INFO)
{
	npc = sld_809_bennet;
	nr = 1;
	condition = dia_bennet_hallo_condition;
	information = dia_bennet_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_hallo_condition()
{
	if((KAPITEL < 3) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bennet_hallo_info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//Nie sprzedaj� broni. Khaled ni� handluje. Jest w domu, razem z Onarem.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Khaled sprzedaje bro�.");
};


instance DIA_BENNET_TRADE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 700;
	condition = dia_bennet_trade_condition;
	information = dia_bennet_trade_info;
	permanent = TRUE;
	description = "Co masz do sprzedania?";
	trade = TRUE;
};


func int dia_bennet_trade_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//Co masz do sprzedania?
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//Czego potrzebujesz?
	if(BENNETLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTRADER,"Bennet sprzedaje sprz�t kowalski.");
		BENNETLOG = TRUE;
	};
};


instance DIA_BENNET_WHICHWEAPONS(C_INFO)
{
	npc = sld_809_bennet;
	nr = 2;
	condition = dia_bennet_whichweapons_condition;
	information = dia_bennet_whichweapons_info;
	permanent = FALSE;
	description = "Jak� bro� wyrabiasz?";
};


func int dia_bennet_whichweapons_condition()
{
	if(((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)) && (MIS_BENNET_BRINGORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_whichweapons_info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//Jak� bro� wyrabiasz?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//W tej chwili zwyk�e miecze, nic wi�cej.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//Ale gdybym mia� troch� magicznej rudy, m�g�bym robi� bro� lepsz� ni� zwyczajn� - ze stali.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//Nie wiesz przypadkiem, gdzie mo�na znale�� troch� rudy? Opr�cz G�rniczej Doliny, oczywi�cie.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//Nie.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//Oczywi�cie, �e nie.
};


instance DIA_BENNET_BAUORSLD(C_INFO)
{
	npc = sld_809_bennet;
	nr = 3;
	condition = dia_bennet_bauorsld_condition;
	information = dia_bennet_bauorsld_info;
	permanent = FALSE;
	description = "Jeste� farmerem czy najemnikiem?";
};


func int dia_bennet_bauorsld_condition()
{
	return TRUE;
};

func void dia_bennet_bauorsld_info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//Jeste� farmerem czy najemnikiem?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//Nabierasz mnie, co?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//By�em po prostu ciekawy.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//Widzia�e� kiedy� rolnika, kt�ry kuje bro�?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//Nie.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//No to czemu zadajesz takie g�upie pytania?
};


instance DIA_BENNET_WANNAJOIN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 4;
	condition = dia_bennet_wannajoin_condition;
	information = dia_bennet_wannajoin_info;
	permanent = TRUE;
	description = "Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?";
};


func int dia_bennet_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_bauorsld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_bennet_wannajoin_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//Chc� przy��czy� si� do najemnik�w!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//Wi�c przesta� papla� i id� do Torlofa. On ci� wypr�buje.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//Przeszed�em pr�b�.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//Dobrze, a wi�c popr� ci�.
	};
};


instance DIA_BENNET_WANNASMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_wannasmith_condition;
	information = dia_bennet_wannasmith_info;
	permanent = TRUE;
	description = "Mo�esz mnie nauczy�, jak wyku� miecz?";
};


func int dia_bennet_wannasmith_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (BENNET_TEACHCOMMON == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmith_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//Mo�esz mnie nauczy�, jak wyku� miecz?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Jasne.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//Ale to ci� b�dzie troch� kosztowa�. Powiedzmy... 30 z�otych monet.
	Info_ClearChoices(dia_bennet_wannasmith);
	Info_AddChoice(dia_bennet_wannasmith,"Mo�e p�niej.",dia_bennet_wannasmith_later);
	Info_AddChoice(dia_bennet_wannasmith,"Zgoda. Prosz�, oto 30 sztuk z�ota dla ciebie.",dia_bennet_wannasmith_pay);
};

func void dia_bennet_wannasmith_pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//Zgoda. Prosz�, oto 30 sztuk z�ota.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//To by�a bardzo dobra cena! Mo�emy zacz��, kiedy b�dziesz gotowy.
		BENNET_TEACHCOMMON = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Bennet mo�e mnie przeszkoli� w zakresie kowalstwa.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//Nie r�b ze mnie frajera. Trzy dychy i ani grosza mniej.
	};
	Info_ClearChoices(dia_bennet_wannasmith);
};

func void dia_bennet_wannasmith_later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//Mo�e p�niej.
	Info_ClearChoices(dia_bennet_wannasmith);
};


instance DIA_BENNET_TEACHCOMMON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 6;
	condition = dia_bennet_teachcommon_condition;
	information = dia_bennet_teachcommon_info;
	permanent = TRUE;
	description = b_buildlearnstring("Nauka kowalstwa",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_COMMON));
};


func int dia_bennet_teachcommon_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (BENNET_TEACHCOMMON == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachcommon_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//Naucz mnie, jak wyku� miecz.
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//To do�� proste. Znajd� sobie kawa�ek surowej stali i rozgrzej go w ogniu, a� zacznie si� �arzy�.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//Potem wykuj na kowadle ostrze.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//Najwa�niejsze, �eby� pilnowa�, czy ostrze nie wystyg�o. Masz tylko kilka minut, �eby zrobi� bro�...
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//Reszty dowiesz si� sam. To kwestia praktyki.
	};
};


instance DIA_BENNET_WANNASMITHORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 7;
	condition = dia_bennet_wannasmithore_condition;
	information = dia_bennet_wannasmithore_info;
	permanent = TRUE;
	description = "Naucz mnie, jak wyku� bro� z magicznej rudy!";
};


func int dia_bennet_wannasmithore_condition()
{
	if((BENNET_TEACHSMITH == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmithore_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//Naucz mnie, jak wyku� bro� z magicznej rudy!
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//Ale ty nawet nie znasz podstaw.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//Najpierw musisz si� nauczy�, jak wyku� porz�dny miecz. Potem zobaczymy.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//Dop�ki nie b�dziesz jednym z nas, nie zdradz� ci sekretu broni z magicznej rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//Ten sekret zna tylko paru kowali. S�dz�, �e nawet rzemie�lnicy w mie�cie go nie odkryli.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//No i dobrze. Bo inaczej te szumowiny ze stra�y miejskiej nosi�yby magiczne miecze.
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//Nie mam nic przeciwko tobie. Wydajesz si� w porz�dku.
		};
	}
	else if(MIS_BENNET_BRINGORE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//Gdybym mia� rud�, to mo�e nawet bym to zrobi�.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//Ech, daj spok�j. Jestem po stronie najemnik�w i potrafi� ku�. Czego jeszcze chcesz?
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//Mo�esz mi powiedzie�, jak wyku� bro� z magicznej rudy BEZ magicznej rudy?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//No c�...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//Tak my�la�em. Potrzebuj� przynajmniej 5 bry�ek rudy. Albo mo�esz o tym zapomnie�.
		if(MIS_BENNET_BRINGORE == FALSE)
		{
			MIS_BENNET_BRINGORE = LOG_RUNNING;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//Wspaniale, przynios�e� mi rud� i wiesz, jak wyku� przyzwoity miecz.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//A wi�c jedziemy...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//Najwa�niejsze jest jedno: niewa�ne, czy ca�� bro� wyku�e� z magicznego kruszcu, czy tylko pokry�e� stalowe ostrze warstw� zakl�tej rudy. Liczy si� tylko powierzchnia.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//A poniewa� to cholerstwo jest takie drogie, z�ap za stalowy pr�t i kilka bry�ek rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Oczywi�cie, nie wystarczy pokry� gotowy miecz warstw� magicznej rudy. Ca�� bro� musisz wyku� od podstaw.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//Poza tym, wszystko zale�y od rodzaju broni, jak� chcesz wykona�.
		BENNET_TEACHSMITH = TRUE;
	};
};


instance DIA_BENNET_WHEREORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whereore_condition;
	information = dia_bennet_whereore_info;
	permanent = FALSE;
	description = "Gdzie mog� znale�� magiczn� rud�?";
};


func int dia_bennet_whereore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_whereore_info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//Gdzie mog� znale�� magiczn� rud�?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//C�, wiem tylko jedno. W kolonii g�rniczej na pewno jest jej troch�.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//Ale mo�e ci si� poszcz�ci i znajdziesz par� porzuconych kawa�k�w w okolicy.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//Wydaje mi si�, �e w g�rach na po�udniu s� jakie� stare tunele g�rnicze. Mo�e tam b�dziesz mia� szcz�cie.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//Tylko uwa�aj, s�ysza�em, �e roi si� tam od bandyt�w.
};


instance DIA_BENNET_BRINGORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 9;
	condition = dia_bennet_bringore_condition;
	information = dia_bennet_bringore_info;
	permanent = FALSE;
	description = "Prosz� � 5 bry�ek.";
};


func int dia_bennet_bringore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && (Npc_HasItems(other,itmi_nugget) >= 5))
	{
		return TRUE;
	};
};

func void dia_bennet_bringore_info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//Prosz� - 5 bry�ek.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//Poka� mi!
	b_giveinvitems(other,self,itmi_nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//Naprawd�! No teraz mnie rozbroi�e�!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//Zatrzymaj sobie dwie z nich. Przydadz� ci si�, je�li b�dziesz chcia� wyku� sobie bro�.
	b_giveinvitems(self,other,itmi_nugget,2);
	MIS_BENNET_BRINGORE = LOG_SUCCESS;
};


var int bennet_kap2smith;
var int bennet_kap3smith;
var int bennet_kap4smith;
var int bennet_kap5smith;

func void b_saybennetlater()
{
	AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//Nie, jeszcze nie. Wr�� p�niej.
};


instance DIA_BENNET_TEACHSMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 30;
	condition = dia_bennet_teachsmith_condition;
	information = dia_bennet_teachsmith_info;
	permanent = TRUE;
	description = "Chcia�bym wiedzie� wi�cej o wykuwaniu magicznej broni.";
};


func int dia_bennet_teachsmith_condition()
{
	if((BENNET_TEACHSMITH == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachsmith_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//Chcia�bym wiedzie� wi�cej o wykuwaniu magicznej broni.
	if(KAPITEL == 1)
	{
		b_saybennetlater();
	}
	else if((KAPITEL == 2) && (BENNET_KAP2SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//Mog� ci� nauczy�, jak wyku� miecze z magicznego kruszcu, nawet dwur�czne.
		BENNET_KAP2SMITH = TRUE;
	}
	else if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (BENNET_KAP3SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//Poprawi�em moj� technik�. Teraz mog� ci� nauczy�, jak wyku� z rudy miecze p�torar�czne albo ci�kie dwur�czne.
		BENNET_KAP3SMITH = TRUE;
	}
	else if((MIS_READYFORCHAPTER4 == TRUE) && (KAPITEL < 5) && (BENNET_KAP4SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03");	//Chyba tym razem przeszed�em samego siebie. Opracowa�em dwa bitewne ostrza. To najlepsza rzecz, jak� do tej pory zrobi�em.
		BENNET_KAP4SMITH = TRUE;
	}
	else if((KAPITEL >= 5) && (BENNET_KAP5SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//S�uchaj, chyba mam genialny pomys�. Bro� z magicznego kruszcu, pokryta smocz� krwi�. I wiem dok�adnie, jak to zrobi�!
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//Chcesz pozna� ten sekret?
		BENNET_KAP5SMITH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//Jak� bro� chcia�by� zrobi�?
	};
	Info_ClearChoices(dia_bennet_teachsmith);
	Info_AddChoice(dia_bennet_teachsmith,DIALOG_BACK,dia_bennet_teachsmith_back);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_01)),dia_bennet_teachsmith_1hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_01)),dia_bennet_teachsmith_2hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_02)),dia_bennet_teachsmith_1hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_02)),dia_bennet_teachsmith_2hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_03)),dia_bennet_teachsmith_1hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_03)),dia_bennet_teachsmith_2hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_04)),dia_bennet_teachsmith_1hspecial4);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_04)),dia_bennet_teachsmith_2hspecial4);
	};
};

func void dia_bennet_teachsmith_back()
{
	Info_ClearChoices(dia_bennet_teachsmith);
};

func void dia_bennet_teachsmith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void dia_bennet_teachsmith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void dia_bennet_teachsmith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void dia_bennet_teachsmith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};

func void dia_bennet_teachsmith_1hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_03);
};

func void dia_bennet_teachsmith_2hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_03);
};

func void dia_bennet_teachsmith_1hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_04);
};

func void dia_bennet_teachsmith_2hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_04);
};


instance DIA_BENNET_KAP3_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap3_exit_condition;
	information = dia_bennet_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bennet_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_WHYPRISON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whyprison_condition;
	information = dia_bennet_whyprison_info;
	permanent = FALSE;
	description = "Jak trafi�e� do paki?";
};


func int dia_bennet_whyprison_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_whyprison_info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//Jak trafi�e� do paki?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//Te �winie wrzuci�y mnie do lochu. Twierdz�, �e zamordowa�em paladyna.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//Ale ja tego nie zrobi�em, pr�buj� mnie wrobi�.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//Czemu mieliby to robi�?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//A sk�d mam wiedzie�? Musisz mnie st�d wyci�gn��!
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//Porozmawiaj z Lordem Hagenem, zburz mury, nie wiem - po prostu zr�b co�!
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Bennet zrobi�by wszystko, �eby wydosta� si� z wi�zienia.");
};


instance DIA_BENNET_WHATHAPPENED(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whathappened_condition;
	information = dia_bennet_whathappened_info;
	permanent = FALSE;
	description = "Co si� sta�o?";
};


func int dia_bennet_whathappened_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_whathappened_info()
{
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_00");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01");	//Poszed�em do miasta z Hodgesem, �eby kupi� troch� zapas�w dla ch�opak�w.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_02");	//Nagle us�yszeli�my g�o�ny krzyk i tupot n�g.
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_03");	//Przejd� do rzeczy.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_04");	//Od razu wiedzieli�my, �e co� si� sta�o i spr�buj� nas z�apa�, je�li nas zauwa��.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_05");	//Uciekali�my, jakby nas diabe� goni�. Wtedy, tu� przed bram� miasta, potkn��em si� i rozwali�em kolano.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_06");	//Reszta jest oczywista. Stra� od razu mnie z�apa�a i wrzuci�a prosto do tego lochu.
};


instance DIA_BENNET_VICTIM(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_victim_condition;
	information = dia_bennet_victim_info;
	permanent = FALSE;
	description = "Kogo zamordowano?";
};


func int dia_bennet_victim_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_victim_info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//Kogo zamordowano?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//Nie mam poj�cia. Jednego z paladyn�w, nie znam ich.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//Wiesz, jak si� nazywa�?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//Jaki� Lothar, chyba. No nie wiem, nie jestem pewny.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//Lepiej zapytaj Lorda Hagena, on zna wszystkie szczeg�y.
	b_logentry(TOPIC_RESCUEBENNET,"Jeden z paladyn�w, Lothar, zosta� zamordowany. �ledztwo w tej sprawie prowadzi Lord Hagen i z pewno�ci� udzieli mi dok�adniejszych informacji.");
};


instance DIA_BENNET_EVIDENCE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_evidence_condition;
	information = dia_bennet_evidence_info;
	permanent = FALSE;
	description = "Maj� przeciwko tobie jakie� dowody?";
};


func int dia_bennet_evidence_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_evidence_info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//Maj� przeciwko tobie jakie� dowody?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//M�wi�, �e maj� �wiadka, kt�ry wszystko widzia�.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//Wiesz, kim jest ten �wiadek?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//Nie. Wiem tylko, �e k�amie.
	b_logentry(TOPIC_RESCUEBENNET,"Podobno kto� widzia� Benneta, gdy ten pope�nia� zbrodni�. Je�li chc� pozna� prawd�, b�d� musia� znale�� tego �wiadka.");
	RESCUEBENNET_KNOWSWITNESS = TRUE;
};


instance DIA_BENNET_INVESTIGATION(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_investigation_condition;
	information = dia_bennet_investigation_info;
	permanent = FALSE;
	description = "Kto kieruje �ledztwem?";
};


func int dia_bennet_investigation_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_evidence))
	{
		return TRUE;
	};
};

func void dia_bennet_investigation_info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//Kto kieruje �ledztwem?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//Sam Lord Hagen. Poniewa� ofiara by�a paladynem, to sprawa podlega pod s�d wojskowy.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//Co to znaczy?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//Nietrudno zgadn��. Je�li si� st�d nie wydostan�, to zadyndam na sznurze.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//Musisz mi pom�c albo wybuchnie wojna. Lee tak tego nie zostawi.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//Sam si� domy�l, co to b�dzie oznacza�.
};


instance DIA_BENNET_THANKYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_thankyou_condition;
	information = dia_bennet_thankyou_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_thankyou_condition()
{
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_bennet_thankyou_info()
{
	if(hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild(other,GIL_DJG);
	};
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//Stary, ju� my�la�em, �e naprawd� mnie powiesz�!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//No c�, wszystko si� w ko�cu wyja�ni�o.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//Wspaniale. Szkoda, �e nie widzia�e� twarzy tego �o�nierza, kt�ry mnie wyprowadza�!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//By� taki przera�ony, �e prawie narobi� w gacie.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//A to mi przypomina, �e mam co� dla ciebie.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//Co? O co ci chodzi?
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//Prezent.
};


instance DIA_BENNET_PRESENT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_present_condition;
	information = dia_bennet_present_info;
	permanent = FALSE;
	description = "Co za prezent?";
};


func int dia_bennet_present_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_thankyou))
	{
		return TRUE;
	};
};

func void dia_bennet_present_info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//Co za prezent?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//S�yszeli�my pog�oski o smokach w Dolinie.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//Naprawd� tam s�!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//W porz�dku, wierz� ci.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//W ka�dym razie, paru ch�opak�w postanowi�o wybra� si� do Doliny.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//Zamierzaj� tam troch� zarobi�.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//A co to ma wsp�lnego ze mn�?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//Opracowa�em nowy rodzaj zbroi. Zbroj� �owcy smok�w!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//Jest bardziej wytrzyma�a i l�ejsza ni� zwyk�e zbroje.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//A poniewa� to ty mnie uratowa�e�, chc� ci da� jej pierwszy egzemplarz. To prezent!
		CreateInvItems(self,itar_djg_l,1);
		b_giveinvitems(self,other,itar_djg_l,1);
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//S�dzi�em, �e pewnie zechcesz przy��czy� si� do zabawy. Je�li wybierasz si� do Doliny, b�dzie ci potrzebny odpowiedni ekwipunek.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//A poza tym interesuj� mnie smocze �uski. Prawdziwe smocze �uski. Dam ci za nie dobr� cen�.
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//Ile dostan� za ka�d� �usk�?
		b_say_gold(self,other,VALUE_DRAGONSCALE);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//Tak czy inaczej, pomy�la�em, �e b�dziesz chcia� wzi�� udzia� w polowaniu na smoki.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//I co?
		AI_Output(self,other,"DIA_Bennet_Present_06_15");	//Prosz�, we� ten amulet. S�dz�, �e tobie bardziej si� on przyda.
		CreateInvItems(self,itam_hp_01,1);
		b_giveinvitems(self,other,itam_hp_01,1);
	};
};


var int bennet_dragonscale_counter;
var int show_djg_armor_m;

instance DIA_BENNET_DRAGONSCALE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_dragonscale_condition;
	information = dia_bennet_dragonscale_info;
	permanent = TRUE;
	description = "Mam dla ciebie smocze �uski.";
};


func int dia_bennet_dragonscale_condition()
{
	if((Npc_HasItems(other,itat_dragonscale) > 0) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_dragonscale_info()
{
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//Mam dla ciebie smocze �uski.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//Prawdziwe smocze �uski!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//Oto twoje z�oto.
	BENNET_DRAGONSCALE_COUNTER = BENNET_DRAGONSCALE_COUNTER + Npc_HasItems(other,itat_dragonscale);
	b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_dragonscale) * VALUE_DRAGONSCALE);
	b_giveinvitems(other,self,itat_dragonscale,Npc_HasItems(other,itat_dragonscale));
	if((BENNET_DRAGONSCALE_COUNTER >= 20) && (SHOW_DJG_ARMOR_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//W porz�dku, tyle powinno wystarczy�. Mog� ci sprzeda� now�, ulepszon� zbroj�. Je�li chcesz.
		SHOW_DJG_ARMOR_M = TRUE;
	};
};


var int bennet_dia_bennet_djg_armor_m_permanent;

instance DIA_BENNET_DJG_ARMOR_M(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_m_condition;
	information = dia_bennet_djg_armor_m_info;
	permanent = TRUE;
	description = "�redni pancerz �owcy smok�w. Ochrona (bro� i strza�y) 120, 12000 sztuk z�ota.";
};


func int dia_bennet_djg_armor_m_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (SHOW_DJG_ARMOR_M == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//Chc� kupi� zbroj�.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//Bardzo dobrze. B�dziesz ni� zachwycony.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//Chyba mog� tego oczekiwa� po takiej cenie.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//Przekonasz si�, �e jest warta ka�dej sztuki z�ota.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//Masz za ma�o z�ota.
	};
};


instance DIA_BENNET_BETTERARMOR(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_betterarmor_condition;
	information = dia_bennet_betterarmor_info;
	permanent = FALSE;
	description = "Wiem, jak jeszcze bardziej ulepszy� zbroj�.";
};


func int dia_bennet_betterarmor_condition()
{
	if((PLAYERGETSFINALDJGARMOR == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_betterarmor_info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//Wiem, jak jeszcze bardziej ulepszy� zbroj�.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//Tak? No to mi powiedz.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//Mo�esz pokry� smocze �uski magiczn� rud�.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//Te� o tym pomy�la�em. Masz racj�.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//Moja najnowsza zbroja bije na g�ow� wszystko, co do tej pory widzia�e�. Jest lekka, ale mocna.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//Jest po prostu IDEALNA.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//Je�li chcesz, to ci j� sprzedam. Nie zaproponowa�bym tego byle komu, a cena pokrywa tylko moje koszty.
};


var int bennet_dia_bennet_djg_armor_h_permanent;

instance DIA_BENNET_DJG_ARMOR_H(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_h_condition;
	information = dia_bennet_djg_armor_h_info;
	permanent = TRUE;
	description = "Ci�ki pancerz �owcy smok�w. Ochrona (bro� i strza�y) 150, 20000 sztuk z�ota.";
};


func int dia_bennet_djg_armor_h_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_bennet_betterarmor))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_h_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//Daj mi t� zbroj�.
	if(Npc_HasItems(other,itmi_gold) >= 20000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//To najlepsza zbroja, jak� kiedykolwiek zrobi�em.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//Prawdziwe arcydzie�o.
		b_giveinvitems(other,self,itmi_gold,20000);
		CreateInvItems(self,itar_djg_h,1);
		b_giveinvitems(self,other,itar_djg_h,1);
		BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//Masz za ma�o z�ota.
	};
};


instance DIA_BENNET_REPAIRNECKLACE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_repairnecklace_condition;
	information = dia_bennet_repairnecklace_info;
	permanent = FALSE;
	description = "Potrafisz naprawi� bi�uteri�?";
};


func int dia_bennet_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_bennet_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//Umiesz naprawia� bi�uteri�?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//To zale�y. Musia�by� mi j� najpierw pokaza�.
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//No i oczywi�cie musz� si� st�d wydosta�.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//Bo teraz nic nie mog� zrobi�.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_SHOWINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_showinnoseye_condition;
	information = dia_bennet_showinnoseye_info;
	permanent = FALSE;
	description = "Mo�esz obejrze� ten amulet?";
};


func int dia_bennet_showinnoseye_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_showinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//Mo�esz obejrze� ten amulet?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Jasne, poka�.
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Hmmm. Pi�kna robota. Ale oprawa jest uszkodzona. Chyba da�bym rad� to naprawi�.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//Ile ci to zajmie?
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//C�, na razie tu ugrz�z�em. Widzisz tu jak�� ku�ni�?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//U siebie zrobi�bym to w jeden dzie�. Ale najpierw musia�bym si� st�d wydosta�.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//Je�li to tu zostawisz, b�dzie gotowe na jutro.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//I nic ci za to nie policz�. W ko�cu wyci�gn��e� mnie z paki.
	};
	b_logentry(TOPIC_INNOSEYE,"Bennet m�g�by naprawi� amulet.");
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_GIVEINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_giveinnoseye_condition;
	information = dia_bennet_giveinnoseye_info;
	permanent = FALSE;
	description = "Oto amulet, prosz�, napraw go dla mnie.";
};


func int dia_bennet_giveinnoseye_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) >= 1) && (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE) && (MIS_RESCUEBENNET == LOG_SUCCESS) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//Oto amulet, prosz�, napraw go dla mnie.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//W porz�dku. Do jutra zrobi� now� opraw�.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//Mo�esz do mnie wtedy przyj�� i go odebra�.
	Npc_RemoveInvItems(other,itmi_innoseye_broken_mis,1);
	AI_PrintScreen(PRINT_INNOSEYEGIVEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	BENNET_REPAIRDAY = Wld_GetDay();
};


instance DIA_BENNET_GETINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_getinnoseye_condition;
	information = dia_bennet_getinnoseye_info;
	permanent = TRUE;
	description = "Czy amulet jest gotowy?";
};


func int dia_bennet_getinnoseye_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_giveinnoseye) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_getinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//Czy amulet jest gotowy?
	if(BENNET_REPAIRDAY < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Tak, prosz�.
		TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_REPAIRED;
		CreateInvItems(other,itmi_innoseye_broken_mis,1);
		AI_PrintScreen(PRINT_INNOSEYEGET,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//Musia�em zrobi� now� opraw� dla kamienia.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//Pracowa�em przez ca�� noc. Wygl�da jak nowy.
		b_logentry(TOPIC_INNOSEYE,"Bennet naprawi� opraw� amuletu.");
		MIS_BENNET_INNOSEYEREPAIREDSETTING = LOG_SUCCESS;
		b_giveplayerxp(XP_INNOSEYEISREPAIRED);
	}
	else
	{
		b_saybennetlater();
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//Je�li b�dziesz mi przeszkadza�, potrwa to d�u�ej.
		AI_StopProcessInfos(self);
	};
};


instance DIA_BENNET_KAP4_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap4_exit_condition;
	information = dia_bennet_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bennet_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_DRACHENEIER(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_dracheneier_condition;
	information = dia_bennet_dracheneier_info;
	permanent = TRUE;
	description = "Czy mo�esz co� zrobi� ze smoczych jaj?";
};


func int dia_bennet_dracheneier_condition()
{
	if((KAPITEL >= 4) && (BENNETSDRAGONEGGOFFER == 0) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int bennetsdragoneggoffer;
var int dracheneier_angebotenxp_onetime;

func void dia_bennet_dracheneier_info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//Czy mo�esz co� zrobi� ze smoczych jaj?
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//Smocze jaja? Do licha, sk�d je wytrzasn��e�?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//Zabra�em je jaszczuroludziom.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//Poka�.
	};
	Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//Hmmm. Bardzo twardy materia�. Idealny do wyko�czenia zbroi. To znaczy, gdyby komu� uda�o si� je rozbi�.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//No to co? Chcesz?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//Jasne! Dawaj.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//Ile razy jeszcze masz zamiar pokazywa� mi te cholerstwa? Chcesz, �ebym je kupi� czy nie?
	};
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//Zap�ac� powiedzmy, hmmm... 300 sztuk z�ota za ka�de jajo, kt�re mi przyniesiesz.
	Info_ClearChoices(dia_bennet_dracheneier);
	Info_AddChoice(dia_bennet_dracheneier,"Zachowaj wi�c swoje z�oto. My�l�, �e je zatrzymam.",dia_bennet_dracheneier_nein);
	Info_AddChoice(dia_bennet_dracheneier,"To s� smocze jaja, a nie jajka od kury.",dia_bennet_dracheneier_mehr);
	Info_AddChoice(dia_bennet_dracheneier,"Umowa stoi.",dia_bennet_dracheneier_ok);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		b_logentry(TOPIC_DRACHENEIER,"Bennet hojnie mi zap�aci za wszystkie smocze jaja, kt�re zdo�am znale��.");
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		DRACHENEIER_ANGEBOTENXP_ONETIME = TRUE;
	};
};

func void dia_bennet_dracheneier_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//Umowa stoi.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//Dobra.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//A wi�c je�li jakie� znajdziesz, przynie� mi je.
	if(BENNETSDRAGONEGGOFFER != 350)
	{
		BENNETSDRAGONEGGOFFER = 300;
	};
	CreateInvItems(self,itmi_gold,BENNETSDRAGONEGGOFFER);
	b_giveinvitems(self,other,itmi_gold,BENNETSDRAGONEGGOFFER);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//Hmmm. M�wi�e�, �e znalaz�e� je u jaszczuroludzi?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//Dok�adnie.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//Z tego, co wiem, wi�kszo�� jaszczuroludzi mieszka w jaskiniach.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//Nie zdziwi�bym si�, gdyby w okolicznych pieczarach by�o tego wi�cej.
	b_logentry(TOPIC_DRACHENEIER,"Bennet uwa�a, �e powinienem poszuka� smoczych jaj w jaskiniach Khorinis, w kt�rych podobno �yj� jaszczuroludzie.");
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//Prosz�. We� t� map�. Pomo�e ci znale�� jaskinie.
	CreateInvItems(self,itwr_map_caves_mis,1);
	b_giveinvitems(self,other,itwr_map_caves_mis,1);
	b_logentry(TOPIC_DRACHENEIER,"Aby u�atwi� mi to zadanie, da� mi map� jaski�.");
	if(1 == 2)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_08");	//Ale najpierw musisz zdoby� map� jaski� od kartografa w mie�cie. Szkoda by�oby, gdyby� przeoczy� jakie� jajo.
		b_logentry(TOPIC_DRACHENEIER,"Powinienem kupi� u kartografa w mie�cie map� jaski�. Dzi�ki temu b�d� mia� pewno��, �e nie przeoczy�em �adnego jaja.");
	};
	Info_ClearChoices(dia_bennet_dracheneier);
};

func void dia_bennet_dracheneier_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//To s� smocze jaja, a nie jajka od kury.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//W porz�dku. Niech b�dzie 350. Nie mog� ci wi�cej da�, bo mi si� to nie zwr�ci.
	BENNETSDRAGONEGGOFFER = 350;
};

func void dia_bennet_dracheneier_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//Zachowaj wi�c swoje z�oto. My�l�, �e je zatrzymam.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//Powiedz, je�li zmienisz zdanie.
	CreateInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	BENNETSDRAGONEGGOFFER = 0;
	Info_ClearChoices(dia_bennet_dracheneier);
};


instance DIA_BENNET_EIERBRINGEN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_eierbringen_condition;
	information = dia_bennet_eierbringen_info;
	permanent = TRUE;
	description = "Chcesz kolejne smocze jaja?";
};


func int dia_bennet_eierbringen_condition()
{
	if((BENNETSDRAGONEGGOFFER > 0) && (KAPITEL >= 4) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int dragoneggcounter;

func void dia_bennet_eierbringen_info()
{
	var int dragoneggcount;
	var int xp_djg_bringdragoneggs;
	var int dragonegggeld;
	var string concattext;
	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//Chcesz kolejne smocze jaja?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//Jasne!
	dragoneggcount = Npc_HasItems(other,itat_dragonegg_mis);
	if(dragoneggcount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//Prosz�, mam kolejne.
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
		AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//Mam tu kilka.
		Npc_RemoveInvItems(other,itat_dragonegg_mis,dragoneggcount);
		concattext = ConcatStrings(IntToString(dragoneggcount),PRINT_ITEMSGEGEBEN);
		AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		xp_djg_bringdragoneggs = dragoneggcount * XP_DJG_BRINGDRAGONEGG;
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + dragoneggcount;
		b_giveplayerxp(xp_djg_bringdragoneggs);
	};
	if(DRAGONEGGCOUNTER <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//Wspaniale. Dawaj. Wsz�dzie ju� zajrza�e�? Na pewno jest ich wi�cej.
	}
	else if(DRAGONEGGCOUNTER <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//Sk�d to wygrzeba�e�? Pewnie niewiele ju� ich zosta�o.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//S�dz�, �e ju� wi�cej ich nie znajdziesz. A ja mam ich tyle, �e nie wiem, co z nimi zrobi�.
		TOPIC_END_DRACHENEIER = TRUE;
	};
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//Och, w porz�dku. Oto twoje pieni�dze.
	dragonegggeld = dragoneggcount * BENNETSDRAGONEGGOFFER;
	CreateInvItems(self,itmi_gold,dragonegggeld);
	b_giveinvitems(self,other,itmi_gold,dragonegggeld);
};


instance DIA_BENNET_KAP5_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap5_exit_condition;
	information = dia_bennet_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bennet_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_knowwhereenemy_condition;
	information = dia_bennet_knowwhereenemy_info;
	permanent = TRUE;
	description = "Wybieram si� na wysp� i przyda�by mi si� kowal.";
};


func int dia_bennet_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BENNET_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//Wybieram si� na wysp� i przyda�by mi si� kowal.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//I pomy�la�e� o mnie?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//Tak. Co ty na to? Tak czy inaczej, dzi�ki temu by� si� st�d wydosta�.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//Stary, nawet w piekle nie mo�e by� tak paskudnie jak na farmie Onara. Wchodz� w to.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Bennet mo�e wyruszy� w ka�dej chwili. Jest niezr�wnanym kowalem - z pewno�ci� m�g�bym si� od niego wiele nauczy�.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//Moja za�oga jest ju� kompletna.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//Wi�c ode�lij kogo�.
	}
	else
	{
		Info_ClearChoices(dia_bennet_knowwhereenemy);
		Info_AddChoice(dia_bennet_knowwhereenemy,"Powiem ci, kiedy mi b�dziesz potrzebny.",dia_bennet_knowwhereenemy_no);
		Info_AddChoice(dia_bennet_knowwhereenemy,"A wi�c b�dziesz moim kowalem. Zobaczymy si� w porcie.",dia_bennet_knowwhereenemy_yes);
	};
};

func void dia_bennet_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//A wi�c b�dziesz moim kowalem. Zobaczymy si� w porcie.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//W porz�dku. Do zobaczenia.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};

func void dia_bennet_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//Powiem ci, kiedy mi b�dziesz potrzebny.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//�wietnie.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};


instance DIA_BENNET_LEAVEMYSHIP(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_leavemyship_condition;
	information = dia_bennet_leavemyship_info;
	permanent = TRUE;
	description = "Zamierzam znale�� sobie innego kowala.";
};


func int dia_bennet_leavemyship_condition()
{
	if((BENNET_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_leavemyship_info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//Zamierzam znale�� sobie innego kowala.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//Raz tak, raz siak. Zdecyduj si�, dobra? Daj mi zna�, jak b�dziesz wiedzia�, czego NAPRAWD� chcesz.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BENNET_STILLNEEDYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_stillneedyou_condition;
	information = dia_bennet_stillneedyou_info;
	permanent = TRUE;
	description = "Wr��. Nie mog� znale�� innego kowala.";
};


func int dia_bennet_stillneedyou_condition()
{
	if(((BENNET_ISONBOARD == LOG_OBSOLETE) || (BENNET_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_bennet_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//Wr��. Nie mog� znale�� innego kowala.
	AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//Dobra! W ko�cu kto by si� mn� przejmowa�, drobiazg. Zobaczymy si� w porcie.
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_BENNET_PICKPOCKET(C_INFO)
{
	npc = sld_809_bennet;
	nr = 900;
	condition = dia_bennet_pickpocket_condition;
	information = dia_bennet_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bennet_pickpocket_condition()
{
	return c_beklauen(35,45);
};

func void dia_bennet_pickpocket_info()
{
	Info_ClearChoices(dia_bennet_pickpocket);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_BACK,dia_bennet_pickpocket_back);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_PICKPOCKET,dia_bennet_pickpocket_doit);
};

func void dia_bennet_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bennet_pickpocket);
};

func void dia_bennet_pickpocket_back()
{
	Info_ClearChoices(dia_bennet_pickpocket);
};

