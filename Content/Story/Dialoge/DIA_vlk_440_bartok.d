
instance DIA_BARTOK_EXIT(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 999;
	condition = dia_bartok_exit_condition;
	information = dia_bartok_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bartok_exit_condition()
{
	return TRUE;
};

func void dia_bartok_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BARTOK_PICKPOCKET(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 900;
	condition = dia_bartok_pickpocket_condition;
	information = dia_bartok_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego ko�czanu b�dzie do�� �atwa)";
};


func int dia_bartok_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itrw_arrow) >= 40) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_bartok_pickpocket_info()
{
	Info_ClearChoices(dia_bartok_pickpocket);
	Info_AddChoice(dia_bartok_pickpocket,DIALOG_BACK,dia_bartok_pickpocket_back);
	Info_AddChoice(dia_bartok_pickpocket,DIALOG_PICKPOCKET,dia_bartok_pickpocket_doit);
};

func void dia_bartok_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itrw_arrow,40);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_bartok_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_bartok_pickpocket_back()
{
	Info_ClearChoices(dia_bartok_pickpocket);
};


instance DIA_BARTOK_HALLO(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_hallo_condition;
	information = dia_bartok_hallo_info;
	permanent = FALSE;
	description = "Co s�ycha�?";
};


func int dia_bartok_hallo_condition()
{
	return TRUE;
};

func void dia_bartok_hallo_info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//Nie jeste� st�d, co? Niewa�ne, ja te� nie.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//Gdzie si� wcze�niej kr�ci�e�?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//W lasach, polowa�em na wilki i �cierwojady razem z innymi my�liwymi.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//Ale rzuci�em to. Czasy zrobi�y si� niebezpieczne. Kr�ci si� tam sporo podejrzanych typ�w...
};


instance DIA_BARTOK_JAEGER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 2;
	condition = dia_bartok_jaeger_condition;
	information = dia_bartok_jaeger_info;
	permanent = FALSE;
	description = "Gdzie mog� znale�� innych my�liwych?";
};


func int dia_bartok_jaeger_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_jaeger_info()
{
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//Gdzie mog� znale�� innych my�liwych?
	AI_Output(self,other,"DIA_Bartok_Jager_04_01");	//Mieli�my ob�z niedaleko tawerny, w po�owie drogi do gospodarstwa Onara.
	AI_Output(self,other,"DIA_Bartok_Jager_04_02");	//Ale nie wiem, czy kto� jeszcze tam zosta�.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_00");	//Do niedawna obaj przebywali�my w mie�cie.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_01");	//M�j przyjaciel Trokar jest bardzo dobrym my�liwym.
};


instance DIA_ADDON_BARTOK_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_addon_bartok_missingpeople_condition;
	information = dia_addon_bartok_missingpeople_info;
	description = "Gdzie on teraz przebywa?";
};


func int dia_addon_bartok_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_jaeger))
	{
		return TRUE;
	};
};

func void dia_addon_bartok_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_15_00");	//Gdzie on teraz przebywa?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_01");	//To dziwna historia...
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_02");	//Kilka dni temu siedzieli�my w knajpie Coragona i gadali�my o �owach.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_03");	//Nie pytaj mnie, co si� dok�adnie sta�o - by�em nie�le wstawiony.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_04");	//Pami�tam tylko, �e Trokar wspomnia� co� o zakupie bagiennego ziela... Nigdy nie wr�ci�.
	MIS_BARTOK_MISSINGTROKAR = LOG_RUNNING;
	Info_ClearChoices(dia_addon_bartok_missingpeople);
	Info_AddChoice(dia_addon_bartok_missingpeople,"Nie pr�bowa�e� go szuka�?",dia_addon_bartok_missingpeople_such);
	Info_AddChoice(dia_addon_bartok_missingpeople,"Gdzie mia� kupi� to ziele?",dia_addon_bartok_missingpeople_wo);
};

func void dia_addon_bartok_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_wo_15_00");	//Gdzie mia� kupi� to ziele?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_wo_04_01");	//Chyba gdzie� w porcie.
};

func void dia_addon_bartok_missingpeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//Nie pr�bowa�e� go szuka�?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_01");	//Nie. Powiadomi�em tylko stra�.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_02");	//Jej funkcjonariusze nie zdo�ali go odnale��...
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_03");	//Mam nadziej�, �e nie zaatakowa� go wilk lub nie sta�o si� co� jeszcze gorszego.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_04");	//My�l, �e podczas polowania m�g�bym natkn�� si� na jego zimne truch�o... przepe�nia mnie strachem.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_05");	//Ten obraz nigdy chyba nie zniknie z mej pami�ci...
};


instance DIA_BARTOK_BOSPER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 3;
	condition = dia_bartok_bosper_condition;
	information = dia_bartok_bosper_info;
	permanent = FALSE;
	description = "Bosper m�wi�, �e kiedy� dla niego pracowa�e�...";
};


func int dia_bartok_bosper_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_bartok) && Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_bosper_info()
{
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//Bosper m�wi�, �e kiedy� dla niego pracowa�e�...
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//To prawda. Ale jego interesuj� tylko te cholerne sk�ry.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//M�wi�em mu, jak si� tam zrobi�o niebezpiecznie. Nie zwr�ci� na to uwagi.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//No c�, przynajmniej dobrze zap�aci� - nie mog� narzeka�.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//Mo�esz mi co� o nim powiedzie�?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//Ostatnio kto� ukrad� Bosperowi jeden z jego �uk�w. W bia�y dzie�.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//Jaki� facet po prostu wszed� do jego sklepu, wzi�� �uk i wyszed�.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//Z�odzieje s� coraz bardziej bezczelni!
	if(MIS_BOSPER_BOGEN != LOG_SUCCESS)
	{
		MIS_BOSPER_BOGEN = LOG_RUNNING;
	};
};


instance DIA_BARTOK_WANNALEARN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_wannalearn_condition;
	information = dia_bartok_wannalearn_info;
	permanent = FALSE;
	description = "Mo�esz nauczy� mnie czego� o polowaniu?";
};


func int dia_bartok_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_wannalearn_info()
{
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//Mo�esz nauczy� mnie czego� o polowaniu?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//Mog� ci pokaza�, jak si� cicho skrada� i pos�ugiwa� si� �ukiem.
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//Je�li chcesz si� nauczy�, jak zdejmowa� sk�ry ze zwierz�t, id� do Bospera. To on mnie tego nauczy�.
	};
	BARTOK_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Bartok mo�e mnie nauczy� strzelania z �uku oraz skradania si�.");
};


instance DIA_BARTOK_TEACHSNEAK(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teachsneak_condition;
	information = dia_bartok_teachsneak_info;
	permanent = TRUE;
	description = b_buildlearnstring("Naucz mnie, jak si� nale�y skrada�!",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1));
};


func int dia_bartok_teachsneak_condition()
{
	if((BARTOK_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void dia_bartok_teachsneak_info()
{
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//Poka� mi, jak si� skrada�.
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//Dobrze. Najpierw musisz nauczy� si� odpowiednio roz�o�y� ci�ar swojego cia�a.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//Aby to zrobi�, ugnij kolana i zawsze stawiaj stop�, zaczynaj�c od pi�ty.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//Zanim ruszysz drug� nog�, znajd� dobre oparcie i przenie� ca�y ci�ar cia�a na pierwsz� nog�.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//Do wi�kszo�ci stworze� nie uda ci si� podej��, chyba �e �pi�. Zwierz�ta po prostu ci� wyczuj�.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//A wi�c zawsze zwracaj uwag�, sk�d wieje wiatr.
	};
};


var int bosper_merkebow;

instance DIA_BARTOK_TEACH(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teach_condition;
	information = dia_bartok_teach_info;
	permanent = TRUE;
	description = "Chcia�bym lepiej strzela� z �uku.";
};


func int dia_bartok_teach_condition()
{
	if(BARTOK_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_teach_info()
{
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//Chcia�bym lepiej strzela� z �uku.
	AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//W porz�dku, zobaczymy, czy uda mi si� ciebie czego� nauczy�...
	BOSPER_MERKEBOW = other.hitchance[NPC_TALENT_BOW];
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};

func void dia_bartok_teach_back()
{
	if(other.hitchance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//Teraz powiniene� poszuka� kogo�, kto zna si� na tym lepiej ni� ja.
	}
	else if(BOSPER_MERKEBOW < other.hitchance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//W porz�dku, twoja celno�� ju� si� poprawi�a.
	};
	Info_ClearChoices(dia_bartok_teach);
};

func void dia_bartok_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};

func void dia_bartok_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};


var int bartok_bereit;
var int bartok_later;

instance DIA_BARTOK_ZUSAMMEN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_bartok_zusammen_condition;
	information = dia_bartok_zusammen_info;
	permanent = TRUE;
	description = "Czemu nie p�jdziemy na polowanie razem?";
};


func int dia_bartok_zusammen_condition()
{
	if((BARTOK_BEREIT == FALSE) && Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_zusammen_info()
{
	if(BARTOK_LATER == FALSE)
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//Czemu nie p�jdziemy na polowanie razem?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//Hmmm. We dw�ch jest bezpieczniej, to prawda...
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//A wi�c znasz si� troch� na polowaniu?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//To znaczy, umiesz zdejmowa� sk�r� ze zwierz�cia?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == TRUE)
	{
		if(BARTOK_LATER == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//Masz 50 sztuk z�ota?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Tak.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//Dobra, ale chc� zobaczy� 50 sztuk z�ota. Za to b�dziesz m�g� zatrzyma� sk�ry i sprzeda� je Bosperowi.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//Uczciwy uk�ad, no nie?
		};
		Info_ClearChoices(dia_bartok_zusammen);
		Info_AddChoice(dia_bartok_zusammen,"Na razie...",dia_bartok_zusammen_later);
		Info_AddChoice(dia_bartok_zusammen,"Prosz� bardzo...",dia_bartok_zusammen_pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//Nie.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//W takim razie to nie ma sensu.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//Wr��, jak si� czego� nauczysz.
	};
};

func void dia_bartok_zusammen_later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//Na razie...
	BARTOK_LATER = TRUE;
	Info_ClearChoices(dia_bartok_zusammen);
};

func void dia_bartok_zusammen_pay()
{
	Info_ClearChoices(dia_bartok_zusammen);
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//Prosz� bardzo...
		BARTOK_BEREIT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//Nie masz z�ota.
	};
};


var int bartok_los;

instance DIA_BARTOK_HUNTNOW(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_bartok_huntnow_condition;
	information = dia_bartok_huntnow_info;
	permanent = FALSE;
	description = "Chod�my na polowanie!";
};


func int dia_bartok_huntnow_condition()
{
	if(BARTOK_BEREIT == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_huntnow_info()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//Chod�my na polowanie!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//W porz�dku, id� za mn�. Za po�udniow� bram� zaczyna si� las. Tam znajdziemy du�o zwierz�t.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//Pewnie wi�cej, ni� by�my chcieli...
	BARTOK_LOS = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
};


var int bartok_orkstillthere;

instance DIA_BARTOK_IMWALD(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_imwald_condition;
	information = dia_bartok_imwald_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bartok_imwald_condition()
{
	if((BARTOK_LOS == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void dia_bartok_imwald_info()
{
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//No i jak my�lisz, powinni�my i�� dalej w las, czy nie?
	Info_ClearChoices(dia_bartok_imwald);
	Info_AddChoice(dia_bartok_imwald,"Wracajmy!",dia_bartok_imwald_nachhause);
	Info_AddChoice(dia_bartok_imwald,"Chod�my dalej.",dia_bartok_imwald_weiter);
};

func void dia_bartok_imwald_nachhause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//Wracajmy!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//To mi si� podoba. Pewnie wle�liby�my prosto w u�cisk jakiego� orka.
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

func void dia_bartok_imwald_weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//Chod�my dalej.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//W porz�dku. Miejmy nadziej�, �e jako� to b�dzie...
	if(!Npc_IsDead(cityorc))
	{
		BARTOK_ORKSTILLTHERE = TRUE;
	};
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};


var int bartok_ende;

instance DIA_BARTOK_ANGEKOMMEN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_angekommen_condition;
	information = dia_bartok_angekommen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bartok_angekommen_condition()
{
	if((BARTOK_LOS == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void dia_bartok_angekommen_info()
{
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//Do�� tego! Wracam do miasta.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//Tutaj jest zbyt niebezpiecznie jak dla mnie - nawet we dw�ch.
	if(BARTOK_ORKSTILLTHERE == TRUE)
	{
		b_bartok_shitanorc();
		BARTOK_ORKGESAGT = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//No to na razie!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//Mo�esz sprzeda� te sk�ry Bosperowi.
	BARTOK_ENDE = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_BARTOK_PERM(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_perm_condition;
	information = dia_bartok_perm_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int dia_bartok_perm_condition()
{
	if(BARTOK_LOS == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_perm_info()
{
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//Wszystko w porz�dku?
	if(BARTOK_ENDE == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//Tak. Ale ju� nie wychodz� z miasta. Przynajmniej w najbli�szym czasie.
		if(BARTOK_ORKGESAGT == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//Ci�gle mi dr�� kolana, jak sobie przypomn� tego orka.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Jasne. Upolujmy kilka bestii!
	};
};

