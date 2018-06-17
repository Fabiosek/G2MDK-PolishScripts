
instance DIA_MIL_305_TORWACHE_EXIT(C_INFO)
{
	npc = mil_305_torwache;
	nr = 999;
	condition = dia_mil_305_torwache_exit_condition;
	information = dia_mil_305_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_305_torwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_305_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_305_CHECKPOINT = "NW_CITY_UPTOWN_PATH_02";

instance DIA_MIL_305_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_firstwarn_condition;
	information = dia_mil_305_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_305_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (MIL_305_SCHONMALREINGELASSEN == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(MIL_305_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_firstwarn_info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_00");	//ST�J!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_01");	//Jeste� poszukiwany za morderstwo. Dop�ki ta sprawa si� nie wyja�ni, nie mog� ci� wpu�ci� do g�rnego miasta.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_02");	//Dop�ki jeste� oskar�ony o kradzie�, nie mo�esz wej�� do g�rnego miasta.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_03");	//Takich �otrzyk�w jak ty nie wpuszczamy do g�rnego miasta.
		};
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_04");	//Udaj si� do Lorda Andre i z nim ustal ca�� spraw�.
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_05");	//Do g�rnego miasta wpuszczamy jedynie obywateli Khorinis oraz oddzia�y kr�lewskie.
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_305_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_305_TORWACHE_SECONDWARN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_secondwarn_condition;
	information = dia_mil_305_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_305_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_SecondWarn_03_00");	//M�wi� ci po raz ostatni. Jeszcze jeden krok i po�a�ujesz, �e si� urodzi�e�.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_305_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_ATTACK(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_attack_condition;
	information = dia_mil_305_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_305_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_305_Torwache_Attack_03_00");	//Sam si� o to prosi�e�...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_305_TORWACHE_MESSAGE(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_message_condition;
	information = dia_mil_305_torwache_message_info;
	permanent = FALSE;
	description = "Przynosz� wa�ne informacje dla Lorda Hagena.";
};


func int dia_mil_305_torwache_message_condition()
{
	if((PLAYER_KNOWSLORDHAGEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_message_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_MESSAGE_15_00");	//Przynosz� wa�ne informacje dla Lorda Hagena.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_01");	//Po�owa miasta ma dla Lorda Hagena 'wa�ne' informacje.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_02");	//Gdyby�my wpuszczali ka�dego interesanta, Lord Hagen nie robi�by nic, tylko zajmowa� si� przyziemnymi problemami posp�lstwa.
};


instance DIA_MIL_305_TORWACHE_AUSNAHME(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_ausnahme_condition;
	information = dia_mil_305_torwache_ausnahme_info;
	permanent = TRUE;
	description = "Mo�e m�g�by� zrobi� wyj�tek?";
};


func int dia_mil_305_torwache_ausnahme_condition()
{
	if(MIL_305_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_ausnahme_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_Ausnahme_15_00");	//Mo�e m�g�by� zrobi� wyj�tek?
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_01");	//Co?! W tym mie�cie panuj� pewne zasady! Zasady, kt�re obejmuj� wszystkich bez wyj�tku!
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_02");	//Je�li pozwolimy ci je z�ama�, b�dziemy niesprawiedliwi w stosunku do ca�ej reszty.
};


instance DIA_MIL_305_TORWACHE_PASSASCITIZEN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_passascitizen_condition;
	information = dia_mil_305_torwache_passascitizen_info;
	permanent = TRUE;
	description = "Jestem szanowanym obywatelem Khorinis! Pozw�l mi przej��.";
};


func int dia_mil_305_torwache_passascitizen_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == FALSE) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passascitizen_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00");	//Jestem szanowanym obywatelem Khorinis! Pozw�l mi przej��.
	if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01");	//Cokolwiek sk�oni�o mistrz�w z Khorinis do przyj�cia ci� jako ucznia - nie chc� nawet o tym s�ysze�.
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02");	//Mo�esz wej��! Ale uwa�aj, jeden wybryk i b�dziesz mia� powa�ne problemy.
		self.aivar[AIV_PASSGATE] = TRUE;
		MIL_305_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		AI_StopProcessInfos(self);
	}
	else if((MIS_MATTEO_GOLD == LOG_SUCCESS) || (MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS) || (MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS) || (MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03");	//Mo�e w jaki� spos�b uda�o ci si� wkupi� w �aski niekt�rych mistrz�w z dolnej cz�ci miasta, ale gdyby� by� obywatelem Khorinis, wiedzia�bym o tym!
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04");	//Ostrzegam ci�, nie pr�buj bawi� si� ze mn� w kotka i myszk�!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05");	//Jeste� wart tyle, co brud pod paznokciem! Znikaj st�d!
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIL_305_TORWACHE_PASSASMIL(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passasmil_condition;
	information = dia_mil_305_torwache_passasmil_info;
	permanent = TRUE;
	description = "Nale�� do stra�y - pozw�l mi przej��!";
};


func int dia_mil_305_torwache_passasmil_condition()
{
	if((other.guild == GIL_MIL) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passasmil_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMil_15_00");	//Nale�� do stra�y - pozw�l mi przej��!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_01");	//Andre ci� przyj��? To mo�e faktycznie jeste� w porz�dku!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_02");	//Jeste� teraz jednym z obro�c�w miasta. Pami�taj wi�c, aby by� uprzejmym wobec jego mieszka�c�w.
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASMAGE(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passasmage_condition;
	information = dia_mil_305_torwache_passasmage_info;
	permanent = TRUE;
	description = "�miesz stawa� na drodze wybra�cowi Innosa?";
};


func int dia_mil_305_torwache_passasmage_condition()
{
	if((other.guild == GIL_KDF) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passasmage_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_00");	//�miesz stawa� na drodze wybra�cowi Innosa?
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_01");	//Ehm... Nie! Oczywi�cie, �e nie! Przed wybra�cami Innosa bramy zawsze stoj� otworem.
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_02");	//Blu�nierco, m�dl si� o �ask� Innosa!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_03");	//Tak, Wybra�cze!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASSLD(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passassld_condition;
	information = dia_mil_305_torwache_passassld_info;
	permanent = TRUE;
	description = "Przynosz� wa�ne informacje dla Lorda Hagena.";
};


func int dia_mil_305_torwache_passassld_condition()
{
	if((other.guild == GIL_SLD) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passassld_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_00");	//Przynosz� wa�ne informacje dla Lorda Hagena.
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_01");	//Jeste� najemnikiem! Czeg� takie �cierwo mo�e chcie� od Lorda Hagena?
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_02");	//Przybywam z ofert� pokoju.
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_03");	//Ach! Wi�c w ko�cu poszli�cie po rozum do g�owy, dranie. Id� wi�c do Lorda Hagena, ale uwa�aj na j�zyk i zachowanie, albo skopi� ci to twoje t�uste dupsko!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PERM(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_perm_condition;
	information = dia_mil_305_torwache_perm_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_mil_305_torwache_perm_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_perm_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PERM_15_00");	//Co s�ycha�?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_01");	//Wszystko w porz�dku, Bracie!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_02");	//Wykonujemy tylko nasze obowi�zki. Mi�o, �e zechcia�e� mnie dostrzec, Wybra�cze.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_03");	//To, �e powinienem ci� wpu�ci�, nie znaczy, �e musz� z tob� gada�!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_04");	//Czego chcesz?
	};
	AI_StopProcessInfos(self);
};

