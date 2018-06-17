
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
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_00");	//Hej! Tacy jak ty powinni uwa�a�, gdzie �a��.
	AI_Output(other,self,"DIA_Kurgan_HELLO_15_01");	//Co chcesz przez to powiedzie�?
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_02");	//A to, �e tutejszy klimat niespecjalnie sprzyja zdrowiu. Tu si� a� roi od ork�w i przer�nych potwor�w.
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_03");	//Nie wspominaj�c ju� o smokach. Potraktuj to jako przyjacielsk� rad� i lepiej st�d zniknij.
	b_logentry(TOPIC_DRAGONHUNTER,"Na skraju G�rniczej Doliny spotka�em grup� �owc�w smok�w. S� dobrze uzbrojeni, ale nie s�dz�, aby zrobi�o to jakie� wra�enie na smokach.");
};


instance DIA_KURGAN_ELSE(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_else_condition;
	information = dia_kurgan_else_info;
	description = "Czy mo�esz mi powiedzie� co�, czego jeszcze bym nie wiedzia�?";
};


func int dia_kurgan_else_condition()
{
	return TRUE;
};

func void dia_kurgan_else_info()
{
	AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");	//Czy mo�esz mi powiedzie� co�, czego jeszcze bym nie wiedzia�?
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");	//Mog� ci da� dobr� rad�, i to w dodatku za darmo.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");	//Niepotrzebny nam tutaj mi�czak mdlej�cy po us�yszeniu najcichszego smoczego b�ka.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");	//Id� do domu, to jest robota dla prawdziwych m�czyzn.
};


instance DIA_KURGAN_LEADER(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_leader_condition;
	information = dia_kurgan_leader_info;
	description = "Czy to ty jeste� tutaj szefem?";
};


func int dia_kurgan_leader_condition()
{
	return TRUE;
};

func void dia_kurgan_leader_info()
{
	AI_Output(other,self,"DIA_Kurgan_Leader_15_00");	//Czy to ty jeste� tutaj szefem?
	AI_Output(self,other,"DIA_Kurgan_Leader_01_01");	//A czy wygl�dam na szefa? Na pewno nie. Nie potrzebujemy �adnych zarozumia�ych wypierdk�w, kt�rzy m�wiliby nam, co mamy robi�.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_02");	//Kiedy Sylvio pr�bowa� odgrywa� rol� szefa, bardzo szybko pokazali�my jemu i jego kole�kom, co na ten temat s�dzimy.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_03");	//W ko�cu opu�cili nasze towarzystwo.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_04");	//Mam nadziej�, �e Sylvio sko�czy� w zupie jakiego� orka.
};


instance DIA_KURGAN_KILLDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_killdragon_condition;
	information = dia_kurgan_killdragon_info;
	description = "A wi�c chcesz zabija� smoki?";
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
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");	//A wi�c chcesz zabija� smoki?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");	//M�drala. S�dzisz, �e to takie �atwe?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");	//Pewnie my�lisz, �e taka bestia usi�dzie sobie cichutko i zaczeka, a� obetniesz jej g�ow�?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");	//Zabijanie smok�w wymaga ogromnego do�wiadczenia i zdolno�ci planowania.
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");	//Rozumiem. A jak dok�adnie przebiega takie polowanie?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");	//Najpierw musimy znale�� smoki.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");	//Dopiero gdy wiemy, gdzie si� znajduj�, mo�emy zastanowi� si� nad najlepszymi metodami ataku.
	KURGAN_KILLDRAGON_DAY = Wld_GetDay();
	Info_AddChoice(dia_kurgan_killdragon,"Z wielk� ch�ci� bym popatrzy�, ale musz� rusza� w dalsz� drog�.",dia_kurgan_killdragon_weg);
	Info_AddChoice(dia_kurgan_killdragon,"Jak zamierzasz przej�� obok ork�w?",dia_kurgan_killdragon_orks);
	Info_AddChoice(dia_kurgan_killdragon,"Ty pewnie nie potrafisz znale�� nawet �lepej owcy.",dia_kurgan_killdragon_spott);
};

func void dia_kurgan_killdragon_spott()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");	//Ty pewnie nie potrafisz znale�� nawet �lepej owcy.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");	//Co? Czy chcesz, �ebym ci przy�o�y� w t� twoj� krety�sk� bu�k�?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_kurgan_killdragon_orks()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");	//Jak zamierzasz przej�� obok ork�w?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");	//Takimi szczeg�ami b�dziemy si� zajmowa� p�niej.
};

func void dia_kurgan_killdragon_weg()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");	//Z wielk� ch�ci� bym popatrzy�, ale musz� rusza� w dalsz� drog�.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");	//Lepiej zawr��, je�li nie chcesz straci� r�ki lub nogi.
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_SEENDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_seendragon_condition;
	information = dia_kurgan_seendragon_info;
	permanent = TRUE;
	description = "Widzia�e� ju� kiedy� smoka?";
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
	AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");	//Widzia�e� ju� kiedy� smoka?
	AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");	//Nie, ale te bestie nie mog� si� wiecznie ukrywa�.
};


instance DIA_KURGAN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 5;
	condition = dia_kurgan_alldragonsdead_condition;
	information = dia_kurgan_alldragonsdead_info;
	permanent = FALSE;
	description = "Wszystkie smoki nie �yj�.";
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
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");	//Smoki nie �yj�.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");	//Ha, kto je niby zabi�? Paladyni?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//Ja.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");	//Ha-ha. Jasne, oczywi�cie. Daj spok�j, kogo pr�bujesz nabiera�?
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

