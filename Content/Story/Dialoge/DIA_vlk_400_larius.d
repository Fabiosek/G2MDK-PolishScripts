
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
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//Czego chcesz? Jeœli masz jak¹œ sprawê, musisz siê najpierw umówiæ.
};


instance DIA_LARIUS_WHOAREYOU(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_whoareyou_condition;
	information = dia_larius_whoareyou_info;
	permanent = FALSE;
	description = "Kim jesteœ?";
};


func int dia_larius_whoareyou_condition()
{
	return TRUE;
};

func void dia_larius_whoareyou_info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//Jestem Larius, miejscowy gubernator.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//Chocia¿ w tym momencie mo¿e trudno w to uwierzyæ, jestem najbardziej wp³ywowym cz³owiekiem w tym mieœcie.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//A wiêc ty tutaj rz¹dzisz?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//Ja... No có¿... w chwili obecnej mam zwi¹zane rêce.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//Dopóki Lord Hagen nie opuœci miasta, to on sprawuje w³adzê.
};


instance DIA_LARIUS_DISTURB(C_INFO)
{
	npc = vlk_400_larius;
	nr = 3;
	condition = dia_larius_disturb_condition;
	information = dia_larius_disturb_info;
	permanent = TRUE;
	description = "Nie chcia³em przeszkadzaæ.";
};


func int dia_larius_disturb_condition()
{
	return TRUE;
};

func void dia_larius_disturb_info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//Nie chcia³em przeszkadzaæ.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//A jednak przeszkadzasz. Wynoœ siê st¹d!
};


instance DIA_LARIUS_DIELAGE(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_dielage_condition;
	information = dia_larius_dielage_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_larius_dielage_condition()
{
	return TRUE;
};

func void dia_larius_dielage_info()
{
	AI_Output(other,self,"DIA_Larius_DieLage_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//A co ciê to obchodzi? Dopóki w mieœcie przebywaj¹ paladyni, Lord Hagen sprawuje tu w³adzê.
};


instance DIA_LARIUS_RICHTERUEBERFALL(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_richterueberfall_condition;
	information = dia_larius_richterueberfall_info;
	description = "Sêdzia wynaj¹³ kilku opryszków, ¿eby ciê uciszyli.";
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
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//Sêdzia wynaj¹³ kilku opryszków, ¿eby ciê uciszyli. Mogê to udowodniæ.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//Nie opowiadaj takich bzdur, chcesz skoñczyæ w areszcie?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//Nawet jeœli jesteœ wojownikiem Innosa...
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//Nawet jeœli jesteœ szanowanym magiem...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//Moje s³owo wci¹¿ coœ znaczy w tym mieœcie. Ostrzegam ciê, nie zamierzam s³uchaæ, jak bezczelnie szkalujesz dobre imiê sêdziego!
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

