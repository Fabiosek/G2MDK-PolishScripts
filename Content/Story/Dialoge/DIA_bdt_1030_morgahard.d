
instance DIA_MORGAHARD_EXIT(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 999;
	condition = dia_morgahard_exit_condition;
	information = dia_morgahard_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_morgahard_exit_condition()
{
	return TRUE;
};

func void dia_morgahard_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_HALLO(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_hallo_condition;
	information = dia_morgahard_hallo_info;
	description = "Jeste� Morgahard.";
};


func int dia_morgahard_hallo_condition()
{
	return TRUE;
};

func void dia_morgahard_hallo_info()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_00");	//Jeste� Morgahard.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_01");	//Sk�d wiesz, jak si� nazywam?
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_02");	//Szuka ci� s�dzia. Uciek�e� z wi�zienia.
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_03");	//Jakie pope�ni�e� przest�pstwo? Ukrad�e� mu sakiewk�?
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_04");	//Nie jemu. Gubernatorowi. I to w dodatku na polecenie s�dziego.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_05");	//Po tym jak zaatakowali�my gubernatora, nie chcia� si� z nami podzieli� �upem, wi�c kaza� nas aresztowa�.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_06");	//Poniewa� nie chcieli�my sko�czy� na szubienicy, postanowili�my uciec.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_07");	//S�dzili�my, �e nigdy nie zdo�aj� nas z�apa�. Najwyra�niej si� pomylili�my.
	Info_ClearChoices(dia_morgahard_hallo);
	Info_AddChoice(dia_morgahard_hallo,"Przesta� j�cze� i stawaj do walki.",dia_morgahard_hallo_attack);
	Info_AddChoice(dia_morgahard_hallo,"Czy mo�emy w jaki� spos�b zdemaskowa� s�dziego?",dia_morgahard_hallo_richter);
	Info_AddChoice(dia_morgahard_hallo,"S�dzia kaza� mi was zabi�.",dia_morgahard_hallo_tot);
	b_logentry(TOPIC_RICHTERLAKAI,"Znalaz�em Morgaharda, przyw�dc� zbieg�w.");
	SCFOUNDMORGAHARD = TRUE;
	b_giveplayerxp(XP_FOUNDMORGAHARD);
};

func void dia_morgahard_hallo_tot()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_tot_15_00");	//S�dzia kaza� mi was zabi�.
	AI_Output(self,other,"DIA_Morgahard_HALLO_tot_07_01");	//Tak. Domy�li�em si�, �e po to tu przyszed�e�.
};

func void dia_morgahard_hallo_richter()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_00");	//Czy mo�emy w jaki� spos�b zdemaskowa� s�dziego?
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_01");	//Nie. To niemo�liwe. M�drala siedzi w g�rnym mie�cie i tylko poci�ga za sznurki. Jest nietykalny.
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_02");	//Nie by�bym tego taki pewien. Potrzebny nam tylko jaki� dow�d jego udzia�u w zbrodni.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_03");	//Dow�d, powiadasz? Mam dow�d. Ale kto chcia�by s�ucha� takiego recydywisty?
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_04");	//Przeka� mi ten dow�d, a dopilnuj�, aby nikt ju� wi�cej na ciebie nie polowa�.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_05");	//Jeste� pewien, �e chcesz si� w to miesza�? Dobrze, prosz�. Oto list z podpisem s�dziego.
	b_giveinvitems(self,other,itwr_richterkomprobrief_mis,1);
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_06");	//Nawet je�li nie oczy�ci mnie to z zarzut�w, w zupe�no�ci wystarczy, aby obci��y� cz�ci� winy s�dziego.
	b_logentry(TOPIC_RICHTERLAKAI,"Morgahard da� mi list od s�dziego, z kt�rego jasno wynika, �e ten ostatni jest odpowiedzialny za obrabowanie Gubernatora Lariusa. S�dz�, �e w�a�nie o taki dow�d prosi� mnie Lee.");
	AI_StopProcessInfos(self);
};


var int morgahardsucked;

func void dia_morgahard_hallo_attack()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_attack_15_00");	//Przesta� j�cze� i stawaj do walki. Najwy�szy czas po�o�y� temu kres.
	AI_Output(self,other,"DIA_Morgahard_HALLO_attack_07_01");	//Je�li o mnie chodzi, to i tak nie mam nic do stracenia.
	AI_StopProcessInfos(self);
	MORGAHARDSUCKED = TRUE;
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_MORGAHARD_PERM(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_perm_condition;
	information = dia_morgahard_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_morgahard_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_morgahard_hallo) && (MORGAHARDSUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_morgahard_perm_info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm_07_00");	//Mam nadziej�, �e kiedy� zobacz� t� �wini�, s�dziego, dyndaj�cego na stryczku.
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_PERM2(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_perm2_condition;
	information = dia_morgahard_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_morgahard_perm2_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MORGAHARDSUCKED == TRUE))
	{
		return TRUE;
	};
};

func void dia_morgahard_perm2_info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm2_07_00");	//Czemu po prostu nie zostawisz mnie w spokoju?
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_PICKPOCKET(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 900;
	condition = dia_morgahard_pickpocket_condition;
	information = dia_morgahard_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_morgahard_pickpocket_condition()
{
	return c_beklauen(73,45);
};

func void dia_morgahard_pickpocket_info()
{
	Info_ClearChoices(dia_morgahard_pickpocket);
	Info_AddChoice(dia_morgahard_pickpocket,DIALOG_BACK,dia_morgahard_pickpocket_back);
	Info_AddChoice(dia_morgahard_pickpocket,DIALOG_PICKPOCKET,dia_morgahard_pickpocket_doit);
};

func void dia_morgahard_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_morgahard_pickpocket);
};

func void dia_morgahard_pickpocket_back()
{
	Info_ClearChoices(dia_morgahard_pickpocket);
};

