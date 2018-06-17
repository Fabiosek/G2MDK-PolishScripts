
instance DIA_BAU_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_13_exit_condition;
	information = dia_bau_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_13_exit_condition()
{
	return TRUE;
};

func void dia_bau_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_13_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_13_join_condition;
	information = dia_bau_13_join_info;
	permanent = TRUE;
	description = "Powiedz mi coœ wiêcej o tych najemnikach!";
};


func int dia_bau_13_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_13_join_info()
{
	AI_Output(other,self,"DIA_BAU_13_JOIN_15_00");	//Powiedz mi coœ wiêcej o tych najemnikach.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_01");	//Jeœli dadz¹ ci siê we znaki, to porozmawiaj z Lee. My, ch³opi, zawsze tak robimy, a on trzyma swoich ludzi krótko.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_02");	//Jeœli któryœ z nich Ÿle siê zachowuje, od razu dostaje nauczkê.
};


instance DIA_BAU_13_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_13_people_condition;
	information = dia_bau_13_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_bau_13_people_condition()
{
	return TRUE;
};

func void dia_bau_13_people_info()
{
	AI_Output(other,self,"DIA_BAU_13_PEOPLE_15_00");	//Kto tu rz¹dzi?
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_01");	//Jeœli chcesz znaæ moje zdanie, najemnicy. Fakt, Onar ich op³aca, ale chyba tylko sam Innos wie, jak d³ugo jeszcze bêd¹ go s³uchaæ.
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_02");	//Niech no tylko najemnicy pójd¹ po rozum do g³owy, a szybko wpadn¹ na to, ¿e nie jest im potrzebny. Nie chcia³bym byæ wtedy w jego skórze.
};


instance DIA_BAU_13_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_13_location_condition;
	information = dia_bau_13_location_info;
	permanent = TRUE;
	description = "Co mo¿esz mi powiedzieæ o tym miejscu?";
};


func int dia_bau_13_location_condition()
{
	return TRUE;
};

func void dia_bau_13_location_info()
{
	AI_Output(other,self,"DIA_BAU_13_LOCATION_15_00");	//Co mo¿esz mi powiedzieæ o tym miejscu?
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_01");	//W pobli¿u znajduj¹ siê trzy farmy. Farma Onara na wschodzie, zaœ u pó³nocnego ujœcia doliny gospodarstwo Sekoba.
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_02");	//Œcie¿ka pn¹ca siê na wy¿ynê, na po³udniowy zachód st¹d, prowadzi na farmê Bengara.
};


instance DIA_BAU_13_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_13_standard_condition;
	information = dia_bau_13_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_bau_13_standard_condition()
{
	return TRUE;
};

func void dia_bau_13_standard_info()
{
	AI_Output(other,self,"DIA_BAU_13_STANDARD_15_00");	//Co s³ychaæ?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_01");	//Od kiedy zaczêliœmy siê broniæ, oddzia³y stacjonuj¹ce w mieœcie przesta³y rozkradaæ nasze zbiory i inwentarz! Chyba zbytnio siê nas boj¹!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_02");	//Paladyni z miasta nie za bardzo przejmuj¹ siê naszym losem. Jeœli orkowie zaatakuj¹, bêdziemy zdani tylko na siebie.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_03");	//I jeszcze smoki! Plotka g³osi, ¿e bestie pojawi³y siê w Górniczej Dolinie. Ponoæ wkrótce maj¹ przeprawiæ siê przez prze³êcz!
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_04");	//Mówi siê nawet o tym, jakoby bandyci z gór zmierzali w stronê Górniczej Doliny. Jak dla mnie, to trochê za du¿o niebezpieczeñstw.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_05");	//Kiedy podatki spadn¹ do jakichœ sensownych wartoœci, a my bêdziemy przyzwoicie zarabiaæ, wtedy znów zaczniemy handlowaæ z miastem.
	};
};

func void b_assignambientinfos_bau_13(var C_NPC slf)
{
	dia_bau_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_standard.npc = Hlp_GetInstanceID(slf);
};

