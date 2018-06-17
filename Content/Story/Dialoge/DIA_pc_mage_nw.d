
instance DIA_MILTENNW_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_exit_condition;
	information = dia_miltennw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap3_exit_condition;
	information = dia_miltennw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_HELLO(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_hello_condition;
	information = dia_miltennw_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltennw_kap3_hello_condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_hello_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//A¿ trudno w to uwierzyæ... Naprawdê jesteœ teraz paladynem?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//Jak widzisz...
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//Ho, ho! Maj¹c kogoœ takiego po swojej stronie, nie musimy siê ju¿ chyba obawiaæ armii Beliara!
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//Ktoœ, kto rozprawi³ siê ze Œni¹cym, nie bêdzie mia³ k³opotów z byle garstk¹ orków.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//Orkowie to najmniejsze z naszych zmartwieñ.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//Tak, wiem... ale dobrze ciê mieæ po naszej stronie.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//W porz¹dku.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//Co robisz w klasztorze? Czekaj, niech zgadnê. Chcesz pobieraæ nauki od Magów Ognia?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//Byæ mo¿e.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//Wiedzia³em! Najlepiej porozmawiaj z Mardukiem. To on zajmuje siê zwykle paladynami. Znajdziesz go przed kaplic¹.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//Widzê, ¿e plotki nie k³ama³y.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//Jakie plotki?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//Te, wedle których do³¹czy³eœ do ³owców smoków.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//Có¿, chêtniej bym ciê widzia³ w stroju maga lub paladyna, ale przynajmniej walczysz po naszej stronie.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//To wszystko, co masz mi do powiedzenia?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//Oczywiœcie cieszê siê, ¿e ciê widzê. S¹dz¹c po twoim wygl¹dzie, orkowie powinni ju¿ zacz¹æ siê baæ.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//Orkowie s¹ teraz najmniejszym z naszych zmartwieñ.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//Wiem, ale mimo wszystko s¹ groŸni. A ty...
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//Ty pokona³eœ Œni¹cego. Twoja pomoc bêdzie nieoceniona.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//W porz¹dku.
	};
};


instance DIA_MILTENNW_MONASTERY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_monastery_condition;
	information = dia_miltennw_monastery_info;
	permanent = FALSE;
	description = "Jakim cudem uda³o ci siê tak szybko dostaæ do klasztoru?";
};


func int dia_miltennw_monastery_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_monastery_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//Jakim cudem uda³o ci siê tak szybko dostaæ do klasztoru?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//G³upie pytanie! Przeœlizgn¹³em siê przez prze³êcz i uda³em siê wprost do klasztoru.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//Ominiêcie niektórych z pilnuj¹cych prze³êczy bestii nie by³o proste, ale koniec koñców, posz³o mi ³atwiej, ni¿ siê spodziewa³em.
};


instance DIA_MILTENNW_FOURFRIENDS(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_fourfriends_condition;
	information = dia_miltennw_fourfriends_info;
	permanent = FALSE;
	description = "Wiesz mo¿e, gdzie s¹ pozostali?";
};


func int dia_miltennw_fourfriends_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_fourfriends_info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//Wiesz mo¿e, gdzie s¹ pozostali?
	if(Npc_IsDead(pc_fighter_nw_vor_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//Gorn ca³kiem nieŸle zniós³ pobyt w wiêzieniu Garonda.
		if(MIS_RESCUEGORN != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//Jak uda³o mu siê z niego wydostaæ?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//Musia³em trochê ok³amaæ Garonda i w koñcu wycofa³ wszystkie oskar¿enia.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//Tylko niech to bêdzie nasza tajemnica, jasne?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//W ka¿dym razie - zamierza³ zajrzeæ do Lee i dowiedzieæ siê, co s³ychaæ na farmie.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//Jak go znam, odbija sobie teraz z nawi¹zk¹ d³ugie dni postu w wiêzieniu. Za³o¿ê siê, ¿e nieŸle ju¿ spustoszy³ spi¿arniê najemników.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//Gornowi niestety siê nie uda³o.
	};
	if(Npc_IsDead(pc_thief_nw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//Diego mamrota³ coœ o wyrównaniu rachunków, ale nie wiem, o co mu chodzi³o.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//Podejrzewam, ¿e wróci³ do miasta. Znasz go przecie¿ - zawsze szuka okazji do zarobku.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//Diego nie mia³ tyle szczêœcia. Pozosta³ wiêŸniem Bariery.
	};
};


instance DIA_MILTENNW_KAP3_ENTRY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 32;
	condition = dia_miltennw_kap3_entry_condition;
	information = dia_miltennw_kap3_entry_info;
	permanent = TRUE;
	description = "Muszê siê dostaæ do klasztoru. To bardzo pilne!";
};


func int dia_miltennw_kap3_entry_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF) && (MILTENNW_GIVESMONASTERYKEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_entry_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//Muszê siê dostaæ do klasztoru. To bardzo pilne!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//W porz¹dku. Masz tu klucz.
		CreateInvItems(self,itke_innos_mis,1);
		b_giveinvitems(self,other,itke_innos_mis,1);
		MILTENNW_GIVESMONASTERYKEY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//Nie mogê ciê wpuœciæ do klasztoru! Narazi³bym siê Najwy¿szej Radzie.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//Bez upowa¿nienia moich zwierzchników nie mogê ciê wpuœciæ do klasztoru.
		Info_ClearChoices(dia_miltennw_kap3_entry);
		Info_AddChoice(dia_miltennw_kap3_entry,DIALOG_BACK,dia_miltennw_kap3_entry_back);
		Info_AddChoice(dia_miltennw_kap3_entry,"To bardzo wa¿ne!",dia_miltennw_kap3_entry_important);
		if(Npc_HasItems(other,itwr_permissiontowearinnoseye_mis) >= 1)
		{
			Info_AddChoice(dia_miltennw_kap3_entry,"Mam tu list od Lorda Hagena.",dia_miltennw_kap3_entry_permit);
		};
	};
};

func void dia_miltennw_kap3_entry_back()
{
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//To bardzo wa¿ne!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//Przykro mi. Pyrokar urwa³by mi g³owê.
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//Mam tu list od Lorda Hagena.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//Poka¿.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//No dobrze. Masz tu klucz do klasztoru. Pyrokara znajdziesz w œwi¹tyni.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,other,itke_innos_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MILTENNW_GIVESMONASTERYKEY = TRUE;
	Info_ClearChoices(dia_miltennw_kap3_entry);
};


instance DIA_MILTENNW_KAP3_NOVIZENCHASE(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_novizenchase_condition;
	information = dia_miltennw_kap3_novizenchase_info;
	permanent = FALSE;
	description = "Wiesz mo¿e, dok¹d uciek³ Pedro?";
};


func int dia_miltennw_kap3_novizenchase_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_novizenchase_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//Wiesz mo¿e, dok¹d uciek³ Pedro?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//A myœlisz, ¿e sta³bym tutaj, gdybym wiedzia³, gdzie ukry³a siê ta szuja?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//Zobaczysz, zap³aci za to œwiêtokradztwo! Mam tylko nadziejê, ¿e zdo³amy odzyskaæ Oko!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//Musisz nam pomóc. ZnajdŸ go i odzyskaj œwiête Oko Innosa!
};


instance DIA_MILTENNW_KAP3_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 39;
	condition = dia_miltennw_kap3_perm_condition;
	information = dia_miltennw_kap3_perm_info;
	permanent = FALSE;
	description = "Mo¿esz mi coœ powiedzieæ o tych zakapturzonych postaciach?";
};


func int dia_miltennw_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//Mo¿esz mi coœ powiedzieæ o tych zakapturzonych postaciach?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//Niestety, nie. Ale mam co do nich bardzo z³e przeczucia.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//Lepiej nie wchodŸ im w drogê.
};


instance DIA_MILTENNW_KAP4_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap4_exit_condition;
	information = dia_miltennw_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP4_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 49;
	condition = dia_miltennw_kap4_perm_condition;
	information = dia_miltennw_kap4_perm_info;
	permanent = TRUE;
	description = "Jakieœ wieœci?";
};


func int dia_miltennw_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//Coœ nowego?
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//To ja powinienem o to zapytaæ. Wszyscy tutaj nadal siê niepokoj¹.
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//Najwy¿sza Rada próbuje przewidzieæ kolejny ruch nieprzyjaciela.
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//Coœ jeszcze?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//Ostatnio du¿o s³yszy siê o atakach orków, nawet poza Górnicz¹ Dolin¹.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//Nie podoba mi siê to wszystko. Bojê siê, ¿e zosta³o nam ju¿ bardzo niewiele czasu.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//Pewien wieœniak widzia³ ko³o swojej zagrody jakieœ ³uskowate istoty.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//Nie wiem ju¿, co o tym wszystkim s¹dziæ. Wróg przygotowuje siê do kolejnego uderzenia, to pewne.
	}
	else if(MIS_FINDTHEOBESESSED == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//Docieraj¹ do nas wieœci o kolejnych opêtanych ludziach. Nieprzyjaciel roœnie w si³ê o wiele szybciej, ni¿ siê tego spodziewa³em.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//Sytuacja nadal jest bardzo powa¿na. Ca³a nadzieja w Innosie.
	};
};


instance DIA_MILTENNW_KAP5_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap5_exit_condition;
	information = dia_miltennw_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_miltennw_alldragonsdead_condition;
	information = dia_miltennw_alldragonsdead_info;
	permanent = FALSE;
	description = "Zabi³em wszystkie smoki.";
};


func int dia_miltennw_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//Zabi³em wszystkie smoki.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//Naprawdê?! A wiêc znowu zap³onê³a dla nas iskierka nadziei. Teraz musimy tylko uderzyæ w samo serce Z³a.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//Jeœli uda³o ci siê tego dokonaæ, zwyciêstwo bêdzie nasze.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//Kto? Ja?!
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//Naturalnie! A kto inny?
	if(MILTENNW_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//Nie mamy czasu do stracenia. Ka¿da chwila jest na wagê z³ota.
	};
};


instance DIA_MILTENNW_SCWASINLIB(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_scwasinlib_condition;
	information = dia_miltennw_scwasinlib_info;
	important = TRUE;
};


func int dia_miltennw_scwasinlib_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_scwasinlib_info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//Podobno spêdzi³eœ sporo czasu w klasztornych podziemiach. Dowiedzia³eœ siê czegoœ nowego?
};


instance DIA_MILTENNW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_knowwhereenemy_condition;
	information = dia_miltennw_knowwhereenemy_info;
	permanent = TRUE;
	description = "Wiem ju¿, gdzie kryje siê nieprzyjaciel!";
};


func int dia_miltennw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MILTENNW_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};


var int sctoldmiltenheknowwhereenemy;

func void dia_miltennw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//Wiem ju¿, gdzie kryje siê nieprzyjaciel! Jest ca³kiem niedaleko st¹d.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//Zatem musimy czym prêdzej wyruszyæ w drogê. To mo¿e byæ nasza jedyna szansa!
	SCTOLDMILTENHEKNOWWHEREENEMY = TRUE;
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	if(Npc_IsDead(diegonw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//A co Diego s¹dzi na ten temat? Myœlê, ¿e chêtnie bêdzie ci towarzyszyæ.
		b_logentry(TOPIC_CREW,"Diego móg³by byæ bardzo pomocny. Nigdy nie potrafi³ wytrzymaæ d³ugo w jednym miejscu.");
	};
	if(Npc_IsDead(gornnw_nach_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//Co z Gornem? Podobno wróci³ z Górniczej Doliny. Koniecznie z nim porozmawiaj.
		b_logentry(TOPIC_CREW,"Gorn móg³by byæ bardzo pomocny. Zawsze dobrze jest mieæ u swego boku doskona³ego wojownika. Mo¿e zgodzi siê mnie szkoliæ.");
	};
	if(Npc_IsDead(lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//I nie zapomnij o Lesterze! Gdybyœ nie wyci¹gn¹³ go z tej doliny, by³oby po nim.
		b_logentry(TOPIC_CREW,"Jeœli nie wezmê ze sob¹ Lestera, prawdopodobnie nigdy nie wydostanie siê z doliny.");
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//Ja te¿ mam pewn¹ rolê do odegrania w tej sprawie. Mogê ci pomóc w zwiêkszeniu twojej many oraz przy sporz¹dzaniu nowych run. Kiedy ruszamy?
	b_logentry(TOPIC_CREW,"Jeœli zabiorê ze sob¹ Miltena, nauczy mnie, jak tworzyæ runy i zwiêkszaæ moc magiczn¹.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//Powoli, przyjacielu. Chwilowo mam ju¿ pe³n¹ za³ogê.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//Zawsze mo¿esz na mnie liczyæ. Gdybyœ zmieni³ zdanie, wiesz, gdzie mnie szukaæ.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//Powodzenia! Niech Innos ma was w swojej opiece!
	}
	else
	{
		Info_ClearChoices(dia_miltennw_knowwhereenemy);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"Chwilowo mi siê nie przydasz.",dia_miltennw_knowwhereenemy_no);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"Witamy na pok³adzie!",dia_miltennw_knowwhereenemy_yes);
	};
};

func void dia_miltennw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//Witamy na pok³adzie!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//Spotykamy siê na przystani. Nie spóŸnij siê!
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//W porz¹dku. Mo¿esz na mnie liczyæ.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};

func void dia_miltennw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//Chwilowo mi siê nie przydasz.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//Wiesz, ¿e zawsze mo¿esz na mnie liczyæ. Gdybyœ zmieni³ zdanie, bêdê tutaj czeka³.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};


instance DIA_MILTENNW_WHERECAPTAIN(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_wherecaptain_condition;
	information = dia_miltennw_wherecaptain_info;
	description = "Gdzie mogê znaleŸæ kapitana statku?";
};


func int dia_miltennw_wherecaptain_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (SCTOLDMILTENHEKNOWWHEREENEMY == TRUE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_wherecaptain_info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//Gdzie mogê znaleŸæ kapitana statku?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//Porozmawiaj z Jorgenem, w koñcu by³ kiedyœ ¿eglarzem. Powinieneœ spotkaæ go w klasztorze.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//Gdyby on nie móg³ ci pomóc, musisz popytaæ w mieœcie, albo nawet na farmach. Z pewnoœci¹ s¹ tu jeszcze jacyœ ¿eglarze.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//Na twoim miejscu porozmawia³bym o tym z Lee albo zajrza³bym na przystañ w Khorinis. To chyba najlepsze wyjœcie.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Jorgen móg³by zostaæ kapitanem mojego statku. Powinienem znaleŸæ go w klasztorze. Poza tym na farmach i w mieœcie musi byæ pe³no potencjalnych kandydatów na to stanowisko. Mo¿e powinienem zapytaæ Lee albo rozejrzeæ siê w porcie.");
};


instance DIA_MILTENNW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_leavemyship_condition;
	information = dia_miltennw_leavemyship_info;
	permanent = TRUE;
	description = "Obawiam siê, ¿e jednak nie mo¿esz ze mn¹ pop³yn¹æ.";
};


func int dia_miltennw_leavemyship_condition()
{
	if((MILTENNW_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_leavemyship_info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//Obawiam siê, ¿e jednak nie mo¿esz ze mn¹ pop³yn¹æ.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//Trudno. Wiesz najlepiej, kto ci siê przyda, a kto nie. Gdybyœ zmieni³ zdanie, znajdziesz mnie w klasztorze.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MILTENNW_STILLNEEDYOU(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_stillneedyou_condition;
	information = dia_miltennw_stillneedyou_info;
	permanent = TRUE;
	description = "Potrzebujê twojej pomocy.";
};


func int dia_miltennw_stillneedyou_condition()
{
	if(((MILTENNW_ISONBOARD == LOG_OBSOLETE) || (MILTENNW_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_miltennw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//Potrzebujê twojej pomocy.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//Czujê siê zaszczycony. ChodŸmy wiêc! Nie mamy czasu do stracenia.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//Spotkamy siê wiêc na przystani.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_TEACH(C_INFO)
{
	npc = pc_mage_nw;
	nr = 90;
	condition = dia_miltennw_teach_condition;
	information = dia_miltennw_teach_info;
	permanent = TRUE;
	description = "Chcê siê nauczyæ nowych zaklêæ.";
};


func int dia_miltennw_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_teach_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//Chcê siê nauczyæ nowych zaklêæ.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltennw_teach);
		Info_AddChoice(dia_miltennw_teach,DIALOG_BACK,dia_miltennw_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_miltennw_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_miltennw_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_miltennw_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//Nie pozna³eœ jeszcze drugiego krêgu magii! Nie mogê ciê niczego nauczyæ.
	};
};

func void dia_miltennw_teach_back()
{
	Info_ClearChoices(dia_miltennw_teach);
};

func void dia_miltennw_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltennw_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltennw_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENNW_MANA(C_INFO)
{
	npc = pc_mage_nw;
	nr = 100;
	condition = dia_miltennw_mana_condition;
	information = dia_miltennw_mana_info;
	permanent = TRUE;
	description = "Chcê zwiêkszyæ moj¹ magiczn¹ moc.";
};


func int dia_miltennw_mana_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_mana_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//Chcê zwiêkszyæ moj¹ magiczn¹ moc.
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//Twoja magiczna moc i tak jest ogromna. Obawiam siê, ¿e nie mogê ci pomóc.
	};
	Info_ClearChoices(dia_miltennw_mana);
};

func void dia_miltennw_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};


instance DIA_MAGE_NW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_mage_nw_pickpocket_condition;
	information = dia_mage_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_nw_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_mage_nw_pickpocket_info()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_BACK,dia_mage_nw_pickpocket_back);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_PICKPOCKET,dia_mage_nw_pickpocket_doit);
};

func void dia_mage_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

func void dia_mage_nw_pickpocket_back()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

