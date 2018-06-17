
instance DIA_OCVLK_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocvlk_6_exit_condition;
	information = dia_ocvlk_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocvlk_6_exit_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocvlk_6_people_condition;
	information = dia_ocvlk_6_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_ocvlk_6_people_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_people_info()
{
	AI_Output(other,self,"DIA_OCVLK_6_PEOPLE_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_01");	//Fortem, a w�a�ciwie tym, co z niego zosta�o, zarz�dza Garond.
	AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_02");	//Jednak niczym nie zajmuje si� osobi�cie - chyba �e kt�ry� z jego ludzi wpadnie w jaki� tarapaty.
	if(Npc_IsDead(engor) == FALSE)
	{
		AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_03");	//Je�li szukasz wyposa�enia, porozmawiaj lepiej z Engorem. Znajdziesz go w budynku naprzeciw siedziby Garonda.
	};
};


instance DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocvlk_6_location_condition;
	information = dia_ocvlk_6_location_info;
	permanent = TRUE;
	description = "Powiedz mi co� na temat sytuacji w G�rniczej Dolinie.";
};


func int dia_ocvlk_6_location_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_6_location_info()
{
	AI_Output(other,self,"DIA_OCVLK_6_LOCATION_15_00");	//Powiedz mi co� na temat sytuacji w G�rniczej Dolinie.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_01");	//Martwi� si� orkow� palisad�. Nie wiem nawet, co si� za ni� kryje.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_02");	//Na pocz�tku kilku z nich wybudowa�o mur. Potem, pewnej nocy, sprowadzili machiny obl�nicze.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_03");	//Mamy szcz�cie, �e uda�o si� nam odeprze� atak.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_04");	//Za palisad� znajduje si� przysta�. Je�li orkowie otrzymaj� dostawy zapas�w drog� morsk�, b�dziemy zgubieni.
};


instance DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocvlk_6_standard_condition;
	information = dia_ocvlk_6_standard_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_ocvlk_6_standard_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_standard_info()
{
	AI_Output(other,self,"DIA_OCVLK_6_STANDARD_15_00");	//Jak leci?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_01");	//Przy��cz si� do armii, m�wili, zasmakuj przygody, m�wili. A teraz... no, sam popatrz.
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_02");	//W tej chwili nawet za zbli�enie si� do zapas�w jedzenia grozi kara �mierci. Garond chyba si� obawia, �e ukradniemy co si� da i damy drapaka.
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_03");	//Je�li te przekl�te smoki nas nie pozabijaj�, to pewnie wszyscy zdechniemy tu z g�odu.
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_04");	//�owcy smok�w! Nie roz�mieszaj mnie! Ci ludzie niczego tu nie zmieni�.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_05");	//Podobno smoki zosta�y zg�adzone. Mo�e jednak jest dla nas jaka� nadzieja!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_06");	//Przekl�ta ruda. Powinni�my zrzuci� ca�y jej zapas z barykad. Mo�e wtedy orkowie zostawiliby nas w spokoju.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_07");	//Te �a�osne skrzynie porozrzucane bez�adnie przed bram� nie zatrzymaj� orkowych atak�w!
		};
	};
};

func void b_assignambientinfos_ocvlk_6(var C_NPC slf)
{
	dia_ocvlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

