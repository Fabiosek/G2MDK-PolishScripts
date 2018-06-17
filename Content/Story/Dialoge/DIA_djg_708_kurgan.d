
instance DIA_KURGAN_EXIT(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 999;
	condition = dia_kurgan_exit_condition;
	information = dia_kurgan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kurgan_exit_condition()
{
	return TRUE;
};

func void dia_kurgan_exit_info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(biff,400);
};


instance DIA_KURGAN_HELLO(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_hello_condition;
	information = dia_kurgan_hello_info;
	important = TRUE;
};


func int dia_kurgan_hello_condition()
{
	return TRUE;
};

func void dia_kurgan_hello_info()
{
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_00");	//Hej! Tacy jak ty powinni uwa¿aæ, gdzie ³a¿¹.
	AI_Output(other,self,"DIA_Kurgan_HELLO_15_01");	//Co chcesz przez to powiedzieæ?
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_02");	//A to, ¿e tutejszy klimat niespecjalnie sprzyja zdrowiu. Tu siê a¿ roi od orków i przeró¿nych potworów.
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_03");	//Nie wspominaj¹c ju¿ o smokach. Potraktuj to jako przyjacielsk¹ radê i lepiej st¹d zniknij.
	b_logentry(TOPIC_DRAGONHUNTER,"Na skraju Górniczej Doliny spotka³em grupê ³owców smoków. S¹ dobrze uzbrojeni, ale nie s¹dzê, aby zrobi³o to jakieœ wra¿enie na smokach.");
};


instance DIA_KURGAN_ELSE(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_else_condition;
	information = dia_kurgan_else_info;
	description = "Czy mo¿esz mi powiedzieæ coœ, czego jeszcze bym nie wiedzia³?";
};


func int dia_kurgan_else_condition()
{
	return TRUE;
};

func void dia_kurgan_else_info()
{
	AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");	//Czy mo¿esz mi powiedzieæ coœ, czego jeszcze bym nie wiedzia³?
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");	//Mogê ci daæ dobr¹ radê, i to w dodatku za darmo.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");	//Niepotrzebny nam tutaj miêczak mdlej¹cy po us³yszeniu najcichszego smoczego b¹ka.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");	//IdŸ do domu, to jest robota dla prawdziwych mê¿czyzn.
};


instance DIA_KURGAN_LEADER(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_leader_condition;
	information = dia_kurgan_leader_info;
	description = "Czy to ty jesteœ tutaj szefem?";
};


func int dia_kurgan_leader_condition()
{
	return TRUE;
};

func void dia_kurgan_leader_info()
{
	AI_Output(other,self,"DIA_Kurgan_Leader_15_00");	//Czy to ty jesteœ tutaj szefem?
	AI_Output(self,other,"DIA_Kurgan_Leader_01_01");	//A czy wygl¹dam na szefa? Na pewno nie. Nie potrzebujemy ¿adnych zarozumia³ych wypierdków, którzy mówiliby nam, co mamy robiæ.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_02");	//Kiedy Sylvio próbowa³ odgrywaæ rolê szefa, bardzo szybko pokazaliœmy jemu i jego kole¿kom, co na ten temat s¹dzimy.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_03");	//W koñcu opuœcili nasze towarzystwo.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_04");	//Mam nadziejê, ¿e Sylvio skoñczy³ w zupie jakiegoœ orka.
};


instance DIA_KURGAN_KILLDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_killdragon_condition;
	information = dia_kurgan_killdragon_info;
	description = "A wiêc chcesz zabijaæ smoki?";
};


func int dia_kurgan_killdragon_condition()
{
	if(Npc_KnowsInfo(other,dia_kurgan_leader))
	{
		return TRUE;
	};
};


var int kurgan_killdragon_day;

func void dia_kurgan_killdragon_info()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");	//A wiêc chcesz zabijaæ smoki?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");	//M¹drala. S¹dzisz, ¿e to takie ³atwe?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");	//Pewnie myœlisz, ¿e taka bestia usi¹dzie sobie cichutko i zaczeka, a¿ obetniesz jej g³owê?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");	//Zabijanie smoków wymaga ogromnego doœwiadczenia i zdolnoœci planowania.
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");	//Rozumiem. A jak dok³adnie przebiega takie polowanie?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");	//Najpierw musimy znaleŸæ smoki.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");	//Dopiero gdy wiemy, gdzie siê znajduj¹, mo¿emy zastanowiæ siê nad najlepszymi metodami ataku.
	KURGAN_KILLDRAGON_DAY = Wld_GetDay();
	Info_AddChoice(dia_kurgan_killdragon,"Z wielk¹ chêci¹ bym popatrzy³, ale muszê ruszaæ w dalsz¹ drogê.",dia_kurgan_killdragon_weg);
	Info_AddChoice(dia_kurgan_killdragon,"Jak zamierzasz przejœæ obok orków?",dia_kurgan_killdragon_orks);
	Info_AddChoice(dia_kurgan_killdragon,"Ty pewnie nie potrafisz znaleŸæ nawet œlepej owcy.",dia_kurgan_killdragon_spott);
};

func void dia_kurgan_killdragon_spott()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");	//Ty pewnie nie potrafisz znaleŸæ nawet œlepej owcy.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");	//Co? Czy chcesz, ¿ebym ci przy³o¿y³ w tê twoj¹ kretyñsk¹ buŸkê?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_kurgan_killdragon_orks()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");	//Jak zamierzasz przejœæ obok orków?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");	//Takimi szczegó³ami bêdziemy siê zajmowaæ póŸniej.
};

func void dia_kurgan_killdragon_weg()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");	//Z wielk¹ chêci¹ bym popatrzy³, ale muszê ruszaæ w dalsz¹ drogê.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");	//Lepiej zawróæ, jeœli nie chcesz straciæ rêki lub nogi.
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_SEENDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_seendragon_condition;
	information = dia_kurgan_seendragon_info;
	permanent = TRUE;
	description = "Widzia³eœ ju¿ kiedyœ smoka?";
};


func int dia_kurgan_seendragon_condition()
{
	if(KURGAN_KILLDRAGON_DAY <= (Wld_GetDay() - 2))
	{
		return TRUE;
	};
};

func void dia_kurgan_seendragon_info()
{
	AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");	//Widzia³eœ ju¿ kiedyœ smoka?
	AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");	//Nie, ale te bestie nie mog¹ siê wiecznie ukrywaæ.
};


instance DIA_KURGAN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 5;
	condition = dia_kurgan_alldragonsdead_condition;
	information = dia_kurgan_alldragonsdead_info;
	permanent = FALSE;
	description = "Wszystkie smoki nie ¿yj¹.";
};


func int dia_kurgan_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_kurgan_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");	//Smoki nie ¿yj¹.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");	//Ha, kto je niby zabi³? Paladyni?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//Ja.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");	//Ha-ha. Jasne, oczywiœcie. Daj spokój, kogo próbujesz nabieraæ?
};


instance DIA_KURGAN_PICKPOCKET(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 900;
	condition = dia_kurgan_pickpocket_condition;
	information = dia_kurgan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_kurgan_pickpocket_condition()
{
	return c_beklauen(34,120);
};

func void dia_kurgan_pickpocket_info()
{
	Info_ClearChoices(dia_kurgan_pickpocket);
	Info_AddChoice(dia_kurgan_pickpocket,DIALOG_BACK,dia_kurgan_pickpocket_back);
	Info_AddChoice(dia_kurgan_pickpocket,DIALOG_PICKPOCKET,dia_kurgan_pickpocket_doit);
};

func void dia_kurgan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kurgan_pickpocket);
};

func void dia_kurgan_pickpocket_back()
{
	Info_ClearChoices(dia_kurgan_pickpocket);
};

