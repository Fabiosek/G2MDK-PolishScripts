
instance DIA_INGMAR_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_exit_condition;
	information = dia_ingmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_HALLO(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 2;
	condition = dia_ingmar_hallo_condition;
	information = dia_ingmar_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ingmar_hallo_permanent;

func int dia_ingmar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_INGMAR_HALLO_PERMANENT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_ingmar_hallo_info()
{
	if((ENTEROW_KAPITEL2 == FALSE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//Z otrzymanych przeze mnie raportów wynika, ¿e Górnicza Dolina to niebezpieczne miejsce.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Pamiêtaj, aby zabraæ ze sob¹ odpowiednie wyposa¿enie.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//Sytuacja w Górniczej Dolinie jest doœæ niepokoj¹ca. Potrzebny nam plan, dziêki któremu za¿egnane zostanie niebezpieczeñstwo, a nasi ch³opcy wróc¹ do domu wraz z wydobyt¹ rud¹.
		DIA_INGMAR_HALLO_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//S¹dzi³em, ¿e przyszed³eœ porozmawiaæ z Lordem Hagenem. Na co czekasz?
	};
};


instance DIA_INGMAR_KRIEG(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 99;
	condition = dia_ingmar_krieg_condition;
	information = dia_ingmar_krieg_info;
	permanent = FALSE;
	description = "Jak sytuacja na kontynencie?";
};


func int dia_ingmar_krieg_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ingmar_krieg_info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//Jak sytuacja na kontynencie?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//Jeszcze nie wygraliœmy wojny, chocia¿ królewska armia zmusi³a orków do odwrotu.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//Wci¹¿ jednak musimy stawiaæ czo³a niewielkim grupom najeŸdŸców.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//Te stworzenia nie znaj¹ honoru ani wiary - dlatego wierzê w nasze ostateczne zwyciêstwo.
};


instance DIA_INGMAR_CANTEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 100;
	condition = dia_ingmar_canteach_condition;
	information = dia_ingmar_canteach_info;
	permanent = TRUE;
	description = "Mo¿esz mnie przeszkoliæ?";
};


func int dia_ingmar_canteach_condition()
{
	if(INGMAR_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_ingmar_canteach_info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//Bêdziesz moim nauczycielem?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//Mogê nauczyæ ciê specjalnych metod treningowych, dziêki którym wzroœnie twoja bieg³oœæ w pos³ugiwaniu siê ró¿nymi rodzajami orê¿a.
		INGMAR_TEACHSTR = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladyn Igmar mo¿e mi pokazaæ, jak staæ siê silniejszym.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//Uczê tylko cz³onków naszego Zakonu.
	};
};


instance DIA_INGMAR_TEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 6;
	condition = dia_ingmar_teach_condition;
	information = dia_ingmar_teach_info;
	permanent = TRUE;
	description = "Chcê byæ silniejszy.";
};


func int dia_ingmar_teach_condition()
{
	if(INGMAR_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ingmar_teach_info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Chcê byæ silniejszy.
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_MAX)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//Jesteœ silny niczym troll, nie potrzebujesz ju¿ treningu.
	};
	Info_ClearChoices(dia_ingmar_teach);
};

func void dia_ingmar_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};


instance DIA_INGMAR_KAP3_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap3_exit_condition;
	information = dia_ingmar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP4_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap4_exit_condition;
	information = dia_ingmar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_ORKELITE(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 40;
	condition = dia_ingmar_orkelite_condition;
	information = dia_ingmar_orkelite_info;
	description = "Orkowie planuj¹ ogromny atak.";
};


func int dia_ingmar_orkelite_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering) || (HAGEN_SAWORCRING == TRUE)) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ingmar_orkelite_info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//Orkowie planuj¹ ogromny atak.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//Doprawdy? Bardzo interesuj¹ce. A sk¹d niby o tym wiesz?
	if(TALKEDTO_ANTIPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//Rozmawia³em z nimi.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Niektórzy z ich przywódców grasuj¹ w tej okolicy.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Hm. Nie wygl¹da mi to na typow¹ strategiê orków.
	Info_ClearChoices(dia_ingmar_orkelite);
	Info_AddChoice(dia_ingmar_orkelite,"Lepiej wymyœl, jak siê ich pozbyæ.",dia_ingmar_orkelite_loswerden);
	Info_AddChoice(dia_ingmar_orkelite,"Co teraz zrobimy?",dia_ingmar_orkelite_wastun);
	Info_AddChoice(dia_ingmar_orkelite,"Co masz na myœli?",dia_ingmar_orkelite_wieso);
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Ingmara bardzo zainteresowa³a historia o przywódcy hersztów orków.");
	MIS_KILLORKOBERST = LOG_RUNNING;
};

func void dia_ingmar_orkelite_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//Lepiej wymyœl, jak siê ich pozbyæ.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//Gdybyœmy mieli wiêcej informacji... Wyœlê kogoœ na zwiady.
	Info_ClearChoices(dia_ingmar_orkelite);
};

func void dia_ingmar_orkelite_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//Co to oznacza?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//A jeœli mówisz prawdê, oznacza to, ¿e próbuj¹ nas najpierw os³abiæ, wysy³aj¹c tu swoich najlepszych wojowników.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Przewa¿nie jeden dowódca prowadzi ca³¹ hordê orkowych wojowników. Zwykle nie spotyka siê ich w grupach.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//Taka strategia ma swoje uzasadnienie - przywódcy stanowi¹ rdzeñ si³ szturmowych i zwykle s¹ otoczeni kordonem wojowników.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Dlatego, aby siê do nich zbli¿yæ, trzeba pokonaæ przynajmniej 30 wojowników.
	b_logentry(TOPIC_ORCELITE,"Ingmar wspomina³ coœ o przywódcy hersztów orków.");
};

func void dia_ingmar_orkelite_wastun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//Co teraz zrobimy?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//Kiedy pojawiaj¹ siê w takiej liczbie, to przewa¿nie tworz¹ patrol prowadzony przez najwy¿szego rang¹ przywódcê.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//Herszt zak³ada siedzibê i wycofuje siê do jakiejœ jaskini, z której wydaje rozkazy swoim oddzia³om.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//Gdyby uda³o nam siê schwytaæ tego przywódcê, zyskalibyœmy ogromn¹ przewagê.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//Orkowi przywódcy lubi¹ przebywaæ blisko wroga. Jego jaskini nale¿y zatem szukaæ gdzieœ w pobli¿u miasta.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//W pobli¿u farmy Lobarta zauwa¿ono kilku orków. Mo¿e w³aœnie tam nale¿a³oby rozpocz¹æ poszukiwania.
	b_logentry(TOPIC_ORCELITE,"Ingmar s¹dzi, ¿e orkowy przywódca przebywa prawdopodobnie w jaskini gdzieœ w pobli¿u farmy Lobarta. Ingmar chce, abym go odnalaz³ i pokona³.");
	Info_ClearChoices(dia_ingmar_orkelite);
};


instance DIA_INGMAR_HAUPTQUARTIER(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 41;
	condition = dia_ingmar_hauptquartier_condition;
	information = dia_ingmar_hauptquartier_info;
	permanent = FALSE;
	description = "Uda³o mi siê odnaleŸæ siedzibê orków.";
};


func int dia_ingmar_hauptquartier_condition()
{
	if(Npc_IsDead(orkelite_antipaladinorkoberst) && Npc_KnowsInfo(other,dia_ingmar_orkelite))
	{
		return TRUE;
	};
};

func void dia_ingmar_hauptquartier_info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//Uda³o mi siê odnaleŸæ siedzibê orków. Ich herszt poleg³ w walce.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//To wspania³a wiadomoœæ. Przez jakiœ czas w szeregach wroga zapanuje chaos.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//Muszê przyznaæ, ¿e nieŸle siê spisa³eœ. Gdybyœmy mieli wiêcej rycerzy takich jak ty, nadchodz¹ca bitwa by³aby dla nas bu³k¹ z mas³em.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//Proszê, weŸ to z³oto i kup sobie za nie trochê ekwipunku.
	b_giveplayerxp(XP_KILLEDORKOBERST);
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	MIS_KILLORKOBERST = LOG_SUCCESS;
};


instance DIA_INGMAR_KAP5_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap5_exit_condition;
	information = dia_ingmar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP6_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap6_exit_condition;
	information = dia_ingmar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_PICKPOCKET(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 900;
	condition = dia_ingmar_pickpocket_condition;
	information = dia_ingmar_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego zwoju graniczy z cudem)";
};


func int dia_ingmar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (105 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_ingmar_pickpocket_info()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_BACK,dia_ingmar_pickpocket_back);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_PICKPOCKET,dia_ingmar_pickpocket_doit);
};

func void dia_ingmar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 105)
	{
		b_giveinvitems(self,other,itwr_manowar,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_ingmar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_ingmar_pickpocket_back()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
};

