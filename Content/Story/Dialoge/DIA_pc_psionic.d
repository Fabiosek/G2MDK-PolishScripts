
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
	AI_Output(self,other,"DIA_Lester_Hello_13_00");	//To naprawd� TY? Cz�owieku, jak si� ciesz�, �e ci� widz�!
	Info_ClearChoices(dia_lester_hello);
	Info_AddChoice(dia_lester_hello,"Czy my si� znamy?",dia_lester_hello_youknowme);
	Info_AddChoice(dia_lester_hello,"Lester! Sk�d si� tu wzi��e�?",dia_lester_hello_lester);
};

func void dia_lester_hello_lester()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_Lester_15_00");	//Lester! Sk�d si� tu wzi��e�?
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_01");	//To ci dopiero niez�a historia! Po upadku Bariery przez d�ugi czas b��ka�em si� po okolicy, nie wiedz�c, co ze sob� zrobi�.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_02");	//Przez kolejne kilka dni przedziera�em si� przez lasy, a� wreszcie znalaz�em t� kotlink�.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten i Gorn nadal s� w G�rniczej Dolinie. Tak mi si� w ka�dym razie wydaje.
};

func void dia_lester_hello_youknowme()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_YouKnowMe_15_00");	//Czy my si� znamy?
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Halo? Jest tam kto?! Nadstawia�em karku, �eby� m�g� dosta� ten sw�j dziwny kamie�.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Jeste� mi co� winny. To przynajmniej m�g�by� pami�ta�!
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_03");	//Pami�tasz chyba Diego, Miltena i Gorna?
	Info_AddChoice(dia_lester_hello,"Diego, Milten i KTO?",dia_lester_hello_whofourfriends);
	Info_AddChoice(dia_lester_hello,"Jasne. Co si� z nimi dzieje?",dia_lester_hello_knowfourfriends);
};

func void dia_lester_hello_knowfourfriends()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Jasne. Co si� z nimi dzieje?
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Je�li si� nie myl�, wszyscy trzej prze�yli upadek Bariery.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Nie mam poj�cia, gdzie si� teraz podziewaj�. Pewnie s� nadal w G�rniczej Dolinie.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Gdyby� ich spotka�, daj mi zna�.
};

func void dia_lester_hello_whofourfriends()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten i KTO?
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Nie m�w mi, �e o wszystkim zapomnia�e�?! Kamienie ogniskuj�ce? Troll? Kopiec rudy wodnych mag�w? Nic?!
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Sam ju� nie wiem.
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Kiedy� sobie przypomnisz. Ja te� potrzebowa�em troch� czasu, �eby doj�� do siebie.
};


instance DIA_LESTER_WHATHAPPENED(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_whathappened_condition;
	information = dia_lester_whathappened_info;
	permanent = FALSE;
	description = "Co si� sta�o?";
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
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_00");	//Co ci si� sta�o?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_01");	//Po upadku �ni�cego, ca�e Bractwo wpad�o w sza�.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_02");	//Bez swojego pana nie wiedzieli, co maj� robi� dalej.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co z tob�?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_04");	//Ze mn� by�o podobnie. Mia�em koszmary... nawet halucynacje! Ale gdy tylko jako tako doszed�em do siebie, da�em nog�.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_05");	//Raz wydawa�o mi si� nawet, �e widz� wielki cie� rzucaj�cy si� na grup� uciekinier�w i spowijaj�cy ich w wielkiej chmurze ognia.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_06");	//Przez moment my�la�em, �e mam przed sob� smoka.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_07");	//Widzia�e� co� jeszcze?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_08");	//Nie! Na wszelki wypadek wzi��em nogi za pas!
};


instance DIA_LESTER_MINECOLONY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_minecolony_condition;
	information = dia_lester_minecolony_info;
	permanent = FALSE;
	description = "Jak d�ugo si� tutaj ukrywasz?";
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
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_00");	//Jak d�ugo si� tu ukrywasz?
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_01");	//Nie wiem dok�adnie. Mo�e tydzie�. Ale jest jeszcze co�:
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_02");	//Kiedy tu przyby�em wieczorem, spojrza�em na szczyt tej g�ry, i by�o tam tylko kilka drzew.
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_03");	//Ale jak si� obudzi�em nast�pnego dnia, sta�a tam wie�a. M�g�bym przysi�c, �e wcze�niej jej nie by�o! Od tamtej pory nie ruszam si� st�d na krok.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_04");	//Masz na my�li wie�� Xardasa? Wiedzia�em, �e jest pot�ny, ale stworzy� magicznie tak� wie��...
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_05");	//Xardas? Ten nekromanta? To on mieszka w tej wie�y? Nie wiem, czy mi si� to podoba...
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_06");	//Spokojnie! To on wyci�gn�� mnie ze �wi�tyni �ni�cego. Jest po naszej stronie.
};


instance DIA_LESTER_SEND_XARDAS(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_send_xardas_condition;
	information = dia_lester_send_xardas_info;
	permanent = FALSE;
	description = "Musisz porozmawia� z Xardasem o tym cieniu...";
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
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_00");	//Musisz porozmawia� z Xardasem o tym cieniu. To mo�e by� co� wa�nego.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_01");	//My�lisz, �e sobie tego nie ubzdura�em? My�lisz, �e naprawd� widzia�em...
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_02");	//...smoka. Tak.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_03");	//Znowu siedzisz w tym wszystkim po uszy, co?
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_04");	//Mo�e nie a� po uszy. W ka�dym razie - jeszcze nie.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_05");	//C�, w porz�dku. Je�li to takie wa�ne, p�jd� z nim pogada�. Ale jeszcze nie teraz!
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_06");	//Najpierw musz� troch� odpocz��. Ci�gle jestem wyczerpany po ucieczce z Kolonii.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_07");	//Widz�, �e zn�w co� kombinujesz. Spotkamy si� u Xardasa.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LESTER_STADT(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_addon_lester_stadt_condition;
	information = dia_addon_lester_stadt_info;
	description = "Zmierzam do Khorinis! Co wiesz o tym mie�cie?";
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
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_00");	//Zmierzam do Khorinis! Co wiesz o tym mie�cie?
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_01");	//Khorinis? Miasto jak miasto, tyle �e portowe. Nic specjalnego.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_02");	//Czemu pytasz?
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_03");	//Musz� si� skontaktowa� z paladynami, kt�rzy podobno tam przebywaj�.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_04");	//Czy�by? Niesamowite. Tak jakby kto� taki by� w stanie w og�le dosta� si� do miasta, nie m�wi�c ju� o spotkaniu z paladynami...
};


instance DIA_ADDON_LESTER_VORSCHLAG(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_addon_lester_vorschlag_condition;
	information = dia_addon_lester_vorschlag_info;
	description = "Jakie� rady co do sposobu dostania si� do miasta?";
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
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_00");	//Jakie� rady co do sposobu dostania si� do miasta?
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_01");	//Owszem! Jaki� czas temu pracowa�em dla starego alchemika imieniem Constantino.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_02");	//Ma pewne wp�ywy we w�adzach miejskich i nakaza� stra�nikom przepuszcza� osoby, kt�re chc� mu sprzeda� rzadkie zio�a.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_03");	//Ca�a sprawa jest do�� prosta - nazbieraj okolicznego zielska i udaj, �e pracujesz dla Constantina. To powinno wystarczy�.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_04");	//Pilnuj tylko, �eby zielsko nie by�o ca�kowicie przypadkow� kolekcj� - stra�nicy nie s� mo�e zbyt m�drzy i nie znaj� si� na alchemii...
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_05");	//Ale to, co przynosisz, musi dobrze wygl�da� - inaczej ci� nie przepuszcz�.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_06");	//Powinno do tego wystarczy� 10 sztuk jednej ro�liny.
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_07");	//Dzi�ki za rad�.
	Log_CreateTopic(TOPIC_ADDON_PICKFORCONSTANTINO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_PICKFORCONSTANTINO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_PICKFORCONSTANTINO,"Lester s�dzi, �e stra�e miejskie mnie przepuszcz�, je�li poka�� im 10 ro�lin tego samego rodzaju. Mam udawa�, �e s� dla alchemika Constantina.");
	MIS_ADDON_LESTER_PICKFORCONSTANTINO = LOG_RUNNING;
};


instance DIA_ADDON_LESTER_PASSAGEPLANTSSUCCESS(C_INFO)
{
	npc = pc_psionic;
	nr = 5;
	condition = dia_addon_lester_passageplantssuccess_condition;
	information = dia_addon_lester_passageplantssuccess_info;
	description = "Pomys� z Constantinem by� dobry, stra�nicy mnie przepu�cili.";
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
	AI_Output(other,self,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00");	//Pomys� z Constantinem by� dobry, stra�nicy mnie przepu�cili.
	AI_Output(self,other,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01");	//No, tak jak m�wi�em. S�uchanie moich rad mo�e ci tylko wyj�� na dobre, przyjacielu...
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LESTER_PERM(C_INFO)
{
	npc = pc_psionic;
	nr = 99;
	condition = dia_lester_perm_condition;
	information = dia_lester_perm_info;
	permanent = TRUE;
	description = "Co mo�esz mi powiedzie� o pobliskich terenach?";
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
	AI_Output(other,self,"DIA_Lester_Perm_15_00");	//Co mo�esz mi powiedzie� o pobliskich terenach?
	AI_Output(self,other,"DIA_Lester_Perm_13_01");	//Id�c w d� tamtej drogi, dojdziesz do farmy. Za ni� le�y miasto.
	AI_Output(self,other,"DIA_Lester_Perm_13_02");	//Tylko uwa�aj na siebie! W pobli�u czaj� si� gro�niejsze rzeczy ni� wilki i szczury. Jest tu sporo goblin�w i bandyt�w!
};


instance DIA_LESTER_SLEEP(C_INFO)
{
	npc = pc_psionic;
	nr = 99;
	condition = dia_lester_sleep_condition;
	information = dia_lester_sleep_info;
	permanent = TRUE;
	description = "Ci�gle zm�czony?";
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
	AI_Output(other,self,"DIA_Lester_Sleep_15_00");	//Ci�gle zm�czony?
	AI_Output(self,other,"DIA_Lester_Sleep_13_01");	//I to jak! Powiedzia�em Xardasowi wszystko, co wiem. Teraz musz� si� troch� zdrzemn��. Jeden dzie� powinien wystarczy�...
	AI_Output(self,other,"DIA_Lester_Sleep_13_02");	//No... g�ra dwa.
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
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_00");	//No, jeste� nareszcie! Id� lepiej od razu do Xardasa. Mamy problem!
	AI_Output(other,self,"DIA_Lester_BACKINTOWN_15_01");	//W to akurat �atwo mi uwierzy�.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_02");	//Od twojej ostatniej wizyty rozp�ta�o si� prawdziwe piek�o.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_03");	//Porozmawiaj z Xardasem. Czeka ju� na ciebie!
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_04");	//Xardas kaza� mi przekaza� ci t� run�. Dzi�ki niej szybciej do niego wr�cisz. Spotkamy si� na miejscu.
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
	description = "Nie wygl�dasz najlepiej.";
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
	AI_Output(other,self,"DIA_Lester_PERM3_15_00");	//Nie wygl�dasz najlepiej.
	if(hero.guild == GIL_KDF)
	{
		if(DIA_LESTER_PERM3_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Lester_PERM3_13_01");	//I nie najlepiej si� czuj�. Jestem zupe�nie wycie�czony i ci�gle mam ten b�l g�owy.
			AI_Output(self,other,"DIA_Lester_PERM3_13_02");	//Za ka�dym razem, gdy pojawi� si� tu te czarne kaptury, jest jeszcze gorzej!
			if(SC_KNOWSMADPSI == TRUE)
			{
				AI_Output(other,self,"DIA_Lester_PERM3_15_03");	//Mog� ci nawet powiedzie�, dlaczego tak si� dzieje.
				AI_Output(self,other,"DIA_Lester_PERM3_13_04");	//Tak? Chyba nie chc� tego wiedzie�...
				AI_Output(other,self,"DIA_Lester_PERM3_15_05");	//Te czarne kaptury, czy Poszukiwacze, jak nazywaj� ich magowie, byli kiedy� wyznawcami pot�nego demona. M�wi ci to co�?
				AI_Output(self,other,"DIA_Lester_PERM3_13_06");	//Mmm... No nie. Chyba �e chcesz powiedzie�...
				AI_Output(other,self,"DIA_Lester_PERM3_15_07");	//W�a�nie tak. Poszukiwacze byli kiedy� wyznawcami �ni�cego. Utworzyli w Kolonii w�asn� sekt�, osiedlaj�c si� na tamtejszych bagnach.
				AI_Output(other,self,"DIA_Lester_PERM3_15_08");	//To twoi dawni kompani, Lester. Dawne Bractwo �ni�cego. Co� zmieni�o ich w bezduszne narz�dzia Z�a.
				AI_Output(self,other,"DIA_Lester_PERM3_13_09");	//Podejrzewa�em to, ale mia�em nadziej�, �e si� myl�. Czy to znaczy, �e ON powr�ci�? Czy �ni�cy zn�w jest w naszym �wiecie?
				AI_Output(other,self,"DIA_Lester_PERM3_15_10");	//Dobre pytanie. Wiem tylko, �e trzeba za wszelk� cen� powstrzyma� Poszukiwaczy, nim stan� si� zbyt pot�ni.
				AI_Output(self,other,"DIA_Lester_PERM3_13_11");	//Nie podoba mi si� to wszystko, ale chyba masz racj�. Przepraszam... Mo�na przez to wszystko oszale�.
				b_logentry(TOPIC_DEMENTOREN,"Moje podejrzenia potwierdzi�y si�. Nawet Lester nie ma �adnych w�tpliwo�ci, �e Poszukiwacze i wyznawcy �ni�cego przychodz� ze starego obozowiska na mokrad�ach.");
				b_giveplayerxp(XP_LESTER_KNOWSMADPSI);
				DIA_LESTER_PERM3_ONETIME = TRUE;
			};
		};
	}
	else if(LESTER_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_12");	//G�owa ci�gle mi p�ka, ale miejmy nadziej�, �e ten problem wkr�tce si� rozwi��e.
		AI_Output(self,other,"DIA_Lester_PERM3_13_13");	//W ten, czy inny spos�b.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_14");	//B�l g�owy sta� si� nie do zniesienia. A na dodatek ci jaszczuroludzie bez przerwy mnie atakuj�. Zastanawiam si�, sk�d oni si� bior�.
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_15");	//M�j b�l g�owy nie ust�puje nawet na chwil�. Szykuje si� co� du�ego!
	};
	AI_Output(self,other,"DIA_Lester_PERM3_13_16");	//Chyba musz� najpierw odpocz��.
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
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_01");	//Znikn�� gdzie�, ale zostawi� na stra�y swoje demony.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_02");	//Chyba nie chce, �eby kto� w��czy� si� po wie�y pod jego nieobecno��.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_03");	//Dok�d si� uda�?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_04");	//Tego nie powiedzia�. Kaza� tylko przekaza� ci ten list.
	CreateInvItems(self,itwr_xardaslettertoopenbook_mis,1);
	b_giveinvitems(self,other,itwr_xardaslettertoopenbook_mis,1);
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_05");	//Przepraszam... Przeczyta�em go.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");	//I co?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_07");	//I nic. Nie zrozumia�em ani s�owa. Jedno jest pewne - zbyt pr�dko go nie zobaczymy.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_08");	//My�l�, �e zrobi�o si� tu dla niego za gor�co i postanowi� da� nog�.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Xardas znikn��. Lester przekaza� mi od niego list.");
};


instance DIA_LESTER_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_knowwhereenemy_condition;
	information = dia_lester_knowwhereenemy_info;
	permanent = TRUE;
	description = "Dowiedzia�em si�, gdzie szuka� naszego nieprzyjaciela.";
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
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_00");	//Dowiedzia�em si�, gdzie szuka� naszego nieprzyjaciela.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_01");	//Nie wiem dlaczego, ale mam wra�enie, �e powinienem p�j�� z tob�.
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_02");	//Co przez to rozumiesz?
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_03");	//Nie potrafi� tego wyja�ni�, ale wydaje mi si�, �e odpowiedzi na moje pytania poznam, id�c z tob�.
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_04");	//Przykro mi, ale mam ju� pe�n� za�og�.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_05");	//Mo�e tak jest... A mo�e m�j los nic nie znaczy wobec wydarze�, kt�re czekaj� nas w najbli�szej przysz�o�ci...
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_06");	//Wiesz, co nale�y zrobi�. Staw czo�a Z�u. O mnie si� nie martw.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_07");	//Ja nic nie znacz�.
	}
	else
	{
		Info_ClearChoices(dia_lester_knowwhereenemy);
		Info_AddChoice(dia_lester_knowwhereenemy,"Nie mog� ci� zabra� ze sob�.",dia_lester_knowwhereenemy_no);
		Info_AddChoice(dia_lester_knowwhereenemy,"Wi�c chod� ze mn� i poszukaj swoich odpowiedzi!",dia_lester_knowwhereenemy_yes);
	};
};

func void dia_lester_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_00");	//Wi�c chod� ze mn� i poszukaj swoich odpowiedzi!
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_01");	//Spotkamy si� w zatoce. Zejd� tam, gdy tylko b�d� got�w.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02");	//Spiesz si�! Mamy ma�o czasu.
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
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_No_15_00");	//Nie mog� ci� zabra� ze sob�.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_01");	//Rozumiem. Pewnie i tak nie na wiele bym ci si� przyda�.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_02");	//Niewa�ne, kogo zabierasz ze sob�, tak d�ugo, jak mo�esz im zaufa�.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_03");	//Uwa�aj na siebie.
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
	description = "Jednak zabrak�o dla ciebie miejsca na statku.";
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
	AI_Output(other,self,"DIA_Lester_LeaveMyShip_15_00");	//Jednak zabrak�o dla ciebie miejsca na statku.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_01");	//Rozumiem. Na twoim miejscu post�pi�bym pewnie tak samo.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_02");	//Gdyby� mnie potrzebowa�, wiesz, gdzie mnie znale��.
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
	description = "Przyda�aby mi si� twoja pomoc.";
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
	AI_Output(other,self,"DIA_Lester_StillNeedYou_15_00");	//Przyda�aby mi si� twoja pomoc.
	if(LESTER_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_01");	//Wiedzia�em! Zupe�nie jak za dawnych czas�w, co?
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_02");	//Si�y z�a powinny si� mie� na baczno�ci. Wkr�tce b�d� mia�y do czynienia Z NAMI!
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
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_03");	//Chyba lepiej b�dzie, je�li tu jednak zostan�. Powodzenia.
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

