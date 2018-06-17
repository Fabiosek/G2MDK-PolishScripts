
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
	description = "Co powinienem zrobiæ, by zostaæ obywatelem miasta?";
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
	AI_Output(other,self,"DIA_VLK_17_JOIN_15_00");	//Co powinienem zrobiæ, by zostaæ obywatelem miasta?
	AI_Output(self,other,"DIA_VLK_17_JOIN_17_01");	//Mistrzowie rzemios³a z dolnej czêœci miasta posiadaj¹ bardzo du¿e wp³ywy. Powinieneœ porozmawiaæ z którymœ z nich.
};


instance DIA_VLK_17_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_17_people_condition;
	information = dia_vlk_17_people_info;
	permanent = TRUE;
	description = "Kim s¹ najwa¿niejsze osoby w mieœcie?";
};


func int dia_vlk_17_people_condition()
{
	return TRUE;
};

func void dia_vlk_17_people_info()
{
	AI_Output(other,self,"DIA_VLK_17_PEOPLE_15_00");	//Kim s¹ najwa¿niejsze osoby w mieœcie?
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_01");	//Od swojego przybycia paladyni kontroluj¹ w³aœciwie ca³e Khorinis.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_02");	//Przedstawicielem prawa w mieœcie jest Lord Andre, znajdziesz go w koszarach.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_03");	//S¹ tylko dwa sposoby na spotkanie siê z nim - mo¿na z³amaæ prawo albo przy³¹czyæ siê do stra¿y miejskiej.
};


instance DIA_VLK_17_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_17_location_condition;
	information = dia_vlk_17_location_info;
	permanent = TRUE;
	description = "Które z miejsc w Khorinis warto odwiedziæ?";
};


func int dia_vlk_17_location_condition()
{
	return TRUE;
};

func void dia_vlk_17_location_info()
{
	AI_Output(other,self,"DIA_VLK_17_LOCATION_15_00");	//Które z miejsc w Khorinis warto odwiedziæ?
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_01");	//Mo¿e powinieneœ zapytaæ o to jakiegoœ mê¿czyznê. Jeœli szukasz rozrywki, udaj siê do dzielnicy portowej.
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_02");	//Jeœli jednak chcesz coœ kupiæ, udaj siê na targowisko niedaleko wschodniej bramy, lub do dolnej czêœci miasta.
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
	AI_Output(other,self,"DIA_VLK_17_STANDARD_15_00");	//Co s³ychaæ?
	if((KAPITEL == 1) || (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_01");	//Zastanawiam siê, po co paladyni pojawili siê w mieœcie. Niby przejêli kontrolê nad ratuszem, koszarami i portem, ale, jak dot¹d, nic nie robi¹.
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_02");	//Gdyby przyjechali tu zaj¹æ siê orkami lub bandytami, ju¿ dawno powinni coœ z tym zrobiæ. Musi byæ inny powód...
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_03");	//Chyba ju¿ wiem, co sprowadzi³o tu paladynów. Chodzi o rudê. Zajêliby siê lepiej ochron¹ miasta.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_04");	//Mam nadziejê, ¿e w opowieœciach o smokach jest trochê prawdy. Lord Hagen bêdzie musia³ coœ zrobiæ, nie narazi nas przecie¿ na atak bestii.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_05");	//Teraz, kiedy smoki zosta³y pokonane, paladyni nie powinni mieæ problemu ze st³umieniem pozosta³ych niepokojów.
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

