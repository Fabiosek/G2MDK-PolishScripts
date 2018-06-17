
instance DIA_VLK_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_8_exit_condition;
	information = dia_vlk_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_8_exit_condition()
{
	return TRUE;
};

func void dia_vlk_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_8_join_condition;
	information = dia_vlk_8_join_info;
	permanent = TRUE;
	description = "Chcia�bym zosta� obywatelem tego miasta!";
};


func int dia_vlk_8_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_8_join_info()
{
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//Chcia�bym zosta� obywatelem tego miasta!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//Po co mi to m�wisz? Id� do kt�rego� z rzemie�lnik�w w dolnej cz�ci miasta. Je�li dopisze ci szcz�cie, kt�ry� przyjmie ci� na czeladnika.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//W innym wypadku b�dziesz musia� p�j�� do gubernatora i zosta� zarejestrowany jako prawny obywatel.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//W chwili obecnej mo�esz jednak o tym zapomnie�. Dop�ki w mie�cie stacjonuj� paladyni, dop�ty gubernator nie ma w�adzy w mie�cie.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//Przyw�dca paladyn�w, Lord Hagen, z pewno�ci� nie ma czasu na takie drobnostki.
};


instance DIA_VLK_8_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_8_people_condition;
	information = dia_vlk_8_people_info;
	permanent = TRUE;
	description = "Kt�rzy z obywateli miasta s� najwa�niejsi?";
};


func int dia_vlk_8_people_condition()
{
	return TRUE;
};

func void dia_vlk_8_people_info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//Kt�rzy z obywateli miasta s� najwa�niejsi?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//Opr�cz paladyn�w... Najwa�niejsi s� rzemie�lnicy z dolnej cz�ci miasta. Ich zdanie bardzo si� tu liczy.
};


instance DIA_VLK_8_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_8_location_condition;
	information = dia_vlk_8_location_info;
	permanent = TRUE;
	description = "Czy s� tutaj jakie� interesuj�ce rzeczy?";
};


func int dia_vlk_8_location_condition()
{
	return TRUE;
};

func void dia_vlk_8_location_info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//Jakie ciekawe miejsca warto tu zobaczy�?
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//Niedawno do portu wp�yn�� statek paladyn�w. Jest wielki. Koniecznie musisz go zobaczy�.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//W�tpi� jednak, by chcieli ci� wpu�ci� na pok�ad. Paladyni broni� wst�pu na statek jak klejnot�w koronnych.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//Nic dziwnego. To jedyna p�ywaj�ca jednostka zakotwiczona w okolicy.
};


instance DIA_VLK_8_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_8_standard_condition;
	information = dia_vlk_8_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_vlk_8_standard_condition()
{
	return TRUE;
};

func void dia_vlk_8_standard_info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//Co s�ycha�?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_00");	//Ostatnimi czasy wszyscy s� bardzo nerwowi.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_01");	//Jakby ma�o by�o tego, �e przybyli tu paladyni - teraz jeszcze znikaj� ludzie!
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_02");	//Najwy�sza pora, �eby stra� co� z tym zrobi�a.
		if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
		{
			Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
			b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
		};
		SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//Wszyscy czekaj� na og�oszenie powodu wizyty paladyn�w. Domy�lam si�, �e s� tu z powodu ork�w. Bestie pewnie wkr�tce zaatakuj�!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//Mo�e i paladyn�w prowadzi �aska Innosa, lecz kiedy zjawi� si� orkowe hordy, wszyscy b�dziemy straceni.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//Ludzie powiadaj�, �e jedynym powodem wizyty paladyn�w jest ch�� zabrania rudy... na potrzeby wojny na kontynencie.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//Czy wiesz, co to oznacza? Kr�l ma w g��bokim powa�aniu to, �e orkowie wszystkich nas pozabijaj�.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//Zrobi� wszystko, by by� na tym statku, kiedy paladyni zaczn� podnosi� kotwic�.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//Pono� orkowie lec� tutaj na grzbietach smok�w, wielkich jak po�owa miasta. Nie mamy �adnych szans na obron�!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//Ludzie m�wi�, �e smoki zosta�y pokonane. Czy to prawda?
	};
};

func void b_assignambientinfos_vlk_8(var C_NPC slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

