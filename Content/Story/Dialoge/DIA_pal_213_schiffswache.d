
instance DIA_PAL_213_SCHIFFSWACHE_EXIT(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 999;
	condition = dia_pal_213_schiffswache_exit_condition;
	information = dia_pal_213_schiffswache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_213_schiffswache_exit_condition()
{
	return TRUE;
};

func void dia_pal_213_schiffswache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string PAL_213_CHECKPOINT = "SHIP_DECK_09";

instance DIA_PAL_213_SCHIFFSWACHE_FIRSTWARN(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 1;
	condition = dia_pal_213_schiffswache_firstwarn_condition;
	information = dia_pal_213_schiffswache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_firstwarn_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_firstwarn_info()
{
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00");	//Zaczekaj chwilkê! A gdzie to siê wybierasz?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01");	//Chcia³em tylko...
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02");	//Wybacz, nie mo¿esz przejœæ.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03");	//Nie ma tu nic do ogl¹dania. OdejdŸ.
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_213_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_PAL_213_SCHIFFSWACHE_SECONDWARN(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 2;
	condition = dia_pal_213_schiffswache_secondwarn_condition;
	information = dia_pal_213_schiffswache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_secondwarn_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_213_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_secondwarn_info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00");	//Ani kroku dalej. Nie robimy ¿adnych wyj¹tków.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01");	//Nie chcesz chyba, bym MUSIA£ zrobiæ ci krzywdê?
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_213_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_213_SCHIFFSWACHE_ATTACK(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 3;
	condition = dia_pal_213_schiffswache_attack_condition;
	information = dia_pal_213_schiffswache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_attack_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_213_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
};


instance DIA_PAL_213_SCHIFFSWACHE_GOONBOARD(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 5;
	condition = dia_pal_213_schiffswache_goonboard_condition;
	information = dia_pal_213_schiffswache_goonboard_info;
	permanent = FALSE;
	description = "Muszê dostaæ siê na statek.";
};


func int dia_pal_213_schiffswache_goonboard_condition()
{
	return TRUE;
};

func void dia_pal_213_schiffswache_goonboard_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00");	//Muszê dostaæ siê na statek.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01");	//Nikt nie ma tam wstêpu! Takie dosta³em rozkazy!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02");	//Zabijê ka¿dego, kto wejdzie na pok³ad bez zezwolenia.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03");	//W imiê Innosa, bêdê chroni³ statku do ostatniej kropli krwi.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf_condition;
	information = dia_pal_213_schiffswache_iamkdf_info;
	permanent = FALSE;
	description = "Œmiesz przeciwstawiaæ siê woli Maga Ognia?";
};


func int dia_pal_213_schiffswache_iamkdf_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF_15_00");	//Œmiesz przeciwstawiaæ siê woli Maga Ognia?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01");	//Nie. Sk¹d¿e. Niech Innos mi wybaczy.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02");	//Magowie Ognia to stra¿nicy m¹droœci Innosa...
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03");	//...Ktokolwiek im siê sprzeciwia, sprzeciwia siê woli samego Innosa, odrzucaj¹c jego ³askê.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf2_condition;
	information = dia_pal_213_schiffswache_iamkdf2_info;
	permanent = FALSE;
	description = "Co bêdzie, jeœli wejdê na pok³ad?";
};


func int dia_pal_213_schiffswache_iamkdf2_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00");	//Co bêdzie, jeœli wejdê na pok³ad?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01");	//Zabijê... to znaczy, bêdê ciê musia³ powstrzymaæ.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf3_condition;
	information = dia_pal_213_schiffswache_iamkdf3_info;
	permanent = FALSE;
	description = "Zaatakowa³byœ Maga Ognia?";
};


func int dia_pal_213_schiffswache_iamkdf3_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00");	//Zaatakowa³byœ Maga Ognia?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01");	//Nie œmia³bym podnieœæ rêki na maga.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02");	//Wiêc co byœ zrobi³, gdybym wszed³ na pok³ad?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03");	//Nic, Panie.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF4(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf4_condition;
	information = dia_pal_213_schiffswache_iamkdf4_info;
	permanent = FALSE;
	description = "W takim razie, wchodzê.";
};


func int dia_pal_213_schiffswache_iamkdf4_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf3))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf4_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00");	//W takim razie, wchodzê.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01");	//Nie rób tego, proszê. Rozkazy lorda Hagena by³y jasne.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF5(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf5_condition;
	information = dia_pal_213_schiffswache_iamkdf5_info;
	permanent = FALSE;
	description = "Czy rozkazy Lorda Hagena obejmuj¹ tak¿e mnie?";
};


func int dia_pal_213_schiffswache_iamkdf5_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf4))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf5_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00");	//Czy rozkazy Lorda Hagena obejmuj¹ tak¿e mnie?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01");	//Nie wiem.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02");	//Pomyœl tylko, czy Lord Hagen móg³by podejrzewaæ maga o kradzie¿?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03");	//Nie s¹dzê.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF6(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf6_condition;
	information = dia_pal_213_schiffswache_iamkdf6_info;
	permanent = FALSE;
	description = "Proszê po raz ostatni: pozwól mi wejœæ na pok³ad!";
};


func int dia_pal_213_schiffswache_iamkdf6_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf5))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf6_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00");	//Proszê po raz ostatni: pozwól mi wejœæ na pok³ad!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01");	//Zrozumia³em. Mo¿esz wejœæ.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal_condition;
	information = dia_pal_213_schiffswache_iampal_info;
	permanent = FALSE;
	description = "Czy¿byœ mi nie ufa³, rycerzu?";
};


func int dia_pal_213_schiffswache_iampal_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL_15_00");	//Czy¿byœ mi nie ufa³, rycerzu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01");	//Nie o to chodzi, po prostu wykonujê swoje rozkazy.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal2_condition;
	information = dia_pal_213_schiffswache_iampal2_info;
	permanent = FALSE;
	description = "Powinieneœ wiêc wiedzieæ, który z nas ma wy¿szy stopieñ.";
};


func int dia_pal_213_schiffswache_iampal2_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iampal))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00");	//Powinieneœ wiêc wiedzieæ, który z nas ma wy¿szy stopieñ.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01");	//Tak jest!
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal3_condition;
	information = dia_pal_213_schiffswache_iampal3_info;
	permanent = FALSE;
	description = "Niniejszym rozkazujê ci wpuœciæ mnie na okrêt.";
};


func int dia_pal_213_schiffswache_iampal3_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iampal2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00");	//Niniejszym rozkazujê ci wpuœciæ mnie na pok³ad.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01");	//Tak jest, mo¿esz wejœæ, Panie.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg_condition;
	information = dia_pal_213_schiffswache_iamdjg_info;
	permanent = FALSE;
	description = "Nie mo¿na by czegoœ zrobiæ w tej sprawie?";
};


func int dia_pal_213_schiffswache_iamdjg_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG_15_00");	//Nie mo¿na by czegoœ zrobiæ w tej sprawie?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01");	//Nie do koñca rozumiem?
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg2_condition;
	information = dia_pal_213_schiffswache_iamdjg2_info;
	permanent = FALSE;
	description = "Móg³bym ci daæ trochê z³ota...";
};


func int dia_pal_213_schiffswache_iamdjg2_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamdjg))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00");	//Móg³bym ci daæ trochê z³ota, a ty przez moment popatrzy³byœ sobie w inn¹ stronê.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01");	//Nie pozwolê siê przekupiæ. Jeœli natychmiast nie odejdziesz, potraktujê to jako obrazê.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg3_condition;
	information = dia_pal_213_schiffswache_iamdjg3_info;
	permanent = FALSE;
	description = "Posiadam pisemne zezwolenie.";
};


func int dia_pal_213_schiffswache_iamdjg3_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamdjg) && (Npc_HasItems(other,itwr_forgedshipletter_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00");	//Posiadam pisemne zezwolenie. Wolno mi wejœæ na pok³ad statku.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01");	//Niech no spojrzê.
	b_giveinvitems(other,self,itwr_forgedshipletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02");	//W porz¹dku, mo¿esz przejœæ.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};

