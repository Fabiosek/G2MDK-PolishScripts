
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
	description = "(Kradzie¿ tego ko³czanu bêdzie doœæ ³atwa)";
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
	description = "Co s³ychaæ?";
};


func int dia_bartok_hallo_condition()
{
	return TRUE;
};

func void dia_bartok_hallo_info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//Nie jesteœ st¹d, co? Niewa¿ne, ja te¿ nie.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//Gdzie siê wczeœniej krêci³eœ?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//W lasach, polowa³em na wilki i œcierwojady razem z innymi myœliwymi.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//Ale rzuci³em to. Czasy zrobi³y siê niebezpieczne. Krêci siê tam sporo podejrzanych typów...
};


instance DIA_BARTOK_JAEGER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 2;
	condition = dia_bartok_jaeger_condition;
	information = dia_bartok_jaeger_info;
	permanent = FALSE;
	description = "Gdzie mogê znaleŸæ innych myœliwych?";
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
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//Gdzie mogê znaleŸæ innych myœliwych?
	AI_Output(self,other,"DIA_Bartok_Jager_04_01");	//Mieliœmy obóz niedaleko tawerny, w po³owie drogi do gospodarstwa Onara.
	AI_Output(self,other,"DIA_Bartok_Jager_04_02");	//Ale nie wiem, czy ktoœ jeszcze tam zosta³.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_00");	//Do niedawna obaj przebywaliœmy w mieœcie.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_01");	//Mój przyjaciel Trokar jest bardzo dobrym myœliwym.
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
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_02");	//Kilka dni temu siedzieliœmy w knajpie Coragona i gadaliœmy o ³owach.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_03");	//Nie pytaj mnie, co siê dok³adnie sta³o - by³em nieŸle wstawiony.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_04");	//Pamiêtam tylko, ¿e Trokar wspomnia³ coœ o zakupie bagiennego ziela... Nigdy nie wróci³.
	MIS_BARTOK_MISSINGTROKAR = LOG_RUNNING;
	Info_ClearChoices(dia_addon_bartok_missingpeople);
	Info_AddChoice(dia_addon_bartok_missingpeople,"Nie próbowa³eœ go szukaæ?",dia_addon_bartok_missingpeople_such);
	Info_AddChoice(dia_addon_bartok_missingpeople,"Gdzie mia³ kupiæ to ziele?",dia_addon_bartok_missingpeople_wo);
};

func void dia_addon_bartok_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_wo_15_00");	//Gdzie mia³ kupiæ to ziele?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_wo_04_01");	//Chyba gdzieœ w porcie.
};

func void dia_addon_bartok_missingpeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//Nie próbowa³eœ go szukaæ?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_01");	//Nie. Powiadomi³em tylko stra¿.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_02");	//Jej funkcjonariusze nie zdo³ali go odnaleŸæ...
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_03");	//Mam nadziejê, ¿e nie zaatakowa³ go wilk lub nie sta³o siê coœ jeszcze gorszego.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_04");	//Myœl, ¿e podczas polowania móg³bym natkn¹æ siê na jego zimne truch³o... przepe³nia mnie strachem.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_05");	//Ten obraz nigdy chyba nie zniknie z mej pamiêci...
};


instance DIA_BARTOK_BOSPER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 3;
	condition = dia_bartok_bosper_condition;
	information = dia_bartok_bosper_info;
	permanent = FALSE;
	description = "Bosper mówi³, ¿e kiedyœ dla niego pracowa³eœ...";
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
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//Bosper mówi³, ¿e kiedyœ dla niego pracowa³eœ...
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//To prawda. Ale jego interesuj¹ tylko te cholerne skóry.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//Mówi³em mu, jak siê tam zrobi³o niebezpiecznie. Nie zwróci³ na to uwagi.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//No có¿, przynajmniej dobrze zap³aci³ - nie mogê narzekaæ.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//Mo¿esz mi coœ o nim powiedzieæ?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//Ostatnio ktoœ ukrad³ Bosperowi jeden z jego ³uków. W bia³y dzieñ.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//Jakiœ facet po prostu wszed³ do jego sklepu, wzi¹³ ³uk i wyszed³.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//Z³odzieje s¹ coraz bardziej bezczelni!
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
	description = "Mo¿esz nauczyæ mnie czegoœ o polowaniu?";
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
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//Mo¿esz nauczyæ mnie czegoœ o polowaniu?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//Mogê ci pokazaæ, jak siê cicho skradaæ i pos³ugiwaæ siê ³ukiem.
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//Jeœli chcesz siê nauczyæ, jak zdejmowaæ skóry ze zwierz¹t, idŸ do Bospera. To on mnie tego nauczy³.
	};
	BARTOK_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Bartok mo¿e mnie nauczyæ strzelania z ³uku oraz skradania siê.");
};


instance DIA_BARTOK_TEACHSNEAK(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teachsneak_condition;
	information = dia_bartok_teachsneak_info;
	permanent = TRUE;
	description = b_buildlearnstring("Naucz mnie, jak siê nale¿y skradaæ!",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1));
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
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//Poka¿ mi, jak siê skradaæ.
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//Dobrze. Najpierw musisz nauczyæ siê odpowiednio roz³o¿yæ ciê¿ar swojego cia³a.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//Aby to zrobiæ, ugnij kolana i zawsze stawiaj stopê, zaczynaj¹c od piêty.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//Zanim ruszysz drug¹ nogê, znajdŸ dobre oparcie i przenieœ ca³y ciê¿ar cia³a na pierwsz¹ nogê.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//Do wiêkszoœci stworzeñ nie uda ci siê podejœæ, chyba ¿e œpi¹. Zwierzêta po prostu ciê wyczuj¹.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//A wiêc zawsze zwracaj uwagê, sk¹d wieje wiatr.
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
	description = "Chcia³bym lepiej strzelaæ z ³uku.";
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
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//Chcia³bym lepiej strzelaæ z ³uku.
	AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//W porz¹dku, zobaczymy, czy uda mi siê ciebie czegoœ nauczyæ...
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
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//Teraz powinieneœ poszukaæ kogoœ, kto zna siê na tym lepiej ni¿ ja.
	}
	else if(BOSPER_MERKEBOW < other.hitchance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//W porz¹dku, twoja celnoœæ ju¿ siê poprawi³a.
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
	description = "Czemu nie pójdziemy na polowanie razem?";
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
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//Czemu nie pójdziemy na polowanie razem?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//Hmmm. We dwóch jest bezpieczniej, to prawda...
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//A wiêc znasz siê trochê na polowaniu?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//To znaczy, umiesz zdejmowaæ skórê ze zwierzêcia?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == TRUE)
	{
		if(BARTOK_LATER == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//Masz 50 sztuk z³ota?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Tak.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//Dobra, ale chcê zobaczyæ 50 sztuk z³ota. Za to bêdziesz móg³ zatrzymaæ skóry i sprzedaæ je Bosperowi.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//Uczciwy uk³ad, no nie?
		};
		Info_ClearChoices(dia_bartok_zusammen);
		Info_AddChoice(dia_bartok_zusammen,"Na razie...",dia_bartok_zusammen_later);
		Info_AddChoice(dia_bartok_zusammen,"Proszê bardzo...",dia_bartok_zusammen_pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//Nie.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//W takim razie to nie ma sensu.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//Wróæ, jak siê czegoœ nauczysz.
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
		AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//Proszê bardzo...
		BARTOK_BEREIT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//Nie masz z³ota.
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
	description = "ChodŸmy na polowanie!";
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
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//ChodŸmy na polowanie!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//W porz¹dku, idŸ za mn¹. Za po³udniow¹ bram¹ zaczyna siê las. Tam znajdziemy du¿o zwierz¹t.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//Pewnie wiêcej, ni¿ byœmy chcieli...
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
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//No i jak myœlisz, powinniœmy iœæ dalej w las, czy nie?
	Info_ClearChoices(dia_bartok_imwald);
	Info_AddChoice(dia_bartok_imwald,"Wracajmy!",dia_bartok_imwald_nachhause);
	Info_AddChoice(dia_bartok_imwald,"ChodŸmy dalej.",dia_bartok_imwald_weiter);
};

func void dia_bartok_imwald_nachhause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//Wracajmy!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//To mi siê podoba. Pewnie wleŸlibyœmy prosto w uœcisk jakiegoœ orka.
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

func void dia_bartok_imwald_weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//ChodŸmy dalej.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//W porz¹dku. Miejmy nadziejê, ¿e jakoœ to bêdzie...
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
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//Doœæ tego! Wracam do miasta.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//Tutaj jest zbyt niebezpiecznie jak dla mnie - nawet we dwóch.
	if(BARTOK_ORKSTILLTHERE == TRUE)
	{
		b_bartok_shitanorc();
		BARTOK_ORKGESAGT = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//No to na razie!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//Mo¿esz sprzedaæ te skóry Bosperowi.
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
	description = "Wszystko w porz¹dku?";
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
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//Wszystko w porz¹dku?
	if(BARTOK_ENDE == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//Tak. Ale ju¿ nie wychodzê z miasta. Przynajmniej w najbli¿szym czasie.
		if(BARTOK_ORKGESAGT == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//Ci¹gle mi dr¿¹ kolana, jak sobie przypomnê tego orka.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Jasne. Upolujmy kilka bestii!
	};
};

