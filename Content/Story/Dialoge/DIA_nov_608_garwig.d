
instance DIA_GARWIG_EXIT(C_INFO)
{
	npc = nov_608_garwig;
	nr = 999;
	condition = dia_garwig_exit_condition;
	information = dia_garwig_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garwig_exit_condition()
{
	return TRUE;
};

func void dia_garwig_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARWIG_WURST(C_INFO)
{
	npc = nov_608_garwig;
	nr = 3;
	condition = dia_garwig_wurst_condition;
	information = dia_garwig_wurst_info;
	permanent = FALSE;
	description = "Chcesz spr�bowa� kie�basy?";
};


func int dia_garwig_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_garwig_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Garwig_Wurst_15_00");	//Chcesz spr�bowa� kie�basy?
	AI_Output(self,other,"DIA_Garwig_Wurst_06_01");	//Jest pyszna. Bardzo dzi�kuj�, Bracie.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_GARWIG_HELLO(C_INFO)
{
	npc = nov_608_garwig;
	nr = 3;
	condition = dia_garwig_hello_condition;
	information = dia_garwig_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garwig_hello_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_garwig_hello_info()
{
	AI_Output(self,other,"DIA_Garwig_Hello_06_00");	//Niech Innos b�dzie z tob�. Nie znam ci�, jeste� tu nowy?
	AI_Output(other,self,"DIA_Garwig_Hello_15_01");	//Tak, dopiero si� do was przy��czy�em.
	AI_Output(self,other,"DIA_Garwig_Hello_06_02");	//W takim wypadku mam nadziej�, �e pr�dko si� tutaj zadomowisz. Daj mi zna�, je�li b�d� m�g� ci w czym� pom�c.
};


instance DIA_GARWIG_ROOM(C_INFO)
{
	npc = nov_608_garwig;
	nr = 5;
	condition = dia_garwig_room_condition;
	information = dia_garwig_room_info;
	permanent = FALSE;
	description = "Co to za pomieszczenie?";
};


func int dia_garwig_room_condition()
{
	return TRUE;
};

func void dia_garwig_room_info()
{
	AI_Output(other,self,"DIA_Garwig_Room_15_00");	//Co to za pomieszczenie?
	AI_Output(self,other,"DIA_Garwig_Room_06_01");	//Tutaj przechowywane s� klasztorne relikwie.
	AI_Output(other,self,"DIA_Garwig_Room_15_02");	//Jakie relikwie?
	AI_Output(self,other,"DIA_Garwig_Room_06_03");	//Tu spoczywa M�ot Innosa oraz Tarcza Ognia, najwa�niejsze relikwie Ko�cio�a Innosa poza stolic� kr�lestwa.
};


instance DIA_GARWIG_HAMMER(C_INFO)
{
	npc = nov_608_garwig;
	nr = 99;
	condition = dia_garwig_hammer_condition;
	information = dia_garwig_hammer_info;
	permanent = TRUE;
	description = "Opowiedz mi o tym M�ocie.";
};


func int dia_garwig_hammer_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room))
	{
		return TRUE;
	};
};

func void dia_garwig_hammer_info()
{
	AI_Output(other,self,"DIA_Garwig_Hammer_15_00");	//Opowiedz mi o tym M�ocie.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_01");	//Oto �wi�ty M�ot Innosa. To w�a�nie nim �wi�ty Rhobar zabi� Kamiennego Stra�nika.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_02");	//�wi�te Pisma twierdz�, �e Kamienny Stra�nik by� niezniszczalny. Bro� wyszczerbia�a si� na jego kamiennej sk�rze, nie czyni�c mu �adnej krzywdy.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_03");	//Z imieniem Innosa na ustach Rhobar rzuci� si� na potwora i zmia�d�y� go jednym pot�nym ciosem m�ota.
};


instance DIA_GARWIG_SHIELD(C_INFO)
{
	npc = nov_608_garwig;
	nr = 98;
	condition = dia_garwig_shield_condition;
	information = dia_garwig_shield_info;
	permanent = FALSE;
	description = "Opowiedz mi o tej Tarczy.";
};


func int dia_garwig_shield_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room))
	{
		return TRUE;
	};
};

func void dia_garwig_shield_info()
{
	AI_Output(other,self,"DIA_Garwig_Shield_15_00");	//Opowiedz mi o tej Tarczy.
	AI_Output(self,other,"DIA_Garwig_Shield_06_01");	//Tarcza Ognia zosta�a u�yta przez Dominique w czasie bitwy na Po�udniowych Wyspach.
	AI_Output(self,other,"DIA_Garwig_Shield_06_02");	//Nikt nie ma prawa korzysta� z jej mocy - dlatego przybili�my j� do �ciany.
};


instance DIA_GARWIG_AUGE(C_INFO)
{
	npc = nov_608_garwig;
	nr = 4;
	condition = dia_garwig_auge_condition;
	information = dia_garwig_auge_info;
	permanent = FALSE;
	description = "Czy znajduje si� tutaj tak�e Oko Innosa?";
};


func int dia_garwig_auge_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room) && (KAPITEL <= 2))
	{
		return TRUE;
	};
};

func void dia_garwig_auge_info()
{
	AI_Output(other,self,"DIA_Garwig_Auge_15_00");	//Czy znajduje si� tutaj tak�e Oko Innosa?
	AI_Output(self,other,"DIA_Garwig_Auge_06_01");	//Oczywi�cie, �e nie. Co za dziwaczny pomys�. Nikt nie wie, gdzie si� znajduje naj�wi�tszy artefakt.
};


instance DIA_GARWIG_SLEEP(C_INFO)
{
	npc = nov_608_garwig;
	nr = 23;
	condition = dia_garwig_sleep_condition;
	information = dia_garwig_sleep_info;
	permanent = TRUE;
	description = "Co tu porabiasz?";
};


func int dia_garwig_sleep_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_garwig_sleep_info()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_15_00");	//Czym si� tu zajmujesz?
	AI_Output(self,other,"DIA_Garwig_SLEEP_06_01");	//Jestem stra�nikiem �wi�tych artefakt�w.
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,DIALOG_BACK,dia_garwig_sleep_back);
	Info_AddChoice(dia_garwig_sleep,"Chcesz, �ebym na moment ci� zast�pi�?",dia_garwig_sleep_exchange);
	Info_AddChoice(dia_garwig_sleep,"Czemu te artefakty s� tak pilnie strze�one?",dia_garwig_sleep_thief);
	Info_AddChoice(dia_garwig_sleep,"Czy ty nigdy nie sypiasz?",dia_garwig_sleep_never);
};

func void dia_garwig_sleep_back()
{
	Info_ClearChoices(dia_garwig_sleep);
};

func void dia_garwig_sleep_exchange()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");	//Chcesz, �ebym na moment ci� zast�pi�?
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");	//Czy to jaka� pr�ba? Magowie ci� tu przys�ali, aby� wystawi� mnie na pr�b�, prawda? Och - wiedzia�em od pocz�tku!
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");	//Ale ja si� nie ugn�. Powiedz swoim magom, �e stoj� tu na stra�y niewzruszony niczym kamienny pos�g, opieraj�c si� wszelkim pokusom, albowiem jestem godny tej zaszczytnej misji.
};

func void dia_garwig_sleep_thief()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");	//Czemu te artefakty s� tak pilnie strze�one? Czy istnieje jakie� niebezpiecze�stwo, �e kto� chcia�by je ukra��?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");	//Co za niezwyk�y pomys�. Czemu kto� mia�by je ukra��?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");	//Tylko s�udzy Innosa maj� wst�p do klasztoru. Zapewniam ci�, �e �aden wyznawca nie odwa�y�by si� na takie �wi�tokradztwo.
};

func void dia_garwig_sleep_never()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");	//Nigdy nie �pisz?
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");	//Co za dziwne pytanie. Oczywi�cie, �e nigdy nie sypiam. Innos sprawia, �e nie potrzebuj� snu.
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");	//Jak inaczej m�g�bym pe�ni� moje �wi�te powo�anie stra�nika?
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,"Naprawd� NIGDY nie sypiasz?",dia_garwig_sleep_again);
};

func void dia_garwig_sleep_again()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");	//Naprawd� NIGDY nie sypiasz?
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");	//Nie. Je�li stra�nik zapada w sen, oznacza to jego ca�kowit� pora�k�.
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");	//Ale ja nie zawiod�, albowiem Innos zapewnia mi si�� i wytrwa�o��, abym m�g� wiecznie trwa� na posterunku.
};


instance DIA_GARWIG_THIEF(C_INFO)
{
	npc = nov_608_garwig;
	nr = 2;
	condition = dia_garwig_thief_condition;
	information = dia_garwig_thief_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garwig_thief_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_HasItems(hero,holy_hammer_mis) == 1))
	{
		return TRUE;
	};
};

func void dia_garwig_thief_info()
{
	if(HAMMER_TAKEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_00");	//Z�odzieju! Zniewa�y�e� nie tylko mnie i siebie, lecz r�wnie� ca�y ten klasztor!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_01");	//Odpokutujesz za to �wi�tokradztwo. Ale przede wszystkim - ODDAJ MI TEN M�OT!!!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_02");	//M�ot znikn�� - jak to si� mog�o sta�?
		AI_Output(self,other,"DIA_Garwig_THIEF_06_03");	//Zawiod�em, i kara Innosa mnie nie ominie!
	};
};


instance DIA_GARWIG_ABGEBEN(C_INFO)
{
	npc = nov_608_garwig;
	nr = 2;
	condition = dia_garwig_abgeben_condition;
	information = dia_garwig_abgeben_info;
	permanent = TRUE;
	description = "Przyszed�em odda� ci tw�j M�ot.";
};


func int dia_garwig_abgeben_condition()
{
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_garwig_abgeben_info()
{
	AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");	//Przyszed�em odda� ci tw�j M�ot.
	if(HAMMER_TAKEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");	//Ty wstr�tny z�odzieju!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");	//A wi�c to ty mnie okrad�e�...
	};
	AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");	//Jednak nie mnie s�dzi� twoje czyny. Innos b�dzie twym s�dzi� i ze�le na ciebie sprawiedliw� kar�!
	b_giveinvitems(other,self,holy_hammer_mis,1);
	HAMMER_TAKEN = FALSE;
};


instance DIA_GARWIG_PICKPOCKET(C_INFO)
{
	npc = nov_608_garwig;
	nr = 900;
	condition = dia_garwig_pickpocket_condition;
	information = dia_garwig_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_garwig_pickpocket_condition()
{
	return c_beklauen(52,80);
};

func void dia_garwig_pickpocket_info()
{
	Info_ClearChoices(dia_garwig_pickpocket);
	Info_AddChoice(dia_garwig_pickpocket,DIALOG_BACK,dia_garwig_pickpocket_back);
	Info_AddChoice(dia_garwig_pickpocket,DIALOG_PICKPOCKET,dia_garwig_pickpocket_doit);
};

func void dia_garwig_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_garwig_pickpocket);
};

func void dia_garwig_pickpocket_back()
{
	Info_ClearChoices(dia_garwig_pickpocket);
};

