
instance DIA_BAU_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_1_exit_condition;
	information = dia_bau_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_1_exit_condition()
{
	return TRUE;
};

func void dia_bau_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_1_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_1_join_condition;
	information = dia_bau_1_join_info;
	permanent = TRUE;
	description = "Powiedz mi coœ wiêcej o tych najemnikach!";
};


func int dia_bau_1_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_1_join_info()
{
	AI_Output(other,self,"DIA_BAU_1_JOIN_15_00");	//Powiedz mi coœ wiêcej o tych najemnikach!
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_01");	//Najlepiej, ¿ebyœ ich omija³ szerokim ³ukiem. To moja jedyna rada.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_02");	//Wystarczy, ¿e któremuœ nie spodoba siê twoja gêba i dostaniesz w nos bez ostrze¿enia.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_03");	//Jasne, zawsze mo¿esz o tym donieœæ Lee, ale nos i tak nie bêdzie ju¿ taki jak kiedyœ.
};


instance DIA_BAU_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_1_people_condition;
	information = dia_bau_1_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_bau_1_people_condition()
{
	return TRUE;
};

func void dia_bau_1_people_info()
{
	AI_Output(other,self,"DIA_BAU_1_PEOPLE_15_00");	//Kto tu rz¹dzi?
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_01");	//To farma Onara i on podejmuje tu wszystkie wa¿ne decyzje.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_02");	//Pozwól, ¿e dam ci pewn¹ radê: nie wdawaj siê w bójki z jego najemnikami. Ci ch³opcy nie lubi¹, kiedy wchodzi im siê w drogê.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_03");	//Szczególnie ten Sylvio to strasznie wredny ³otr. Jednak ich przywódca, Lee, jest jak najbardziej w porz¹dku.
};


instance DIA_BAU_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_1_location_condition;
	information = dia_bau_1_location_info;
	permanent = TRUE;
	description = "Co mo¿esz mi powiedzieæ o tej okolicy?";
};


func int dia_bau_1_location_condition()
{
	return TRUE;
};

func void dia_bau_1_location_info()
{
	AI_Output(other,self,"DIA_BAU_1_LOCATION_15_00");	//Co mo¿esz mi powiedzieæ o tej okolicy?
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_01");	//Na oko³o tylko pola i farmy. I najemnicy, co to w³ócz¹ siê zw³aszcza na wschód od farmy Onara.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_02");	//Na pó³noc st¹d le¿y farma Sekoba, ale najemnicy pojawiaj¹ siê tam tylko po to, by zebraæ czynsz.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_03");	//Na po³udniowym zachodzie le¿y farma Bengara.
};


instance DIA_BAU_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_1_standard_condition;
	information = dia_bau_1_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_bau_1_standard_condition()
{
	return TRUE;
};

func void dia_bau_1_standard_info()
{
	AI_Output(other,self,"DIA_BAU_1_STANDARD_15_00");	//Co s³ychaæ?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_01");	//Onar wynaj¹³ najemników, którzy maj¹ odstraszaæ stra¿ników miejskich. Inaczej rozkradliby nasz dobytek do ostatniej owcy!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_02");	//Niewiele siê dzieje. Wci¹¿ te same problemy. Stra¿, orkowie, polne bestie.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_03");	//Ostatnio dziej¹ siê tu dziwne rzeczy. Kilka nocy temu widzia³em czarn¹ postaæ. To nie by³ cz³owiek.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_04");	//Pojawia siê coraz wiêcej orków. Czasem tak sobie myœlê, ¿e miejsce ka¿dego zabitego zajmuj¹ dwaj nowi.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_05");	//Paladyni wyruszaj¹ do Górniczej Doliny. O co w tym wszystkim chodzi? Jak tak dalej pójdzie, nie bêdzie nikogo, by powstrzymaæ stra¿ miejsk¹.
	};
};

func void b_assignambientinfos_bau_1(var C_NPC slf)
{
	dia_bau_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_standard.npc = Hlp_GetInstanceID(slf);
};

