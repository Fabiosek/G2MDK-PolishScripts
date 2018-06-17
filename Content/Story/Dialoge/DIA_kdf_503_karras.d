
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
		AI_Output(self,other,"DIA_Karras_Hello_10_00");	//Co mogê dla ciebie uczyniæ, nowicjuszu?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_01");	//Co mogê dla ciebie uczyniæ, Bracie?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_02");	//Czcigodni wojownicy Innosa rzadko zapuszczaj¹ siê do tych sal.
		AI_Output(self,other,"DIA_Karras_Hello_10_03");	//Co mogê dla ciebie zrobiæ?
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
	description = "Przyszed³em studiowaæ pisma.";
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
	AI_Output(other,self,"DIA_Karras_Mission_15_00");	//Przyszed³em studiowaæ pisma.
	AI_Output(self,other,"DIA_Karras_Mission_10_01");	//Rozumiem. Jeœli znajdziesz trochê czasu, przyjdŸ do mnie.
	AI_Output(self,other,"DIA_Karras_Mission_10_02");	//Jest pewna sprawa, w której przyda³aby mi siê pomoc dyskretnego nowicjusza.
};


instance DIA_KARRAS_AUFGABE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_aufgabe_condition;
	information = dia_karras_aufgabe_info;
	permanent = FALSE;
	description = "Masz dla mnie jakieœ zadanie?";
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
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_00");	//Masz dla mnie jakieœ zadanie?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_01");	//Tak. Chodzi o tego zwariowanego Ignaza. Mieszka w Khorinis i prowadzi eksperymenty nad przeró¿nymi miksturami i napojami leczniczymi. No i nad zaklêciami.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_02");	//I to w³aœnie najbardziej mnie martwi. Widzisz, zastanawia mnie czasami, czy Innosowi podoba siê ta jego magia.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_03");	//Aby siê tego dowiedzieæ, potrzebujê kilku jego magicznych zwojów.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_04");	//Chcê, abyœ uda³ siê do miasta i zdoby³ trzy magiczne zwoje jego produkcji.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_05");	//Tylko nikomu ani s³owa - czy to jasne?
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_06");	//Oczywiœcie.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_07");	//Oto 150 sztuk z³ota. Powinny pokryæ twoje wydatki.
	MIS_KARRASVERGESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KARRASCHARM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KARRASCHARM,LOG_RUNNING);
	b_logentry(TOPIC_KARRASCHARM,"Mistrz Karras kaza³ mi udaæ siê do miasta i zdobyæ trzy magiczne zwoje produkowane oraz sprzedawane przez Ignaza.");
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_KARRAS_SUCCESS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_success_condition;
	information = dia_karras_success_info;
	permanent = FALSE;
	description = "Oto zwoje, o które prosi³eœ.";
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
	AI_Output(other,self,"DIA_Karras_Success_15_00");	//Oto zwoje, o które prosi³eœ.
	AI_Output(self,other,"DIA_Karras_Success_10_01");	//Dobra robota, mój m³ody przyjacielu.
	AI_Output(self,other,"DIA_Karras_Success_10_02");	//A teraz pora poœwiêciæ trochê czasu na studia.
	AI_Output(self,other,"DIA_Karras_Success_10_03");	//Aha, przyjmij ten zwój w nagrodê za dobrze wykonane zadanie.
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
	description = "Poka¿ mi swoje towary.";
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
	AI_Output(other,self,"DIA_Karras_Trade_15_00");	//Poka¿ mi swoje towary.
};


instance DIA_KARRAS_JOB(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_job_condition;
	information = dia_karras_job_info;
	permanent = FALSE;
	description = "Na czym dok³adnie polega twoja praca?";
};


func int dia_karras_job_condition()
{
	return TRUE;
};

func void dia_karras_job_info()
{
	AI_Output(other,self,"DIA_Karras_JOB_15_00");	//Na czym dok³adnie polega twoja praca?
	AI_Output(self,other,"DIA_Karras_JOB_10_01");	//Szkolê magów w dziedzinie manifestacji sferycznej.
	AI_Output(other,self,"DIA_Karras_JOB_15_02");	//Co to znaczy?
	AI_Output(self,other,"DIA_Karras_JOB_10_03");	//Mniej wiêcej tyle, ¿e uczê ich, jak przywo³ywaæ przeró¿ne istoty z innych wymiarów lub sfer.
	AI_Output(self,other,"DIA_Karras_JOB_10_04");	//Zwykle nazywa siê to przyzywaniem, choæ ta nazwa nie opisuje w zadowalaj¹cym stopniu sztuki wzywania pomocnika.
	AI_Output(self,other,"DIA_Karras_JOB_10_05");	//Co wiêcej, jestem w posiadaniu pewnych interesuj¹cych zwojów magicznych, których nie ma Gorax.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_JOB_10_06");	//Ale udostêpniam je tylko cz³onkom Zakonu.
	};
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Mistrz Karras mo¿e mnie zaopatrzyæ w magiczne zwoje. Najpierw jednak muszê zostaæ Magiem Ognia.");
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
	AI_Output(other,self,"DIA_Karras_TEACH_15_00");	//Zostañ moim nauczycielem.
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
		AI_Output(self,other,"DIA_Karras_TEACH_10_01");	//W tym momencie nie ma nic, czego móg³byœ siê ode mnie nauczyæ.
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
	description = "Chcê zg³êbiaæ czwarty kr¹g magii.";
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
	AI_Output(other,self,"DIA_Karras_CIRCLE4_15_00");	//Chcê zg³êbiaæ czwarty kr¹g magii.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_01");	//Dobrze. Wszystkie znaki siê wype³ni³y. Wkrocz zatem do czwartego krêgu, aby przepe³ni³a ciê moc nowej magii.
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_02");	//Przeby³eœ dalek¹ drogê, a Innos nadal bêdzie rozœwietla³ przed tob¹ ciemnoœci.
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
	description = "Chcê zg³êbiaæ pi¹ty kr¹g magii.";
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
	AI_Output(other,self,"DIA_Karras_CIRCLE5_15_00");	//Chcê zg³êbiaæ pi¹ty kr¹g magii.
	if(KAPITEL >= 5)
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_01");	//Wkrocz zatem do pi¹tego krêgu. Poznasz magiê potê¿niejsz¹ ni¿ wszystko, czego do tej pory doœwiadczy³eœ.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_02");	//U¿ywaj tej mocy w rozwa¿ny sposób, Bracie - albowiem mrok wci¹¿ jeszcze posiada ogromn¹ moc, tak samo jak twoi wrogowie.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_03");	//Nie mogê ci towarzyszyæ w twojej podró¿y do szóstego, najwy¿szego krêgu magii. Kiedy nadejdzie w³aœciwy czas, wprowadzi ciê do niego sam Pyrokar.
			b_logentry(TOPIC_KLOSTERTEACHER,"Mistrz Pyrokar wprowadzi mnie w szósty Kr¹g Magii.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//Czas jeszcze nie nadszed³.
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
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_00");	//Bracie, nie wolno ci traciæ czasu. Musisz odnaleŸæ Pedra i odzyskaæ Oko Innosa.
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_01");	//Jeœli Oko Innosa do nas nie wróci, bêdziemy zgubieni.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_02");	//Co tutaj robisz? Czy nie powinieneœ szukaæ tego podstêpnego zdrajcy, Pedra?
		Info_ClearChoices(dia_karras_chasepedro);
		Info_AddChoice(dia_karras_chasepedro,"PóŸniej. Najpierw muszê siê zaj¹æ inn¹ spraw¹.",dia_karras_chasepedro_later);
		Info_AddChoice(dia_karras_chasepedro,"Nie ucieknie zbyt daleko.",dia_karras_chasepedro_wontescape);
	};
};

func void dia_karras_chasepedro_later()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_Later_15_00");	//PóŸniej. Najpierw muszê siê zaj¹æ inn¹ spraw¹.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_01");	//Czy wiesz, co ta strata oznacza dla naszego klasztoru? Oko Innosa to potê¿na broñ!
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_02");	//Nie da siê przewidzieæ, co wróg zamierza zrobiæ z amuletem, ale na pewno ma wobec niego jakiœ plan. Musimy go powstrzymaæ.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_03");	//Wiêc nie traæ czasu i ruszaj za z³odziejem!
	AI_StopProcessInfos(self);
};

func void dia_karras_chasepedro_wontescape()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_00");	//Nie ucieknie zbyt daleko.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_01");	//Mam tak¹ nadziejê dla twojego w³asnego dobra. Jeœli oka¿e siê, ¿e uciek³ przez twoje zaniedbanie, osobiœcie postawiê ciê przed trybuna³em.
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_02");	//I o co mnie oskar¿ysz?
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_03");	//O wspó³pracê z wrogiem. Nietrudno jest sobie chyba wyobraziæ karê za taki wystêpek.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_04");	//Dlatego te¿ nie traæ ju¿ wiêcej czasu, chyba ¿e chcesz siê ze mn¹ spotkaæ w znacznie mniej przyjemnych okolicznoœciach.
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
	AI_Output(self,other,"DIA_Karras_NeedInfo_10_00");	//Wiesz wszystko, czego ci trzeba. A teraz ruszaj w drogê!
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_INNOSEYERETRIEVED(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_innoseyeretrieved_condition;
	information = dia_karras_innoseyeretrieved_info;
	permanent = FALSE;
	description = "Odzyska³em Oko Innosa.";
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
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_00");	//Odzyska³em Oko Innosa.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_01");	//Co za ulga, ¿e uda³o ci siê je wyrwaæ ze szponów wroga!
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_02");	//Jednak niebezpieczeñstwo nie zosta³o jeszcze za¿egnane. S³udzy z³a wci¹¿ knuj¹ swoje nikczemne plany, a tym razem s¹ wyj¹tkowo zdeterminowani.
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_03");	//O tym zdo³a³em siê ju¿ sam przekonaæ.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_04");	//Nie drwij ze mnie. Sytuacja jest powa¿na, bardzo powa¿na, i nie bardzo wiemy, komu mo¿emy zaufaæ.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_05");	//Skoro wrogowi uda³o siê zwieœæ Pedra na drogê wystêpku, nale¿y siê spodziewaæ, ¿e inni równie¿ mu ulegn¹.
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
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_01");	//Uda³o mi siê dotrzeæ do informacji na temat Poszukiwaczy.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_02");	//I czego siê dowiedzia³eœ?
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_03");	//NajwyraŸniej ich dzia³aniami kieruj¹, lub kierowa³y, demony.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_04");	//B¹dŸ ostro¿ny, jeœli siê na nich natkniesz.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_05");	//To bardzo odkrywcze spostrze¿enie.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_06");	//Przykro mi, ale nie posiadam informacji, dziêki którym móg³bym udzieliæ ci lepszej rady.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_07");	//Gdybyœ jednak móg³ mi przynieœæ do zbadania jakiœ przedmiot nale¿¹cy do Poszukiwaczy...
		MIS_KARRASRESEARCHDMT = LOG_RUNNING;
		b_logentry(TOPIC_DEMENTOREN,"Aby móc dalej prowadziæ swoje badania, Karras potrzebuje czegoœ, z czym Poszukiwacze mieli bezpoœredni kontakt.");
		Info_ClearChoices(dia_karras_kap3_perm);
		Info_AddChoice(dia_karras_kap3_perm,DIALOG_BACK,dia_karras_kap3_perm_back);
		Info_AddChoice(dia_karras_kap3_perm,"Zobaczê, co siê da zrobiæ.",dia_karras_kap3_perm_willsee);
		Info_AddChoice(dia_karras_kap3_perm,"Czy œni¹cy mo¿e byæ w to zamieszany?",dia_karras_kap3_perm_sleeper);
		Info_AddChoice(dia_karras_kap3_perm,"Jakiego rodzaju materia³ów potrzebujesz?",dia_karras_kap3_perm_material);
	}
	else if(MIS_KARRASRESEARCHDMT == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_08");	//Wci¹¿ jeszcze pracujê nad interpretacj¹ wyników moich badañ nad Poszukiwaczami.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_09");	//Kiedy tylko czegoœ siê dowiem, niezw³ocznie dam ci znaæ.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_10");	//Wróg ma wiele twarzy. Trudno stwierdziæ, która z nich stanowi najwiêksze zagro¿enie dla klasztoru.
	};
};

func void dia_karras_kap3_perm_back()
{
	Info_ClearChoices(dia_karras_kap3_perm);
};

func void dia_karras_kap3_perm_sleeper()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Sleeper_15_00");	//Czy Œni¹cy mo¿e byæ w to zamieszany?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01");	//S³ysza³em historiê Œni¹cego. Jednak nie jestem w stanie wypowiedzieæ siê na ten temat.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02");	//Istnieje wiele demonów, i ka¿dy z nich móg³ w tym maczaæ palce.
};

func void dia_karras_kap3_perm_corpse()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Corpse_15_00");	//Chcesz, ¿ebym przyniós³ ci zw³oki?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_01");	//Postrada³eœ zmys³y? Gdyby w murach naszego klasztoru znalaz³a siê demoniczna istota, mog³oby to wywo³aæ katastrofalne skutki.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_02");	//Wystarczy, jeœli przyniesiesz jakieœ nale¿¹ce do nich przedmioty.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_03");	//Otaczaj¹ce je pozosta³oœci duchowej aury powinny dostarczyæ nam cennych wskazówek.
};

func void dia_karras_kap3_perm_material()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Material_15_00");	//Jakiego rodzaju materia³ów potrzebujesz?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Material_10_01");	//Sam nie wiem - czegokolwiek, co nale¿y do tych istot.
	Info_AddChoice(dia_karras_kap3_perm,"Chcesz, ¿ebym przyniós³ ci zw³oki?",dia_karras_kap3_perm_corpse);
};

func void dia_karras_kap3_perm_willsee()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_WillSee_15_00");	//Zobaczê, co siê da zrobiæ.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_WillSee_10_01");	//Z pewnoœci¹ bardzo by to nam pomog³o. Ja tymczasem wracam do swoich badañ.
	Info_ClearChoices(dia_karras_kap3_perm);
};


instance DIA_KARRAS_HAVEBOOK(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_havebook_condition;
	information = dia_karras_havebook_info;
	permanent = FALSE;
	description = "Mam Almanach Potêpionych.";
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
	AI_Output(other,self,"DIA_Karras_HaveBook_15_00");	//Mam tutaj almanach Opêtanych. Mo¿e ci siê przydaæ.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//Poka¿ go.
	Npc_RemoveInvItems(other,itwr_dementorobsessionbook_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Karras_HaveBook_10_02");	//Tak, to mo¿e byæ to, czego szukamy. Zbadam tê ksiêgê.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_03");	//W tej chwili jestem pewien tylko jednej rzeczy.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_04");	//Poszukiwacze s¹ form¹ ¿ycia stworzon¹ przez Beliara.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_05");	//S¹ w po³owie ludŸmi, w po³owie demonami.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_06");	//Wci¹¿ jednak nie jestem w stanie okreœliæ, czy mamy tu do czynienia z opêtaniem duchowym, czy z czysto fizyczn¹ mutacj¹.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_07");	//Wróæ póŸniej, na pewno bêdê ci móg³ powiedzieæ wiêcej na ten temat.
	MIS_KARRASRESEARCHDMT = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Karras u¿yje w swoich dalszych badaniach Almanachu Opêtanych. Mam do niego wróciæ póŸniej.");
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
	description = "Dowiedzia³eœ siê czegoœ nowego o Poszukiwaczach?";
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
	AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_00");	//Dowiedzia³eœ siê czegoœ nowego o Poszukiwaczach?
	if(KARRASGOTRESEARCHDMTBOOK_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_01");	//Tak. Uda³o mi siê ustaliæ, kim - lub czym - tak naprawdê s¹.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//Mów prêdko!
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_03");	//Niegdyœ byli ludŸmi, takimi jak ty czy ja. Pope³nili jednak pewien b³¹d - pozwolili siê opêtaæ nieczystej magii pewnego bardzo potê¿nego demona.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_04");	//Pod jego wp³ywem, spotêgowanym jeszcze przez dzia³anie silnych narkotyków, powoli stawali siê tym, czym s¹ teraz - ulotnymi cieniami samych siebie.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_05");	//Dzisiaj s¹ jedynie narzêdziami z³a, nie posiadaj¹cymi w³asnej woli, maj¹cymi tylko jeden cel - przeœladowanie wyznawców Innosa.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_06");	//Musimy byæ ostro¿ni. Co prawda na razie zdaj¹ siê unikaæ tych œwiêtych murów...
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_07");	//Jednak jeœli stan¹ siê jeszcze silniejsi, nawet tutaj mo¿e zrobiæ siê niebezpiecznie.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_08");	//Dziêkujê za wszystkie informacje.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_09");	//Niestety, to wszystko prowadzi do kolejnych pytañ. Na przyk³ad - kim byli w swoim prawdziwym ¿yciu, albo jaki demon zamieni³ ich w to, czym s¹ teraz?
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_10");	//Chyba siê domyœlam. To musi byæ sprawka Bractwa Œni¹cego. Znam tych ludzi.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_11");	//Mam nadziejê, ¿e wiesz, na co siê porywasz. Uwa¿aj na siebie, Bracie.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_12");	//A... twój almanach. Nie bêdê go ju¿ potrzebowa³.
		CreateInvItems(other,itwr_dementorobsessionbook_mis,1);
		AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		SC_KNOWSMADPSI = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Badania Karrasa zosta³y uwieñczone sukcesem. Miêdzy Bractwem œni¹cego a Poszukiwaczami istnieje jakieœ powi¹zanie.");
		b_giveplayerxp(XP_SC_KNOWSMADPSI);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_13");	//Pracujê nad tym. Wróæ póŸniej.
	};
};


instance DIA_KARRAS_PROT_BLACKEYE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_prot_blackeye_condition;
	information = dia_karras_prot_blackeye_info;
	permanent = TRUE;
	description = "Czy istnieje jakiœ skuteczny sposób obrony przed atakami Poszukiwaczy?";
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
	AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_00");	//Czy istnieje jakiœ skuteczny sposób obrony przed mentalnymi atakami Poszukiwaczy?
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_01");	//Tak. S¹dzê, ¿e amulet zrobiony z kamienia z b³ogos³awionej ziemi mo¿e zapewniæ tak¹ ochronê.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_02");	//Niestety, nie mam akurat ¿adnego pod rêk¹.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_03");	//Niektóre nasze kapliczki zosta³y wybudowane z takich w³aœnie kamieni.
		AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_04");	//Dobrze, spróbujê zdobyæ jeden z nich.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_05");	//Tak, to dobry pomys³. Pamiêtaj tylko, ¿eby nie zniszczyæ przy tym kapliczki, rozumiemy siê?
		b_logentry(TOPIC_DEMENTOREN,"Karras mo¿e mi zapewniæ ochronê przeciwko mentalnym atakom Poszukiwaczy. Potrzebuje do tego celu kamienia ze œwiêtej ziemi - takiego, z którego zrobione s¹ niektóre kapliczki.");
		MIS_KARRAS_FINDBLESSEDSTONE = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_06");	//Nie mam pojêcia. Wci¹¿ jeszcze brakuje mi wiedzy na ten temat. Wróæ póŸniej, mo¿e bêdê ju¿ coœ wiedzia³.
	};
};


instance DIA_KARRAS_KARRASBLESSEDSTONE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_karrasblessedstone_condition;
	information = dia_karras_karrasblessedstone_info;
	description = "Mam tutaj kamieñ z b³ogos³awionej ziemi.";
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
	AI_Output(other,self,"DIA_Karras_KarrasBlessedStone_15_00");	//Mam tutaj kamieñ z b³ogos³awionej ziemi.
	b_giveinvitems(other,self,itmi_karrasblessedstone_mis,1);
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_01");	//Dobrze. Mam nadziejê, ¿e ¿adna z kapliczek na tym nie ucierpia³a.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_02");	//Dobrze. Sporz¹dzê z niego ochronny amulet, który bêdzie ciê strzeg³ przed mrocznym spojrzeniem Poszukiwaczy.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_03");	//Daj mi trochê czasu. Niezw³ocznie przyst¹piê do pracy.
	KARRASMAKESBLESSEDSTONE_DAY = Wld_GetDay();
	MIS_KARRAS_FINDBLESSEDSTONE = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Karras da³ mi amulet, który ochroni mnie przed mentalnymi atakami Poszukiwaczy. To powinno mi trochê u³atwiæ ¿ycie.");
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
	description = "Co z ochronnym amuletem, który mi obieca³eœ?";
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
	AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00");	//Co z ochronnym amuletem, który mi obieca³eœ?
	if(KARRASMAKESBLESSEDSTONE_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01");	//W³aœnie go skoñczy³em. Proszê, oto on. Czy¿ nie jest piêkny?
		CreateInvItems(self,itam_prot_blackeye_mis,1);
		b_giveinvitems(self,other,itam_prot_blackeye_mis,1);
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02");	//Miej go zawsze przy sobie, a Poszukiwacze nie bêd¹ mogli wnikn¹æ w twój umys³.
		AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03");	//Dziêkujê.
		b_logentry(TOPIC_DEMENTOREN,"Karras da³ mi amulet, który ochroni mnie przez mrocznym spojrzeniem Poszukiwaczy.");
		DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04");	//Cierpliwoœci. Wci¹¿ jeszcze nad nim pracujê.
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

