
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
	description = "Jesteœ Morgahard.";
};


func int dia_morgahard_hallo_condition()
{
	return TRUE;
};

func void dia_morgahard_hallo_info()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_00");	//Jesteœ Morgahard.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_01");	//Sk¹d wiesz, jak siê nazywam?
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_02");	//Szuka ciê sêdzia. Uciek³eœ z wiêzienia.
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_03");	//Jakie pope³ni³eœ przestêpstwo? Ukrad³eœ mu sakiewkê?
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_04");	//Nie jemu. Gubernatorowi. I to w dodatku na polecenie sêdziego.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_05");	//Po tym jak zaatakowaliœmy gubernatora, nie chcia³ siê z nami podzieliæ ³upem, wiêc kaza³ nas aresztowaæ.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_06");	//Poniewa¿ nie chcieliœmy skoñczyæ na szubienicy, postanowiliœmy uciec.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_07");	//S¹dziliœmy, ¿e nigdy nie zdo³aj¹ nas z³apaæ. NajwyraŸniej siê pomyliliœmy.
	Info_ClearChoices(dia_morgahard_hallo);
	Info_AddChoice(dia_morgahard_hallo,"Przestañ jêczeæ i stawaj do walki.",dia_morgahard_hallo_attack);
	Info_AddChoice(dia_morgahard_hallo,"Czy mo¿emy w jakiœ sposób zdemaskowaæ sêdziego?",dia_morgahard_hallo_richter);
	Info_AddChoice(dia_morgahard_hallo,"Sêdzia kaza³ mi was zabiæ.",dia_morgahard_hallo_tot);
	b_logentry(TOPIC_RICHTERLAKAI,"Znalaz³em Morgaharda, przywódcê zbiegów.");
	SCFOUNDMORGAHARD = TRUE;
	b_giveplayerxp(XP_FOUNDMORGAHARD);
};

func void dia_morgahard_hallo_tot()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_tot_15_00");	//Sêdzia kaza³ mi was zabiæ.
	AI_Output(self,other,"DIA_Morgahard_HALLO_tot_07_01");	//Tak. Domyœli³em siê, ¿e po to tu przyszed³eœ.
};

func void dia_morgahard_hallo_richter()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_00");	//Czy mo¿emy w jakiœ sposób zdemaskowaæ sêdziego?
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_01");	//Nie. To niemo¿liwe. M¹drala siedzi w górnym mieœcie i tylko poci¹ga za sznurki. Jest nietykalny.
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_02");	//Nie by³bym tego taki pewien. Potrzebny nam tylko jakiœ dowód jego udzia³u w zbrodni.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_03");	//Dowód, powiadasz? Mam dowód. Ale kto chcia³by s³uchaæ takiego recydywisty?
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_04");	//Przeka¿ mi ten dowód, a dopilnujê, aby nikt ju¿ wiêcej na ciebie nie polowa³.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_05");	//Jesteœ pewien, ¿e chcesz siê w to mieszaæ? Dobrze, proszê. Oto list z podpisem sêdziego.
	b_giveinvitems(self,other,itwr_richterkomprobrief_mis,1);
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_06");	//Nawet jeœli nie oczyœci mnie to z zarzutów, w zupe³noœci wystarczy, aby obci¹¿yæ czêœci¹ winy sêdziego.
	b_logentry(TOPIC_RICHTERLAKAI,"Morgahard da³ mi list od sêdziego, z którego jasno wynika, ¿e ten ostatni jest odpowiedzialny za obrabowanie Gubernatora Lariusa. S¹dzê, ¿e w³aœnie o taki dowód prosi³ mnie Lee.");
	AI_StopProcessInfos(self);
};


var int morgahardsucked;

func void dia_morgahard_hallo_attack()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_attack_15_00");	//Przestañ jêczeæ i stawaj do walki. Najwy¿szy czas po³o¿yæ temu kres.
	AI_Output(self,other,"DIA_Morgahard_HALLO_attack_07_01");	//Jeœli o mnie chodzi, to i tak nie mam nic do stracenia.
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
	AI_Output(self,other,"DIA_Morgahard_Perm_07_00");	//Mam nadziejê, ¿e kiedyœ zobaczê tê œwiniê, sêdziego, dyndaj¹cego na stryczku.
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

