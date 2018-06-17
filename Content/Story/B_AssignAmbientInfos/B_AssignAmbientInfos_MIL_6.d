
instance DIA_MIL_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_6_exit_condition;
	information = dia_mil_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_6_exit_condition()
{
	return TRUE;
};

func void dia_mil_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_6_join_condition;
	information = dia_mil_6_join_info;
	permanent = TRUE;
	description = "Co powinienem zrobiæ, aby wst¹piæ do stra¿y?";
};


func int dia_mil_6_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_6_join_info()
{
	AI_Output(other,self,"DIA_MIL_6_JOIN_15_00");	//Co powinienem zrobiæ, ¿eby siê zaci¹gn¹æ do stra¿y?
	AI_Output(self,other,"DIA_MIL_6_JOIN_06_01");	//Porozmawiaj z Lordem Andre. Od kiedy paladyni przybyli do miasta, to w³aœnie on nadzoruje dzia³ania stra¿y.
	if(c_npcisinquarter(self) != Q_KASERNE)
	{
		AI_Output(self,other,"DIA_MIL_6_JOIN_06_02");	//Znajdziesz go w koszarach. Praktycznie z nich nie wychodzi.
	};
};


instance DIA_ADDON_MIL_6_MISSINGPEOPLE(C_INFO)
{
	nr = 2;
	condition = dia_addon_mil_6_missingpeople_condition;
	information = dia_addon_mil_6_missingpeople_info;
	permanent = TRUE;
	description = "S³ysza³em, ¿e zniknêli jacyœ ludzie.";
};


func int dia_addon_mil_6_missingpeople_condition()
{
	if((KAPITEL == 1) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_mil_6_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_MIL_6_MissingPeople_15_00");	//S³ysza³em, ¿e zniknêli jacyœ ludzie.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_01");	//Rzeczywiœcie - ostatnio czêsto mamy doniesienia o zaginiêciach.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_02");	//Nie potrafiê tego wyjaœniæ, choæ bym chcia³.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_03");	//Mo¿emy tylko mieæ oczy i uszy szeroko otwarte.
};


instance DIA_MIL_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_6_people_condition;
	information = dia_mil_6_people_info;
	permanent = TRUE;
	description = "Opowiedz mi o tych paladynach.";
};


func int dia_mil_6_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_6_people_info()
{
	AI_Output(other,self,"DIA_MIL_6_PEOPLE_15_00");	//Opowiedz mi o tych paladynach.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_01");	//Zaraz po przybyciu do Khorinis udali siê do górnego miasta.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_02");	//Od tego czasu nikt poza obywatelami miasta, i oczywiœcie stra¿¹, nie ma tam wstêpu.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_03");	//Kilku paladynów stacjonuje przy statku, w porcie. Ale nie nale¿¹ do specjalnie rozmownych.
};


instance DIA_MIL_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_6_location_condition;
	information = dia_mil_6_location_info;
	permanent = TRUE;
	description = "Co powinienem wiedzieæ o tym mieœcie?";
};


func int dia_mil_6_location_condition()
{
	return TRUE;
};

func void dia_mil_6_location_info()
{
	AI_Output(other,self,"DIA_MIL_6_LOCATION_15_00");	//Co powinienem wiedzieæ o tym mieœcie?
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_01");	//Kontrolê nad miastem przejêli paladyni. Stra¿ bezpoœrednio im podlega.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_02");	//Lord Andre, dowódca stra¿y, pe³ni tak¿e funkcjê sêdziego.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_03");	//Jeœli zdarzy ci siê z³amaæ prawo, bêdziesz siê musia³ przed nim wyt³umaczyæ.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_04");	//Jednak nie martw siê, jest cz³owiekiem ugodowym. Przewa¿nie nak³ada jedynie grzywnê.
};


instance DIA_MIL_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_6_standard_condition;
	information = dia_mil_6_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_mil_6_standard_condition()
{
	return TRUE;
};

func void dia_mil_6_standard_info()
{
	AI_Output(other,self,"DIA_MIL_6_STANDARD_15_00");	//Co s³ychaæ?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_01");	//W mieœcie coraz wiêcej szumowin.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_02");	//Wszêdzie coraz wiêcej z³odziei. Lord Andre podejrzewa nawet, ¿e ca³e to zamieszanie jest sprawk¹ gangu.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_03");	//Niedawno przetrz¹snêliœmy dok³adnie ca³¹ dzielnicê portow¹, ale niczego nie znaleŸliœmy.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_04");	//Wygl¹da na to, ¿e problem bandytów mamy ju¿ z g³owy. Ataki sta³y siê ostatnimi czasy rzadkoœci¹.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_05");	//Z dnia na dzieñ jest coraz gorzej, wszystko przez te szumowiny wrêcz zalewaj¹ce miasto. Ostatniej nocy œledzi³em pewnego typka w czarnych szatach, zd¹¿aj¹cego ku górnemu miastu.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_06");	//Od pocz¹tku wyda³ mi siê podejrzany. Œledzi³em go a¿ pod dom gubernatora. Tam znikn¹³. Mówiê ci, dziwna to by³a postaæ.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_07");	//S³ysza³em, ¿e Lord Hagen zatrudni³ najemników, by zajêli siê smokami. Mnie to odpowiada, nie chcia³bym sam zmierzyæ siê z tymi bestiami.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_08");	//Mówi siê, ¿e smoki zosta³y pokonane. Ponoæ Lord Hagen zbiera si³y, by ostatecznie wygnaæ je tak¿e z Górniczej Doliny.
	};
};

func void b_assignambientinfos_mil_6(var C_NPC slf)
{
	dia_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_standard.npc = Hlp_GetInstanceID(slf);
};

