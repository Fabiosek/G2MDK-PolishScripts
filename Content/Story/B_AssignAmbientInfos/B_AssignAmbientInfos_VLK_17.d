
instance DIA_VLK_17_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_17_exit_condition;
	information = dia_vlk_17_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_17_exit_condition()
{
	return TRUE;
};

func void dia_vlk_17_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_17_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_17_join_condition;
	information = dia_vlk_17_join_info;
	permanent = TRUE;
	description = "Co powinienem zrobi�, by zosta� obywatelem miasta?";
};


func int dia_vlk_17_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_17_join_info()
{
	AI_Output(other,self,"DIA_VLK_17_JOIN_15_00");	//Co powinienem zrobi�, by zosta� obywatelem miasta?
	AI_Output(self,other,"DIA_VLK_17_JOIN_17_01");	//Mistrzowie rzemios�a z dolnej cz�ci miasta posiadaj� bardzo du�e wp�ywy. Powiniene� porozmawia� z kt�rym� z nich.
};


instance DIA_VLK_17_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_17_people_condition;
	information = dia_vlk_17_people_info;
	permanent = TRUE;
	description = "Kim s� najwa�niejsze osoby w mie�cie?";
};


func int dia_vlk_17_people_condition()
{
	return TRUE;
};

func void dia_vlk_17_people_info()
{
	AI_Output(other,self,"DIA_VLK_17_PEOPLE_15_00");	//Kim s� najwa�niejsze osoby w mie�cie?
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_01");	//Od swojego przybycia paladyni kontroluj� w�a�ciwie ca�e Khorinis.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_02");	//Przedstawicielem prawa w mie�cie jest Lord Andre, znajdziesz go w koszarach.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_03");	//S� tylko dwa sposoby na spotkanie si� z nim - mo�na z�ama� prawo albo przy��czy� si� do stra�y miejskiej.
};


instance DIA_VLK_17_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_17_location_condition;
	information = dia_vlk_17_location_info;
	permanent = TRUE;
	description = "Kt�re z miejsc w Khorinis warto odwiedzi�?";
};


func int dia_vlk_17_location_condition()
{
	return TRUE;
};

func void dia_vlk_17_location_info()
{
	AI_Output(other,self,"DIA_VLK_17_LOCATION_15_00");	//Kt�re z miejsc w Khorinis warto odwiedzi�?
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_01");	//Mo�e powiniene� zapyta� o to jakiego� m�czyzn�. Je�li szukasz rozrywki, udaj si� do dzielnicy portowej.
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_02");	//Je�li jednak chcesz co� kupi�, udaj si� na targowisko niedaleko wschodniej bramy, lub do dolnej cz�ci miasta.
};


instance DIA_VLK_17_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_17_standard_condition;
	information = dia_vlk_17_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_vlk_17_standard_condition()
{
	return TRUE;
};

func void dia_vlk_17_standard_info()
{
	AI_Output(other,self,"DIA_VLK_17_STANDARD_15_00");	//Co s�ycha�?
	if((KAPITEL == 1) || (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_01");	//Zastanawiam si�, po co paladyni pojawili si� w mie�cie. Niby przej�li kontrol� nad ratuszem, koszarami i portem, ale, jak dot�d, nic nie robi�.
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_02");	//Gdyby przyjechali tu zaj�� si� orkami lub bandytami, ju� dawno powinni co� z tym zrobi�. Musi by� inny pow�d...
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_03");	//Chyba ju� wiem, co sprowadzi�o tu paladyn�w. Chodzi o rud�. Zaj�liby si� lepiej ochron� miasta.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_04");	//Mam nadziej�, �e w opowie�ciach o smokach jest troch� prawdy. Lord Hagen b�dzie musia� co� zrobi�, nie narazi nas przecie� na atak bestii.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_05");	//Teraz, kiedy smoki zosta�y pokonane, paladyni nie powinni mie� problemu ze st�umieniem pozosta�ych niepokoj�w.
	};
};

func void b_assignambientinfos_vlk_17(var C_NPC slf)
{
	dia_vlk_17_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_standard.npc = Hlp_GetInstanceID(slf);
};

