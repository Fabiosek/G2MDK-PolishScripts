
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
	description = "(Kradzie� tego mieszka b�dzie �atwa)";
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
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//Kim jeste�? Wygl�da na to, �e chyba nie wiesz za bardzo, co si� tutaj dzieje.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//Nazywaj� mnie Gerbrandt. Ale dla ciebie jestem Pan Gerbrandt, jasne?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"Rozumiem.",dia_gerbrandt_hello_no);
	Info_AddChoice(dia_gerbrandt_hello,"Zrozumia�em, prosz� pana.",dia_gerbrandt_hello_yes);
};

func void dia_gerbrandt_hello_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//Rozumiem.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//Uwa�aj na s�owa. Lepiej traktuj mnie z nale�ytym szacunkiem, bo mo�esz wpa�� w k�opoty.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//To ja poci�gam tutaj za sznurki. Je�li kto� sprawia k�opoty, to czeka go spotkanie ze mn�, wi�c lepiej, �eby czym pr�dzej opu�ci� miasto, albo po�a�uje.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//Wi�kszo�� ludzi w porcie pracuje dla mnie. Je�li kiedy� b�dziesz szuka� pracy, by�oby lepiej dla ciebie, �eby� mi si� dobrze kojarzy�.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//Zrozumia�em, prosz� pana.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//Przynajmniej szybko za�apa�e�, jak tu sprawy stoj�.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//Jestem pewien, �e gdy tylko interes zacznie si� znowu kr�ci�, przyda mi si� taki postawny ch�op jak ty.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//By�by� doskona�ym magazynierem.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//Umiesz czyta�?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"Nie.",dia_gerbrandt_hello_yes_no);
	Info_AddChoice(dia_gerbrandt_hello,"Nie chc� pracy.",dia_gerbrandt_hello_nojob);
	Info_AddChoice(dia_gerbrandt_hello,"Oczywi�cie.",dia_gerbrandt_hello_yes_yes);
};

func void dia_gerbrandt_hello_yes_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//Nie.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//Niewa�ne, przynajmniej b�dziesz m�g� nosi� worki.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//Je�eli b�d� zadowolony z twojej postawy, by� mo�e zaoferuj� ci sta�� posad�. Tutaj nie brakuje pracy.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//Zatem b�d� ci� oczekiwa�, kiedy do dok�w zawin� pierwsze statki.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_nojob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//Nie chc� pracy.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//Wydaje ci si�, �e jeste� strasznie m�dry. Uwa�aj, bo tutaj nikt nie dostanie roboty, je�li si� na to nie zgodz�.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//Jak nie przestaniesz pyskowa�, to b�dziesz spa� na zapluskwionym materacu - bo tylko na tyle b�dzie ci� sta�.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//Przyjdzie czas, �e b�dziesz mnie b�aga� o prac�.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//Oczywi�cie.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//Dobrze, dobrze. Trudno znale�� wykwalifikowanych pracownik�w.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//Masz mo�e jakie� referencje?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//Referencje?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//No dobrze, zapami�tam twoj� twarz. Kiedy interes znowu zacznie si� kr�ci�, przyjd� do mnie. By� mo�e b�d� mia� dla ciebie prac�.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void b_gerbrandt_pissoff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//O co chodzi? Kpisz ze mnie?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//Ty i ten tw�j kole�ka Diego narobili�cie ju� do�� zniszcze�.
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
	description = "Co� nowego?";
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
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//Co� nowego?
	if(KAPITEL <= 2)
	{
		if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//Tacy jak ty nie maj� tu czego szuka�. Tutaj mieszkaj� szanowani obywatele, a nie w��cz�dzy i oszu�ci.
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//Je�eli kiedy� uda ci si� zdoby� bogactwo i szacunek, to by� mo�e spotka ci� tutaj cieplejsze powitanie.
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//Nie mog� si� skar�y�, Szlachetny Panie.
		};
	}
	else if(KAPITEL >= 3)
	{
		if(MIS_DIEGOSRESIDENCE != LOG_SUCCESS)
		{
			if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//Widzia�em ju� takich jak ty - po prostu nie wiecie, gdzie wasze miejsce.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//Porozmawiam z gubernatorem na temat podj�cia odpowiednich �rodk�w bezpiecze�stwa w g�rnym mie�cie.
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//To moja prywatna sprawa. Jestem zaj�ty!
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
	description = "Diego przesy�a pozdrowienia.";
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
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//Diego przesy�a pozdrowienia.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//Co? Kto? Jaki Diego? Co za Diego?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//I chcia�, �ebym przekaza� ci ten list.
	b_giveinvitems(other,self,itwr_diegosletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//To niemo�liwe. Nie. Ju� po mnie!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//Czy jest w mie�cie?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//Kto?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//Diego, oczywi�cie!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//Tak, wkr�tce mamy si� tu spotka�.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//Zatem to koniec. Wszystko stracone.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//Nie mam czasu. Musz� si� st�d wynosi� i to szybko. Je�li mnie tu znajdzie, jestem sko�czony.
	MIS_DIEGOSRESIDENCE = LOG_SUCCESS;
	b_giveplayerxp(XP_DIEGOSRESIDENCE);
	DIEGO_COMING = TRUE;
};

