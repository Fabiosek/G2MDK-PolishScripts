
instance DIA_LOBART_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_exit_condition;
	information = dia_lobart_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lobart_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_STOLENCLOTHS(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_stolencloths_condition;
	information = dia_lobart_stolencloths_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lobart_stolencloths_condition()
{
	if((Mob_HasItems("CHEST_LOBART",itar_bau_l) == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lobart_stolencloths_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroarmor,itar_bau_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_00");	//Nie wierzê! Ten drañ biega w MOICH ubraniach!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_01");	//Hej, ty!
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_02");	//Zaraz po twojej wizycie okaza³o siê, ¿e w moim kufrze brakuje paru ubrañ!
	};
	if(Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_03");	//ZnajdŸ sobie jak¹œ robotê, zamiast wêszyæ po moim domu, darmozjadzie!
	};
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_04");	//W tej chwili oddaj mi moje ubrania!
	Info_ClearChoices(dia_lobart_stolencloths);
	Info_AddChoice(dia_lobart_stolencloths,"Zapomnij o tym!",dia_lobart_stolencloths_forgetit);
	if(Npc_HasItems(other,itar_bau_l) > 0)
	{
		Info_AddChoice(dia_lobart_stolencloths,"Proszê, weŸ je.",dia_lobart_stolencloths_hereyougo);
	}
	else
	{
		Info_AddChoice(dia_lobart_stolencloths,"Ju¿ ich nie mam.",dia_lobart_stolencloths_donthaveit);
	};
};

func void dia_lobart_stolencloths_hereyougo()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00");	//Proszê, weŸ je.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01");	//Jeœli s¹ ci potrzebne, zap³aæ za nie!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02");	//Zrobi³byœ coœ po¿ytecznego!
	b_giveinvitems(other,self,itar_bau_l,1);
	Info_ClearChoices(dia_lobart_stolencloths);
};

func void dia_lobart_stolencloths_donthaveit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00");	//Ju¿ ich nie mam.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01");	//Sprzeda³eœ je, co? Ju¿ ja ci poka¿ê!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};

func void dia_lobart_stolencloths_forgetit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00");	//Zapomnij o tym!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01");	//Ju¿ ja ci poka¿ê!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};


instance DIA_LOBART_HALLO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_hallo_condition;
	information = dia_lobart_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lobart_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lobart_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_00");	//Czemu wkroczy³eœ na mój teren?
		AI_Output(self,other,"DIA_Lobart_Hallo_05_01");	//Po czyjej ty jesteœ stronie? Popierasz zbuntowanych farmerów czy Króla?
		Info_ClearChoices(dia_lobart_hallo);
		Info_AddChoice(dia_lobart_hallo,"Nie rozumiem...",dia_lobart_hallo_what);
		Info_AddChoice(dia_lobart_hallo,"Jestem za Królem!",dia_lobart_hallo_fortheking);
		Info_AddChoice(dia_lobart_hallo,"Jestem za farmerami!",dia_lobart_hallo_forthepeasants);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_02");	//Co mogê dla ciebie zrobiæ?
	};
};

func void dia_lobart_hallo_forthepeasants()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForThePeasants_15_00");	//Jestem za farmerami!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_01");	//Ha! Ten przeklêty pod¿egacz, Onar, œci¹gnie na nas wszystkich nieszczêœcie!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_02");	//Jak s¹dzisz, czy paladyni bêd¹ siê temu wszystkiemu przygl¹daæ w nieskoñczonoœæ?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_03");	//Po tym co zrobi³ Onar, w ca³ym mieœcie a¿ zawrza³o.
	LOBART_AGAINSTKING = TRUE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_fortheking()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForTheKing_15_00");	//Jestem za Królem!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_01");	//'Za Królem!' W³aœnie to powiedzia³ stra¿nik miejski, zabieraj¹c mi moj¹ ostatni¹ owcê.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_02");	//Gdzie s¹ te œwinie, kiedy naprawdê ich potrzebujemy? Gdzie byli, kiedy atakowali nas bandyci i orkowie?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_03");	//Powiem ci gdzie: w mieœcie, ukryci bezpiecznie za grubym murem obronnym.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_04");	//Wiêc daj mi spokój z Królem.
	LOBART_AGAINSTKING = FALSE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_what()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_What_15_00");	//Nie rozumiem...
	AI_Output(self,other,"DIA_Lobart_Hallo_What_05_01");	//Co?! Lepiej ze mn¹ nie zadzieraj, ch³opcze! Chcê, ¿ebyœmy wiedzieli na czym stoimy! No wiêc? Po czyjej jesteœ stronie?!
};


instance DIA_LOBART_KLEIDUNG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_kleidung_condition;
	information = dia_lobart_kleidung_info;
	permanent = FALSE;
	description = "Potrzebne mi jakieœ ubranie!";
};


func int dia_lobart_kleidung_condition()
{
	if(!Npc_KnowsInfo(other,dia_lobart_stolencloths) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lobart_kleidung_info()
{
	AI_Output(other,self,"DIA_Lobart_KLEIDUNG_15_00");	//Potrzebne mi jakieœ ubranie!
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_01");	//Mogê ci daæ czyste ubranie robocze.
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_02");	//Jeœli mi za nie zap³acisz.
	Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
	b_logentry(TOPIC_KLEIDUNG,"Farmer Lobart chce mi sprzedaæ ubranie robocze.");
	if(!Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_03");	//A jeœli nie masz czym zap³aciæ... na farmie zawsze przyda siê dodatkowa para r¹k. To znaczy, jeœli potrzebujesz pracy.
		b_logentry(TOPIC_KLEIDUNG,"Mogê na nie czêœciowo zarobiæ, pracuj¹c na jego farmie. Im wiêcej pracy wykonam, tym ni¿sza bêdzie cena ubrañ.");
	};
};


instance DIA_LOBART_BUYCLOTHES(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_buyclothes_condition;
	information = dia_lobart_buyclothes_info;
	permanent = TRUE;
	description = "Ile chcesz za to ubranie?";
};


func int dia_lobart_buyclothes_condition()
{
	if((Npc_KnowsInfo(other,dia_lobart_kleidung) && (LOBART_KLEIDUNG_VERKAUFT == FALSE)) || (Npc_KnowsInfo(other,dia_lobart_stolencloths) && (LOBART_KLEIDUNG_GESTOHLEN == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE)))
	{
		return TRUE;
	};
};

func void dia_lobart_buyclothes_info()
{
	WERT_LOBARTSRUESTUNG = 80;
	AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");	//Ile chcesz za to ubranie?
	AI_Output(self,other,"DIA_Lobart_BuyClothes_05_01");	//Zastanówmy siê...
	if(LOBART_AGAINSTKING == TRUE)
	{
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_02");	//Pracowa³eœ dla mnie w polu.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_HILDA_PFANNEKAUFEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_03");	//Pomog³eœ mojej ¿onie.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_VINO_WEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_04");	//Vino mówi, ¿e jesteœ dla niego nieocenion¹ pomoc¹. A to ju¿ o czymœ œwiadczy - nieczêsto zdarza mu siê chwaliæ pracowników.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_MALETH_BANDITS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_05");	//Maleth mówi, ¿e przepêdzi³eœ bandytów. Mieliœmy przez nich ca³¹ masê problemów. Dziêkujê ci!
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	b_say_gold(self,other,WERT_LOBARTSRUESTUNG);
	if(WERT_LOBARTSRUESTUNG == 30)
	{
		AI_Output(self,other,"DIA_Lobart_GOLD_05_06");	//Cena nie zmaleje.
		b_logentry(TOPIC_KLEIDUNG,"Jednak nie sprzeda mi go taniej ni¿ za 30 sztuk z³ota.");
	};
	Info_ClearChoices(dia_lobart_buyclothes);
	Info_AddChoice(dia_lobart_buyclothes,"To wci¹¿ za du¿o.",dia_lobart_buyclothes_notyet);
	Info_AddChoice(dia_lobart_buyclothes,"Daj mi wiêc to ubranie robocze (ochrona od broni i strza³: 10)",dia_lobart_buyclothes_buy);
};

func void dia_lobart_buyclothes_buy()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_BUY_15_00");	//Daj mi to ubranie.
	if(b_giveinvitems(other,self,itmi_gold,WERT_LOBARTSRUESTUNG))
	{
		if(Npc_HasItems(self,itar_bau_l) > 0)
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");	//Tak, mój ch³opcze. Uczciwoœæ zawsze pop³aca. Proszê!
			b_giveinvitems(self,other,itar_bau_l,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_02");	//W moim domu stoi kufer, w którym zamkniête s¹ czyste ubrania.
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_03");	//¯eby tylko ci nie przysz³o do g³owy wzi¹æ sobie coœ jeszcze!
		};
		LOBART_KLEIDUNG_VERKAUFT = TRUE;
		Wld_AssignRoomToGuild("farm03",GIL_NONE);
		b_checklog();
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_04");	//Nie masz wystarczaj¹co du¿o z³ota!
	};
	Info_ClearChoices(dia_lobart_buyclothes);
};

func void dia_lobart_buyclothes_notyet()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_NotYet_15_00");	//To wci¹¿ za du¿o.
	AI_Output(self,other,"DIA_Lobart_BuyClothes_NotYet_05_01");	//Proszê bardzo.
	Info_ClearChoices(dia_lobart_buyclothes);
};


instance DIA_LOBART_AUFSTANDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_aufstandinfo_condition;
	information = dia_lobart_aufstandinfo_info;
	permanent = FALSE;
	description = "Co tu siê dzieje?";
};


func int dia_lobart_aufstandinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_aufstandinfo_info()
{
	AI_Output(other,self,"DIA_Lobart_AufstandInfo_15_00");	//Co siê tu dzieje?
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_01");	//Pytasz, co siê dzieje? Ch³opie, sk¹d ty siê urwa³eœ? Jesteœmy w przededniu wojny domowej!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_02");	//Do tej pory farmerzy traktowali czynsz jako sprawiedliwie naliczany podatek.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_03");	//Jednak odk¹d w mieœcie pojawili siê paladyni, coraz czêœciej odwiedzaj¹ nas stra¿nicy, kawa³ek po kawa³ku rozkradaj¹c nasz dobytek.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_04");	//Jeœli tak dalej pójdzie, to wkrótce nic nam ju¿ nie pozostanie.
	};
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_05");	//Niektórzy farmerzy zaczynaj¹ siê buntowaæ. Pierwszy by³ Onar!
};


instance DIA_LOBART_ONARSTORY(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_onarstory_condition;
	information = dia_lobart_onarstory_info;
	permanent = FALSE;
	description = "Powiedz mi coœ wiêcej o tym Onarze.";
};


func int dia_lobart_onarstory_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_onarstory_info()
{
	AI_Output(other,self,"DIA_Lobart_OnarStory_15_00");	//Powiedz mi coœ wiêcej o tym Onarze.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_01");	//Jesteœ najemnikiem, prawda? Wiêc chyba najlepiej znasz swojego szefa?
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_02");	//Onar jest w³aœcicielem najwiêkszej farmy w okolicy. Ca³kowicie zerwa³ kontakty z miastem.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_03");	//Podobno zatrudni³ najemników, aby nie dopuszczali stra¿y do jego posiad³oœci!
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_04");	//Trudno siê zreszt¹ temu dziwiæ.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_05");	//W ka¿dym razie to zadzia³a³o - ¿aden stra¿nik miejski nie œmie postawiæ stopy na jego terenach.
	};
};


instance DIA_LOBART_SLDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_sldinfo_condition;
	information = dia_lobart_sldinfo_info;
	permanent = FALSE;
	description = "Kim s¹ ci najemnicy zatrudnieni przez Onara?";
};


func int dia_lobart_sldinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_onarstory) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_sldinfo_info()
{
	AI_Output(other,self,"DIA_Lobart_SldInfo_15_00");	//Kim s¹ ci najemnicy zatrudnieni przez Onara?
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_01");	//Nie wiem o nich zbyt wiele. Prawdopodobnie wiêkszoœæ z nich to byli wiêŸniowie z Kolonii.
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_02");	//Wszyscy wiemy, czego siê po nich mo¿na spodziewaæ...
};


instance DIA_LOBART_WHICHSIDE(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_whichside_condition;
	information = dia_lobart_whichside_info;
	permanent = FALSE;
	description = "Po czyjej jesteœ stronie? Ch³opów czy Króla?";
};


func int dia_lobart_whichside_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_whichside_info()
{
	AI_Output(other,self,"DIA_Lobart_WhichSide_15_00");	//A co z tob¹? Po której jesteœ stronie? Ch³opów czy Króla?
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_01");	//Mieszkam zbyt blisko miasta, ¿eby mieæ jakikolwiek wybór.
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_02");	//Ale cieszê siê z tego. To by³aby bardzo trudna decyzja.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_03");	//Król zabiera nam wszystko, co mamy. Z kolei Onar szczuje swoimi najemnikami ka¿dego, kto nie chce siê do niego przy³¹czyæ.
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_04");	//Dlatego wiêkszoœæ farmerów wci¹¿ nie mo¿e siê jeszcze zdecydowaæ. Jednak wczeœniej czy póŸniej bêd¹ musieli opowiedzieæ siê po którejœ ze stron.
	};
};


instance DIA_LOBART_WORKNOW(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_worknow_condition;
	information = dia_lobart_worknow_info;
	permanent = FALSE;
	description = "Szukam pracy.";
};


func int dia_lobart_worknow_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) || Npc_KnowsInfo(other,dia_lobart_stolencloths) || Npc_KnowsInfo(other,dia_lobart_kleidung))
	{
		if(KAPITEL < 3)
		{
			return TRUE;
		};
	};
};

func void dia_lobart_worknow_info()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_15_00");	//Szukam pracy.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_01");	//Jeœli chcesz, mo¿esz u mnie pracowaæ.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_02");	//Mo¿esz pracowaæ w polu albo znaleŸæ sobie jakieœ inne zajêcie. Roboty na farmie nigdy nie brakuje.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_03");	//Mogê ci zap³aciæ, albo - jeœli wolisz - dostaniesz ode mnie porz¹dne ubranie.
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_04");	//Te rzeczy s¹ trochê warte. Nie mogê ci ich tak po prostu oddaæ. Jednak jeœli zgodzisz siê dla mnie pracowaæ, sprzedam ci je po ni¿szej cenie.
		Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
		b_logentry(TOPIC_KLEIDUNG,"Farmer Lobart chce mi sprzedaæ ubranie robocze, którego czêœæ ceny mogê odpracowaæ w polu. Im wiêcej pracy wykonam, tym ni¿sza bêdzie cena ubrañ.");
		if((Npc_HasEquippedArmor(other) == FALSE) || (LOBART_KLEIDUNG_VERKAUFT == TRUE))
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_05");	//Na twoim miejscu wzi¹³bym ubranie...
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_06");	//Ale poniewa¿ masz ju¿ ca³kiem przyzwoite ubranie, pewnie wola³byœ z³oto.
		};
	};
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_07");	//Trzeba zebraæ rzepê z tego ma³ego poletka przy stodole.
	Info_ClearChoices(dia_lobart_worknow);
	Info_AddChoice(dia_lobart_worknow,"Mam wyrywaæ rzepê? Chyba sobie ze mnie ¿artujesz!",dia_lobart_worknow_wannafoolme);
	Info_AddChoice(dia_lobart_worknow,"W porz¹dku...",dia_lobart_worknow_ok);
};

func void dia_lobart_worknow_ok()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");	//Dobrze...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_Ok_05_01");	//Wiêc poœpiesz siê, zanim zmieniê zdanie.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"Farmer Lobart chce, abym zebra³ z pola rzepê. W zamian oferuje mi z³oto albo obni¿enie ceny ubrañ.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};

func void dia_lobart_worknow_wannafoolme()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_WannaFoolMe_15_00");	//Mam wyrywaæ rzepê? Chyba sobie ze mnie ¿artujesz!
	AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_01");	//Tak, taki d¿entelmen jak ty pewnie brzydzi siê uczciw¹ prac¹, co?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_02");	//Jazda na pole albo wynoœ siê z mojej farmy!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_03");	//W tej chwili nie mam dla ciebie ¿adnej innej pracy.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"Farmer Lobart chce, abym zebra³ z pola rzepê. W zamian oferuje mi z³oto albo obni¿enie ceny ubrañ.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};


instance DIA_LOBART_RUEBENRUNNING(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_ruebenrunning_condition;
	information = dia_lobart_ruebenrunning_info;
	permanent = TRUE;
	description = "Oto twoja rzepa!";
};


func int dia_lobart_ruebenrunning_condition()
{
	if((MIS_LOBART_RUEBEN == LOG_RUNNING) && (Npc_HasItems(other,itpl_beet) >= 1) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_ruebenrunning_info()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_00");	//Oto twoja rzepa!
	if(Npc_HasItems(other,itpl_beet) >= 20)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_01");	//Widzisz, jednak jest z ciebie jakiœ po¿ytek.
		};
		if(Npc_IsDead(hilda) == FALSE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_02");	//Zanieœ je mojej ¿onie i powiedz, ¿eby je ugotowa³a.
			MIS_LOBART_RUEBENTOHILDA = LOG_RUNNING;
			Log_CreateTopic(TOPIC_RUEBENBRINGEN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_RUEBENBRINGEN,LOG_RUNNING);
			b_logentry(TOPIC_RUEBENBRINGEN,"Zebran¹ rzepê mam zanieœæ do ¿ony Lobarta, która przyrz¹dzi z niej posi³ek.");
		};
		MIS_LOBART_RUEBEN = LOG_SUCCESS;
		b_giveplayerxp(XP_LOBARTHOLRUEBEN);
		AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_03");	//Co z moj¹ zap³at¹?
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_04");	//Mogê ci daæ 5 sztuk z³ota.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_05");	//...albo sprzedaæ ubranie po ni¿szej cenie. Co wybierasz?
		};
		Info_ClearChoices(dia_lobart_ruebenrunning);
		if(hero.guild == GIL_NONE)
		{
			Info_AddChoice(dia_lobart_ruebenrunning,"Sprzedaj mi ubranie po ni¿szej cenie!",dia_lobart_ruebenrunning_billiger);
		};
		Info_AddChoice(dia_lobart_ruebenrunning,"Daj mi 5 sztuk z³ota!",dia_lobart_ruebenrunning_gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_06");	//Ale tu nie ma nawet 20 sztuk!
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_07");	//Chcesz mi powiedzieæ, ¿e zjad³eœ resztê?! Jeœli tak, to mo¿esz zapomnieæ o wynagrodzeniu!
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_08");	//Jazda na pole po resztê rzepy! Wracaj do pracy albo naprawdê siê rozgniewam!
		};
		AI_StopProcessInfos(self);
	};
};

func void dia_lobart_ruebenrunning_gold()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Gold_15_00");	//Daj mi 5 sztuk z³ota!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_01");	//Proszê.
	b_giveinvitems(self,other,itmi_gold,5);
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_02");	//I nie przepij wszystkiego od razu.
	};
	Info_ClearChoices(dia_lobart_ruebenrunning);
};

func void dia_lobart_ruebenrunning_billiger()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Billiger_15_00");	//Sprzedaj mi ubranie po ni¿szej cenie!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Billiger_05_01");	//Dobrze! Obni¿ê cenê o 10 monet.
	Info_ClearChoices(dia_lobart_ruebenrunning);
};


instance DIA_LOBART_MOREWORK(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_morework_condition;
	information = dia_lobart_morework_info;
	permanent = TRUE;
	description = "Czy masz dla mnie jeszcze jak¹œ robotê?";
};


func int dia_lobart_morework_condition()
{
	if(((MIS_LOBART_RUEBEN == LOG_RUNNING) || (MIS_LOBART_RUEBEN == LOG_SUCCESS)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_morework_info()
{
	AI_Output(other,self,"DIA_Lobart_MoreWork_15_00");	//Czy masz dla mnie jeszcze jak¹œ robotê?
	if(MIS_LOBART_RUEBEN == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_01");	//Najpierw przynieœ rzepê. Potem zobaczymy.
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_02");	//Nie, ale zapytaj moj¹ ¿onê albo ch³opców pracuj¹cych w polu. Mo¿e oni znajd¹ dla ciebie jakieœ zajêcie.
	};
};


instance DIA_LOBART_ANDREHELPLOBART(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_andrehelplobart_condition;
	information = dia_lobart_andrehelplobart_info;
	description = "Andre mnie do ciebie przys³a³.";
};


func int dia_lobart_andrehelplobart_condition()
{
	if(MIS_ANDREHELPLOBART == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lobart_andrehelplobart_info()
{
	AI_Output(other,self,"DIA_Lobart_ANDREHELPLOBART_15_00");	//Przysy³a mnie Andre. Czy mogê coœ dla ciebie zrobiæ?
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_01");	//Tak, pewnie. Te cholerne polne bestie strasznie uprzykrzaj¹ mi ¿ycie.
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_02");	//Za³atw jakoœ ten problem. Niewa¿ne jak!
	Log_AddEntry(TOPIC_BECOMEMIL,"Pola Lobarta atakowane s¹ przez polne bestie. Prosi³ mnie, abym siê nimi zaj¹³.");
	MIS_LOBARTKILLBUGS = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_BUGDEAD(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_bugdead_condition;
	information = dia_lobart_bugdead_info;
	permanent = TRUE;
	description = "Polne bestie nie ¿yj¹!";
};


var int dia_lobart_bugdead_noperm;

func int dia_lobart_bugdead_condition()
{
	if((MIS_LOBARTKILLBUGS == LOG_RUNNING) && (DIA_LOBART_BUGDEAD_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_lobart_bugdead_info()
{
	if(Npc_IsDead(lobarts_giant_bug1) && Npc_IsDead(lobarts_giant_bug2) && Npc_IsDead(lobarts_giant_bug3) && Npc_IsDead(lobarts_giant_bug4) && Npc_IsDead(lobarts_giant_bug5) && Npc_IsDead(lobarts_giant_bug6) && Npc_IsDead(lobarts_giant_bug7))
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_00");	//Polne bestie nie ¿yj¹!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_01");	//Dobra robota. Polecê twoje us³ugi znajomym. Proszê, oto zap³ata.
		b_startotherroutine(vino,"Start");
		b_startotherroutine(lobartsbauer1,"Start");
		b_startotherroutine(lobartsbauer2,"Start");
		CreateInvItems(self,itmi_gold,20);
		b_giveinvitems(self,other,itmi_gold,20);
		MIS_LOBARTKILLBUGS = LOG_SUCCESS;
		MIS_ANDREHELPLOBART = LOG_SUCCESS;
		Log_AddEntry(TOPIC_BECOMEMIL,"Lobart nie musi siê ju¿ przejmowaæ polnymi bestiami. Zrobi³em z nimi porz¹dek.");
		DIA_LOBART_BUGDEAD_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_02");	//Chyba wykoñczy³em je wszystkie!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_03");	//Nie próbuj mnie wykiwaæ. Wci¹¿ je tutaj widujê. Albo zabijesz je wszystkie, albo nie mamy o czym gadaæ.
		AI_StopProcessInfos(self);
	};
};


instance DIA_LOBART_KAP3_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap3_exit_condition;
	information = dia_lobart_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lobart_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_DMT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 30;
	condition = dia_lobart_dmt_condition;
	information = dia_lobart_dmt_info;
	description = "Co nowego na farmie?";
};


func int dia_lobart_dmt_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_lobart_dmt_info()
{
	AI_Output(other,self,"DIA_Lobart_DMT_15_00");	//Co nowego na farmie?
	AI_Output(self,other,"DIA_Lobart_DMT_05_01");	//Ju¿ nie dajê rady...
	AI_Output(self,other,"DIA_Lobart_DMT_05_02");	//Znienacka pojawili siê tutaj ci goœcie w czarnych kapturach.
	Info_ClearChoices(dia_lobart_dmt);
	Info_AddChoice(dia_lobart_dmt,DIALOG_ENDE,dia_lobart_dmt_back);
	if((hero.guild == GIL_KDF) && (VINO_ISALIVE_KAP3 == TRUE))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_03");	//Najpierw Vino mia³ z nimi bardzo d³ug¹ rozmowê, a potem gdzieœ go zabrali.
		if(NPCOBSESSEDBYDMT_VINO == FALSE)
		{
			Info_AddChoice(dia_lobart_dmt,"Dok¹d go zaci¹gnêli?",dia_lobart_dmt_vinowohin);
		};
		Info_AddChoice(dia_lobart_dmt,"W czym mia³ im pomóc Vino?",dia_lobart_dmt_vinowas);
	};
	if((Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_04");	//Nied³ugo potem moja ¿ona powa¿nie siê rozchorowa³a. Wiêkszoœæ czasu spêdza w ³ó¿ku. Dosyæ czêsto jej siê to zdarza.
	};
	AI_Output(self,other,"DIA_Lobart_DMT_05_05");	//Chyba oszalejê!
	if((MIS_HEALHILDA != LOG_SUCCESS) && (Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		Info_AddChoice(dia_lobart_dmt,"Czemu nie zabierzesz ¿ony do uzdrawiacza?",dia_lobart_dmt_frauheilen);
	};
	Info_AddChoice(dia_lobart_dmt,"Czemu nic nie zrobisz z tymi zakapturzonymi postaciami?",dia_lobart_dmt_hof);
	Info_AddChoice(dia_lobart_dmt,"Rozmawia³eœ z tymi odzianymi na czarno mê¿czyznami?",dia_lobart_dmt_spoketothem);
};

func void dia_lobart_dmt_frauheilen()
{
	AI_Output(other,self,"DIA_Lobart_DMT_FrauHeilen_15_00");	//Czemu nie zabierzesz ¿ony do uzdrawiacza?
	AI_Output(self,other,"DIA_Lobart_DMT_FrauHeilen_05_01");	//Powinniœmy pójœæ do miasta i zobaczyæ siê z Vatrasem, ale nie mogê siê st¹d ruszyæ, dopóki to ca³e zamieszanie siê nie skoñczy.
	Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
	b_logentry(TOPIC_HEALHILDA,"¯ona Lobarta, Hilda, zachorowa³a. Vatras ma lekarstwo, które mo¿e j¹ wyleczyæ.");
	MIS_HEALHILDA = LOG_RUNNING;
};

func void dia_lobart_dmt_back()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void dia_lobart_dmt_spoketothem()
{
	AI_Output(other,self,"DIA_Lobart_DMT_spokeToThem_15_00");	//Rozmawia³eœ z tymi odzianymi na czarno mê¿czyznami?
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_01");	//Jasne. Nie mia³em zreszt¹ wyboru.
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_02");	//Chyba kogoœ szukaj¹.
};

func void dia_lobart_dmt_hof()
{
	AI_Output(other,self,"DIA_Lobart_DMT_hof_15_00");	//Czemu nic nie zrobisz z tymi zakapturzonymi postaciami?
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_01");	//Bardzo bym chcia³, ale siê bojê. Widzia³em, jak spalili jednego cz³owieka ¿ywcem. Tak po prostu.
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_02");	//Czemu mia³bym ryzykowaæ ¿yciem?
};

func void dia_lobart_dmt_vinowas()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWas_15_00");	//W czym mia³ im pomóc Vino?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWas_05_01");	//Nie powiedzieli. Po prostu go zabrali.
};

func void dia_lobart_dmt_vinowohin()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWohin_15_00");	//Dok¹d go zaci¹gnêli?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWohin_05_01");	//Poszli przez to wzgórze.
};


instance DIA_LOBART_VINOTOT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 32;
	condition = dia_lobart_vinotot_condition;
	information = dia_lobart_vinotot_info;
	description = "Vino ju¿ nie wróci.";
};


func int dia_lobart_vinotot_condition()
{
	if((Npc_IsDead(vino) || (NPCOBSESSEDBYDMT_VINO == TRUE)) && Npc_KnowsInfo(other,dia_lobart_dmt) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_lobart_vinotot_info()
{
	AI_Output(other,self,"DIA_Lobart_VINOTOT_15_00");	//Vino ju¿ nie wróci.
	if(Npc_IsDead(vino))
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");	//Nie ¿yje.
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_02");	//Doprowadzili go do szaleñstwa.
	};
	AI_Output(self,other,"DIA_Lobart_VINOTOT_05_03");	//Na Innosa. Mam nadziejê, ¿e ten koszmar wkrótce siê skoñczy.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LOBART_PERM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 80;
	condition = dia_lobart_perm_condition;
	information = dia_lobart_perm_info;
	permanent = TRUE;
	description = "Uwa¿aj na swoj¹ farmê!";
};


func int dia_lobart_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_dmt) && (KAPITEL >= 3) && (Npc_IsDead(orcwarrior_lobart1) && Npc_IsDead(orcwarrior_lobart2) && Npc_IsDead(orcwarrior_lobart3) && Npc_IsDead(orcwarrior_lobart4) && Npc_IsDead(orcwarrior_lobart5) && Npc_IsDead(orcwarrior_lobart6)))
	{
		return TRUE;
	};
};

func void dia_lobart_perm_info()
{
	AI_Output(other,self,"DIA_Lobart_PERM_15_00");	//Uwa¿aj na swoj¹ farmê!
	AI_Output(self,other,"DIA_Lobart_PERM_05_01");	//Postaram siê.
};


instance DIA_LOBART_KAP4_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap4_exit_condition;
	information = dia_lobart_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lobart_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKPROBLEM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 41;
	condition = dia_lobart_orkproblem_condition;
	information = dia_lobart_orkproblem_info;
	description = "Masz tu k³opot z orkami.";
};


func int dia_lobart_orkproblem_condition()
{
	if(((Npc_IsDead(orcwarrior_lobart1) == FALSE) || (Npc_IsDead(orcwarrior_lobart2) == FALSE) || (Npc_IsDead(orcwarrior_lobart3) == FALSE) || (Npc_IsDead(orcwarrior_lobart4) == FALSE) || (Npc_IsDead(orcwarrior_lobart5) == FALSE) || (Npc_IsDead(orcwarrior_lobart6) == FALSE)) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)) && Npc_KnowsInfo(other,dia_lobart_dmt))
	{
		return TRUE;
	};
};

func void dia_lobart_orkproblem_info()
{
	AI_Output(other,self,"DIA_Lobart_ORKPROBLEM_15_00");	//Masz tu k³opot z orkami.
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_01");	//Niech to szlag! Czy te problemy nigdy siê nie skoñcz¹?
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_02");	//Jeœli tak dalej pójdzie, wkrótce wartoœæ ca³ej mojej farmy nie bêdzie przekraczaæ trzech monet!
	Log_CreateTopic(TOPIC_LOBARTSORKPROBLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOBARTSORKPROBLEM,LOG_RUNNING);
	b_logentry(TOPIC_LOBARTSORKPROBLEM,"Orkowie zajêli farmê Lobarta, który poprosi³ mnie, abym siê ich pozby³.");
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKSWEG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 42;
	condition = dia_lobart_orksweg_condition;
	information = dia_lobart_orksweg_info;
	description = "Pozby³em siê orków.";
};


func int dia_lobart_orksweg_condition()
{
	if((Npc_IsDead(orcwarrior_lobart1) == TRUE) && (Npc_IsDead(orcwarrior_lobart2) == TRUE) && (Npc_IsDead(orcwarrior_lobart3) == TRUE) && (Npc_IsDead(orcwarrior_lobart4) == TRUE) && (Npc_IsDead(orcwarrior_lobart5) == TRUE) && (Npc_IsDead(orcwarrior_lobart6) == TRUE) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lobart_orksweg_info()
{
	AI_Output(other,self,"DIA_Lobart_ORKSWEG_15_00");	//Pozby³em siê orków.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_01");	//I niech ludzie nie gadaj¹, ¿e paladyni nic nie robi¹ dla farmerów.
	};
	AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_02");	//Chwa³a Innosowi. Nie mogê ci zaoferowaæ ¿adnej wartoœciowej nagrody, ale mam nadziejê, ¿e docenisz ten gest.
	b_startotherroutine(vino,"Start");
	b_startotherroutine(lobartsbauer1,"Start");
	b_startotherroutine(lobartsbauer2,"Start");
	TOPIC_END_LOBARTSORKPROBLEM = TRUE;
	b_giveplayerxp(XP_KILLEDLOBARTORKS);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_LOBART_KAP5_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap5_exit_condition;
	information = dia_lobart_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lobart_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_KAP6_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap6_exit_condition;
	information = dia_lobart_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lobart_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_PICKPOCKET(C_INFO)
{
	npc = bau_950_lobart;
	nr = 900;
	condition = dia_lobart_pickpocket_condition;
	information = dia_lobart_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_lobart_pickpocket_condition()
{
	return c_beklauen(65,80);
};

func void dia_lobart_pickpocket_info()
{
	Info_ClearChoices(dia_lobart_pickpocket);
	Info_AddChoice(dia_lobart_pickpocket,DIALOG_BACK,dia_lobart_pickpocket_back);
	Info_AddChoice(dia_lobart_pickpocket,DIALOG_PICKPOCKET,dia_lobart_pickpocket_doit);
};

func void dia_lobart_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lobart_pickpocket);
};

func void dia_lobart_pickpocket_back()
{
	Info_ClearChoices(dia_lobart_pickpocket);
};

