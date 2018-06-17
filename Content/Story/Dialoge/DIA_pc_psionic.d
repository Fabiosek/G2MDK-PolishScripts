
instance DIA_LESTER_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_exit_condition;
	information = dia_lester_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lester_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_HELLO(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_hello_condition;
	information = dia_lester_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lester_hello_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lester_hello_info()
{
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,other);
	};
	AI_Output(self,other,"DIA_Lester_Hello_13_00");	//To naprawdê TY? Cz³owieku, jak siê cieszê, ¿e ciê widzê!
	Info_ClearChoices(dia_lester_hello);
	Info_AddChoice(dia_lester_hello,"Czy my siê znamy?",dia_lester_hello_youknowme);
	Info_AddChoice(dia_lester_hello,"Lester! Sk¹d siê tu wzi¹³eœ?",dia_lester_hello_lester);
};

func void dia_lester_hello_lester()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_Lester_15_00");	//Lester! Sk¹d siê tu wzi¹³eœ?
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_01");	//To ci dopiero niez³a historia! Po upadku Bariery przez d³ugi czas b³¹ka³em siê po okolicy, nie wiedz¹c, co ze sob¹ zrobiæ.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_02");	//Przez kolejne kilka dni przedziera³em siê przez lasy, a¿ wreszcie znalaz³em tê kotlinkê.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten i Gorn nadal s¹ w Górniczej Dolinie. Tak mi siê w ka¿dym razie wydaje.
};

func void dia_lester_hello_youknowme()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_YouKnowMe_15_00");	//Czy my siê znamy?
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Halo? Jest tam kto?! Nadstawia³em karku, ¿ebyœ móg³ dostaæ ten swój dziwny kamieñ.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Jesteœ mi coœ winny. To przynajmniej móg³byœ pamiêtaæ!
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_03");	//Pamiêtasz chyba Diego, Miltena i Gorna?
	Info_AddChoice(dia_lester_hello,"Diego, Milten i KTO?",dia_lester_hello_whofourfriends);
	Info_AddChoice(dia_lester_hello,"Jasne. Co siê z nimi dzieje?",dia_lester_hello_knowfourfriends);
};

func void dia_lester_hello_knowfourfriends()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Jasne. Co siê z nimi dzieje?
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Jeœli siê nie mylê, wszyscy trzej prze¿yli upadek Bariery.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Nie mam pojêcia, gdzie siê teraz podziewaj¹. Pewnie s¹ nadal w Górniczej Dolinie.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Gdybyœ ich spotka³, daj mi znaæ.
};

func void dia_lester_hello_whofourfriends()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten i KTO?
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Nie mów mi, ¿e o wszystkim zapomnia³eœ?! Kamienie ogniskuj¹ce? Troll? Kopiec rudy wodnych magów? Nic?!
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Sam ju¿ nie wiem.
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Kiedyœ sobie przypomnisz. Ja te¿ potrzebowa³em trochê czasu, ¿eby dojœæ do siebie.
};


instance DIA_LESTER_WHATHAPPENED(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_whathappened_condition;
	information = dia_lester_whathappened_info;
	permanent = FALSE;
	description = "Co siê sta³o?";
};


func int dia_lester_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_whathappened_info()
{
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_00");	//Co ci siê sta³o?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_01");	//Po upadku Œni¹cego, ca³e Bractwo wpad³o w sza³.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_02");	//Bez swojego pana nie wiedzieli, co maj¹ robiæ dalej.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co z tob¹?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_04");	//Ze mn¹ by³o podobnie. Mia³em koszmary... nawet halucynacje! Ale gdy tylko jako tako doszed³em do siebie, da³em nogê.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_05");	//Raz wydawa³o mi siê nawet, ¿e widzê wielki cieñ rzucaj¹cy siê na grupê uciekinierów i spowijaj¹cy ich w wielkiej chmurze ognia.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_06");	//Przez moment myœla³em, ¿e mam przed sob¹ smoka.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_07");	//Widzia³eœ coœ jeszcze?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_08");	//Nie! Na wszelki wypadek wzi¹³em nogi za pas!
};


instance DIA_LESTER_MINECOLONY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_minecolony_condition;
	information = dia_lester_minecolony_info;
	permanent = FALSE;
	description = "Jak d³ugo siê tutaj ukrywasz?";
};


func int dia_lester_minecolony_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_minecolony_info()
{
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_00");	//Jak d³ugo siê tu ukrywasz?
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_01");	//Nie wiem dok³adnie. Mo¿e tydzieñ. Ale jest jeszcze coœ:
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_02");	//Kiedy tu przyby³em wieczorem, spojrza³em na szczyt tej góry, i by³o tam tylko kilka drzew.
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_03");	//Ale jak siê obudzi³em nastêpnego dnia, sta³a tam wie¿a. Móg³bym przysi¹c, ¿e wczeœniej jej nie by³o! Od tamtej pory nie ruszam siê st¹d na krok.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_04");	//Masz na myœli wie¿ê Xardasa? Wiedzia³em, ¿e jest potê¿ny, ale stworzyæ magicznie tak¹ wie¿ê...
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_05");	//Xardas? Ten nekromanta? To on mieszka w tej wie¿y? Nie wiem, czy mi siê to podoba...
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_06");	//Spokojnie! To on wyci¹gn¹³ mnie ze œwi¹tyni Œni¹cego. Jest po naszej stronie.
};


instance DIA_LESTER_SEND_XARDAS(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_send_xardas_condition;
	information = dia_lester_send_xardas_info;
	permanent = FALSE;
	description = "Musisz porozmawiaæ z Xardasem o tym cieniu...";
};


func int dia_lester_send_xardas_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_whathappened) && Npc_KnowsInfo(other,dia_lester_minecolony) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_send_xardas_info()
{
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_00");	//Musisz porozmawiaæ z Xardasem o tym cieniu. To mo¿e byæ coœ wa¿nego.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_01");	//Myœlisz, ¿e sobie tego nie ubzdura³em? Myœlisz, ¿e naprawdê widzia³em...
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_02");	//...smoka. Tak.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_03");	//Znowu siedzisz w tym wszystkim po uszy, co?
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_04");	//Mo¿e nie a¿ po uszy. W ka¿dym razie - jeszcze nie.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_05");	//Có¿, w porz¹dku. Jeœli to takie wa¿ne, pójdê z nim pogadaæ. Ale jeszcze nie teraz!
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_06");	//Najpierw muszê trochê odpocz¹æ. Ci¹gle jestem wyczerpany po ucieczce z Kolonii.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_07");	//Widzê, ¿e znów coœ kombinujesz. Spotkamy siê u Xardasa.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LESTER_STADT(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_addon_lester_stadt_condition;
	information = dia_addon_lester_stadt_info;
	description = "Zmierzam do Khorinis! Co wiesz o tym mieœcie?";
};


func int dia_addon_lester_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lester_stadt_info()
{
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_00");	//Zmierzam do Khorinis! Co wiesz o tym mieœcie?
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_01");	//Khorinis? Miasto jak miasto, tyle ¿e portowe. Nic specjalnego.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_02");	//Czemu pytasz?
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_03");	//Muszê siê skontaktowaæ z paladynami, którzy podobno tam przebywaj¹.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_04");	//Czy¿by? Niesamowite. Tak jakby ktoœ taki by³ w stanie w ogóle dostaæ siê do miasta, nie mówi¹c ju¿ o spotkaniu z paladynami...
};


instance DIA_ADDON_LESTER_VORSCHLAG(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_addon_lester_vorschlag_condition;
	information = dia_addon_lester_vorschlag_info;
	description = "Jakieœ rady co do sposobu dostania siê do miasta?";
};


func int dia_addon_lester_vorschlag_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lester_stadt) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lester_vorschlag_info()
{
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_00");	//Jakieœ rady co do sposobu dostania siê do miasta?
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_01");	//Owszem! Jakiœ czas temu pracowa³em dla starego alchemika imieniem Constantino.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_02");	//Ma pewne wp³ywy we w³adzach miejskich i nakaza³ stra¿nikom przepuszczaæ osoby, które chc¹ mu sprzedaæ rzadkie zio³a.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_03");	//Ca³a sprawa jest doœæ prosta - nazbieraj okolicznego zielska i udaj, ¿e pracujesz dla Constantina. To powinno wystarczyæ.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_04");	//Pilnuj tylko, ¿eby zielsko nie by³o ca³kowicie przypadkow¹ kolekcj¹ - stra¿nicy nie s¹ mo¿e zbyt m¹drzy i nie znaj¹ siê na alchemii...
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_05");	//Ale to, co przynosisz, musi dobrze wygl¹daæ - inaczej ciê nie przepuszcz¹.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_06");	//Powinno do tego wystarczyæ 10 sztuk jednej roœliny.
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_07");	//Dziêki za radê.
	Log_CreateTopic(TOPIC_ADDON_PICKFORCONSTANTINO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_PICKFORCONSTANTINO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_PICKFORCONSTANTINO,"Lester s¹dzi, ¿e stra¿e miejskie mnie przepuszcz¹, jeœli poka¿ê im 10 roœlin tego samego rodzaju. Mam udawaæ, ¿e s¹ dla alchemika Constantina.");
	MIS_ADDON_LESTER_PICKFORCONSTANTINO = LOG_RUNNING;
};


instance DIA_ADDON_LESTER_PASSAGEPLANTSSUCCESS(C_INFO)
{
	npc = pc_psionic;
	nr = 5;
	condition = dia_addon_lester_passageplantssuccess_condition;
	information = dia_addon_lester_passageplantssuccess_info;
	description = "Pomys³ z Constantinem by³ dobry, stra¿nicy mnie przepuœcili.";
};


func int dia_addon_lester_passageplantssuccess_condition()
{
	if(MIS_ADDON_LESTER_PICKFORCONSTANTINO == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_lester_passageplantssuccess_info()
{
	AI_Output(other,self,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00");	//Pomys³ z Constantinem by³ dobry, stra¿nicy mnie przepuœcili.
	AI_Output(self,other,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01");	//No, tak jak mówi³em. S³uchanie moich rad mo¿e ci tylko wyjœæ na dobre, przyjacielu...
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LESTER_PERM(C_INFO)
{
	npc = pc_psionic;
	nr = 99;
	condition = dia_lester_perm_condition;
	information = dia_lester_perm_info;
	permanent = TRUE;
	description = "Co mo¿esz mi powiedzieæ o pobliskich terenach?";
};


func int dia_lester_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_LESTER") <= 2000))
	{
		return TRUE;
	};
};

func void dia_lester_perm_info()
{
	AI_Output(other,self,"DIA_Lester_Perm_15_00");	//Co mo¿esz mi powiedzieæ o pobliskich terenach?
	AI_Output(self,other,"DIA_Lester_Perm_13_01");	//Id¹c w dó³ tamtej drogi, dojdziesz do farmy. Za ni¹ le¿y miasto.
	AI_Output(self,other,"DIA_Lester_Perm_13_02");	//Tylko uwa¿aj na siebie! W pobli¿u czaj¹ siê groŸniejsze rzeczy ni¿ wilki i szczury. Jest tu sporo goblinów i bandytów!
};


instance DIA_LESTER_SLEEP(C_INFO)
{
	npc = pc_psionic;
	nr = 99;
	condition = dia_lester_sleep_condition;
	information = dia_lester_sleep_info;
	permanent = TRUE;
	description = "Ci¹gle zmêczony?";
};


func int dia_lester_sleep_condition()
{
	if((KAPITEL < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") <= 500))
	{
		return TRUE;
	};
};

func void dia_lester_sleep_info()
{
	AI_Output(other,self,"DIA_Lester_Sleep_15_00");	//Ci¹gle zmêczony?
	AI_Output(self,other,"DIA_Lester_Sleep_13_01");	//I to jak! Powiedzia³em Xardasowi wszystko, co wiem. Teraz muszê siê trochê zdrzemn¹æ. Jeden dzieñ powinien wystarczyæ...
	AI_Output(self,other,"DIA_Lester_Sleep_13_02");	//No... góra dwa.
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_KAP3_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap3_exit_condition;
	information = dia_lester_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lester_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_BACKINTOWN(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_backintown_condition;
	information = dia_lester_backintown_info;
	important = TRUE;
};


func int dia_lester_backintown_condition()
{
	if((Npc_GetDistToWP(self,"LEVELCHANGE") <= 500) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lester_backintown_info()
{
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_00");	//No, jesteœ nareszcie! IdŸ lepiej od razu do Xardasa. Mamy problem!
	AI_Output(other,self,"DIA_Lester_BACKINTOWN_15_01");	//W to akurat ³atwo mi uwierzyæ.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_02");	//Od twojej ostatniej wizyty rozpêta³o siê prawdziwe piek³o.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_03");	//Porozmawiaj z Xardasem. Czeka ju¿ na ciebie!
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_04");	//Xardas kaza³ mi przekazaæ ci tê runê. Dziêki niej szybciej do niego wrócisz. Spotkamy siê na miejscu.
	CreateInvItems(self,itru_teleportxardas,1);
	b_giveinvitems(self,other,itru_teleportxardas,1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_LESTER_PERM3(C_INFO)
{
	npc = pc_psionic;
	nr = 900;
	condition = dia_lester_perm3_condition;
	information = dia_lester_perm3_info;
	permanent = TRUE;
	description = "Nie wygl¹dasz najlepiej.";
};


func int dia_lester_perm3_condition()
{
	if((KAPITEL >= 3) && (LESTER_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_lester_perm3_onetime;

func void dia_lester_perm3_info()
{
	AI_Output(other,self,"DIA_Lester_PERM3_15_00");	//Nie wygl¹dasz najlepiej.
	if(hero.guild == GIL_KDF)
	{
		if(DIA_LESTER_PERM3_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Lester_PERM3_13_01");	//I nie najlepiej siê czujê. Jestem zupe³nie wycieñczony i ci¹gle mam ten ból g³owy.
			AI_Output(self,other,"DIA_Lester_PERM3_13_02");	//Za ka¿dym razem, gdy pojawi¹ siê tu te czarne kaptury, jest jeszcze gorzej!
			if(SC_KNOWSMADPSI == TRUE)
			{
				AI_Output(other,self,"DIA_Lester_PERM3_15_03");	//Mogê ci nawet powiedzieæ, dlaczego tak siê dzieje.
				AI_Output(self,other,"DIA_Lester_PERM3_13_04");	//Tak? Chyba nie chcê tego wiedzieæ...
				AI_Output(other,self,"DIA_Lester_PERM3_15_05");	//Te czarne kaptury, czy Poszukiwacze, jak nazywaj¹ ich magowie, byli kiedyœ wyznawcami potê¿nego demona. Mówi ci to coœ?
				AI_Output(self,other,"DIA_Lester_PERM3_13_06");	//Mmm... No nie. Chyba ¿e chcesz powiedzieæ...
				AI_Output(other,self,"DIA_Lester_PERM3_15_07");	//W³aœnie tak. Poszukiwacze byli kiedyœ wyznawcami Œni¹cego. Utworzyli w Kolonii w³asn¹ sektê, osiedlaj¹c siê na tamtejszych bagnach.
				AI_Output(other,self,"DIA_Lester_PERM3_15_08");	//To twoi dawni kompani, Lester. Dawne Bractwo Œni¹cego. Coœ zmieni³o ich w bezduszne narzêdzia Z³a.
				AI_Output(self,other,"DIA_Lester_PERM3_13_09");	//Podejrzewa³em to, ale mia³em nadziejê, ¿e siê mylê. Czy to znaczy, ¿e ON powróci³? Czy Œni¹cy znów jest w naszym œwiecie?
				AI_Output(other,self,"DIA_Lester_PERM3_15_10");	//Dobre pytanie. Wiem tylko, ¿e trzeba za wszelk¹ cenê powstrzymaæ Poszukiwaczy, nim stan¹ siê zbyt potê¿ni.
				AI_Output(self,other,"DIA_Lester_PERM3_13_11");	//Nie podoba mi siê to wszystko, ale chyba masz racjê. Przepraszam... Mo¿na przez to wszystko oszaleæ.
				b_logentry(TOPIC_DEMENTOREN,"Moje podejrzenia potwierdzi³y siê. Nawet Lester nie ma ¿adnych w¹tpliwoœci, ¿e Poszukiwacze i wyznawcy œni¹cego przychodz¹ ze starego obozowiska na mokrad³ach.");
				b_giveplayerxp(XP_LESTER_KNOWSMADPSI);
				DIA_LESTER_PERM3_ONETIME = TRUE;
			};
		};
	}
	else if(LESTER_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_12");	//G³owa ci¹gle mi pêka, ale miejmy nadziejê, ¿e ten problem wkrótce siê rozwi¹¿e.
		AI_Output(self,other,"DIA_Lester_PERM3_13_13");	//W ten, czy inny sposób.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_14");	//Ból g³owy sta³ siê nie do zniesienia. A na dodatek ci jaszczuroludzie bez przerwy mnie atakuj¹. Zastanawiam siê, sk¹d oni siê bior¹.
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_15");	//Mój ból g³owy nie ustêpuje nawet na chwilê. Szykuje siê coœ du¿ego!
	};
	AI_Output(self,other,"DIA_Lester_PERM3_13_16");	//Chyba muszê najpierw odpocz¹æ.
};


instance DIA_LESTER_KAP4_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap4_exit_condition;
	information = dia_lester_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lester_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_KAP5_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap5_exit_condition;
	information = dia_lester_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lester_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_XARDASWEG(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_xardasweg_condition;
	information = dia_lester_xardasweg_info;
	description = "Gdzie jest Xardas?";
};


func int dia_lester_xardasweg_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lester_xardasweg_info()
{
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_00");	//Gdzie jest Xardas?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_01");	//Znikn¹³ gdzieœ, ale zostawi³ na stra¿y swoje demony.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_02");	//Chyba nie chce, ¿eby ktoœ w³óczy³ siê po wie¿y pod jego nieobecnoœæ.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_03");	//Dok¹d siê uda³?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_04");	//Tego nie powiedzia³. Kaza³ tylko przekazaæ ci ten list.
	CreateInvItems(self,itwr_xardaslettertoopenbook_mis,1);
	b_giveinvitems(self,other,itwr_xardaslettertoopenbook_mis,1);
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_05");	//Przepraszam... Przeczyta³em go.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");	//I co?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_07");	//I nic. Nie zrozumia³em ani s³owa. Jedno jest pewne - zbyt prêdko go nie zobaczymy.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_08");	//Myœlê, ¿e zrobi³o siê tu dla niego za gor¹co i postanowi³ daæ nogê.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Xardas znikn¹³. Lester przekaza³ mi od niego list.");
};


instance DIA_LESTER_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_knowwhereenemy_condition;
	information = dia_lester_knowwhereenemy_info;
	permanent = TRUE;
	description = "Dowiedzia³em siê, gdzie szukaæ naszego nieprzyjaciela.";
};


func int dia_lester_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LESTER_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_00");	//Dowiedzia³em siê, gdzie szukaæ naszego nieprzyjaciela.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_01");	//Nie wiem dlaczego, ale mam wra¿enie, ¿e powinienem pójœæ z tob¹.
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_02");	//Co przez to rozumiesz?
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_03");	//Nie potrafiê tego wyjaœniæ, ale wydaje mi siê, ¿e odpowiedzi na moje pytania poznam, id¹c z tob¹.
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_04");	//Przykro mi, ale mam ju¿ pe³n¹ za³ogê.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_05");	//Mo¿e tak jest... A mo¿e mój los nic nie znaczy wobec wydarzeñ, które czekaj¹ nas w najbli¿szej przysz³oœci...
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_06");	//Wiesz, co nale¿y zrobiæ. Staw czo³a Z³u. O mnie siê nie martw.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_07");	//Ja nic nie znaczê.
	}
	else
	{
		Info_ClearChoices(dia_lester_knowwhereenemy);
		Info_AddChoice(dia_lester_knowwhereenemy,"Nie mogê ciê zabraæ ze sob¹.",dia_lester_knowwhereenemy_no);
		Info_AddChoice(dia_lester_knowwhereenemy,"Wiêc chodŸ ze mn¹ i poszukaj swoich odpowiedzi!",dia_lester_knowwhereenemy_yes);
	};
};

func void dia_lester_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_00");	//Wiêc chodŸ ze mn¹ i poszukaj swoich odpowiedzi!
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_01");	//Spotkamy siê w zatoce. Zejdê tam, gdy tylko bêdê gotów.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02");	//Spiesz siê! Mamy ma³o czasu.
	self.flags = NPC_FLAG_IMMORTAL;
	LESTER_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lester_knowwhereenemy);
};

func void dia_lester_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_No_15_00");	//Nie mogê ciê zabraæ ze sob¹.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_01");	//Rozumiem. Pewnie i tak nie na wiele bym ci siê przyda³.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_02");	//Niewa¿ne, kogo zabierasz ze sob¹, tak d³ugo, jak mo¿esz im zaufaæ.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_03");	//Uwa¿aj na siebie.
	LESTER_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_lester_knowwhereenemy);
};


instance DIA_LESTER_LEAVEMYSHIP(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_leavemyship_condition;
	information = dia_lester_leavemyship_info;
	permanent = TRUE;
	description = "Jednak zabrak³o dla ciebie miejsca na statku.";
};


func int dia_lester_leavemyship_condition()
{
	if((LESTER_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lester_LeaveMyShip_15_00");	//Jednak zabrak³o dla ciebie miejsca na statku.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_01");	//Rozumiem. Na twoim miejscu post¹pi³bym pewnie tak samo.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_02");	//Gdybyœ mnie potrzebowa³, wiesz, gdzie mnie znaleŸæ.
	LESTER_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LESTER_STILLNEEDYOU(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_stillneedyou_condition;
	information = dia_lester_stillneedyou_info;
	permanent = TRUE;
	description = "Przyda³aby mi siê twoja pomoc.";
};


func int dia_lester_stillneedyou_condition()
{
	if(((LESTER_ISONBOARD == LOG_OBSOLETE) || (LESTER_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lester_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lester_StillNeedYou_15_00");	//Przyda³aby mi siê twoja pomoc.
	if(LESTER_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_01");	//Wiedzia³em! Zupe³nie jak za dawnych czasów, co?
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_02");	//Si³y z³a powinny siê mieæ na bacznoœci. Wkrótce bêd¹ mia³y do czynienia Z NAMI!
		self.flags = NPC_FLAG_IMMORTAL;
		LESTER_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_03");	//Chyba lepiej bêdzie, jeœli tu jednak zostanê. Powodzenia.
		AI_StopProcessInfos(self);
	};
};


instance DIA_LESTER_KAP6_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap6_exit_condition;
	information = dia_lester_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lester_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_PSIONIC_PICKPOCKET(C_INFO)
{
	npc = pc_psionic;
	nr = 900;
	condition = dia_pc_psionic_pickpocket_condition;
	information = dia_pc_psionic_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_pc_psionic_pickpocket_condition()
{
	return c_beklauen(76,20);
};

func void dia_pc_psionic_pickpocket_info()
{
	Info_ClearChoices(dia_pc_psionic_pickpocket);
	Info_AddChoice(dia_pc_psionic_pickpocket,DIALOG_BACK,dia_pc_psionic_pickpocket_back);
	Info_AddChoice(dia_pc_psionic_pickpocket,DIALOG_PICKPOCKET,dia_pc_psionic_pickpocket_doit);
};

func void dia_pc_psionic_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pc_psionic_pickpocket);
};

func void dia_pc_psionic_pickpocket_back()
{
	Info_ClearChoices(dia_pc_psionic_pickpocket);
};

