
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
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_00");	//A wiêc to ty jesteœ tym nowym nowicjuszem. Zak³adam, ¿e Mistrz Parlan przydzieli³ ci ju¿ jakieœ zadanie.
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_01");	//Wiesz przecie¿, ¿e zgodnie z wol¹ Innosa ka¿dy cz³onek naszej spo³ecznoœci musi wype³niaæ swoje obowi¹zki.
};


instance DIA_PYROKAR_HAGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_hagen_condition;
	information = dia_pyrokar_hagen_info;
	permanent = FALSE;
	description = "Muszê porozmawiaæ z paladynami. To bardzo wa¿ne.";
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
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_00");	//Muszê porozmawiaæ z paladynami. To bardzo wa¿ne.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_01");	//Zechciej nam zatem powiedzieæ, dlaczego tak ci œpieszno do rozmowy z nimi?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_02");	//Mam dla nich wa¿n¹ wiadomoœæ.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_03");	//W rzeczy samej? Có¿ to za wiadomoœæ?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_04");	//W Górniczej Dolinie zbieraj¹ siê si³y ciemnoœci prowadzone przez potê¿ne smoki. Musimy je powstrzymaæ, póki jeszcze czas.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_05");	//Hmmm... Rozwa¿ymy twoje s³owa, nowicjuszu. Gdy nadejdzie odpowiednia chwila, powiadomimy ciê o naszej decyzji.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_06");	//W miêdzyczasie wype³niaj sumiennie swoje obowi¹zki.
	if(Npc_KnowsInfo(other,dia_pyrokar_auge))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_07");	//Nie chcemy ciê tu d³u¿ej zatrzymywaæ. Mo¿esz ju¿ odejœæ.
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
	description = "Poszukujê Oka Innosa.";
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
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//Ka¿dy, komu wydaje siê, ¿e mo¿e nie tylko odnaleŸæ, ale i za³o¿yæ œwiêty amulet, jest skoñczonym g³upcem.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_02");	//To amulet wybiera swojego w³aœciciela. Tylko taka osoba mo¿e go nosiæ.
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_03");	//Chcia³bym spróbowaæ szczêœcia.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_04");	//Nowicjuszowi przystoi raczej pokora, a nie chêæ posiadania!
	b_logentry(TOPIC_INNOSEYE,"Nie przypuszcza³em, ¿e bêdzie to takie trudne, jednak Pyrokar nie chce dobrowolnie oddaæ Oka Innosa.");
	if(Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_05");	//Nie chcemy ciê tu d³u¿ej zatrzymywaæ. Mo¿esz ju¿ odejœæ.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_PYROKAR_MISSINGPEOPLE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_addon_pyrokar_missingpeople_condition;
	information = dia_addon_pyrokar_missingpeople_info;
	description = "Kilku mieszkañców Khorinis zaginê³o w dziwnych okolicznoœciach.";
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
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_00");	//Kilku mieszkañców Khorinis zaginê³o w dziwnych okolicznoœciach.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_01");	//Przykro mi z tego powodu. Doszliœmy jednak do wniosku, ¿e lepiej bêdzie, jeœli t¹ spraw¹ zajm¹ siê Magowie Wody.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_02");	//To samo dotyczy badania dziwnych trzêsieñ ziemi w pó³nocno-wschodnim Khorinis.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_03");	//Do tej pory nic nie sugeruje, aby konieczna by³a nasza interwencja, wiêc nie podejmiemy w tej sprawie ¿adnych kroków.
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_04");	//Tak, ale...
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_05");	//Nie ma ¿adnych ale! Bêdziemy postêpowaæ, jak uznamy za s³uszne. Mam nadziejê, ¿e zdo³asz uszanowaæ nasz¹ decyzjê.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Magowie Ognia ¿a³uj¹ porwanych obywateli, ale mówi¹, ¿e to zadanie dla Magów Wody. Lepiej nie oczekiwaæ od nich ¿adnej pomocy.");
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
	AI_Output(self,other,"DIA_Pyrokar_GOAWAY_11_00");	//Pos³uszeñstwo jest cnot¹, któr¹ wkrótce posi¹dziesz. W ten czy inny sposób!
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_FIRE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_fire_condition;
	information = dia_pyrokar_fire_info;
	permanent = FALSE;
	description = "Chcê siê poddaæ Próbie Ognia.";
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
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_00");	//Poddajcie mnie Próbie Ognia.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_01");	//A wiêc wiesz o... Chcesz przejœæ Próbê Ognia, tak?
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_02");	//Tak, Prawo Ognia g³osi, ¿e...
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_03");	//Znamy Prawo Ognia! Wiemy te¿, jak wielu nowicjuszy ginie podczas takiej próby. Lepiej dobrze przemyœl swoj¹ proœbê.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_04");	//Podj¹³em decyzjê. Poddam siê tej próbie.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_05");	//Jeœli naprawdê tego chcesz, Najwy¿sza Rada przychyli siê do twojej proœby.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_06");	//Nalegam, by poddano mnie Próbie Ognia.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_07");	//Niech wiêc tak siê stanie! Gdy bêdziesz gotów, ka¿dy cz³onek Najwy¿szej Rady zleci ci jedno zadanie, które musisz wype³niæ.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_08");	//Niech Innos ulituje siê nad twoj¹ dusz¹.
	b_logentry(TOPIC_FIRECONTEST,"Za¿¹da³em od Pyrokara Próby Ognia. Teraz muszê wype³niæ trzy wyznaczone mi przez Najwy¿sz¹ Radê zadania.");
};


instance DIA_PYROKAR_TEST(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_test_condition;
	information = dia_pyrokar_test_info;
	permanent = FALSE;
	description = "Mistrzu, jestem gotów poddaæ siê Próbie.";
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
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_00");	//Chcê siê zmierzyæ siê z twoim zadaniem, Mistrzu.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_01");	//Innos jeden wie, czy mu podo³asz... Poddam ciê tej samej próbie, któr¹ przechodz¹ najlepsi z nowicjuszy.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_02");	//Bêdzie to Próba Magii. Jak zapewne wiesz, test ten mo¿e ukoñczyæ pomyœlnie tylko JEDEN nowicjusz.
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_03");	//Rozumiem. Kim s¹ moi rywale?
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_04");	//W swej niezmierzonej m¹droœci, Innos wskaza³ trzech nowicjuszy, którzy wraz z tob¹ zostan¹ poddani próbie. S¹ to Agon, Igaraz i Ulf. Oni ju¿ rozpoczêli poszukiwania.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_05");	//Ale doœæ tej rozmowy! Wys³uchaj s³ów próby: 'IdŸ za znakami Innosa i przynieœ to, co wierz¹cy znajduje za œcie¿k¹'.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_06");	//Bêdziesz potrzebowa³ tego klucza.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_07");	//To wszystko, co mamy ci do powiedzenia.
	Log_CreateTopic(TOPIC_SCHNITZELJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCHNITZELJAGD,LOG_RUNNING);
	b_logentry(TOPIC_SCHNITZELJAGD,"Pyrokar przygotowuje dla mnie Próbê Magii. To ta sama próba, której zostali poddani nowicjusze Ulf, Igaraz i Agon.");
	b_logentry(TOPIC_SCHNITZELJAGD,"Mam pod¹¿aæ za znakami Innosa i przynieœæ 'to, co wierz¹cy znajdzie za œcie¿k¹'. Oprócz tej wskazówki dosta³em równie¿ klucz.");
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
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_00");	//Dopóki próba nie dobiegnie koñca, nie mamy ci nic wiêcej do powiedzenia.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_01");	//Na co jeszcze czekasz? IdŸ i zmierz siê ze swoim zadaniem!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_02");	//Nadszed³ czas, by poprzeæ wielkie s³owa wielkimi czynami. Chyba siê ze mn¹ zgodzisz, nowicjuszu?
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
	description = "Znalaz³em ten kamieñ runiczny.";
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
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_00");	//Znalaz³em ten kamieñ runiczny.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01");	//Niesamowite... uda³o ci siê! Poszed³eœ za znakami i odnalaz³eœ ukryty portal...
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_02");	//...pokonuj¹c przy okazji stado potworów, które planowa³y zjeœæ mnie na kolacjê, tak.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_03");	//A inni nowicjusze? Co z Agonem? Mo¿e wype³nili zadanie przed tob¹?
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_04");	//Wszyscy zawiedli. Widaæ nie by³o im s¹dzone przejœcie tej próby.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_05");	//Có¿, og³aszamy zatem, ¿e przeszed³eœ test. Runiczny kamieñ mo¿esz zachowaæ dla siebie.
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
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_00");	//Wype³ni³eœ wyznaczone przeze mnie zadanie.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//Ale...
	if(MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_02");	//...musisz jeszcze przejœæ test Ulthara.
	};
	if(MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_03");	//...musisz jeszcze przejœæ test Serpentesa.
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
	description = "Czy zostanê teraz przyjêty do gildii magów?";
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
	AI_Output(other,self,"DIA_Pyrokar_MAGICAN_15_00");	//Czy zostanê teraz przyjêty do gildii magów?
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_01");	//Gratulujê! Przeszed³eœ pomyœlnie Próbê Ognia. Od pocz¹tku byliœmy pewni, ¿e ci siê powiedzie.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_02");	//Tak, jak teraz jesteœmy pewni, ¿e dasz z siebie wszystko, by staæ siê GODNYM s³ug¹ Innosa.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_03");	//Jeœli jesteœ gotów z³o¿yæ Przysiêgê Ognia, przyjmiemy ciê teraz w nasze szeregi.
};


instance DIA_PYROKAR_OATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_oath_condition;
	information = dia_pyrokar_oath_info;
	permanent = FALSE;
	description = "Jestem gotów, by wst¹piæ do Krêgu Ognia.";
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
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_00");	//Jestem gotów, by wst¹piæ do Krêgu Ognia.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_01");	//Zatem wys³uchaj s³ów œwiêtej Przysiêgi Ognia.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_02");	//Czy przysiêgasz przed Innosem wszechpotê¿nym, jego wiernymi s³ugami i Œwiêtym P³omieniem...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_03");	//...¿e od teraz i na zawsze twoje ¿ycie bêdzie stanowiæ jednoœæ z Ogniem...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_04");	//...póki twe cia³o i dusza nie spoczn¹ w jego œwiêtym domu, gdy zgaœnie p³omieñ twego ¿ycia?
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_05");	//Przysiêgam.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_06");	//Sk³adaj¹c tê przysiêgê, zawar³eœ pakt ze Œwiêtym P³omieniem.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_07");	//Noœ tê szatê jako symbol tej wieczystej wiêzi.
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
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_08");	//Teraz, jako cz³onek naszej organizacji, mo¿esz porozmawiaæ z Lordem Hagenem, dowódc¹ paladynów.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_09");	//Chêtnie poznamy jego zdanie na temat ca³ej tej sprawy. Jesteœ wolny. Mo¿esz siê udaæ do Khorinis.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_10");	//Wierzymy tylko, ¿e niezw³ocznie przyniesiesz nam jego odpowiedŸ.
};


instance DIA_PYROKAR_LERNEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_lernen_condition;
	information = dia_pyrokar_lernen_info;
	permanent = FALSE;
	description = "Czego mogê siê teraz nauczyæ?";
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
	AI_Output(other,self,"DIA_Pyrokar_Lernen_15_00");	//Czego mogê siê teraz nauczyæ?
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_01");	//Przede wszystkim, masz prawo poznaæ wielk¹ tajemnicê krêgów magii. Dziêki niej bêdziesz móg³ wykorzystywaæ runy.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_02");	//Zg³êbiaj¹c kolejne z szeœciu krêgów magii, bêdziesz móg³ pos³ugiwaæ siê coraz potê¿niejszymi zaklêciami.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_03");	//Odpowiednie formu³y poznasz od braci z naszego klasztoru. Ka¿dy z nich specjalizuje siê w pewnej dziedzinie.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_04");	//Karras, na przyk³ad, jest mistrzem przywo³ywania, a Hyglas mo¿e ciê nauczyæ tajników magii ognia.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_05");	//Mistrzem w dziedzinie magii lodu i grzmotu jest Marduk. Parlan natomiast wprowadzi ciê w pierwsze krêgi i poka¿e kilka istotnych inkantacji.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_06");	//Ale ka¿dy z nich nauczy ciê tylko magicznych formu³. Stworzeniem odpowiednich run musisz siê zaj¹æ sam.
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Mistrz Parlan wprowadzi mnie do pierwszego Krêgu Magii.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brat Karras naucza formu³ inwokacji i przyzywania.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brat Hyglas mo¿e przybli¿yæ mi tajemnice ognia.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brat Marduk mo¿e opowiedzieæ mi o mocy lodu i pioruna.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brat Parlan naucza ró¿nych innych formu³.");
};


instance DIA_PYROKAR_WUNSCH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wunsch_condition;
	information = dia_pyrokar_wunsch_info;
	permanent = FALSE;
	description = "Mam jedno ¿yczenie...";
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
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_15_00");	//Mam jedno ¿yczenie...
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_01");	//Po przyjêciu w nasze szeregi ka¿dy mag ma prawo domagaæ siê spe³nienia jednego swojego ¿yczenia.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_02");	//Czego wiêc sobie ¿yczysz?
	Info_ClearChoices(dia_pyrokar_wunsch);
	Info_AddChoice(dia_pyrokar_wunsch,"Niczego.",dia_pyrokar_wunsch_nothing);
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Niech Babo zostanie nowym ogrodnikiem klasztoru.",dia_pyrokar_wunsch_babo);
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Chcê, by nowicjusz Opolos uzyska³ dostêp do biblioteki.",dia_pyrokar_wunsch_opolos);
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
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Nothing_11_01");	//Niech i tak bêdzie. Nowoprzyjêty mag rezygnuje ze swojego ¿yczenia!
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
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Dyrian_15_00");	//Pragnê, by nowicjusz Dyrian zosta³ w klasztorze.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01");	//Niech tak siê stanie.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02");	//Nowicjusz zostanie w klasztorze. Mo¿e obj¹æ posadê ogrodnika, która siê w³aœnie zwolni³a.
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
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Babo_15_00");	//Pragnê, by przyklasztorne ogrody zosta³y powierzone pieczy nowicjusza Babo.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_01");	//Niech tak siê stanie.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_02");	//Od dziœ odpowiedzialnoœæ za nasze ogrody przejmie nowicjusz Babo.
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
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Opolos_15_00");	//Chcê, by nowicjusz Opolos uzyska³ dostêp do biblioteki.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_01");	//Niech tak siê stanie.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_02");	//Od dziœ nowicjusz Opolos mo¿e bez przeszkód studiowaæ pisma Innosa.
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
	description = "Przynoszê wieœci dla Lorda Hagena...";
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
	AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_00");	//Przynoszê wieœci od Lorda Hagena. Mam mu dostarczyæ dowód na istnienie smoków.
	if(ENTEROW_KAPITEL2 == FALSE)
	{
		AI_Teleport(sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_01");	//W tym celu muszê siê udaæ do Górniczej Doliny.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_02");	//Rozumiem. Musisz oczywiœcie wype³niæ jego polecenie. Paladyn Sergio odprowadzi ciê na prze³êcz.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_03");	//Niech Innos ma ciê w swojej opiece.
		SERGIO_FOLLOW = TRUE;
		AI_StopProcessInfos(self);
		b_startotherroutine(sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_04");	//Dlatego od razu uda³em siê do Górniczej Doliny.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_05");	//Œwietnie. Skoro znasz ju¿ drogê, nie bêdziesz zapewne potrzebowa³ eskorty.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_06");	//Wype³nij polecenie Lorda Hagena i niech Innos ma ciê w swojej opiece.
	};
};


instance DIA_PYROKAR_TEACH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 4;
	condition = dia_pyrokar_teach_condition;
	information = dia_pyrokar_teach_info;
	permanent = TRUE;
	description = "Chcê poznaæ ostatni kr¹g magii.";
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
	AI_Output(other,self,"DIA_Pyrokar_TEACH_15_00");	//Chcê poznaæ ostatni kr¹g magii.
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		if(b_teachmagiccircle(self,other,6))
		{
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_01");	//Du¿o czasu minê³o, odk¹d zawar³eœ zwi¹zek ze Œwiêtym P³omieniem. Wiele siê od tamtej pory wydarzy³o.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_02");	//Jesteœ Wybrañcem Innosa. By wype³niæ czekaj¹ce ciê zadanie, bêdziesz potrzebowa³ ca³ej swojej si³y.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_03");	//Udzielê ci teraz b³ogos³awieñstwa. Niniejszym wkraczasz w szósty kr¹g magii. Obyœ zawsze niós³ œwiatu œwiat³o i rozprasza³ mrok.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_04");	//Jeœli chcesz, mogê ciê teraz nauczyæ formu³ ostatniego krêgu.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_05");	//Ach, jeszcze coœ. Na pocz¹tku ciê nie pozna³em...
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_06");	//...ale to ja wrêczy³em ci list, nim wrzucono ciê za Barierê.
			AI_Output(other,self,"DIA_Pyrokar_TEACH_15_07");	//Tak, oszczêdzi³eœ mi wtedy nadêtej przemowy sêdziego.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_08");	//A teraz jesteœ Wybrañcem Innosa.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_09");	//Przyjmij moje b³ogos³awieñstwo, Wybrañcze.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_10");	//Innosie, odwieczny Panie œwiat³a i ognia, pob³ogos³aw tego cz³owieka, swego umi³owanego s³ugê.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_11");	//Dodaj mu odwagi, si³y i m¹droœci, by móg³ pewnie pod¹¿aæ œcie¿k¹, któr¹ dla niego wybra³eœ.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_11_12");	//Twój czas jeszcze nie nadszed³. Krocz dalej po œcie¿ce, któr¹ wyznaczy³ ci Innos, a kiedyœ udzielê ci ostatniej lekcji.
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
	AI_Output(other,self,"DIA_Pyrokar_SPELLS_15_00");	//Podziel siê ze mn¹ swoj¹ wiedz¹.
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
		AI_Output(self,other,"DIA_Pyrokar_SPELLS_11_01");	//Nie mogê ciê ju¿ niczego nauczyæ.
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
	description = "Przysy³a mnie Parlan...";
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
	AI_Output(other,self,"DIA_Pyrokar_Parlan_15_00");	//Przysy³a mnie Parlan. Chcia³bym zwiêkszyæ swoje magiczne zdolnoœci.
	AI_Output(self,other,"DIA_Pyrokar_Parlan_11_01");	//Wiele siê ju¿ nauczy³eœ, a twa moc wzros³a. Od tej pory bêdziesz pobiera³ nauki bezpoœrednio u mnie.
};


instance DIA_PYROKAR_TEACH_MANA(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_teach_mana_condition;
	information = dia_pyrokar_teach_mana_info;
	permanent = TRUE;
	description = "Chcê zwiêkszyæ moj¹ magiczn¹ moc.";
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
	AI_Output(other,self,"DIA_Pyrokar_TEACH_MANA_15_00");	//Chcê zwiêkszyæ swoje magiczne zdolnoœci.
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_MANA_11_00");	//Czujê, ¿e potêga magii wype³nia ju¿ ka¿dy centymetr twojego cia³a. Nawet ja nie jestem w stanie dalej podnieœæ twoich umiejêtnoœci.
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
	description = "(B³ogos³awieñstwo)";
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
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_00");	//Pob³ogos³aw mnie, Mistrzu.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_01");	//Mo¿esz mnie pob³ogos³awiæ? Przyda³aby mi siê boska pomoc.
	};
	if((KAPITEL == 5) && (MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_02");	//Niech twe ostatnie starcie z odwiecznym wrogiem zakoñczy siê twoim zwyciêstwem. IdŸ w ³asce Innosa, mój synu.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_03");	//Niech Innos broni ciê od krzywdy i z³ej przygody na mrocznych œcie¿kach, którymi przysz³o ci kroczyæ.
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
	description = "Przybywam z Górniczej Doliny.";
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
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_00");	//Przybywam z Górniczej Doliny.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_01");	//Jakie wieœci przynosisz?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_02");	//Zebra³a siê tam potê¿na armia orków i smoków.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_03");	//To ju¿ wiemy od Miltena. A co z ³adunkiem rudy dla Króla?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_04");	//Niestety, ruda, któr¹ wydobyli ludzie Garonda, nie zaspokoi raczej potrzeb królewskiej armii.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_05");	//Zaiste, w mrocznych czasach przysz³o nam ¿yæ, skoro œwiat³o S³oñca ustêpuje dziœ miejsca ciemnoœci.
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_06");	//Zaatakowa³y mnie tajemnicze postaci w czarnych szatach.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_07");	//Tak, wiem. To Poszukiwacze - pomiot z otch³ani Beliara. Strze¿ siê ich, bo spróbuj¹ zaw³adn¹æ twoj¹ dusz¹.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_08");	//Jeœli im ulegniesz, przestaniesz byæ sob¹. Tylko w klasztorze znajdziesz wtedy pomoc, wiêc uwa¿aj na siebie.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar opowiedzia³ mi o Poszukiwaczach, odzianych w czarne szaty wys³annikach Beliara. Ostrzeg³ mnie, ¿e jeœli któryœ z nich mnie opêta, powinienem natychmiast wróciæ do klasztoru.");
	};
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_09");	//Poprosi³em Karrasa, by przyjrza³ siê tej sprawie trochê bli¿ej. Miejmy nadziejê, ¿e dziêki niemu znajdziemy jakieœ rozwi¹zanie tego problemu.
		PYROKARTOLDKARRASTORESEARCHDMT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Karras otrzyma³ od Pyrokara polecenie zlikwidowania zagro¿enia ze strony Poszukiwaczy.");
	};
	AI_Output(self,other,"DIA_Pyrokar_Add_11_00");	//WeŸ to. Gdybyœ potrzebowa³ pomocy, ta runa przeniesie ciê prosto do klasztoru.
	b_giveinvitems(self,other,itru_teleportmonastery,1);
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_10");	//Pamiêtaj: od twojej silnej woli zale¿¹ teraz losy nas wszystkich.
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
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_01");	//Widzê, ¿e sam Lord Hagen upowa¿ni³ ciê do zabrania œwiêtego amuletu.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_02");	//Niestety, muszê ciê rozczarowaæ. Padliœmy ofiar¹ niecnego spisku nieprzyjaciela.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_03");	//Oko Innosa zosta³o wykradzione ze œwiêtych murów klasztoru!
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Kto siê powa¿y³ na coœ takiego, Mistrzu?!",dia_pyrokar_giveinnoseye_wer);
	}
	else
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Kto to zrobi³?",dia_pyrokar_giveinnoseye_wer);
	};
};

func void dia_pyrokar_giveinnoseye_wer()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_00");	//Kto siê powa¿y³ na coœ takiego, Mistrzu?!
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_01");	//Kto to zrobi³?
	};
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_02");	//Si³y z³a cechuje niezwyk³a przebieg³oœæ i skrytoœæ, mój synu. Jego s³udzy rzadko dzia³aj¹ w œwietle dnia.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_03");	//A jednak ¿yjemy w dziwnych czasach. Dziœ nieprzyjaciel pokazuje siê w bia³y dzieñ na ulicach i placach miast.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_04");	//Jasny to znak, ¿e nie obawia siê swych wrogów i w walce z nimi nie cofnie siê przed niczym.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_05");	//Jeden z naszych oddanych braci, kandydat do zaszczytnego tytu³u Arcymaga Ognia, okaza³ siê szpiegiem nieprzyjaciela. Mówiê o Pedrze.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_06");	//Nieprzyjaciel zaw³adn¹³ jego dusz¹ i zaatakowa³ z najmniej spodziewanej strony.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_07");	//Pedro wdar³ siê do najœwiêtszych komnat klasztoru i wykrad³ z nich Oko.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_08");	//Obawiam siê, ¿e zbyt d³ugo przebywa³ sam poza murami klasztoru, pozbawiony naszej pomocy i nara¿ony na kuszenie ze strony Z³ego.
	pedro.flags = 0;
	PEDRO_TRAITOR = TRUE;
	b_logentry(TOPIC_INNOSEYE,"Œwietnie. Mo¿na siê by³o tego spodziewaæ. SpóŸni³em siê - te têpaki z klasztoru pozwoli³y, aby jakiœ nowicjusz skrad³ im Oko. Pozostaje mi tylko udaæ siê na poszukiwania Pedra i mieæ nadziejê, ¿e nie zd¹¿y³ jeszcze sprzedaæ swojego ³upu.");
	b_logentry(TOPIC_TRAITORPEDRO,"Zdrajca Pedro ukrad³ z klasztoru Oko Innosa. Za³o¿ê siê, ¿e Magowie Ognia chêtnie dostaliby go w swoje rêce.");
};


instance DIA_PYROKAR_NOVIZENCHASE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 34;
	condition = dia_pyrokar_novizenchase_condition;
	information = dia_pyrokar_novizenchase_info;
	description = "Uda³o wam siê ustaliæ, dok¹d zbieg³?";
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
	AI_Output(other,self,"DIA_Pyrokar_NOVIZENCHASE_15_00");	//Uda³o wam siê ustaliæ, dok¹d zbieg³?
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_01");	//Pedro powali³ na ziemiê kilku nowicjuszy, którzy próbowali go powstrzymaæ, po czym znikn¹³ w porannej mgle.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_02");	//Wys³aliœmy za nim naszych braci, by za wszelk¹ cenê odzyskali œwiêty amulet.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_03");	//Jeœli chcesz ich jeszcze dogoniæ, musisz siê poœpieszyæ. Wkrótce Pedro znajdzie siê poza naszym zasiêgiem.
	MIS_NOVIZENCHASE = LOG_RUNNING;
};


instance DIA_PYROKAR_FOUNDINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 35;
	condition = dia_pyrokar_foundinnoseye_condition;
	information = dia_pyrokar_foundinnoseye_info;
	description = "Znalaz³em Oko Innosa.";
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
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_00");	//Odzyska³em Oko Innosa. Obawiam siê, ¿e jest uszkodzone.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_01");	//Ale... to niemo¿liwe! Co siê sta³o?!
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_02");	//Amulet wpad³ w rêce plugawych istot. Przyby³em zbyt póŸno.
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_03");	//W tych lasach jest pewne niezwyk³e miejsce kultu, w kszta³cie pó³ksiê¿yca. Nieprzyjaciele odprawiali tam nad nim jakiœ tajemniczy rytua³.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_04");	//Niech Innos ma nas w swojej opiece! Zbezczeœcili nasz S³oneczny Kr¹g!
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_05");	//W najgorszych koszmarach nie przypuszcza³em, ¿e dysponuj¹ a¿ tak¹ moc¹.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	MIS_NOVIZENCHASE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
	Info_AddChoice(dia_pyrokar_foundinnoseye,"Co mo¿emy teraz zrobiæ?",dia_pyrokar_foundinnoseye_was);
};

func void dia_pyrokar_foundinnoseye_was()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_15_00");	//Co mo¿emy teraz zrobiæ?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_01");	//Nieprzyjaciel sta³ siê niezwykle groŸny, a mimo to ten prastary artefakt mo¿e jeszcze pokrzy¿owaæ jego plany.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_02");	//Musimy czym prêdzej naprawiæ Oko i przywróciæ mu dawn¹ moc. Czas dzia³a na nasz¹ niekorzyœæ.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_03");	//Wolê nie myœleæ, co siê teraz z nami stanie. Bez ochronnej mocy amuletu jesteœmy bezbronni wobec si³ ciemnoœci.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_04");	//Udaj siê do miasta i odszukaj tam Maga Wody imieniem Vatras. W tej straszliwej sytuacji tylko on nas jeszcze mo¿e ocaliæ. Zanieœ mu Oko. Œpiesz siê!
	Info_AddChoice(dia_pyrokar_foundinnoseye,DIALOG_BACK,dia_pyrokar_foundinnoseye_weiter);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_foundinnoseye,"Dlaczego w³aœnie Vatras?",dia_pyrokar_foundinnoseye_was_vatras);
	};
	Info_AddChoice(dia_pyrokar_foundinnoseye,"Co to za S³oneczny Kr¹g?",dia_pyrokar_foundinnoseye_sonnenkreis);
	b_logentry(TOPIC_INNOSEYE,"Pyrokar chce, abym uda³ siê do miasta i spyta³ Vatrasa, Maga Wody, co zrobiæ z uszkodzonym Okiem.");
	MIS_PYROKAR_GOTOVATRASINNOSEYE = LOG_RUNNING;
};

func void dia_pyrokar_foundinnoseye_was_vatras()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00");	//Dlaczego w³aœnie Vatras?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01");	//Przynale¿noœæ do Magów Ognia nie pozwala ci kwestionowaæ moich poleceñ, Bracie.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02");	//Vatras jest s³ug¹ Adanosa. Tylko pradawna m¹droœæ Magów Wody mo¿e nam pomóc.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03");	//To wszystko, co musisz wiedzieæ.
};

func void dia_pyrokar_foundinnoseye_sonnenkreis()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00");	//Co to za S³oneczny Kr¹g?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01");	//Ka¿dego roku wszyscy magowie i nowicjusze z klasztoru udaj¹ siê tam w czas przesilenia, by uczciæ pocz¹tek nowego cyklu.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02");	//Dobroczynna moc S³oñca jest w tym miejscu szczególnie silna.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03");	//Nigdy nie przypuszcza³em, ¿e mo¿na j¹ wykorzystaæ do mrocznych celów, a przecie¿ tak siê w³aœnie sta³o!
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
	description = "Rozmawia³em z Vatrasem.";
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
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_00");	//Rozmawia³em z Vatrasem.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_01");	//To œwietnie! Gdzie on jest?
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_02");	//Zamierza odprawiæ w S³onecznym Krêgu rytua³, który przywróci dawn¹ moc Oku Innosa.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_03");	//Jeœli to prawda, mo¿e jest jeszcze dla nas nadzieja.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_04");	//Vatras potrzebuje pomocy. Twojej i... Xardasa.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_05");	//CO TAKIEGO?! Xardas te¿ tam bêdzie?! Chyba nie mówisz powa¿nie.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_06");	//To nie by³ MÓJ pomys³. Vatras nalega, byœcie przybyli obydwaj.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_07");	//Xardas! Ci¹gle ten Xardas. Czy nigdy siê od niego nie uwolniê? Gorzej ju¿ chyba byæ nie mog³o.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_08");	//Sk¹d mam wiedzieæ, ¿e Xardas nie stoi po stronie nieprzyjaciela?
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_09");	//Nie zaufam temu nekromancie, niezale¿nie od tego, jak bardzo jest nam potrzebny.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_10");	//Przykro mi, ale w tej sytuacji nie mogê pomóc Vatrasowi.
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
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_00");	//Ale bez ciebie nie naprawimy amuletu! Vatras nie bêdzie móg³ odprawiæ rytua³u!
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_01");	//Musisz zaufaæ Xardasowi.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_02");	//Ja nic nie muszê, zrozumiano? Sk¹d mam wiedzieæ, ¿e Xardas nie zwróci siê nagle przeciw nam? Nie, nie zrobiê tego.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_03");	//A gdybym dostarczy³ ci jakiœ dowód?
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_04");	//To raczej niemo¿liwe. Musia³byœ mi przynieœæ coœ naprawdê wa¿nego.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_05");	//Jeœli chodzi o Xardasa, nie dam siê tak ³atwo przekonaæ.
	b_logentry(TOPIC_INNOSEYE,"Pyrokar nie chce nawet s³yszeæ o Xardasie. Muszê porozmawiaæ z Xardasem, mo¿e wspólnie wymyœlimy, jak nak³oniæ Pyrokara do stawienia siê na rytuale w S³onecznym Krêgu.");
	PYROKAR_DENIESINNOSEYERITUAL = TRUE;
};


instance DIA_PYROKAR_BUCHZURUECK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_buchzurueck_condition;
	information = dia_pyrokar_buchzurueck_info;
	description = "Xardas kaza³ mi wrêczyæ ci tê ksiêgê.";
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
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_00");	//Xardas kaza³ mi wrêczyæ ci tê ksiêgê.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_01");	//To dowód jego zaufania.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//Poka¿.
	b_giveinvitems(other,self,itwr_xardasbookforpyrokar_mis,1);
	Npc_RemoveInvItems(self,itwr_xardasbookforpyrokar_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_03");	//To niesamowite! Czy masz pojêcie, co mi w³aœnie przekaza³eœ?
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_04");	//Emmm.... Nie.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_05");	//To niezwykle stara ksiêga, która zaginê³a ca³e wieki temu.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_06");	//S¹dziliœmy, ¿e zosta³a zniszczona, a teraz dowiadujê siê, ¿e by³a w posiadaniu Xardasa!
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_07");	//Zatem zgodzisz siê uczestniczyæ w rytuale?
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_08");	//Tak, udam siê do S³onecznego Krêgu... Ale bynajmniej nie dlatego, ¿e uwierzy³em w dobre intencje Xardasa, o nie!
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_09");	//Wrêcz przeciwnie! Zamierzam wydusiæ z tego starego szakala, dlaczego tak d³ugo trzyma³ ksiêgê w ukryciu! Tym razem posun¹³ siê zbyt daleko!
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_10");	//Zobaczymy siê przy S³onecznym Krêgu.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"THRONE",-1);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	b_logentry(TOPIC_INNOSEYE,"Pyrokar zgodzi³ siê pójœæ do S³onecznego Krêgu.");
	PYROKAR_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_PYROKAR_PRERITUAL(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_preritual_condition;
	information = dia_pyrokar_preritual_info;
	permanent = TRUE;
	description = "Myœlisz, ¿e uda siê wam naprawiæ Oko?";
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
	AI_Output(other,self,"DIA_Pyrokar_PRERITUAL_15_00");	//Myœlisz, ¿e uda siê wam naprawiæ Oko Innosa?
	AI_Output(self,other,"DIA_Pyrokar_PRERITUAL_11_01");	//Trudno powiedzieæ. Wkrótce siê przekonamy.
};


instance DIA_PYROKAR_AUGEGEHEILT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_augegeheilt_condition;
	information = dia_pyrokar_augegeheilt_info;
	description = "Uda³o siê wam! Oko Innosa znowu jest ca³e!";
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
	AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_00");	//Uda³o siê wam! Oko Innosa znowu jest ca³e!
	AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_01");	//A¿ trudno uwierzyæ, ¿e siê nam powiod³o.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_02");	//To prawda, Mistrzu.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_03");	//Ju¿ dawno udowodni³eœ, ¿e jesteœ godzien, by nale¿eæ do najwy¿szych z Magów Ognia.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_04");	//Od dziœ jesteœ zatem cz³onkiem Rady. Bêdziesz reprezentowa³ klasztor na zewn¹trz. Mianujê ciê Arcymagiem Krêgu Ognia.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_05");	//Noœ tê szatê z godnoœci¹. S³aw w œwiecie dobre imiê klasztoru i pomna¿aj jego bogactwa.
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
	description = "Czy jest jeszcze coœ, czym powinienem siê zaj¹æ?";
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
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_00");	//Czy jest jeszcze coœ, czym powinienem siê zaj¹æ?
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_01");	//Nie traæmy czasu na drobiazgi. Rozpraw siê raz na zawsze z tymi przeklêtymi smokami. Proszê, oto Oko.
	CreateInvItems(self,itmi_innoseye_mis,1);
	b_giveinvitems(self,other,itmi_innoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_02");	//Pamiêtaj, ¿e nim zaatakujesz smoka, powinieneœ z nim porozmawiaæ.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_01");	//Potêga Oka zmusi smoki do rozmowy z tob¹ i nie pozwoli im sk³amaæ.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_02");	//Tak d³ugo, jak bêdziesz je nosi³, bêdzie ciê chroni³ przed smoczymi atakami.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_05");	//Jego moc nie jest jednak nieskoñczona i musisz je co jakiœ czas nape³niaæ magiczn¹ energi¹.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_06");	//W tym celu po³¹cz na stole alchemicznym Oko Innosa i esencjê ze smoczego serca.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_07");	//Dopiero wtedy mo¿esz stawiæ czo³a kolejnemu gadowi.
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_08");	//Dziêki. Bêdê o tym pamiêta³.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_09");	//Masz ju¿ wszystko, czego potrzebujesz. Ruszaj w drogê. Zosta³o nam niewiele czasu!
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	TOPIC_END_INNOSEYE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	CreateInvItems(gorax,itmi_runeblank,1);
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENJAGD,"Jestem gotów stawiæ czo³a smokom. Oko Innosa pozwoli mi odnieœæ zwyciêstwo. Muszê jednak pamiêtaæ, aby za³o¿yæ je przed ka¿d¹ bitw¹ z którymkolwiek ze smoków. Problem polega na tym, ¿e muszê przemówiæ do ka¿dej z tych bestii zanim je zaatakujê, a kiedy z nimi rozmawiam, Oko Innosa traci sw¹ moc. Zanim stawiê czo³a kolejnego smokowi, powinienem po³¹czyæ kamieñ z amuletu z wywarem ze smoczego serca, u¿ywaj¹c do tego celu sto³u alchemicznego i menzurki.");
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
	description = "Znalaz³em pewien tajemniczy almanach.";
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
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_00");	//Znalaz³em pewien tajemniczy almanach.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_01");	//Tak? Jaki almanach?
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_02");	//Nie jestem pewien. Mia³em nadziejê, ¿e ty mi to powiesz.
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_03");	//To rzeczywiœcie niepokoj¹ca ksiêga. M¹drze zrobi³eœ, przynosz¹c j¹ do mnie.
	b_giveplayerxp(XP_AMBIENT);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_04");	//Zak³adam, ¿e takich przeklêtych ksi¹g jest wiêcej. Musisz koniecznie odnaleŸæ je wszystkie.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_05");	//Myœlê, ¿e Poszukiwacze czerpi¹ z nich swoj¹ ponur¹ moc.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_06");	//Dziêki nim sprawuj¹ w³adzê nad zagubionymi duszami swoich ofiar.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_07");	//Wygl¹da na to, ¿e zapisuj¹ w nich imiona wszystkich ludzi, których zamierzaj¹ opêtaæ.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_08");	//S³uchaj. Dam ci ten magiczny list. Poznasz z niego imiona ofiar, które zapisano w ksiêgach.
		CreateInvItems(self,itwr_pyrokarsobsessionlist,1);
		b_giveinvitems(self,other,itwr_pyrokarsobsessionlist,1);
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_09");	//Odszukaj tych nieszczêœników i przynieœ mi ich ksiêgi, a ja spróbujê je zniszczyæ.
		if(Npc_IsDead(karras) == FALSE)
		{
			AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_10");	//Ale najpierw poka¿ przynajmniej jedn¹ z nich Karrasowi. To mo¿e pomóc w jego badaniach.
		};
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_11");	//Tylko pod ¿adnym pozorem nie próbuj sam niszczyæ tych almanachów. Nie jesteœ jeszcze gotów, by zmierzyæ siê z ich potêg¹.
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar chce unieszkodliwiæ Almanachy Opêtanych. Da³ mi listê wszystkich, których Poszukiwacze planuj¹ opêtaæ. Niewykluczone, ¿e bêdzie siê ona wyd³u¿aæ.");
	};
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_12");	//Nie zbli¿aj siê do Poszukiwaczy albo zaw³adn¹ twoj¹ dusz¹.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_13");	//Gdybyœ zacz¹³ ulegaæ ich podszeptom, wróæ czym prêdzej do mnie.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_14");	//Tylko tutaj, w klasztorze, twoja dusza mo¿e zostaæ uratowana.
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_15");	//Czy nie mo¿na jakoœ zablokowaæ ich mentalnych ataków?
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_16");	//Hmmm. To mo¿liwe. Mo¿e Karras coœ na to poradzi.
		PYROKAR_ASKKARRASABOUTDMTAMULETT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Karass ma mi pomóc w znalezieniu sposobu na odpieranie ataków Poszukiwaczy.");
	};
};


instance DIA_PYROKAR_SCOBSESSED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 70;
	condition = dia_pyrokar_scobsessed_condition;
	information = dia_pyrokar_scobsessed_info;
	permanent = TRUE;
	description = "(Leczenie z opêtania)";
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
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_00");	//Pomó¿ mi, Mistrzu. Z³o zaw³adnê³o mym umys³em!
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_01");	//WeŸ tê miksturê! Ona uleczy ciê z koszmarów.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_02");	//Niech mi³osierdzie Innosa bêdzie naszym zbawieniem.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_03");	//Dzia³aj w jego imieniu i strze¿ siê z³ego oka nieprzyjaciela.
			if(SC_OBSESSIONTIMES > 3)
			{
				AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//Ale uwa¿aj! Jeœli zbyt czêsto bêdziesz wystawia³ siê na ataki wroga, mo¿e nie byæ dla ciebie ratunku. Pamiêtaj o tym!
			};
			CreateInvItems(self,itpo_healobsession_mis,2);
			b_giveinvitems(self,other,itpo_healobsession_mis,2);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//Z³e si³y zaw³adnê³y mym umys³em! Mo¿esz mi pomóc?
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_06");	//Mogê, jeœli oka¿esz wystarczaj¹c¹ wdziêcznoœæ klasztorowi Innosa. 300 sztuk z³ota powinno wystarczyæ.
			Info_ClearChoices(dia_pyrokar_scobsessed);
			Info_AddChoice(dia_pyrokar_scobsessed,"To stanowczo za du¿o!",dia_pyrokar_scobsessed_nein);
			Info_AddChoice(dia_pyrokar_scobsessed,"Dobrze. Oto pieni¹dze.",dia_pyrokar_scobsessed_ok);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//Przecie¿ dopiero co dosta³eœ swoj¹ miksturê! Nie zawracaj mi g³owy bez potrzeby!
	};
};

func void dia_pyrokar_scobsessed_ok()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_ok_15_00");	//Dobrze. Oto pieni¹dze.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_01");	//Masz, wypij to. Niech mi³osierdzie Innosa bêdzie twoim zbawieniem.
		CreateInvItems(self,itpo_healobsession_mis,2);
		b_giveinvitems(self,other,itpo_healobsession_mis,2);
		GOT_HEALOBSESSION_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_02");	//Przynieœ pieni¹dze, a ukojê twój ból.
	};
	Info_ClearChoices(dia_pyrokar_scobsessed);
};

func void dia_pyrokar_scobsessed_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_nein_15_00");	//To stanowczo za du¿o!
	Info_ClearChoices(dia_pyrokar_scobsessed);
};


instance DIA_PYROKAR_ALMANACHBRINGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_pyrokar_almanachbringen_condition;
	information = dia_pyrokar_almanachbringen_info;
	permanent = TRUE;
	description = "Dowiedzia³em siê czegoœ wiêcej o tych opêtanych duszach.";
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
	AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_00");	//Dowiedzia³em siê czegoœ wiêcej o tych opêtanych duszach.
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_01");	//Mów, Bracie.
	pyrokarsalmanachoffer = 400;
	almanachcount = Npc_HasItems(other,itwr_dementorobsessionbook_mis);
	if(almanachcount == 1)
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_02");	//Znalaz³em kolejny almanach.
		b_giveplayerxp(XP_KDF_BRINGALMANACH);
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
		ALMANACHCOUNTER = ALMANACHCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_03");	//Przynoszê ci kolejne ksiêgi Poszukiwaczy.
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,almanachcount);
		xp_kdf_bringalmanachs = almanachcount * XP_KDF_BRINGALMANACH;
		ALMANACHCOUNTER = ALMANACHCOUNTER + almanachcount;
		b_giveplayerxp(xp_kdf_bringalmanachs);
	};
	if(ALMANACHCOUNTER <= 5)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_04");	//Dobrze siê spisa³eœ, ale obawiam siê, ¿e to jeszcze nie wszystkie. Szukaj dalej.
	}
	else if(ALMANACHCOUNTER <= 8)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_05");	//Wiele ju¿ odnalaz³eœ, ale obawiam siê, ¿e to jeszcze nie wszystkie.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_06");	//Przynios³eœ mi ju¿ bardzo du¿o przeklêtych ksi¹g.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_07");	//Zdziwi³bym siê, gdybyœmy nie mieli ju¿ wszystkich.
	};
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_08");	//Przyjmij od klasztoru ten dar. Pomo¿e ci on, gdy staniesz twarz¹ w twarz ze z³em.
	if(DIA_PYROKAR_ALMANACHBRINGEN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_09");	//I zagl¹daj co jakiœ czas do mojego magicznego listu!
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_10");	//Wrogowie mog¹ zaatakowaæ ludzi, których imion jeszcze nie poznaliœmy.
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
	description = "Wszystkie smoki nie ¿yj¹.";
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
	AI_Output(other,self,"DIA_Pyrokar_DRACHENTOT_15_00");	//Wszystkie smoki zosta³y pokonane.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_01");	//To dobra wiadomoœæ, ale nasze po³o¿enie nadal jest beznadziejne.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_02");	//Poszukiwacze nie zginêli wraz ze smokami. Wrêcz przeciwnie - s³yszê, ¿e w ci¹gu ostatnich dni ich liczba jeszcze siê zwiêkszy³a.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_03");	//Zabicie smoków z pewnoœci¹ os³abi³o przeciwnika, ale to wci¹¿ za ma³o. Musimy uderzyæ w samo serce Z³a.
};


instance DIA_PYROKAR_DERMEISTER(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_dermeister_condition;
	information = dia_pyrokar_dermeister_info;
	description = "Rozmawia³em ze smokami.";
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
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_00");	//Rozmawia³em ze smokami.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_01");	//I czego siê od nich dowiedzia³eœ?
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_02");	//Mówi³y o potêdze swojego pana, który ma mieszkaæ w Dworze Irdorath.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_03");	//Niech Innos ma nas w swojej opiece! A wiêc Czarna Œwi¹tynia odzyska³a sw¹ dawn¹ potêgê i wysy³a do naszego œwiata swoje s³ugi!
};


instance DIA_PYROKAR_WASISTIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wasistirdorath_condition;
	information = dia_pyrokar_wasistirdorath_info;
	description = "Co do za Dwór Irdorath?";
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
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_00");	//Co do za Dwór Irdorath?
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_01");	//To wschodnia œwi¹tynia boga Beliara. W królestwie Myrtany by³y takie cztery. Ale ta jest z nich wszystkich najbardziej przera¿aj¹ca.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_02");	//Jakieœ 40 lat temu, pó³nocna i zachodnia œwi¹tynia zosta³y zniszczone.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_03");	//Mê¿ni rycerze bior¹cy udzia³ w tym przedsiêwziêciu dopilnowali, by nie pozosta³ z nich kamieñ na kamieniu.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_04");	//Wtedy hordy nieprzyjaciela nie mia³y ¿adnych szans w starciu z zastêpami bohaterskich wojowników i paladynów.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_05");	//Zniszczenie pozosta³ych dwóch miejsc sekty wydawa³o siê tylko kwesti¹ czasu. Z³o mog³o wreszcie ponieœæ ostateczn¹ klêskê...
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_06");	//...ale gdy upad³a druga œwi¹tynia, pozosta³e po prostu zniknê³y!
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_07");	//Zniknê³y? Ca³e œwi¹tynie, tak? Jaaasne.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_08");	//Nie drwij ze mnie! Sytuacja jest powa¿na. Jeœli Dwór Irdorath odzyska³ swoj¹ dawn¹ potêgê, pokonanie nieprzyjaciela nie bêdzie takie proste.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_09");	//Najpierw trzeba go bowiem odnaleŸæ. Bêdzie to twoje nastêpne - i najtrudniejsze jak dot¹d - zadanie.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_10");	//Zrobiê, co w mojej mocy.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Wed³ug Pyrokara Dwór Irdorath to zaginiona œwi¹tynia Beliara. Muszê j¹ odnaleŸæ.");
};


instance DIA_PYROKAR_BUCHIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 54;
	condition = dia_pyrokar_buchirdorath_condition;
	information = dia_pyrokar_buchirdorath_info;
	description = "Co siê sta³o z t¹ 'zaginion¹' ksiêg¹ Xardasa?";
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
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_00");	//Co siê sta³o z t¹ 'zaginion¹' ksiêg¹ Xardasa?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_01");	//Spodziewa³em siê, ¿e o ni¹ zapytasz, ale niewielki bêdziesz mia³ z niej po¿ytek.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_02");	//Ksiêgê zamkniêto magiczn¹ pieczêci¹. Zabra³em j¹ do naszych pracowni, ale mimo wielu prób nie uda³o siê nam jej otworzyæ.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_03");	//Ten przeklêty Xardas znowu z nas zadrwi³.
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_04");	//Mogê zobaczyæ tê ksiêgê?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_05");	//Naturalnie. Œmiem jednak w¹tpiæ, by powiod³o ci siê tam, gdzie zawiedli najznamienitsi mistrzowie tego klasztoru.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_06");	//Ale proszê, próbuj œmia³o. Talamon nie bêdzie ciê powstrzymywa³.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Ksiêga Xardasa pt. 'DWÓR IRDORATH' znajduje siê w klasztornej krypcie. Strze¿e jej Talamon. Magowie nie mogli jej otworzyæ - ponoæ zosta³a zamkniêta przez Xardasa magiczn¹ pieczêci¹.");
	PYROKAR_LETYOUPASSTALAMON = TRUE;
};


instance DIA_PYROKAR_IRDORATHBOOKOPEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_irdorathbookopen_condition;
	information = dia_pyrokar_irdorathbookopen_info;
	description = "Uda³o mi siê otworzyæ ksiêgê Xardasa.";
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
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_15_00");	//Uda³o mi siê otworzyæ ksiêgê Xardasa.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_11_01");	//Co takiego?! Jak tego dokona³eœ? Bo ja, prawdê mówi¹c, straci³em ju¿ nadziejê.
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Xardas powiedzia³ mi, jak to zrobiæ.",dia_pyrokar_irdorathbookopen_xardas);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Pewnie mia³em szczêœcie, to wszystko.",dia_pyrokar_irdorathbookopen_glueck);
};

func void dia_pyrokar_irdorathbookopen_glueck()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00");	//Pewnie mia³em szczêœcie, to wszystko.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01");	//Nie opowiadaj bzdur! Jakie tam szczêœcie.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02");	//Nawet ja nie by³em w stanie z³amaæ tej przeklêtej pieczêci! A¿ tu nagle pojawia siê ktoœ taki jak ty i...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03");	//...daje mi du¿o do myœlenia.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04");	//W ka¿dym razie, jako ¿e to ty otworzy³eœ ksiêgê, pozwolê ci j¹ st¹d zabraæ. Przynajmniej dopóki ca³a ta sprawa nie znajdzie rozwi¹zania.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};

func void dia_pyrokar_irdorathbookopen_xardas()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00");	//Xardas powiedzia³ mi, jak to zrobiæ.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01");	//Ach, wiêc to tak! Bardzo ciekawe. Mam tylko nadziejê, ¿e wp³yw Xardasa na ciebie nie oka¿e siê zgubny w skutkach!
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02");	//Ostrzegam ciê! Nie daj siê z³apaæ na sztuczki tego starego diab³a. Kiedyœ mo¿esz tego po¿a³owaæ.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};


instance DIA_PYROKAR_GEHEIMEBIBLIOTHEK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_geheimebibliothek_condition;
	information = dia_pyrokar_geheimebibliothek_info;
	description = "Ta ksiêga wspomina o tajemnej bibliotece.";
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
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00");	//Ta ksiêga wspomina o tajemnej bibliotece.
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01");	//Nie wiem, o czym mówisz...
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02");	//Mówiê o bibliotece ukrytej pod tymi murami. Brzmi znajomo?
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03");	//Nie. Gdzie niby mia³aby siê znajdowaæ ta 'tajemna biblioteka'?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04");	//Rozumiem. A wiêc nigdy o niej nie s³ysza³eœ. Hmmm...
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Pyrokar nic nie wie na temat sekretnej biblioteki. Wygl¹da na to, ¿e dostêp do niej ma tylko Xardas.");
};


instance DIA_PYROKAR_SCKNOWSWAYTOIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_scknowswaytoirdorath_condition;
	information = dia_pyrokar_scknowswaytoirdorath_info;
	description = "Wiem ju¿, gdzie szukaæ Dworu Irdorath.";
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
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//Wiem ju¿, gdzie szukaæ Dworu Irdorath.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01");	//Œwi¹tynia le¿y na wyspie. Znalaz³em mapê morsk¹, która pokazuje jej po³o¿enie.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02");	//To wspaniale. Zatem by wype³niæ zadanie, potrzebujesz teraz statku i za³ogi.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03");	//Pamiêtaj tylko, ¿e do walki z W³adc¹ Irdorath musisz siê odpowiednio przygotowaæ.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04");	//Sk¹d wezmê odpowiedni¹ za³ogê?
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05");	//Twoja za³oga musi sk³adaæ siê z ludzi, którym mo¿esz bezgranicznie zaufaæ.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06");	//Porozmawiaj ze swoimi przyjació³mi i zastanów siê, którzy z nich mogliby ci pomóc na wyspie.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07");	//Przyda ci siê te¿ jakiœ mag, ale niestety nie mogê w tej chwili poœwiêciæ ¿adnego z braci.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08");	//Musisz poszukaæ jakiegoœ maga poza murami klasztoru.
};


instance DIA_PYROKAR_SCWILLJORGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_scwilljorgen_condition;
	information = dia_pyrokar_scwilljorgen_info;
	description = "Jorgen jest doœwiadczonym ¿eglarzem.";
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
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_00");	//Jorgen jest doœwiadczonym ¿eglarzem. Móg³by mi pomóc dostaæ siê na wyspê.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_01");	//Obawiam siê, ¿e to nie takie proste.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_02");	//Jest teraz cz³onkiem naszego bractwa. Nie zap³aci³ jednak ani grosza ani nie przyprowadzi³ nam owcy.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_03");	//Jorgen musi najpierw odpracowaæ swój d³ug. Potem mo¿esz go ze sob¹ zabraæ.
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_04");	//Jak d³ugo to mo¿e potrwaæ?
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_05");	//Ten cz³owiek w ci¹gu jednego dnia poch³on¹³ jad³o, które zwyk³emu nowicjuszowi starczy³oby na tydzieñ.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_06");	//Nie puszczê go, póki nie odpracuje w naszych ogrodach przynajmniej trzech miesiêcy.
};


instance DIA_PYROKAR_MACHDTFREI(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_machdtfrei_condition;
	information = dia_pyrokar_machdtfrei_info;
	description = "To co mam zrobiæ, jeœli nie chcesz go zwolniæ? Czekaæ trzy miesi¹ce?";
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
	AI_Output(other,self,"DIA_Pyrokar_MACHDTFREI_15_00");	//To co mam zrobiæ, jeœli nie chcesz go zwolniæ? Czekaæ trzy miesi¹ce?
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_01");	//Hmmm. W rzeczy samej, jest coœ, co móg³byœ dla mnie zrobiæ. Twoja przyjaŸñ z Xardasem mo¿e siê okazaæ przydatna.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_02");	//Dosz³y mnie s³uchy, ¿e od kilku dni wokó³ wie¿y nekromanty dziej¹ siê tajemnicze rzeczy.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_03");	//Mieszkañcy miasta widuj¹ w nocy dziwne œwiat³a. S³ysz¹ te¿ straszliwe wrzaski, dobiegaj¹ce z tamtego kierunku.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_04");	//Jakbyœmy i bez tego nie mieli doœæ k³opotów! Chcê, ¿ebyœ siê tam uda³ i zaj¹³ siê t¹ spraw¹.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_05");	//Potem bêdziesz móg³ zabraæ st¹d Jorgena.
	MIS_PYROKARCLEARDEMONTOWER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PYROKARCLEARDEMONTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PYROKARCLEARDEMONTOWER,LOG_RUNNING);
	b_logentry(TOPIC_PYROKARCLEARDEMONTOWER,"W wie¿y Xardasa dziej¹ siê dziwne rzeczy. Jorgen pomo¿e mi w rozwik³aniu tej tajemnicy.");
};


instance DIA_PYROKAR_DTCLEARED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_dtcleared_condition;
	information = dia_pyrokar_dtcleared_info;
	description = "Sprawa wie¿y Xardasa zosta³a rozwi¹zana.";
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
	AI_Output(other,self,"DIA_Pyrokar_DTCLEARED_15_00");	//Sprawa wie¿y Xardasa zosta³a rozwi¹zana.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_01");	//I co siê tam dzia³o?.. Nie, czekaj. Nawet nie chcê wiedzieæ.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_02");	//Jeœli nadal zale¿y ci na pomocy Jorgena, mo¿esz go ze sob¹ zabraæ.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_03");	//Niech Innos ma ciê w swojej opiece.
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
	description = "Przepowiednia wspomina o œwiêtej Aurze Innosa.";
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
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_15_00");	//Przepowiednia wspomina o œwiêtej Aurze Innosa.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_11_01");	//Aura Innosa to amulet, który mog¹ nosiæ tylko najpotê¿niejsi z magów.
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
	Info_AddChoice(dia_pyrokar_amulettofdeath,DIALOG_BACK,dia_pyrokar_amulettofdeath_back);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"Mogê go otrzymaæ?",dia_pyrokar_amulettofdeath_canhaveit);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"Co to za amulet?",dia_pyrokar_amulettofdeath_amulett);
};

func void dia_pyrokar_amulettofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
};

func void dia_pyrokar_amulettofdeath_canhaveit()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00");	//Mogê go otrzymaæ?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//A co zamierzasz z nim uczyniæ?
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02");	//Wykorzystaæ do walki ze smokiem.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03");	//Dobrze, dostaniesz ten amulet, ale obchodŸ siê z nim ostro¿nie.
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04");	//Mo¿esz byæ o to spokojny.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05");	//Nie chcia³bym go póŸniej odkupywaæ od jakiegoœ handlarza.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06");	//U¿ywaj go z rozs¹dkiem. Niech Innos zawsze ma ciê w swojej pieczy.
	CreateInvItems(self,itam_amulettofdeath_mis,1);
	b_giveinvitems(self,other,itam_amulettofdeath_mis,1);
	PYRO_GIVES_AURA = TRUE;
};

func void dia_pyrokar_amulettofdeath_amulett()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00");	//Co to za amulet?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01");	//Ponoæ zosta³ wykuty przez samego Innosa, który da³ go ludzkoœci w prezencie.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02");	//Jego w³aœciciel jest nieczu³y na wszelkie rany.
};


instance DIA_PYROKAR_POTIONOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_potionofdeath_condition;
	information = dia_pyrokar_potionofdeath_info;
	permanent = TRUE;
	description = "Opowiedz mi o ³zach Innosa.";
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
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_15_00");	//Opowiedz mi o £zach Innosa.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_11_01");	//£zy Innosa to tylko stara bajka dla dzieci. Opowiada o walce, któr¹ Innos stoczy³ z Beliarem na pocz¹tku œwiata.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Rozumiem.",dia_pyrokar_potionofdeath_aha);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Znalaz³em tê miksturê.",dia_pyrokar_potionofdeath_potion);
};

func void dia_pyrokar_potionofdeath_aha()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Aha_15_00");	//Ach tak?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01");	//Zaczynam w¹tpiæ, czy w pe³ni zdajesz sobie sprawê z powagi sytuacji. Nie pokonasz nieprzyjaciela historyjk¹ dla dzieci.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_potion()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_00");	//Znalaz³em tê miksturê.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01");	//To niemo¿liwe! Nie wierzê!
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_02");	//Coœ nie tak?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03");	//Jeœli to s¹ w istocie £zy Innosa, to...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//Œmiem w¹tpiæ.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05");	//Nie przerywaj mi! Jeœli to s¹ prawdziwe £zy Innosa, dostaliœmy do rêki niezwykle potê¿n¹ broñ przeciw nieprzyjacielowi.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,DIALOG_BACK,dia_pyrokar_potionofdeath_back);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Wiêc czym s¹ tak naprawdê te ³zy Innosa?",dia_pyrokar_potionofdeath_teardrops);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Co masz na myœli, mówi¹c 'broñ'?",dia_pyrokar_potionofdeath_weapon);
};

func void dia_pyrokar_potionofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_teardrops()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00");	//Wiêc czym s¹ tak naprawdê te £zy Innosa?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01");	//Gdy Innos zrozumia³, ¿e w obronie swojego dzie³a przyjdzie mu stoczyæ walkê z w³asnym bratem, bardzo siê zasmuci³.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02");	//Zacz¹³ ³kaæ, a jego ³zy spad³y do naszego œwiata. By³o ich wiele, gdy¿ mi³osierny bóg p³aka³ przez ca³e 13 lat.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03");	//PrzejdŸmy do rzeczy.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04");	//Ludzie, którzy znaleŸli jego ³zy i skosztowali ich, zyskali nadnaturaln¹ si³ê i jasnoœæ umys³u. Ujrzeli dzie³o Innosa w pe³nej krasie i zaczêli mu s³u¿yæ.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05");	//Byli to wiêc pierwsi cz³onkowie Bractwa Ognia. £zy da³y im si³ê, odwagê i m¹droœæ. Ale to by³o bardzo dawno temu, a odk¹d po raz ostatni widziano £zy, minê³o z gór¹ 250 lat.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_weapon()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_00");	//Jak to 'broñ'?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01");	//Legenda g³osi, ¿e dziêki £zom wojownicy Innosa mogli dokonywaæ nadludzkich wrêcz czynów.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02");	//Zdawali siê niewra¿liwi na zmêczenie i mieli si³ê dwóch niedŸwiedzi.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03");	//Najwspanialszych czynów dawnych dni dokonywano w³aœnie dziêki £zom.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//Rozumiem.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05");	//Ale £zy Innosa mog¹ te¿ nieœæ cierpienie i œmieræ. Tylko cz³onkowie naszego zakonu mog¹ ich skosztowaæ.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06");	//Inni ludzie, nawet paladyni w s³u¿bie naszego pana, zginêliby w okrutnych mêczarniach.
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

