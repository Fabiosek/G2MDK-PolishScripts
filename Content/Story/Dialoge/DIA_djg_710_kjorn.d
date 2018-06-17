
instance DIA_KJORN_EXIT(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 999;
	condition = dia_kjorn_exit_condition;
	information = dia_kjorn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kjorn_exit_condition()
{
	return TRUE;
};

func void dia_kjorn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KJORN_HELLO(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_hello_condition;
	information = dia_kjorn_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_kjorn_hello_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return TRUE;
	};
};

func void dia_kjorn_hello_info()
{
	AI_Output(self,other,"DIA_Kjorn_Hello_06_00");	//Hej, podejd� tu!
	AI_Output(other,self,"DIA_Kjorn_Hello_15_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_02");	//Dolina jest niebezpiecznym miejscem, bez odpowiedniego ekwipunku nie dasz tam sobie rady.
	AI_Output(other,self,"DIA_Kjorn_Hello_15_03");	//Rozumiem, �e TY posiadasz w�a�ciwy ekwipunek?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_04");	//Zgad�e�. I wiesz co? Ch�tnie ci go sprzedam.
};


instance DIA_KJORN_TRADE(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_trade_condition;
	information = dia_kjorn_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mo�esz mi zaoferowa�?";
};


func int dia_kjorn_trade_condition()
{
	return TRUE;
};

func void dia_kjorn_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Kjorn_TRADE_15_00");	//Co mo�esz mi zaoferowa�?
};


instance DIA_KJORN_SELLINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_sellinfos_condition;
	information = dia_kjorn_sellinfos_info;
	permanent = FALSE;
	description = "Czy sprzedajesz r�wnie� informacje?";
};


func int dia_kjorn_sellinfos_condition()
{
	return TRUE;
};

func void dia_kjorn_sellinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_00");	//Czy sprzedajesz r�wnie� informacje?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_01");	//To zale�y. Za odpowiedni� cen� powiem ci wszystko, co wiem.
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_02");	//Ile chcesz za informacje?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_03");	//Hmmm... Sam nie wiem. 50 sztuk z�ota za ka�d� udzielon� ci informacj� wydaje mi si� rozs�dn� cen�.
};


instance DIA_KJORN_BUYINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_buyinfos_condition;
	information = dia_kjorn_buyinfos_info;
	permanent = TRUE;
	description = "Potrzebuj� paru informacji.";
};


func int dia_kjorn_buyinfos_condition()
{
	if(Npc_KnowsInfo(other,dia_kjorn_sellinfos))
	{
		return TRUE;
	};
};

func void dia_kjorn_buyinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_15_00");	//Potrzebuj� informacji.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_06_01");	//50 sztuk z�ota!
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,"To troch� za drogo.",dia_kjorn_buyinfos_holdmoney);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"Tak, prosz�.",dia_kjorn_buyinfos_givemoney);
	};
};

func void dia_kjorn_buyinfos_holdmoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_HoldMoney_15_00");	//To dla mnie za drogo.
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_givemoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_00");	//Prosz�.
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_01");	//A teraz powiedz mi...
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,DIALOG_BACK,dia_kjorn_buyinfos_back);
	if(KJORNTOLDDRAGON == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o smokach.",dia_kjorn_buyinfos_dragon1);
	}
	else if(KJORNTOLDDRAGON == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o smokach - dok�adniej.",dia_kjorn_buyinfos_dragon2);
	};
	if(KJORNTOLDCOLONY == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o G�rniczej Dolinie.",dia_kjorn_buyinfos_colony1);
	}
	else if(KJORNTOLDCOLONY == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o G�rniczej Dolinie - dok�adniej.",dia_kjorn_buyinfos_colony2);
	};
	if(KJORNTOLDOLDCAMP == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o zamku.",dia_kjorn_buyinfos_oldcamp1);
	};
	if(KJORNTOLDORKS == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o orkach.",dia_kjorn_buyinfos_orks1);
	}
	else if(KJORNTOLDORKS == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o orkach - dok�adniej.",dia_kjorn_buyinfos_orks2);
	};
};

func void dia_kjorn_buyinfos_back()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Back_15_00");	//Wiesz co, zwr�� mi moje pieni�dze, rozmy�li�em si�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Back_06_01");	//Prosz� bardzo.
	b_giveinvitems(self,other,itmi_gold,50);
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon1_15_00");	//Opowiedz mi o smokach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01");	//Smoki to pradawne, niewyobra�alnie pot�ne istoty. Kiedy� tysi�ce tych stworze� zamieszkiwa�o ca�y �wiat.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02");	//Jednak up�yn�o ju� ponad sto lat, odk�d widziano ostatniego smoka.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03");	//Ich krew jest gor�ca niczym wrz�cy olej. Je�li spojrzysz im prosto w oczy, twoje serce obr�ci si� w kamie�. Tak s�ysza�em...
	KJORNTOLDDRAGON = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon2_15_00");	//Opowiedz mi wi�cej o smokach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01");	//Smoki r�ni� si� mi�dzy sob�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02");	//Niekt�re z nich mog�yby pokry� ca�y �wiat warstw� lodu grub� na kilka st�p.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03");	//Inne lubi� mieszka� na bagnach lub w wulkanach.
	b_logentry(TOPIC_DRACHENJAGD,"�owca smok�w Kjorn uwa�a, �e istniej� r�ne rodzaje smok�w. Niekt�re z nich lubi� zimne, wilgotne miejsca, inne wol� ogie�.");
	KJORNTOLDDRAGON = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony1_15_00");	//Opowiedz mi o G�rniczej Dolinie.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_01");	//G�rnicza Dolina Khorinis s�ynie w ca�ym kraju ze swojej magicznej rudy.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_02");	//Mo�na j� znale�� tylko w tych g�rach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_03");	//Bro� wykuta z takiej rudy jest praktycznie niezniszczalna. Mo�na ni� przeci�� nawet najtwardszy pancerz.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_04");	//Jeszcze par� tygodni temu ca�� Dolin� otacza�a magiczna Bariera. Kto raz j� przekroczy�, zostawa� tam na ca�e �ycie.
	KJORNTOLDCOLONY = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony2_15_00");	//Opowiedz mi wi�cej o G�rniczej Dolinie.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_01");	//W ci�gu paru ostatnich dni Dolina bardzo si� zmieni�a.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_02");	//Przybyli do niej orkowie, a wraz z nimi wszelkie mo�liwe potwory, jakie tylko mo�na sobie wyobrazi�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_03");	//Podobno w okolicy przebywaj� jacy� my�liwi, jednak nie wiadomo nawet, czy jeszcze �yj�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_04");	//Wygl�da to tak, jakby wszystkie stworzenia Beliara przyby�y do tej jednej Doliny.
	KJORNTOLDCOLONY = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_oldcamp1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_OldCamp1_15_00");	//Opowiedz mi o zamku.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01");	//Znajduje si� praktycznie w samym �rodku G�rniczej Doliny.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02");	//Kiedy jeszcze dolina by�a wykorzystywana jako wi�zienie, lokalni baronowie kontrolowali st�d handel rud�.
	KJORNTOLDOLDCAMP = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks1_15_00");	//Opowiedz mi o orkach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_01");	//Orkowie pojawili si� tutaj dopiero niedawno. Przynajmniej ci sprzed zamku.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_02");	//Dziwi mnie, jak dobrze s� zorganizowani. Orkowie przewa�nie atakuj� na o�lep, niezale�nie od okoliczno�ci.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_03");	//Ci orkowie najwyra�niej pr�buj� zyska� na czasie. Czekaj� na co�, nie wiemy tylko na co.
	KJORNTOLDORKS = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks2_15_00");	//Opowiedz mi wi�cej o orkach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_01");	//Orkami dowodz� elitarni wojownicy. S� oni niezwykle silni i nosz� bardzo mocne zbroje. Praktycznie nie mo�na ich pokona�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_02");	//Kiedy� widzia�em, jak jeden z nich powali� ogromny d�b zaledwie jednym ciosem swojego topora.
	KJORNTOLDORKS = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};


instance DIA_KJORN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_alldragonsdead_condition;
	information = dia_kjorn_alldragonsdead_info;
	permanent = FALSE;
	description = "Zabi�em wszystkie smoki!";
};


func int dia_kjorn_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_kjorn_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Kjorn_AllDragonsDead_15_00");	//Zabi�em wszystkie smoki!
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_01");	//Tak, pewnie. A ja zosta�em paladynem.
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_02");	//Mog�e� zabi� JEDNEGO, ale WSZYSTKIE? Ciekawe kto ci w to uwierzy.
};


instance DIA_KJORN_PICKPOCKET(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 900;
	condition = dia_kjorn_pickpocket_condition;
	information = dia_kjorn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kjorn_pickpocket_condition()
{
	return c_beklauen(47,75);
};

func void dia_kjorn_pickpocket_info()
{
	Info_ClearChoices(dia_kjorn_pickpocket);
	Info_AddChoice(dia_kjorn_pickpocket,DIALOG_BACK,dia_kjorn_pickpocket_back);
	Info_AddChoice(dia_kjorn_pickpocket,DIALOG_PICKPOCKET,dia_kjorn_pickpocket_doit);
};

func void dia_kjorn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kjorn_pickpocket);
};

func void dia_kjorn_pickpocket_back()
{
	Info_ClearChoices(dia_kjorn_pickpocket);
};

