
instance DIA_MALETH_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_exit_condition;
	information = dia_maleth_exit_info;
	permanent = TRUE;
	description = "Musz� i��!";
};


func int dia_maleth_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_exit_info()
{
	AI_StopProcessInfos(self);
	if(MALETH_ERSTERWOLF == FALSE)
	{
		Wld_InsertNpc(ywolf,"NW_FARM1_PATH_CITY_SHEEP_06");
		MALETH_ERSTERWOLF = TRUE;
	};
};


instance DIA_MALETH_HALLO(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_hallo_condition;
	information = dia_maleth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_maleth_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_hallo_info()
{
	AI_Output(self,other,"DIA_Maleth_Hallo_08_00");	//Hej, w�drowcze!
	if(hero.guild == GIL_NONE)
	{
		if(Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_01");	//Widzia�em, jak wyszed�e� spomi�dzy g�r.
		};
		AI_Output(self,other,"DIA_Maleth_Hallo_08_02");	//Ciesz si�, �e nie przyszed�e� tutaj trzy tygodnie temu.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_03");	//Wzi�liby�my ci� za zbieg�ego wi�nia. A wtedy szybko by�my si� z tob� rozprawili!
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_04");	//Wygl�dasz na wyko�czonego.
		}
		else
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//Kiedy tu przyby�e�, wygl�da�e� na wyko�czonego.
			AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//Teraz wygl�dasz ju� prawie jak cz�owiek!
		};
	};
	AI_Output(self,other,"DIA_Maleth_Hallo_08_07");	//Czego tu szukasz?
};


instance DIA_MALETH_BANDITS(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_bandits_condition;
	information = dia_maleth_bandits_info;
	permanent = FALSE;
	description = "W g�rach zosta�em zaatakowany przez bandyt�w.";
};


func int dia_maleth_bandits_condition()
{
	if((KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_bandits_info()
{
	AI_Output(other,self,"DIA_Maleth_BANDITS_15_00");	//W g�rach zosta�em zaatakowany przez bandyt�w.
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_01");	//Te przekl�te �miecie! To pewnie ci sami, kt�rzy ostatniej nocy ukradli nam owc�!
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_02");	//Mia�e� niesamowite szcz�cie. RZADKO kto uchodzi z �yciem.
};


instance DIA_MALETH_BANDITSDEAD(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsdead_condition;
	information = dia_maleth_banditsdead_info;
	permanent = FALSE;
	description = "Bandyci nie b�d� ju� was wi�cej niepokoi�...";
};


func int dia_maleth_banditsdead_condition()
{
	if((Npc_IsDead(ambusher_1013) || (BDT_1013_AWAY == TRUE)) && Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015) && Npc_KnowsInfo(other,dia_maleth_bandits))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsdead_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_00");	//Bandyci nie b�d� ju� was wi�cej niepokoi�...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_01");	//Czemu? Nie �yj�?
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_02");	//Zadarli z niew�a�ciw� osob�...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_03");	//Chwa�a Innosowi! Prosz� - przyjmij ten skromny dar!
	b_giveinvitems(self,other,itfo_wine,3);
	MIS_MALETH_BANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_MALETHKILLBANDITS);
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//Opowiem o tym pozosta�ym!
};


instance DIA_MALETH_BANDITSALIVE(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsalive_condition;
	information = dia_maleth_banditsalive_info;
	permanent = FALSE;
	description = "Wiem, gdzie znajduje si� kryj�wka bandyt�w...";
};


func int dia_maleth_banditsalive_condition()
{
	var C_NPC b13;
	var C_NPC b14;
	var C_NPC b15;
	b13 = Hlp_GetNpc(bdt_1013_bandit_l);
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if((!Npc_IsDead(b13) || !Npc_IsDead(b14) || !Npc_IsDead(b15)) && Npc_KnowsInfo(other,dia_maleth_bandits) && (MIS_MALETH_BANDITS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsalive_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsALIVE_15_00");	//Wiem, gdzie znajduje si� kryj�wka bandyt�w...
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_01");	//Chcesz ich zaatakowa�? Ja si� na to nie pisz�! To zbyt niebezpieczne!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_02");	//Poza tym, musz� pilnowa� moich owiec!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_03");	//Jednak je�li s�dzisz, �e by�by� w stanie uwolni� nas od tej ho�oty, ca�a farma by�aby ci bardzo wdzi�czna.
	MIS_MALETH_BANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MALETH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETH,LOG_RUNNING);
	b_logentry(TOPIC_MALETH,"Je�li pokonam bandyt�w grasuj�cych przy drodze z wie�y Xardasa na farm� Lobarta, wszyscy na farmie b�d� mi bardzo wdzi�czni.");
};


instance DIA_MALETH_TOTHECITY(C_INFO)
{
	npc = bau_954_maleth;
	nr = 2;
	condition = dia_maleth_tothecity_condition;
	information = dia_maleth_tothecity_info;
	permanent = FALSE;
	description = "Podr�uj� do miasta.";
};


func int dia_maleth_tothecity_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_tothecity_info()
{
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_00");	//Podr�uj� do miasta.
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_01");	//Przy twoim wygl�dzie b�dziesz musia� przekupi� stra�nik�w, je�li chcesz, �eby ci� wpu�cili.
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_02");	//Musisz wiedzie�, co chc� us�ysze�.
	}
	else
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_03");	//Je�li powiesz im to, co chcieliby us�ysze�, mog� ci� wpu�ci�...
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//A co to takiego?
	AI_Output(self,other,"DIA_Maleth_ToTheCity_08_05");	//Mo�esz im na przyk�ad powiedzie�, �e przychodzisz z farmy Lobarta i chcesz si� dosta� do kowala.
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"Dostan� si� do miasta, je�li powiem stra�nikowi strzeg�cemu bramy, �e przyszed�em z farmy Lobarta i potrzebuj� pomocy kowala.");
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_06");	//Chocia� to raczej nie zadzia�a, nie wygl�dasz na ch�opa.
		b_logentry(TOPIC_CITY,"Oczywi�cie, powinienem wygl�da� jak farmer.");
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_07");	//Rozumiem.
};


instance DIA_MALETH_EQUIPMENT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_equipment_condition;
	information = dia_maleth_equipment_info;
	permanent = FALSE;
	description = "Potrzebuj� lepszego wyposa�enia!";
};


func int dia_maleth_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_equipment_info()
{
	AI_Output(other,self,"DIA_Maleth_Equipment_15_00");	//Potrzebuj� lepszego wyposa�enia!
	AI_Output(self,other,"DIA_Maleth_Equipment_08_01");	//Mog� ci powiedzie� od razu, �e nie mamy nic do oddania.
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Maleth_Equipment_08_02");	//Je�li ci� na to sta�, mo�esz co� kupi� od Lobarta.
		AI_Output(self,other,"DIA_Maleth_Equipment_08_03");	//Mo�esz te� zapyta� go, czy znajdzie dla ciebie jak�� prac�.
	};
};


instance DIA_MALETH_LOBART(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_lobart_condition;
	information = dia_maleth_lobart_info;
	permanent = FALSE;
	description = "Gdzie znajd� Lobarta?";
};


func int dia_maleth_lobart_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_equipment) && !Npc_IsDead(lobart) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_lobart_info()
{
	AI_Output(other,self,"DIA_Maleth_LOBART_15_00");	//Gdzie znajd� Lobarta?
	AI_Output(self,other,"DIA_Maleth_LOBART_08_01");	//Jest gdzie� na farmie, to chyba oczywiste! W ko�cu to jego w�asno��!
	AI_Output(self,other,"DIA_Maleth_LOBART_08_02");	//Tylko nie pr�buj z nim zadziera�! Niejednego ju� pobi� i wyrzuci� ze swojego podw�rka.
};


instance DIA_MALETH_KAP3_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap3_exit_condition;
	information = dia_maleth_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_maleth_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PROBLEME(C_INFO)
{
	npc = bau_954_maleth;
	nr = 30;
	condition = dia_maleth_probleme_condition;
	information = dia_maleth_probleme_info;
	description = "Czy w ci�gu kilku ostatnich dni wydarzy�o si� co� nowego?";
};


func int dia_maleth_probleme_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_maleth_probleme_info()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_15_00");	//Czy w ci�gu kilku ostatnich dni wydarzy�o si� co� nowego?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_01");	//Po prostu id� �cie�k� do miasta.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_02");	//Je�li natkniesz si� na faceta w czarnej szacie, dowiesz si�, co si� wydarzy�o.
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Jak twoje owce?",dia_maleth_probleme_schafe);
	Info_AddChoice(dia_maleth_probleme,"Czy m�czy�ni w czarnych szatach ju� tu byli?",dia_maleth_probleme_beidir);
};

func void dia_maleth_probleme_beidir()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_beidir_15_00");	//Czy m�czy�ni w czarnych szatach ju� tu byli?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_beidir_08_01");	//Tak. Kr��� dooko�a nas od paru dni. Moim zdaniem, przyszli tutaj prosto z piek�a.
};

func void dia_maleth_probleme_schafe()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_15_00");	//Jak twoje owce?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_08_01");	//Tak jakby faktycznie ci� to interesowa�o! Masz chyba inne zmartwienia.
	Info_AddChoice(dia_maleth_probleme,"A co ty mo�esz wiedzie� o moich zmartwieniach?",dia_maleth_probleme_schafe_probleme);
};

func void dia_maleth_probleme_schafe_probleme()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_15_00");	//A co ty mo�esz wiedzie� o moich zmartwieniach?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_01");	//Jeste� cz�onkiem stra�y miejskiej czy nie? Je�li tak, to z pewno�ci� wiesz co� na temat tych odzianych na czarno facet�w.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_02");	//Wy najemnicy my�licie tylko o jednym: 'Jak mog� wy�udzi� od innych ich ci�ko zarobione pieni�dze?'
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_03");	//Wy, dostojni magowie z klasztoru, chyba powinni�cie wiedzie� co� na temat pewnych zakapturzonych postaci.
	};
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Uwa�aj, co m�wisz, kolego.",dia_maleth_probleme_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_maleth_probleme,"W czym problem?",dia_maleth_probleme_schafe_probleme_geldher_auftrag);
	};
};

func void dia_maleth_probleme_schafe_probleme_geldher_auftrag()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00");	//O co ci chodzi?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01");	//Wszystko przez to wstr�tne wi�sko, kt�rym Vino tak strasznie mnie spi� kilka tygodni temu.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02");	//Nie wiem, jak to si� sta�o, ale zgubi�em wtedy moj� lask�.
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03");	//I o to tyle zamieszania?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04");	//�atwo ci m�wi�, nie nale�a�a do ciebie.
	Log_CreateTopic(TOPIC_MALETHSGEHSTOCK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETHSGEHSTOCK,LOG_RUNNING);
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Maleth zgubi� swoj� lask�. By� wtedy zupe�nie pijany, wi�c nie podejrzewam, �eby si� zbytnio oddali� od farmy Lobarta. Zguba na pewno le�y gdzie� w pobli�u.");
	Info_ClearChoices(dia_maleth_probleme);
};

func void dia_maleth_probleme_schafe_probleme_drohen()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00");	//Uwa�aj, co m�wisz, kolego.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01");	//Potrafisz tylko gada�. Najlepiej b�dzie, je�li w og�le sobie st�d p�jdziesz.
};

func void dia_maleth_probleme_back()
{
	Info_ClearChoices(dia_maleth_probleme);
};


instance DIA_MALETH_GEHSTOCK(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_gehstock_condition;
	information = dia_maleth_gehstock_info;
	description = "Wydaje mi si�, �e ta laska nale�y do ciebie.";
};


func int dia_maleth_gehstock_condition()
{
	if(Npc_HasItems(other,itmw_malethsgehstock_mis) && Npc_KnowsInfo(other,dia_maleth_probleme))
	{
		return TRUE;
	};
};

func void dia_maleth_gehstock_info()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_00");	//Wydaje mi si�, �e ta laska nale�y do ciebie.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//Niesamowite. Ja...
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_02");	//Chwileczk�. Najpierw zap�ata.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_03");	//Ale... Ja nie mam pieni�dzy.
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_04");	//Pomy�l o jakiej� innej formie wynagrodzenia.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_05");	//Dobrze. Co powiesz na to? Wczoraj widzia�em tutaj kilku bandyt�w, uciekaj�cych ze skradzionym z�otem.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_06");	//Je�li powiem ci, gdzie ukryli sw�j �up, czy dostan� z powrotem swoj� lask�?
	TOPIC_END_MALETHSGEHSTOCK = TRUE;
	b_giveplayerxp(XP_FOUNDMALETHSGEHSTOCK);
	Info_ClearChoices(dia_maleth_gehstock);
	Info_AddChoice(dia_maleth_gehstock,"Przykro mi, nie interesuje mnie to. Chc� twojego z�ota.",dia_maleth_gehstock_gold);
	Info_AddChoice(dia_maleth_gehstock,"W porz�dku.",dia_maleth_gehstock_ok);
};

func void dia_maleth_gehstock_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//Zgoda.
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_01");	//W porz�dku, s�uchaj uwa�nie. Najpierw udaj si� na zach�d, a� dojdziesz do tamtych drzew. Zobaczysz g��boki jar.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_02");	//Jest tam jaskinia, a w niej powinno by� ukryte co� ciekawego.
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Maleth powiedzia� mi, �e w lesie na zach�d od farmy Lobarta znajduje si� du�y ob�z bandyt�w.");
	CreateInvItems(bdt_1024_malethsbandit,itmi_malethsbanditgold,1);
	Info_ClearChoices(dia_maleth_gehstock);
	AI_StopProcessInfos(self);
};

func void dia_maleth_gehstock_gold()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_gold_15_00");	//Przykro mi, nie interesuje mnie to. Chc� twojego z�ota.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_gold_08_01");	//To wszystko, co mam. B�dzie musia�o ci wystarczy�.
	CreateInvItems(self,itmi_gold,35);
	b_giveinvitems(self,other,itmi_gold,35);
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	Info_ClearChoices(dia_maleth_gehstock);
};


instance DIA_MALETH_PERM3(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_perm3_condition;
	information = dia_maleth_perm3_info;
	permanent = TRUE;
	description = "Nie przepracowuj si�.";
};


func int dia_maleth_perm3_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_probleme) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_maleth_perm3_info()
{
	AI_Output(other,self,"DIA_Maleth_PERM3_15_00");	//Nie przepracowuj si�.
	AI_Output(self,other,"DIA_Maleth_PERM3_08_01");	//Zje�d�aj st�d.
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP4_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap4_exit_condition;
	information = dia_maleth_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_maleth_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP5_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap5_exit_condition;
	information = dia_maleth_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_maleth_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP6_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap6_exit_condition;
	information = dia_maleth_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_maleth_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PICKPOCKET(C_INFO)
{
	npc = bau_954_maleth;
	nr = 900;
	condition = dia_maleth_pickpocket_condition;
	information = dia_maleth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_maleth_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_maleth_pickpocket_info()
{
	Info_ClearChoices(dia_maleth_pickpocket);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_BACK,dia_maleth_pickpocket_back);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_PICKPOCKET,dia_maleth_pickpocket_doit);
};

func void dia_maleth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maleth_pickpocket);
};

func void dia_maleth_pickpocket_back()
{
	Info_ClearChoices(dia_maleth_pickpocket);
};

