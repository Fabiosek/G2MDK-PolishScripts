
instance DIA_OCVLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocvlk_1_exit_condition;
	information = dia_ocvlk_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocvlk_1_exit_condition()
{
	return TRUE;
};

func void dia_ocvlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocvlk_1_people_condition;
	information = dia_ocvlk_1_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_ocvlk_1_people_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_1_people_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_PEOPLE_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"DIA_OCVLK_1_PEOPLE_01_01");	//Kapitan Garond. Odk�d jednak walki uleg�y zaostrzeniu, nie rusza si� z sali tronowej na krok. Obawiam si�, �e ca�a sprawa �le si� sko�czy.
};


instance DIA_OCVLK_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocvlk_1_location_condition;
	information = dia_ocvlk_1_location_info;
	permanent = TRUE;
	description = "Co wiesz o G�rniczej Dolinie?";
};


func int dia_ocvlk_1_location_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_1_location_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_LOCATION_15_00");	//Co wiesz o G�rniczej Dolinie?
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_01");	//Wydaje mi si�, �e kilku naszych ch�opak�w wci�� pracuje w kopalniach.
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_02");	//Jednak nie zdecydowa�bym si� na handel z nimi. Ca�a dolina zaj�ta jest przez ork�w. Nie wspomn� ju� o smokach.
};


instance DIA_OCVLK_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocvlk_1_standard_condition;
	information = dia_ocvlk_1_standard_info;
	permanent = TRUE;
	description = "Jak leci?";
};


func int dia_ocvlk_1_standard_condition()
{
	return TRUE;
};

func void dia_ocvlk_1_standard_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_STANDARD_15_00");	//Jak si� maj� sprawy?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_01");	//Orkowie zap�dzili nas w kozi r�g! Bez posi�k�w d�ugo nie wytrzymamy, wszyscy zgin�! Zreszt� dziwi mnie fakt, �e smoki nas nie wyko�czy�y.
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_02");	//Przynajmniej posi�ki dotar�y na czas.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_03");	//S�ysza�em, �e smoki zosta�y zabite? Innosowi niech b�d� dzi�ki!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_04");	//Przekl�ta ruda. Powinni�my zrzuci� ca�y jej zapas z barykad. Mo�e wtedy orkowie zostawiliby nas w spokoju.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_05");	//Ta sterta skrzy� porozrzucana bez�adnie przed bram� na pewno nie zatrzyma ork�w!
		};
	};
};

func void b_assignambientinfos_ocvlk_1(var C_NPC slf)
{
	dia_ocvlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

