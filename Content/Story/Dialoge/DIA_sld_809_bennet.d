
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
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//Nie sprzedajê broni. Khaled ni¹ handluje. Jest w domu, razem z Onarem.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Khaled sprzedaje broñ.");
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
		b_logentry(TOPIC_SOLDIERTRADER,"Bennet sprzedaje sprzêt kowalski.");
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
	description = "Jak¹ broñ wyrabiasz?";
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
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//Jak¹ broñ wyrabiasz?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//W tej chwili zwyk³e miecze, nic wiêcej.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//Ale gdybym mia³ trochê magicznej rudy, móg³bym robiæ broñ lepsz¹ ni¿ zwyczajn¹ - ze stali.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//Nie wiesz przypadkiem, gdzie mo¿na znaleŸæ trochê rudy? Oprócz Górniczej Doliny, oczywiœcie.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//Nie.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//Oczywiœcie, ¿e nie.
};


instance DIA_BENNET_BAUORSLD(C_INFO)
{
	npc = sld_809_bennet;
	nr = 3;
	condition = dia_bennet_bauorsld_condition;
	information = dia_bennet_bauorsld_info;
	permanent = FALSE;
	description = "Jesteœ farmerem czy najemnikiem?";
};


func int dia_bennet_bauorsld_condition()
{
	return TRUE;
};

func void dia_bennet_bauorsld_info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//Jesteœ farmerem czy najemnikiem?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//Nabierasz mnie, co?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//By³em po prostu ciekawy.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//Widzia³eœ kiedyœ rolnika, który kuje broñ?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//Nie.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//No to czemu zadajesz takie g³upie pytania?
};


instance DIA_BENNET_WANNAJOIN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 4;
	condition = dia_bennet_wannajoin_condition;
	information = dia_bennet_wannajoin_info;
	permanent = TRUE;
	description = "Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?";
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
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//Chcê przy³¹czyæ siê do najemników!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//Wiêc przestañ paplaæ i idŸ do Torlofa. On ciê wypróbuje.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//Przeszed³em próbê.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//Dobrze, a wiêc poprê ciê.
	};
};


instance DIA_BENNET_WANNASMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_wannasmith_condition;
	information = dia_bennet_wannasmith_info;
	permanent = TRUE;
	description = "Mo¿esz mnie nauczyæ, jak wykuæ miecz?";
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
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//Mo¿esz mnie nauczyæ, jak wykuæ miecz?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Jasne.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//Ale to ciê bêdzie trochê kosztowaæ. Powiedzmy... 30 z³otych monet.
	Info_ClearChoices(dia_bennet_wannasmith);
	Info_AddChoice(dia_bennet_wannasmith,"Mo¿e póŸniej.",dia_bennet_wannasmith_later);
	Info_AddChoice(dia_bennet_wannasmith,"Zgoda. Proszê, oto 30 sztuk z³ota dla ciebie.",dia_bennet_wannasmith_pay);
};

func void dia_bennet_wannasmith_pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//Zgoda. Proszê, oto 30 sztuk z³ota.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//To by³a bardzo dobra cena! Mo¿emy zacz¹æ, kiedy bêdziesz gotowy.
		BENNET_TEACHCOMMON = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Bennet mo¿e mnie przeszkoliæ w zakresie kowalstwa.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//Nie rób ze mnie frajera. Trzy dychy i ani grosza mniej.
	};
	Info_ClearChoices(dia_bennet_wannasmith);
};

func void dia_bennet_wannasmith_later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//Mo¿e póŸniej.
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
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//Naucz mnie, jak wykuæ miecz.
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//To doœæ proste. ZnajdŸ sobie kawa³ek surowej stali i rozgrzej go w ogniu, a¿ zacznie siê ¿arzyæ.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//Potem wykuj na kowadle ostrze.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//Najwa¿niejsze, ¿ebyœ pilnowa³, czy ostrze nie wystyg³o. Masz tylko kilka minut, ¿eby zrobiæ broñ...
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//Reszty dowiesz siê sam. To kwestia praktyki.
	};
};


instance DIA_BENNET_WANNASMITHORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 7;
	condition = dia_bennet_wannasmithore_condition;
	information = dia_bennet_wannasmithore_info;
	permanent = TRUE;
	description = "Naucz mnie, jak wykuæ broñ z magicznej rudy!";
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
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//Naucz mnie, jak wykuæ broñ z magicznej rudy!
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//Ale ty nawet nie znasz podstaw.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//Najpierw musisz siê nauczyæ, jak wykuæ porz¹dny miecz. Potem zobaczymy.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//Dopóki nie bêdziesz jednym z nas, nie zdradzê ci sekretu broni z magicznej rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//Ten sekret zna tylko paru kowali. S¹dzê, ¿e nawet rzemieœlnicy w mieœcie go nie odkryli.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//No i dobrze. Bo inaczej te szumowiny ze stra¿y miejskiej nosi³yby magiczne miecze.
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//Nie mam nic przeciwko tobie. Wydajesz siê w porz¹dku.
		};
	}
	else if(MIS_BENNET_BRINGORE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//Gdybym mia³ rudê, to mo¿e nawet bym to zrobi³.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//Ech, daj spokój. Jestem po stronie najemników i potrafiê kuæ. Czego jeszcze chcesz?
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//Mo¿esz mi powiedzieæ, jak wykuæ broñ z magicznej rudy BEZ magicznej rudy?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//No có¿...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//Tak myœla³em. Potrzebujê przynajmniej 5 bry³ek rudy. Albo mo¿esz o tym zapomnieæ.
		if(MIS_BENNET_BRINGORE == FALSE)
		{
			MIS_BENNET_BRINGORE = LOG_RUNNING;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//Wspaniale, przynios³eœ mi rudê i wiesz, jak wykuæ przyzwoity miecz.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//A wiêc jedziemy...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//Najwa¿niejsze jest jedno: niewa¿ne, czy ca³¹ broñ wyku³eœ z magicznego kruszcu, czy tylko pokry³eœ stalowe ostrze warstw¹ zaklêtej rudy. Liczy siê tylko powierzchnia.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//A poniewa¿ to cholerstwo jest takie drogie, z³ap za stalowy prêt i kilka bry³ek rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Oczywiœcie, nie wystarczy pokryæ gotowy miecz warstw¹ magicznej rudy. Ca³¹ broñ musisz wykuæ od podstaw.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//Poza tym, wszystko zale¿y od rodzaju broni, jak¹ chcesz wykonaæ.
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
	description = "Gdzie mogê znaleŸæ magiczn¹ rudê?";
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
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//Gdzie mogê znaleŸæ magiczn¹ rudê?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//Có¿, wiem tylko jedno. W kolonii górniczej na pewno jest jej trochê.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//Ale mo¿e ci siê poszczêœci i znajdziesz parê porzuconych kawa³ków w okolicy.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//Wydaje mi siê, ¿e w górach na po³udniu s¹ jakieœ stare tunele górnicze. Mo¿e tam bêdziesz mia³ szczêœcie.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//Tylko uwa¿aj, s³ysza³em, ¿e roi siê tam od bandytów.
};


instance DIA_BENNET_BRINGORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 9;
	condition = dia_bennet_bringore_condition;
	information = dia_bennet_bringore_info;
	permanent = FALSE;
	description = "Proszê – 5 bry³ek.";
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
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//Proszê - 5 bry³ek.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//Poka¿ mi!
	b_giveinvitems(other,self,itmi_nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//Naprawdê! No teraz mnie rozbroi³eœ!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//Zatrzymaj sobie dwie z nich. Przydadz¹ ci siê, jeœli bêdziesz chcia³ wykuæ sobie broñ.
	b_giveinvitems(self,other,itmi_nugget,2);
	MIS_BENNET_BRINGORE = LOG_SUCCESS;
};


var int bennet_kap2smith;
var int bennet_kap3smith;
var int bennet_kap4smith;
var int bennet_kap5smith;

func void b_saybennetlater()
{
	AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//Nie, jeszcze nie. Wróæ póŸniej.
};


instance DIA_BENNET_TEACHSMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 30;
	condition = dia_bennet_teachsmith_condition;
	information = dia_bennet_teachsmith_info;
	permanent = TRUE;
	description = "Chcia³bym wiedzieæ wiêcej o wykuwaniu magicznej broni.";
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
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//Chcia³bym wiedzieæ wiêcej o wykuwaniu magicznej broni.
	if(KAPITEL == 1)
	{
		b_saybennetlater();
	}
	else if((KAPITEL == 2) && (BENNET_KAP2SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//Mogê ciê nauczyæ, jak wykuæ miecze z magicznego kruszcu, nawet dwurêczne.
		BENNET_KAP2SMITH = TRUE;
	}
	else if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (BENNET_KAP3SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//Poprawi³em moj¹ technikê. Teraz mogê ciê nauczyæ, jak wykuæ z rudy miecze pó³torarêczne albo ciê¿kie dwurêczne.
		BENNET_KAP3SMITH = TRUE;
	}
	else if((MIS_READYFORCHAPTER4 == TRUE) && (KAPITEL < 5) && (BENNET_KAP4SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03");	//Chyba tym razem przeszed³em samego siebie. Opracowa³em dwa bitewne ostrza. To najlepsza rzecz, jak¹ do tej pory zrobi³em.
		BENNET_KAP4SMITH = TRUE;
	}
	else if((KAPITEL >= 5) && (BENNET_KAP5SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//S³uchaj, chyba mam genialny pomys³. Broñ z magicznego kruszcu, pokryta smocz¹ krwi¹. I wiem dok³adnie, jak to zrobiæ!
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//Chcesz poznaæ ten sekret?
		BENNET_KAP5SMITH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//Jak¹ broñ chcia³byœ zrobiæ?
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
	description = "Jak trafi³eœ do paki?";
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
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//Jak trafi³eœ do paki?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//Te œwinie wrzuci³y mnie do lochu. Twierdz¹, ¿e zamordowa³em paladyna.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//Ale ja tego nie zrobi³em, próbuj¹ mnie wrobiæ.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//Czemu mieliby to robiæ?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//A sk¹d mam wiedzieæ? Musisz mnie st¹d wyci¹gn¹æ!
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//Porozmawiaj z Lordem Hagenem, zburz mury, nie wiem - po prostu zrób coœ!
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Bennet zrobi³by wszystko, ¿eby wydostaæ siê z wiêzienia.");
};


instance DIA_BENNET_WHATHAPPENED(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whathappened_condition;
	information = dia_bennet_whathappened_info;
	permanent = FALSE;
	description = "Co siê sta³o?";
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
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_00");	//Co siê sta³o?
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01");	//Poszed³em do miasta z Hodgesem, ¿eby kupiæ trochê zapasów dla ch³opaków.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_02");	//Nagle us³yszeliœmy g³oœny krzyk i tupot nóg.
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_03");	//PrzejdŸ do rzeczy.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_04");	//Od razu wiedzieliœmy, ¿e coœ siê sta³o i spróbuj¹ nas z³apaæ, jeœli nas zauwa¿¹.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_05");	//Uciekaliœmy, jakby nas diabe³ goni³. Wtedy, tu¿ przed bram¹ miasta, potkn¹³em siê i rozwali³em kolano.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_06");	//Reszta jest oczywista. Stra¿ od razu mnie z³apa³a i wrzuci³a prosto do tego lochu.
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
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//Nie mam pojêcia. Jednego z paladynów, nie znam ich.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//Wiesz, jak siê nazywa³?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//Jakiœ Lothar, chyba. No nie wiem, nie jestem pewny.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//Lepiej zapytaj Lorda Hagena, on zna wszystkie szczegó³y.
	b_logentry(TOPIC_RESCUEBENNET,"Jeden z paladynów, Lothar, zosta³ zamordowany. œledztwo w tej sprawie prowadzi Lord Hagen i z pewnoœci¹ udzieli mi dok³adniejszych informacji.");
};


instance DIA_BENNET_EVIDENCE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_evidence_condition;
	information = dia_bennet_evidence_info;
	permanent = FALSE;
	description = "Maj¹ przeciwko tobie jakieœ dowody?";
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
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//Maj¹ przeciwko tobie jakieœ dowody?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//Mówi¹, ¿e maj¹ œwiadka, który wszystko widzia³.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//Wiesz, kim jest ten œwiadek?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//Nie. Wiem tylko, ¿e k³amie.
	b_logentry(TOPIC_RESCUEBENNET,"Podobno ktoœ widzia³ Benneta, gdy ten pope³nia³ zbrodniê. Jeœli chcê poznaæ prawdê, bêdê musia³ znaleŸæ tego œwiadka.");
	RESCUEBENNET_KNOWSWITNESS = TRUE;
};


instance DIA_BENNET_INVESTIGATION(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_investigation_condition;
	information = dia_bennet_investigation_info;
	permanent = FALSE;
	description = "Kto kieruje œledztwem?";
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
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//Kto kieruje œledztwem?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//Sam Lord Hagen. Poniewa¿ ofiara by³a paladynem, to sprawa podlega pod s¹d wojskowy.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//Co to znaczy?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//Nietrudno zgadn¹æ. Jeœli siê st¹d nie wydostanê, to zadyndam na sznurze.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//Musisz mi pomóc albo wybuchnie wojna. Lee tak tego nie zostawi.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//Sam siê domyœl, co to bêdzie oznaczaæ.
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
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//Stary, ju¿ myœla³em, ¿e naprawdê mnie powiesz¹!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//No có¿, wszystko siê w koñcu wyjaœni³o.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//Wspaniale. Szkoda, ¿e nie widzia³eœ twarzy tego ¿o³nierza, który mnie wyprowadza³!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//By³ taki przera¿ony, ¿e prawie narobi³ w gacie.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//A to mi przypomina, ¿e mam coœ dla ciebie.
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
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//S³yszeliœmy pog³oski o smokach w Dolinie.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//Naprawdê tam s¹!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//W porz¹dku, wierzê ci.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//W ka¿dym razie, paru ch³opaków postanowi³o wybraæ siê do Doliny.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//Zamierzaj¹ tam trochê zarobiæ.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//A co to ma wspólnego ze mn¹?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//Opracowa³em nowy rodzaj zbroi. Zbrojê ³owcy smoków!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//Jest bardziej wytrzyma³a i l¿ejsza ni¿ zwyk³e zbroje.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//A poniewa¿ to ty mnie uratowa³eœ, chcê ci daæ jej pierwszy egzemplarz. To prezent!
		CreateInvItems(self,itar_djg_l,1);
		b_giveinvitems(self,other,itar_djg_l,1);
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//S¹dzi³em, ¿e pewnie zechcesz przy³¹czyæ siê do zabawy. Jeœli wybierasz siê do Doliny, bêdzie ci potrzebny odpowiedni ekwipunek.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//A poza tym interesuj¹ mnie smocze ³uski. Prawdziwe smocze ³uski. Dam ci za nie dobr¹ cenê.
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//Ile dostanê za ka¿d¹ ³uskê?
		b_say_gold(self,other,VALUE_DRAGONSCALE);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//Tak czy inaczej, pomyœla³em, ¿e bêdziesz chcia³ wzi¹æ udzia³ w polowaniu na smoki.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//I co?
		AI_Output(self,other,"DIA_Bennet_Present_06_15");	//Proszê, weŸ ten amulet. S¹dzê, ¿e tobie bardziej siê on przyda.
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
	description = "Mam dla ciebie smocze ³uski.";
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
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//Mam dla ciebie smocze ³uski.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//Prawdziwe smocze ³uski!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//Oto twoje z³oto.
	BENNET_DRAGONSCALE_COUNTER = BENNET_DRAGONSCALE_COUNTER + Npc_HasItems(other,itat_dragonscale);
	b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_dragonscale) * VALUE_DRAGONSCALE);
	b_giveinvitems(other,self,itat_dragonscale,Npc_HasItems(other,itat_dragonscale));
	if((BENNET_DRAGONSCALE_COUNTER >= 20) && (SHOW_DJG_ARMOR_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//W porz¹dku, tyle powinno wystarczyæ. Mogê ci sprzedaæ now¹, ulepszon¹ zbrojê. Jeœli chcesz.
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
	description = "Œredni pancerz ³owcy smoków. Ochrona (broñ i strza³y) 120, 12000 sztuk z³ota.";
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
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//Chcê kupiæ zbrojê.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//Bardzo dobrze. Bêdziesz ni¹ zachwycony.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//Chyba mogê tego oczekiwaæ po takiej cenie.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//Przekonasz siê, ¿e jest warta ka¿dej sztuki z³ota.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//Masz za ma³o z³ota.
	};
};


instance DIA_BENNET_BETTERARMOR(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_betterarmor_condition;
	information = dia_bennet_betterarmor_info;
	permanent = FALSE;
	description = "Wiem, jak jeszcze bardziej ulepszyæ zbrojê.";
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
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//Wiem, jak jeszcze bardziej ulepszyæ zbrojê.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//Tak? No to mi powiedz.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//Mo¿esz pokryæ smocze ³uski magiczn¹ rud¹.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//Te¿ o tym pomyœla³em. Masz racjê.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//Moja najnowsza zbroja bije na g³owê wszystko, co do tej pory widzia³eœ. Jest lekka, ale mocna.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//Jest po prostu IDEALNA.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//Jeœli chcesz, to ci j¹ sprzedam. Nie zaproponowa³bym tego byle komu, a cena pokrywa tylko moje koszty.
};


var int bennet_dia_bennet_djg_armor_h_permanent;

instance DIA_BENNET_DJG_ARMOR_H(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_h_condition;
	information = dia_bennet_djg_armor_h_info;
	permanent = TRUE;
	description = "Ciê¿ki pancerz ³owcy smoków. Ochrona (broñ i strza³y) 150, 20000 sztuk z³ota.";
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
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//Daj mi tê zbrojê.
	if(Npc_HasItems(other,itmi_gold) >= 20000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//To najlepsza zbroja, jak¹ kiedykolwiek zrobi³em.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//Prawdziwe arcydzie³o.
		b_giveinvitems(other,self,itmi_gold,20000);
		CreateInvItems(self,itar_djg_h,1);
		b_giveinvitems(self,other,itar_djg_h,1);
		BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//Masz za ma³o z³ota.
	};
};


instance DIA_BENNET_REPAIRNECKLACE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_repairnecklace_condition;
	information = dia_bennet_repairnecklace_info;
	permanent = FALSE;
	description = "Potrafisz naprawiæ bi¿uteriê?";
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
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//Umiesz naprawiaæ bi¿uteriê?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//To zale¿y. Musia³byœ mi j¹ najpierw pokazaæ.
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//No i oczywiœcie muszê siê st¹d wydostaæ.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//Bo teraz nic nie mogê zrobiæ.
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
	description = "Mo¿esz obejrzeæ ten amulet?";
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
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//Mo¿esz obejrzeæ ten amulet?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Jasne, poka¿.
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Hmmm. Piêkna robota. Ale oprawa jest uszkodzona. Chyba da³bym radê to naprawiæ.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//Ile ci to zajmie?
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//Có¿, na razie tu ugrzêz³em. Widzisz tu jak¹œ kuŸniê?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//U siebie zrobi³bym to w jeden dzieñ. Ale najpierw musia³bym siê st¹d wydostaæ.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//Jeœli to tu zostawisz, bêdzie gotowe na jutro.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//I nic ci za to nie policzê. W koñcu wyci¹gn¹³eœ mnie z paki.
	};
	b_logentry(TOPIC_INNOSEYE,"Bennet móg³by naprawiæ amulet.");
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_GIVEINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_giveinnoseye_condition;
	information = dia_bennet_giveinnoseye_info;
	permanent = FALSE;
	description = "Oto amulet, proszê, napraw go dla mnie.";
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
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//Oto amulet, proszê, napraw go dla mnie.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//W porz¹dku. Do jutra zrobiê now¹ oprawê.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//Mo¿esz do mnie wtedy przyjœæ i go odebraæ.
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
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Tak, proszê.
		TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_REPAIRED;
		CreateInvItems(other,itmi_innoseye_broken_mis,1);
		AI_PrintScreen(PRINT_INNOSEYEGET,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//Musia³em zrobiæ now¹ oprawê dla kamienia.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//Pracowa³em przez ca³¹ noc. Wygl¹da jak nowy.
		b_logentry(TOPIC_INNOSEYE,"Bennet naprawi³ oprawê amuletu.");
		MIS_BENNET_INNOSEYEREPAIREDSETTING = LOG_SUCCESS;
		b_giveplayerxp(XP_INNOSEYEISREPAIRED);
	}
	else
	{
		b_saybennetlater();
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//Jeœli bêdziesz mi przeszkadza³, potrwa to d³u¿ej.
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
	description = "Czy mo¿esz coœ zrobiæ ze smoczych jaj?";
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
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//Czy mo¿esz coœ zrobiæ ze smoczych jaj?
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//Smocze jaja? Do licha, sk¹d je wytrzasn¹³eœ?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//Zabra³em je jaszczuroludziom.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//Poka¿.
	};
	Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//Hmmm. Bardzo twardy materia³. Idealny do wykoñczenia zbroi. To znaczy, gdyby komuœ uda³o siê je rozbiæ.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//No to co? Chcesz?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//Jasne! Dawaj.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//Ile razy jeszcze masz zamiar pokazywaæ mi te cholerstwa? Chcesz, ¿ebym je kupi³ czy nie?
	};
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//Zap³acê powiedzmy, hmmm... 300 sztuk z³ota za ka¿de jajo, które mi przyniesiesz.
	Info_ClearChoices(dia_bennet_dracheneier);
	Info_AddChoice(dia_bennet_dracheneier,"Zachowaj wiêc swoje z³oto. Myœlê, ¿e je zatrzymam.",dia_bennet_dracheneier_nein);
	Info_AddChoice(dia_bennet_dracheneier,"To s¹ smocze jaja, a nie jajka od kury.",dia_bennet_dracheneier_mehr);
	Info_AddChoice(dia_bennet_dracheneier,"Umowa stoi.",dia_bennet_dracheneier_ok);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		b_logentry(TOPIC_DRACHENEIER,"Bennet hojnie mi zap³aci za wszystkie smocze jaja, które zdo³am znaleŸæ.");
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		DRACHENEIER_ANGEBOTENXP_ONETIME = TRUE;
	};
};

func void dia_bennet_dracheneier_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//Umowa stoi.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//Dobra.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//A wiêc jeœli jakieœ znajdziesz, przynieœ mi je.
	if(BENNETSDRAGONEGGOFFER != 350)
	{
		BENNETSDRAGONEGGOFFER = 300;
	};
	CreateInvItems(self,itmi_gold,BENNETSDRAGONEGGOFFER);
	b_giveinvitems(self,other,itmi_gold,BENNETSDRAGONEGGOFFER);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//Hmmm. Mówi³eœ, ¿e znalaz³eœ je u jaszczuroludzi?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//Dok³adnie.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//Z tego, co wiem, wiêkszoœæ jaszczuroludzi mieszka w jaskiniach.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//Nie zdziwi³bym siê, gdyby w okolicznych pieczarach by³o tego wiêcej.
	b_logentry(TOPIC_DRACHENEIER,"Bennet uwa¿a, ¿e powinienem poszukaæ smoczych jaj w jaskiniach Khorinis, w których podobno ¿yj¹ jaszczuroludzie.");
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//Proszê. WeŸ tê mapê. Pomo¿e ci znaleŸæ jaskinie.
	CreateInvItems(self,itwr_map_caves_mis,1);
	b_giveinvitems(self,other,itwr_map_caves_mis,1);
	b_logentry(TOPIC_DRACHENEIER,"Aby u³atwiæ mi to zadanie, da³ mi mapê jaskiñ.");
	if(1 == 2)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_08");	//Ale najpierw musisz zdobyæ mapê jaskiñ od kartografa w mieœcie. Szkoda by³oby, gdybyœ przeoczy³ jakieœ jajo.
		b_logentry(TOPIC_DRACHENEIER,"Powinienem kupiæ u kartografa w mieœcie mapê jaskiñ. Dziêki temu bêdê mia³ pewnoœæ, ¿e nie przeoczy³em ¿adnego jaja.");
	};
	Info_ClearChoices(dia_bennet_dracheneier);
};

func void dia_bennet_dracheneier_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//To s¹ smocze jaja, a nie jajka od kury.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//W porz¹dku. Niech bêdzie 350. Nie mogê ci wiêcej daæ, bo mi siê to nie zwróci.
	BENNETSDRAGONEGGOFFER = 350;
};

func void dia_bennet_dracheneier_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//Zachowaj wiêc swoje z³oto. Myœlê, ¿e je zatrzymam.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//Powiedz, jeœli zmienisz zdanie.
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
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//Proszê, mam kolejne.
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
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//Wspaniale. Dawaj. Wszêdzie ju¿ zajrza³eœ? Na pewno jest ich wiêcej.
	}
	else if(DRAGONEGGCOUNTER <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//Sk¹d to wygrzeba³eœ? Pewnie niewiele ju¿ ich zosta³o.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//S¹dzê, ¿e ju¿ wiêcej ich nie znajdziesz. A ja mam ich tyle, ¿e nie wiem, co z nimi zrobiæ.
		TOPIC_END_DRACHENEIER = TRUE;
	};
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//Och, w porz¹dku. Oto twoje pieni¹dze.
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
	description = "Wybieram siê na wyspê i przyda³by mi siê kowal.";
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
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//Wybieram siê na wyspê i przyda³by mi siê kowal.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//I pomyœla³eœ o mnie?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//Tak. Co ty na to? Tak czy inaczej, dziêki temu byœ siê st¹d wydosta³.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//Stary, nawet w piekle nie mo¿e byæ tak paskudnie jak na farmie Onara. Wchodzê w to.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Bennet mo¿e wyruszyæ w ka¿dej chwili. Jest niezrównanym kowalem - z pewnoœci¹ móg³bym siê od niego wiele nauczyæ.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//Moja za³oga jest ju¿ kompletna.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//Wiêc odeœlij kogoœ.
	}
	else
	{
		Info_ClearChoices(dia_bennet_knowwhereenemy);
		Info_AddChoice(dia_bennet_knowwhereenemy,"Powiem ci, kiedy mi bêdziesz potrzebny.",dia_bennet_knowwhereenemy_no);
		Info_AddChoice(dia_bennet_knowwhereenemy,"A wiêc bêdziesz moim kowalem. Zobaczymy siê w porcie.",dia_bennet_knowwhereenemy_yes);
	};
};

func void dia_bennet_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//A wiêc bêdziesz moim kowalem. Zobaczymy siê w porcie.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//W porz¹dku. Do zobaczenia.
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
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//Powiem ci, kiedy mi bêdziesz potrzebny.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//Œwietnie.
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
	description = "Zamierzam znaleŸæ sobie innego kowala.";
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
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//Zamierzam znaleŸæ sobie innego kowala.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//Raz tak, raz siak. Zdecyduj siê, dobra? Daj mi znaæ, jak bêdziesz wiedzia³, czego NAPRAWDÊ chcesz.
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
	description = "Wróæ. Nie mogê znaleŸæ innego kowala.";
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
	AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//Wróæ. Nie mogê znaleŸæ innego kowala.
	AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//Dobra! W koñcu kto by siê mn¹ przejmowa³, drobiazg. Zobaczymy siê w porcie.
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

