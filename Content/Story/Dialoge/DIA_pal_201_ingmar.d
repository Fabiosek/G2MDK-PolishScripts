
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
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//Z otrzymanych przeze mnie raport�w wynika, �e G�rnicza Dolina to niebezpieczne miejsce.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Pami�taj, aby zabra� ze sob� odpowiednie wyposa�enie.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//Sytuacja w G�rniczej Dolinie jest do�� niepokoj�ca. Potrzebny nam plan, dzi�ki kt�remu za�egnane zostanie niebezpiecze�stwo, a nasi ch�opcy wr�c� do domu wraz z wydobyt� rud�.
		DIA_INGMAR_HALLO_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//S�dzi�em, �e przyszed�e� porozmawia� z Lordem Hagenem. Na co czekasz?
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
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//Jeszcze nie wygrali�my wojny, chocia� kr�lewska armia zmusi�a ork�w do odwrotu.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//Wci�� jednak musimy stawia� czo�a niewielkim grupom naje�d�c�w.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//Te stworzenia nie znaj� honoru ani wiary - dlatego wierz� w nasze ostateczne zwyci�stwo.
};


instance DIA_INGMAR_CANTEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 100;
	condition = dia_ingmar_canteach_condition;
	information = dia_ingmar_canteach_info;
	permanent = TRUE;
	description = "Mo�esz mnie przeszkoli�?";
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
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//B�dziesz moim nauczycielem?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//Mog� nauczy� ci� specjalnych metod treningowych, dzi�ki kt�rym wzro�nie twoja bieg�o�� w pos�ugiwaniu si� r�nymi rodzajami or�a.
		INGMAR_TEACHSTR = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladyn Igmar mo�e mi pokaza�, jak sta� si� silniejszym.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//Ucz� tylko cz�onk�w naszego Zakonu.
	};
};


instance DIA_INGMAR_TEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 6;
	condition = dia_ingmar_teach_condition;
	information = dia_ingmar_teach_info;
	permanent = TRUE;
	description = "Chc� by� silniejszy.";
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
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Chc� by� silniejszy.
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_MAX)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//Jeste� silny niczym troll, nie potrzebujesz ju� treningu.
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
	description = "Orkowie planuj� ogromny atak.";
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
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//Orkowie planuj� ogromny atak.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//Doprawdy? Bardzo interesuj�ce. A sk�d niby o tym wiesz?
	if(TALKEDTO_ANTIPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//Rozmawia�em z nimi.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Niekt�rzy z ich przyw�dc�w grasuj� w tej okolicy.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Hm. Nie wygl�da mi to na typow� strategi� ork�w.
	Info_ClearChoices(dia_ingmar_orkelite);
	Info_AddChoice(dia_ingmar_orkelite,"Lepiej wymy�l, jak si� ich pozby�.",dia_ingmar_orkelite_loswerden);
	Info_AddChoice(dia_ingmar_orkelite,"Co teraz zrobimy?",dia_ingmar_orkelite_wastun);
	Info_AddChoice(dia_ingmar_orkelite,"Co masz na my�li?",dia_ingmar_orkelite_wieso);
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Ingmara bardzo zainteresowa�a historia o przyw�dcy herszt�w ork�w.");
	MIS_KILLORKOBERST = LOG_RUNNING;
};

func void dia_ingmar_orkelite_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//Lepiej wymy�l, jak si� ich pozby�.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//Gdyby�my mieli wi�cej informacji... Wy�l� kogo� na zwiady.
	Info_ClearChoices(dia_ingmar_orkelite);
};

func void dia_ingmar_orkelite_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//Co to oznacza?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//A je�li m�wisz prawd�, oznacza to, �e pr�buj� nas najpierw os�abi�, wysy�aj�c tu swoich najlepszych wojownik�w.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Przewa�nie jeden dow�dca prowadzi ca�� hord� orkowych wojownik�w. Zwykle nie spotyka si� ich w grupach.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//Taka strategia ma swoje uzasadnienie - przyw�dcy stanowi� rdze� si� szturmowych i zwykle s� otoczeni kordonem wojownik�w.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Dlatego, aby si� do nich zbli�y�, trzeba pokona� przynajmniej 30 wojownik�w.
	b_logentry(TOPIC_ORCELITE,"Ingmar wspomina� co� o przyw�dcy herszt�w ork�w.");
};

func void dia_ingmar_orkelite_wastun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//Co teraz zrobimy?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//Kiedy pojawiaj� si� w takiej liczbie, to przewa�nie tworz� patrol prowadzony przez najwy�szego rang� przyw�dc�.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//Herszt zak�ada siedzib� i wycofuje si� do jakiej� jaskini, z kt�rej wydaje rozkazy swoim oddzia�om.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//Gdyby uda�o nam si� schwyta� tego przyw�dc�, zyskaliby�my ogromn� przewag�.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//Orkowi przyw�dcy lubi� przebywa� blisko wroga. Jego jaskini nale�y zatem szuka� gdzie� w pobli�u miasta.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//W pobli�u farmy Lobarta zauwa�ono kilku ork�w. Mo�e w�a�nie tam nale�a�oby rozpocz�� poszukiwania.
	b_logentry(TOPIC_ORCELITE,"Ingmar s�dzi, �e orkowy przyw�dca przebywa prawdopodobnie w jaskini gdzie� w pobli�u farmy Lobarta. Ingmar chce, abym go odnalaz� i pokona�.");
	Info_ClearChoices(dia_ingmar_orkelite);
};


instance DIA_INGMAR_HAUPTQUARTIER(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 41;
	condition = dia_ingmar_hauptquartier_condition;
	information = dia_ingmar_hauptquartier_info;
	permanent = FALSE;
	description = "Uda�o mi si� odnale�� siedzib� ork�w.";
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
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//Uda�o mi si� odnale�� siedzib� ork�w. Ich herszt poleg� w walce.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//To wspania�a wiadomo��. Przez jaki� czas w szeregach wroga zapanuje chaos.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//Musz� przyzna�, �e nie�le si� spisa�e�. Gdyby�my mieli wi�cej rycerzy takich jak ty, nadchodz�ca bitwa by�aby dla nas bu�k� z mas�em.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//Prosz�, we� to z�oto i kup sobie za nie troch� ekwipunku.
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
	description = "(Kradzie� tego zwoju graniczy z cudem)";
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

