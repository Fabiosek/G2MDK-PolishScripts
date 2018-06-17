
var int diego_coming;

instance DIA_GERBRANDT_EXIT(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 999;
	condition = dia_gerbrandt_exit_condition;
	information = dia_gerbrandt_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerbrandt_exit_condition()
{
	return TRUE;
};

func void dia_gerbrandt_exit_info()
{
	if(DIEGO_COMING == TRUE)
	{
		DIEGONW = Hlp_GetNpc(pc_thief_nw);
		if(DIEGO_ISONBOARD == FALSE)
		{
			b_startotherroutine(diegonw,"GERBRANDT");
		};
		Npc_ExchangeRoutine(self,"NEWLIFE");
		b_startotherroutine(gerbrandtsfrau,"NEWLIFE");
		DIEGO_COMING = 2;
	};
	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_PICKPOCKET(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 900;
	condition = dia_gerbrandt_pickpocket_condition;
	information = dia_gerbrandt_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego mieszka bêdzie ³atwa)";
};


func int dia_gerbrandt_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)) && (DIEGO_COMING != TRUE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_pickpocket_info()
{
	Info_ClearChoices(dia_gerbrandt_pickpocket);
	Info_AddChoice(dia_gerbrandt_pickpocket,DIALOG_BACK,dia_gerbrandt_pickpocket_back);
	Info_AddChoice(dia_gerbrandt_pickpocket,DIALOG_PICKPOCKET,dia_gerbrandt_pickpocket_doit);
};

func void dia_gerbrandt_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itse_goldpocket100,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_gerbrandt_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gerbrandt_pickpocket_back()
{
	Info_ClearChoices(dia_gerbrandt_pickpocket);
};


instance DIA_GERBRANDT_HELLO(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 5;
	condition = dia_gerbrandt_hello_condition;
	information = dia_gerbrandt_hello_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_gerbrandt_hello_condition()
{
	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (DIEGO_COMING == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_hello_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//Kim jesteœ? Wygl¹da na to, ¿e chyba nie wiesz za bardzo, co siê tutaj dzieje.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//Nazywaj¹ mnie Gerbrandt. Ale dla ciebie jestem Pan Gerbrandt, jasne?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"Rozumiem.",dia_gerbrandt_hello_no);
	Info_AddChoice(dia_gerbrandt_hello,"Zrozumia³em, proszê pana.",dia_gerbrandt_hello_yes);
};

func void dia_gerbrandt_hello_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//Rozumiem.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//Uwa¿aj na s³owa. Lepiej traktuj mnie z nale¿ytym szacunkiem, bo mo¿esz wpaœæ w k³opoty.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//To ja poci¹gam tutaj za sznurki. Jeœli ktoœ sprawia k³opoty, to czeka go spotkanie ze mn¹, wiêc lepiej, ¿eby czym prêdzej opuœci³ miasto, albo po¿a³uje.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//Wiêkszoœæ ludzi w porcie pracuje dla mnie. Jeœli kiedyœ bêdziesz szuka³ pracy, by³oby lepiej dla ciebie, ¿ebyœ mi siê dobrze kojarzy³.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//Zrozumia³em, proszê pana.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//Przynajmniej szybko za³apa³eœ, jak tu sprawy stoj¹.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//Jestem pewien, ¿e gdy tylko interes zacznie siê znowu krêciæ, przyda mi siê taki postawny ch³op jak ty.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//By³byœ doskona³ym magazynierem.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//Umiesz czytaæ?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"Nie.",dia_gerbrandt_hello_yes_no);
	Info_AddChoice(dia_gerbrandt_hello,"Nie chcê pracy.",dia_gerbrandt_hello_nojob);
	Info_AddChoice(dia_gerbrandt_hello,"Oczywiœcie.",dia_gerbrandt_hello_yes_yes);
};

func void dia_gerbrandt_hello_yes_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//Nie.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//Niewa¿ne, przynajmniej bêdziesz móg³ nosiæ worki.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//Je¿eli bêdê zadowolony z twojej postawy, byæ mo¿e zaoferujê ci sta³¹ posadê. Tutaj nie brakuje pracy.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//Zatem bêdê ciê oczekiwa³, kiedy do doków zawin¹ pierwsze statki.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_nojob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//Nie chcê pracy.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//Wydaje ci siê, ¿e jesteœ strasznie m¹dry. Uwa¿aj, bo tutaj nikt nie dostanie roboty, jeœli siê na to nie zgodzê.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//Jak nie przestaniesz pyskowaæ, to bêdziesz spaæ na zapluskwionym materacu - bo tylko na tyle bêdzie ciê staæ.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//Przyjdzie czas, ¿e bêdziesz mnie b³agaæ o pracê.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//Oczywiœcie.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//Dobrze, dobrze. Trudno znaleŸæ wykwalifikowanych pracowników.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//Masz mo¿e jakieœ referencje?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//Referencje?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//No dobrze, zapamiêtam twoj¹ twarz. Kiedy interes znowu zacznie siê krêciæ, przyjdŸ do mnie. Byæ mo¿e bêdê mia³ dla ciebie pracê.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void b_gerbrandt_pissoff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//O co chodzi? Kpisz ze mnie?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//Ty i ten twój kole¿ka Diego narobiliœcie ju¿ doœæ zniszczeñ.
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_02");	//Zostaw mnie!
	if(DIEGO_COMING != TRUE)
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_GERBRANDT_PERM(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 800;
	condition = dia_gerbrandt_perm_condition;
	information = dia_gerbrandt_perm_info;
	permanent = TRUE;
	description = "Coœ nowego?";
};


func int dia_gerbrandt_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_gerbrandt_hello))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_perm_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//Coœ nowego?
	if(KAPITEL <= 2)
	{
		if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//Tacy jak ty nie maj¹ tu czego szukaæ. Tutaj mieszkaj¹ szanowani obywatele, a nie w³óczêdzy i oszuœci.
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//Je¿eli kiedyœ uda ci siê zdobyæ bogactwo i szacunek, to byæ mo¿e spotka ciê tutaj cieplejsze powitanie.
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//Nie mogê siê skar¿yæ, Szlachetny Panie.
		};
	}
	else if(KAPITEL >= 3)
	{
		if(MIS_DIEGOSRESIDENCE != LOG_SUCCESS)
		{
			if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//Widzia³em ju¿ takich jak ty - po prostu nie wiecie, gdzie wasze miejsce.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//Porozmawiam z gubernatorem na temat podjêcia odpowiednich œrodków bezpieczeñstwa w górnym mieœcie.
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//To moja prywatna sprawa. Jestem zajêty!
			};
		}
		else
		{
			b_gerbrandt_pissoff();
		};
	};
};


instance DIA_GERBRANDT_GREETINGSFROMDIEGO(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_greetingsfromdiego_condition;
	information = dia_gerbrandt_greetingsfromdiego_info;
	permanent = FALSE;
	description = "Diego przesy³a pozdrowienia.";
};


func int dia_gerbrandt_greetingsfromdiego_condition()
{
	if((MIS_DIEGOSRESIDENCE == LOG_RUNNING) && (Npc_HasItems(other,itwr_diegosletter_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_greetingsfromdiego_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//Diego przesy³a pozdrowienia.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//Co? Kto? Jaki Diego? Co za Diego?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//I chcia³, ¿ebym przekaza³ ci ten list.
	b_giveinvitems(other,self,itwr_diegosletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//To niemo¿liwe. Nie. Ju¿ po mnie!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//Czy jest w mieœcie?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//Kto?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//Diego, oczywiœcie!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//Tak, wkrótce mamy siê tu spotkaæ.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//Zatem to koniec. Wszystko stracone.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//Nie mam czasu. Muszê siê st¹d wynosiæ i to szybko. Jeœli mnie tu znajdzie, jestem skoñczony.
	MIS_DIEGOSRESIDENCE = LOG_SUCCESS;
	b_giveplayerxp(XP_DIEGOSRESIDENCE);
	DIEGO_COMING = TRUE;
};

