
instance DIA_ADDON_EROL_EXIT(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 999;
	condition = dia_addon_erol_exit_condition;
	information = dia_addon_erol_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_erol_exit_condition()
{
	return TRUE;
};

func void dia_addon_erol_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EROL_PICKPOCKET(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 900;
	condition = dia_addon_erol_pickpocket_condition;
	information = dia_addon_erol_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_erol_pickpocket_condition()
{
	return c_beklauen(43,42);
};

func void dia_addon_erol_pickpocket_info()
{
	Info_ClearChoices(dia_addon_erol_pickpocket);
	Info_AddChoice(dia_addon_erol_pickpocket,DIALOG_BACK,dia_addon_erol_pickpocket_back);
	Info_AddChoice(dia_addon_erol_pickpocket,DIALOG_PICKPOCKET,dia_addon_erol_pickpocket_doit);
};

func void dia_addon_erol_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_erol_pickpocket);
};

func void dia_addon_erol_pickpocket_back()
{
	Info_ClearChoices(dia_addon_erol_pickpocket);
};


instance DIA_ADDON_EROL_HALLO(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_hallo_condition;
	information = dia_addon_erol_hallo_info;
	description = "Co si� dzieje?";
};


func int dia_addon_erol_hallo_condition()
{
	return TRUE;
};

func void dia_addon_erol_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Hallo_15_00");	//Co si� dzieje?
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_01");	//Co si� dzieje? Popatrz tylko pod most, a zrozumiesz.
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_02");	//Co� takiego widz� pierwszy raz w �yciu. Czemu nikt nie przep�dzi tych obwiesi�w?
};


instance DIA_ADDON_EROL_WHAT(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_what_condition;
	information = dia_addon_erol_what_info;
	description = "Co si� sta�o?";
};


func int dia_addon_erol_what_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_erol_what_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_15_00");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Addon_Erol_what_10_01");	//Jecha�em do miasta z moimi pomocnikami, kiedy nagle, ni st�d, ni zow�d, wyskoczyli na nas uzbrojeni bandyci.
	AI_Output(self,other,"DIA_Addon_Erol_what_10_02");	//Na szcz�cie umiem si� broni�, bo podzieli�bym los pozosta�ych.
	Log_CreateTopic(TOPIC_ADDON_EROL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_EROL,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_EROL,"Kupiec Erol zosta� obrabowany przez bandyt�w i straci� wszystkie towary. Bandyci z mostu ko�o gospody 'Martwa Harpia' nadal maj� jego cenne kamienne tabliczki. Erol chce je odzyska�.");
	MIS_ADDON_EROL_BANDITSTUFF = LOG_RUNNING;
	Info_ClearChoices(dia_addon_erol_what);
	Info_AddChoice(dia_addon_erol_what,"Ten sprz�t pod mostem nale�y do ciebie?",dia_addon_erol_what_dein);
	Info_AddChoice(dia_addon_erol_what,"Kto ci� napad�?",dia_addon_erol_what_wer);
};

func void dia_addon_erol_what_back()
{
	Info_ClearChoices(dia_addon_erol_what);
};

func void dia_addon_erol_what_dein()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_dein_15_00");	//Ten sprz�t pod mostem nale�y do ciebie?
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_01");	//Tak. W�zek, towary... Wszystko.
	if(Npc_HasItems(other,itmi_erolskelch) > 0)
	{
		AI_Output(other,self,"DIA_Addon_Erol_what_dein_Add_15_00");	//Znalaz�em troch� tego po drodze.
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_01");	//Mo�esz sobie zatrzyma� te bibeloty. Nie s� du�o warte.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_02");	//Nic z tego nie ma dla mnie du�ej warto�ci.
	};
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_02");	//Jedyn� naprawd� cenn� rzecz� by�y trzy kamienne tabliczki, kt�re te dranie oczywi�cie zrabowa�y!
	Info_AddChoice(dia_addon_erol_what,DIALOG_BACK,dia_addon_erol_what_back);
	Info_AddChoice(dia_addon_erol_what,"Kamienne tabliczki?",dia_addon_erol_what_was);
};

func void dia_addon_erol_what_was()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_Was_15_00");	//Kamienne tabliczki?
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_01");	//Jeden z miejskich Mag�w Wody chcia� je ode mnie kupi�, a ja obieca�em mu je dostarczy�.
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_02");	//Musz� je za wszelk� cen� odzyska�. Inaczej moja reputacja legnie w gruzach.
	Info_AddChoice(dia_addon_erol_what,"Gdzie znalaz�e� te tabliczki?",dia_addon_erol_what_woher);
	Info_AddChoice(dia_addon_erol_what,"Czemu ten mag tak bardzo si� nimi interesuje?",dia_addon_erol_what_kdw);
};

func void dia_addon_erol_what_kdw()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_KDW_15_00");	//Czemu ten mag tak bardzo si� nimi interesuje?
	AI_Output(self,other,"DIA_Addon_Erol_what_KDW_10_01");	//Powiedzia�, �e potrzebne mu s� do bada� i poprosi�, �ebym rozejrza� si� za innymi tego typu przedmiotami.
};

func void dia_addon_erol_what_woher()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_woher_15_00");	//Gdzie znalaz�e� te tabliczki?
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_01");	//Cz�� z nich znalaz�em w mauzoleach i podobnych budowlach, a cz�� - w jaskiniach.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_02");	//Wi�kszo�� sprzeda�em temu magowi z Khorinis.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_03");	//W tych okolicach ci�ko si� na nie natkn��. Najcz�ciej znajdowa�em je na p�nocny wsch�d od miasta.
	Info_AddChoice(dia_addon_erol_what,"Czemu po prostu nie poszukasz innych?",dia_addon_erol_what_neue);
};

func void dia_addon_erol_what_neue()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_neue_15_00");	//Czemu po prostu nie poszukasz innych?
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_01");	//Niestety, podczas walki z bandytami skr�ci�em kostk�.
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_02");	//Mog� chodzi�, ale podr�owanie i zwiedzanie jaski� raczej odpada.
};

func void dia_addon_erol_what_wer()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_wer_15_00");	//Kto ci� napad�?
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_01");	//Bandyci, kt�by inny? Czaj� si� w pobli�u tego mostu.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_02");	//Kiedy kto� chce przejecha�, wpada w ich sid�a.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_03");	//Wiedzia�em, �e most jest ma�o bezpieczny, wi�c chcia�em si� przeprawi� pod nim.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_04");	//Ale widz�, �e mieli wielk� chrapk� na moje towary.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_05");	//Ci dranie skoczyli na nas z mostu, prosto na w�z.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_06");	//Powinienem by� pr�bowa� przekra�� si� pod os�on� nocy.
};


instance DIA_ADDON_EROL_FERNANDOSWEAPONS(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_fernandosweapons_condition;
	information = dia_addon_erol_fernandosweapons_info;
	description = "Potrzebuj� informacji o dostawie broni dla bandyt�w.";
};


func int dia_addon_erol_fernandosweapons_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_erol_fernandosweapons_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_15_00");	//Potrzebuj� informacji o dostawie broni dla bandyt�w.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_01");	//Dostawie broni? Tak, s�ysza�em o tym. Jaka� �winia z miasta sprzeda�a im jej tyle, �e ledwie mogli wszystko unie��.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_02");	//Ci, kt�rzy na mnie napadli, to cz�� ich szajki.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_03");	//Pozostali musieli schowa� si� gdzie� na p�askowy�u w pobli�u farmy Bengara.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_04");	//Mo�e pr�bowali pokona� prze��cz...
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
	Info_AddChoice(dia_addon_erol_fernandosweapons,DIALOG_BACK,dia_addon_erol_fernandosweapons_back);
	Info_AddChoice(dia_addon_erol_fernandosweapons,"Gdzie jest ten p�askowy�?",dia_addon_erol_fernandosweapons_bengar);
};

func void dia_addon_erol_fernandosweapons_bengar()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_bengar_15_00");	//Gdzie jest ten p�askowy�?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_01");	//W centrum wyspy Khorinis znajduje si� "Martwa Harpia", gospoda nale��ca do Orlana.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_02");	//Od niej prowadzi �cie�ka na po�udnie, wiod�ca w�a�nie na �w p�askowy� i do G�rniczej Doliny.
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
};

func void dia_addon_erol_fernandosweapons_back()
{
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
};


instance DIA_ADDON_EROL_STONEPLATES(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_stoneplates_condition;
	information = dia_addon_erol_stoneplates_info;
	permanent = TRUE;
	description = "Je�li chodzi o te tabliczki...";
};


func int dia_addon_erol_stoneplates_condition()
{
	if(MIS_ADDON_EROL_BANDITSTUFF == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int stoneplatescounter;
const int ADDON_EROLSSTONEPLATESOFFER = 10;

func void dia_addon_erol_stoneplates_info()
{
	var int stoneplatescount;
	var int xp_addon_bringstoneplates;
	var int stoneplatesgeld;
	AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_00");	//Je�li chodzi o te tabliczki...
	if(Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1)
	{
		stoneplatescount = Npc_HasItems(other,itwr_stoneplatecommon_addon);
		if(stoneplatescount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_01");	//Znalaz�em jedn� z nich...
			b_giveplayerxp(XP_ADDON_BRINGSTONEPLATE);
			b_giveinvitems(other,self,itwr_stoneplatecommon_addon,1);
			STONEPLATESCOUNTER = STONEPLATESCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_02");	//Znalaz�em kilka...
			if((stoneplatescount + STONEPLATESCOUNTER) >= 3)
			{
				b_giveinvitems(other,self,itwr_stoneplatecommon_addon,3 - STONEPLATESCOUNTER);
				xp_addon_bringstoneplates = (3 - STONEPLATESCOUNTER) * XP_ADDON_BRINGSTONEPLATE;
				STONEPLATESCOUNTER = 3;
			}
			else
			{
				b_giveinvitems(other,self,itwr_stoneplatecommon_addon,stoneplatescount);
				xp_addon_bringstoneplates = stoneplatescount * XP_ADDON_BRINGSTONEPLATE;
				STONEPLATESCOUNTER = STONEPLATESCOUNTER + stoneplatescount;
			};
			b_giveplayerxp(xp_addon_bringstoneplates);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_03");	//Wielkie dzi�ki.
		if(STONEPLATESCOUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_04");	//Teraz brakuje mi tylko dw�ch.
		}
		else if(STONEPLATESCOUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_05");	//Brakuje jeszcze jednej.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_06");	//To ju� wszystkie. Teraz b�d� m�g� dobi� targu z magiem i wr�ci� do domu.
			MIS_ADDON_EROL_BANDITSTUFF = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_07");	//Oczywi�cie zap�ac� ci za fatyg�.
		stoneplatesgeld = ADDON_EROLSSTONEPLATESOFFER * Npc_HasItems(self,itwr_stoneplatecommon_addon);
		CreateInvItems(self,itmi_gold,stoneplatesgeld);
		b_giveinvitems(self,other,itmi_gold,stoneplatesgeld);
		Npc_RemoveInvItems(self,itwr_stoneplatecommon_addon,Npc_HasItems(self,itwr_stoneplatecommon_addon));
		if(MIS_ADDON_EROL_BANDITSTUFF == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_08");	//Wracam do domu. Chcesz si� do mnie przy��czy�?
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_09");	//Mo�e zechcesz co� u mnie kupi�, je�li dotrzemy na miejsce?
			AI_StopProcessInfos(self);
			AI_UseMob(self,"BENCH",-1);
			AI_GotoWP(self,"NW_TAVERN_TO_FOREST_03");
			Npc_ExchangeRoutine(self,"Start");
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
	}
	else if(c_schasmagicstoneplate() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_10");	//Mam tu co� takiego...
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_11");	//Nie, to nie to. Tamte tabliczki by�y nas�czone magi�.
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_12");	//Mag, z kt�rym ubi�em interes, nie b�dzie zainteresowany czym� takim.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_13");	//Ile ich brakuje?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_14");	//Aby ocali� dobre imi�, potrzebuj� trzech.
	};
};


instance DIA_ADDON_EROL_BUERGER(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_buerger_condition;
	information = dia_addon_erol_buerger_info;
	description = "Jeste� obywatelem miasta?";
};


func int dia_addon_erol_buerger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_erol_buerger_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Buerger_15_00");	//Jeste� obywatelem miasta?
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_01");	//Tak, ale to wkr�tce si� zmieni. Nie cierpi� tych bufon�w z g�rnego miasta.
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_02");	//Kiedy� by�em wp�ywow� osob� w mie�cie, ale to by�o dawno temu.
};


instance DIA_ADDON_EROL_PRETEACH(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_preteach_condition;
	information = dia_addon_erol_preteach_info;
	description = "Uda�o ci si� przep�dzi� bandyt�w?";
};


func int dia_addon_erol_preteach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what))
	{
		return TRUE;
	};
};

func void dia_addon_erol_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_00");	//Uda�o ci si� przep�dzi� bandyt�w?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_01");	//Tak, ale na pewno wci�� czaj� si� w pobli�u mostu.
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_02");	//Mo�esz mnie nauczy� silniej uderza�?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_03");	//Pewnie.
	EROL_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_OUTTEACHER,LOG_NOTE);
	b_logentry(TOPIC_OUTTEACHER,LOGTEXT_ADDON_EROL_TEACH);
};


instance DIA_ADDON_EROL_PRETRADE(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 100;
	condition = dia_addon_erol_pretrade_condition;
	information = dia_addon_erol_pretrade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
};


func int dia_addon_erol_pretrade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") > 2000))
	{
		return TRUE;
	};
};

func void dia_addon_erol_pretrade_info()
{
	b_say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_00");	//Niestety, nie mog� ci nic sprzeda�. Ca�y m�j towar le�y w tej chwili pod mostem.
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_01");	//Wr�c� do interesu dopiero po powrocie do domu.
	if(MIS_ADDON_EROL_BANDITSTUFF != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_02");	//Ale nie wr�c�, p�ki nie odzyskam swoich tabliczek.
	};
};


instance DIA_ADDON_EROL_SLD(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_sld_condition;
	information = dia_addon_erol_sld_info;
	description = "To twoja chata?";
};


func int dia_addon_erol_sld_condition()
{
	if(Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 2000)
	{
		return TRUE;
	};
};


var int erol_isathome;

func void dia_addon_erol_sld_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_00");	//To twoja chata?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_01");	//Tak. O co chodzi?
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_02");	//Nie masz �adnych k�opot�w z najemnikami?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_03");	//Nie czepiaj� si� mnie, a ja nie mieszam si� do ich spraw.
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_04");	//S� dobrymi klientami i za niewielk� op�at� pilnuj� mojej chaty, gdy mnie tu nie ma.
	b_giveplayerxp(XP_AMBIENT);
	if(EROL_ISATHOME == FALSE)
	{
		Npc_ExchangeRoutine(self,"HOME");
		EROL_ISATHOME = TRUE;
	};
};


instance DIA_ADDON_EROL_TRADE(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 100;
	condition = dia_addon_erol_trade_condition;
	information = dia_addon_erol_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
};


func int dia_addon_erol_trade_condition()
{
	if((MIS_ADDON_EROL_BANDITSTUFF == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		return TRUE;
	};
};


var int dia_addon_erol_trade_onetime;

func void dia_addon_erol_trade_info()
{
	b_givetradeinv(self);
	b_say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_Trade_10_00");	//Niestety, asortyment moich towar�w nie jest zbyt du�y.
	if(EROL_ISATHOME == FALSE)
	{
		Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
		b_logentry(TOPIC_OUTTRADER,LOGTEXT_ADDON_EROLTRADE);
		Npc_ExchangeRoutine(self,"Home");
		EROL_ISATHOME = TRUE;
	};
};


instance DIA_ADDON_EROL_TEACH(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 99;
	condition = dia_addon_erol_teach_condition;
	information = dia_addon_erol_teach_info;
	permanent = TRUE;
	description = "Poka� mi, jak walczy� z wi�ksz� si��.";
};


func int dia_addon_erol_teach_condition()
{
	if(EROL_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_erol_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Teach_15_00");	//Poka� mi, jak walczy� z wi�ksz� si��.
	if(MIS_ADDON_EROL_BANDITSTUFF != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//Owszem, ale nie za darmo.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Pom� mi zachowa� dobre imi� i znajd� moje kamienne tabliczki.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_03");	//Wtedy poka�� ci, jak wykorzysta� sw� si�� w walce.
	}
	else if(EROL_BONUS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_00");	//Dobrze. Patrz uwa�nie. To prosta, lecz u�yteczna sztuczka.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_01");	//Kiedy uderzasz, u�ywaj si�y ca�ego cia�a, nie tylko ramion.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_02");	//Kiedy wyci�gasz rami�, obr�� biodro.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_03");	//Je�li troch� po�wiczysz, zauwa�ysz r�nic�.
		b_raiseattribute(other,ATR_STRENGTH,1);
		EROL_BONUS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_04");	//Je�li chcesz podszkoli� si� bardziej, musisz potrenowa�.
		Info_ClearChoices(dia_addon_erol_teach);
		Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
		Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_erol_teach_str_1);
		Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_erol_teach_str_5);
	};
};

func void dia_addon_erol_teach_back()
{
	Info_ClearChoices(dia_addon_erol_teach);
};

func void dia_addon_erol_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_addon_erol_teach);
	Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_erol_teach_str_1);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_erol_teach_str_5);
};

func void dia_addon_erol_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_addon_erol_teach);
	Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_erol_teach_str_1);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_erol_teach_str_5);
};

