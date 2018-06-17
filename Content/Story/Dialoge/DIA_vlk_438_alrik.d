
instance DIA_ALRIK_EXIT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 999;
	condition = dia_alrik_exit_condition;
	information = dia_alrik_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alrik_exit_condition()
{
	return TRUE;
};

func void dia_alrik_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALRIK_PICKPOCKET(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 900;
	condition = dia_alrik_pickpocket_condition;
	information = dia_alrik_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_alrik_pickpocket_condition()
{
	return c_beklauen(55,50);
};

func void dia_alrik_pickpocket_info()
{
	Info_ClearChoices(dia_alrik_pickpocket);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_BACK,dia_alrik_pickpocket_back);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_PICKPOCKET,dia_alrik_pickpocket_doit);
};

func void dia_alrik_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alrik_pickpocket);
};

func void dia_alrik_pickpocket_back()
{
	Info_ClearChoices(dia_alrik_pickpocket);
};


instance DIA_ALRIK_HALLO(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_hallo_condition;
	information = dia_alrik_hallo_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_alrik_hallo_condition()
{
	return TRUE;
};

func void dia_alrik_hallo_info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//Co tu robisz?
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//To mój dom!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//A co mam robiæ? Pijê.
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//Idê na przechadzkê.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//Ale jeœli pytasz, co robiê przez ca³y dzieñ, to ci powiem - organizujê walki.
};


instance DIA_ALRIK_YOUFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_youfight_condition;
	information = dia_alrik_youfight_info;
	permanent = FALSE;
	description = "Ty organizujesz walki?";
};


func int dia_alrik_youfight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_hallo))
	{
		return TRUE;
	};
};

func void dia_alrik_youfight_info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//Ty organizujesz walki?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Codziennie, od po³udnia do wieczora.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//Dok³adnie tutaj!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//Za magazynem w dzielnicy portowej - wszêdzie dobrze, ale w domu najlepiej!
};


instance DIA_ALRIK_REGELN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_regeln_condition;
	information = dia_alrik_regeln_info;
	permanent = FALSE;
	description = "Jakie s¹ zasady walk?";
};


func int dia_alrik_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_regeln_info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//Jakie s¹ zasady walk?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Ca³kiem proste: mo¿na u¿ywaæ ka¿dej normalnej broni. ¯adnych ³uków ani kusz, i ¯ADNEJ magii!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//Walczymy, dopóki jeden nie padnie. Kiedy jeden z walcz¹cych pada na ziemiê, walka siê koñczy. Zrozumia³eœ?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//Kto wyjdzie z naro¿nika, ten odpada! Wiêc jeœli siê wycofasz, ja wygrywam!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//Stawka wynosi 50 z³otych monet. Jeœli wygrasz, zabierasz stówê. Jeœli nie - no có¿ - wtedy twoje pieni¹dze znikaj¹.
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Zrozumia³eœ?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Jasne!
};

func void b_alrik_again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//Jak leci? Chcesz znowu stan¹æ przeciwko mnie? S¹dzê, ¿e w miêdzyczasie sta³em siê lepszy...
};


instance DIA_ALRIK_NEWFIGHTS3(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights3_condition;
	information = dia_alrik_newfights3_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights3_condition()
{
	if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN <= 6))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights3_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,4);
	b_alrik_again();
};


instance DIA_ALRIK_NEWFIGHTS5(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights5_condition;
	information = dia_alrik_newfights5_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights5_condition()
{
	if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN <= 9))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights5_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,6);
	b_alrik_again();
};

func void b_alrik_enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//Myœlê, ¿e ju¿ doœæ wygra³eœ.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Nie zrozum mnie Ÿle, ale we ³bie nadal mi siê krêci po poprzednim razie...
};

func void b_alrik_comebacklater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Wróæ do mnie póŸniej. A w miêdzyczasie trochê potrenujê...
};


instance DIA_ALRIK_WANNAFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_wannafight_condition;
	information = dia_alrik_wannafight_info;
	permanent = TRUE;
	description = "Chcê z tob¹ walczyæ!";
};


func int dia_alrik_wannafight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_regeln) && (self.aivar[AIV_ARENAFIGHT] == AF_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_wannafight_info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//Chcê z tob¹ walczyæ!
	Info_ClearChoices(dia_alrik_wannafight);
	if(((ALRIK_ARENAKAMPFVERLOREN > 0) && (Npc_HasItems(self,itmw_alrikssword_mis) == 0)) || (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if(MIS_ALRIK_SWORD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//Najpierw oddaj mi mój miecz. Wtedy zobaczymy...
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Nie, nie. Zanim znowu zmierzê siê z tob¹, potrzebna mi lepsza broñ!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//Kilka dni temu musia³em sprzedaæ swój miecz.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//Z tym maleñstwem jestem niepokonany! Jeœli je odzyskasz, znowu siê z tob¹ zmierzê!
			ALRIK_VOMSCHWERTERZAEHLT = TRUE;
			Log_CreateTopic(TOPIC_ALRIKSCHWERT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ALRIKSCHWERT,LOG_RUNNING);
			b_logentry(TOPIC_ALRIKSCHWERT,"Arik sprzeda³ swój miecz kupcowi imieniem Jora. Zgodzi siê ze mn¹ walczyæ tylko pod warunkiem, ¿e odzyskam jego broñ.");
		};
	}
	else if((KAPITEL <= 2) && (ALRIK_ARENAKAMPFVERLOREN > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//Chyba na razie wystarczy...
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Zróbmy krótk¹ przerwê.
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN > 6))
	{
		b_alrik_enough();
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN > 9))
	{
		b_alrik_enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Poza tym zgarn¹³em ju¿ doœæ z³ota.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//Rezygnujê, zamierzam zatrzymaæ siê gdzieœ w mieœcie...
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Kto wie, mo¿e otworzê sklep z broni¹...
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//Masz 50 sztuk z³ota?
		Info_ClearChoices(dia_alrik_wannafight);
		Info_AddChoice(dia_alrik_wannafight,"Nie...",dia_alrik_wannafight_nogold);
		if(Npc_HasItems(other,itmi_gold) >= 50)
		{
			Info_AddChoice(dia_alrik_wannafight,"Proszê bardzo...",dia_alrik_wannafight_gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//Walczê tylko od po³udnia do wieczora.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//Walka ma jakiœ sens tylko wtedy, kiedy jest doœæ widzów obstawiaj¹cych zak³ady.
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//Jest ju¿ za póŸno. Wróæ jutro w po³udnie!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//Jest jeszcze za wczeœnie, przyjdŸ póŸniej!
		};
	};
};

func void dia_alrik_wannafight_gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Proszê bardzo...
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//Mamy nowego zawodnika!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//Zak³ady obstawione...
	Npc_RemoveInvItems(self,itmi_gold,Npc_HasItems(self,itmi_gold));
	CreateInvItems(self,itmi_gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Jesteœ gotowy?
	self.aivar[AIV_ARENAFIGHT] = AF_RUNNING;
	ALRIK_KAEMPFE = ALRIK_KAEMPFE + 1;
	Info_ClearChoices(dia_alrik_wannafight);
	Info_AddChoice(dia_alrik_wannafight,"Chwileczkê...",dia_alrik_wannafight_moment);
	Info_AddChoice(dia_alrik_wannafight,"No chodŸ!",dia_alrik_wannafight_now);
};

func void dia_alrik_wannafight_nogold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Nie...
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//No to je przynieœ! Bez stawki nie ma walki!
	Info_ClearChoices(dia_alrik_wannafight);
};

func void dia_alrik_wannafight_now()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//No chodŸ!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//No to zobaczymy, na co ciê staæ!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_alrik_wannafight_moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//Chwileczkê...
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//Spokojnie... Ja zaczynam!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ALRIK_AFTERFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_afterfight_condition;
	information = dia_alrik_afterfight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_alrik_afterfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ARENAFIGHT] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,zs_talk))
		{
			return TRUE;
		};
	};
};

func void dia_alrik_afterfight_info()
{
	if((self.aivar[AIV_LASTPLAYERAR] == AR_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//Och, stary! Masz niez³y cios.
			if(Npc_HasItems(self,itmi_gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Oto twoje 100 sztuk z³ota! Zas³u¿y³eœ na nie!
				b_giveinvitems(self,other,itmi_gold,100);
			}
			else if(Npc_HasItems(self,itmi_gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//Jak widzê, ju¿ wzi¹³eœ swoje z³oto.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//Mog³eœ zaczekaæ, a¿ ci je dam - dotrzymujê s³owa!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//Przetrz¹sn¹³eœ mi kieszenie, kiedy by³em nieprzytomny!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//To z³y zwyczaj, stary! Niewa¿ne, pieni¹dze i tak by³y twoje. Tu jest reszta.
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
			};
			ALRIK_ARENAKAMPFVERLOREN = ALRIK_ARENAKAMPFVERLOREN + 1;
		}
		else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//To by³a dobra walka. Twoja stawka przepad³a - nie ¿a³uj jej, to dla dobra sprawy!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Hej, mówi³em, kto opuszcza naro¿nik, przegrywa walkê! Jeœli chcesz spróbowaæ jeszcze raz, jestem do twojej dyspozycji!
		};
		if(ALRIK_KAEMPFE == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//I jeszcze jedno: nikt nie rozmawia o tym, co siê dzieje za magazynem.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//Stra¿ pakuje za kratki ka¿dego, kto siê tu zjawia. Ci ch³opcy nie lubi¹ walk za pieni¹dze.
			};
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ARENAFIGHT] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//Walka by³a skoñczona, ty w³óczêgo!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//Nie podoba mi siê, kiedy ktoœ nie przestrzega zasad.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Wynoœ siê st¹d!
		}
		else
		{
			if(ALRIK_KAEMPFE == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//Skoro chcia³eœ walczyæ ze mn¹, wystarczy³o mnie wyzwaæ.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//Skoro chcia³eœ walczyæ ze mn¹ jeszcze raz, wystarczy³o mnie wyzwaæ!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//Nie chcê mieæ nic wspólnego z mêtami takimi jak ty! Zje¿d¿aj!
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_ALRIK_DUWOHNST(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_duwohnst_condition;
	information = dia_alrik_duwohnst_info;
	permanent = FALSE;
	description = "'Mieszkasz' za tym magazynem?";
};


func int dia_alrik_duwohnst_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_duwohnst_info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//'Mieszkasz' za tym magazynem?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//To tylko chwilowe. Kiedy bêdziesz mia³ tyle z³ota co ja, bêdzie ciê staæ na trochê luksusu!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//By³em instruktorem musztry w armii, ale rzuci³em to, ¿eby zaznaæ przygód i poszukaæ szczêœcia gdzie indziej.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//A teraz ugrzêz³em w tej dziurze. Moje ostatnie 100 sztuk z³ota zniknê³o w kieszeniach stra¿ników przy bramie.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//Wiêc staram siê znowu zdobyæ trochê pieniêdzy. Musia³em nawet sprzedaæ swój miecz.
	ALRIK_VOMSCHWERTERZAEHLT = TRUE;
};


instance DIA_ALRIK_WERSCHWERT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_werschwert_condition;
	information = dia_alrik_werschwert_info;
	permanent = FALSE;
	description = "Komu sprzeda³eœ ten miecz?";
};


func int dia_alrik_werschwert_condition()
{
	if((ALRIK_VOMSCHWERTERZAEHLT == TRUE) && (MIS_ALRIK_SWORD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_alrik_werschwert_info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//Komu sprzeda³eœ ten miecz?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//Wymieni³em go z handlarzem na targowisku na parê drobiazgów.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//Facet nazywa siê Jora. Pochodnie i trochê ¿arcia, które da³ mi w zamian, dawno ju¿ zu¿y³em.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//Raczej nie odda mi go za darmo...
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//To stary miecz. Nie bêdzie za niego du¿o chcia³. Pomyœl o tych pieni¹dzach jako o dodatkowej stawce.
	MIS_ALRIK_SWORD = LOG_RUNNING;
};


var int alrik_einmalschwertbonus;

instance DIA_ALRIK_HAVESWORD(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_havesword_condition;
	information = dia_alrik_havesword_info;
	permanent = TRUE;
	description = "Mam twój miecz!";
};


func int dia_alrik_havesword_condition()
{
	if(Npc_HasItems(other,itmw_alrikssword_mis) > 0)
	{
		return TRUE;
	};
};

func void dia_alrik_havesword_info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//Mam twój miecz!
	b_giveinvitems(other,self,itmw_alrikssword_mis,1);
	if(MIS_ALRIK_SWORD != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//Ach! To znacznie lepsze, ni¿ wymachiwanie starym kijem!
		MIS_ALRIK_SWORD = LOG_SUCCESS;
		b_giveplayerxp(XP_ALRIKSSWORD);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//Dobrze! Ciekaw jestem, kiedy odwa¿ysz siê wyzwaæ mnie ponownie!
	};
	if(ALRIK_EINMALSCHWERTBONUS == FALSE)
	{
		b_addfightskill(self,NPC_TALENT_1H,20);
		ALRIK_EINMALSCHWERTBONUS = TRUE;
	};
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_ALRIK_KRIEG(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_krieg_condition;
	information = dia_alrik_krieg_info;
	permanent = FALSE;
	description = "Co wiesz o wojnie z orkami?";
};


func int dia_alrik_krieg_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_krieg_info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//Co wiesz o wojnie z orkami?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//Nie mam wiele do powiedzenia. Wojna trwa³a zdecydowanie za d³ugo.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//Proœci ludzie g³oduj¹. Wszêdzie wybuchaj¹ ch³opskie bunty, które Król t³umi bez litoœci.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//Ale jest ich za du¿o. Jeœli wojna siê szybko nie skoñczy, to bêdzie koniec królestwa.
};


var int alrik_vorauserzaehlt;

instance DIA_ALRIK_AUSBILDEN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_ausbilden_condition;
	information = dia_alrik_ausbilden_info;
	permanent = TRUE;
	description = "Czy mo¿esz mnie wyszkoliæ?";
};


func int dia_alrik_ausbilden_condition()
{
	if((Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE)) && (ALRIK_TEACH1H == FALSE))
	{
		return TRUE;
	};
};

func void dia_alrik_ausbilden_info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//Czy mo¿esz mnie wyszkoliæ?
	if((ALRIK_KAEMPFE == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//Jeœli naprawdê chcesz nauczyæ siê walczyæ, to zmierz siê ze mn¹. Ta lekcja bêdzie za darmo.
		ALRIK_VORAUSERZAEHLT = TRUE;
	}
	else
	{
		if(ALRIK_VORAUSERZAEHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//Dotrzymujê s³owa. Nauczê ciê wszystkiego, co umiem - jeœli jesteœ wystarczaj¹co doœwiadczony.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//Jasne, pod warunkiem, ¿e masz doœæ doœwiadczenia.
		};
		ALRIK_TEACH1H = TRUE;
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Alrik, który krêci siê za magazynem w dzielnicy portowej, mo¿e mnie nauczyæ walki orê¿em jednorêcznym.");
	};
};


var int alrik_merke_1h;

instance DIA_ALRIK_TEACH(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_teach_condition;
	information = dia_alrik_teach_info;
	permanent = TRUE;
	description = "Wyszkol mnie we w³adaniu mieczem!";
};


func int dia_alrik_teach_condition()
{
	if(ALRIK_TEACH1H == TRUE)
	{
		return TRUE;
	};
};

func void dia_alrik_teach_info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//Wyszkol mnie we w³adaniu mieczem!
	ALRIK_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_back()
{
	if(other.hitchance[NPC_TALENT_1H] >= (60 - 30))
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//Ju¿ nie jesteœ pocz¹tkuj¹cy!
	}
	else if(other.hitchance[NPC_TALENT_1H] > ALRIK_MERKE_1H)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//Jesteœ ju¿ lepszy. Nied³ugo staniesz siê prawdziwym wojownikiem!
	};
	Info_ClearChoices(dia_alrik_teach);
};

func void dia_alrik_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

