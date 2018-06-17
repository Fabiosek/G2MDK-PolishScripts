
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
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//Kto ci� tu u licha wpu�ci�?
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//Co robisz na mojej farmie?!
};


instance DIA_ONAR_PERM(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_perm_condition;
	information = dia_onar_perm_info;
	permanent = TRUE;
	description = "Czy na farmie wszystko w porz�dku?";
};


func int dia_onar_perm_condition()
{
	return TRUE;
};

func void dia_onar_perm_info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//Czy na farmie wszystko w porz�dku?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//A co ci� to obchodzi, przecie� tutaj nie pracujesz.
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//Mam nadziej�! W ko�cu p�ac� ci za to, �eby wszystko by�o w porz�dku.
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//Lepiej id� do Torlofa i pogadaj z nim, mo�e znajdzie dla ciebie jak�� prac�.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//Taa, jasne. Id� i zajmij si� polowaniem na te swoje smoki.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//Wy, �wi�toszkowate dranie z klasztoru, nie macie tu czego szuka�!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//Nie lubimy tu oddzia��w kr�lewskich, je�li wiesz, co mam na my�li.
	};
};


instance DIA_ONAR_WORK(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_work_condition;
	information = dia_onar_work_info;
	permanent = FALSE;
	description = "Chc� dla ciebie pracowa�!";
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
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//Chc� dla ciebie pracowa�!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//Nie potrzebuj� teraz nikogo.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//Moi ludzie doskonale sobie ze wszystkim radz�.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//Nie masz tu czego szuka�, wynocha!
};


instance DIA_ONAR_WORKASSLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_workassld_condition;
	information = dia_onar_workassld_info;
	permanent = FALSE;
	description = "Chc� pracowa� jako najemnik.";
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
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//Chc� pracowa� jako najemnik.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//Ty? Jako najemnik? Nie roz�mieszaj mnie! Gdyby� nadawa� si� na najemnika, Lee dawno by mi o tym powiedzia�.
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
	description = "S�ysza�em, �e podburzasz ludzi przeciwko miastu.";
};


func int dia_onar_aufstand_condition()
{
	return TRUE;
};

func void dia_onar_aufstand_info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//S�ysza�em, �e podburzasz ludzi przeciwko miastu.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//S�uchaj no... T� farm�, jak i ziemi�, na kt�rej stoi, odziedziczy�em po ojcu.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//On za�, odziedziczy� j� po SWOIM.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//Nie mam zamiaru pozwoli� kilku imbecylom, p�aszcz�cym si� przed kr�lem, na rozszabrowanie mego rodzinnego maj�tku, tylko po to, by nakarmi� wojska.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//Wojna z orkami trwa chyba od zawsze. A my gdzie jeste�my? Na granicy pora�ki!
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//O nie - wol� ju� sam broni� farmy! Za pieni�dze oszcz�dzone w ten spos�b m�g�bym zebra� swoj� w�asn�, ma�� armi�.
};


instance DIA_ONAR_WEGENPEPE(C_INFO)
{
	npc = bau_900_onar;
	nr = 4;
	condition = dia_onar_wegenpepe_condition;
	information = dia_onar_wegenpepe_info;
	permanent = FALSE;
	description = "Dzi�ki Bullkowi masz teraz kilka owiec mniej.";
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
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//Dzi�ki Bullkowi masz teraz kilka owiec mniej.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//O czym ty gadasz? Kim jest Bullko?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//To jeden z najemnik�w.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//A co mnie do tego? Je�li zabija moje owce, b�dzie mia� do czynienia z Lee.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//Nie zawracaj mi g�owy takimi trywialnymi drobnostkami.
	ONAR_WEGENPEPE = TRUE;
};


instance DIA_ONAR_WEGENSEKOB(C_INFO)
{
	npc = bau_900_onar;
	nr = 5;
	condition = dia_onar_wegensekob_condition;
	information = dia_onar_wegensekob_info;
	permanent = FALSE;
	description = "Przychodz� w sprawie czynszu Sekoba...";
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
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//Przychodz� w sprawie czynszu Sekoba...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//Czego do diab�a TUTAJ szukasz? Zanie� pieni�dze Torlofowi.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//Dlaczego, do czorta, uwa�asz, �e to TWOJA sprawa?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//Chc� zosta� najemnikiem. �ci�ganie czynszu to dla mnie pewnego rodzaju test.
		ONAR_WEGENSLDWERDEN = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//Tylko �e Sekob nie ma pieni�dzy. Nie�le go nawet poturbowa�em.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//Twierdzi, �e plony w tym roku s�abe.
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//Ty t�paku! Czy wydaje ci si�, �e b�dzie si� obnosi� ze z�otem? Pewnie gdzie� je ukry�!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//Wiesz, jak cz�sto pada tu deszcz? S�abe zbiory, dupa... nie s�abe zbiory.
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//Wracaj tam i wydu� z niego fors�.
	ONAR_WEGENSEKOB = TRUE;
};


instance DIA_ONAR_LEESENTME(C_INFO)
{
	npc = bau_900_onar;
	nr = 6;
	condition = dia_onar_leesentme_condition;
	information = dia_onar_leesentme_info;
	permanent = FALSE;
	description = "Przysy�a mnie Lee. Chc� pracowa� jako najemnik!";
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
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//Przysy�a mnie Lee. Chc� pracowa� jako najemnik!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//Ju� z nim rozmawia�em.
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//Jako� od samego pocz�tku nie bardzo mi si� podoba�e�.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Ale... skoro Lee chce ci da� szans�.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//To on jest za ciebie odpowiedzialny. Niech ci b�dzie.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//Ale �adnego obijania si�! Trzymaj si� z dala od ch�op�w, a i �apy precz od dziewuch. A co najwa�niejsze, nie pr�buj nic kra��, kapujesz?
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//Wszystkie pozosta�e sprawy za�atwiaj z Lee.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//No, pozostaje NAM tylko om�wi� kwesti� twojego wynagrodzenia.
	ONAR_APPROVED = TRUE;
	b_logentry(TOPIC_BECOMESLD,"Onar udzieli� mi swojego poparcia. Teraz ju� na pewno wst�pi� w szeregi najemnik�w.");
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
	description = "Co z moj� wyp�at�?";
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
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//Co z moj� wyp�at�?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//Zastan�wmy si�...
	SOLD = 50;
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//Nie za bardzo mi si� podobasz.
	};
	if(ONAR_WEGENSEKOB == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//Nie nale�ysz do moich najlepszych ludzi. Wida� to cho�by po tym, jak za�atwi�e� spraw� z Sekobem.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_FARM > 1) || ((b_getgreatestpetzcrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_FARM > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//Problemy same si� za tob� pa��taj�, nied�ugo rozwalisz mi farm�.
		SOLD = SOLD - 10;
	};
	if((ONAR_WEGENPEPE == TRUE) && ((ONAR_WEGENSEKOB == TRUE) || (ONAR_WEGENSLDWERDEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//I jeszcze ci�gle te g�wniane pytania.
		SOLD = SOLD - 10;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//Niech no pomy�l�.
	b_say_gold(self,other,SOLD);
	ONAR_SOLD_DAY = Wld_GetDay();
	ONAR_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//Co� tam m�wi�?
	Info_ClearChoices(dia_onar_howmuch);
	Info_AddChoice(dia_onar_howmuch,"W porz�dku!",dia_onar_howmuch_ok);
	Info_AddChoice(dia_onar_howmuch,"Nie jest tego du�o.",dia_onar_howmuch_more);
	Info_AddChoice(dia_onar_howmuch,"P�acisz za dzie�?",dia_onar_howmuch_perday);
};

func void dia_onar_howmuch_perday()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//P�acisz za dzie�?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//A my�la�e�, �e co... Za tydzie�? Chyba rzeczywi�cie nie jeste� zbyt bystry.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//Rusz wi�c dupsko i bierz pieni�dze.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//Nie b�d� ich za tob� nosi�.
};

func void dia_onar_howmuch_more()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//Nie jest tego du�o.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//Nie podoba si�? Mo�esz zawsze popracowa� dla mnie za darmo.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//Tak czy inaczej, wi�cej nie dostaniesz.
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Onar b�dzie mi p�aci� ka�dego dnia.");
	Info_ClearChoices(dia_onar_howmuch);
};

func void dia_onar_howmuch_ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//W porz�dku!
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//Te� tak uwa�am. Teraz id� pogada� z Lee.
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Onar b�dzie mi p�aci� ka�dego dnia.");
	Info_ClearChoices(dia_onar_howmuch);
};


instance DIA_ONAR_COLLECTGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 8;
	condition = dia_onar_collectgold_condition;
	information = dia_onar_collectgold_info;
	permanent = TRUE;
	description = "Zap�a� mi moj� tygodni�wk�!";
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
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//Zap�a� mi moj� tygodni�wk�!
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	//P�ac� najemnikom, nie �owcom smok�w.
	}
	else if(TORLOF_THEOTHERMISSION_TOOLATE == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//Wygl�da na to, �e nie obchodz� ci� zadania, kt�re ci przydzieli�em.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//Poprosi�em Torlofa, by obserwowa� twoje post�py. Wygl�da na to, �e wykonanie zadania sprawia ci wielkie problemy.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//Nie b�d� marnowa� z�ota na obibok�w.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//Pochodzisz kilka tygodni bez pieni�dzy! Mo�e to ci� czego� nauczy!
	}
	else if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//S�ysza�em, �e nawali�e�. Pogadaj najpierw z Lee i za�atw spraw�.
	}
	else if(Wld_GetDay() <= ONAR_SOLD_DAY)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//Ju� zupe�nie poprzewraca�o ci si� we �bie?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//Popracuj najpierw troch�. Nast�pn� wyp�at� dostaniesz najwcze�niej jutro.
	}
	else if((Wld_GetDay() - 2) >= ONAR_SOLD_DAY)
	{
		if((Wld_GetDay() - 2) == ONAR_SOLD_DAY)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_09");	//Gdzie� si� wczoraj podziewa�?
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_10");	//Gdzie� si� podziewa� przez ostatnie kilka dni?
		};
		AI_Output(self,other,"DIA_Onar_CollectGold_14_11");	//Ani razu ci� tu nie widzia�em.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_12");	//A kto ci� wie, gdzie si� w��czy�e�.
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	}
	else
	{
		if(other.exp > (ONAR_SOLD_XP + 200))
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//Ach tak. Oto twoje pieni�dze.
			b_giveinvitems(self,other,itmi_gold,SOLD);
			b_say_gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//Co? Ca�ymi dniami si� obijasz, a kiedy si� nie obijasz, to �pisz!
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//Za to nie b�d� p�aci�.
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
	description = "Maria uwa�a, �e za ma�o dostaj�.";
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
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//Maria uwa�a, �e za ma�o dostaj�.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//�e co?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//Powiedzia�a, �e powiniene� lepiej mi p�aci�.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//Ta baba zdecydowanie wtyka nos w nie swoje sprawy.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//A nie powiedzia�a ile?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//Nie.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//Niech b�dzie. Od nast�pnej wyp�aty b�dziesz dostawa� 10 sztuk z�ota wi�cej.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//Ale ani miedziaka wi�cej, zrozumiano?
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
	description = "Chcia�bym kupi� owc�!";
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
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//Chcia�bym kupi� owc�!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//Wi�c po co� tu przylaz�? Widzisz tu gdzie� owce?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//Ja tylko...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//Je�li chcesz kupi� owc�, id� na pastwisko. To na prawo od mojego domu.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//Niech Pepe sprzeda ci jedn�.
	if(Npc_IsDead(pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//Obawiam si�, �e Pepe nie �yje.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//Och! W takim razie... zostaw mi 200 sztuk z�ota i we� sobie jedn� owc� z pastwiska.
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
	description = "Prosz�, oto 200 sztuk z�ota. Daj mi jedn� owc�.";
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
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//Prosz�, oto 200 sztuk z�ota. Daj mi jedn� owc�.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//Mo�esz wzi�� sobie jedn� z pastwiska.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//Kt�ra� z owiec powinna za tob� p�j��. Praktycznie wszystkie reaguj� na imi� Betsy.
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//Nie masz nawet dostatecznie du�o z�ota. Wynocha, nie marnuj mojego cennego czasu.
	};
};

