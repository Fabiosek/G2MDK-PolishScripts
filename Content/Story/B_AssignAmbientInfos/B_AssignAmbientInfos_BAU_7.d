
instance DIA_BAU_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_7_exit_condition;
	information = dia_bau_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_7_exit_condition()
{
	return TRUE;
};

func void dia_bau_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_7_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_7_join_condition;
	information = dia_bau_7_join_info;
	permanent = TRUE;
	description = "Co mo�esz mi powiedzie� o najemnikach?";
};


func int dia_bau_7_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_7_join_info()
{
	AI_Output(other,self,"DIA_BAU_7_JOIN_15_00");	//Co mo�esz mi powiedzie� o najemnikach?
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_01");	//Onar wynaj�� ich, by bronili jego farmy.
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_02");	//Wi�kszo�� z nich zachowuje si� tak, jakby farma by�a ich w�asno�ci�. Ale to prawda, �e nas ochraniaj�.
};


instance DIA_BAU_7_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_7_people_condition;
	information = dia_bau_7_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_bau_7_people_condition()
{
	return TRUE;
};

func void dia_bau_7_people_info()
{
	AI_Output(other,self,"DIA_BAU_7_PEOPLE_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"DIA_BAU_7_PEOPLE_07_01");	//Du�a farma nale�y do Onara. Mniejsze tak�e, ale te wynajmuje okolicznym mieszka�com.
};


instance DIA_BAU_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_7_location_condition;
	information = dia_bau_7_location_info;
	permanent = TRUE;
	description = "Powiedz mi co� na temat okolicy.";
};


func int dia_bau_7_location_condition()
{
	return TRUE;
};

func void dia_bau_7_location_info()
{
	AI_Output(other,self,"DIA_BAU_7_LOCATION_15_00");	//Powiedz mi co� na temat okolicy.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_01");	//Du�a farma po wschodniej stronie doliny nale�y do Onara. Na p�noc st�d le�y farma Sekoba.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_02");	//Jest jeszcze farma Bengara, kt�ra le�y na wzniesieniu, na po�udniowy zach�d st�d. Mo�esz si� tam przedosta� z doliny - musisz jedynie wej�� po kamiennych schodach.
};


instance DIA_BAU_7_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_7_standard_condition;
	information = dia_bau_7_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_bau_7_standard_condition()
{
	return TRUE;
};

func void dia_bau_7_standard_info()
{
	AI_Output(other,self,"DIA_BAU_7_STANDARD_15_00");	//Co s�ycha�?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_01");	//Og�osili�my niepodleg�o�� - nie p�acimy ju� podatk�w na rzecz miasta. Kr�l nic nigdy dla nas nie zrobi� - mieli�my tego do��!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_02");	//W tej chwili niewiele si� tu dzieje.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_03");	//Ostatnio ludzie zacz�li opowiada� co� o smokach. A kr�l robi wszystko, �eby tylko wycisn�� z poddanych jak najwi�cej pieni�dzy.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_04");	//Uwa�aj na siebie, wzd�u� prze��czy pa��ta si� wiele podejrzanych typk�w i dzikich bestii.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_05");	//Teraz, po �mierci smok�w, paladyni zechcieli �askawie opu�ci� mury miasta. Czas najwy�szy, by na ulicach zn�w zapanowa� porz�dek.
	};
};

func void b_assignambientinfos_bau_7(var C_NPC slf)
{
	dia_bau_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_standard.npc = Hlp_GetInstanceID(slf);
};

