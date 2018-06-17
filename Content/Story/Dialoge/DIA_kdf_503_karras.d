
instance DIA_KARRAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap1_exit_condition;
	information = dia_karras_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_karras_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_HELLO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_hello_condition;
	information = dia_karras_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NOVIZENCHASE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_hello_info()
{
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_00");	//Co mog� dla ciebie uczyni�, nowicjuszu?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_01");	//Co mog� dla ciebie uczyni�, Bracie?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_02");	//Czcigodni wojownicy Innosa rzadko zapuszczaj� si� do tych sal.
		AI_Output(self,other,"DIA_Karras_Hello_10_03");	//Co mog� dla ciebie zrobi�?
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_04");	//Co tutaj robisz?
	};
};


instance DIA_KARRAS_MISSION(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_mission_condition;
	information = dia_karras_mission_info;
	permanent = FALSE;
	description = "Przyszed�em studiowa� pisma.";
};


func int dia_karras_mission_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_mission_info()
{
	AI_Output(other,self,"DIA_Karras_Mission_15_00");	//Przyszed�em studiowa� pisma.
	AI_Output(self,other,"DIA_Karras_Mission_10_01");	//Rozumiem. Je�li znajdziesz troch� czasu, przyjd� do mnie.
	AI_Output(self,other,"DIA_Karras_Mission_10_02");	//Jest pewna sprawa, w kt�rej przyda�aby mi si� pomoc dyskretnego nowicjusza.
};


instance DIA_KARRAS_AUFGABE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_aufgabe_condition;
	information = dia_karras_aufgabe_info;
	permanent = FALSE;
	description = "Masz dla mnie jakie� zadanie?";
};


func int dia_karras_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_mission))
	{
		return TRUE;
	};
};

func void dia_karras_aufgabe_info()
{
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_00");	//Masz dla mnie jakie� zadanie?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_01");	//Tak. Chodzi o tego zwariowanego Ignaza. Mieszka w Khorinis i prowadzi eksperymenty nad przer�nymi miksturami i napojami leczniczymi. No i nad zakl�ciami.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_02");	//I to w�a�nie najbardziej mnie martwi. Widzisz, zastanawia mnie czasami, czy Innosowi podoba si� ta jego magia.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_03");	//Aby si� tego dowiedzie�, potrzebuj� kilku jego magicznych zwoj�w.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_04");	//Chc�, aby� uda� si� do miasta i zdoby� trzy magiczne zwoje jego produkcji.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_05");	//Tylko nikomu ani s�owa - czy to jasne?
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_06");	//Oczywi�cie.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_07");	//Oto 150 sztuk z�ota. Powinny pokry� twoje wydatki.
	MIS_KARRASVERGESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KARRASCHARM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KARRASCHARM,LOG_RUNNING);
	b_logentry(TOPIC_KARRASCHARM,"Mistrz Karras kaza� mi uda� si� do miasta i zdoby� trzy magiczne zwoje produkowane oraz sprzedawane przez Ignaza.");
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_KARRAS_SUCCESS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_success_condition;
	information = dia_karras_success_info;
	permanent = FALSE;
	description = "Oto zwoje, o kt�re prosi�e�.";
};


func int dia_karras_success_condition()
{
	if((MIS_KARRASVERGESSEN == LOG_RUNNING) && (Npc_HasItems(other,itsc_charm) >= 3))
	{
		return TRUE;
	};
};

func void dia_karras_success_info()
{
	AI_Output(other,self,"DIA_Karras_Success_15_00");	//Oto zwoje, o kt�re prosi�e�.
	AI_Output(self,other,"DIA_Karras_Success_10_01");	//Dobra robota, m�j m�ody przyjacielu.
	AI_Output(self,other,"DIA_Karras_Success_10_02");	//A teraz pora po�wi�ci� troch� czasu na studia.
	AI_Output(self,other,"DIA_Karras_Success_10_03");	//Aha, przyjmij ten zw�j w nagrod� za dobrze wykonane zadanie.
	MIS_KARRASVERGESSEN = LOG_SUCCESS;
	b_giveplayerxp(XP_KARRASCHARM);
	b_giveinvitems(other,self,itsc_charm,3);
	b_giveinvitems(self,other,itsc_sumwolf,1);
};


instance DIA_KARRAS_TRADE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_trade_condition;
	information = dia_karras_trade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int dia_karras_trade_condition()
{
	if(hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Karras_Trade_15_00");	//Poka� mi swoje towary.
};


instance DIA_KARRAS_JOB(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_job_condition;
	information = dia_karras_job_info;
	permanent = FALSE;
	description = "Na czym dok�adnie polega twoja praca?";
};


func int dia_karras_job_condition()
{
	return TRUE;
};

func void dia_karras_job_info()
{
	AI_Output(other,self,"DIA_Karras_JOB_15_00");	//Na czym dok�adnie polega twoja praca?
	AI_Output(self,other,"DIA_Karras_JOB_10_01");	//Szkol� mag�w w dziedzinie manifestacji sferycznej.
	AI_Output(other,self,"DIA_Karras_JOB_15_02");	//Co to znaczy?
	AI_Output(self,other,"DIA_Karras_JOB_10_03");	//Mniej wi�cej tyle, �e ucz� ich, jak przywo�ywa� przer�ne istoty z innych wymiar�w lub sfer.
	AI_Output(self,other,"DIA_Karras_JOB_10_04");	//Zwykle nazywa si� to przyzywaniem, cho� ta nazwa nie opisuje w zadowalaj�cym stopniu sztuki wzywania pomocnika.
	AI_Output(self,other,"DIA_Karras_JOB_10_05");	//Co wi�cej, jestem w posiadaniu pewnych interesuj�cych zwoj�w magicznych, kt�rych nie ma Gorax.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_JOB_10_06");	//Ale udost�pniam je tylko cz�onkom Zakonu.
	};
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Mistrz Karras mo�e mnie zaopatrzy� w magiczne zwoje. Najpierw jednak musz� zosta� Magiem Ognia.");
};


instance DIA_KARRAS_TEACH(C_INFO)
{
	npc = kdf_503_karras;
	nr = 10;
	condition = dia_karras_teach_condition;
	information = dia_karras_teach_info;
	permanent = TRUE;
	description = "Nauczaj mnie (tworzenie run)";
};


func int dia_karras_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_karras_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Karras_TEACH_15_00");	//Zosta� moim nauczycielem.
	Info_ClearChoices(dia_karras_teach);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOBLINSKELETON)),dia_karras_teach_sumgobl);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONWOLF)),dia_karras_teachsummonwolf);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONSKELETON)),dia_karras_teach_summonskeleton);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),dia_karras_teach_summongolem);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),dia_karras_teach_summondemon);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),dia_karras_teach_armyofdarkness);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Karras_TEACH_10_01");	//W tym momencie nie ma nic, czego m�g�by� si� ode mnie nauczy�.
	}
	else
	{
		Info_AddChoice(dia_karras_teach,DIALOG_BACK,dia_karras_teach_back);
	};
};

func void dia_karras_teach_back()
{
	Info_ClearChoices(dia_karras_teach);
};

func void dia_karras_teach_sumgobl()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void dia_karras_teachsummonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void dia_karras_teach_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void dia_karras_teach_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_karras_teach_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_karras_teach_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};


instance DIA_KARRAS_CIRCLE4(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle4_condition;
	information = dia_karras_circle4_info;
	permanent = TRUE;
	description = "Chc� zg��bia� czwarty kr�g magii.";
};


func int dia_karras_circle4_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};

func void dia_karras_circle4_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE4_15_00");	//Chc� zg��bia� czwarty kr�g magii.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_01");	//Dobrze. Wszystkie znaki si� wype�ni�y. Wkrocz zatem do czwartego kr�gu, aby przepe�ni�a ci� moc nowej magii.
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_02");	//Przeby�e� dalek� drog�, a Innos nadal b�dzie roz�wietla� przed tob� ciemno�ci.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_03");	//Bowiem to jeszcze nie koniec.
	};
};


instance DIA_KARRAS_CIRCLE5(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle5_condition;
	information = dia_karras_circle5_info;
	permanent = TRUE;
	description = "Chc� zg��bia� pi�ty kr�g magii.";
};


func int dia_karras_circle5_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};

func void dia_karras_circle5_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE5_15_00");	//Chc� zg��bia� pi�ty kr�g magii.
	if(KAPITEL >= 5)
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_01");	//Wkrocz zatem do pi�tego kr�gu. Poznasz magi� pot�niejsz� ni� wszystko, czego do tej pory do�wiadczy�e�.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_02");	//U�ywaj tej mocy w rozwa�ny spos�b, Bracie - albowiem mrok wci�� jeszcze posiada ogromn� moc, tak samo jak twoi wrogowie.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_03");	//Nie mog� ci towarzyszy� w twojej podr�y do sz�stego, najwy�szego kr�gu magii. Kiedy nadejdzie w�a�ciwy czas, wprowadzi ci� do niego sam Pyrokar.
			b_logentry(TOPIC_KLOSTERTEACHER,"Mistrz Pyrokar wprowadzi mnie w sz�sty Kr�g Magii.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//Czas jeszcze nie nadszed�.
	};
};


instance DIA_KARRAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap2_exit_condition;
	information = dia_karras_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_karras_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap3_exit_condition;
	information = dia_karras_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_karras_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_CHASEPEDRO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_chasepedro_condition;
	information = dia_karras_chasepedro_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_chasepedro_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_chasepedro_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_00");	//Bracie, nie wolno ci traci� czasu. Musisz odnale�� Pedra i odzyska� Oko Innosa.
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_01");	//Je�li Oko Innosa do nas nie wr�ci, b�dziemy zgubieni.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_02");	//Co tutaj robisz? Czy nie powiniene� szuka� tego podst�pnego zdrajcy, Pedra?
		Info_ClearChoices(dia_karras_chasepedro);
		Info_AddChoice(dia_karras_chasepedro,"P�niej. Najpierw musz� si� zaj�� inn� spraw�.",dia_karras_chasepedro_later);
		Info_AddChoice(dia_karras_chasepedro,"Nie ucieknie zbyt daleko.",dia_karras_chasepedro_wontescape);
	};
};

func void dia_karras_chasepedro_later()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_Later_15_00");	//P�niej. Najpierw musz� si� zaj�� inn� spraw�.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_01");	//Czy wiesz, co ta strata oznacza dla naszego klasztoru? Oko Innosa to pot�na bro�!
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_02");	//Nie da si� przewidzie�, co wr�g zamierza zrobi� z amuletem, ale na pewno ma wobec niego jaki� plan. Musimy go powstrzyma�.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_03");	//Wi�c nie tra� czasu i ruszaj za z�odziejem!
	AI_StopProcessInfos(self);
};

func void dia_karras_chasepedro_wontescape()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_00");	//Nie ucieknie zbyt daleko.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_01");	//Mam tak� nadziej� dla twojego w�asnego dobra. Je�li oka�e si�, �e uciek� przez twoje zaniedbanie, osobi�cie postawi� ci� przed trybuna�em.
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_02");	//I o co mnie oskar�ysz?
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_03");	//O wsp�prac� z wrogiem. Nietrudno jest sobie chyba wyobrazi� kar� za taki wyst�pek.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_04");	//Dlatego te� nie tra� ju� wi�cej czasu, chyba �e chcesz si� ze mn� spotka� w znacznie mniej przyjemnych okoliczno�ciach.
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_NEEDINFO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_needinfo_condition;
	information = dia_karras_needinfo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_karras_needinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_chasepedro) && (KAPITEL == 3) && (hero.guild != GIL_KDF) && (MIS_NOVIZENCHASE == LOG_RUNNING) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_karras_needinfo_info()
{
	AI_Output(self,other,"DIA_Karras_NeedInfo_10_00");	//Wiesz wszystko, czego ci trzeba. A teraz ruszaj w drog�!
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_INNOSEYERETRIEVED(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_innoseyeretrieved_condition;
	information = dia_karras_innoseyeretrieved_info;
	permanent = FALSE;
	description = "Odzyska�em Oko Innosa.";
};


func int dia_karras_innoseyeretrieved_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_karras_innoseyeretrieved_info()
{
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_00");	//Odzyska�em Oko Innosa.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_01");	//Co za ulga, �e uda�o ci si� je wyrwa� ze szpon�w wroga!
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_02");	//Jednak niebezpiecze�stwo nie zosta�o jeszcze za�egnane. S�udzy z�a wci�� knuj� swoje nikczemne plany, a tym razem s� wyj�tkowo zdeterminowani.
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_03");	//O tym zdo�a�em si� ju� sam przekona�.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_04");	//Nie drwij ze mnie. Sytuacja jest powa�na, bardzo powa�na, i nie bardzo wiemy, komu mo�emy zaufa�.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_05");	//Skoro wrogowi uda�o si� zwie�� Pedra na drog� wyst�pku, nale�y si� spodziewa�, �e inni r�wnie� mu ulegn�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_KARRAS_KAP3_PERM(C_INFO)
{
	npc = kdf_503_karras;
	nr = 5;
	condition = dia_karras_kap3_perm_condition;
	information = dia_karras_kap3_perm_info;
	permanent = TRUE;
	description = "Jak twoje studia?";
};


func int dia_karras_kap3_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_00");	//Jak twoje studia?
	if((MIS_KARRASRESEARCHDMT == FALSE) && (PYROKARTOLDKARRASTORESEARCHDMT == TRUE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_01");	//Uda�o mi si� dotrze� do informacji na temat Poszukiwaczy.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_02");	//I czego si� dowiedzia�e�?
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_03");	//Najwyra�niej ich dzia�aniami kieruj�, lub kierowa�y, demony.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_04");	//B�d� ostro�ny, je�li si� na nich natkniesz.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_05");	//To bardzo odkrywcze spostrze�enie.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_06");	//Przykro mi, ale nie posiadam informacji, dzi�ki kt�rym m�g�bym udzieli� ci lepszej rady.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_07");	//Gdyby� jednak m�g� mi przynie�� do zbadania jaki� przedmiot nale��cy do Poszukiwaczy...
		MIS_KARRASRESEARCHDMT = LOG_RUNNING;
		b_logentry(TOPIC_DEMENTOREN,"Aby m�c dalej prowadzi� swoje badania, Karras potrzebuje czego�, z czym Poszukiwacze mieli bezpo�redni kontakt.");
		Info_ClearChoices(dia_karras_kap3_perm);
		Info_AddChoice(dia_karras_kap3_perm,DIALOG_BACK,dia_karras_kap3_perm_back);
		Info_AddChoice(dia_karras_kap3_perm,"Zobacz�, co si� da zrobi�.",dia_karras_kap3_perm_willsee);
		Info_AddChoice(dia_karras_kap3_perm,"Czy �ni�cy mo�e by� w to zamieszany?",dia_karras_kap3_perm_sleeper);
		Info_AddChoice(dia_karras_kap3_perm,"Jakiego rodzaju materia��w potrzebujesz?",dia_karras_kap3_perm_material);
	}
	else if(MIS_KARRASRESEARCHDMT == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_08");	//Wci�� jeszcze pracuj� nad interpretacj� wynik�w moich bada� nad Poszukiwaczami.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_09");	//Kiedy tylko czego� si� dowiem, niezw�ocznie dam ci zna�.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_10");	//Wr�g ma wiele twarzy. Trudno stwierdzi�, kt�ra z nich stanowi najwi�ksze zagro�enie dla klasztoru.
	};
};

func void dia_karras_kap3_perm_back()
{
	Info_ClearChoices(dia_karras_kap3_perm);
};

func void dia_karras_kap3_perm_sleeper()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Sleeper_15_00");	//Czy �ni�cy mo�e by� w to zamieszany?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01");	//S�ysza�em histori� �ni�cego. Jednak nie jestem w stanie wypowiedzie� si� na ten temat.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02");	//Istnieje wiele demon�w, i ka�dy z nich m�g� w tym macza� palce.
};

func void dia_karras_kap3_perm_corpse()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Corpse_15_00");	//Chcesz, �ebym przyni�s� ci zw�oki?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_01");	//Postrada�e� zmys�y? Gdyby w murach naszego klasztoru znalaz�a si� demoniczna istota, mog�oby to wywo�a� katastrofalne skutki.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_02");	//Wystarczy, je�li przyniesiesz jakie� nale��ce do nich przedmioty.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_03");	//Otaczaj�ce je pozosta�o�ci duchowej aury powinny dostarczy� nam cennych wskaz�wek.
};

func void dia_karras_kap3_perm_material()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Material_15_00");	//Jakiego rodzaju materia��w potrzebujesz?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Material_10_01");	//Sam nie wiem - czegokolwiek, co nale�y do tych istot.
	Info_AddChoice(dia_karras_kap3_perm,"Chcesz, �ebym przyni�s� ci zw�oki?",dia_karras_kap3_perm_corpse);
};

func void dia_karras_kap3_perm_willsee()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_WillSee_15_00");	//Zobacz�, co si� da zrobi�.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_WillSee_10_01");	//Z pewno�ci� bardzo by to nam pomog�o. Ja tymczasem wracam do swoich bada�.
	Info_ClearChoices(dia_karras_kap3_perm);
};


instance DIA_KARRAS_HAVEBOOK(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_havebook_condition;
	information = dia_karras_havebook_info;
	permanent = FALSE;
	description = "Mam Almanach Pot�pionych.";
};


func int dia_karras_havebook_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_RUNNING) && (Npc_HasItems(hero,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int karrasgotresearchdmtbook_day;

func void dia_karras_havebook_info()
{
	AI_Output(other,self,"DIA_Karras_HaveBook_15_00");	//Mam tutaj almanach Op�tanych. Mo�e ci si� przyda�.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//Poka� go.
	Npc_RemoveInvItems(other,itwr_dementorobsessionbook_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Karras_HaveBook_10_02");	//Tak, to mo�e by� to, czego szukamy. Zbadam t� ksi�g�.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_03");	//W tej chwili jestem pewien tylko jednej rzeczy.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_04");	//Poszukiwacze s� form� �ycia stworzon� przez Beliara.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_05");	//S� w po�owie lud�mi, w po�owie demonami.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_06");	//Wci�� jednak nie jestem w stanie okre�li�, czy mamy tu do czynienia z op�taniem duchowym, czy z czysto fizyczn� mutacj�.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_07");	//Wr�� p�niej, na pewno b�d� ci m�g� powiedzie� wi�cej na ten temat.
	MIS_KARRASRESEARCHDMT = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Karras u�yje w swoich dalszych badaniach Almanachu Op�tanych. Mam do niego wr�ci� p�niej.");
	KARRASGOTRESEARCHDMTBOOK_DAY = Wld_GetDay();
	b_giveplayerxp(XP_KARRASRESEARCHDMT);
};


instance DIA_KARRAS_RESEARCHDMTEND(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_researchdmtend_condition;
	information = dia_karras_researchdmtend_info;
	permanent = TRUE;
	description = "Dowiedzia�e� si� czego� nowego o Poszukiwaczach?";
};


func int dia_karras_researchdmtend_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_SUCCESS) && (hero.guild == GIL_KDF) && (SC_KNOWSMADPSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_researchdmtend_info()
{
	AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_00");	//Dowiedzia�e� si� czego� nowego o Poszukiwaczach?
	if(KARRASGOTRESEARCHDMTBOOK_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_01");	//Tak. Uda�o mi si� ustali�, kim - lub czym - tak naprawd� s�.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//M�w pr�dko!
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_03");	//Niegdy� byli lud�mi, takimi jak ty czy ja. Pope�nili jednak pewien b��d - pozwolili si� op�ta� nieczystej magii pewnego bardzo pot�nego demona.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_04");	//Pod jego wp�ywem, spot�gowanym jeszcze przez dzia�anie silnych narkotyk�w, powoli stawali si� tym, czym s� teraz - ulotnymi cieniami samych siebie.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_05");	//Dzisiaj s� jedynie narz�dziami z�a, nie posiadaj�cymi w�asnej woli, maj�cymi tylko jeden cel - prze�ladowanie wyznawc�w Innosa.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_06");	//Musimy by� ostro�ni. Co prawda na razie zdaj� si� unika� tych �wi�tych mur�w...
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_07");	//Jednak je�li stan� si� jeszcze silniejsi, nawet tutaj mo�e zrobi� si� niebezpiecznie.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_08");	//Dzi�kuj� za wszystkie informacje.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_09");	//Niestety, to wszystko prowadzi do kolejnych pyta�. Na przyk�ad - kim byli w swoim prawdziwym �yciu, albo jaki demon zamieni� ich w to, czym s� teraz?
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_10");	//Chyba si� domy�lam. To musi by� sprawka Bractwa �ni�cego. Znam tych ludzi.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_11");	//Mam nadziej�, �e wiesz, na co si� porywasz. Uwa�aj na siebie, Bracie.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_12");	//A... tw�j almanach. Nie b�d� go ju� potrzebowa�.
		CreateInvItems(other,itwr_dementorobsessionbook_mis,1);
		AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		SC_KNOWSMADPSI = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Badania Karrasa zosta�y uwie�czone sukcesem. Mi�dzy Bractwem �ni�cego a Poszukiwaczami istnieje jakie� powi�zanie.");
		b_giveplayerxp(XP_SC_KNOWSMADPSI);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_13");	//Pracuj� nad tym. Wr�� p�niej.
	};
};


instance DIA_KARRAS_PROT_BLACKEYE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_prot_blackeye_condition;
	information = dia_karras_prot_blackeye_info;
	permanent = TRUE;
	description = "Czy istnieje jaki� skuteczny spos�b obrony przed atakami Poszukiwaczy?";
};


func int dia_karras_prot_blackeye_condition()
{
	if((hero.guild == GIL_KDF) && (PYROKAR_ASKKARRASABOUTDMTAMULETT == TRUE) && (MIS_KARRAS_FINDBLESSEDSTONE == FALSE) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_prot_blackeye_info()
{
	AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_00");	//Czy istnieje jaki� skuteczny spos�b obrony przed mentalnymi atakami Poszukiwaczy?
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_01");	//Tak. S�dz�, �e amulet zrobiony z kamienia z b�ogos�awionej ziemi mo�e zapewni� tak� ochron�.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_02");	//Niestety, nie mam akurat �adnego pod r�k�.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_03");	//Niekt�re nasze kapliczki zosta�y wybudowane z takich w�a�nie kamieni.
		AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_04");	//Dobrze, spr�buj� zdoby� jeden z nich.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_05");	//Tak, to dobry pomys�. Pami�taj tylko, �eby nie zniszczy� przy tym kapliczki, rozumiemy si�?
		b_logentry(TOPIC_DEMENTOREN,"Karras mo�e mi zapewni� ochron� przeciwko mentalnym atakom Poszukiwaczy. Potrzebuje do tego celu kamienia ze �wi�tej ziemi - takiego, z kt�rego zrobione s� niekt�re kapliczki.");
		MIS_KARRAS_FINDBLESSEDSTONE = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_06");	//Nie mam poj�cia. Wci�� jeszcze brakuje mi wiedzy na ten temat. Wr�� p�niej, mo�e b�d� ju� co� wiedzia�.
	};
};


instance DIA_KARRAS_KARRASBLESSEDSTONE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_karrasblessedstone_condition;
	information = dia_karras_karrasblessedstone_info;
	description = "Mam tutaj kamie� z b�ogos�awionej ziemi.";
};


func int dia_karras_karrasblessedstone_condition()
{
	if((hero.guild == GIL_KDF) && Npc_HasItems(other,itmi_karrasblessedstone_mis) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int karrasmakesblessedstone_day;

func void dia_karras_karrasblessedstone_info()
{
	AI_Output(other,self,"DIA_Karras_KarrasBlessedStone_15_00");	//Mam tutaj kamie� z b�ogos�awionej ziemi.
	b_giveinvitems(other,self,itmi_karrasblessedstone_mis,1);
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_01");	//Dobrze. Mam nadziej�, �e �adna z kapliczek na tym nie ucierpia�a.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_02");	//Dobrze. Sporz�dz� z niego ochronny amulet, kt�ry b�dzie ci� strzeg� przed mrocznym spojrzeniem Poszukiwaczy.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_03");	//Daj mi troch� czasu. Niezw�ocznie przyst�pi� do pracy.
	KARRASMAKESBLESSEDSTONE_DAY = Wld_GetDay();
	MIS_KARRAS_FINDBLESSEDSTONE = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Karras da� mi amulet, kt�ry ochroni mnie przed mentalnymi atakami Poszukiwaczy. To powinno mi troch� u�atwi� �ycie.");
	b_giveplayerxp(XP_KARRAS_FOUNDBLESSEDSTONE);
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_itam_prot_blackeye_mis_condition;
	information = dia_karras_itam_prot_blackeye_mis_info;
	permanent = TRUE;
	description = "Co z ochronnym amuletem, kt�ry mi obieca�e�?";
};


var int dia_karras_itam_prot_blackeye_mis_noperm;

func int dia_karras_itam_prot_blackeye_mis_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_SUCCESS) && (DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_itam_prot_blackeye_mis_info()
{
	AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00");	//Co z ochronnym amuletem, kt�ry mi obieca�e�?
	if(KARRASMAKESBLESSEDSTONE_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01");	//W�a�nie go sko�czy�em. Prosz�, oto on. Czy� nie jest pi�kny?
		CreateInvItems(self,itam_prot_blackeye_mis,1);
		b_giveinvitems(self,other,itam_prot_blackeye_mis,1);
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02");	//Miej go zawsze przy sobie, a Poszukiwacze nie b�d� mogli wnikn�� w tw�j umys�.
		AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03");	//Dzi�kuj�.
		b_logentry(TOPIC_DEMENTOREN,"Karras da� mi amulet, kt�ry ochroni mnie przez mrocznym spojrzeniem Poszukiwaczy.");
		DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04");	//Cierpliwo�ci. Wci�� jeszcze nad nim pracuj�.
	};
};


instance DIA_KARRAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap4_exit_condition;
	information = dia_karras_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_karras_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap5_exit_condition;
	information = dia_karras_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_karras_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_PICKPOCKET(C_INFO)
{
	npc = kdf_503_karras;
	nr = 900;
	condition = dia_karras_pickpocket_condition;
	information = dia_karras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_karras_pickpocket_condition()
{
	return c_beklauen(49,35);
};

func void dia_karras_pickpocket_info()
{
	Info_ClearChoices(dia_karras_pickpocket);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_BACK,dia_karras_pickpocket_back);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_PICKPOCKET,dia_karras_pickpocket_doit);
};

func void dia_karras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_karras_pickpocket);
};

func void dia_karras_pickpocket_back()
{
	Info_ClearChoices(dia_karras_pickpocket);
};

