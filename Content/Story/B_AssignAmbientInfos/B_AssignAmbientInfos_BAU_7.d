
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
	description = "Co mo¿esz mi powiedzieæ o najemnikach?";
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
	AI_Output(other,self,"DIA_BAU_7_JOIN_15_00");	//Co mo¿esz mi powiedzieæ o najemnikach?
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_01");	//Onar wynaj¹³ ich, by bronili jego farmy.
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_02");	//Wiêkszoœæ z nich zachowuje siê tak, jakby farma by³a ich w³asnoœci¹. Ale to prawda, ¿e nas ochraniaj¹.
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
	AI_Output(other,self,"DIA_BAU_7_PEOPLE_15_00");	//Kto tu rz¹dzi?
	AI_Output(self,other,"DIA_BAU_7_PEOPLE_07_01");	//Du¿a farma nale¿y do Onara. Mniejsze tak¿e, ale te wynajmuje okolicznym mieszkañcom.
};


instance DIA_BAU_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_7_location_condition;
	information = dia_bau_7_location_info;
	permanent = TRUE;
	description = "Powiedz mi coœ na temat okolicy.";
};


func int dia_bau_7_location_condition()
{
	return TRUE;
};

func void dia_bau_7_location_info()
{
	AI_Output(other,self,"DIA_BAU_7_LOCATION_15_00");	//Powiedz mi coœ na temat okolicy.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_01");	//Du¿a farma po wschodniej stronie doliny nale¿y do Onara. Na pó³noc st¹d le¿y farma Sekoba.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_02");	//Jest jeszcze farma Bengara, która le¿y na wzniesieniu, na po³udniowy zachód st¹d. Mo¿esz siê tam przedostaæ z doliny - musisz jedynie wejœæ po kamiennych schodach.
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
	AI_Output(other,self,"DIA_BAU_7_STANDARD_15_00");	//Co s³ychaæ?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_01");	//Og³osiliœmy niepodleg³oœæ - nie p³acimy ju¿ podatków na rzecz miasta. Król nic nigdy dla nas nie zrobi³ - mieliœmy tego doœæ!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_02");	//W tej chwili niewiele siê tu dzieje.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_03");	//Ostatnio ludzie zaczêli opowiadaæ coœ o smokach. A król robi wszystko, ¿eby tylko wycisn¹æ z poddanych jak najwiêcej pieniêdzy.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_04");	//Uwa¿aj na siebie, wzd³u¿ prze³êczy pa³êta siê wiele podejrzanych typków i dzikich bestii.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_05");	//Teraz, po œmierci smoków, paladyni zechcieli ³askawie opuœciæ mury miasta. Czas najwy¿szy, by na ulicach znów zapanowa³ porz¹dek.
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

