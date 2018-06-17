
instance DIA_REGIS_EXIT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 999;
	condition = dia_regis_exit_condition;
	information = dia_regis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_regis_exit_condition()
{
	return TRUE;
};

func void dia_regis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGIS_PICKPOCKET(C_INFO)
{
	npc = vlk_425_regis;
	nr = 900;
	condition = dia_regis_pickpocket_condition;
	information = dia_regis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_regis_pickpocket_condition()
{
	return c_beklauen(40,35);
};

func void dia_regis_pickpocket_info()
{
	Info_ClearChoices(dia_regis_pickpocket);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_BACK,dia_regis_pickpocket_back);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_PICKPOCKET,dia_regis_pickpocket_doit);
};

func void dia_regis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_regis_pickpocket);
};

func void dia_regis_pickpocket_back()
{
	Info_ClearChoices(dia_regis_pickpocket);
};


instance DIA_REGIS_HALLO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 1;
	condition = dia_regis_hallo_condition;
	information = dia_regis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_regis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_regis_hallo_info()
{
	AI_Output(self,other,"DIA_Regis_Hallo_13_00");	//Hej, nowy w mie�cie, co?
	AI_Output(other,self,"DIA_Regis_Hallo_15_01");	//Tak, ale co ci do tego?
	AI_Output(self,other,"DIA_Regis_Hallo_13_02");	//Niedawno przyby�em z kontynentu, teraz w��cz� si� bez celu. Z�oto niemal mi si� sko�czy�o, nie pozostanie mi wi�c chyba nic innego, jak tylko przy��czy� si� do stra�y.
	AI_Output(self,other,"DIA_Regis_Hallo_13_03");	//Nie chc� tego jednak. To �adna przyjemno�� zosta� rozszarpanym przez ork�w, w imi� Kr�la.
};


instance DIA_REGIS_MILIZ(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_miliz_condition;
	information = dia_regis_miliz_info;
	permanent = FALSE;
	description = "Co mo�esz mi powiedzie� na temat stra�y?";
};


func int dia_regis_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_hallo))
	{
		return TRUE;
	};
};

func void dia_regis_miliz_info()
{
	AI_Output(other,self,"DIA_Regis_MILIZ_15_00");	//Co mo�esz mi powiedzie� na temat stra�y?
	AI_Output(self,other,"DIA_Regis_Add_13_01");	//Jeden z paladyn�w przej�� niedawno dowodzenie. Niejaki Lord Andre.
	AI_Output(self,other,"DIA_Regis_Add_13_02");	//Pr�buje zmobilizowa� po�ow� miasta do walki przeciwko orkom.
	AI_Output(self,other,"DIA_Regis_Add_13_03");	//Jednak, �eby si� zaci�gn��, trzeba by� obywatelem miasta.
	AI_Output(self,other,"DIA_Regis_Add_13_04");	//Z tego co wiem, to nie b�d�c obywatelem, mo�na trenowa�, nie zostanie si� jednak oficjalnie przyj�tym.
};


instance DIA_REGIS_ANDRE(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_andre_condition;
	information = dia_regis_andre_info;
	permanent = FALSE;
	description = "Co jeszcze mo�esz mi powiedzie� o Lordzie Andre?";
};


func int dia_regis_andre_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_miliz))
	{
		return TRUE;
	};
};

func void dia_regis_andre_info()
{
	AI_Output(other,self,"DIA_Regis_ANDRE_15_00");	//Co jeszcze mo�esz mi powiedzie� o Lordzie Andre?
	AI_Output(self,other,"DIA_Regis_Add_13_05");	//Wiem, �e obj�� tak�e funkcj� s�dziego.
	AI_Output(self,other,"DIA_Regis_Add_13_06");	//Je�li wdasz si� w jakie� k�opoty w mie�cie, b�dziesz musia� przed nim odpowiada�.
	AI_Output(self,other,"DIA_Regis_Add_13_07");	//Zdarzy�o mi si� raz wda� w b�jk� z jednym z obywateli.
	AI_Output(self,other,"DIA_Regis_Add_13_08");	//Ten pobieg� z p�aczem do Lorda Andre i doni�s� na mnie.
	AI_Output(self,other,"DIA_Regis_Add_13_09");	//Ta drobnostka kosztowa�a mnie 50 sztuk z�ota.
	AI_Output(self,other,"DIA_Regis_Add_13_10");	//Ca�e szcz�cie, �e zaj�cie mia�o miejsce w nocy i nie by�o �wiadk�w.
	AI_Output(self,other,"DIA_Regis_Add_13_11");	//Im wi�cej os�b naskar�y na ciebie w�adzom, tym wy�sz� kar� dostaniesz.
};


instance DIA_REGIS_VALENTINO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valentino_condition;
	information = dia_regis_valentino_info;
	permanent = FALSE;
	description = "Z kim si� pobi�e�?";
};


func int dia_regis_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_andre))
	{
		return TRUE;
	};
};

func void dia_regis_valentino_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_12");	//Z kim si� pobi�e�?
	AI_Output(self,other,"DIA_Regis_Add_13_13");	//Kole� nazywa si� Valentino. Cz�sto przesiaduje w knajpie, w pobli�u �wi�tyni.
	AI_Output(self,other,"DIA_Regis_Add_13_14");	//Na og�, nie uznaj� przemocy. Ale TEN cz�owiek zas�u�y� na to, �eby przerobi� mu troch� facjat�.
};


instance DIA_REGIS_VALDEFEAT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valdefeat_condition;
	information = dia_regis_valdefeat_info;
	permanent = FALSE;
	description = "Pozna�em Valentina.";
};


func int dia_regis_valdefeat_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_valentino) && (valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_regis_valdefeat_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_15");	//Pozna�em Valentina.
	AI_Output(self,other,"DIA_Regis_Add_13_16");	//I?
	AI_Output(other,self,"DIA_Regis_Add_15_17");	//Sprawi�em mu t�gie lanie...
	AI_Output(self,other,"DIA_Regis_Add_13_18");	//Zas�ugiwa� na to...
	if(!Npc_IsDead(valentino))
	{
		AI_Output(self,other,"DIA_Regis_Add_13_19");	//Podczas naszej ma�ej sprzeczki znalaz�em przy nim ten pier�cie�.
		b_giveinvitems(self,other,itri_valentinosring,1);
		REGIS_RING = TRUE;
		AI_Output(self,other,"DIA_Regis_Add_13_20");	//Mo�esz go przekaza� nast�pnej osobie, kt�ra da mu w mord�...
	};
};


var int regis_bogendieb;

instance DIA_REGIS_PERM(C_INFO)
{
	npc = vlk_425_regis;
	nr = 200;
	condition = dia_regis_perm_condition;
	information = dia_regis_perm_info;
	permanent = TRUE;
	description = "Czy ostatnio wydarzy�o si� co� ciekawego?";
};


func int dia_regis_perm_condition()
{
	return TRUE;
};

func void dia_regis_perm_info()
{
	AI_Output(other,self,"DIA_Regis_PERM_15_00");	//Czy ostatnio wydarzy�o si� co� ciekawego?
	if((REGIS_BOGENDIEB == FALSE) && (MIS_BOSPER_BOGEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_01");	//Mo�na by tak powiedzie�.
		AI_Output(self,other,"DIA_Regis_PERM_13_02");	//Okradziono Bospera, miejscowego �uczarza. Co za tupet.
		AI_Output(self,other,"DIA_Regis_PERM_13_03");	//Kole� po prostu wszed� do sklepu, w �rodku dnia, i zabra� stamt�d �uk.
		AI_Output(self,other,"DIA_Regis_PERM_13_04");	//Bosper wyskoczy� za nim jak poparzony, krzycz�c: 'St�j, zatrzymaj si�, draniu!' Z�odziej jednak by� szybszy.
		MIS_BOSPER_BOGEN = LOG_RUNNING;
		REGIS_BOGENDIEB = TRUE;
	}
	else if((MIS_BOSPER_BOGEN == LOG_SUCCESS) && (REGIS_BOGENDIEB != 2))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_05");	//Ostatnio jaki� uczciwy znalazca odni�s� �uk Bosperowi.
		AI_Output(self,other,"DIA_Regis_PERM_13_06");	//To dziwne, mog�oby si� wydawa�, �e ka�dy chce dla siebie jak najwi�cej, a ten kole� po prostu wraca i oddaje �uk.
		REGIS_BOGENDIEB = 2;
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_07");	//C�, wszystko po staremu. Je�li zaatakuj� nas orkowie, na pewno to zauwa�ymy...
	}
	else if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_08");	//Okaza�o si�, �e najemnik by� niewinny. Z tego co wiem, wypuszczono go na wolno��.
		AI_Output(self,other,"DIA_Regis_PERM_13_09");	//Lord Hagen musi by� zielony ze z�o�ci.
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_10");	//Ca�e miasto jest rozsierdzone. Pami�tasz paladyna Lothara?
		AI_Output(other,self,"DIA_Regis_PERM_15_11");	//By� mo�e.
		AI_Output(self,other,"DIA_Regis_PERM_13_12");	//Tak czy inaczej, nie �yje. Jak zwykle, obwiniaj� najemnik�w.
	};
};


instance DIA_REGIS_CREW(C_INFO)
{
	npc = vlk_425_regis;
	nr = 51;
	condition = dia_regis_crew_condition;
	information = dia_regis_crew_info;
	permanent = FALSE;
	description = "Szukam za�ogi, kt�ra wyruszy�aby ze mn� na morze.";
};


func int dia_regis_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_regis_crew_info()
{
	AI_Output(other,self,"DIA_Regis_Crew_15_00");	//Szukam za�ogi, kt�ra wyruszy�aby ze mn� na morze.
	AI_Output(self,other,"DIA_Regis_Crew_13_01");	//W tej kwestii nie mog� ci pom�c. Powiniene� poszuka� kogo� w okolicach portu, mo�e w okolicznych knajpach.
	AI_Output(self,other,"DIA_Regis_Crew_13_02");	//Je�li w mie�cie s� jeszcze jacy� �eglarze, to pewnie tam w�a�nie ich znajdziesz.
};

