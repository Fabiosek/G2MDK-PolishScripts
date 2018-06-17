
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
	description = "Chcesz spróbowaæ kie³basy?";
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
	AI_Output(other,self,"DIA_Garwig_Wurst_15_00");	//Chcesz spróbowaæ kie³basy?
	AI_Output(self,other,"DIA_Garwig_Wurst_06_01");	//Jest pyszna. Bardzo dziêkujê, Bracie.
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
	AI_Output(self,other,"DIA_Garwig_Hello_06_00");	//Niech Innos bêdzie z tob¹. Nie znam ciê, jesteœ tu nowy?
	AI_Output(other,self,"DIA_Garwig_Hello_15_01");	//Tak, dopiero siê do was przy³¹czy³em.
	AI_Output(self,other,"DIA_Garwig_Hello_06_02");	//W takim wypadku mam nadziejê, ¿e prêdko siê tutaj zadomowisz. Daj mi znaæ, jeœli bêdê móg³ ci w czymœ pomóc.
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
	AI_Output(self,other,"DIA_Garwig_Room_06_01");	//Tutaj przechowywane s¹ klasztorne relikwie.
	AI_Output(other,self,"DIA_Garwig_Room_15_02");	//Jakie relikwie?
	AI_Output(self,other,"DIA_Garwig_Room_06_03");	//Tu spoczywa M³ot Innosa oraz Tarcza Ognia, najwa¿niejsze relikwie Koœcio³a Innosa poza stolic¹ królestwa.
};


instance DIA_GARWIG_HAMMER(C_INFO)
{
	npc = nov_608_garwig;
	nr = 99;
	condition = dia_garwig_hammer_condition;
	information = dia_garwig_hammer_info;
	permanent = TRUE;
	description = "Opowiedz mi o tym M³ocie.";
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
	AI_Output(other,self,"DIA_Garwig_Hammer_15_00");	//Opowiedz mi o tym M³ocie.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_01");	//Oto œwiêty M³ot Innosa. To w³aœnie nim Œwiêty Rhobar zabi³ Kamiennego Stra¿nika.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_02");	//Œwiête Pisma twierdz¹, ¿e Kamienny Stra¿nik by³ niezniszczalny. Broñ wyszczerbia³a siê na jego kamiennej skórze, nie czyni¹c mu ¿adnej krzywdy.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_03");	//Z imieniem Innosa na ustach Rhobar rzuci³ siê na potwora i zmia¿d¿y³ go jednym potê¿nym ciosem m³ota.
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
	AI_Output(self,other,"DIA_Garwig_Shield_06_01");	//Tarcza Ognia zosta³a u¿yta przez Dominique w czasie bitwy na Po³udniowych Wyspach.
	AI_Output(self,other,"DIA_Garwig_Shield_06_02");	//Nikt nie ma prawa korzystaæ z jej mocy - dlatego przybiliœmy j¹ do œciany.
};


instance DIA_GARWIG_AUGE(C_INFO)
{
	npc = nov_608_garwig;
	nr = 4;
	condition = dia_garwig_auge_condition;
	information = dia_garwig_auge_info;
	permanent = FALSE;
	description = "Czy znajduje siê tutaj tak¿e Oko Innosa?";
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
	AI_Output(other,self,"DIA_Garwig_Auge_15_00");	//Czy znajduje siê tutaj tak¿e Oko Innosa?
	AI_Output(self,other,"DIA_Garwig_Auge_06_01");	//Oczywiœcie, ¿e nie. Co za dziwaczny pomys³. Nikt nie wie, gdzie siê znajduje najœwiêtszy artefakt.
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
	AI_Output(other,self,"DIA_Garwig_SLEEP_15_00");	//Czym siê tu zajmujesz?
	AI_Output(self,other,"DIA_Garwig_SLEEP_06_01");	//Jestem stra¿nikiem œwiêtych artefaktów.
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,DIALOG_BACK,dia_garwig_sleep_back);
	Info_AddChoice(dia_garwig_sleep,"Chcesz, ¿ebym na moment ciê zast¹pi³?",dia_garwig_sleep_exchange);
	Info_AddChoice(dia_garwig_sleep,"Czemu te artefakty s¹ tak pilnie strze¿one?",dia_garwig_sleep_thief);
	Info_AddChoice(dia_garwig_sleep,"Czy ty nigdy nie sypiasz?",dia_garwig_sleep_never);
};

func void dia_garwig_sleep_back()
{
	Info_ClearChoices(dia_garwig_sleep);
};

func void dia_garwig_sleep_exchange()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");	//Chcesz, ¿ebym na moment ciê zast¹pi³?
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");	//Czy to jakaœ próba? Magowie ciê tu przys³ali, abyœ wystawi³ mnie na próbê, prawda? Och - wiedzia³em od pocz¹tku!
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");	//Ale ja siê nie ugnê. Powiedz swoim magom, ¿e stojê tu na stra¿y niewzruszony niczym kamienny pos¹g, opieraj¹c siê wszelkim pokusom, albowiem jestem godny tej zaszczytnej misji.
};

func void dia_garwig_sleep_thief()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");	//Czemu te artefakty s¹ tak pilnie strze¿one? Czy istnieje jakieœ niebezpieczeñstwo, ¿e ktoœ chcia³by je ukraœæ?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");	//Co za niezwyk³y pomys³. Czemu ktoœ mia³by je ukraœæ?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");	//Tylko s³udzy Innosa maj¹ wstêp do klasztoru. Zapewniam ciê, ¿e ¿aden wyznawca nie odwa¿y³by siê na takie œwiêtokradztwo.
};

func void dia_garwig_sleep_never()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");	//Nigdy nie œpisz?
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");	//Co za dziwne pytanie. Oczywiœcie, ¿e nigdy nie sypiam. Innos sprawia, ¿e nie potrzebujê snu.
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");	//Jak inaczej móg³bym pe³niæ moje œwiête powo³anie stra¿nika?
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,"Naprawdê NIGDY nie sypiasz?",dia_garwig_sleep_again);
};

func void dia_garwig_sleep_again()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");	//Naprawdê NIGDY nie sypiasz?
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");	//Nie. Jeœli stra¿nik zapada w sen, oznacza to jego ca³kowit¹ pora¿kê.
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");	//Ale ja nie zawiodê, albowiem Innos zapewnia mi si³ê i wytrwa³oœæ, abym móg³ wiecznie trwaæ na posterunku.
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
		AI_Output(self,other,"DIA_Garwig_THIEF_06_00");	//Z³odzieju! Zniewa¿y³eœ nie tylko mnie i siebie, lecz równie¿ ca³y ten klasztor!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_01");	//Odpokutujesz za to œwiêtokradztwo. Ale przede wszystkim - ODDAJ MI TEN M£OT!!!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_02");	//M³ot znikn¹³ - jak to siê mog³o staæ?
		AI_Output(self,other,"DIA_Garwig_THIEF_06_03");	//Zawiod³em, i kara Innosa mnie nie ominie!
	};
};


instance DIA_GARWIG_ABGEBEN(C_INFO)
{
	npc = nov_608_garwig;
	nr = 2;
	condition = dia_garwig_abgeben_condition;
	information = dia_garwig_abgeben_info;
	permanent = TRUE;
	description = "Przyszed³em oddaæ ci twój M³ot.";
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
	AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");	//Przyszed³em oddaæ ci twój M³ot.
	if(HAMMER_TAKEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");	//Ty wstrêtny z³odzieju!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");	//A wiêc to ty mnie okrad³eœ...
	};
	AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");	//Jednak nie mnie s¹dziæ twoje czyny. Innos bêdzie twym sêdzi¹ i zeœle na ciebie sprawiedliw¹ karê!
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

