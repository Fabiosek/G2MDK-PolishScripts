
instance DIA_BODO_EXIT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 999;
	condition = dia_bodo_exit_condition;
	information = dia_bodo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bodo_exit_condition()
{
	return TRUE;
};

func void dia_bodo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BODO_HALLO(C_INFO)
{
	npc = bau_903_bodo;
	nr = 1;
	condition = dia_bodo_hallo_condition;
	information = dia_bodo_hallo_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_bodo_hallo_condition()
{
	return TRUE;
};

func void dia_bodo_hallo_info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//Jak leci?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//Stra�nicy zbyt d�ugo nami pomiatali. Ale teraz nie o�miel� si� tu pokaza�, skoro najemnicy s� po naszej stronie.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//Kr�l mo�e s�dzi, �e wszystko ujdzie mu p�azem. Ale my nie zamierzamy tego d�u�ej znosi�.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//W porz�dku. Jak zobaczysz jakich� stra�nik�w, to huknij ich raz ode mnie, dobra?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//Dobrze. Niech Innos b�dzie z tob�.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//�o�nierze Kr�la nie s� mile widziani na farmie.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//Wiele os�b i tak b�dzie z tob� gada�o, ale na pewno nie zdob�dziesz tu popularno�ci.
	};
};


instance DIA_BODO_BAUERNAUFSTAND(C_INFO)
{
	npc = bau_903_bodo;
	nr = 2;
	condition = dia_bodo_bauernaufstand_condition;
	information = dia_bodo_bauernaufstand_info;
	permanent = FALSE;
	description = "W mie�cie m�wi�, �e ch�opi si� buntuj�!";
};


func int dia_bodo_bauernaufstand_condition()
{
	return TRUE;
};

func void dia_bodo_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//W mie�cie m�wi�, �e ch�opi si� buntuj�!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//Bzdury. Po prostu bronimy tego, na co ci�ko pracowali�my.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//To jasne, �e ci�ar wojny spoczywa na grzbietach wie�niak�w. Ale Onar nie b�dzie si� ju� bezczynnie przygl�da�, jak Kr�l zdziera z nas sk�r�.
};


instance DIA_BODO_BETT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 3;
	condition = dia_bodo_bett_condition;
	information = dia_bodo_bett_info;
	permanent = FALSE;
	description = "Mog� gdzie� tu odpocz��?";
};


func int dia_bodo_bett_condition()
{
	return TRUE;
};

func void dia_bodo_bett_info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//Mog� gdzie� tu odpocz��?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//Je�li chcesz si� gdzie� przespa�, id� do stodo�y. Tylko nie po�� si� przez pomy�k� w ��ku jakiego� najemnika.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//Onar dba o to, �eby zostawili w spokoju wie�niak�w, ale z obcym spoza farmy mog� zrobi�, co im si� spodoba.
};


instance DIA_BODO_CIPHER(C_INFO)
{
	npc = bau_903_bodo;
	nr = 4;
	condition = dia_bodo_cipher_condition;
	information = dia_bodo_cipher_info;
	permanent = FALSE;
	description = "Cipher powiedzia�, �e kto� mu ukrad� paczk� bagiennego ziela...";
};


func int dia_bodo_cipher_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) || (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bodo_cipher_info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//Cipher powiedzia�, �e kto� mu ukrad� paczk� bagiennego ziela...
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//I co?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//My�li, �e ty to zrobi�e�.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//Och, wi�c DLATEGO si� tak na mnie t�po gapi.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//Ostatnio by�em dla niego bardzo uprzejmy, bo my�la�em, �e jest mu ci�ko.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//Ale nic to nie da�o. Ja by�em dla niego uprzejmy, a on si� gapi�, jakby chcia� mnie zabi�.
};


instance DIA_BODO_WEEDORELSE(C_INFO)
{
	npc = bau_903_bodo;
	nr = 5;
	condition = dia_bodo_weedorelse_condition;
	information = dia_bodo_weedorelse_info;
	permanent = FALSE;
	description = "Dawaj mi to ziele, albo po�a�ujesz!";
};


func int dia_bodo_weedorelse_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_cipher))
	{
		return TRUE;
	};
};

func void dia_bodo_weedorelse_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//Dawaj mi to ziele, albo po�a�ujesz!
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//S�uchaj, mam tylko jednego skr�ta. We� go i zostaw mnie w spokoju.
	b_giveinvitems(self,other,itmi_joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//Wiesz, �e najemnicy Onara nas chroni�, co?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//Wi�c nie r�b nic g�upiego!
	};
};


instance DIA_BODO_WEEDPERM(C_INFO)
{
	npc = bau_903_bodo;
	nr = 6;
	condition = dia_bodo_weedperm_condition;
	information = dia_bodo_weedperm_info;
	permanent = TRUE;
	description = "Nie wierz� w ani jedno twoje s�owo! Dawaj bagienne ziele!";
};


func int dia_bodo_weedperm_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_weedorelse))
	{
		return TRUE;
	};
};

func void dia_bodo_weedperm_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//Nie wierz� w ani jedno twoje s�owo! Dawaj bagienne ziele!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//Nie mam go. M�wi� prawd�.
};


instance DIA_BODO_PICKPOCKET(C_INFO)
{
	npc = bau_903_bodo;
	nr = 900;
	condition = dia_bodo_pickpocket_condition;
	information = dia_bodo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bodo_pickpocket_condition()
{
	return c_beklauen(30,60);
};

func void dia_bodo_pickpocket_info()
{
	Info_ClearChoices(dia_bodo_pickpocket);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_BACK,dia_bodo_pickpocket_back);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_PICKPOCKET,dia_bodo_pickpocket_doit);
};

func void dia_bodo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bodo_pickpocket);
};

func void dia_bodo_pickpocket_back()
{
	Info_ClearChoices(dia_bodo_pickpocket);
};

