
instance DIA_MATTEO_EXIT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 999;
	condition = dia_matteo_exit_condition;
	information = dia_matteo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_matteo_exit_condition()
{
	return TRUE;
};

func void dia_matteo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MATTEO_PICKPOCKET(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 900;
	condition = dia_matteo_pickpocket_condition;
	information = dia_matteo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_matteo_pickpocket_condition()
{
	return c_beklauen(80,150);
};

func void dia_matteo_pickpocket_info()
{
	Info_ClearChoices(dia_matteo_pickpocket);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_BACK,dia_matteo_pickpocket_back);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_PICKPOCKET,dia_matteo_pickpocket_doit);
};

func void dia_matteo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_matteo_pickpocket);
};

func void dia_matteo_pickpocket_back()
{
	Info_ClearChoices(dia_matteo_pickpocket);
};


instance DIA_MATTEO_HALLO(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_hallo_condition;
	information = dia_matteo_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_matteo_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_matteo_hallo_info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//Co mogê dla ciebie zrobiæ?
};


instance DIA_MATTEO_SELLWHAT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_sellwhat_condition;
	information = dia_matteo_sellwhat_info;
	permanent = FALSE;
	description = "Co sprzedajesz?";
};


func int dia_matteo_sellwhat_condition()
{
	return TRUE;
};

func void dia_matteo_sellwhat_info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//Co sprzedajesz?
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//Mogê ci zaproponowaæ wszystko, czego bêdziesz potrzebowaæ, ¿eby przetrwaæ w dziczy. Broñ, pochodnie, ¿ywnoœæ... nawet pancerz.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//Mam na stanie coœ specjalnego.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_03");	//Pancerz z podwójnie utwardzanej skóry zêbacza - nieu¿ywany. Zainteresowany?
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Sklep Mattea znajduje siê przy po³udniowej bramie miasta. Mo¿na tam kupiæ orê¿, ¿ywnoœæ oraz wyposa¿enie.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_MATTEO_TRADE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 800;
	condition = dia_matteo_trade_condition;
	information = dia_matteo_trade_info;
	permanent = TRUE;
	description = "Poka¿ mi swoje towary.";
	trade = TRUE;
};


func int dia_matteo_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};


var int matteo_tradenewspermanent;

func void dia_matteo_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//Poka¿ mi swoje towary.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (MATTEO_TRADENEWSPERMANENT == FALSE))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//Od czasu jak najemnicy za³atwili paladyna Lothara, inspekcje paladynów s¹ coraz bardziej nieprzyjemne.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//Mam nadziejê, ¿e jak ju¿ powiesz¹ mordercê, sytuacja siê uspokoi.
		MATTEO_TRADENEWSPERMANENT = 1;
	};
	if((KAPITEL == 5) && (MATTEO_TRADENEWSPERMANENT < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//Wygl¹da na to, ¿e tym razem paladyni traktuj¹ to naprawdê powa¿nie. Wycofali nawet swoich stra¿ników ze statku.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//Dobrze, ¿e uzupe³niasz zapasy. Kto wie, czy miasto utrzyma siê jeszcze tydzieñ.
		MATTEO_TRADENEWSPERMANENT = 2;
	};
};


var int matteo_leatherbought;

instance DIA_MATTEO_LEATHER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 850;
	condition = dia_matteo_leather_condition;
	information = dia_matteo_leather_info;
	permanent = TRUE;
	description = "Kup skórzany pancerz. Ochrona: broñ 25, strza³y 20. 250 sztuk z³ota.";
};


func int dia_matteo_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat) && (MATTEO_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_leather_info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//Dobra, daj mi pancerz.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//Na pewno ci siê spodoba.
		b_giveinvitems(self,other,itar_leather_l,1);
		MATTEO_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//Ten pancerz ma swoj¹ cenê - i jest jej wart. PrzyjdŸ, jak bêdziesz mia³ z³oto.
	};
};


instance DIA_MATTEO_PALADINE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_paladine_condition;
	information = dia_matteo_paladine_info;
	permanent = FALSE;
	description = "Co wiesz o paladynach?";
};


func int dia_matteo_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_matteo_paladine_info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//Co wiesz o paladynach?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//Od czasu, jak te bydlaki przysz³y do miasta, mam same k³opoty.
	AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//Kiedy ostatnio szed³em do górnego miasta, zatrzymali mnie stra¿nicy i zapytali, po co tam idê!
	AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//I?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//Oczywiœcie, ¿e mnie wpuœcili!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//Mia³em w mieœcie sklep, kiedy wiêkszoœæ z tych nadêtych dupków gania³a jeszcze œwinie!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//A wczoraj te bydlaki skonfiskowa³y po³owê mojego towaru!
};


instance DIA_MATTEO_CONFISCATED(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_confiscated_condition;
	information = dia_matteo_confiscated_info;
	permanent = FALSE;
	description = "Paladyni zabrali twoje towary?";
};


func int dia_matteo_confiscated_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine))
	{
		return TRUE;
	};
};

func void dia_matteo_confiscated_info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//Paladyni zabrali twoje towary?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//Wszystko, co mia³em na podwórku.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//Postawili stra¿nika przy wejœciu na podwórko.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//Jeœli mi siê poszczêœci, nie zabior¹ mi wszystkiego. Mo¿e chocia¿ zostawi¹ tê zbrojê.
};


instance DIA_MATTEO_HELPMETOOV(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmetoov_condition;
	information = dia_matteo_helpmetoov_info;
	permanent = FALSE;
	description = "Czy mo¿esz mi pomóc dostaæ siê do górnego miasta?";
};


func int dia_matteo_helpmetoov_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmetoov_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//Mo¿esz mi pomóc dostaæ siê do górnego miasta?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//Co? Co bêdziesz TAM robi³?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//Mam wa¿n¹ wiadomoœæ...
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//No, no, no. Próbowa³eœ przemkn¹æ siê ko³o stra¿ników?
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//Cz³owieku, zapomnij!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//To TYPOWE dla tych ¿ebraków!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//Nie rozumiem, dlaczego mia³bym w ogóle próbowaæ.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//Pewnie masz racjê.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//Nie wiem, jak WA¯NA jest twoja wiadomoœæ - nie obchodzi mnie to.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//Ale nawet gdybyœ powiedzia³ im, ¿e statek pe³en orków wp³yn¹³ w³aœnie do portu i tak by ciê odes³ali.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//Bo maj¹ swoje ROZKAZY.
};

func void b_matteo_preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//Wygl¹da na to, ¿e to dla ciebie wa¿ne.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//Pytanie tylko, JAK wa¿ne?
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//Do czego zmierzasz?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//Mogê ci pomóc - by³o nie by³o jestem tu jednym z najbardziej wp³ywowych ludzi.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//Ale to ciê bêdzie kosztowaæ.
};


instance DIA_MATTEO_HELPMENOW(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmenow_condition;
	information = dia_matteo_helpmenow_info;
	permanent = FALSE;
	description = "No to jak? Mo¿esz mi pomóc dostaæ siê do górnego miasta?";
};


func int dia_matteo_helpmenow_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmetoov) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmenow_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//No to jak? Mo¿esz mi pomóc dostaæ siê do górnego miasta?
	b_matteo_preis();
};


instance DIA_MATTEO_LEHRLINGLATER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_lehrlinglater_condition;
	information = dia_matteo_lehrlinglater_info;
	permanent = FALSE;
	description = "Pomó¿ mi zostaæ czeladnikiem u jednego z mistrzów!";
};


func int dia_matteo_lehrlinglater_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_lehrlinglater_info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//Pomó¿ mi zostaæ czeladnikiem u jednego z mistrzów.
	b_matteo_preis();
};


instance DIA_MATTEO_PRICEOFHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_priceofhelp_condition;
	information = dia_matteo_priceofhelp_info;
	permanent = FALSE;
	description = "Co chcesz w zamian za pomoc?";
};


func int dia_matteo_priceofhelp_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater))
	{
		return TRUE;
	};
};

func void dia_matteo_priceofhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//Co chcesz w zamian za pomoc?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//100 sztuk z³ota.
	Info_ClearChoices(dia_matteo_priceofhelp);
	Info_AddChoice(dia_matteo_priceofhelp,"To cholernie du¿o...",dia_matteo_priceofhelp_wow);
	Info_AddChoice(dia_matteo_priceofhelp,"Ty pijawko!",dia_matteo_priceofhelp_cutthroat);
};

func void b_matteo_regdichab()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//Spokojnie! Nie TWOJE z³oto mia³em na myœli.
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//Ale.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//W³aœciwie, chodzi mi o MOJE z³oto.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//Gritta, bratanica stolarza, od dawna jest mi winna pieni¹dze.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//Ta ma³a lisica krêci siê po okolicy w nowych ciuszkach - a to znaczy, ¿e ma pieni¹dze.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//Wywlek³bym jej te pieni¹dze z gard³a, ale Mistrz Thorben - stolarz - to bardzo wp³ywowy cz³owiek.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//Za³atw mi te pieni¹dze, to ci pomogê.
	MIS_MATTEO_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MATTEO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MATTEO,LOG_RUNNING);
	b_logentry(TOPIC_MATTEO,"Jeœli Matteo dostanie od siostrzenicy stolarza Thorbena, Gritty, 100 sztuk z³ota, które jest mu winna, pomo¿e mi dostaæ siê do górnego miasta.");
};

func void dia_matteo_priceofhelp_cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//Ty pijawko!
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};

func void dia_matteo_priceofhelp_wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//To cholernie du¿o...
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};


instance DIA_MATTEO_WOGRITTA(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_wogritta_condition;
	information = dia_matteo_wogritta_info;
	permanent = FALSE;
	description = "Gdzie znajdê tê Grittê?";
};


func int dia_matteo_wogritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (gritta.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_wogritta_info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//Gdzie znajdê tê Grittê?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//Tak jak powiedzia³em, to siostrzenica stolarza. Jego dom stoi przy tej ulicy. To ostatni budynek po prawej stronie przed kuŸni¹.
};


instance DIA_MATTEO_GOLDRUNNING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 500;
	condition = dia_matteo_goldrunning_condition;
	information = dia_matteo_goldrunning_info;
	permanent = TRUE;
	description = "Oto twoje 100 sztuk z³ota!";
};


func int dia_matteo_goldrunning_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_gritta_wantsmoney) || Npc_IsDead(gritta)))
	{
		return TRUE;
	};
};

func void dia_matteo_goldrunning_info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//Oto twoje 100 sztuk z³ota!
	if(Npc_IsDead(gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//Na tym z³ocie jest krew Gritty! Nie kaza³em ci jej zabijaæ!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//Nie chcê mieæ z tym nic wspólnego. Mo¿esz zapomnieæ o naszej umowie. Nigdy wiêcej nie próbuj ze mn¹ rozmawiaæ.
		MIS_MATTEO_GOLD = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
		return;
	};
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(Npc_HasItems(gritta,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//I co? Robi³a jakieœ problemy?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//Nic, o czym warto wspominaæ.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//Œwietnie! Dotrzyma³eœ swojej czêœci umowy.
		}
		else
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//Chcesz za ni¹ zap³aciæ? Hmmm - wola³bym, ¿ebyœ to z niej wycisn¹³!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//Mimo to 100 sztuk z³ota, to ci¹gle 100 sztuk z³ota.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//Dotrzyma³eœ swojej czêœci umowy.
		};
		MIS_MATTEO_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_MATTEO_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//Liczenie nie jest twoj¹ najmocniejsz¹ stron¹, co?
	};
};


instance DIA_MATTEO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_zustimmung_condition;
	information = dia_matteo_zustimmung_info;
	permanent = TRUE;
	description = "Pomó¿ mi zostaæ czeladnikiem u jednego z mistrzów!";
};


var int dia_matteo_zustimmung_perm;

func int dia_matteo_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && ((MIS_MATTEO_GOLD == LOG_RUNNING) || (MIS_MATTEO_GOLD == LOG_SUCCESS)) && (PLAYER_ISAPPRENTICE == APP_NONE) && (DIA_MATTEO_ZUSTIMMUNG_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_zustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//Pomó¿ mi zostaæ czeladnikiem u jednego z mistrzów!
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//Nie martw siê. Dotrzymam umowy.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//Inni mistrzowie us³ysz¹ o tobie same dobre rzeczy.
		b_giveplayerxp(XP_ZUSTIMMUNG);
		b_logentry(TOPIC_LEHRLING,"Jeœli zechcê zostaæ czeladnikiem, Matteo udzieli mi swojego poparcia.");
		DIA_MATTEO_ZUSTIMMUNG_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//Nie wszystko na raz. Najpierw wywi¹¿ siê z umowy i przynieœ mi z³oto!
	};
};


instance DIA_MATTEO_HOWCANYOUHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_howcanyouhelp_condition;
	information = dia_matteo_howcanyouhelp_info;
	permanent = FALSE;
	description = "Na czym DOK³ADNIE ma polegaæ twoja pomoc?";
};


func int dia_matteo_howcanyouhelp_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_howcanyouhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//Na czym DOK£ADNIE ma polegaæ twoja pomoc?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//To doœæ proste. Wykorzystam swoje wp³ywy, ¿eby jeden z mistrzów przyj¹³ ciê na czeladnika.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//A wtedy praktycznie rzecz bior¹c, bêdziesz obywatelem miasta i górna jego czêœæ stanie przed tob¹ otworem. Poza tym bêdziesz móg³ coœ zarobiæ.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Matteo mo¿e mi pomóc zostaæ czeladnikiem u jednego z mistrzów.");
};


instance DIA_MATTEO_WOALSLEHRLING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_woalslehrling_condition;
	information = dia_matteo_woalslehrling_info;
	permanent = FALSE;
	description = "Kto w takim razie mo¿e przyj¹æ mnie na czeladnika?";
};


func int dia_matteo_woalslehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_woalslehrling_info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//Kto w takim razie mo¿e przyj¹æ mnie na czeladnika?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//Mo¿e to byæ którykolwiek z mistrzów mieszkaj¹cych przy g³ównej ulicy.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//Harad kowal, Bosper ³uczarz, Thorben stolarz albo Constantino alchemik.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//Jeden z nich musi ciê przyj¹æ.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//Wa¿ne jednak, ¿eby zgodzili siê na to pozostali mistrzowie. W Khorinis panuje taki zwyczaj.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Mogê zostaæ czeladnikiem u ³uczarza Bospera, kowala Harada, stolarza Thorbena lub alchemika Constantina.");
	b_logentry(TOPIC_LEHRLING,"Zanim zostanê czeladnikiem, muszê zyskaæ poparcie pozosta³ych mistrzów.");
};


instance DIA_MATTEO_WIEZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 5;
	condition = dia_matteo_wiezustimmung_condition;
	information = dia_matteo_wiezustimmung_info;
	permanent = FALSE;
	description = "Jak uzyskam zgodê pozosta³ych mistrzów?";
};


func int dia_matteo_wiezustimmung_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_woalslehrling) || Npc_KnowsInfo(other,dia_matteo_warumnichtbeidir)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_wiezustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//Jak uzyskam zgodê pozosta³ych mistrzów?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//Musisz ich do tego przekonaæ. IdŸ z nimi porozmawiaæ.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//Wystarczy jednak, ¿ebyœ mia³ przeciw sobie wiêcej ni¿ jednego z nich, a nie bêdziesz mia³ szans! Wiêc lepiej siê zachowuj!
	b_logentry(TOPIC_LEHRLING,"Aby zyskaæ poparcie pozosta³ych mistrzów, muszê dowieœæ swojej wartoœci.");
};


instance DIA_MATTEO_WARUMNICHTBEIDIR(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_warumnichtbeidir_condition;
	information = dia_matteo_warumnichtbeidir_info;
	permanent = FALSE;
	description = "A dlaczego TY mnie nie weŸmiesz na czeladnika?";
};


func int dia_matteo_warumnichtbeidir_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_warumnichtbeidir_info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//A dlaczego TY mnie nie weŸmiesz na czeladnika?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//Ja nie mam nic przeciwko, ale inni mistrzowie nie zgadzaj¹ siê.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//Ostatnio przyj¹³em innego czeladnika.
};


instance DIA_MATTEO_OTHERWAY(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_otherway_condition;
	information = dia_matteo_otherway_info;
	permanent = FALSE;
	description = "Czy jest jakiœ inny sposób, ¿eby dostaæ siê do górnego miasta?";
};


func int dia_matteo_otherway_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_otherway_info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//Czy jest jakiœ inny sposób, ¿eby dostaæ siê do górnego miasta?
	AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//Mo¿e... dam ci znaæ, jak coœ wymyœlê.
};


instance DIA_MATTEO_MINENANTEIL(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_minenanteil_condition;
	information = dia_matteo_minenanteil_info;
	description = "Wœród rzeczy na sprzeda¿ zauwa¿y³em udzia³y w kopalni.";
};


func int dia_matteo_minenanteil_condition()
{
	if((other.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};

func void dia_matteo_minenanteil_info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//Wœród rzeczy na sprzeda¿ zauwa¿y³em udzia³y w kopalni. Od kogo je masz?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//Udzia³y w kopalni? Eeee. Sk¹d siê wziê³y? Nie mam pojêcia, sk¹d je mam. Naprawdê, Panie.
	b_giveplayerxp(XP_AMBIENT);
};

