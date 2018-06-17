
instance DIA_OCPAL_9_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocpal_9_exit_condition;
	information = dia_ocpal_9_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocpal_9_exit_condition()
{
	return TRUE;
};

func void dia_ocpal_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_9_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocpal_9_people_condition;
	information = dia_ocpal_9_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_ocpal_9_people_condition()
{
	return TRUE;
};

func void dia_ocpal_9_people_info()
{
	AI_Output(other,self,"DIA_OCPAL_9_PEOPLE_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"DIA_OCPAL_9_PEOPLE_09_01");	//Zamkiem dowodzi kapitan Garond. Choæ pewnie nie mo¿na mu zazdroœciæ tej posady.
};


instance DIA_OCPAL_9_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocpal_9_location_condition;
	information = dia_ocpal_9_location_info;
	permanent = TRUE;
	description = "Co wiesz o tej dolinie?";
};


func int dia_ocpal_9_location_condition()
{
	return TRUE;
};

func void dia_ocpal_9_location_info()
{
	AI_Output(other,self,"DIA_OCPAL_9_LOCATION_15_00");	//Co wiesz o tej dolinie?
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_01");	//W jej wschodniej czêœci orkowie wybudowali potê¿ny mur, chroni¹cy ich zapasy. Za nim znajduje siê dojœcie do przystani, przy której cumuj¹ swoje statki.
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_02");	//Mam nadziejê, ¿e zapasy nie dotr¹ do orków zbyt szybko. OBECNE problemy zupe³nie nam wystarczaj¹.
};


instance DIA_OCPAL_9_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocpal_9_standard_condition;
	information = dia_ocpal_9_standard_info;
	permanent = TRUE;
	description = "Jak leci?";
};


func int dia_ocpal_9_standard_condition()
{
	return TRUE;
};

func void dia_ocpal_9_standard_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//Jak siê maj¹ sprawy?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_01");	//Smoki zaatakowa³y ponownie! Jednak Innos ochroni nas w walce. Monstra Belaira zap³ac¹ za to wszystko w³asn¹ krwi¹!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_02");	//£owcy smoków! Powinni byli przys³aæ tu paladynów!
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_03");	//Teraz, kiedy nie ma ju¿ smoków, jedynym problemem pozostaj¹ orkowie!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_04");	//Musimy jak najszybciej za³adowaæ rudê na statki i uciekaæ z tej przeklêtej krainy.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_05");	//Zdrada! Brama nie powinna zostaæ otwarta. Œmieræ zdrajcom!
		};
	};
};

func void b_assignambientinfos_ocpal_9(var C_NPC slf)
{
	dia_ocpal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_standard.npc = Hlp_GetInstanceID(slf);
};

