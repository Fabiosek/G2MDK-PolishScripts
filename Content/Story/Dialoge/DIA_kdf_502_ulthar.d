
instance DIA_ULTHAR_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_exit_condition;
	information = dia_ulthar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_GREET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_greet_condition;
	information = dia_ulthar_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulthar_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulthar_greet_info()
{
	AI_Output(self,other,"DIA_Ulthar_GREET_05_00");	//Sp�jrzcie, kolejny nowicjusz staje przed Najwy�sz� Rad�. Niech Innos b�dzie z tob�, synu.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_01");	//Czym dok�adnie zajmuje si� Najwy�sza Rada?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_02");	//Naszym zadaniem jest g�oszenie woli Innosa. Dlatego w�a�nie wyznaczamy wybra�c�w, kt�rzy zostan� poddani Pr�bie Magii.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_03");	//Cho� �yjemy w odosobnieniu, nasze oczy spogl�daj� na �wiat i jego problemy. Ko�ci� Innosa jest najwy�sz� instancj� ziemskiego prawa.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_04");	//Ach, wi�c interesuje was to, co si� dzieje na �wiecie...
	AI_Output(other,self,"DIA_Ulthar_GREET_15_05");	//Je�li tak, to co my�licie o smokach gromadz�cych si� w G�rniczej Dolinie i ich coraz pot�niejszej armii?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_06");	//Rozumiem twoje rozgoryczenie, jednak ka�da z naszych decyzji musi by� dok�adnie przemy�lana.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_07");	//Je�li damy si� ponie�� emocjom, nic nie zdzia�amy. Dlatego ty zajmij si� swoimi zadaniami, a my w tym czasie znajdziemy najlepsze wyj�cie z sytuacji.
};


instance DIA_ULTHAR_MAGETEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_magetest_condition;
	information = dia_ulthar_magetest_info;
	description = "Opowiedz mi prosz� o Pr�bie Magii.";
};


func int dia_ulthar_magetest_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_greet))
	{
		return TRUE;
	};
};

func void dia_ulthar_magetest_info()
{
	AI_Output(other,self,"DIA_Ulthar_MAGETEST_15_00");	//Opowiedz mi prosz� o Pr�bie Magii.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_01");	//Dzi�ki niej wybrani nowicjusze mog� sta� si� pe�noprawnymi cz�onkami gildii mag�w. Jednak tylko jeden z nich mo�e j� przej��.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_02");	//Wybra�cy, kt�rzy wezm� udzia� w Pr�bie, wyznaczani s� przez Innosa.
};


instance DIA_ULTHAR_WHEN(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 3;
	condition = dia_ulthar_when_condition;
	information = dia_ulthar_when_info;
	permanent = TRUE;
	description = "Kiedy odb�dzie si� Pr�ba?";
};


func int dia_ulthar_when_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_magetest) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulthar_when_info()
{
	AI_Output(other,self,"DIA_Ulthar_WHEN_15_00");	//Kiedy odb�dzie si� Pr�ba?
	AI_Output(self,other,"DIA_Ulthar_WHEN_05_01");	//Gdy dostajemy sygna� od Innosa, informujemy wybranych nowicjuszy, �e nadszed� czas Pr�by.
};


instance DIA_ULTHAR_TEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_test_condition;
	information = dia_ulthar_test_info;
	permanent = FALSE;
	description = "Mistrzu, jestem got�w podda� si� Pr�bie.";
};


func int dia_ulthar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire))
	{
		return TRUE;
	};
};

func void dia_ulthar_test_info()
{
	AI_Output(other,self,"DIA_Ulthar_TEST_15_00");	//Mistrzu, jestem got�w podda� si� Pr�bie.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_01");	//Nie dziwi mnie, �e znasz stare prawo.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_02");	//Ale ostrzegam, bierzesz na siebie wielki ci�ar! Zapami�taj, �e niecierpliwy umys� nie zdo�a przetrwa� Pr�by Ognia.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_03");	//Od dawna ju� nikt nie poddawa� si� Pr�bie. Za� prze�y� j� tylko jeden cz�owiek.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_04");	//By� nim m�ody, ambitny nowicjusz, Serpentes. Wiele lat po tym wydarzeniu zosta� cz�onkiem Najwy�szej Rady.
	AI_Output(other,self,"DIA_Ulthar_TEST_15_05");	//Nied�ugo nie b�dzie jedynym, kt�remu uda�o si� przej�� pr�b�.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_06");	//Nie b�d� d�u�ej trzyma� ci� w niepewno�ci. Oto twoje zadanie:
	AI_Output(self,other,"DIA_Ulthar_TEST_05_07");	//Stw�rz run� ognistej strza�y. To wszystko - niech Innos ci� prowadzi.
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RUNE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUNE,LOG_RUNNING);
	b_logentry(TOPIC_RUNE,"Ulthar zleci� mi zadanie. Mam stworzy� run� ognistej strza�y.");
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_RUNNING(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_running_condition;
	information = dia_ulthar_running_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_ulthar_running_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (Npc_HasItems(other,itru_firebolt) == 0))
	{
		return TRUE;
	};
};

func void dia_ulthar_running_info()
{
	AI_Output(self,other,"DIA_Ulthar_RUNNING_05_00");	//Znasz ju� swe zadanie. Bierz si� do pracy.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SUCCESS(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_success_condition;
	information = dia_ulthar_success_info;
	permanent = FALSE;
	description = "Uda�o mi si� stworzy� run�.";
};


func int dia_ulthar_success_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(hero,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulthar_success_info()
{
	AI_Output(other,self,"DIA_Ulthar_SUCCESS_15_00");	//Uda�o mi si� stworzy� run�.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_01");	//Dobra robota, nowicjuszu. Zatrzymaj j�, to twoja pierwsza runa.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_02");	//Kiedy osi�gniesz pierwszy Kr�g Ognia, b�dziesz m�g� jej u�ywa�.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_03");	//Ku mojej rado�ci uda�o ci si� przej�� pr�b�!
	if((MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_04");	//Wci�� jednak masz do wykonania zlecone ci przez Serpentesa zadanie.
	};
	MIS_RUNE = LOG_SUCCESS;
	b_giveplayerxp(XP_RUNE);
};


instance DIA_ULTHAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap3_exit_condition;
	information = dia_ulthar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PERMABKAP3(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 99;
	condition = dia_ulthar_permabkap3_condition;
	information = dia_ulthar_permabkap3_info;
	permanent = TRUE;
	description = "Jakie� wie�ci?";
};


func int dia_ulthar_permabkap3_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_ulthar_success))
	{
		return TRUE;
	};
};

func void dia_ulthar_permabkap3_info()
{
	AI_Output(other,self,"DIA_Ulthar_PermAbKap3_15_00");	//Jakie� wie�ci?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_01");	//Nie w tej chwili. Id�, prosz�, i zajmij si� swoimi zadaniami, masz jeszcze wiele do zrobienia.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_02");	//Nie. Nic, czym nale�a�oby si� przejmowa�.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEVERGIFTET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinevergiftet_condition;
	information = dia_ulthar_schreinevergiftet_info;
	important = TRUE;
};


func int dia_ulthar_schreinevergiftet_condition()
{
	if(PEDRO_TRAITOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinevergiftet_info()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_00");	//Jest co� jeszcze. Wr�g zbezcze�ci� kilka przydro�nych kapliczek Innosa. Straci�y sw� magiczn� moc.
		AI_Output(other,self,"DIA_Ulthar_SCHREINEVERGIFTET_15_01");	//Rozumiem, i co w zwi�zku z tym?
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_02");	//Twoim zadaniem b�dzie oczy�ci� je, zanim problem stanie si� naprawd� powa�ny.
		CreateInvItems(self,itmi_ultharsholywater_mis,1);
		b_giveinvitems(self,other,itmi_ultharsholywater_mis,1);
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_03");	//We� t� wod� �wi�con� i wlej do ka�dej z kapliczek po kilka kropli.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_04");	//Dzi�ki �wi�tym s�owom oczyszczenia kapliczki powinny odzyska� sw� dawn� moc.
		if(Npc_HasItems(other,itwr_map_shrine_mis) == FALSE)
		{
			if(Npc_HasItems(gorax,itwr_map_shrine_mis) && (Npc_IsDead(gorax) == FALSE))
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_05");	//Gorax sprzeda ci map�, na kt�rej zaznaczono odpowiednie kapliczki.
			}
			else
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_06");	//Oto twoja mapa. Te z kapliczek, kt�re wymagaj� oczyszczenia, s� na niej odpowiednio zaznaczone.
				CreateInvItems(self,itwr_map_shrine_mis,1);
				b_giveinvitems(self,other,itwr_map_shrine_mis,1);
			};
		};
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_07");	//Teraz id� i bierz si� do pracy.
		MIS_ULTHAR_HEILESCHREINE_PAL = LOG_RUNNING;
		Log_CreateTopic(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_RUNNING);
		b_logentry(TOPIC_ULTHAR_HEILESCHREINE_PAL,"Ulthar da� mi wod� �wi�con� i kaza� przy jej pomocy oczy�ci� wszystkie zbezczeszczone przez wroga kapliczki.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_08");	//Jeszcze jedno. Trzymaj si� z dala od przydro�nych kapliczek. Dosz�y nas wie�ci o tym, jakoby zosta�y one zbezczeszczone.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_09");	//Trudno przewidzie�, czym sko�czy�oby si� skorzystanie z ich mocy.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_10");	//Ten problem jednak nie powinien ci� interesowa�, to zadanie dla paladyn�w.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ULTHAR_SCHREINEGEHEILT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheilt_condition;
	information = dia_ulthar_schreinegeheilt_info;
	description = "Uda�o mi si� oczy�ci� wszystkie kapliczki.";
};


func int dia_ulthar_schreinegeheilt_condition()
{
	if(MIS_ULTHAR_HEILESCHREINE_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheilt_info()
{
	AI_Output(other,self,"DIA_Ulthar_SchreineGeheilt_15_00");	//Uda�o mi si� oczy�ci� wszystkie kapliczki.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_01");	//�wietna robota. Jestem z ciebie dumny, moje dziecko. Niech Innos ci� b�ogos�awi.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_02");	//W podzi�ce we� ten amulet si�y. Jestem pewien, �e oka�e si� pomocny w walce z wrogiem.
	CreateInvItems(self,itam_dex_strg_01,1);
	b_giveinvitems(self,other,itam_dex_strg_01,1);
	b_giveplayerxp(XP_ULTHAR_SCHREINEGEREINIGT);
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap4_exit_condition;
	information = dia_ulthar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEGEHEILTNOPAL(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheiltnopal_condition;
	information = dia_ulthar_schreinegeheiltnopal_info;
	important = TRUE;
};


func int dia_ulthar_schreinegeheiltnopal_condition()
{
	if(((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheiltnopal_info()
{
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_00");	//Mam dobre wie�ci. Przydro�ne kapliczki zosta�y oczyszczone. Pot�ga Innosa pomog�a paladynom raz na zawsze upora� si� z tym problemem.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_01");	//Znowu mo�esz czci� Innosa datkami i modlitw� bez strachu o swe bezpiecze�stwo.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap5_exit_condition;
	information = dia_ulthar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap6_exit_condition;
	information = dia_ulthar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PICKPOCKET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 900;
	condition = dia_ulthar_pickpocket_condition;
	information = dia_ulthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ulthar_pickpocket_condition()
{
	return c_beklauen(74,320);
};

func void dia_ulthar_pickpocket_info()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_BACK,dia_ulthar_pickpocket_back);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_PICKPOCKET,dia_ulthar_pickpocket_doit);
};

func void dia_ulthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulthar_pickpocket);
};

func void dia_ulthar_pickpocket_back()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
};

