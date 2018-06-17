
instance DIA_GIRION_EXIT(C_INFO)
{
	npc = pal_207_girion;
	nr = 999;
	condition = dia_girion_exit_condition;
	information = dia_girion_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_girion_exit_condition()
{
	return TRUE;
};

func void dia_girion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_HALLO(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_hallo_condition;
	information = dia_girion_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_girion_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SHIPISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_girion_hallo_info()
{
	AI_Output(self,other,"DIA_Girion_Hallo_08_00");	//Jestem Girion, mistrz walki broni¹ oburêczn¹ i królewski paladyn. Czemu mnie niepokoisz?
};


instance DIA_GIRION_CANTEACH(C_INFO)
{
	npc = pal_207_girion;
	nr = 5;
	condition = dia_girion_canteach_condition;
	information = dia_girion_canteach_info;
	permanent = TRUE;
	description = "Czy mo¿esz mnie wyszkoliæ?";
};


func int dia_girion_canteach_condition()
{
	if(GIRION_TEACH2H == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_canteach_info()
{
	AI_Output(other,self,"DIA_Girion_CanTeach_15_00");	//Czy mo¿esz udzieliæ mi lekcji?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_01");	//Wybieraj¹c najszlachetniejsz¹ ze wszystkich sztuk walk, post¹pi³eœ jak prawdziwy wojownik Innosa.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_02");	//Udzielê ci kilku wskazówek. Daj mi znaæ, kiedy bêdziesz gotów do treningu.
		GIRION_TEACH2H = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladyn Girion mo¿e mnie nauczyæ, jak walczyæ orê¿em dwurêcznym.");
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_03");	//Jeœli chcesz siê uczyæ, musisz znaleŸæ sobie mentora poza naszym zakonem.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_04");	//Jestem wojownikiem, nie nauczycielem.
	};
};


instance DIA_GIRION_TEACH(C_INFO)
{
	npc = pal_207_girion;
	nr = 100;
	condition = dia_girion_teach_condition;
	information = dia_girion_teach_info;
	permanent = TRUE;
	description = "Jestem gotów do treningu.";
};


var int dia_girion_teach_permanent;

func int dia_girion_teach_condition()
{
	if((GIRION_TEACH2H == TRUE) && (DIA_GIRION_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};


var int girion_merk2h;

func void dia_girion_teach_info()
{
	GIRION_MERK2H = other.hitchance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Girion_Teach_15_00");	//Jestem gotów do treningu.
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};

func void dia_girion_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");	//Oczywiœcie, to jeszcze nie koniec twojej edukacji, ale ja nie potrafiê ciê nauczyæ niczego wiêcej.
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");	//Jeœli chcesz dalej æwiczyæ walkê wrêcz, powinieneœ poszukaæ prawdziwego mistrza miecza.
		AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");	//Gdzie mogê znaleŸæ kogoœ takiego?
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");	//Lord Hagen jest mistrzem miecza. Z pewnoœci¹ udzieli ci lekcji.
		DIA_GIRION_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_girion_teach);
};

func void dia_girion_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
	{
		if(GIRION_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");	//Zawsze walcz honorowo. Walka to nasze ¿ycie - a czym jest ¿ycie bez honoru?
		};
		if(GIRION_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");	//W walce b¹dŸ szybki i ostro¿ny. Zaskakuj swoich przeciwników.
		};
		if(GIRION_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");	//Nigdy nie rozpoczynaj walki bez odpowiedniego przygotowania. Ka¿dy pojedynek mo¿e byæ twoim ostatnim.
		};
		if(GIRION_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");	//Paladyn jest zawsze gotów do walki. Jednak nigdy nie wdaje siê w pojedynki, w których nie ma ¿adnych szans na zwyciêstwo.
		};
		GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
		if(GIRION_LABERCOUNT >= 3)
		{
			GIRION_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};

func void dia_girion_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
	{
		if(GIRION_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");	//Broni¹ paladyna jest nie tylko jego miecz, ale równie¿ sprawny umys³.
		};
		if(GIRION_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");	//Musisz wiedzieæ, kiedy mo¿esz siê wycofaæ.
		};
		if(GIRION_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");	//Pamiêtaj, dobra walka to taka, w której to ty kontrolujesz swojego przeciwnika, nie daj¹c mu najmniejszej szansy na przejêcie kontroli nad tob¹.
		};
		if(GIRION_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");	//Przegrywasz tylko wtedy, gdy siê poddasz.
		};
		GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
		if(GIRION_LABERCOUNT >= 3)
		{
			GIRION_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};


instance DIA_GIRION_CATCHPLAYERSTOLENSHIP(C_INFO)
{
	npc = pal_207_girion;
	nr = 5;
	condition = dia_girion_catchplayerstolenship_condition;
	information = dia_girion_catchplayerstolenship_info;
	important = TRUE;
};


func int dia_girion_catchplayerstolenship_condition()
{
	if((KAPITEL >= 5) && (MIS_SHIPISFREE == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000))
	{
		return TRUE;
	};
};

func void dia_girion_catchplayerstolenship_info()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00");	//Hej! Mo¿esz mi powiedzieæ, co tutaj robisz?
	Info_ClearChoices(dia_girion_catchplayerstolenship);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Nie wiem, o czym mówisz.",dia_girion_catchplayerstolenship_no);
	Info_AddChoice(dia_girion_catchplayerstolenship,"ZejdŸ mi z drogi albo bêdê zmuszony ciê zabiæ.",dia_girion_catchplayerstolenship_weg);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Potrzebujê okrêtu.",dia_girion_catchplayerstolenship_ship);
};

func void dia_girion_catchplayerstolenship_no()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");	//Nie wiem, o czym mówisz.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");	//Mówiê o tym, co wykombinowa³eœ ze stra¿¹ okrêtow¹. Podejrzana sprawa.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");	//Jeœli nawet jesteœ magiem, nie ufam ci.
	};
};


var int girion_wantstokillsc;

func void dia_girion_catchplayerstolenship_weg()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");	//ZejdŸ mi z drogi albo bêdê zmuszony ciê zabiæ.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");	//Mo¿esz byæ wystarczaj¹co sprytny, aby poradziæ sobie ze stra¿¹ okrêtow¹, ale ze mn¹ nie pójdzie ci tak ³atwo, ch³opcze.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");	//Jeœli nawet jesteœ jednym z nas, nie daje ci to prawa do kradzie¿y królewskiej w³asnoœci. Giñ, przeklêty zdrajco.
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	GIRION_WANTSTOKILLSC = TRUE;
};

func void b_girionstayonship()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");	//Kiedy skoñczymy interesy, statek wróci do mnie. Czy to jasne?
};

func void dia_girion_catchplayerstolenship_ship()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");	//Potrzebujê statku. Wiêc go sobie wezmê.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");	//Nie mo¿esz tego zrobiæ. Transport rudy...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");	//Jak œmiesz, ty œmierdz¹cy skur...
	};
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");	//W Górniczej Dolinie jest zbyt ma³o rudy, aby zaspokoiæ królewskie wymagania. By³em tam. Z³o¿a siê wyczerpa³y. Misja Hagena to jedna wielka farsa.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");	//Prawdziwe zagro¿enie stanowi pewna niewielka przybrze¿na wysepka, ca³kiem niedaleko st¹d. Pop³ynê tam i po³o¿ê wszystkiemu kres.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");	//Albo siê do mnie przy³¹czysz, albo zrobiê z tob¹ porz¹dek raz na zawsze. Wybór nale¿y do ciebie.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");	//Hmmm. Wygl¹da na to, ¿e nie mam wyboru.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//Dok³adnie tak.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");	//A zatem dobrze. Przy³¹czê siê do ciebie, ale tylko pod jednym warunkiem.
	b_girionstayonship();
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");	//Jakoœ to prze¿yjê.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");	//A zatem rób, co masz do zrobienia. Poczekam tutaj na ciebie.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	GIRION_ISONBOARD = LOG_SUCCESS;
};


instance DIA_GIRION_VERRAT(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_verrat_condition;
	information = dia_girion_verrat_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_girion_verrat_condition()
{
	if(GIRION_WANTSTOKILLSC == TRUE)
	{
		return TRUE;
	};
};

func void dia_girion_verrat_info()
{
	AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//Zdrajca!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_GIRION_ONSHIP(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_onship_condition;
	information = dia_girion_onship_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_girion_onship_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GIRION_ISONBOARD == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_girion_onship_info()
{
	b_girionstayonship();
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_PICKPOCKET(C_INFO)
{
	npc = pal_207_girion;
	nr = 900;
	condition = dia_girion_pickpocket_condition;
	information = dia_girion_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_girion_pickpocket_condition()
{
	return c_beklauen(73,280);
};

func void dia_girion_pickpocket_info()
{
	Info_ClearChoices(dia_girion_pickpocket);
	Info_AddChoice(dia_girion_pickpocket,DIALOG_BACK,dia_girion_pickpocket_back);
	Info_AddChoice(dia_girion_pickpocket,DIALOG_PICKPOCKET,dia_girion_pickpocket_doit);
};

func void dia_girion_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_girion_pickpocket);
};

func void dia_girion_pickpocket_back()
{
	Info_ClearChoices(dia_girion_pickpocket);
};

