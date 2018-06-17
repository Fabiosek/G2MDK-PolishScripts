
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
	description = "Potrzebujê pomocy w sprz¹taniu sal nowicjuszy.";
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
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//Potrzebujê pomocy w sprz¹taniu sal nowicjuszy.
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self))
	{
		if(FEGER3_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//NieŸle, ledwoœ przyszed³, a oni ju¿ zapêdzili ciê do sprz¹tania?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//Nie martw siê, ze mn¹ by³o dok³adnie tak samo. Dlatego w³aœnie ci pomogê. G³upio by wygl¹da³o, gdybyœmy sobie nie poradzili.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER3_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"Znalaz³em nowicjusza, który zechcia³ mi pomóc w sprz¹taniu komnat.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//Bracie, wiem dok³adnie, o czym mówisz. Powiedzia³em ci ju¿, ¿e pomogê. Przecie¿ robiê to ca³y czas.
		};
	};
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//Zrozum, zrobi³bym to, ale jestem naprawdê zajêty.
	};
};


instance DIA_NOV_8_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_8_wurst_condition;
	information = dia_nov_8_wurst_info;
	permanent = TRUE;
	description = "Co powiesz na pyszn¹ barani¹ kie³basê?";
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
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//Co powiesz na pyszn¹ barani¹ kie³basê?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//Nie odmówiê. Dziêki, tego w³aœnie by³o mi potrzeba.
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
	description = "Co muszê zrobiæ, by zostaæ magiem?";
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
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//Co muszê zrobiæ, by zostaæ magiem?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//Zostaniesz Wybrañcem Innosa jedynie wtedy, gdy tak¹ wolê wyra¿¹ Najwy¿si Magowie Ognia.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//Jako nowicjuszom nie wolno nam studiowaæ magii runicznej, zaœ stare manuskrypty mo¿emy przegl¹daæ jedynie za zgod¹ magów.
};


instance DIA_NOV_8_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_8_people_condition;
	information = dia_nov_8_people_info;
	permanent = TRUE;
	description = "Kto sprawuje w³adzê w klasztorze?";
};


func int dia_nov_8_people_condition()
{
	return TRUE;
};

func void dia_nov_8_people_info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//Kto sprawuje w³adzê w klasztorze?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//Najwy¿sza Rada. W jej sk³ad wchodz¹ trzej najpotê¿niejsi magowie naszego zgromadzenia. To oni nadzoruj¹ dzia³ania klasztoru.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//Wszyscy Wybrañcy Innosa s¹ magami. Innos tchn¹³ w ka¿dego z nich cz¹stkê siebie, dziêki czemu mog¹ stanowiæ jego wolê tu, w œwiecie œmiertelników.
};


instance DIA_NOV_8_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_8_location_condition;
	information = dia_nov_8_location_info;
	permanent = TRUE;
	description = "Opowiedz mi coœ o tym klasztorze.";
};


func int dia_nov_8_location_condition()
{
	return TRUE;
};

func void dia_nov_8_location_info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//Opowiedz mi coœ o tym klasztorze.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//To staro¿ytna budowla. Pochodzi jeszcze z czasów przed Rhobarem Pierwszym.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//Pod klasztorem znajduj¹ siê katakumby, rozci¹gaj¹ce siê do wnêtrza góry.
};


instance DIA_NOV_8_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_8_standard_condition;
	information = dia_nov_8_standard_info;
	permanent = TRUE;
	description = "Czy masz jakieœ nowe informacje?";
};


func int dia_nov_8_standard_condition()
{
	return TRUE;
};

func void dia_nov_8_standard_info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//Czy masz jakieœ nowe informacje?
	if(KAPITEL == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//Mo¿na by tak powiedzieæ. Od ponad stu lat ¿aden nowicjusz nie zosta³ tak szybko przyjêty do Krêgu Ognia.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//Mam nadziejê, ¿e i mnie, pewnego dnia, spotka ten zaszczyt.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//Do Khorinis przyby³a niedawno grupa paladynów. Jeden jest tu, w klasztorze... Modli siê.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//Wci¹¿ nie mogê uwierzyæ, ¿e jeden z nas zdradzi³ klasztor i zabra³ Oko Innosa.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//Mieliœmy stworzyæ spo³ecznoœæ, byliœmy jednak zbyt s³abi. Dlatego w³aœnie Beliarowi uda³o siê przeci¹gn¹æ jednego z nas na œcie¿kê Z³a.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//Jedynie nieskalana wiara w Innosa pozwoli nam odzyskaæ Oko z r¹k wroga.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//Twoja odwaga jest natchnieniem dla tych, którzy zatracili siê w rozpaczy, dziêki tobie mo¿e uda im siê przetrwaæ te mroczne chwile.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//S³ysza³em coœ tak¿e o smokach i armii Z³a. Niech Innos ma nas w swojej opiece.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//Sytuacja, w jakiej znaleŸli siê paladyni, bardzo zmartwi³a Radê. Od wielu ju¿ dni nie mamy ¿adnych informacji z Górniczej Doliny.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//Dziêkujê za to naszemu Panu. Dziêki Oku Innosa bêdziemy mogli pokonaæ smoki!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//Tak. Pokonaliœmy smoki. Innos po raz kolejny pokaza³ nam, ¿e nie wolno traciæ nadziei.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//Wci¹¿ jednak œwiat osnuwaj¹ cienie, a naszym celem jest nieœæ œwiat³o wszêdzie tam, gdzie s¹ potrzebuj¹cy.
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

