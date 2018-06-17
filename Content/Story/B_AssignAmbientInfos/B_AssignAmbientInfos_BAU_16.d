
instance DIA_BAU_16_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_16_exit_condition;
	information = dia_bau_16_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_16_exit_condition()
{
	return TRUE;
};

func void dia_bau_16_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_16_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_16_join_condition;
	information = dia_bau_16_join_info;
	permanent = TRUE;
	description = "Powiedz mi co� wi�cej o tych najemnikach!";
};


func int dia_bau_16_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_16_join_info()
{
	AI_Output(other,self,"DIA_BAU_16_JOIN_15_00");	//Powiedz mi co� wi�cej o tych najemnikach!
	AI_Output(self,other,"DIA_BAU_16_JOIN_16_01");	//Ca�ymi dniami w��cz� si� po farmie, od czasu do czasu dadz� sobie po pyskach i najwyra�niej dobrze si� bawi�.
};


instance DIA_BAU_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_16_people_condition;
	information = dia_bau_16_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_bau_16_people_condition()
{
	return TRUE;
};

func void dia_bau_16_people_info()
{
	AI_Output(other,self,"DIA_BAU_16_PEOPLE_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_01");	//Je�li chcesz zna� moje zdanie, najemnicy.
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_02");	//Onar wprawdzie im p�aci, ale i tak robi� przewa�nie to, co im si� �ywnie podoba.
};


instance DIA_BAU_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_16_location_condition;
	information = dia_bau_16_location_info;
	permanent = TRUE;
	description = "Co mo�esz mi powiedzie� o tym miejscu?";
};


func int dia_bau_16_location_condition()
{
	return TRUE;
};

func void dia_bau_16_location_info()
{
	AI_Output(other,self,"DIA_BAU_16_LOCATION_15_00");	//Co mo�esz mi powiedzie� o tej okolicy?
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_01");	//W pobli�u znajduj� si� trzy farmy. Farma Onara na wschodzie, za� na p�nocnym kra�cu doliny gospodarstwo Sekoba.
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_02");	//�cie�ka pn�ca si� na wy�yn�, na po�udniowy wsch�d st�d, prowadzi na farm� Bengara.
};


instance DIA_BAU_16_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_16_standard_condition;
	information = dia_bau_16_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_bau_16_standard_condition()
{
	return TRUE;
};

func void dia_bau_16_standard_info()
{
	AI_Output(other,self,"DIA_BAU_16_STANDARD_15_00");	//Co s�ycha�?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_01");	//Od kiedy okaza�o si�, �e potrafimy si� broni�, oddzia�y z miasta przesta�y rozkrada� nasze zbiory i inwentarz! Chyba zbytnio si� nas boj�!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_02");	//Ludzie powiadaj�, �e w G�rniczej Dolinie gromadzi si� armia. Pono� wkr�tce tu nadci�gnie.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_03");	//Plotka g�osi, �e w G�rniczej Dolinie zadomowi�y si� smoki, ale jako� trudno mi w to uwierzy�.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_04");	//Niekt�rzy z najemnik�w odeszli. W�a�ciwie nie wiem, czy to dobrze, czy to �le.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_05");	//Swoj� drog� zastanawiam si�, po co w�a�ciwie wysy�aj� tylu paladyn�w do G�rniczej Doliny, o co w tym wszystkim chodzi?
	};
};

func void b_assignambientinfos_bau_16(var C_NPC slf)
{
	dia_bau_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_standard.npc = Hlp_GetInstanceID(slf);
};

