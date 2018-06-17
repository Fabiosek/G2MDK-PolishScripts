
instance DIA_ONAR_EXIT(C_INFO)
{
	npc = bau_900_onar;
	nr = 999;
	condition = dia_onar_exit_condition;
	information = dia_onar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_onar_exit_condition()
{
	return TRUE;
};

func void dia_onar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ONAR_HALLO(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_hallo_condition;
	information = dia_onar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_onar_hallo_condition()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_onar_hallo_info()
{
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//Kto ciê tu u licha wpuœci³?
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//Co robisz na mojej farmie?!
};


instance DIA_ONAR_PERM(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_perm_condition;
	information = dia_onar_perm_info;
	permanent = TRUE;
	description = "Czy na farmie wszystko w porz¹dku?";
};


func int dia_onar_perm_condition()
{
	return TRUE;
};

func void dia_onar_perm_info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//Czy na farmie wszystko w porz¹dku?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//A co ciê to obchodzi, przecie¿ tutaj nie pracujesz.
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//Mam nadziejê! W koñcu p³acê ci za to, ¿eby wszystko by³o w porz¹dku.
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//Lepiej id¿ do Torlofa i pogadaj z nim, mo¿e znajdzie dla ciebie jak¹œ pracê.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//Taa, jasne. IdŸ i zajmij siê polowaniem na te swoje smoki.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//Wy, œwiêtoszkowate dranie z klasztoru, nie macie tu czego szukaæ!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//Nie lubimy tu oddzia³ów królewskich, jeœli wiesz, co mam na myœli.
	};
};


instance DIA_ONAR_WORK(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_work_condition;
	information = dia_onar_work_info;
	permanent = FALSE;
	description = "Chcê dla ciebie pracowaæ!";
};


func int dia_onar_work_condition()
{
	if(LEE_SENDTOONAR == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_work_info()
{
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//Chcê dla ciebie pracowaæ!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//Nie potrzebujê teraz nikogo.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//Moi ludzie doskonale sobie ze wszystkim radz¹.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//Nie masz tu czego szukaæ, wynocha!
};


instance DIA_ONAR_WORKASSLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_workassld_condition;
	information = dia_onar_workassld_info;
	permanent = FALSE;
	description = "Chcê pracowaæ jako najemnik.";
};


func int dia_onar_workassld_condition()
{
	if((LEE_SENDTOONAR == FALSE) && (ONAR_WEGENSLDWERDEN == FALSE) && Npc_KnowsInfo(other,dia_onar_work))
	{
		return TRUE;
	};
};

func void dia_onar_workassld_info()
{
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//Chcê pracowaæ jako najemnik.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//Ty? Jako najemnik? Nie rozœmieszaj mnie! Gdybyœ nadawa³ siê na najemnika, Lee dawno by mi o tym powiedzia³.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_02");	//A teraz spadaj, migiem!
	ONAR_WEGENSLDWERDEN = TRUE;
};


instance DIA_ONAR_AUFSTAND(C_INFO)
{
	npc = bau_900_onar;
	nr = 3;
	condition = dia_onar_aufstand_condition;
	information = dia_onar_aufstand_info;
	permanent = FALSE;
	description = "S³ysza³em, ¿e podburzasz ludzi przeciwko miastu.";
};


func int dia_onar_aufstand_condition()
{
	return TRUE;
};

func void dia_onar_aufstand_info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//S³ysza³em, ¿e podburzasz ludzi przeciwko miastu.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//S³uchaj no... Tê farmê, jak i ziemiê, na której stoi, odziedziczy³em po ojcu.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//On zaœ, odziedziczy³ j¹ po SWOIM.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//Nie mam zamiaru pozwoliæ kilku imbecylom, p³aszcz¹cym siê przed królem, na rozszabrowanie mego rodzinnego maj¹tku, tylko po to, by nakarmiæ wojska.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//Wojna z orkami trwa chyba od zawsze. A my gdzie jesteœmy? Na granicy pora¿ki!
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//O nie - wolê ju¿ sam broniæ farmy! Za pieni¹dze oszczêdzone w ten sposób móg³bym zebraæ swoj¹ w³asn¹, ma³¹ armiê.
};


instance DIA_ONAR_WEGENPEPE(C_INFO)
{
	npc = bau_900_onar;
	nr = 4;
	condition = dia_onar_wegenpepe_condition;
	information = dia_onar_wegenpepe_info;
	permanent = FALSE;
	description = "Dziêki Bullkowi masz teraz kilka owiec mniej.";
};


func int dia_onar_wegenpepe_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_onar_wegenpepe_info()
{
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//Dziêki Bullkowi masz teraz kilka owiec mniej.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//O czym ty gadasz? Kim jest Bullko?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//To jeden z najemników.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//A co mnie do tego? Jeœli zabija moje owce, bêdzie mia³ do czynienia z Lee.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//Nie zawracaj mi g³owy takimi trywialnymi drobnostkami.
	ONAR_WEGENPEPE = TRUE;
};


instance DIA_ONAR_WEGENSEKOB(C_INFO)
{
	npc = bau_900_onar;
	nr = 5;
	condition = dia_onar_wegensekob_condition;
	information = dia_onar_wegensekob_info;
	permanent = FALSE;
	description = "Przychodzê w sprawie czynszu Sekoba...";
};


func int dia_onar_wegensekob_condition()
{
	if(MIS_SEKOB_REDEMITONAR == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_onar_wegensekob_info()
{
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//Przychodzê w sprawie czynszu Sekoba...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//Czego do diab³a TUTAJ szukasz? Zanieœ pieni¹dze Torlofowi.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//Dlaczego, do czorta, uwa¿asz, ¿e to TWOJA sprawa?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//Chcê zostaæ najemnikiem. Œci¹ganie czynszu to dla mnie pewnego rodzaju test.
		ONAR_WEGENSLDWERDEN = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//Tylko ¿e Sekob nie ma pieniêdzy. NieŸle go nawet poturbowa³em.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//Twierdzi, ¿e plony w tym roku s³abe.
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//Ty têpaku! Czy wydaje ci siê, ¿e bêdzie siê obnosi³ ze z³otem? Pewnie gdzieœ je ukry³!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//Wiesz, jak czêsto pada tu deszcz? S³abe zbiory, dupa... nie s³abe zbiory.
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//Wracaj tam i wyduœ z niego forsê.
	ONAR_WEGENSEKOB = TRUE;
};


instance DIA_ONAR_LEESENTME(C_INFO)
{
	npc = bau_900_onar;
	nr = 6;
	condition = dia_onar_leesentme_condition;
	information = dia_onar_leesentme_info;
	permanent = FALSE;
	description = "Przysy³a mnie Lee. Chcê pracowaæ jako najemnik!";
};


func int dia_onar_leesentme_condition()
{
	if((LEE_SENDTOONAR == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_onar_leesentme_info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//Przysy³a mnie Lee. Chcê pracowaæ jako najemnik!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//Ju¿ z nim rozmawia³em.
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//Jakoœ od samego pocz¹tku nie bardzo mi siê podoba³eœ.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Ale... skoro Lee chce ci daæ szansê.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//To on jest za ciebie odpowiedzialny. Niech ci bêdzie.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//Ale ¿adnego obijania siê! Trzymaj siê z dala od ch³opów, a i ³apy precz od dziewuch. A co najwa¿niejsze, nie próbuj nic kraœæ, kapujesz?
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//Wszystkie pozosta³e sprawy za³atwiaj z Lee.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//No, pozostaje NAM tylko omówiæ kwestiê twojego wynagrodzenia.
	ONAR_APPROVED = TRUE;
	b_logentry(TOPIC_BECOMESLD,"Onar udzieli³ mi swojego poparcia. Teraz ju¿ na pewno wst¹piê w szeregi najemników.");
};


var int onar_sold_day;
var int onar_sold_xp;

instance DIA_ONAR_HOWMUCH(C_INFO)
{
	npc = bau_900_onar;
	nr = 7;
	condition = dia_onar_howmuch_condition;
	information = dia_onar_howmuch_info;
	permanent = FALSE;
	description = "Co z moj¹ wyp³at¹?";
};


func int dia_onar_howmuch_condition()
{
	if(ONAR_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_howmuch_info()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//Co z moj¹ wyp³at¹?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//Zastanówmy siê...
	SOLD = 50;
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//Nie za bardzo mi siê podobasz.
	};
	if(ONAR_WEGENSEKOB == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//Nie nale¿ysz do moich najlepszych ludzi. Widaæ to choæby po tym, jak za³atwi³eœ sprawê z Sekobem.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_FARM > 1) || ((b_getgreatestpetzcrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_FARM > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//Problemy same siê za tob¹ pa³êtaj¹, nied³ugo rozwalisz mi farmê.
		SOLD = SOLD - 10;
	};
	if((ONAR_WEGENPEPE == TRUE) && ((ONAR_WEGENSEKOB == TRUE) || (ONAR_WEGENSLDWERDEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//I jeszcze ci¹gle te gówniane pytania.
		SOLD = SOLD - 10;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//Niech no pomyœlê.
	b_say_gold(self,other,SOLD);
	ONAR_SOLD_DAY = Wld_GetDay();
	ONAR_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//Coœ tam mówi³?
	Info_ClearChoices(dia_onar_howmuch);
	Info_AddChoice(dia_onar_howmuch,"W porz¹dku!",dia_onar_howmuch_ok);
	Info_AddChoice(dia_onar_howmuch,"Nie jest tego du¿o.",dia_onar_howmuch_more);
	Info_AddChoice(dia_onar_howmuch,"P³acisz za dzieñ?",dia_onar_howmuch_perday);
};

func void dia_onar_howmuch_perday()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//P³acisz za dzieñ?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//A myœla³eœ, ¿e co... Za tydzieñ? Chyba rzeczywiœcie nie jesteœ zbyt bystry.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//Rusz wiêc dupsko i bierz pieni¹dze.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//Nie bêdê ich za tob¹ nosi³.
};

func void dia_onar_howmuch_more()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//Nie jest tego du¿o.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//Nie podoba siê? Mo¿esz zawsze popracowaæ dla mnie za darmo.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//Tak czy inaczej, wiêcej nie dostaniesz.
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Onar bêdzie mi p³aci³ ka¿dego dnia.");
	Info_ClearChoices(dia_onar_howmuch);
};

func void dia_onar_howmuch_ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//W porz¹dku!
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//Te¿ tak uwa¿am. Teraz idŸ pogadaæ z Lee.
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Onar bêdzie mi p³aci³ ka¿dego dnia.");
	Info_ClearChoices(dia_onar_howmuch);
};


instance DIA_ONAR_COLLECTGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 8;
	condition = dia_onar_collectgold_condition;
	information = dia_onar_collectgold_info;
	permanent = TRUE;
	description = "Zap³aæ mi moj¹ tygodniówkê!";
};


func int dia_onar_collectgold_condition()
{
	if(Npc_KnowsInfo(other,dia_onar_howmuch) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_onar_collectgold_info()
{
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//Zap³aæ mi moj¹ tygodniówkê!
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	//P³acê najemnikom, nie ³owcom smoków.
	}
	else if(TORLOF_THEOTHERMISSION_TOOLATE == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//Wygl¹da na to, ¿e nie obchodz¹ ciê zadania, które ci przydzieli³em.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//Poprosi³em Torlofa, by obserwowa³ twoje postêpy. Wygl¹da na to, ¿e wykonanie zadania sprawia ci wielkie problemy.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//Nie bêdê marnowa³ z³ota na obiboków.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//Pochodzisz kilka tygodni bez pieniêdzy! Mo¿e to ciê czegoœ nauczy!
	}
	else if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//S³ysza³em, ¿e nawali³eœ. Pogadaj najpierw z Lee i za³atw sprawê.
	}
	else if(Wld_GetDay() <= ONAR_SOLD_DAY)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//Ju¿ zupe³nie poprzewraca³o ci siê we ³bie?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//Popracuj najpierw trochê. Nastêpn¹ wyp³atê dostaniesz najwczeœniej jutro.
	}
	else if((Wld_GetDay() - 2) >= ONAR_SOLD_DAY)
	{
		if((Wld_GetDay() - 2) == ONAR_SOLD_DAY)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_09");	//Gdzieœ siê wczoraj podziewa³?
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_10");	//Gdzieœ siê podziewa³ przez ostatnie kilka dni?
		};
		AI_Output(self,other,"DIA_Onar_CollectGold_14_11");	//Ani razu ciê tu nie widzia³em.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_12");	//A kto ciê wie, gdzie siê w³óczy³eœ.
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	}
	else
	{
		if(other.exp > (ONAR_SOLD_XP + 200))
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//Ach tak. Oto twoje pieni¹dze.
			b_giveinvitems(self,other,itmi_gold,SOLD);
			b_say_gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//Co? Ca³ymi dniami siê obijasz, a kiedy siê nie obijasz, to œpisz!
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//Za to nie bêdê p³aci³.
		};
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	};
};


instance DIA_ONAR_MARIAGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 9;
	condition = dia_onar_mariagold_condition;
	information = dia_onar_mariagold_info;
	permanent = FALSE;
	description = "Maria uwa¿a, ¿e za ma³o dostajê.";
};


func int dia_onar_mariagold_condition()
{
	if(MARIA_MEHRGOLD == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_mariagold_info()
{
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//Maria uwa¿a, ¿e za ma³o dostajê.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//¯e co?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//Powiedzia³a, ¿e powinieneœ lepiej mi p³aciæ.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//Ta baba zdecydowanie wtyka nos w nie swoje sprawy.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//A nie powiedzia³a ile?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//Nie.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//Niech bêdzie. Od nastêpnej wyp³aty bêdziesz dostawa³ 10 sztuk z³ota wiêcej.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//Ale ani miedziaka wiêcej, zrozumiano?
	SOLD = SOLD + 10;
};


var int onar_sellsheep;

instance DIA_ONAR_WANNASHEEP(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_wannasheep_condition;
	information = dia_onar_wannasheep_info;
	permanent = TRUE;
	description = "Chcia³bym kupiæ owcê!";
};


func int dia_onar_wannasheep_condition()
{
	if(ONAR_SELLSHEEP == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_wannasheep_info()
{
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//Chcia³bym kupiæ owcê!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//Wiêc po coœ tu przylaz³? Widzisz tu gdzieœ owce?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//Ja tylko...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//Jeœli chcesz kupiæ owcê, idŸ na pastwisko. To na prawo od mojego domu.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//Niech Pepe sprzeda ci jedn¹.
	if(Npc_IsDead(pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//Obawiam siê, ¿e Pepe nie ¿yje.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//Och! W takim razie... zostaw mi 200 sztuk z³ota i weŸ sobie jedn¹ owcê z pastwiska.
		ONAR_SELLSHEEP = TRUE;
	};
};


instance DIA_ONAR_BUYLIESEL(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_buyliesel_condition;
	information = dia_onar_buyliesel_info;
	permanent = TRUE;
	description = "Proszê, oto 200 sztuk z³ota. Daj mi jedn¹ owcê.";
};


func int dia_onar_buyliesel_condition()
{
	if(ONAR_SELLSHEEP == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_buyliesel_info()
{
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//Proszê, oto 200 sztuk z³ota. Daj mi jedn¹ owcê.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//Mo¿esz wzi¹æ sobie jedn¹ z pastwiska.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//Któraœ z owiec powinna za tob¹ pójœæ. Praktycznie wszystkie reaguj¹ na imiê Betsy.
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//Nie masz nawet dostatecznie du¿o z³ota. Wynocha, nie marnuj mojego cennego czasu.
	};
};

