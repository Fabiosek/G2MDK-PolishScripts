
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
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00");	//STA�!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01");	//O co chodzi?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02");	//Dobrze wiesz o co!
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03");	//Jeste� poszukiwany w mie�cie za morderstwo.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04");	//Nie potrzebujemy to �adnych brudnych z�odziei!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05");	//Nie trzeba nam w mie�cie pieniaczy!
		};
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06");	//Dlaczego mieliby�my ci� wpu�ci�?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07");	//A dlaczego nie?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08");	//TY tu nie wejdziesz, ch�opcze!
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09");	//Dlaczego nie?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10");	//Ju� po twoim obszarpanym wygl�dzie widz�, �e jedyne co ze sob� przynosisz to k�opoty.
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11");	//W mie�cie mamy ju� dostatecznie du�o k�opot�w. Nie ma tu miejsca dla ludzi bez pieni�dzy.
			Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
			b_logentry(TOPIC_CITY,"Stra�nicy strzeg�cy bram miasta nie wpuszcz� mnie, je�li b�d� wygl�da� jak n�dzarz. Musz� zrobi� co� ze swoim wygl�dem albo poszuka� innej drogi do miasta.");
		}
		else if((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE))
		{
			if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12");	//Czego chcesz tym razem?
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13");	//Przys�ano mnie z farmy.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14");	//No prosz�? Czy�by� w ko�cu mia� jaki� dobry pow�d, by si� tu pojawia�?
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15");	//Jeste� jednym z pomocnik�w z farmy Lobarta? Nigdy ci� tu nie widzia�em!
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16");	//Od niedawna pracuj� dla Lobarta.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17");	//Co sprowadza ci� do miasta?
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18");	//S�ucham?
			if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19");	//Wybacz, ale takie mam rozkazy.
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20");	//Czy�by� chcia� mnie zatrzyma�?
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21");	//Gdzie�bym �mia�. Wszyscy cz�onkowie ko�cio�a Innosa s� mile widziani.
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22");	//Chcia�em ci si� tylko przyjrze�. Wygl�da na to, �e masz pieni�dze. Mo�esz wej��.
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
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00");	//Nie masz tu czego szuka�. Jeden krok dalej, a posiekam ci� na kawa�ki.
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
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Attack_07_00");	//Sam si� o to prosi�e�...
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
	description = "Masz tu 100 sztuk z�ota i wpu�� mnie!";
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
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");	//Oto 100 sztuk z�ota. Pozw�l mi przej��!
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");	//Brzmi rozs�dnie, w porz�dku - wchod�.
		if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");	//I kieruj si� od razu do Lorda Andre! W przeciwnym wypadku nast�pny taki numer b�dzie ci� kosztowa� 100 sztuk wi�cej!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
		MIL_310_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		MIL_310_PERSONAL_ABSOLUTIONLEVEL = b_getcurrentabsolutionlevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");	//Co?! Gdzie?! Nie widz� �adnego z�ota. Won!
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
	description = "Mam przepustk�!";
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
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");	//Mam przepustk�!
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");	//Naprawd�? A kogo� zabi� bandyto, �eby j� dosta�?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");	//Pozwolisz mi przej�� czy nie?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");	//Dobra, wchod�, nim si� rozmy�l�!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");	//Wygl�da na orygina�. Mo�esz przej��.
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
	description = "Chcia�bym zobaczy� si� z kowalem, musz� naprawi� ekwipunek.";
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
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00");	//Chcia�bym zobaczy� si� z kowalem, musz� naprawi� ekwipunek.
	if(MIL_310_SCHEISSE_ERZAEHLT == TRUE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01");	//Ach tak? Dlaczego� od razu tak nie gada�?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02");	//Zastanawia�em si�, jak zareagujesz.
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03");	//Co? Wykr�� mi jeszcze jeden taki numer, a poka�� ci, jak reaguj� na takich durnych �artownisi�w jak ty.
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04");	//W porz�dku, mo�esz przej��.
	};
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05");	//Gdyby� spotka� Lobarta, ka� mu porz�dnie karmi� owce, nied�ugo wracamy!
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
	description = "Mam tu zio�a dla alchemika Constantina.";
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
	AI_Output(other,self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00");	//Mam tu zio�a dla alchemika Constantina.
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) || (Npc_HasItems(other,itpl_mana_herb_02) > 0) || (Npc_HasItems(other,itpl_mana_herb_03) > 0) || (Npc_HasItems(other,itpl_health_herb_01) > 0) || (Npc_HasItems(other,itpl_health_herb_02) > 0) || (Npc_HasItems(other,itpl_health_herb_03) > 0) || (Npc_HasItems(other,itpl_dex_herb_01) > 0) || (Npc_HasItems(other,itpl_strength_herb_01) > 0) || (Npc_HasItems(other,itpl_speed_herb_01) > 0) || (Npc_HasItems(other,itpl_temp_herb) > 0) || (Npc_HasItems(other,itpl_perm_herb) > 0) || (Npc_HasItems(other,itpl_beet) > 0))
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01");	//Ach tak? W takim razie poka� mi, co przynosisz.
		if((Npc_HasItems(other,itpl_mana_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_mana_herb_02) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_mana_herb_03) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_02) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_03) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_dex_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_strength_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_speed_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_temp_herb) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_perm_herb) >= MINIMUMPASSAGEPLANTS))
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02");	//Taaak... Wygl�da w porz�dku. Dobra, wchod� - tylko �adnych burd. Rozumiemy si�?
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
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04");	//A na co alchemikowi te chwasty? Masz mnie za idiot�? Wyno� si�.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05");	//Mo�e i nie jestem ekspertem w dziedzinie alchemii, ale raczej nie przydaje si� w niej taka w�oszczyzna jak to. Id� sobie.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06");	//Zio�a? Jakie zio�a? Nie masz �adnych zi�. Wynocha!
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
	description = "Chc� si� przy��czy� do stra�y!";
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
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00");	//Chc� si� przy��czy� do stra�y!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01");	//A to dobre! Spr�buj przy innej bramie, mo�e TAM ci uwierz�.
	MIL_310_SCHEISSE_ERZAEHLT = TRUE;
};


instance DIA_MIL_310_STADTWACHE_PALADINE(C_INFO)
{
	npc = mil_310_stadtwache;
	nr = 1;
	condition = dia_mil_310_stadtwache_paladine_condition;
	information = dia_mil_310_stadtwache_paladine_info;
	permanent = FALSE;
	description = "Musz� porozmawia� z przyw�dc� paladyn�w!";
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
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_15_00");	//Musz� si� zobaczy� z przyw�dc� paladyn�w! Mam dla niego bardzo wa�ne informacje!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_07_01");	//Och? A c� to za informacje?
	MIL_310_SCHEISSE_ERZAEHLT = TRUE;
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Wkr�tce miasto zostanie zaatakowane!",dia_mil_310_stadtwache_paladine_attacksoon);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Chmara ork�w zbiera si� w dolinie Khorinis!",dia_mil_310_stadtwache_paladine_evilarmy);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Przybywam, aby zdoby� Oko Innosa!",dia_mil_310_stadtwache_paladine_eyeinnos);
};

func void dia_mil_310_stadtwache_paladine_eyeinnos()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00");	//Przyszed�em po Oko Innosa!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01");	//Po co? Nigdy o czym� takim nie s�ysza�em - c� to w�a�ciwie jest?
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02");	//Bardzo wa�ny artefakt.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03");	//Nie wygl�dasz mi na powa�nego pos�a�ca. A masz co�, co potwierdzi twoj� to�samo��?
	if(!Npc_HasItems(other,itwr_passierschein) > 0)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04");	//Nie, nie mam!
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05");	//W takim razie nie marnuj mojego cennego czasu.
	};
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
};

func void dia_mil_310_stadtwache_paladine_evilarmy()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00");	//Chmara ork�w zbiera si� w dolinie Khorinis!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01");	//W G�rniczej Dolinie? Czy stamt�d w�a�nie przybywasz? Widzia�e� ich armi�?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nie, ale przys�a� mnie kto�, kto widzia�.",dia_mil_310_stadtwache_paladine_nosomeone);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nie, ale wiem, �e orkami dowodz� smoki!",dia_mil_310_stadtwache_paladine_nodragons);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Tak. By�em w dolinie Khorinis. Widzia�em kilka pot�nych smok�w!",dia_mil_310_stadtwache_paladine_yesdragons);
};

func void dia_mil_310_stadtwache_paladine_attacksoon()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00");	//Wkr�tce miasto zostanie zaatakowane!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01");	//Co? Przez kogo? Ork�w? Widzia�e� jak�� armi�?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nie, ale przys�a� mnie kto�, kto widzia�.",dia_mil_310_stadtwache_paladine_nosomeone);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nie, ale wiem, �e orkami dowodz� smoki!",dia_mil_310_stadtwache_paladine_nodragons);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Tak. By�em w dolinie Khorinis. Widzia�em kilka pot�nych smok�w!",dia_mil_310_stadtwache_paladine_yesdragons);
};

func void dia_mil_310_stadtwache_paladine_nodragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00");	//Nie, ale wiem, �e orkami dowodz� smoki!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01");	//Jasne! A moja babka robi u orkowych genera��w za adiutanta.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02");	//Chyba nie my�lisz, �e wpu�cimy ci� do Lorda Hagena z tak� naci�gan� historyjk�.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03");	//Spadaj!
	PLAYER_KNOWSLORDHAGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_nosomeone()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00");	//Nie, ale przys�a� mnie kto�, kto widzia�.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01");	//KTO ci� przys�a�?
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nie mog� ci nic powiedzie�.",dia_mil_310_stadtwache_paladine_canttellyou);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Paladyn.",dia_mil_310_stadtwache_paladine_apaladin);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Pewien mag.",dia_mil_310_stadtwache_paladine_amage);
};

func void dia_mil_310_stadtwache_paladine_yesdragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00");	//Tak. By�em w dolinie Khorinis. Widzia�em kilka pot�nych smok�w!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01");	//K�amco! Prze��cz prowadz�ca do doliny jest zamkni�ta z obydwu stron. Nikt nie mo�e przez ni� przej��.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02");	//Wyno� si�!
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_amage()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");	//Pewien mag.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01");	//Otrzyma�e� te informacje od maga? Masz wi�c pewnie piecz�� potwierdzaj�c� jego s�owa!
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");	//Nie.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03");	//Jak to? Magowie ZAWSZE daj� swym pos�a�com piecz��.
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04");	//Nie ten.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05");	//Nie wierz� ci. Je�li naprawd� jeste� pos�a�cem, to m�w, co masz do powiedzenia, tu i teraz.
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"T� wiadomo�� mog� przekaza� jedynie paladynom!",dia_mil_310_stadtwache_paladine_onlypaladins);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Armi� Z�a dowodz� smoki!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_apaladin()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00");	//Paladyn.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01");	//Hm, to ca�kiem mo�liwe - paladyni strzeg� prze��czy prowadz�cej do G�rniczej Doliny.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02");	//Przeka� mi wiadomo��, a ja zamelduj� o twoim przybyciu.
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"T� wiadomo�� mog� przekaza� jedynie paladynom!",dia_mil_310_stadtwache_paladine_onlypaladins);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Armi� Z�a dowodz� smoki!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_canttellyou()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00");	//Nie mog� ci nic powiedzie�.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01");	//Nie denerwuj mnie ch�opcze, jestem stra�nikiem miejskim!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02");	//Mnie mo�esz powiedzie� WSZYSTKO. M�w wi�c, kto ci� przys�a�?
};

func void dia_mil_310_stadtwache_paladine_depechedragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00");	//Armi� Z�a dowodz� smoki!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01");	//Co? To nie mo�e by� prawda. A ju� prawie mia�em ci� wpu�ci�.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02");	//Gdyby� opowiedzia� t� histori� Lordowi Hagenowi, kaza�by sobie przynie�� moj� g�ow� na srebrnej tacy.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03");	//Spadaj!
	PLAYER_KNOWSLORDHAGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_mil_310_stadtwache_paladine_onlypaladins()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00");	//T� wiadomo�� mog� przekaza� jedynie paladynom!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01");	//Nic z tego, ch�opcze!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02");	//Jak mam ci� u diab�a wpu�ci� do Lorda Hagena, je�li nie b�d� mia� pewno�ci, �e nie zmarnujesz jego cennego czasu?
	PLAYER_KNOWSLORDHAGEN = TRUE;
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Nic z tego. Te informacje przeznaczone s� TYLKO dla paladyn�w.",dia_mil_310_stadtwache_paladine_only2);
	Info_AddChoice(dia_mil_310_stadtwache_paladine,"Armi� Z�a dowodz� smoki!",dia_mil_310_stadtwache_paladine_depechedragons);
};

func void dia_mil_310_stadtwache_paladine_only2()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00");	//Nic z tego. Te informacje przeznaczone s� TYLKO dla paladyn�w.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01");	//Twoja podr� ko�czy si� tutaj, obcy.
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
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_PERM_07_00");	//Dalej, ruszaj st�d.
	AI_StopProcessInfos(self);
};

