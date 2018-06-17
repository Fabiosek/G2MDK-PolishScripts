
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
	description = "Co s³ychaæ?";
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
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//Stra¿nicy zbyt d³ugo nami pomiatali. Ale teraz nie oœmiel¹ siê tu pokazaæ, skoro najemnicy s¹ po naszej stronie.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//Król mo¿e s¹dzi, ¿e wszystko ujdzie mu p³azem. Ale my nie zamierzamy tego d³u¿ej znosiæ.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//W porz¹dku. Jak zobaczysz jakichœ stra¿ników, to huknij ich raz ode mnie, dobra?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//Dobrze. Niech Innos bêdzie z tob¹.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//¯o³nierze Króla nie s¹ mile widziani na farmie.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//Wiele osób i tak bêdzie z tob¹ gada³o, ale na pewno nie zdobêdziesz tu popularnoœci.
	};
};


instance DIA_BODO_BAUERNAUFSTAND(C_INFO)
{
	npc = bau_903_bodo;
	nr = 2;
	condition = dia_bodo_bauernaufstand_condition;
	information = dia_bodo_bauernaufstand_info;
	permanent = FALSE;
	description = "W mieœcie mówi¹, ¿e ch³opi siê buntuj¹!";
};


func int dia_bodo_bauernaufstand_condition()
{
	return TRUE;
};

func void dia_bodo_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//W mieœcie mówi¹, ¿e ch³opi siê buntuj¹!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//Bzdury. Po prostu bronimy tego, na co ciê¿ko pracowaliœmy.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//To jasne, ¿e ciê¿ar wojny spoczywa na grzbietach wieœniaków. Ale Onar nie bêdzie siê ju¿ bezczynnie przygl¹da³, jak Król zdziera z nas skórê.
};


instance DIA_BODO_BETT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 3;
	condition = dia_bodo_bett_condition;
	information = dia_bodo_bett_info;
	permanent = FALSE;
	description = "Mogê gdzieœ tu odpocz¹æ?";
};


func int dia_bodo_bett_condition()
{
	return TRUE;
};

func void dia_bodo_bett_info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//Mogê gdzieœ tu odpocz¹æ?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//Jeœli chcesz siê gdzieœ przespaæ, idŸ do stodo³y. Tylko nie po³ó¿ siê przez pomy³kê w ³ó¿ku jakiegoœ najemnika.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//Onar dba o to, ¿eby zostawili w spokoju wieœniaków, ale z obcym spoza farmy mog¹ zrobiæ, co im siê spodoba.
};


instance DIA_BODO_CIPHER(C_INFO)
{
	npc = bau_903_bodo;
	nr = 4;
	condition = dia_bodo_cipher_condition;
	information = dia_bodo_cipher_info;
	permanent = FALSE;
	description = "Cipher powiedzia³, ¿e ktoœ mu ukrad³ paczkê bagiennego ziela...";
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
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//Cipher powiedzia³, ¿e ktoœ mu ukrad³ paczkê bagiennego ziela...
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//I co?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//Myœli, ¿e ty to zrobi³eœ.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//Och, wiêc DLATEGO siê tak na mnie têpo gapi.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//Ostatnio by³em dla niego bardzo uprzejmy, bo myœla³em, ¿e jest mu ciê¿ko.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//Ale nic to nie da³o. Ja by³em dla niego uprzejmy, a on siê gapi³, jakby chcia³ mnie zabiæ.
};


instance DIA_BODO_WEEDORELSE(C_INFO)
{
	npc = bau_903_bodo;
	nr = 5;
	condition = dia_bodo_weedorelse_condition;
	information = dia_bodo_weedorelse_info;
	permanent = FALSE;
	description = "Dawaj mi to ziele, albo po¿a³ujesz!";
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
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//Dawaj mi to ziele, albo po¿a³ujesz!
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//S³uchaj, mam tylko jednego skrêta. WeŸ go i zostaw mnie w spokoju.
	b_giveinvitems(self,other,itmi_joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//Wiesz, ¿e najemnicy Onara nas chroni¹, co?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//Wiêc nie rób nic g³upiego!
	};
};


instance DIA_BODO_WEEDPERM(C_INFO)
{
	npc = bau_903_bodo;
	nr = 6;
	condition = dia_bodo_weedperm_condition;
	information = dia_bodo_weedperm_info;
	permanent = TRUE;
	description = "Nie wierzê w ani jedno twoje s³owo! Dawaj bagienne ziele!";
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
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//Nie wierzê w ani jedno twoje s³owo! Dawaj bagienne ziele!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//Nie mam go. Mówiê prawdê.
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

