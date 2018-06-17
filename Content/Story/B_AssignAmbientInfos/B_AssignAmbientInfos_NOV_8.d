
instance DIA_NOV_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_8_exit_condition;
	information = dia_nov_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_8_exit_condition()
{
	return TRUE;
};

func void dia_nov_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_8_fegen_condition;
	information = dia_nov_8_fegen_info;
	permanent = TRUE;
	description = "Potrzebuj� pomocy w sprz�taniu sal nowicjuszy.";
};


func int dia_nov_8_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};


var int feger3_permanent;

func void dia_nov_8_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//Potrzebuj� pomocy w sprz�taniu sal nowicjuszy.
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self))
	{
		if(FEGER3_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//Nie�le, ledwo� przyszed�, a oni ju� zap�dzili ci� do sprz�tania?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//Nie martw si�, ze mn� by�o dok�adnie tak samo. Dlatego w�a�nie ci pomog�. G�upio by wygl�da�o, gdyby�my sobie nie poradzili.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER3_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"Znalaz�em nowicjusza, kt�ry zechcia� mi pom�c w sprz�taniu komnat.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//Bracie, wiem dok�adnie, o czym m�wisz. Powiedzia�em ci ju�, �e pomog�. Przecie� robi� to ca�y czas.
		};
	};
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//Zrozum, zrobi�bym to, ale jestem naprawd� zaj�ty.
	};
};


instance DIA_NOV_8_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_8_wurst_condition;
	information = dia_nov_8_wurst_info;
	permanent = TRUE;
	description = "Co powiesz na pyszn� barani� kie�bas�?";
};


func int dia_nov_8_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_8_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//Co powiesz na pyszn� barani� kie�bas�?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//Nie odm�wi�. Dzi�ki, tego w�a�nie by�o mi potrzeba.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_NOV_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_8_join_condition;
	information = dia_nov_8_join_info;
	permanent = TRUE;
	description = "Co musz� zrobi�, by zosta� magiem?";
};


func int dia_nov_8_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_8_join_info()
{
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//Co musz� zrobi�, by zosta� magiem?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//Zostaniesz Wybra�cem Innosa jedynie wtedy, gdy tak� wol� wyra�� Najwy�si Magowie Ognia.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//Jako nowicjuszom nie wolno nam studiowa� magii runicznej, za� stare manuskrypty mo�emy przegl�da� jedynie za zgod� mag�w.
};


instance DIA_NOV_8_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_8_people_condition;
	information = dia_nov_8_people_info;
	permanent = TRUE;
	description = "Kto sprawuje w�adz� w klasztorze?";
};


func int dia_nov_8_people_condition()
{
	return TRUE;
};

func void dia_nov_8_people_info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//Kto sprawuje w�adz� w klasztorze?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//Najwy�sza Rada. W jej sk�ad wchodz� trzej najpot�niejsi magowie naszego zgromadzenia. To oni nadzoruj� dzia�ania klasztoru.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//Wszyscy Wybra�cy Innosa s� magami. Innos tchn�� w ka�dego z nich cz�stk� siebie, dzi�ki czemu mog� stanowi� jego wol� tu, w �wiecie �miertelnik�w.
};


instance DIA_NOV_8_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_8_location_condition;
	information = dia_nov_8_location_info;
	permanent = TRUE;
	description = "Opowiedz mi co� o tym klasztorze.";
};


func int dia_nov_8_location_condition()
{
	return TRUE;
};

func void dia_nov_8_location_info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//Opowiedz mi co� o tym klasztorze.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//To staro�ytna budowla. Pochodzi jeszcze z czas�w przed Rhobarem Pierwszym.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//Pod klasztorem znajduj� si� katakumby, rozci�gaj�ce si� do wn�trza g�ry.
};


instance DIA_NOV_8_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_8_standard_condition;
	information = dia_nov_8_standard_info;
	permanent = TRUE;
	description = "Czy masz jakie� nowe informacje?";
};


func int dia_nov_8_standard_condition()
{
	return TRUE;
};

func void dia_nov_8_standard_info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//Czy masz jakie� nowe informacje?
	if(KAPITEL == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//Mo�na by tak powiedzie�. Od ponad stu lat �aden nowicjusz nie zosta� tak szybko przyj�ty do Kr�gu Ognia.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//Mam nadziej�, �e i mnie, pewnego dnia, spotka ten zaszczyt.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//Do Khorinis przyby�a niedawno grupa paladyn�w. Jeden jest tu, w klasztorze... Modli si�.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//Wci�� nie mog� uwierzy�, �e jeden z nas zdradzi� klasztor i zabra� Oko Innosa.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//Mieli�my stworzy� spo�eczno��, byli�my jednak zbyt s�abi. Dlatego w�a�nie Beliarowi uda�o si� przeci�gn�� jednego z nas na �cie�k� Z�a.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//Jedynie nieskalana wiara w Innosa pozwoli nam odzyska� Oko z r�k wroga.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//Twoja odwaga jest natchnieniem dla tych, kt�rzy zatracili si� w rozpaczy, dzi�ki tobie mo�e uda im si� przetrwa� te mroczne chwile.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//S�ysza�em co� tak�e o smokach i armii Z�a. Niech Innos ma nas w swojej opiece.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//Sytuacja, w jakiej znale�li si� paladyni, bardzo zmartwi�a Rad�. Od wielu ju� dni nie mamy �adnych informacji z G�rniczej Doliny.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//Dzi�kuj� za to naszemu Panu. Dzi�ki Oku Innosa b�dziemy mogli pokona� smoki!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//Tak. Pokonali�my smoki. Innos po raz kolejny pokaza� nam, �e nie wolno traci� nadziei.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//Wci�� jednak �wiat osnuwaj� cienie, a naszym celem jest nie�� �wiat�o wsz�dzie tam, gdzie s� potrzebuj�cy.
	};
};

func void b_assignambientinfos_nov_8(var C_NPC slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_wurst.npc = Hlp_GetInstanceID(slf);
};

