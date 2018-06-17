
instance DIA_PABLO_EXIT(C_INFO)
{
	npc = mil_319_pablo;
	nr = 999;
	condition = dia_pablo_exit_condition;
	information = dia_pablo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pablo_exit_condition()
{
	return TRUE;
};

func void dia_pablo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_PICKPOCKET(C_INFO)
{
	npc = mil_319_pablo;
	nr = 900;
	condition = dia_pablo_pickpocket_condition;
	information = dia_pablo_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego klucza b�dzie dziecinnie �atwa)";
};


func int dia_pablo_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_01) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_pablo_pickpocket_info()
{
	Info_ClearChoices(dia_pablo_pickpocket);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_BACK,dia_pablo_pickpocket_back);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_PICKPOCKET,dia_pablo_pickpocket_doit);
};

func void dia_pablo_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itke_city_tower_01,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_pablo_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_pablo_pickpocket_back()
{
	Info_ClearChoices(dia_pablo_pickpocket);
};


var int pablo_belogen;

instance DIA_PABLO_WANTED(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_wanted_condition;
	information = dia_pablo_wanted_info;
	important = TRUE;
};


func int dia_pablo_wanted_condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pablo_wanted_info()
{
	AI_Output(self,other,"DIA_Pablo_WANTED_12_00");	//Hej ty, zaczekaj! Chyba gdzie� ci� ju� widzia�em.
	AI_Output(other,self,"DIA_Pablo_WANTED_15_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Pablo_WANTED_12_02");	//M�wi� przecie�, �e ju� ci� gdzie� widzia�em... a, tak!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Pablo_WANTED_12_03");	//Sp�jrz - znale�li�my ten portret przy bandytach, na kt�rych natkn�li�my si� kilka dni temu - facet wygl�da zupe�nie jak ty.
	b_giveinvitems(self,other,itwr_poster_mis,1);
	AI_Output(self,other,"DIA_Pablo_WANTED_12_04");	//Ci kolesie chyba ci� szukali.
	Info_ClearChoices(dia_pablo_wanted);
	Info_AddChoice(dia_pablo_wanted,"Nie, mylisz si�.",dia_pablo_wanted_nothing);
	Info_AddChoice(dia_pablo_wanted,"No, no. Sam bym na to nie wpad�.",dia_pablo_wanted_irony);
};

func void dia_pablo_wanted_nothing()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00");	//Mylisz si�. Jak widzisz, wszystko ze mn� w porz�dku...
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01");	//Jak uwa�asz, nieznajomy...
	AI_Output(self,other,"DIA_Pablo_Add_12_00");	//Je�li jednak portret przedstawia TWOJ� g�b�, a ty wmiesza�e� si� w jakie� k�opoty, to trzymaj si� z dala od miasta. Nie potrzeba nam wi�cej problem�w.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03");	//Nie potrzebujemy tu �adnych zabijak�w - mam nadziej�, �e wyra�am si� jasno.
	PABLO_BELOGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pablo_wanted_irony()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");	//No, no. Sam bym na to nie wpad�.
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");	//Bardzo �mieszne... gadaj lepiej, czego chcieli od ciebie ci ludzie?
	AI_Output(other,self,"DIA_Pablo_Add_15_01");	//Zapytaj ich o to sam. Chyba ich zamkn��e�, prawda?
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");	//Nie - nie �yj�.
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");	//W takim razie nigdy si� nie dowiemy.
	AI_Output(self,other,"DIA_Pablo_Add_12_02");	//Je�li masz jakie� k�opoty, porozmawiaj z Lordem Andre. Mo�e on b�dzie w stanie ci pom�c. Znajdziesz go w koszarach.
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_BANDITEN(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_banditen_condition;
	information = dia_pablo_banditen_info;
	permanent = FALSE;
	description = "Co wiesz na temat bandyt�w?";
};


func int dia_pablo_banditen_condition()
{
	return TRUE;
};

func void dia_pablo_banditen_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_03");	//Co wiesz o bandytach?
	AI_Output(self,other,"DIA_Pablo_Add_12_04");	//Przybyli z tej zakichanej kolonii g�rniczej. Jest jednak kilka oddzielnych grup.
	AI_Output(self,other,"DIA_Pablo_Add_12_05");	//Niekt�rzy ukryli si� w g�rach, inni do��czyli do Onara, w�a�ciciela ziemskiego.
	AI_Output(self,other,"DIA_Pablo_Add_12_06");	//Jednak to bandyci na obrze�ach miasta powoduj� najwi�cej problem�w.
	AI_Output(self,other,"DIA_Pablo_Add_12_07");	//To przez nich kupcy nie wy�ciubiaj� nos�w poza granice miasta.
};


instance DIA_PABLO_HAKONBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_hakonbandits_condition;
	information = dia_pablo_hakonbandits_info;
	permanent = FALSE;
	description = "Co wiesz o bandytach, kt�rzy obrabowali kupca Hakona?";
};


func int dia_pablo_hakonbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_miliz) && Npc_KnowsInfo(other,dia_pablo_banditen))
	{
		return TRUE;
	};
};

func void dia_pablo_hakonbandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_20");	//Co wiesz o bandytach, kt�rzy obrabowali kupca Hakona?
	AI_Output(self,other,"DIA_Pablo_Add_12_21");	//Och, o tej sprawie m�wisz. Nawet mi jej nie przypominaj...
	AI_Output(self,other,"DIA_Pablo_Add_12_22");	//Podobno ta grupa jest odpowiedzialna za wiele atak�w na kupc�w.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_01");	//Ostatnio te szczury powpe�za�y do swoich nor i boj� si� wy�ciubi� nosa.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_02");	//Kiedy� wytropili�my ich, ale �lad urwa� si� nagle w lasach za miastem.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_03");	//W tamtych okolicach grasuje wiele potwor�w, to zbyt niebezpieczne miejsce.
	b_logentry(TOPIC_HAKONBANDITEN,"Bandyci, kt�rzy obrabowali Hakona, ukrywaj� si� w lasach w pobli�u miasta.");
	if(PABLO_ANDREMELDEN == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_23");	//Jest jeszcze co�...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_04");	//Niekt�re ze skradzionych towar�w pojawi�y si� w Khorinis.
		AI_Output(other,self,"DIA_Pablo_Banditen_15_05");	//Oznacza�oby to, �e bandyci przemycaj� towary do miasta, i tam je sprzedaj�.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_06");	//No c�, podejrzewamy, �e maj� swojego cz�owieka w�r�d stra�nik�w. Jak dot�d nie uda�o si� go jednak z�apa�.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_07");	//Je�li dowiesz si� czego� na ten temat, pami�taj - Lord Andre wyznaczy� nagrod� za odnalezienie tego zdrajcy.
		b_logentry(TOPIC_HAKONBANDITEN,"Bandyci s� prawdopodobnie w zmowie z jakim� dealerem w mie�cie. Za jego schwytanie Lord Andre wyznaczy� nagrod�.");
	};
};


instance DIA_PABLO_MYBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 4;
	condition = dia_pablo_mybandits_condition;
	information = dia_pablo_mybandits_info;
	permanent = FALSE;
	description = "Sk�d przybyli bandyci, kt�rzy mieli list go�czy z moj� podobizn�?";
};


func int dia_pablo_mybandits_condition()
{
	if(Npc_KnowsInfo(other,dia_pablo_banditen) && Npc_KnowsInfo(other,dia_pablo_wanted))
	{
		return TRUE;
	};
};

func void dia_pablo_mybandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_08");	//Sk�d przybyli bandyci, kt�rzy mieli list go�czy z moj� podobizn�?
	if(PABLO_BELOGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_09");	//Aha! Wi�c to jednak TWOJA g�ba znajduje si� na tym papierze. Dlaczego si� od razu nie przyzna�e�, co?
		AI_Output(self,other,"DIA_Pablo_Add_12_10");	//Za co jeste� poszukiwany?
		AI_Output(other,self,"DIA_Pablo_Add_15_11");	//Nie wiem - szczerze!
		AI_Output(self,other,"DIA_Pablo_Add_12_12");	//Tak, tak. Wiem. Pozw�l, �e co� ci powiem - gdybym wiedzia�, �e trzymasz sztam� z tymi bandytami, dawno siedzia�by� w pierdlu, rozumiesz?
		AI_Output(self,other,"DIA_Pablo_Add_12_13");	//Mimo to musz� zg�osi� ten przypadek Lordowi Andre...
		PABLO_ANDREMELDEN = TRUE;
		AI_Output(self,other,"DIA_Pablo_Add_12_14");	//Wracaj�c jednak do twojego pytania...
	};
	AI_Output(self,other,"DIA_Pablo_Add_12_15");	//Natkn�li�my si� na nich niedaleko domu w�a�ciciela ziemskiego.
	AI_Output(self,other,"DIA_Pablo_Add_12_16");	//Nie wygl�dali jednak jak banda Onara.
	AI_Output(self,other,"DIA_Pablo_Add_12_17");	//Wydaje mi si�, �e to cz�� mniejszej grupy, kt�ra osiedli�a si� w g�rach, niedaleko posiad�o�ci Onara.
	AI_Output(self,other,"DIA_Pablo_Add_12_18");	//Je�li si� tam wybierasz, przyjmij ostrze�enie. Ci szubrawcy kr�tko si� z tob� rozprawi�!
	AI_Output(other,self,"DIA_Pablo_Add_15_19");	//Zapami�tam to.
};


instance DIA_PABLO_PERM(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_perm_condition;
	information = dia_pablo_perm_info;
	permanent = TRUE;
	description = "Jak wygl�da sytuacja?";
};


func int dia_pablo_perm_condition()
{
	return TRUE;
};

func void dia_pablo_perm_info()
{
	AI_Output(other,self,"DIA_Pablo_Perm_15_00");	//Jak wygl�da sytuacja?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_01");	//Zawsze powtarza�em, �e najemnikom nie wolno ufa�.
				AI_Output(self,other,"DIA_Pablo_Perm_12_02");	//Najwy�szy czas da� tym szumowinom nauczk�. Bennet przecie� sam nie wymy�li� tego wszystkiego.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_03");	//�mier� paladyna Lothara wstrz�sn�a mn� do g��bi.
				AI_Output(self,other,"DIA_Pablo_Perm_12_04");	//Wiem jednak, �e s�udzy �wi�tyni odnajd� winnego i surowo go ukarz�.
			}
			else
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05");	//Po co w��czysz si� po okolicy? Je�li chcesz uwolni� tego najemnika, swego kole�k�, to lepiej od razu o tym zapomnij.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Pablo_Perm_12_06");	//To �a�osne, teraz pr�buj� nas ze sob� sk��ci�.
			AI_Output(self,other,"DIA_Pablo_Perm_12_07");	//Gdyby nie uda�o ci si� odnale�� prawdziwego winowajcy, orkowie mieliby znacznie u�atwion� spraw�.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_08");	//Martwi mnie to, co mo�e si� sta�, je�li paladyni opuszcz� to miejsce.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_09");	//Mo�esz na nas liczy�, u�yjemy wszystkich dost�pnych �rodk�w, by to miasto nie zmieni�o si� w siedlisko zbrodni.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_10");	//Uwa�aj na to, co robisz. Takich �otrzyk�w jak ty mamy tu ca�y czas na oku.
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_11");	//W tej chwili panuje tu spok�j. Jedynie bandyci spoza miasta sprawiaj� pewne problemy.
	};
};

