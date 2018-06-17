
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
	AI_Output(self,other,"DIA_Ulthar_GREET_05_00");	//Spójrzcie, kolejny nowicjusz staje przed Najwy¿sz¹ Rad¹. Niech Innos bêdzie z tob¹, synu.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_01");	//Czym dok³adnie zajmuje siê Najwy¿sza Rada?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_02");	//Naszym zadaniem jest g³oszenie woli Innosa. Dlatego w³aœnie wyznaczamy wybrañców, którzy zostan¹ poddani Próbie Magii.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_03");	//Choæ ¿yjemy w odosobnieniu, nasze oczy spogl¹daj¹ na œwiat i jego problemy. Koœció³ Innosa jest najwy¿sz¹ instancj¹ ziemskiego prawa.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_04");	//Ach, wiêc interesuje was to, co siê dzieje na œwiecie...
	AI_Output(other,self,"DIA_Ulthar_GREET_15_05");	//Jeœli tak, to co myœlicie o smokach gromadz¹cych siê w Górniczej Dolinie i ich coraz potê¿niejszej armii?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_06");	//Rozumiem twoje rozgoryczenie, jednak ka¿da z naszych decyzji musi byæ dok³adnie przemyœlana.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_07");	//Jeœli damy siê ponieœæ emocjom, nic nie zdzia³amy. Dlatego ty zajmij siê swoimi zadaniami, a my w tym czasie znajdziemy najlepsze wyjœcie z sytuacji.
};


instance DIA_ULTHAR_MAGETEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_magetest_condition;
	information = dia_ulthar_magetest_info;
	description = "Opowiedz mi proszê o Próbie Magii.";
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
	AI_Output(other,self,"DIA_Ulthar_MAGETEST_15_00");	//Opowiedz mi proszê o Próbie Magii.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_01");	//Dziêki niej wybrani nowicjusze mog¹ staæ siê pe³noprawnymi cz³onkami gildii magów. Jednak tylko jeden z nich mo¿e j¹ przejœæ.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_02");	//Wybrañcy, którzy wezm¹ udzia³ w Próbie, wyznaczani s¹ przez Innosa.
};


instance DIA_ULTHAR_WHEN(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 3;
	condition = dia_ulthar_when_condition;
	information = dia_ulthar_when_info;
	permanent = TRUE;
	description = "Kiedy odbêdzie siê Próba?";
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
	AI_Output(other,self,"DIA_Ulthar_WHEN_15_00");	//Kiedy odbêdzie siê Próba?
	AI_Output(self,other,"DIA_Ulthar_WHEN_05_01");	//Gdy dostajemy sygna³ od Innosa, informujemy wybranych nowicjuszy, ¿e nadszed³ czas Próby.
};


instance DIA_ULTHAR_TEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_test_condition;
	information = dia_ulthar_test_info;
	permanent = FALSE;
	description = "Mistrzu, jestem gotów poddaæ siê Próbie.";
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
	AI_Output(other,self,"DIA_Ulthar_TEST_15_00");	//Mistrzu, jestem gotów poddaæ siê Próbie.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_01");	//Nie dziwi mnie, ¿e znasz stare prawo.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_02");	//Ale ostrzegam, bierzesz na siebie wielki ciê¿ar! Zapamiêtaj, ¿e niecierpliwy umys³ nie zdo³a przetrwaæ Próby Ognia.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_03");	//Od dawna ju¿ nikt nie poddawa³ siê Próbie. Zaœ prze¿y³ j¹ tylko jeden cz³owiek.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_04");	//By³ nim m³ody, ambitny nowicjusz, Serpentes. Wiele lat po tym wydarzeniu zosta³ cz³onkiem Najwy¿szej Rady.
	AI_Output(other,self,"DIA_Ulthar_TEST_15_05");	//Nied³ugo nie bêdzie jedynym, któremu uda³o siê przejœæ próbê.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_06");	//Nie bêdê d³u¿ej trzyma³ ciê w niepewnoœci. Oto twoje zadanie:
	AI_Output(self,other,"DIA_Ulthar_TEST_05_07");	//Stwórz runê ognistej strza³y. To wszystko - niech Innos ciê prowadzi.
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RUNE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUNE,LOG_RUNNING);
	b_logentry(TOPIC_RUNE,"Ulthar zleci³ mi zadanie. Mam stworzyæ runê ognistej strza³y.");
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
	AI_Output(self,other,"DIA_Ulthar_RUNNING_05_00");	//Znasz ju¿ swe zadanie. Bierz siê do pracy.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SUCCESS(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_success_condition;
	information = dia_ulthar_success_info;
	permanent = FALSE;
	description = "Uda³o mi siê stworzyæ runê.";
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
	AI_Output(other,self,"DIA_Ulthar_SUCCESS_15_00");	//Uda³o mi siê stworzyæ runê.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_01");	//Dobra robota, nowicjuszu. Zatrzymaj j¹, to twoja pierwsza runa.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_02");	//Kiedy osi¹gniesz pierwszy Kr¹g Ognia, bêdziesz móg³ jej u¿ywaæ.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_03");	//Ku mojej radoœci uda³o ci siê przejœæ próbê!
	if((MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_04");	//Wci¹¿ jednak masz do wykonania zlecone ci przez Serpentesa zadanie.
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
	description = "Jakieœ wieœci?";
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
	AI_Output(other,self,"DIA_Ulthar_PermAbKap3_15_00");	//Jakieœ wieœci?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_01");	//Nie w tej chwili. IdŸ, proszê, i zajmij siê swoimi zadaniami, masz jeszcze wiele do zrobienia.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_02");	//Nie. Nic, czym nale¿a³oby siê przejmowaæ.
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
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_00");	//Jest coœ jeszcze. Wróg zbezczeœci³ kilka przydro¿nych kapliczek Innosa. Straci³y sw¹ magiczn¹ moc.
		AI_Output(other,self,"DIA_Ulthar_SCHREINEVERGIFTET_15_01");	//Rozumiem, i co w zwi¹zku z tym?
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_02");	//Twoim zadaniem bêdzie oczyœciæ je, zanim problem stanie siê naprawdê powa¿ny.
		CreateInvItems(self,itmi_ultharsholywater_mis,1);
		b_giveinvitems(self,other,itmi_ultharsholywater_mis,1);
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_03");	//WeŸ tê wodê œwiêcon¹ i wlej do ka¿dej z kapliczek po kilka kropli.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_04");	//Dziêki œwiêtym s³owom oczyszczenia kapliczki powinny odzyskaæ sw¹ dawn¹ moc.
		if(Npc_HasItems(other,itwr_map_shrine_mis) == FALSE)
		{
			if(Npc_HasItems(gorax,itwr_map_shrine_mis) && (Npc_IsDead(gorax) == FALSE))
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_05");	//Gorax sprzeda ci mapê, na której zaznaczono odpowiednie kapliczki.
			}
			else
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_06");	//Oto twoja mapa. Te z kapliczek, które wymagaj¹ oczyszczenia, s¹ na niej odpowiednio zaznaczone.
				CreateInvItems(self,itwr_map_shrine_mis,1);
				b_giveinvitems(self,other,itwr_map_shrine_mis,1);
			};
		};
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_07");	//Teraz idŸ i bierz siê do pracy.
		MIS_ULTHAR_HEILESCHREINE_PAL = LOG_RUNNING;
		Log_CreateTopic(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_RUNNING);
		b_logentry(TOPIC_ULTHAR_HEILESCHREINE_PAL,"Ulthar da³ mi wodê œwiêcon¹ i kaza³ przy jej pomocy oczyœciæ wszystkie zbezczeszczone przez wroga kapliczki.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_08");	//Jeszcze jedno. Trzymaj siê z dala od przydro¿nych kapliczek. Dosz³y nas wieœci o tym, jakoby zosta³y one zbezczeszczone.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_09");	//Trudno przewidzieæ, czym skoñczy³oby siê skorzystanie z ich mocy.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_10");	//Ten problem jednak nie powinien ciê interesowaæ, to zadanie dla paladynów.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ULTHAR_SCHREINEGEHEILT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheilt_condition;
	information = dia_ulthar_schreinegeheilt_info;
	description = "Uda³o mi siê oczyœciæ wszystkie kapliczki.";
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
	AI_Output(other,self,"DIA_Ulthar_SchreineGeheilt_15_00");	//Uda³o mi siê oczyœciæ wszystkie kapliczki.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_01");	//Œwietna robota. Jestem z ciebie dumny, moje dziecko. Niech Innos ciê b³ogos³awi.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_02");	//W podziêce weŸ ten amulet si³y. Jestem pewien, ¿e oka¿e siê pomocny w walce z wrogiem.
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
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_00");	//Mam dobre wieœci. Przydro¿ne kapliczki zosta³y oczyszczone. Potêga Innosa pomog³a paladynom raz na zawsze uporaæ siê z tym problemem.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_01");	//Znowu mo¿esz czciæ Innosa datkami i modlitw¹ bez strachu o swe bezpieczeñstwo.
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

