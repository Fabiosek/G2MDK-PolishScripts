
instance DIA_LARIUS_EXIT(C_INFO)
{
	npc = vlk_400_larius;
	nr = 999;
	condition = dia_larius_exit_condition;
	information = dia_larius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_larius_exit_condition()
{
	return TRUE;
};

func void dia_larius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARIUS_HELLO(C_INFO)
{
	npc = vlk_400_larius;
	nr = 1;
	condition = dia_larius_hello_condition;
	information = dia_larius_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_larius_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_larius_hello_info()
{
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//Czego chcesz? Je�li masz jak�� spraw�, musisz si� najpierw um�wi�.
};


instance DIA_LARIUS_WHOAREYOU(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_whoareyou_condition;
	information = dia_larius_whoareyou_info;
	permanent = FALSE;
	description = "Kim jeste�?";
};


func int dia_larius_whoareyou_condition()
{
	return TRUE;
};

func void dia_larius_whoareyou_info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//Jestem Larius, miejscowy gubernator.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//Chocia� w tym momencie mo�e trudno w to uwierzy�, jestem najbardziej wp�ywowym cz�owiekiem w tym mie�cie.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//A wi�c ty tutaj rz�dzisz?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//Ja... No c�... w chwili obecnej mam zwi�zane r�ce.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//Dop�ki Lord Hagen nie opu�ci miasta, to on sprawuje w�adz�.
};


instance DIA_LARIUS_DISTURB(C_INFO)
{
	npc = vlk_400_larius;
	nr = 3;
	condition = dia_larius_disturb_condition;
	information = dia_larius_disturb_info;
	permanent = TRUE;
	description = "Nie chcia�em przeszkadza�.";
};


func int dia_larius_disturb_condition()
{
	return TRUE;
};

func void dia_larius_disturb_info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//Nie chcia�em przeszkadza�.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//A jednak przeszkadzasz. Wyno� si� st�d!
};


instance DIA_LARIUS_DIELAGE(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_dielage_condition;
	information = dia_larius_dielage_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_larius_dielage_condition()
{
	return TRUE;
};

func void dia_larius_dielage_info()
{
	AI_Output(other,self,"DIA_Larius_DieLage_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//A co ci� to obchodzi? Dop�ki w mie�cie przebywaj� paladyni, Lord Hagen sprawuje tu w�adz�.
};


instance DIA_LARIUS_RICHTERUEBERFALL(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_richterueberfall_condition;
	information = dia_larius_richterueberfall_info;
	description = "S�dzia wynaj�� kilku opryszk�w, �eby ci� uciszyli.";
};


func int dia_larius_richterueberfall_condition()
{
	if(SCKNOWSRICHTERKOMPROBRIEF == TRUE)
	{
		return TRUE;
	};
};

func void dia_larius_richterueberfall_info()
{
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//S�dzia wynaj�� kilku opryszk�w, �eby ci� uciszyli. Mog� to udowodni�.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//Nie opowiadaj takich bzdur, chcesz sko�czy� w areszcie?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//Nawet je�li jeste� wojownikiem Innosa...
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//Nawet je�li jeste� szanowanym magiem...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//Moje s�owo wci�� co� znaczy w tym mie�cie. Ostrzegam ci�, nie zamierzam s�ucha�, jak bezczelnie szkalujesz dobre imi� s�dziego!
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_LARIUS_PICKPOCKET(C_INFO)
{
	npc = vlk_400_larius;
	nr = 900;
	condition = dia_larius_pickpocket_condition;
	information = dia_larius_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_larius_pickpocket_condition()
{
	return c_beklauen(35,120);
};

func void dia_larius_pickpocket_info()
{
	Info_ClearChoices(dia_larius_pickpocket);
	Info_AddChoice(dia_larius_pickpocket,DIALOG_BACK,dia_larius_pickpocket_back);
	Info_AddChoice(dia_larius_pickpocket,DIALOG_PICKPOCKET,dia_larius_pickpocket_doit);
};

func void dia_larius_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_larius_pickpocket);
};

func void dia_larius_pickpocket_back()
{
	Info_ClearChoices(dia_larius_pickpocket);
};

