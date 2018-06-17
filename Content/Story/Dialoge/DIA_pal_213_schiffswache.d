
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
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00");	//Zaczekaj chwilk�! A gdzie to si� wybierasz?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01");	//Chcia�em tylko...
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02");	//Wybacz, nie mo�esz przej��.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03");	//Nie ma tu nic do ogl�dania. Odejd�.
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
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00");	//Ani kroku dalej. Nie robimy �adnych wyj�tk�w.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01");	//Nie chcesz chyba, bym MUSIA� zrobi� ci krzywd�?
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
	description = "Musz� dosta� si� na statek.";
};


func int dia_pal_213_schiffswache_goonboard_condition()
{
	return TRUE;
};

func void dia_pal_213_schiffswache_goonboard_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00");	//Musz� dosta� si� na statek.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01");	//Nikt nie ma tam wst�pu! Takie dosta�em rozkazy!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02");	//Zabij� ka�dego, kto wejdzie na pok�ad bez zezwolenia.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03");	//W imi� Innosa, b�d� chroni� statku do ostatniej kropli krwi.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf_condition;
	information = dia_pal_213_schiffswache_iamkdf_info;
	permanent = FALSE;
	description = "�miesz przeciwstawia� si� woli Maga Ognia?";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF_15_00");	//�miesz przeciwstawia� si� woli Maga Ognia?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01");	//Nie. Sk�d�e. Niech Innos mi wybaczy.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02");	//Magowie Ognia to stra�nicy m�dro�ci Innosa...
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03");	//...Ktokolwiek im si� sprzeciwia, sprzeciwia si� woli samego Innosa, odrzucaj�c jego �ask�.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf2_condition;
	information = dia_pal_213_schiffswache_iamkdf2_info;
	permanent = FALSE;
	description = "Co b�dzie, je�li wejd� na pok�ad?";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00");	//Co b�dzie, je�li wejd� na pok�ad?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01");	//Zabij�... to znaczy, b�d� ci� musia� powstrzyma�.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf3_condition;
	information = dia_pal_213_schiffswache_iamkdf3_info;
	permanent = FALSE;
	description = "Zaatakowa�by� Maga Ognia?";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00");	//Zaatakowa�by� Maga Ognia?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01");	//Nie �mia�bym podnie�� r�ki na maga.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02");	//Wi�c co by� zrobi�, gdybym wszed� na pok�ad?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03");	//Nic, Panie.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF4(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf4_condition;
	information = dia_pal_213_schiffswache_iamkdf4_info;
	permanent = FALSE;
	description = "W takim razie, wchodz�.";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00");	//W takim razie, wchodz�.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01");	//Nie r�b tego, prosz�. Rozkazy lorda Hagena by�y jasne.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF5(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf5_condition;
	information = dia_pal_213_schiffswache_iamkdf5_info;
	permanent = FALSE;
	description = "Czy rozkazy Lorda Hagena obejmuj� tak�e mnie?";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00");	//Czy rozkazy Lorda Hagena obejmuj� tak�e mnie?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01");	//Nie wiem.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02");	//Pomy�l tylko, czy Lord Hagen m�g�by podejrzewa� maga o kradzie�?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03");	//Nie s�dz�.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF6(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf6_condition;
	information = dia_pal_213_schiffswache_iamkdf6_info;
	permanent = FALSE;
	description = "Prosz� po raz ostatni: pozw�l mi wej�� na pok�ad!";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00");	//Prosz� po raz ostatni: pozw�l mi wej�� na pok�ad!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01");	//Zrozumia�em. Mo�esz wej��.
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
	description = "Czy�by� mi nie ufa�, rycerzu?";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL_15_00");	//Czy�by� mi nie ufa�, rycerzu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01");	//Nie o to chodzi, po prostu wykonuj� swoje rozkazy.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal2_condition;
	information = dia_pal_213_schiffswache_iampal2_info;
	permanent = FALSE;
	description = "Powiniene� wi�c wiedzie�, kt�ry z nas ma wy�szy stopie�.";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00");	//Powiniene� wi�c wiedzie�, kt�ry z nas ma wy�szy stopie�.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01");	//Tak jest!
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal3_condition;
	information = dia_pal_213_schiffswache_iampal3_info;
	permanent = FALSE;
	description = "Niniejszym rozkazuj� ci wpu�ci� mnie na okr�t.";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00");	//Niniejszym rozkazuj� ci wpu�ci� mnie na pok�ad.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01");	//Tak jest, mo�esz wej��, Panie.
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
	description = "Nie mo�na by czego� zrobi� w tej sprawie?";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG_15_00");	//Nie mo�na by czego� zrobi� w tej sprawie?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01");	//Nie do ko�ca rozumiem?
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg2_condition;
	information = dia_pal_213_schiffswache_iamdjg2_info;
	permanent = FALSE;
	description = "M�g�bym ci da� troch� z�ota...";
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00");	//M�g�bym ci da� troch� z�ota, a ty przez moment popatrzy�by� sobie w inn� stron�.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01");	//Nie pozwol� si� przekupi�. Je�li natychmiast nie odejdziesz, potraktuj� to jako obraz�.
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
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00");	//Posiadam pisemne zezwolenie. Wolno mi wej�� na pok�ad statku.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01");	//Niech no spojrz�.
	b_giveinvitems(other,self,itwr_forgedshipletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02");	//W porz�dku, mo�esz przej��.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};

