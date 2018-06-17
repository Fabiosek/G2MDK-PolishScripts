
instance DIA_MALETH_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_exit_condition;
	information = dia_maleth_exit_info;
	permanent = TRUE;
	description = "Muszê iœæ!";
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
	AI_Output(self,other,"DIA_Maleth_Hallo_08_00");	//Hej, wêdrowcze!
	if(hero.guild == GIL_NONE)
	{
		if(Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_01");	//Widzia³em, jak wyszed³eœ spomiêdzy gór.
		};
		AI_Output(self,other,"DIA_Maleth_Hallo_08_02");	//Ciesz siê, ¿e nie przyszed³eœ tutaj trzy tygodnie temu.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_03");	//Wziêlibyœmy ciê za zbieg³ego wiêŸnia. A wtedy szybko byœmy siê z tob¹ rozprawili!
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_04");	//Wygl¹dasz na wykoñczonego.
		}
		else
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//Kiedy tu przyby³eœ, wygl¹da³eœ na wykoñczonego.
			AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//Teraz wygl¹dasz ju¿ prawie jak cz³owiek!
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
	description = "W górach zosta³em zaatakowany przez bandytów.";
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
	AI_Output(other,self,"DIA_Maleth_BANDITS_15_00");	//W górach zosta³em zaatakowany przez bandytów.
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_01");	//Te przeklête œmiecie! To pewnie ci sami, którzy ostatniej nocy ukradli nam owcê!
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_02");	//Mia³eœ niesamowite szczêœcie. RZADKO kto uchodzi z ¿yciem.
};


instance DIA_MALETH_BANDITSDEAD(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsdead_condition;
	information = dia_maleth_banditsdead_info;
	permanent = FALSE;
	description = "Bandyci nie bêd¹ ju¿ was wiêcej niepokoiæ...";
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
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_00");	//Bandyci nie bêd¹ ju¿ was wiêcej niepokoiæ...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_01");	//Czemu? Nie ¿yj¹?
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_02");	//Zadarli z niew³aœciw¹ osob¹...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_03");	//Chwa³a Innosowi! Proszê - przyjmij ten skromny dar!
	b_giveinvitems(self,other,itfo_wine,3);
	MIS_MALETH_BANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_MALETHKILLBANDITS);
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//Opowiem o tym pozosta³ym!
};


instance DIA_MALETH_BANDITSALIVE(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsalive_condition;
	information = dia_maleth_banditsalive_info;
	permanent = FALSE;
	description = "Wiem, gdzie znajduje siê kryjówka bandytów...";
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
	AI_Output(other,self,"DIA_Maleth_BanditsALIVE_15_00");	//Wiem, gdzie znajduje siê kryjówka bandytów...
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_01");	//Chcesz ich zaatakowaæ? Ja siê na to nie piszê! To zbyt niebezpieczne!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_02");	//Poza tym, muszê pilnowaæ moich owiec!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_03");	//Jednak jeœli s¹dzisz, ¿e by³byœ w stanie uwolniæ nas od tej ho³oty, ca³a farma by³aby ci bardzo wdziêczna.
	MIS_MALETH_BANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MALETH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETH,LOG_RUNNING);
	b_logentry(TOPIC_MALETH,"Jeœli pokonam bandytów grasuj¹cych przy drodze z wie¿y Xardasa na farmê Lobarta, wszyscy na farmie bêd¹ mi bardzo wdziêczni.");
};


instance DIA_MALETH_TOTHECITY(C_INFO)
{
	npc = bau_954_maleth;
	nr = 2;
	condition = dia_maleth_tothecity_condition;
	information = dia_maleth_tothecity_info;
	permanent = FALSE;
	description = "Podró¿ujê do miasta.";
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
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_00");	//Podró¿ujê do miasta.
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_01");	//Przy twoim wygl¹dzie bêdziesz musia³ przekupiæ stra¿ników, jeœli chcesz, ¿eby ciê wpuœcili.
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_02");	//Musisz wiedzieæ, co chc¹ us³yszeæ.
	}
	else
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_03");	//Jeœli powiesz im to, co chcieliby us³yszeæ, mog¹ ciê wpuœciæ...
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//A co to takiego?
	AI_Output(self,other,"DIA_Maleth_ToTheCity_08_05");	//Mo¿esz im na przyk³ad powiedzieæ, ¿e przychodzisz z farmy Lobarta i chcesz siê dostaæ do kowala.
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"Dostanê siê do miasta, jeœli powiem stra¿nikowi strzeg¹cemu bramy, ¿e przyszed³em z farmy Lobarta i potrzebujê pomocy kowala.");
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_06");	//Chocia¿ to raczej nie zadzia³a, nie wygl¹dasz na ch³opa.
		b_logentry(TOPIC_CITY,"Oczywiœcie, powinienem wygl¹daæ jak farmer.");
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
	description = "Potrzebujê lepszego wyposa¿enia!";
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
	AI_Output(other,self,"DIA_Maleth_Equipment_15_00");	//Potrzebujê lepszego wyposa¿enia!
	AI_Output(self,other,"DIA_Maleth_Equipment_08_01");	//Mogê ci powiedzieæ od razu, ¿e nie mamy nic do oddania.
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Maleth_Equipment_08_02");	//Jeœli ciê na to staæ, mo¿esz coœ kupiæ od Lobarta.
		AI_Output(self,other,"DIA_Maleth_Equipment_08_03");	//Mo¿esz te¿ zapytaæ go, czy znajdzie dla ciebie jak¹œ pracê.
	};
};


instance DIA_MALETH_LOBART(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_lobart_condition;
	information = dia_maleth_lobart_info;
	permanent = FALSE;
	description = "Gdzie znajdê Lobarta?";
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
	AI_Output(other,self,"DIA_Maleth_LOBART_15_00");	//Gdzie znajdê Lobarta?
	AI_Output(self,other,"DIA_Maleth_LOBART_08_01");	//Jest gdzieœ na farmie, to chyba oczywiste! W koñcu to jego w³asnoœæ!
	AI_Output(self,other,"DIA_Maleth_LOBART_08_02");	//Tylko nie próbuj z nim zadzieraæ! Niejednego ju¿ pobi³ i wyrzuci³ ze swojego podwórka.
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
	description = "Czy w ci¹gu kilku ostatnich dni wydarzy³o siê coœ nowego?";
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
	AI_Output(other,self,"DIA_Maleth_PROBLEME_15_00");	//Czy w ci¹gu kilku ostatnich dni wydarzy³o siê coœ nowego?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_01");	//Po prostu idŸ œcie¿k¹ do miasta.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_02");	//Jeœli natkniesz siê na faceta w czarnej szacie, dowiesz siê, co siê wydarzy³o.
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Jak twoje owce?",dia_maleth_probleme_schafe);
	Info_AddChoice(dia_maleth_probleme,"Czy mê¿czyŸni w czarnych szatach ju¿ tu byli?",dia_maleth_probleme_beidir);
};

func void dia_maleth_probleme_beidir()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_beidir_15_00");	//Czy mê¿czyŸni w czarnych szatach ju¿ tu byli?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_beidir_08_01");	//Tak. Kr¹¿¹ dooko³a nas od paru dni. Moim zdaniem, przyszli tutaj prosto z piek³a.
};

func void dia_maleth_probleme_schafe()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_15_00");	//Jak twoje owce?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_08_01");	//Tak jakby faktycznie ciê to interesowa³o! Masz chyba inne zmartwienia.
	Info_AddChoice(dia_maleth_probleme,"A co ty mo¿esz wiedzieæ o moich zmartwieniach?",dia_maleth_probleme_schafe_probleme);
};

func void dia_maleth_probleme_schafe_probleme()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_15_00");	//A co ty mo¿esz wiedzieæ o moich zmartwieniach?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_01");	//Jesteœ cz³onkiem stra¿y miejskiej czy nie? Jeœli tak, to z pewnoœci¹ wiesz coœ na temat tych odzianych na czarno facetów.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_02");	//Wy najemnicy myœlicie tylko o jednym: 'Jak mogê wy³udziæ od innych ich ciê¿ko zarobione pieni¹dze?'
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_03");	//Wy, dostojni magowie z klasztoru, chyba powinniœcie wiedzieæ coœ na temat pewnych zakapturzonych postaci.
	};
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Uwa¿aj, co mówisz, kolego.",dia_maleth_probleme_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_maleth_probleme,"W czym problem?",dia_maleth_probleme_schafe_probleme_geldher_auftrag);
	};
};

func void dia_maleth_probleme_schafe_probleme_geldher_auftrag()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00");	//O co ci chodzi?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01");	//Wszystko przez to wstrêtne wiñsko, którym Vino tak strasznie mnie spi³ kilka tygodni temu.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02");	//Nie wiem, jak to siê sta³o, ale zgubi³em wtedy moj¹ laskê.
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03");	//I o to tyle zamieszania?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04");	//£atwo ci mówiæ, nie nale¿a³a do ciebie.
	Log_CreateTopic(TOPIC_MALETHSGEHSTOCK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETHSGEHSTOCK,LOG_RUNNING);
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Maleth zgubi³ swoj¹ laskê. By³ wtedy zupe³nie pijany, wiêc nie podejrzewam, ¿eby siê zbytnio oddali³ od farmy Lobarta. Zguba na pewno le¿y gdzieœ w pobli¿u.");
	Info_ClearChoices(dia_maleth_probleme);
};

func void dia_maleth_probleme_schafe_probleme_drohen()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00");	//Uwa¿aj, co mówisz, kolego.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01");	//Potrafisz tylko gadaæ. Najlepiej bêdzie, jeœli w ogóle sobie st¹d pójdziesz.
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
	description = "Wydaje mi siê, ¿e ta laska nale¿y do ciebie.";
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
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_00");	//Wydaje mi siê, ¿e ta laska nale¿y do ciebie.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//Niesamowite. Ja...
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_02");	//Chwileczkê. Najpierw zap³ata.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_03");	//Ale... Ja nie mam pieniêdzy.
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_04");	//Pomyœl o jakiejœ innej formie wynagrodzenia.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_05");	//Dobrze. Co powiesz na to? Wczoraj widzia³em tutaj kilku bandytów, uciekaj¹cych ze skradzionym z³otem.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_06");	//Jeœli powiem ci, gdzie ukryli swój ³up, czy dostanê z powrotem swoj¹ laskê?
	TOPIC_END_MALETHSGEHSTOCK = TRUE;
	b_giveplayerxp(XP_FOUNDMALETHSGEHSTOCK);
	Info_ClearChoices(dia_maleth_gehstock);
	Info_AddChoice(dia_maleth_gehstock,"Przykro mi, nie interesuje mnie to. Chcê twojego z³ota.",dia_maleth_gehstock_gold);
	Info_AddChoice(dia_maleth_gehstock,"W porz¹dku.",dia_maleth_gehstock_ok);
};

func void dia_maleth_gehstock_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//Zgoda.
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_01");	//W porz¹dku, s³uchaj uwa¿nie. Najpierw udaj siê na zachód, a¿ dojdziesz do tamtych drzew. Zobaczysz g³êboki jar.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_02");	//Jest tam jaskinia, a w niej powinno byæ ukryte coœ ciekawego.
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Maleth powiedzia³ mi, ¿e w lesie na zachód od farmy Lobarta znajduje siê du¿y obóz bandytów.");
	CreateInvItems(bdt_1024_malethsbandit,itmi_malethsbanditgold,1);
	Info_ClearChoices(dia_maleth_gehstock);
	AI_StopProcessInfos(self);
};

func void dia_maleth_gehstock_gold()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_gold_15_00");	//Przykro mi, nie interesuje mnie to. Chcê twojego z³ota.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_gold_08_01");	//To wszystko, co mam. Bêdzie musia³o ci wystarczyæ.
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
	description = "Nie przepracowuj siê.";
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
	AI_Output(other,self,"DIA_Maleth_PERM3_15_00");	//Nie przepracowuj siê.
	AI_Output(self,other,"DIA_Maleth_PERM3_08_01");	//Zje¿d¿aj st¹d.
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

