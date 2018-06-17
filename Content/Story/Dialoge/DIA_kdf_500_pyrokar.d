
instance DIA_PYROKAR_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_exit_condition;
	information = dia_pyrokar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_WELCOME(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_welcome_condition;
	information = dia_pyrokar_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pyrokar_welcome_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_welcome_info()
{
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_00");	//A wi�c to ty jeste� tym nowym nowicjuszem. Zak�adam, �e Mistrz Parlan przydzieli� ci ju� jakie� zadanie.
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_01");	//Wiesz przecie�, �e zgodnie z wol� Innosa ka�dy cz�onek naszej spo�eczno�ci musi wype�nia� swoje obowi�zki.
};


instance DIA_PYROKAR_HAGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_hagen_condition;
	information = dia_pyrokar_hagen_info;
	permanent = FALSE;
	description = "Musz� porozmawia� z paladynami. To bardzo wa�ne.";
};


func int dia_pyrokar_hagen_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_pyrokar_hagen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_00");	//Musz� porozmawia� z paladynami. To bardzo wa�ne.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_01");	//Zechciej nam zatem powiedzie�, dlaczego tak ci �pieszno do rozmowy z nimi?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_02");	//Mam dla nich wa�n� wiadomo��.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_03");	//W rzeczy samej? C� to za wiadomo��?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_04");	//W G�rniczej Dolinie zbieraj� si� si�y ciemno�ci prowadzone przez pot�ne smoki. Musimy je powstrzyma�, p�ki jeszcze czas.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_05");	//Hmmm... Rozwa�ymy twoje s�owa, nowicjuszu. Gdy nadejdzie odpowiednia chwila, powiadomimy ci� o naszej decyzji.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_06");	//W mi�dzyczasie wype�niaj sumiennie swoje obowi�zki.
	if(Npc_KnowsInfo(other,dia_pyrokar_auge))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_07");	//Nie chcemy ci� tu d�u�ej zatrzymywa�. Mo�esz ju� odej��.
		AI_StopProcessInfos(self);
	};
};


instance DIA_PYROKAR_AUGE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_auge_condition;
	information = dia_pyrokar_auge_info;
	permanent = FALSE;
	description = "Poszukuj� Oka Innosa.";
};


func int dia_pyrokar_auge_condition()
{
	if((KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_auge_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_00");	//Szukam Oka Innosa.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//Ka�dy, komu wydaje si�, �e mo�e nie tylko odnale��, ale i za�o�y� �wi�ty amulet, jest sko�czonym g�upcem.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_02");	//To amulet wybiera swojego w�a�ciciela. Tylko taka osoba mo�e go nosi�.
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_03");	//Chcia�bym spr�bowa� szcz�cia.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_04");	//Nowicjuszowi przystoi raczej pokora, a nie ch�� posiadania!
	b_logentry(TOPIC_INNOSEYE,"Nie przypuszcza�em, �e b�dzie to takie trudne, jednak Pyrokar nie chce dobrowolnie odda� Oka Innosa.");
	if(Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_05");	//Nie chcemy ci� tu d�u�ej zatrzymywa�. Mo�esz ju� odej��.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_PYROKAR_MISSINGPEOPLE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_addon_pyrokar_missingpeople_condition;
	information = dia_addon_pyrokar_missingpeople_info;
	description = "Kilku mieszka�c�w Khorinis zagin�o w dziwnych okoliczno�ciach.";
};


func int dia_addon_pyrokar_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SKLAVEN_FLUCHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_pyrokar_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_00");	//Kilku mieszka�c�w Khorinis zagin�o w dziwnych okoliczno�ciach.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_01");	//Przykro mi z tego powodu. Doszli�my jednak do wniosku, �e lepiej b�dzie, je�li t� spraw� zajm� si� Magowie Wody.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_02");	//To samo dotyczy badania dziwnych trz�sie� ziemi w p�nocno-wschodnim Khorinis.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_03");	//Do tej pory nic nie sugeruje, aby konieczna by�a nasza interwencja, wi�c nie podejmiemy w tej sprawie �adnych krok�w.
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_04");	//Tak, ale...
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_05");	//Nie ma �adnych ale! B�dziemy post�powa�, jak uznamy za s�uszne. Mam nadziej�, �e zdo�asz uszanowa� nasz� decyzj�.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Magowie Ognia �a�uj� porwanych obywateli, ale m�wi�, �e to zadanie dla Mag�w Wody. Lepiej nie oczekiwa� od nich �adnej pomocy.");
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_PYROKAR_GOAWAY(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_goaway_condition;
	information = dia_pyrokar_goaway_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pyrokar_goaway_condition()
{
	if((Npc_KnowsInfo(hero,dia_addon_pyrokar_missingpeople) == FALSE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_pyrokar_hagen) && Npc_KnowsInfo(hero,dia_pyrokar_auge) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_goaway_info()
{
	AI_Output(self,other,"DIA_Pyrokar_GOAWAY_11_00");	//Pos�usze�stwo jest cnot�, kt�r� wkr�tce posi�dziesz. W ten czy inny spos�b!
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_FIRE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_fire_condition;
	information = dia_pyrokar_fire_info;
	permanent = FALSE;
	description = "Chc� si� podda� Pr�bie Ognia.";
};


func int dia_pyrokar_fire_condition()
{
	if((KNOWS_FIRE_CONTEST == TRUE) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_fire_info()
{
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_00");	//Poddajcie mnie Pr�bie Ognia.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_01");	//A wi�c wiesz o... Chcesz przej�� Pr�b� Ognia, tak?
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_02");	//Tak, Prawo Ognia g�osi, �e...
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_03");	//Znamy Prawo Ognia! Wiemy te�, jak wielu nowicjuszy ginie podczas takiej pr�by. Lepiej dobrze przemy�l swoj� pro�b�.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_04");	//Podj��em decyzj�. Poddam si� tej pr�bie.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_05");	//Je�li naprawd� tego chcesz, Najwy�sza Rada przychyli si� do twojej pro�by.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_06");	//Nalegam, by poddano mnie Pr�bie Ognia.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_07");	//Niech wi�c tak si� stanie! Gdy b�dziesz got�w, ka�dy cz�onek Najwy�szej Rady zleci ci jedno zadanie, kt�re musisz wype�ni�.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_08");	//Niech Innos ulituje si� nad twoj� dusz�.
	b_logentry(TOPIC_FIRECONTEST,"Za��da�em od Pyrokara Pr�by Ognia. Teraz musz� wype�ni� trzy wyznaczone mi przez Najwy�sz� Rad� zadania.");
};


instance DIA_PYROKAR_TEST(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_test_condition;
	information = dia_pyrokar_test_info;
	permanent = FALSE;
	description = "Mistrzu, jestem got�w podda� si� Pr�bie.";
};


func int dia_pyrokar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (MIS_SCHNITZELJAGD == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_test_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_00");	//Chc� si� zmierzy� si� z twoim zadaniem, Mistrzu.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_01");	//Innos jeden wie, czy mu podo�asz... Poddam ci� tej samej pr�bie, kt�r� przechodz� najlepsi z nowicjuszy.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_02");	//B�dzie to Pr�ba Magii. Jak zapewne wiesz, test ten mo�e uko�czy� pomy�lnie tylko JEDEN nowicjusz.
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_03");	//Rozumiem. Kim s� moi rywale?
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_04");	//W swej niezmierzonej m�dro�ci, Innos wskaza� trzech nowicjuszy, kt�rzy wraz z tob� zostan� poddani pr�bie. S� to Agon, Igaraz i Ulf. Oni ju� rozpocz�li poszukiwania.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_05");	//Ale do�� tej rozmowy! Wys�uchaj s��w pr�by: 'Id� za znakami Innosa i przynie� to, co wierz�cy znajduje za �cie�k�'.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_06");	//B�dziesz potrzebowa� tego klucza.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_07");	//To wszystko, co mamy ci do powiedzenia.
	Log_CreateTopic(TOPIC_SCHNITZELJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCHNITZELJAGD,LOG_RUNNING);
	b_logentry(TOPIC_SCHNITZELJAGD,"Pyrokar przygotowuje dla mnie Pr�b� Magii. To ta sama pr�ba, kt�rej zostali poddani nowicjusze Ulf, Igaraz i Agon.");
	b_logentry(TOPIC_SCHNITZELJAGD,"Mam pod��a� za znakami Innosa i przynie�� 'to, co wierz�cy znajdzie za �cie�k�'. Opr�cz tej wskaz�wki dosta�em r�wnie� klucz.");
	CreateInvItems(self,itke_magicchest,1);
	b_giveinvitems(self,other,itke_magicchest,1);
	b_startotherroutine(igaraz,"CONTEST");
	AI_Teleport(igaraz,"NW_TAVERNE_BIGFARM_05");
	CreateInvItems(igaraz,itke_magicchest,1);
	igaraz.aivar[AIV_DROPDEADANDKILL] = TRUE;
	igaraz.aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_startotherroutine(nov607,"EXCHANGE");
	b_startotherroutine(agon,"GOLEMDEAD");
	AI_Teleport(agon,"NW_MAGECAVE_RUNE");
	CreateInvItems(agon,itke_magicchest,1);
	agon.aivar[AIV_DROPDEADANDKILL] = TRUE;
	agon.aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_startotherroutine(ulf,"SUCHE");
	AI_Teleport(ulf,"NW_TROLLAREA_PATH_42");
	CreateInvItems(ulf,itke_magicchest,1);
	ulf.aivar[AIV_DROPDEADANDKILL] = TRUE;
	ulf.aivar[AIV_NEWSOVERRIDE] = TRUE;
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_RUNNING(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 20;
	condition = dia_pyrokar_running_condition;
	information = dia_pyrokar_running_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pyrokar_running_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && Mob_HasItems("MAGICCHEST",itmi_runeblank))
	{
		return TRUE;
	};
};

func void dia_pyrokar_running_info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 0)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_00");	//Dop�ki pr�ba nie dobiegnie ko�ca, nie mamy ci nic wi�cej do powiedzenia.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_01");	//Na co jeszcze czekasz? Id� i zmierz si� ze swoim zadaniem!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_02");	//Nadszed� czas, by poprze� wielkie s�owa wielkimi czynami. Chyba si� ze mn� zgodzisz, nowicjuszu?
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_SUCCESS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_success_condition;
	information = dia_pyrokar_success_info;
	permanent = FALSE;
	description = "Znalaz�em ten kamie� runiczny.";
};


func int dia_pyrokar_success_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (hero.guild == GIL_NOV) && !Mob_HasItems("MAGICCHEST",itmi_runeblank) && ((Npc_HasItems(other,itmi_runeblank) >= 1) || (Npc_HasItems(other,itru_firebolt) >= 1)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_success_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_00");	//Znalaz�em ten kamie� runiczny.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01");	//Niesamowite... uda�o ci si�! Poszed�e� za znakami i odnalaz�e� ukryty portal...
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_02");	//...pokonuj�c przy okazji stado potwor�w, kt�re planowa�y zje�� mnie na kolacj�, tak.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_03");	//A inni nowicjusze? Co z Agonem? Mo�e wype�nili zadanie przed tob�?
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_04");	//Wszyscy zawiedli. Wida� nie by�o im s�dzone przej�cie tej pr�by.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_05");	//C�, og�aszamy zatem, �e przeszed�e� test. Runiczny kamie� mo�esz zachowa� dla siebie.
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	b_giveplayerxp(XP_SCHNITZELJAGD);
};


instance DIA_PYROKAR_TODO(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_todo_condition;
	information = dia_pyrokar_todo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pyrokar_todo_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((MIS_RUNE != LOG_SUCCESS) || (MIS_GOLEM != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_todo_info()
{
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_00");	//Wype�ni�e� wyznaczone przeze mnie zadanie.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//Ale...
	if(MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_02");	//...musisz jeszcze przej�� test Ulthara.
	};
	if(MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_03");	//...musisz jeszcze przej�� test Serpentesa.
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_MAGICAN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_magican_condition;
	information = dia_pyrokar_magican_info;
	permanent = FALSE;
	description = "Czy zostan� teraz przyj�ty do gildii mag�w?";
};


func int dia_pyrokar_magican_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && (MIS_RUNE == LOG_SUCCESS) && (MIS_GOLEM == LOG_SUCCESS) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_magican_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAGICAN_15_00");	//Czy zostan� teraz przyj�ty do gildii mag�w?
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_01");	//Gratuluj�! Przeszed�e� pomy�lnie Pr�b� Ognia. Od pocz�tku byli�my pewni, �e ci si� powiedzie.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_02");	//Tak, jak teraz jeste�my pewni, �e dasz z siebie wszystko, by sta� si� GODNYM s�ug� Innosa.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_03");	//Je�li jeste� got�w z�o�y� Przysi�g� Ognia, przyjmiemy ci� teraz w nasze szeregi.
};


instance DIA_PYROKAR_OATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_oath_condition;
	information = dia_pyrokar_oath_info;
	permanent = FALSE;
	description = "Jestem got�w, by wst�pi� do Kr�gu Ognia.";
};


func int dia_pyrokar_oath_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_magican) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_oath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_00");	//Jestem got�w, by wst�pi� do Kr�gu Ognia.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_01");	//Zatem wys�uchaj s��w �wi�tej Przysi�gi Ognia.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_02");	//Czy przysi�gasz przed Innosem wszechpot�nym, jego wiernymi s�ugami i �wi�tym P�omieniem...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_03");	//...�e od teraz i na zawsze twoje �ycie b�dzie stanowi� jedno�� z Ogniem...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_04");	//...p�ki twe cia�o i dusza nie spoczn� w jego �wi�tym domu, gdy zga�nie p�omie� twego �ycia?
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_05");	//Przysi�gam.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_06");	//Sk�adaj�c t� przysi�g�, zawar�e� pakt ze �wi�tym P�omieniem.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_07");	//No� t� szat� jako symbol tej wieczystej wi�zi.
	CreateInvItems(hero,itar_kdf_l,1);
	AI_EquipArmor(hero,itar_kdf_l);
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine(lothar,"START");
	Npc_SetTrueGuild(other,GIL_KDF);
	FIRE_CONTEST = TRUE;
	Snd_Play("LEVELUP");
	KDF_AUFNAHME = LOG_SUCCESS;
	SLD_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_OBSOLETE;
	b_giveplayerxp(XP_BECOMEMAGE);
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_08");	//Teraz, jako cz�onek naszej organizacji, mo�esz porozmawia� z Lordem Hagenem, dow�dc� paladyn�w.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_09");	//Ch�tnie poznamy jego zdanie na temat ca�ej tej sprawy. Jeste� wolny. Mo�esz si� uda� do Khorinis.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_10");	//Wierzymy tylko, �e niezw�ocznie przyniesiesz nam jego odpowied�.
};


instance DIA_PYROKAR_LERNEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_lernen_condition;
	information = dia_pyrokar_lernen_info;
	permanent = FALSE;
	description = "Czego mog� si� teraz nauczy�?";
};


func int dia_pyrokar_lernen_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_pyrokar_lernen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Lernen_15_00");	//Czego mog� si� teraz nauczy�?
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_01");	//Przede wszystkim, masz prawo pozna� wielk� tajemnic� kr�g�w magii. Dzi�ki niej b�dziesz m�g� wykorzystywa� runy.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_02");	//Zg��biaj�c kolejne z sze�ciu kr�g�w magii, b�dziesz m�g� pos�ugiwa� si� coraz pot�niejszymi zakl�ciami.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_03");	//Odpowiednie formu�y poznasz od braci z naszego klasztoru. Ka�dy z nich specjalizuje si� w pewnej dziedzinie.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_04");	//Karras, na przyk�ad, jest mistrzem przywo�ywania, a Hyglas mo�e ci� nauczy� tajnik�w magii ognia.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_05");	//Mistrzem w dziedzinie magii lodu i grzmotu jest Marduk. Parlan natomiast wprowadzi ci� w pierwsze kr�gi i poka�e kilka istotnych inkantacji.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_06");	//Ale ka�dy z nich nauczy ci� tylko magicznych formu�. Stworzeniem odpowiednich run musisz si� zaj�� sam.
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Mistrz Parlan wprowadzi mnie do pierwszego Kr�gu Magii.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brat Karras naucza formu� inwokacji i przyzywania.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brat Hyglas mo�e przybli�y� mi tajemnice ognia.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brat Marduk mo�e opowiedzie� mi o mocy lodu i pioruna.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brat Parlan naucza r�nych innych formu�.");
};


instance DIA_PYROKAR_WUNSCH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wunsch_condition;
	information = dia_pyrokar_wunsch_info;
	permanent = FALSE;
	description = "Mam jedno �yczenie...";
};


func int dia_pyrokar_wunsch_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_pyrokar_wunsch_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_15_00");	//Mam jedno �yczenie...
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_01");	//Po przyj�ciu w nasze szeregi ka�dy mag ma prawo domaga� si� spe�nienia jednego swojego �yczenia.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_02");	//Czego wi�c sobie �yczysz?
	Info_ClearChoices(dia_pyrokar_wunsch);
	Info_AddChoice(dia_pyrokar_wunsch,"Niczego.",dia_pyrokar_wunsch_nothing);
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Niech Babo zostanie nowym ogrodnikiem klasztoru.",dia_pyrokar_wunsch_babo);
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Chc�, by nowicjusz Opolos uzyska� dost�p do biblioteki.",dia_pyrokar_wunsch_opolos);
	};
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Niech Dyrian pozostanie w klasztorze.",dia_pyrokar_wunsch_dyrian);
	};
};

func void dia_pyrokar_wunsch_nothing()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Nothing_15_00");	//Niczego.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Nothing_11_01");	//Niech i tak b�dzie. Nowoprzyj�ty mag rezygnuje ze swojego �yczenia!
	b_startotherroutine(dyrian,"NOFAVOUR");
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_dyrian()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Dyrian_15_00");	//Pragn�, by nowicjusz Dyrian zosta� w klasztorze.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01");	//Niech tak si� stanie.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02");	//Nowicjusz zostanie w klasztorze. Mo�e obj�� posad� ogrodnika, kt�ra si� w�a�nie zwolni�a.
	b_giveplayerxp(XP_HELPDYRIAN);
	b_startotherroutine(dyrian,"FAVOUR");
	MIS_HELPDYRIAN = LOG_SUCCESS;
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_babo()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Babo_15_00");	//Pragn�, by przyklasztorne ogrody zosta�y powierzone pieczy nowicjusza Babo.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_01");	//Niech tak si� stanie.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_02");	//Od dzi� odpowiedzialno�� za nasze ogrody przejmie nowicjusz Babo.
	b_giveplayerxp(XP_HELPBABO);
	b_startotherroutine(babo,"FAVOUR");
	b_startotherroutine(dyrian,"NOFAVOUR");
	MIS_HELPBABO = LOG_SUCCESS;
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_opolos()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Opolos_15_00");	//Chc�, by nowicjusz Opolos uzyska� dost�p do biblioteki.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_01");	//Niech tak si� stanie.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_02");	//Od dzi� nowicjusz Opolos mo�e bez przeszk�d studiowa� pisma Innosa.
	b_giveplayerxp(XP_HELPOPOLOS);
	b_startotherroutine(opolos,"FAVOUR");
	b_startotherroutine(dyrian,"NOFAVOUR");
	MIS_HELPOPOLOS = LOG_SUCCESS;
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};


instance DIA_PYROKAR_NACHRICHT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_nachricht_condition;
	information = dia_pyrokar_nachricht_info;
	permanent = FALSE;
	description = "Przynosz� wie�ci dla Lorda Hagena...";
};


func int dia_pyrokar_nachricht_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pyrokar_nachricht_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_00");	//Przynosz� wie�ci od Lorda Hagena. Mam mu dostarczy� dow�d na istnienie smok�w.
	if(ENTEROW_KAPITEL2 == FALSE)
	{
		AI_Teleport(sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_01");	//W tym celu musz� si� uda� do G�rniczej Doliny.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_02");	//Rozumiem. Musisz oczywi�cie wype�ni� jego polecenie. Paladyn Sergio odprowadzi ci� na prze��cz.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_03");	//Niech Innos ma ci� w swojej opiece.
		SERGIO_FOLLOW = TRUE;
		AI_StopProcessInfos(self);
		b_startotherroutine(sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_04");	//Dlatego od razu uda�em si� do G�rniczej Doliny.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_05");	//�wietnie. Skoro znasz ju� drog�, nie b�dziesz zapewne potrzebowa� eskorty.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_06");	//Wype�nij polecenie Lorda Hagena i niech Innos ma ci� w swojej opiece.
	};
};


instance DIA_PYROKAR_TEACH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 4;
	condition = dia_pyrokar_teach_condition;
	information = dia_pyrokar_teach_info;
	permanent = TRUE;
	description = "Chc� pozna� ostatni kr�g magii.";
};


func int dia_pyrokar_teach_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_teach_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_15_00");	//Chc� pozna� ostatni kr�g magii.
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		if(b_teachmagiccircle(self,other,6))
		{
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_01");	//Du�o czasu min�o, odk�d zawar�e� zwi�zek ze �wi�tym P�omieniem. Wiele si� od tamtej pory wydarzy�o.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_02");	//Jeste� Wybra�cem Innosa. By wype�ni� czekaj�ce ci� zadanie, b�dziesz potrzebowa� ca�ej swojej si�y.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_03");	//Udziel� ci teraz b�ogos�awie�stwa. Niniejszym wkraczasz w sz�sty kr�g magii. Oby� zawsze ni�s� �wiatu �wiat�o i rozprasza� mrok.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_04");	//Je�li chcesz, mog� ci� teraz nauczy� formu� ostatniego kr�gu.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_05");	//Ach, jeszcze co�. Na pocz�tku ci� nie pozna�em...
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_06");	//...ale to ja wr�czy�em ci list, nim wrzucono ci� za Barier�.
			AI_Output(other,self,"DIA_Pyrokar_TEACH_15_07");	//Tak, oszcz�dzi�e� mi wtedy nad�tej przemowy s�dziego.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_08");	//A teraz jeste� Wybra�cem Innosa.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_09");	//Przyjmij moje b�ogos�awie�stwo, Wybra�cze.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_10");	//Innosie, odwieczny Panie �wiat�a i ognia, pob�ogos�aw tego cz�owieka, swego umi�owanego s�ug�.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_11");	//Dodaj mu odwagi, si�y i m�dro�ci, by m�g� pewnie pod��a� �cie�k�, kt�r� dla niego wybra�e�.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_11_12");	//Tw�j czas jeszcze nie nadszed�. Krocz dalej po �cie�ce, kt�r� wyznaczy� ci Innos, a kiedy� udziel� ci ostatniej lekcji.
	};
};


instance DIA_PYROKAR_SPELLS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_spells_condition;
	information = dia_pyrokar_spells_info;
	permanent = TRUE;
	description = "Ucz mnie (tworzenie run)";
};


func int dia_pyrokar_spells_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};

func void dia_pyrokar_spells_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Pyrokar_SPELLS_15_00");	//Podziel si� ze mn� swoj� wiedz�.
	Info_ClearChoices(dia_pyrokar_spells);
	Info_AddChoice(dia_pyrokar_spells,DIALOG_BACK,dia_pyrokar_spells_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_pyrokar_spells_firerain);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_BREATHOFDEATH)),dia_pyrokar_spells_breathofdeath);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MASSDEATH)),dia_pyrokar_spells_massdeath);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SHRINK)),dia_pyrokar_spells_shrink);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_SPELLS_11_01");	//Nie mog� ci� ju� niczego nauczy�.
	};
};

func void dia_pyrokar_spells_back()
{
	Info_ClearChoices(dia_pyrokar_spells);
};

func void dia_pyrokar_spells_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_pyrokar_spells_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_pyrokar_spells_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_pyrokar_spells_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};


instance DIA_PYROKAR_PARLAN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_parlan_condition;
	information = dia_pyrokar_parlan_info;
	permanent = FALSE;
	description = "Przysy�a mnie Parlan...";
};


func int dia_pyrokar_parlan_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && (PARLAN_SENDS == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_parlan_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Parlan_15_00");	//Przysy�a mnie Parlan. Chcia�bym zwi�kszy� swoje magiczne zdolno�ci.
	AI_Output(self,other,"DIA_Pyrokar_Parlan_11_01");	//Wiele si� ju� nauczy�e�, a twa moc wzros�a. Od tej pory b�dziesz pobiera� nauki bezpo�rednio u mnie.
};


instance DIA_PYROKAR_TEACH_MANA(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_teach_mana_condition;
	information = dia_pyrokar_teach_mana_info;
	permanent = TRUE;
	description = "Chc� zwi�kszy� moj� magiczn� moc.";
};


func int dia_pyrokar_teach_mana_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && Npc_KnowsInfo(hero,dia_pyrokar_parlan))
	{
		return TRUE;
	};
};

func void dia_pyrokar_teach_mana_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_MANA_15_00");	//Chc� zwi�kszy� swoje magiczne zdolno�ci.
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_MANA_11_00");	//Czuj�, �e pot�ga magii wype�nia ju� ka�dy centymetr twojego cia�a. Nawet ja nie jestem w stanie dalej podnie�� twoich umiej�tno�ci.
	};
	Info_ClearChoices(dia_pyrokar_teach_mana);
};

func void dia_pyrokar_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};


instance DIA_PYROKAR_PERM(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 900;
	condition = dia_pyrokar_perm_condition;
	information = dia_pyrokar_perm_info;
	permanent = TRUE;
	description = "(B�ogos�awie�stwo)";
};


func int dia_pyrokar_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_pyrokar_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_00");	//Pob�ogos�aw mnie, Mistrzu.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_01");	//Mo�esz mnie pob�ogos�awi�? Przyda�aby mi si� boska pomoc.
	};
	if((KAPITEL == 5) && (MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_02");	//Niech twe ostatnie starcie z odwiecznym wrogiem zako�czy si� twoim zwyci�stwem. Id� w �asce Innosa, m�j synu.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_03");	//Niech Innos broni ci� od krzywdy i z�ej przygody na mrocznych �cie�kach, kt�rymi przysz�o ci kroczy�.
	};
};


instance DIA_PYROKAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap3_exit_condition;
	information = dia_pyrokar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_BACKFROMOW(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_backfromow_condition;
	information = dia_pyrokar_backfromow_info;
	description = "Przybywam z G�rniczej Doliny.";
};


func int dia_pyrokar_backfromow_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_backfromow_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_00");	//Przybywam z G�rniczej Doliny.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_01");	//Jakie wie�ci przynosisz?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_02");	//Zebra�a si� tam pot�na armia ork�w i smok�w.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_03");	//To ju� wiemy od Miltena. A co z �adunkiem rudy dla Kr�la?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_04");	//Niestety, ruda, kt�r� wydobyli ludzie Garonda, nie zaspokoi raczej potrzeb kr�lewskiej armii.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_05");	//Zaiste, w mrocznych czasach przysz�o nam �y�, skoro �wiat�o S�o�ca ust�puje dzi� miejsca ciemno�ci.
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_06");	//Zaatakowa�y mnie tajemnicze postaci w czarnych szatach.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_07");	//Tak, wiem. To Poszukiwacze - pomiot z otch�ani Beliara. Strze� si� ich, bo spr�buj� zaw�adn�� twoj� dusz�.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_08");	//Je�li im ulegniesz, przestaniesz by� sob�. Tylko w klasztorze znajdziesz wtedy pomoc, wi�c uwa�aj na siebie.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar opowiedzia� mi o Poszukiwaczach, odzianych w czarne szaty wys�annikach Beliara. Ostrzeg� mnie, �e je�li kt�ry� z nich mnie op�ta, powinienem natychmiast wr�ci� do klasztoru.");
	};
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_09");	//Poprosi�em Karrasa, by przyjrza� si� tej sprawie troch� bli�ej. Miejmy nadziej�, �e dzi�ki niemu znajdziemy jakie� rozwi�zanie tego problemu.
		PYROKARTOLDKARRASTORESEARCHDMT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Karras otrzyma� od Pyrokara polecenie zlikwidowania zagro�enia ze strony Poszukiwaczy.");
	};
	AI_Output(self,other,"DIA_Pyrokar_Add_11_00");	//We� to. Gdyby� potrzebowa� pomocy, ta runa przeniesie ci� prosto do klasztoru.
	b_giveinvitems(self,other,itru_teleportmonastery,1);
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_10");	//Pami�taj: od twojej silnej woli zale�� teraz losy nas wszystkich.
};


instance DIA_PYROKAR_GIVEINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 31;
	condition = dia_pyrokar_giveinnoseye_condition;
	information = dia_pyrokar_giveinnoseye_info;
	description = "Przybywam po Oko Innosa.";
};


func int dia_pyrokar_giveinnoseye_condition()
{
	if((KAPITEL == 3) && Npc_HasItems(other,itwr_permissiontowearinnoseye_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_15_00");	//Przybywam po Oko Innosa.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_01");	//Widz�, �e sam Lord Hagen upowa�ni� ci� do zabrania �wi�tego amuletu.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_02");	//Niestety, musz� ci� rozczarowa�. Padli�my ofiar� niecnego spisku nieprzyjaciela.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_03");	//Oko Innosa zosta�o wykradzione ze �wi�tych mur�w klasztoru!
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Kto si� powa�y� na co� takiego, Mistrzu?!",dia_pyrokar_giveinnoseye_wer);
	}
	else
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Kto to zrobi�?",dia_pyrokar_giveinnoseye_wer);
	};
};

func void dia_pyrokar_giveinnoseye_wer()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_00");	//Kto si� powa�y� na co� takiego, Mistrzu?!
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_01");	//Kto to zrobi�?
	};
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_02");	//Si�y z�a cechuje niezwyk�a przebieg�o�� i skryto��, m�j synu. Jego s�udzy rzadko dzia�aj� w �wietle dnia.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_03");	//A jednak �yjemy w dziwnych czasach. Dzi� nieprzyjaciel pokazuje si� w bia�y dzie� na ulicach i placach miast.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_04");	//Jasny to znak, �e nie obawia si� swych wrog�w i w walce z nimi nie cofnie si� przed niczym.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_05");	//Jeden z naszych oddanych braci, kandydat do zaszczytnego tytu�u Arcymaga Ognia, okaza� si� szpiegiem nieprzyjaciela. M�wi� o Pedrze.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_06");	//Nieprzyjaciel zaw�adn�� jego dusz� i zaatakowa� z najmniej spodziewanej strony.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_07");	//Pedro wdar� si� do naj�wi�tszych komnat klasztoru i wykrad� z nich Oko.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_08");	//Obawiam si�, �e zbyt d�ugo przebywa� sam poza murami klasztoru, pozbawiony naszej pomocy i nara�ony na kuszenie ze strony Z�ego.
	pedro.flags = 0;
	PEDRO_TRAITOR = TRUE;
	b_logentry(TOPIC_INNOSEYE,"�wietnie. Mo�na si� by�o tego spodziewa�. Sp�ni�em si� - te t�paki z klasztoru pozwoli�y, aby jaki� nowicjusz skrad� im Oko. Pozostaje mi tylko uda� si� na poszukiwania Pedra i mie� nadziej�, �e nie zd��y� jeszcze sprzeda� swojego �upu.");
	b_logentry(TOPIC_TRAITORPEDRO,"Zdrajca Pedro ukrad� z klasztoru Oko Innosa. Za�o�� si�, �e Magowie Ognia ch�tnie dostaliby go w swoje r�ce.");
};


instance DIA_PYROKAR_NOVIZENCHASE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 34;
	condition = dia_pyrokar_novizenchase_condition;
	information = dia_pyrokar_novizenchase_info;
	description = "Uda�o wam si� ustali�, dok�d zbieg�?";
};


func int dia_pyrokar_novizenchase_condition()
{
	if((KAPITEL == 3) && (PEDRO_TRAITOR == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_novizenchase_info()
{
	AI_Output(other,self,"DIA_Pyrokar_NOVIZENCHASE_15_00");	//Uda�o wam si� ustali�, dok�d zbieg�?
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_01");	//Pedro powali� na ziemi� kilku nowicjuszy, kt�rzy pr�bowali go powstrzyma�, po czym znikn�� w porannej mgle.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_02");	//Wys�ali�my za nim naszych braci, by za wszelk� cen� odzyskali �wi�ty amulet.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_03");	//Je�li chcesz ich jeszcze dogoni�, musisz si� po�pieszy�. Wkr�tce Pedro znajdzie si� poza naszym zasi�giem.
	MIS_NOVIZENCHASE = LOG_RUNNING;
};


instance DIA_PYROKAR_FOUNDINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 35;
	condition = dia_pyrokar_foundinnoseye_condition;
	information = dia_pyrokar_foundinnoseye_info;
	description = "Znalaz�em Oko Innosa.";
};


func int dia_pyrokar_foundinnoseye_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_foundinnoseye_info()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_00");	//Odzyska�em Oko Innosa. Obawiam si�, �e jest uszkodzone.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_01");	//Ale... to niemo�liwe! Co si� sta�o?!
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_02");	//Amulet wpad� w r�ce plugawych istot. Przyby�em zbyt p�no.
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_03");	//W tych lasach jest pewne niezwyk�e miejsce kultu, w kszta�cie p�ksi�yca. Nieprzyjaciele odprawiali tam nad nim jaki� tajemniczy rytua�.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_04");	//Niech Innos ma nas w swojej opiece! Zbezcze�cili nasz S�oneczny Kr�g!
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_05");	//W najgorszych koszmarach nie przypuszcza�em, �e dysponuj� a� tak� moc�.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	MIS_NOVIZENCHASE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
	Info_AddChoice(dia_pyrokar_foundinnoseye,"Co mo�emy teraz zrobi�?",dia_pyrokar_foundinnoseye_was);
};

func void dia_pyrokar_foundinnoseye_was()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_15_00");	//Co mo�emy teraz zrobi�?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_01");	//Nieprzyjaciel sta� si� niezwykle gro�ny, a mimo to ten prastary artefakt mo�e jeszcze pokrzy�owa� jego plany.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_02");	//Musimy czym pr�dzej naprawi� Oko i przywr�ci� mu dawn� moc. Czas dzia�a na nasz� niekorzy��.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_03");	//Wol� nie my�le�, co si� teraz z nami stanie. Bez ochronnej mocy amuletu jeste�my bezbronni wobec si� ciemno�ci.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_04");	//Udaj si� do miasta i odszukaj tam Maga Wody imieniem Vatras. W tej straszliwej sytuacji tylko on nas jeszcze mo�e ocali�. Zanie� mu Oko. �piesz si�!
	Info_AddChoice(dia_pyrokar_foundinnoseye,DIALOG_BACK,dia_pyrokar_foundinnoseye_weiter);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_foundinnoseye,"Dlaczego w�a�nie Vatras?",dia_pyrokar_foundinnoseye_was_vatras);
	};
	Info_AddChoice(dia_pyrokar_foundinnoseye,"Co to za S�oneczny Kr�g?",dia_pyrokar_foundinnoseye_sonnenkreis);
	b_logentry(TOPIC_INNOSEYE,"Pyrokar chce, abym uda� si� do miasta i spyta� Vatrasa, Maga Wody, co zrobi� z uszkodzonym Okiem.");
	MIS_PYROKAR_GOTOVATRASINNOSEYE = LOG_RUNNING;
};

func void dia_pyrokar_foundinnoseye_was_vatras()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00");	//Dlaczego w�a�nie Vatras?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01");	//Przynale�no�� do Mag�w Ognia nie pozwala ci kwestionowa� moich polece�, Bracie.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02");	//Vatras jest s�ug� Adanosa. Tylko pradawna m�dro�� Mag�w Wody mo�e nam pom�c.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03");	//To wszystko, co musisz wiedzie�.
};

func void dia_pyrokar_foundinnoseye_sonnenkreis()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00");	//Co to za S�oneczny Kr�g?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01");	//Ka�dego roku wszyscy magowie i nowicjusze z klasztoru udaj� si� tam w czas przesilenia, by uczci� pocz�tek nowego cyklu.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02");	//Dobroczynna moc S�o�ca jest w tym miejscu szczeg�lnie silna.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03");	//Nigdy nie przypuszcza�em, �e mo�na j� wykorzysta� do mrocznych cel�w, a przecie� tak si� w�a�nie sta�o!
};

func void dia_pyrokar_foundinnoseye_weiter()
{
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
};


instance DIA_PYROKAR_SPOKETOVATRAS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_spoketovatras_condition;
	information = dia_pyrokar_spoketovatras_info;
	description = "Rozmawia�em z Vatrasem.";
};


func int dia_pyrokar_spoketovatras_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_spoketovatras_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_00");	//Rozmawia�em z Vatrasem.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_01");	//To �wietnie! Gdzie on jest?
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_02");	//Zamierza odprawi� w S�onecznym Kr�gu rytua�, kt�ry przywr�ci dawn� moc Oku Innosa.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_03");	//Je�li to prawda, mo�e jest jeszcze dla nas nadzieja.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_04");	//Vatras potrzebuje pomocy. Twojej i... Xardasa.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_05");	//CO TAKIEGO?! Xardas te� tam b�dzie?! Chyba nie m�wisz powa�nie.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_06");	//To nie by� M�J pomys�. Vatras nalega, by�cie przybyli obydwaj.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_07");	//Xardas! Ci�gle ten Xardas. Czy nigdy si� od niego nie uwolni�? Gorzej ju� chyba by� nie mog�o.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_08");	//Sk�d mam wiedzie�, �e Xardas nie stoi po stronie nieprzyjaciela?
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_09");	//Nie zaufam temu nekromancie, niezale�nie od tego, jak bardzo jest nam potrzebny.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_10");	//Przykro mi, ale w tej sytuacji nie mog� pom�c Vatrasowi.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_PYROKAR_XARDASVERTRAUEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_xardasvertrauen_condition;
	information = dia_pyrokar_xardasvertrauen_info;
	description = "Ale bez ciebie nie naprawimy amuletu!";
};


func int dia_pyrokar_xardasvertrauen_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_spoketovatras) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_xardasvertrauen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_00");	//Ale bez ciebie nie naprawimy amuletu! Vatras nie b�dzie m�g� odprawi� rytua�u!
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_01");	//Musisz zaufa� Xardasowi.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_02");	//Ja nic nie musz�, zrozumiano? Sk�d mam wiedzie�, �e Xardas nie zwr�ci si� nagle przeciw nam? Nie, nie zrobi� tego.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_03");	//A gdybym dostarczy� ci jaki� dow�d?
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_04");	//To raczej niemo�liwe. Musia�by� mi przynie�� co� naprawd� wa�nego.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_05");	//Je�li chodzi o Xardasa, nie dam si� tak �atwo przekona�.
	b_logentry(TOPIC_INNOSEYE,"Pyrokar nie chce nawet s�ysze� o Xardasie. Musz� porozmawia� z Xardasem, mo�e wsp�lnie wymy�limy, jak nak�oni� Pyrokara do stawienia si� na rytuale w S�onecznym Kr�gu.");
	PYROKAR_DENIESINNOSEYERITUAL = TRUE;
};


instance DIA_PYROKAR_BUCHZURUECK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_buchzurueck_condition;
	information = dia_pyrokar_buchzurueck_info;
	description = "Xardas kaza� mi wr�czy� ci t� ksi�g�.";
};


func int dia_pyrokar_buchzurueck_condition()
{
	if(Npc_HasItems(other,itwr_xardasbookforpyrokar_mis) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchzurueck_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_00");	//Xardas kaza� mi wr�czy� ci t� ksi�g�.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_01");	//To dow�d jego zaufania.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//Poka�.
	b_giveinvitems(other,self,itwr_xardasbookforpyrokar_mis,1);
	Npc_RemoveInvItems(self,itwr_xardasbookforpyrokar_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_03");	//To niesamowite! Czy masz poj�cie, co mi w�a�nie przekaza�e�?
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_04");	//Emmm.... Nie.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_05");	//To niezwykle stara ksi�ga, kt�ra zagin�a ca�e wieki temu.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_06");	//S�dzili�my, �e zosta�a zniszczona, a teraz dowiaduj� si�, �e by�a w posiadaniu Xardasa!
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_07");	//Zatem zgodzisz si� uczestniczy� w rytuale?
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_08");	//Tak, udam si� do S�onecznego Kr�gu... Ale bynajmniej nie dlatego, �e uwierzy�em w dobre intencje Xardasa, o nie!
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_09");	//Wr�cz przeciwnie! Zamierzam wydusi� z tego starego szakala, dlaczego tak d�ugo trzyma� ksi�g� w ukryciu! Tym razem posun�� si� zbyt daleko!
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_10");	//Zobaczymy si� przy S�onecznym Kr�gu.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"THRONE",-1);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	b_logentry(TOPIC_INNOSEYE,"Pyrokar zgodzi� si� p�j�� do S�onecznego Kr�gu.");
	PYROKAR_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_PYROKAR_PRERITUAL(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_preritual_condition;
	information = dia_pyrokar_preritual_info;
	permanent = TRUE;
	description = "My�lisz, �e uda si� wam naprawi� Oko?";
};


func int dia_pyrokar_preritual_condition()
{
	if((PYROKAR_GOESTORITUALINNOSEYE == TRUE) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_preritual_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PRERITUAL_15_00");	//My�lisz, �e uda si� wam naprawi� Oko Innosa?
	AI_Output(self,other,"DIA_Pyrokar_PRERITUAL_11_01");	//Trudno powiedzie�. Wkr�tce si� przekonamy.
};


instance DIA_PYROKAR_AUGEGEHEILT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_augegeheilt_condition;
	information = dia_pyrokar_augegeheilt_info;
	description = "Uda�o si� wam! Oko Innosa znowu jest ca�e!";
};


func int dia_pyrokar_augegeheilt_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_augegeheilt_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_00");	//Uda�o si� wam! Oko Innosa znowu jest ca�e!
	AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_01");	//A� trudno uwierzy�, �e si� nam powiod�o.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_02");	//To prawda, Mistrzu.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_03");	//Ju� dawno udowodni�e�, �e jeste� godzien, by nale�e� do najwy�szych z Mag�w Ognia.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_04");	//Od dzi� jeste� zatem cz�onkiem Rady. B�dziesz reprezentowa� klasztor na zewn�trz. Mianuj� ci� Arcymagiem Kr�gu Ognia.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_05");	//No� t� szat� z godno�ci�. S�aw w �wiecie dobre imi� klasztoru i pomna�aj jego bogactwa.
		CreateInvItem(hero,itar_kdf_h);
		AI_EquipArmor(hero,itar_kdf_h);
		HEROGIL_KDF2 = TRUE;
	};
};


instance DIA_PYROKAR_KAP3_READY(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_kap3_ready_condition;
	information = dia_pyrokar_kap3_ready_info;
	description = "Czy jest jeszcze co�, czym powinienem si� zaj��?";
};


func int dia_pyrokar_kap3_ready_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_pyrokar_augegeheilt))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap3_ready_info()
{
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_00");	//Czy jest jeszcze co�, czym powinienem si� zaj��?
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_01");	//Nie tra�my czasu na drobiazgi. Rozpraw si� raz na zawsze z tymi przekl�tymi smokami. Prosz�, oto Oko.
	CreateInvItems(self,itmi_innoseye_mis,1);
	b_giveinvitems(self,other,itmi_innoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_02");	//Pami�taj, �e nim zaatakujesz smoka, powiniene� z nim porozmawia�.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_01");	//Pot�ga Oka zmusi smoki do rozmowy z tob� i nie pozwoli im sk�ama�.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_02");	//Tak d�ugo, jak b�dziesz je nosi�, b�dzie ci� chroni� przed smoczymi atakami.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_05");	//Jego moc nie jest jednak niesko�czona i musisz je co jaki� czas nape�nia� magiczn� energi�.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_06");	//W tym celu po��cz na stole alchemicznym Oko Innosa i esencj� ze smoczego serca.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_07");	//Dopiero wtedy mo�esz stawi� czo�a kolejnemu gadowi.
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_08");	//Dzi�ki. B�d� o tym pami�ta�.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_09");	//Masz ju� wszystko, czego potrzebujesz. Ruszaj w drog�. Zosta�o nam niewiele czasu!
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	TOPIC_END_INNOSEYE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	CreateInvItems(gorax,itmi_runeblank,1);
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENJAGD,"Jestem got�w stawi� czo�a smokom. Oko Innosa pozwoli mi odnie�� zwyci�stwo. Musz� jednak pami�ta�, aby za�o�y� je przed ka�d� bitw� z kt�rymkolwiek ze smok�w. Problem polega na tym, �e musz� przem�wi� do ka�dej z tych bestii zanim je zaatakuj�, a kiedy z nimi rozmawiam, Oko Innosa traci sw� moc. Zanim stawi� czo�a kolejnego smokowi, powinienem po��czy� kamie� z amuletu z wywarem ze smoczego serca, u�ywaj�c do tego celu sto�u alchemicznego i menzurki.");
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_PYROKAR_BUCHDERBESSENEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 39;
	condition = dia_pyrokar_buchderbessenen_condition;
	information = dia_pyrokar_buchderbessenen_info;
	description = "Znalaz�em pewien tajemniczy almanach.";
};


func int dia_pyrokar_buchderbessenen_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_backfromow) && Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchderbessenen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_00");	//Znalaz�em pewien tajemniczy almanach.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_01");	//Tak? Jaki almanach?
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_02");	//Nie jestem pewien. Mia�em nadziej�, �e ty mi to powiesz.
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_03");	//To rzeczywi�cie niepokoj�ca ksi�ga. M�drze zrobi�e�, przynosz�c j� do mnie.
	b_giveplayerxp(XP_AMBIENT);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_04");	//Zak�adam, �e takich przekl�tych ksi�g jest wi�cej. Musisz koniecznie odnale�� je wszystkie.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_05");	//My�l�, �e Poszukiwacze czerpi� z nich swoj� ponur� moc.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_06");	//Dzi�ki nim sprawuj� w�adz� nad zagubionymi duszami swoich ofiar.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_07");	//Wygl�da na to, �e zapisuj� w nich imiona wszystkich ludzi, kt�rych zamierzaj� op�ta�.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_08");	//S�uchaj. Dam ci ten magiczny list. Poznasz z niego imiona ofiar, kt�re zapisano w ksi�gach.
		CreateInvItems(self,itwr_pyrokarsobsessionlist,1);
		b_giveinvitems(self,other,itwr_pyrokarsobsessionlist,1);
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_09");	//Odszukaj tych nieszcz�nik�w i przynie� mi ich ksi�gi, a ja spr�buj� je zniszczy�.
		if(Npc_IsDead(karras) == FALSE)
		{
			AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_10");	//Ale najpierw poka� przynajmniej jedn� z nich Karrasowi. To mo�e pom�c w jego badaniach.
		};
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_11");	//Tylko pod �adnym pozorem nie pr�buj sam niszczy� tych almanach�w. Nie jeste� jeszcze got�w, by zmierzy� si� z ich pot�g�.
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar chce unieszkodliwi� Almanachy Op�tanych. Da� mi list� wszystkich, kt�rych Poszukiwacze planuj� op�ta�. Niewykluczone, �e b�dzie si� ona wyd�u�a�.");
	};
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_12");	//Nie zbli�aj si� do Poszukiwaczy albo zaw�adn� twoj� dusz�.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_13");	//Gdyby� zacz�� ulega� ich podszeptom, wr�� czym pr�dzej do mnie.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_14");	//Tylko tutaj, w klasztorze, twoja dusza mo�e zosta� uratowana.
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_15");	//Czy nie mo�na jako� zablokowa� ich mentalnych atak�w?
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_16");	//Hmmm. To mo�liwe. Mo�e Karras co� na to poradzi.
		PYROKAR_ASKKARRASABOUTDMTAMULETT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Karass ma mi pom�c w znalezieniu sposobu na odpieranie atak�w Poszukiwaczy.");
	};
};


instance DIA_PYROKAR_SCOBSESSED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 70;
	condition = dia_pyrokar_scobsessed_condition;
	information = dia_pyrokar_scobsessed_info;
	permanent = TRUE;
	description = "(Leczenie z op�tania)";
};


func int dia_pyrokar_scobsessed_condition()
{
	if(SC_ISOBSESSED == TRUE)
	{
		return TRUE;
	};
};


var int got_healobsession_day;

func void dia_pyrokar_scobsessed_info()
{
	if(((GOT_HEALOBSESSION_DAY <= (Wld_GetDay() - 2)) || (GOT_HEALOBSESSION_DAY == 0)) && (Npc_HasItems(other,itpo_healobsession_mis) == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_00");	//Pom� mi, Mistrzu. Z�o zaw�adn�o mym umys�em!
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_01");	//We� t� mikstur�! Ona uleczy ci� z koszmar�w.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_02");	//Niech mi�osierdzie Innosa b�dzie naszym zbawieniem.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_03");	//Dzia�aj w jego imieniu i strze� si� z�ego oka nieprzyjaciela.
			if(SC_OBSESSIONTIMES > 3)
			{
				AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//Ale uwa�aj! Je�li zbyt cz�sto b�dziesz wystawia� si� na ataki wroga, mo�e nie by� dla ciebie ratunku. Pami�taj o tym!
			};
			CreateInvItems(self,itpo_healobsession_mis,2);
			b_giveinvitems(self,other,itpo_healobsession_mis,2);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//Z�e si�y zaw�adn�y mym umys�em! Mo�esz mi pom�c?
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_06");	//Mog�, je�li oka�esz wystarczaj�c� wdzi�czno�� klasztorowi Innosa. 300 sztuk z�ota powinno wystarczy�.
			Info_ClearChoices(dia_pyrokar_scobsessed);
			Info_AddChoice(dia_pyrokar_scobsessed,"To stanowczo za du�o!",dia_pyrokar_scobsessed_nein);
			Info_AddChoice(dia_pyrokar_scobsessed,"Dobrze. Oto pieni�dze.",dia_pyrokar_scobsessed_ok);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//Przecie� dopiero co dosta�e� swoj� mikstur�! Nie zawracaj mi g�owy bez potrzeby!
	};
};

func void dia_pyrokar_scobsessed_ok()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_ok_15_00");	//Dobrze. Oto pieni�dze.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_01");	//Masz, wypij to. Niech mi�osierdzie Innosa b�dzie twoim zbawieniem.
		CreateInvItems(self,itpo_healobsession_mis,2);
		b_giveinvitems(self,other,itpo_healobsession_mis,2);
		GOT_HEALOBSESSION_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_02");	//Przynie� pieni�dze, a ukoj� tw�j b�l.
	};
	Info_ClearChoices(dia_pyrokar_scobsessed);
};

func void dia_pyrokar_scobsessed_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_nein_15_00");	//To stanowczo za du�o!
	Info_ClearChoices(dia_pyrokar_scobsessed);
};


instance DIA_PYROKAR_ALMANACHBRINGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_pyrokar_almanachbringen_condition;
	information = dia_pyrokar_almanachbringen_info;
	permanent = TRUE;
	description = "Dowiedzia�em si� czego� wi�cej o tych op�tanych duszach.";
};


func int dia_pyrokar_almanachbringen_condition()
{
	if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pyrokar_buchderbessenen))
	{
		return TRUE;
	};
};


var int almanachcounter;
var int dia_pyrokar_almanachbringen_onetime;

func void dia_pyrokar_almanachbringen_info()
{
	var int almanachcount;
	var int xp_kdf_bringalmanachs;
	var int almanachgeld;
	var int pyrokarsalmanachoffer;
	AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_00");	//Dowiedzia�em si� czego� wi�cej o tych op�tanych duszach.
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_01");	//M�w, Bracie.
	pyrokarsalmanachoffer = 400;
	almanachcount = Npc_HasItems(other,itwr_dementorobsessionbook_mis);
	if(almanachcount == 1)
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_02");	//Znalaz�em kolejny almanach.
		b_giveplayerxp(XP_KDF_BRINGALMANACH);
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
		ALMANACHCOUNTER = ALMANACHCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_03");	//Przynosz� ci kolejne ksi�gi Poszukiwaczy.
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,almanachcount);
		xp_kdf_bringalmanachs = almanachcount * XP_KDF_BRINGALMANACH;
		ALMANACHCOUNTER = ALMANACHCOUNTER + almanachcount;
		b_giveplayerxp(xp_kdf_bringalmanachs);
	};
	if(ALMANACHCOUNTER <= 5)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_04");	//Dobrze si� spisa�e�, ale obawiam si�, �e to jeszcze nie wszystkie. Szukaj dalej.
	}
	else if(ALMANACHCOUNTER <= 8)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_05");	//Wiele ju� odnalaz�e�, ale obawiam si�, �e to jeszcze nie wszystkie.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_06");	//Przynios�e� mi ju� bardzo du�o przekl�tych ksi�g.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_07");	//Zdziwi�bym si�, gdyby�my nie mieli ju� wszystkich.
	};
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_08");	//Przyjmij od klasztoru ten dar. Pomo�e ci on, gdy staniesz twarz� w twarz ze z�em.
	if(DIA_PYROKAR_ALMANACHBRINGEN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_09");	//I zagl�daj co jaki� czas do mojego magicznego listu!
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_10");	//Wrogowie mog� zaatakowa� ludzi, kt�rych imion jeszcze nie poznali�my.
		DIA_PYROKAR_ALMANACHBRINGEN_ONETIME = TRUE;
	};
	almanachgeld = almanachcount * pyrokarsalmanachoffer;
	CreateInvItems(self,itmi_gold,almanachgeld);
	b_giveinvitems(self,other,itmi_gold,almanachgeld);
};


instance DIA_PYROKAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap4_exit_condition;
	information = dia_pyrokar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap5_exit_condition;
	information = dia_pyrokar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_DRACHENTOT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_drachentot_condition;
	information = dia_pyrokar_drachentot_info;
	description = "Wszystkie smoki nie �yj�.";
};


func int dia_pyrokar_drachentot_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_drachentot_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DRACHENTOT_15_00");	//Wszystkie smoki zosta�y pokonane.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_01");	//To dobra wiadomo��, ale nasze po�o�enie nadal jest beznadziejne.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_02");	//Poszukiwacze nie zgin�li wraz ze smokami. Wr�cz przeciwnie - s�ysz�, �e w ci�gu ostatnich dni ich liczba jeszcze si� zwi�kszy�a.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_03");	//Zabicie smok�w z pewno�ci� os�abi�o przeciwnika, ale to wci�� za ma�o. Musimy uderzy� w samo serce Z�a.
};


instance DIA_PYROKAR_DERMEISTER(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_dermeister_condition;
	information = dia_pyrokar_dermeister_info;
	description = "Rozmawia�em ze smokami.";
};


func int dia_pyrokar_dermeister_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_dermeister_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_00");	//Rozmawia�em ze smokami.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_01");	//I czego si� od nich dowiedzia�e�?
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_02");	//M�wi�y o pot�dze swojego pana, kt�ry ma mieszka� w Dworze Irdorath.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_03");	//Niech Innos ma nas w swojej opiece! A wi�c Czarna �wi�tynia odzyska�a sw� dawn� pot�g� i wysy�a do naszego �wiata swoje s�ugi!
};


instance DIA_PYROKAR_WASISTIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wasistirdorath_condition;
	information = dia_pyrokar_wasistirdorath_info;
	description = "Co do za Dw�r Irdorath?";
};


func int dia_pyrokar_wasistirdorath_condition()
{
	if((KAPITEL == 5) && Npc_KnowsInfo(other,dia_pyrokar_dermeister))
	{
		return TRUE;
	};
};

func void dia_pyrokar_wasistirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_00");	//Co do za Dw�r Irdorath?
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_01");	//To wschodnia �wi�tynia boga Beliara. W kr�lestwie Myrtany by�y takie cztery. Ale ta jest z nich wszystkich najbardziej przera�aj�ca.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_02");	//Jakie� 40 lat temu, p�nocna i zachodnia �wi�tynia zosta�y zniszczone.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_03");	//M�ni rycerze bior�cy udzia� w tym przedsi�wzi�ciu dopilnowali, by nie pozosta� z nich kamie� na kamieniu.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_04");	//Wtedy hordy nieprzyjaciela nie mia�y �adnych szans w starciu z zast�pami bohaterskich wojownik�w i paladyn�w.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_05");	//Zniszczenie pozosta�ych dw�ch miejsc sekty wydawa�o si� tylko kwesti� czasu. Z�o mog�o wreszcie ponie�� ostateczn� kl�sk�...
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_06");	//...ale gdy upad�a druga �wi�tynia, pozosta�e po prostu znikn�y!
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_07");	//Znikn�y? Ca�e �wi�tynie, tak? Jaaasne.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_08");	//Nie drwij ze mnie! Sytuacja jest powa�na. Je�li Dw�r Irdorath odzyska� swoj� dawn� pot�g�, pokonanie nieprzyjaciela nie b�dzie takie proste.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_09");	//Najpierw trzeba go bowiem odnale��. B�dzie to twoje nast�pne - i najtrudniejsze jak dot�d - zadanie.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_10");	//Zrobi�, co w mojej mocy.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Wed�ug Pyrokara Dw�r Irdorath to zaginiona �wi�tynia Beliara. Musz� j� odnale��.");
};


instance DIA_PYROKAR_BUCHIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 54;
	condition = dia_pyrokar_buchirdorath_condition;
	information = dia_pyrokar_buchirdorath_info;
	description = "Co si� sta�o z t� 'zaginion�' ksi�g� Xardasa?";
};


func int dia_pyrokar_buchirdorath_condition()
{
	if((KAPITEL == 5) && (ITWR_HALLSOFIRDORATHISOPEN == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_wasistirdorath))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_00");	//Co si� sta�o z t� 'zaginion�' ksi�g� Xardasa?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_01");	//Spodziewa�em si�, �e o ni� zapytasz, ale niewielki b�dziesz mia� z niej po�ytek.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_02");	//Ksi�g� zamkni�to magiczn� piecz�ci�. Zabra�em j� do naszych pracowni, ale mimo wielu pr�b nie uda�o si� nam jej otworzy�.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_03");	//Ten przekl�ty Xardas znowu z nas zadrwi�.
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_04");	//Mog� zobaczy� t� ksi�g�?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_05");	//Naturalnie. �miem jednak w�tpi�, by powiod�o ci si� tam, gdzie zawiedli najznamienitsi mistrzowie tego klasztoru.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_06");	//Ale prosz�, pr�buj �mia�o. Talamon nie b�dzie ci� powstrzymywa�.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Ksi�ga Xardasa pt. 'DW�R IRDORATH' znajduje si� w klasztornej krypcie. Strze�e jej Talamon. Magowie nie mogli jej otworzy� - pono� zosta�a zamkni�ta przez Xardasa magiczn� piecz�ci�.");
	PYROKAR_LETYOUPASSTALAMON = TRUE;
};


instance DIA_PYROKAR_IRDORATHBOOKOPEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_irdorathbookopen_condition;
	information = dia_pyrokar_irdorathbookopen_info;
	description = "Uda�o mi si� otworzy� ksi�g� Xardasa.";
};


func int dia_pyrokar_irdorathbookopen_condition()
{
	if((ITWR_HALLSOFIRDORATHISOPEN == TRUE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_irdorathbookopen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_15_00");	//Uda�o mi si� otworzy� ksi�g� Xardasa.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_11_01");	//Co takiego?! Jak tego dokona�e�? Bo ja, prawd� m�wi�c, straci�em ju� nadziej�.
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Xardas powiedzia� mi, jak to zrobi�.",dia_pyrokar_irdorathbookopen_xardas);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Pewnie mia�em szcz�cie, to wszystko.",dia_pyrokar_irdorathbookopen_glueck);
};

func void dia_pyrokar_irdorathbookopen_glueck()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00");	//Pewnie mia�em szcz�cie, to wszystko.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01");	//Nie opowiadaj bzdur! Jakie tam szcz�cie.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02");	//Nawet ja nie by�em w stanie z�ama� tej przekl�tej piecz�ci! A� tu nagle pojawia si� kto� taki jak ty i...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03");	//...daje mi du�o do my�lenia.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04");	//W ka�dym razie, jako �e to ty otworzy�e� ksi�g�, pozwol� ci j� st�d zabra�. Przynajmniej dop�ki ca�a ta sprawa nie znajdzie rozwi�zania.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};

func void dia_pyrokar_irdorathbookopen_xardas()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00");	//Xardas powiedzia� mi, jak to zrobi�.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01");	//Ach, wi�c to tak! Bardzo ciekawe. Mam tylko nadziej�, �e wp�yw Xardasa na ciebie nie oka�e si� zgubny w skutkach!
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02");	//Ostrzegam ci�! Nie daj si� z�apa� na sztuczki tego starego diab�a. Kiedy� mo�esz tego po�a�owa�.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};


instance DIA_PYROKAR_GEHEIMEBIBLIOTHEK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_geheimebibliothek_condition;
	information = dia_pyrokar_geheimebibliothek_info;
	description = "Ta ksi�ga wspomina o tajemnej bibliotece.";
};


func int dia_pyrokar_geheimebibliothek_condition()
{
	if((ITWR_SCREADSHALLSOFIRDORATH == TRUE) && (KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_irdorathbookopen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_geheimebibliothek_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00");	//Ta ksi�ga wspomina o tajemnej bibliotece.
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01");	//Nie wiem, o czym m�wisz...
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02");	//M�wi� o bibliotece ukrytej pod tymi murami. Brzmi znajomo?
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03");	//Nie. Gdzie niby mia�aby si� znajdowa� ta 'tajemna biblioteka'?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04");	//Rozumiem. A wi�c nigdy o niej nie s�ysza�e�. Hmmm...
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Pyrokar nic nie wie na temat sekretnej biblioteki. Wygl�da na to, �e dost�p do niej ma tylko Xardas.");
};


instance DIA_PYROKAR_SCKNOWSWAYTOIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_scknowswaytoirdorath_condition;
	information = dia_pyrokar_scknowswaytoirdorath_info;
	description = "Wiem ju�, gdzie szuka� Dworu Irdorath.";
};


func int dia_pyrokar_scknowswaytoirdorath_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && Npc_KnowsInfo(other,dia_pyrokar_irdorathbookopen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_scknowswaytoirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//Wiem ju�, gdzie szuka� Dworu Irdorath.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01");	//�wi�tynia le�y na wyspie. Znalaz�em map� morsk�, kt�ra pokazuje jej po�o�enie.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02");	//To wspaniale. Zatem by wype�ni� zadanie, potrzebujesz teraz statku i za�ogi.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03");	//Pami�taj tylko, �e do walki z W�adc� Irdorath musisz si� odpowiednio przygotowa�.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04");	//Sk�d wezm� odpowiedni� za�og�?
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05");	//Twoja za�oga musi sk�ada� si� z ludzi, kt�rym mo�esz bezgranicznie zaufa�.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06");	//Porozmawiaj ze swoimi przyjaci�mi i zastan�w si�, kt�rzy z nich mogliby ci pom�c na wyspie.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07");	//Przyda ci si� te� jaki� mag, ale niestety nie mog� w tej chwili po�wi�ci� �adnego z braci.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08");	//Musisz poszuka� jakiego� maga poza murami klasztoru.
};


instance DIA_PYROKAR_SCWILLJORGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_scwilljorgen_condition;
	information = dia_pyrokar_scwilljorgen_info;
	description = "Jorgen jest do�wiadczonym �eglarzem.";
};


func int dia_pyrokar_scwilljorgen_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_pyrokar_scknowswaytoirdorath) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_scwilljorgen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_00");	//Jorgen jest do�wiadczonym �eglarzem. M�g�by mi pom�c dosta� si� na wysp�.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_01");	//Obawiam si�, �e to nie takie proste.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_02");	//Jest teraz cz�onkiem naszego bractwa. Nie zap�aci� jednak ani grosza ani nie przyprowadzi� nam owcy.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_03");	//Jorgen musi najpierw odpracowa� sw�j d�ug. Potem mo�esz go ze sob� zabra�.
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_04");	//Jak d�ugo to mo�e potrwa�?
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_05");	//Ten cz�owiek w ci�gu jednego dnia poch�on�� jad�o, kt�re zwyk�emu nowicjuszowi starczy�oby na tydzie�.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_06");	//Nie puszcz� go, p�ki nie odpracuje w naszych ogrodach przynajmniej trzech miesi�cy.
};


instance DIA_PYROKAR_MACHDTFREI(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_machdtfrei_condition;
	information = dia_pyrokar_machdtfrei_info;
	description = "To co mam zrobi�, je�li nie chcesz go zwolni�? Czeka� trzy miesi�ce?";
};


func int dia_pyrokar_machdtfrei_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_scwilljorgen) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_machdtfrei_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MACHDTFREI_15_00");	//To co mam zrobi�, je�li nie chcesz go zwolni�? Czeka� trzy miesi�ce?
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_01");	//Hmmm. W rzeczy samej, jest co�, co m�g�by� dla mnie zrobi�. Twoja przyja�� z Xardasem mo�e si� okaza� przydatna.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_02");	//Dosz�y mnie s�uchy, �e od kilku dni wok� wie�y nekromanty dziej� si� tajemnicze rzeczy.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_03");	//Mieszka�cy miasta widuj� w nocy dziwne �wiat�a. S�ysz� te� straszliwe wrzaski, dobiegaj�ce z tamtego kierunku.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_04");	//Jakby�my i bez tego nie mieli do�� k�opot�w! Chc�, �eby� si� tam uda� i zaj�� si� t� spraw�.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_05");	//Potem b�dziesz m�g� zabra� st�d Jorgena.
	MIS_PYROKARCLEARDEMONTOWER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PYROKARCLEARDEMONTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PYROKARCLEARDEMONTOWER,LOG_RUNNING);
	b_logentry(TOPIC_PYROKARCLEARDEMONTOWER,"W wie�y Xardasa dziej� si� dziwne rzeczy. Jorgen pomo�e mi w rozwik�aniu tej tajemnicy.");
};


instance DIA_PYROKAR_DTCLEARED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_dtcleared_condition;
	information = dia_pyrokar_dtcleared_info;
	description = "Sprawa wie�y Xardasa zosta�a rozwi�zana.";
};


func int dia_pyrokar_dtcleared_condition()
{
	if(Npc_IsDead(xardas_dt_demon1) && Npc_IsDead(xardas_dt_demon2) && Npc_IsDead(xardas_dt_demon3) && Npc_IsDead(xardas_dt_demon4) && Npc_IsDead(xardas_dt_demon5) && Npc_IsDead(xardas_dt_demonlord) && (MIS_PYROKARCLEARDEMONTOWER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_pyrokar_dtcleared_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DTCLEARED_15_00");	//Sprawa wie�y Xardasa zosta�a rozwi�zana.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_01");	//I co si� tam dzia�o?.. Nie, czekaj. Nawet nie chc� wiedzie�.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_02");	//Je�li nadal zale�y ci na pomocy Jorgena, mo�esz go ze sob� zabra�.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_03");	//Niech Innos ma ci� w swojej opiece.
	MIS_PYROKARCLEARDEMONTOWER = LOG_SUCCESS;
	b_giveplayerxp(XP_PYROKARCLEARDEMONTOWER);
};


var int pyro_gives_aura;

instance DIA_PYROKAR_AMULETTOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_amulettofdeath_condition;
	information = dia_pyrokar_amulettofdeath_info;
	permanent = TRUE;
	description = "Przepowiednia wspomina o �wi�tej Aurze Innosa.";
};


func int dia_pyrokar_amulettofdeath_condition()
{
	if((PLAYERGETSAMULETTOFDEATH == TRUE) && (PYRO_GIVES_AURA == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_amulettofdeath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_15_00");	//Przepowiednia wspomina o �wi�tej Aurze Innosa.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_11_01");	//Aura Innosa to amulet, kt�ry mog� nosi� tylko najpot�niejsi z mag�w.
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
	Info_AddChoice(dia_pyrokar_amulettofdeath,DIALOG_BACK,dia_pyrokar_amulettofdeath_back);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"Mog� go otrzyma�?",dia_pyrokar_amulettofdeath_canhaveit);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"Co to za amulet?",dia_pyrokar_amulettofdeath_amulett);
};

func void dia_pyrokar_amulettofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
};

func void dia_pyrokar_amulettofdeath_canhaveit()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00");	//Mog� go otrzyma�?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//A co zamierzasz z nim uczyni�?
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02");	//Wykorzysta� do walki ze smokiem.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03");	//Dobrze, dostaniesz ten amulet, ale obchod� si� z nim ostro�nie.
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04");	//Mo�esz by� o to spokojny.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05");	//Nie chcia�bym go p�niej odkupywa� od jakiego� handlarza.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06");	//U�ywaj go z rozs�dkiem. Niech Innos zawsze ma ci� w swojej pieczy.
	CreateInvItems(self,itam_amulettofdeath_mis,1);
	b_giveinvitems(self,other,itam_amulettofdeath_mis,1);
	PYRO_GIVES_AURA = TRUE;
};

func void dia_pyrokar_amulettofdeath_amulett()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00");	//Co to za amulet?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01");	//Pono� zosta� wykuty przez samego Innosa, kt�ry da� go ludzko�ci w prezencie.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02");	//Jego w�a�ciciel jest nieczu�y na wszelkie rany.
};


instance DIA_PYROKAR_POTIONOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_potionofdeath_condition;
	information = dia_pyrokar_potionofdeath_info;
	permanent = TRUE;
	description = "Opowiedz mi o �zach Innosa.";
};


func int dia_pyrokar_potionofdeath_condition()
{
	if(Npc_HasItems(other,itpo_potionofdeath_01_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_potionofdeath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_15_00");	//Opowiedz mi o �zach Innosa.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_11_01");	//�zy Innosa to tylko stara bajka dla dzieci. Opowiada o walce, kt�r� Innos stoczy� z Beliarem na pocz�tku �wiata.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Rozumiem.",dia_pyrokar_potionofdeath_aha);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Znalaz�em t� mikstur�.",dia_pyrokar_potionofdeath_potion);
};

func void dia_pyrokar_potionofdeath_aha()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Aha_15_00");	//Ach tak?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01");	//Zaczynam w�tpi�, czy w pe�ni zdajesz sobie spraw� z powagi sytuacji. Nie pokonasz nieprzyjaciela historyjk� dla dzieci.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_potion()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_00");	//Znalaz�em t� mikstur�.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01");	//To niemo�liwe! Nie wierz�!
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_02");	//Co� nie tak?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03");	//Je�li to s� w istocie �zy Innosa, to...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//�miem w�tpi�.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05");	//Nie przerywaj mi! Je�li to s� prawdziwe �zy Innosa, dostali�my do r�ki niezwykle pot�n� bro� przeciw nieprzyjacielowi.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,DIALOG_BACK,dia_pyrokar_potionofdeath_back);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Wi�c czym s� tak naprawd� te �zy Innosa?",dia_pyrokar_potionofdeath_teardrops);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Co masz na my�li, m�wi�c 'bro�'?",dia_pyrokar_potionofdeath_weapon);
};

func void dia_pyrokar_potionofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_teardrops()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00");	//Wi�c czym s� tak naprawd� te �zy Innosa?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01");	//Gdy Innos zrozumia�, �e w obronie swojego dzie�a przyjdzie mu stoczy� walk� z w�asnym bratem, bardzo si� zasmuci�.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02");	//Zacz�� �ka�, a jego �zy spad�y do naszego �wiata. By�o ich wiele, gdy� mi�osierny b�g p�aka� przez ca�e 13 lat.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03");	//Przejd�my do rzeczy.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04");	//Ludzie, kt�rzy znale�li jego �zy i skosztowali ich, zyskali nadnaturaln� si�� i jasno�� umys�u. Ujrzeli dzie�o Innosa w pe�nej krasie i zacz�li mu s�u�y�.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05");	//Byli to wi�c pierwsi cz�onkowie Bractwa Ognia. �zy da�y im si��, odwag� i m�dro��. Ale to by�o bardzo dawno temu, a odk�d po raz ostatni widziano �zy, min�o z g�r� 250 lat.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_weapon()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_00");	//Jak to 'bro�'?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01");	//Legenda g�osi, �e dzi�ki �zom wojownicy Innosa mogli dokonywa� nadludzkich wr�cz czyn�w.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02");	//Zdawali si� niewra�liwi na zm�czenie i mieli si�� dw�ch nied�wiedzi.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03");	//Najwspanialszych czyn�w dawnych dni dokonywano w�a�nie dzi�ki �zom.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//Rozumiem.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05");	//Ale �zy Innosa mog� te� nie�� cierpienie i �mier�. Tylko cz�onkowie naszego zakonu mog� ich skosztowa�.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06");	//Inni ludzie, nawet paladyni w s�u�bie naszego pana, zgin�liby w okrutnych m�czarniach.
	Npc_RemoveInvItems(hero,itpo_potionofdeath_01_mis,1);
	CreateInvItems(hero,itpo_potionofdeath_02_mis,1);
};


instance DIA_PYROKAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap6_exit_condition;
	information = dia_pyrokar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_PICKPOCKET(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 900;
	condition = dia_pyrokar_pickpocket_condition;
	information = dia_pyrokar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_pyrokar_pickpocket_condition()
{
	return c_beklauen(108,550);
};

func void dia_pyrokar_pickpocket_info()
{
	Info_ClearChoices(dia_pyrokar_pickpocket);
	Info_AddChoice(dia_pyrokar_pickpocket,DIALOG_BACK,dia_pyrokar_pickpocket_back);
	Info_AddChoice(dia_pyrokar_pickpocket,DIALOG_PICKPOCKET,dia_pyrokar_pickpocket_doit);
};

func void dia_pyrokar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pyrokar_pickpocket);
};

func void dia_pyrokar_pickpocket_back()
{
	Info_ClearChoices(dia_pyrokar_pickpocket);
};

