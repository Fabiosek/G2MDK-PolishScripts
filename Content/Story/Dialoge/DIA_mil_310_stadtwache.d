
instance DIA_MIL_310_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 999;
	condition = dia_mil_310_stadtwache_exit_condition;
	information = dia_mil_310_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_310_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_310_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_310_CHECKPOINT = "NW_CITY_ENTRANCE_MAIN";

var int mil_310_personal_absolutionlevel;

instance DIA_MIL_310_STADTWACHE_FIRSTWARN(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 1;
	condition = dia_mil_310_stadtwache_firstwarn_condition;
	information = dia_mil_310_stadtwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_310_stadtwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_310_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (b_getcurrentabsolutionlevel(self) == MIL_310_PERSONAL_ABSOLUTIONLEVEL))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(MIL_310_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_firstwarn_info()
{
	var C_ITEM itm;
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00");	//STAÆ!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01");	//O co chodzi?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02");	//Dobrze wiesz o co!
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03");	//Jesteœ poszukiwany w mieœcie za morderstwo.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04");	//Nie potrzebujemy to ¿adnych brudnych z³odziei!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05");	//Nie trzeba nam w mieœcie pieniaczy!
		};
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06");	//Dlaczego mielibyœmy ciê wpuœciæ?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07");	//A dlaczego nie?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08");	//TY tu nie wejdziesz, ch³opcze!
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09");	//Dlaczego nie?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10");	//Ju¿ po twoim obszarpanym wygl¹dzie widzê, ¿e jedyne co ze sob¹ przynosisz to k³opoty.
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11");	//W mieœcie mamy ju¿ dostatecznie du¿o k³opotów. Nie ma tu miejsca dla ludzi bez pieniêdzy.
			Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
			b_logentry(TOPIC_CITY,"Stra¿nicy strzeg¹cy bram miasta nie wpuszcz¹ mnie, jeœli bêdê wygl¹da³ jak nêdzarz. Muszê zrobiæ coœ ze swoim wygl¹dem albo poszukaæ innej drogi do miasta.");
		}
		else if((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE))
		{
			if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12");	//Czego chcesz tym razem?
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13");	//Przys³ano mnie z farmy.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14");	//No proszê? Czy¿byœ w koñcu mia³ jakiœ dobry powód, by siê tu pojawiaæ?
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15");	//Jesteœ jednym z pomocników z farmy Lobarta? Nigdy ciê tu nie widzia³em!
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16");	//Od niedawna pracujê dla Lobarta.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17");	//Co sprowadza ciê do miasta?
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18");	//S³ucham?
			if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19");	//Wybacz, ale takie mam rozkazy.
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20");	//Czy¿byœ chcia³ mnie zatrzymaæ?
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21");	//Gdzie¿bym œmia³. Wszyscy cz³onkowie koœcio³a Innosa s¹ mile widziani.
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22");	//Chcia³em ci siê tylko przyjrzeæ. Wygl¹da na to, ¿e masz pieni¹dze. Mo¿esz wejœæ.
			};
			self.aivar[AIV_PASSGATE] = TRUE;
			stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
			MIL_310_SCHONMALREINGELASSEN = TRUE;
			b_checklog();
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_310_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_310_STADTWACHE_SECONDWARN(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 2;
	condition = dia_mil_310_stadtwache_secondwarn_condition;
	information = dia_mil_310_stadtwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_310_stadtwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_310_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00");	//Nie masz tu czego szukaæ. Jeden krok dalej, a posiekam ciê na kawa³ki.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_310_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_ATTACK(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 3;
	condition = dia_mil_310_stadtwache_attack_condition;
	information = dia_mil_310_stadtwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_310_stadtwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_310_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Attack_07_00");	//Sam siê o to prosi³eœ...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_310_STADTWACHE_BRIBE(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 5;
	condition = dia_mil_310_stadtwache_bribe_condition;
	information = dia_mil_310_stadtwache_bribe_info;
	permanent = TRUE;
	description = "Masz tu 100 sztuk z³ota i wpuœæ mnie!";
};


func int dia_mil_310_stadtwache_bribe_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_bribe_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");	//Oto 100 sztuk z³ota. Pozwól mi przejœæ!
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");	//Brzmi rozs¹dnie, w porz¹dku - wchodŸ.
		if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");	//I kieruj siê od razu do Lorda Andre! W przeciwnym wypadku nastêpny taki numer bêdzie ciê kosztowa³ 100 sztuk wiêcej!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
		MIL_310_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		MIL_310_PERSONAL_ABSOLUTIONLEVEL = b_getcurrentabsolutionlevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");	//Co?! Gdzie?! Nie widzê ¿adnego z³ota. Won!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_PASSIERSCHEIN(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 4;
	condition = dia_mil_310_stadtwache_passierschein_condition;
	information = dia_mil_310_stadtwache_passierschein_info;
	permanent = FALSE;
	description = "Mam przepustkê!";
};


func int dia_mil_310_stadtwache_passierschein_condition()
{
	if(Npc_HasItems(other,itwr_passierschein) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_passierschein_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");	//Mam przepustkê!
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");	//Naprawdê? A kogoœ zabi³ bandyto, ¿eby j¹ dostaæ?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");	//Pozwolisz mi przejœæ czy nie?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");	//Dobra, wchodŸ, nim siê rozmyœlê!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");	//Wygl¹da na orygina³. Mo¿esz przejœæ.
	};
	self.aivar[AIV_PASSGATE] = TRUE;
	stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	MIL_310_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_ZUMSCHMIED(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 3;
	condition = dia_mil_310_stadtwache_zumschmied_condition;
	information = dia_mil_310_stadtwache_zumschmied_info;
	permanent = FALSE;
	description = "Chcia³bym zobaczyæ siê z kowalem, muszê naprawiæ ekwipunek.";
};


func int dia_mil_310_stadtwache_zumschmied_condition()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	if(((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE)) && Npc_KnowsInfo(other,dia_maleth_tothecity) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_zumschmied_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00");	//Chcia³bym zobaczyæ siê z kowalem, muszê naprawiæ ekwipunek.
	if(MIL_310_SCHEISSE_ERZAEHLT == TRUE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01");	//Ach tak? Dlaczegoœ od razu tak nie gada³?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02");	//Zastanawia³em siê, jak zareagujesz.
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03");	//Co? Wykrêæ mi jeszcze jeden taki numer, a poka¿ê ci, jak reagujê na takich durnych ¿artownisiów jak ty.
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04");	//W porz¹dku, mo¿esz przejœæ.
	};
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05");	//Gdybyœ spotka³ Lobarta, ka¿ mu porz¹dnie karmiæ owce, nied³ugo wracamy!
	self.aivar[AIV_PASSGATE] = TRUE;
	stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	MIL_310_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MIL_310_STADTWACHE_CONSTANTINO(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 2;
	condition = dia_addon_mil_310_stadtwache_constantino_condition;
	information = dia_addon_mil_310_stadtwache_constantino_info;
	permanent = TRUE;
	description = "Mam tu zio³a dla alchemika Constantina.";
};


func int dia_addon_mil_310_stadtwache_constantino_condition()
{
	if((MIS_ADDON_LESTER_PICKFORCONSTANTINO == LOG_RUNNING) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_mil_310_stadtwache_constantino_info()
{
	AI_Output(other,self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00");	//Mam tu zio³a dla alchemika Constantina.
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) || (Npc_HasItems(other,itpl_mana_herb_02) > 0) || (Npc_HasItems(other,itpl_mana_herb_03) > 0) || (Npc_HasItems(other,itpl_health_herb_01) > 0) || (Npc_HasItems(other,itpl_health_herb_02) > 0) || (Npc_HasItems(other,itpl_health_herb_03) > 0) || (Npc_HasItems(other,itpl_dex_herb_01) > 0) || (Npc_HasItems(other,itpl_strength_herb_01) > 0) || (Npc_HasItems(other,itpl_speed_herb_01) > 0) || (Npc_HasItems(other,itpl_temp_herb) > 0) || (Npc_HasItems(other,itpl_perm_herb) > 0) || (Npc_HasItems(other,itpl_beet) > 0))
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01");	//Ach tak? W takim razie poka¿ mi, co przynosisz.
		if((Npc_HasItems(other,itpl_mana_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_mana_herb_02) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_mana_herb_03) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_02) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_03) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_dex_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_strength_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_speed_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_temp_herb) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_perm_herb) >= MINIMUMPASSAGEPLANTS))
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02");	//Taaak... Wygl¹da w porz¹dku. Dobra, wchodŸ - tylko ¿adnych burd. Rozumiemy siê?
			self.aivar[AIV_PASSGATE] = TRUE;
			stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
			MIL_310_SCHONMALREINGELASSEN = TRUE;
			MIS_ADDON_LESTER_PICKFORCONSTANTINO = LOG_SUCCESS;
			b_checklog();
			b_giveplayerxp(XP_ADDON_PICKFORCONSTANTINO);
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_03");	//Co tam? Czego chcesz?
			if(Npc_HasItems(other,itpl_beet) >= MINIMUMPASSAGEPLANTS)
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04");	//A na co alchemikowi te chwasty? Masz mnie za idiotê? Wynoœ siê.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05");	//Mo¿e i nie jestem ekspertem w dziedzinie alchemii, ale raczej nie przydaje siê w niej taka w³oszczyzna jak to. IdŸ sobie.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06");	//Zio³a? Jakie zio³a? Nie masz ¿adnych zió³. Wynocha!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_MILIZWERDEN(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 2;
	condition = dia_mil_310_stadtwache_milizwerden_condition;
	information = dia_mil_310_stadtwache_milizwerden_info;
	permanent = FALSE;
	description = "Chcê siê przy³¹czyæ do stra¿y!";
};


func int dia_mil_310_stadtwache_milizwerden_condition()
{
	if(MIL_310_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_milizwerden_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00");	//Chcê siê przy³¹czyæ do stra¿y!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01");	//A to dobre! Spróbuj przy innej bramie, mo¿e TAM ci uwierz¹.
	MIL_310_SCHEISSE_ERZAEHLT = TRUE;
};


instance DIA_MIL_310_STADTWACHE_PALADINE(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 1;
	condition = dia_mil_310_stadtwache_paladine_condition;
	information = dia_mil_310_stadtwache_paladine_info;
	permanent = FALSE;
	description = "Muszê porozmawiaæ z przywódc¹ paladynów!";
};


func int dia_mil_310_stadtwache_paladine_condition()
{
	if(MIL_310_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_paladine_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_15_00");	//Muszê siê zobaczyæ z przywódc¹ paladynów! Mam dla niego bardzo wa¿ne informacje!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_07_01");	//Och? A có¿ to za informacje?
	MIL_310_SCHEISSE_ERZAEHLT = TRUE;
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Wkrótce miasto zostanie zaatakowane!",dia_mil_310_stadtwache_paladine_attacksoon);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Chmara orków zbiera siê w dolinie Khorinis!",dia_mil_310_stadtwache_paladine_evilarmy);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Przybywam, aby zdobyæ Oko Innosa!",dia_mil_310_stadtwache_paladine_eyeinnos);
};

func void dia_mil_310_stadtwache_paladine_eyeinnos()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00");	//Przyszed³em po Oko Innosa!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01");	//Po co? Nigdy o czymœ takim nie s³ysza³em - có¿ to w³aœciwie jest?
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02");	//Bardzo wa¿ny artefakt.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03");	//Nie wygl¹dasz mi na powa¿nego pos³añca. A masz coœ, co potwierdzi twoj¹ to¿samoœæ?
	if(!Npc_HasItems(other,itwr_passierschein) > 0)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04");	//Nie, nie mam!
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05");	//W takim razie nie marnuj mojego cennego czasu.
	};
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
};

func void dia_mil_310_stadtwache_paladine_evilarmy()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00");	//Chmara orków zbiera siê w dolinie Khorinis!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01");	//W Górniczej Dolinie? Czy stamt¹d w³aœnie przybywasz? Widzia³eœ ich armiê?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nie, ale przys³a³ mnie ktoœ, kto widzia³.",dia_mil_310_stadtwache_paladine_nosomeone);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nie, ale wiem, ¿e orkami dowodz¹ smoki!",dia_mil_310_stadtwache_paladine_nodragons);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Tak. By³em w dolinie Khorinis. Widzia³em kilka potê¿nych smoków!",dia_mil_310_stadtwache_paladine_yesdragons);
};

func void dia_mil_310_stadtwache_paladine_attacksoon()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00");	//Wkrótce miasto zostanie zaatakowane!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01");	//Co? Przez kogo? Orków? Widzia³eœ jak¹œ armiê?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nie, ale przys³a³ mnie ktoœ, kto widzia³.",dia_mil_310_stadtwache_paladine_nosomeone);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nie, ale wiem, ¿e orkami dowodz¹ smoki!",dia_mil_310_stadtwache_paladine_nodragons);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Tak. By³em w dolinie Khorinis. Widzia³em kilka potê¿nych smoków!",dia_mil_310_stadtwache_paladine_yesdragons);
};

func void dia_mil_310_stadtwache_paladine_nodragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00");	//Nie, ale wiem, ¿e orkami dowodz¹ smoki!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01");	//Jasne! A moja babka robi u orkowych genera³ów za adiutanta.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02");	//Chyba nie myœlisz, ¿e wpuœcimy ciê do Lorda Hagena z tak¹ naci¹gan¹ historyjk¹.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03");	//Spadaj!
	PLAYER_KNOWSLORDHAGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_nosomeone()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00");	//Nie, ale przys³a³ mnie ktoœ, kto widzia³.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01");	//KTO ciê przys³a³?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nie mogê ci nic powiedzieæ.",dia_mil_310_stadtwache_paladine_canttellyou);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Paladyn.",dia_mil_310_stadtwache_paladine_apaladin);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Pewien mag.",dia_mil_310_stadtwache_paladine_amage);
};

func void dia_mil_310_stadtwache_paladine_yesdragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00");	//Tak. By³em w dolinie Khorinis. Widzia³em kilka potê¿nych smoków!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01");	//K³amco! Prze³êcz prowadz¹ca do doliny jest zamkniêta z obydwu stron. Nikt nie mo¿e przez ni¹ przejœæ.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02");	//Wynoœ siê!
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_amage()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");	//Pewien mag.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01");	//Otrzyma³eœ te informacje od maga? Masz wiêc pewnie pieczêæ potwierdzaj¹c¹ jego s³owa!
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");	//Nie.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03");	//Jak to? Magowie ZAWSZE daj¹ swym pos³añcom pieczêæ.
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04");	//Nie ten.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05");	//Nie wierzê ci. Jeœli naprawdê jesteœ pos³añcem, to mów, co masz do powiedzenia, tu i teraz.
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Tê wiadomoœæ mogê przekazaæ jedynie paladynom!",dia_mil_310_stadtwache_paladine_onlypaladins);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Armi¹ Z³a dowodz¹ smoki!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_apaladin()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00");	//Paladyn.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01");	//Hm, to ca³kiem mo¿liwe - paladyni strzeg¹ prze³êczy prowadz¹cej do Górniczej Doliny.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02");	//Przeka¿ mi wiadomoœæ, a ja zameldujê o twoim przybyciu.
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Tê wiadomoœæ mogê przekazaæ jedynie paladynom!",dia_mil_310_stadtwache_paladine_onlypaladins);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Armi¹ Z³a dowodz¹ smoki!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_canttellyou()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00");	//Nie mogê ci nic powiedzieæ.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01");	//Nie denerwuj mnie ch³opcze, jestem stra¿nikiem miejskim!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02");	//Mnie mo¿esz powiedzieæ WSZYSTKO. Mów wiêc, kto ciê przys³a³?
};

func void dia_mil_310_stadtwache_paladine_depechedragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00");	//Armi¹ Z³a dowodz¹ smoki!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01");	//Co? To nie mo¿e byæ prawda. A ju¿ prawie mia³em ciê wpuœciæ.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02");	//Gdybyœ opowiedzia³ tê historiê Lordowi Hagenowi, kaza³by sobie przynieœæ moj¹ g³owê na srebrnej tacy.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03");	//Spadaj!
	PLAYER_KNOWSLORDHAGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_onlypaladins()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00");	//Tê wiadomoœæ mogê przekazaæ jedynie paladynom!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01");	//Nic z tego, ch³opcze!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02");	//Jak mam ciê u diab³a wpuœciæ do Lorda Hagena, jeœli nie bêdê mia³ pewnoœci, ¿e nie zmarnujesz jego cennego czasu?
	PLAYER_KNOWSLORDHAGEN = TRUE;
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nic z tego. Te informacje przeznaczone s¹ TYLKO dla paladynów.",dia_mil_310_stadtwache_paladine_only2);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Armi¹ Z³a dowodz¹ smoki!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_only2()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00");	//Nic z tego. Te informacje przeznaczone s¹ TYLKO dla paladynów.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01");	//Twoja podró¿ koñczy siê tutaj, obcy.
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_PERM(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 5;
	condition = dia_mil_310_stadtwache_perm_condition;
	information = dia_mil_310_stadtwache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_310_stadtwache_perm_condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_perm_info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_PERM_07_00");	//Dalej, ruszaj st¹d.
	AI_StopProcessInfos(self);
};

