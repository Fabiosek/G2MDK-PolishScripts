
instance DIA_CASSIA_EXIT(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 999;
	condition = dia_cassia_exit_condition;
	information = dia_cassia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cassia_exit_condition()
{
	return TRUE;
};

func void dia_cassia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_PICKME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 900;
	condition = dia_cassia_pickme_condition;
	information = dia_cassia_pickme_info;
	permanent = TRUE;
	description = PICKPOCKET_100_FEMALE;
};


func int dia_cassia_pickme_condition()
{
	return c_beklauen(100,400);
};

func void dia_cassia_pickme_info()
{
	Info_ClearChoices(dia_cassia_pickme);
	Info_AddChoice(dia_cassia_pickme,DIALOG_BACK,dia_cassia_pickme_back);
	Info_AddChoice(dia_cassia_pickme,DIALOG_PICKPOCKET,dia_cassia_pickme_doit);
};

func void dia_cassia_pickme_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cassia_pickme);
};

func void dia_cassia_pickme_back()
{
	Info_ClearChoices(dia_cassia_pickme);
};


instance DIA_CASSIA_GILDE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_gilde_condition;
	information = dia_cassia_gilde_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_gilde_condition()
{
	if((CASSIA_GILDENCHECK == TRUE) && (JOIN_THIEFS == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_cassia_gilde_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//Widzê, ¿e sta³eœ siê wojownikiem prawa i porz¹dku.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//To ¿e s³u¿ysz Innosowi, nie ma znaczenia. Jesteœ jednym z nas. Mam nadziejê, ¿e ty te¿ tak to postrzegasz.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//Nale¿ysz teraz do koœcio³a Innosa, ale wci¹¿ jesteœ jednym z nas - mam nadziejê, ¿e o tym nie zapomnisz.
	};
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_ABGELAUFEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgelaufen_condition;
	information = dia_cassia_abgelaufen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_abgelaufen_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CASSIA_FRIST == TRUE) && (CASSIA_DAY < (b_getdayplus() - 2)))
	{
		return TRUE;
	};
};

func void dia_cassia_abgelaufen_info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//Termin min¹³. Trzeba by³o nie wracaæ.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_CASSIA_NEWS(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_news_condition;
	information = dia_cassia_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_news_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//Widzê, ¿e dosta³eœ nasz prezent. Jestem Cassia.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//W porz¹dku, powiedz mi, dlaczego tu jestem?
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//Przyci¹gn¹³eœ nasz¹ uwagê, zdobywaj¹c zaufanie naszych przyjació³.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//Chcemy ci coœ zaproponowaæ. Mo¿esz do nas do³¹czyæ.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//Popatrzcie tylko, kto znalaz³ do nas drogê. Atylla ciê nie doceni³. Ja nie pope³niê tego b³êdu.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//Co siê tu dzieje?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//Chcieliœmy twojej œmierci za to, ¿e donios³eœ na jednego z naszych przyjació³. Dlatego wys³aliœmy Atyllê.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//Jednak twoja obecnoœæ tutaj otwiera now¹ mo¿liwoœæ...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//...co chcesz mi zaproponowaæ?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//Mo¿esz do nas do³¹czyæ.
	};
	if((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		CASSIA_GILDENCHECK = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_CASSIA_MEHR(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_mehr_condition;
	information = dia_cassia_mehr_info;
	permanent = FALSE;
	description = "Opowiedz mi wiêcej o waszej organizacji.";
};


func int dia_cassia_mehr_condition()
{
	return TRUE;
};

func void dia_cassia_mehr_info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//Opowiedz mi wiêcej o waszej organizacji.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//Ludzie w mieœcie boj¹ siê nas, ale nikt nie zna naszej kryjówki.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//Ta garstka ludzi, która wie o istnieniu kana³ów, jest przekonana, ¿e s¹ zamkniête i nikt nie ma do nich dostêpu.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//Tak d³ugo jak nas nie znajd¹, mo¿emy spokojnie pracowaæ.
};


instance DIA_CASSIA_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_missingpeople_condition;
	information = dia_cassia_missingpeople_info;
	permanent = FALSE;
	description = "Mo¿esz mi coœ powiedzieæ o zaginionych mieszkañcach miasta?";
};


func int dia_cassia_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_00");	//Mo¿esz mi coœ powiedzieæ o zaginionych mieszkañcach miasta?
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_01");	//Czemu niby chcesz siê o tym czegoœ dowiedzieæ?
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_02");	//Interesuje mnie ich los.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_03");	//Opuszczaj¹c kana³, pop³yñ w prawo wzd³u¿ wybrze¿a.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_04");	//Tam znajdziesz odpowiedzi na swoje pytania.
};


instance DIA_CASSIA_VORTEIL(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_vorteil_condition;
	information = dia_cassia_vorteil_info;
	permanent = FALSE;
	description = "Jeœli do was do³¹czê, to co bêdê z tego mia³?";
};


func int dia_cassia_vorteil_condition()
{
	return TRUE;
};

func void dia_cassia_vorteil_info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//Jeœli do was do³¹czê, to co bêdê z tego mia³?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//Mo¿esz siê od nas nauczyæ specjalnych zdolnoœci, które pozwol¹ ci ¿yæ w luksusie.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//Ale nie bêdê musia³ ukrywaæ siê tutaj na dole, prawda?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//Nie. Musisz jedynie przestrzegaæ naszych zasad. To wszystko.
};


instance DIA_CASSIA_LERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 4;
	condition = dia_cassia_lernen_condition;
	information = dia_cassia_lernen_info;
	permanent = FALSE;
	description = "Czego mogê siê od was nauczyæ?";
};


func int dia_cassia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_lernen_info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//Czego mogê siê od was nauczyæ?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//Jesper jest mistrzem skradania i ukrywania siê. Poka¿e ci, jak siê bezszelestnie poruszaæ.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//Ramirez jest wyj¹tkowo zdolnym w³amywaczem. ¯aden zamek nie oprze siê jego wytrychom.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//A ja mogê nauczyæ ciê kradzie¿y kieszonkowej.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//Pomogê ci tak¿e staæ siê zrêczniejszym. To podstawa twoich zdolnoœci.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Cassia mo¿e nauczyæ mnie kradzie¿y kieszonkowej. Mo¿e mi równie¿ pokazaæ, jak staæ siê zrêczniejszym.");
	b_logentry(TOPIC_CITYTEACHER,"Ramirez mo¿e mnie nauczyæ, jak otwieraæ zamki.");
	b_logentry(TOPIC_CITYTEACHER,"Jesper mo¿e mnie nauczyæ, jak siê skradaæ.");
};


instance DIA_CASSIA_REGELN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_regeln_condition;
	information = dia_cassia_regeln_info;
	permanent = FALSE;
	description = "Jakie s¹ wasze zasady?";
};


func int dia_cassia_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_regeln_info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//Jakie s¹ wasze zasady?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//Zasada pierwsza: ani s³owa o nas. Nikomu. Nigdy.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Druga: nie daj siê z³apaæ.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Trzecia: je¿eli wyci¹gniesz tu broñ, ¿eby kogoœ zaatakowaæ, zabijemy ciê.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//I czwarta, ostatnia zasada: ci, którzy chc¹ do nas do³¹czyæ, musz¹ udowodniæ swoj¹ wartoœæ.
};


instance DIA_CASSIA_ERWISCHEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_erwischen_condition;
	information = dia_cassia_erwischen_info;
	permanent = FALSE;
	description = "Co siê stanie, jak mnie z³api¹?";
};


func int dia_cassia_erwischen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_erwischen_info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//Co siê stanie, jak mnie z³api¹?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//Po prostu nie daj siê z³apaæ, dobra?
};


instance DIA_CASSIA_BEWEISEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_beweisen_condition;
	information = dia_cassia_beweisen_info;
	permanent = TRUE;
	description = "Jak mam dowieœæ swojej wartoœci?";
};


var int dia_cassia_beweisen_permanent;

func int dia_cassia_beweisen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln) && (DIA_CASSIA_BEWEISEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_beweisen_info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//Jak mam dowieœæ swojej wartoœci?
	if(JOIN_THIEFS == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//Do³¹czysz do nas czy nie?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//Ten uparty stary alchemik - Constantino - ma piêkny pierœcieñ.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//Nie jest mu on potrzebny. Chcê, by przyozdobi³ moj¹ d³oñ.
		MIS_CASSIARING = LOG_RUNNING;
		DIA_CASSIA_BEWEISEN_PERMANENT = TRUE;
		Log_CreateTopic(TOPIC_CASSIARING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIARING,LOG_RUNNING);
		b_logentry(TOPIC_CASSIARING,"Cassia chce, abym przyniós³ jej pierœcieñ Constantina.");
	};
};


instance DIA_CASSIA_BEITRETEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_beitreten_condition;
	information = dia_cassia_beitreten_info;
	permanent = FALSE;
	description = "Dobra, niech bêdzie.";
};


func int dia_cassia_beitreten_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_beitreten_info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//Dobra, wchodzê w to.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//Œwietnie. Bêdziesz mia³ okazjê dowieœæ swej wartoœci. Jeœli chcesz siê od nas uczyæ, to nie widzê ku temu ¿adnych przeszkód.
	JOIN_THIEFS = TRUE;
};


instance DIA_CASSIA_ABLEHNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 9;
	condition = dia_cassia_ablehnen_condition;
	information = dia_cassia_ablehnen_info;
	permanent = FALSE;
	description = "A co jeœli nie chcê do was do³¹czyæ...?";
};


func int dia_cassia_ablehnen_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_ablehnen_info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//A co jeœli nie chcê do was do³¹czyæ...?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//Tracisz jedyn¹ w swoim rodzaju szansê, ale mo¿esz odejœæ.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//I nawet nie myœl o zdradzie. Gorzko byœ tego po¿a³owa³.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"Dobra, niech bêdzie.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"Muszê siê nad tym zastanowiæ.",dia_cassia_ablehnen_frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//W takim razie zabijê ciê.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"Dobra, niech bêdzie.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"W takim razie spróbuj mnie zabiæ.",dia_cassia_ablehnen_kill);
	};
};

func void dia_cassia_ablehnen_okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//Dobra, niech bêdzie.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//Podj¹³eœ m¹dr¹ decyzjê. Je¿eli uda ci siê dowieœæ swojej wartoœci, bêdziesz móg³ wst¹piæ w nasze szeregi.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_02");	//Je¿eli chcesz wczeœniej opanowaæ umiejêtnoœci z³odziejskie, to nie krêpuj siê - na pewno ci siê przydadz¹.
	JOIN_THIEFS = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};

func void dia_cassia_ablehnen_kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//W takim razie spróbuj mnie zabiæ.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//Szkoda. Myœla³am, ¿e jesteœ m¹drzejszy.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_cassia_ablehnen_frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//Muszê siê nad tym zastanowiæ.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//Zrób tak. Dajê ci dwa dni na podjêcie decyzji. Potem nie bêdziesz tu mile widziany.
	CASSIA_DAY = b_getdayplus();
	CASSIA_FRIST = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};


instance DIA_CASSIA_BEVORLERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 5;
	condition = dia_cassia_bevorlernen_condition;
	information = dia_cassia_bevorlernen_info;
	permanent = TRUE;
	description = "Mo¿esz mnie przeszkoliæ?";
};


func int dia_cassia_bevorlernen_condition()
{
	if((JOIN_THIEFS == TRUE) && Npc_KnowsInfo(other,dia_cassia_lernen) && ((CASSIA_TEACHPICKPOCKET == FALSE) || (CASSIA_TEACHDEX == FALSE)))
	{
		return TRUE;
	};
};

func void dia_cassia_bevorlernen_info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");	//Mo¿esz mnie przeszkoliæ?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_01");	//Pewnie, nie ma problemu. Daj mi tylko znaæ, jak bêdziesz gotów.
		CASSIA_TEACHPICKPOCKET = TRUE;
		CASSIA_TEACHDEX = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_02");	//Pewnie. Szkolenie w zakresie kradzie¿y kieszonkowej i zrêcznoœci bêdzie ciê kosztowaæ 100 sztuk z³ota ka¿de.
		Info_ClearChoices(dia_cassia_bevorlernen);
		Info_AddChoice(dia_cassia_bevorlernen,"Mo¿e póŸniej... (POWRÓT)",dia_cassia_bevorlernen_spaeter);
		if(CASSIA_TEACHPICKPOCKET == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"Chcê poznaæ zasady kradzie¿y kieszonkowej (zap³aæ 100 sztuk z³ota).",dia_cassia_bevorlernen_pickpocket);
		};
		if(CASSIA_TEACHDEX == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"Chcê siê staæ zrêczniejszy (zap³aæ 100 sztuk z³ota).",dia_cassia_bevorlernen_dex);
		};
	};
};

func void dia_cassia_bevorlernen_spaeter()
{
	Info_ClearChoices(dia_cassia_bevorlernen);
};

func void dia_cassia_bevorlernen_dex()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_DEX_15_00");	//Chcê byæ zrêczniejszy. Tu masz z³oto.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_DEX_16_01");	//Mo¿emy zacz¹æ, jak tylko bêdziesz gotowy.
		CASSIA_TEACHDEX = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");	//Wróæ, jak bêdziesz mia³ z³oto.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};

func void dia_cassia_bevorlernen_pickpocket()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_Pickpocket_15_00");	//Chcê siê nauczyæ kradzie¿y kieszonkowej. Oto z³oto.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_01");	//Mo¿emy zacz¹æ, jak tylko bêdziesz gotowy.
		CASSIA_TEACHPICKPOCKET = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_02");	//Wróæ, jak bêdziesz mia³ z³oto.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};


instance DIA_CASSIA_TEACH(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 12;
	condition = dia_cassia_teach_condition;
	information = dia_cassia_teach_info;
	permanent = TRUE;
	description = "Chcê byæ zrêczniejszy.";
};


func int dia_cassia_teach_condition()
{
	if(CASSIA_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_cassia_teach_info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//Chcê byæ zrêczniejszy.
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_back()
{
	Info_ClearChoices(dia_cassia_teach);
};

func void dia_cassia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};


instance DIA_CASSIA_PICKPOCKET(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_pickpocket_condition;
	information = dia_cassia_pickpocket_info;
	permanent = TRUE;
	description = "Poka¿ mi, jak okradaæ innych (10 punktów nauki).";
};


func int dia_cassia_pickpocket_condition()
{
	if((CASSIA_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_pickpocket_info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//Poka¿ mi, jak opró¿niæ czyjeœ kieszenie.
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//Je¿eli chcesz opró¿niæ czyjeœ kieszenie, musisz odci¹gn¹æ uwagê ofiary. Zacznij z ni¹ gawêdziæ.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//Podczas rozmowy postaraj siê oceniæ, z kim masz do czynienia. Zwróæ uwagê na wypchane kieszenie albo bi¿uteriê. Ale przede wszystkim oceñ, jak czujny jest klient.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//Pamiêtaj, ¿e okradanie pijanego robotnika to nie to samo co skubanie czujnego kupca.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//Jak bêdziesz niezgrabny, to klient siê skapuje. Tak wiêc musisz byæ opanowany.
	};
};


instance DIA_CASSIA_AUFNAHME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_aufnahme_condition;
	information = dia_cassia_aufnahme_info;
	permanent = FALSE;
	description = "Mam pierœcieñ Constantina.";
};


func int dia_cassia_aufnahme_condition()
{
	if((MIS_CASSIARING == LOG_RUNNING) && (Npc_HasItems(other,itri_prot_point_01_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_cassia_aufnahme_info()
{
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//Mam pierœcieñ Constantina.
	b_giveinvitems(other,self,itri_prot_point_01_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//Gratulacje. Przeszed³eœ inicjacjê. Teraz jesteœ jednym z nas.
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//WeŸ ten klucz. Otwiera drzwi do gospody. Nie bêdziesz musia³ taplaæ siê w wodzie za ka¿dym razem.
	b_giveinvitems(self,other,itke_thiefguildkey_hotel_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//Co wiêcej, musisz wiedzieæ, ¿e mamy tajny znak. Charakterystyczne kiwniêcie g³ow¹.
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//W³aœnie tak. Kiedy bêdziesz z kimœ rozmawiaæ i zrobisz ten znak, jasne bêdzie, ¿e jesteœ jednym z nas.
	MIS_CASSIARING = LOG_SUCCESS;
	b_giveplayerxp(XP_CASSIARING);
	KNOWS_SECRETSIGN = TRUE;
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"Zosta³em przyjêty do gildii z³odziei.");
	b_logentry(TOPIC_DIEBESGILDE,"Pozna³em tajny znak z³odziei. Jeœli poka¿ê go innemu z³odziejowi, bêdzie wiedzia³, ¿e ja równie¿ jestem cz³onkiem gildii.");
};


instance DIA_CASSIA_VERSTECK(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_versteck_condition;
	information = dia_cassia_versteck_info;
	permanent = FALSE;
	description = "Gdzie ukrywacie swoje ³upy?";
};


func int dia_cassia_versteck_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_ramirez_beute))
	{
		return TRUE;
	};
};

func void dia_cassia_versteck_info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//Gdzie ukrywacie swoje ³upy?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//Daj spokój, nie myœla³eœ chyba, ¿e ci to powiem?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//Bêdziesz mia³ doœæ okazji, ¿eby po³o¿yæ ³apki na maj¹tku innych ludzi - zbyt chciwi koñcz¹ z pustymi rêkami.
};


instance DIA_CASSIA_BLUTKELCHE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_blutkelche_condition;
	information = dia_cassia_blutkelche_info;
	permanent = FALSE;
	description = "Masz dla mnie jak¹œ robotê?";
};


func int dia_cassia_blutkelche_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (MIS_CASSIAKELCHE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cassia_blutkelche_info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//Masz dla mnie jak¹œ robotê?
	if(PETZCOUNTER_CITY_THEFT > 0)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_01");	//Nie, jeœli w mieœcie jesteœ œcigany za kradzie¿e.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_02");	//Za³atw to - zap³aæ grzywnê albo pozb¹dŸ siê œwiadków. Nie obchodzi mnie jak, ale masz to zrobiæ.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//Tak. Jest zestaw kielichów - szeœciu.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//Król Rhobar zdoby³ je podczas jednej z kampanii - ale poœwiêci³ wtedy wielu ludzi. Dlatego s¹ nazywane Krwawymi Kielichami.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//Pojedynczo nie s¹ zbyt cenne - ale razem s¹ warte okr¹g³¹ sumkê.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//Gdzie znajduj¹ siê te kielichy?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//Nale¿¹ do bogatych kupców w górnym mieœcie.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//Przynieœ mi je. Ja tymczasem postaram siê znaleŸæ na nie kupca.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//Co za to dostanê?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//Po³owê zysku albo bêdziesz móg³ wybraæ z mojego ³upu jakiœ specjalny przedmiot.
		MIS_CASSIAKELCHE = LOG_RUNNING;
		Log_CreateTopic(TOPIC_CASSIAKELCHE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIAKELCHE,LOG_RUNNING);
		b_logentry(TOPIC_CASSIAKELCHE,"Cassia chce, abym przyniós³ jej szeœæ Krwawych Kielichów. Wszystkie znajduj¹ siê w mieœcie.");
	};
};


instance DIA_CASSIA_ABGEBEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgeben_condition;
	information = dia_cassia_abgeben_info;
	permanent = TRUE;
	description = "Jeœli chodzi o te Krwawe Kielichy...";
};


func int dia_cassia_abgeben_condition()
{
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cassia_abgeben_info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//Je¿eli chodzi o te Krwawe Kielichy...
	if(b_giveinvitems(other,self,itmi_bloodcup_mis,6))
	{
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//Mam wszystkie szeœæ kielichów.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//Dobra robota. W miêdzyczasie uda³o mi siê znaleŸæ na nie kupca.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//Mo¿esz odebraæ swoj¹ nagrodê. Dziêkujê, ¿e to dla mnie zrobi³eœ.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_04");	//Nie muszê dla ciebie robiæ nic wiêcej - ale w ka¿dej chwili mo¿esz przyjœæ do mnie na naukê. A poza tym na tej wyspie jest doœæ ³upów dla ka¿dego.
		MIS_CASSIAKELCHE = LOG_SUCCESS;
		b_giveplayerxp(XP_CASSIABLUTKELCHE);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//Mogê sprzedaæ te kielichy w komplecie. Przynieœ mi wszystkie szeœæ.
	};
};


instance DIA_CASSIA_BELOHNUNG(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_belohnung_condition;
	information = dia_cassia_belohnung_info;
	permanent = FALSE;
	description = "Przyszed³em odebraæ swoj¹ nagrodê.";
};


func int dia_cassia_belohnung_condition()
{
	if(MIS_CASSIAKELCHE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_cassia_belohnung_info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//Przyszed³em odebraæ swoj¹ nagrodê.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//Co wybierasz?
	Info_ClearChoices(dia_cassia_belohnung);
	Info_AddChoice(dia_cassia_belohnung,"400 sztuk z³ota.",dia_cassia_belohnung_gold);
	Info_AddChoice(dia_cassia_belohnung,"4 eliksiry lecznicze",dia_cassia_belohnung_trank);
	Info_AddChoice(dia_cassia_belohnung,NAME_ADDON_CASSIASBELOHNUNGSRING,dia_cassia_belohnung_ring);
};

func void dia_cassia_belohnung_gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//Daj mi z³oto.
	b_giveinvitems(self,other,itmi_gold,400);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//Daj mi mikstury.
	b_giveinvitems(self,other,itpo_health_03,4);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//Daj mi pierœcieñ.
	b_giveinvitems(self,other,itri_hp_01,1);
	Info_ClearChoices(dia_cassia_belohnung);
};

