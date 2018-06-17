
var int vatras_schickeleuteweg;
var int vatras_laresexit;
var int vatras_more;

instance DIA_ADDON_VATRAS_KILLERWARNING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_killerwarning_condition;
	information = dia_addon_vatras_killerwarning_info;
	important = TRUE;
};


func int dia_addon_vatras_killerwarning_condition()
{
	if((KAPITEL >= 5) && (MADKILLERCOUNT >= 3) && (MADKILLERCOUNT < 7) && (VATRASPISSEDOFFFOREVER == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_killerwarning_info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//Du�o plotek kr��y w Khorinis na tw�j temat.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//Podobno jeste� zamieszany w mordowanie niewinnych...
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//Ostrzegam ci� - je�li to oka�e si� prawd�...
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//Nie schod� ze �cie�ki r�wnowagi i ocalenia tego �wiata - w przeciwnym wypadku czekaj� ci� powa�ne konsekwencje.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//Czym mog� s�u�y�?
};


instance DIA_ADDON_VATRAS_LASTWARNING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_lastwarning_condition;
	information = dia_addon_vatras_lastwarning_info;
	important = TRUE;
};


func int dia_addon_vatras_lastwarning_condition()
{
	if((KAPITEL >= 5) && (MADKILLERCOUNT >= 7) && (VATRASPISSEDOFFFOREVER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_lastwarning_info()
{
	b_lastwarningvatras();
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_06");	//Co na to odpowiesz?
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	Info_AddChoice(dia_addon_vatras_lastwarning,"Odwal si�.",dia_addon_vatras_lastwarning_arsch);
	Info_AddChoice(dia_addon_vatras_lastwarning,"Przykro mi... Nie wiedzia�em, co robi�.",dia_addon_vatras_lastwarning_reue);
};

func void dia_addon_vatras_lastwarning_arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Odwal si�.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//Nie s�ysz� w twoich s�owach skruchy.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//Nie pozostawiasz mi �adnego wyboru.
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	b_vatraspissedoff();
};

func void dia_addon_vatras_lastwarning_reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//Przykro mi... Nie wiedzia�em, co robi�.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//B�d� si� za ciebie modli� w nadziei, �e odnajdziesz jeszcze kiedy� r�wnowag�.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//Nie wa� si� ju� jednak nigdy pope�ni� �adnego mordu.
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	VATRASMADKILLERCOUNT = MADKILLERCOUNT;
};


instance DIA_ADDON_VATRAS_PISSEDOFF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_pissedoff_condition;
	information = dia_addon_vatras_pissedoff_info;
	important = TRUE;
};


func int dia_addon_vatras_pissedoff_condition()
{
	if((MADKILLERCOUNT > VATRASMADKILLERCOUNT) && Npc_KnowsInfo(other,dia_addon_vatras_lastwarning) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_pissedoff_info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//Twe s�owa s� r�wnie z�e, jak twoje uczynki.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//Twoim bezsensownym morderstwom nie ma ko�ca.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//Nie pozostawiasz mi �adnego wyboru.
	b_vatraspissedoff();
};


instance DIA_VATRAS_EXIT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 999;
	condition = dia_vatras_exit_condition;
	information = dia_vatras_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_exit_condition()
{
	return TRUE;
};

func void dia_vatras_exit_info()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (VATRAS_LARESEXIT == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//Chwila!
		if(VATRAS_GEHZULARES == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//Je�li wpadniesz przypadkiem na Laresa...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//Jest co�, co mo�esz dla mnie zrobi�.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//Id� do portu - znajdziesz tam niejakiego Laresa.
			VATRAS_GEHZULARES = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//Przeka� mu ten ornament i ka� mu go odda�. B�dzie wiedzia� co zrobi�.
		CreateInvItems(self,itmi_ornament_addon_vatras,1);
		b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
		VATRAS_LARESEXIT = TRUE;
	};
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	if(VATRAS_SCHICKELEUTEWEG == TRUE)
	{
		b_startotherroutine(vlk_455_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_454_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_428_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_450_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_426_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_421_valentino,"VATRASAWAY");
		VATRAS_SCHICKELEUTEWEG = FALSE;
	};
};


instance DIA_VATRAS_PICKPOCKET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 900;
	condition = dia_vatras_pickpocket_condition;
	information = dia_vatras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_vatras_pickpocket_condition()
{
	return c_beklauen(91,250);
};

func void dia_vatras_pickpocket_info()
{
	Info_ClearChoices(dia_vatras_pickpocket);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_BACK,dia_vatras_pickpocket_back);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_PICKPOCKET,dia_vatras_pickpocket_doit);
};

func void dia_vatras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vatras_pickpocket);
};

func void dia_vatras_pickpocket_back()
{
	Info_ClearChoices(dia_vatras_pickpocket);
};


instance DIA_VATRAS_GREET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_greet_condition;
	information = dia_vatras_greet_info;
	important = TRUE;
};


func int dia_vatras_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_greet_info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Niech �aska Adanosa b�dzie z tob�.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Kim jeste�?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Nazywam si� Vatras. Jestem s�ug� Adanosa, stra�nika niebia�skiej i ziemskiej harmonii.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Co mog� dla ciebie zrobi�?
};


instance DIA_ADDON_VATRAS_CAVALORN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_cavalorn_condition;
	information = dia_addon_vatras_cavalorn_info;
	description = "Mam list adresowany do ciebie.";
};


func int dia_addon_vatras_cavalorn_condition()
{
	if(((Npc_HasItems(other,itwr_saturasfirstmessage_addon_sealed) >= 1) && (MIS_ADDON_CAVALORN_LETTER2VATRAS == LOG_RUNNING)) || (Npc_HasItems(other,itwr_saturasfirstmessage_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cavalorn_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//Mam list adresowany do ciebie.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_01");	//Do mnie?
	if(SATURASFIRSTMESSAGEOPENED == FALSE)
	{
		b_giveplayerxp(XP_ADDON_CAVALORN_LETTER2VATRAS);
		b_giveinvitems(other,self,itwr_saturasfirstmessage_addon_sealed,1);
	}
	else
	{
		b_giveplayerxp(XP_ADDON_CAVALORN_LETTER2VATRAS_OPENED);
		b_giveinvitems(other,self,itwr_saturasfirstmessage_addon,1);
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//Owszem. Tylko... By� otwarty. Mam nadziej�, �e nie przeczyta� go nikt niepowo�any.
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//Tak... To naprawd� wa�na wiadomo��.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//Ciekawi mnie, jak wszed�e� w jej posiadanie?
	Info_ClearChoices(dia_addon_vatras_cavalorn);
	Info_AddChoice(dia_addon_vatras_cavalorn,"Zabra�em j� bandytom.",dia_addon_vatras_cavalorn_bandit);
	if(MIS_ADDON_CAVALORN_KILLBRAGO == LOG_SUCCESS)
	{
		Info_AddChoice(dia_addon_vatras_cavalorn,"Od Cavalorna, my�liwego.",dia_addon_vatras_cavalorn_cavalorn);
	};
	MIS_ADDON_CAVALORN_LETTER2VATRAS = LOG_SUCCESS;
};

func void dia_addon_vatras_cavalorn_bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//Zabra�em j� bandytom.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//Och! Adanosie! Niedobrze, bardzo niedobrze.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//Je�li m�wisz prawd�, to mamy ogromny problem.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//Trzeba si� tym jak najszybciej zaj��.
	Info_ClearChoices(dia_addon_vatras_cavalorn);
};

func void dia_addon_vatras_cavalorn_cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//Od Cavalorna, my�liwego.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//Cavalorn? A gdzie on si� podziewa?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//Poleci� mi przekaza�, �e nie zd��y� na czas i �e zmierza na miejsce spotkania - gdziekolwiek by to nie by�o.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//Widz�, �e zas�u�y�e� sobie na jego zaufanie... Ja r�wnie� b�d� ci chyba musia� zaufa�.
	b_giveplayerxp(XP_ADDON_CAVALORNTRUST);
	Info_ClearChoices(dia_addon_vatras_cavalorn);
};


var int vatras_why;

instance DIA_ADDON_VATRAS_CAVALORNSENTME(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_cavalornsentme_condition;
	information = dia_addon_vatras_cavalornsentme_info;
	permanent = FALSE;
	description = "Przysy�a mnie Cavalorn!";
};


func int dia_addon_vatras_cavalornsentme_condition()
{
	if((SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE) && Npc_KnowsInfo(other,dia_addon_cavalorn_ring) && (VATRAS_WHY == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cavalornsentme_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//Przysy�a mnie Cavalorn!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//Naprawd�? I co powiedzia�?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//�e nie wzgardzisz pomoc� os�b wszechstronnie uzdolnionych.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//A wi�c chcesz si� do nas przy��czy� - czy tak, m�j synu?
};


instance DIA_ADDON_VATRAS_TELLME(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_tellme_condition;
	information = dia_addon_vatras_tellme_info;
	permanent = TRUE;
	description = "Powiedz mi co� o Wodnym Kr�gu.";
};


func int dia_addon_vatras_tellme_condition()
{
	if((SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_tellme_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//Powiedz mi co� o Wodnym Kr�gu.
	if(!Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//A czemu mia�bym to zrobi�?
		VATRAS_WHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//Nie musisz wiedzie� wszystkiego, dop�ki nie staniesz si� jednym z nas.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//Co nieco mog� ci jednak opowiedzie�...
		Info_ClearChoices(dia_addon_vatras_tellme);
		Info_AddChoice(dia_addon_vatras_tellme,DIALOG_BACK,dia_addon_vatras_tellme_back);
		Info_AddChoice(dia_addon_vatras_tellme,"Czym si� tak w zasadzie zajmujecie?",dia_addon_vatras_tellme_philo);
		Info_AddChoice(dia_addon_vatras_tellme,"Gdzie s� Magowie Wody?",dia_addon_vatras_tellme_otherkdw);
		Info_AddChoice(dia_addon_vatras_tellme,"Kim s� cz�onkowie Wodnego Kr�gu?",dia_addon_vatras_tellme_wernoch);
	};
};

func void dia_addon_vatras_tellme_back()
{
	Info_ClearChoices(dia_addon_vatras_tellme);
};

func void dia_addon_vatras_tellme_philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//Czym si� tak w zasadzie zajmujecie?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//Stoimy pomi�dzy porz�dkiem symbolizowanym przez Innosa i chaosem, kt�rego reprezentantem jest Beliar.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//Gdyby kt�ra� ze stron zatryumfowa�a, oznacza�oby to albo utrat� wolno�ci, albo rz�dy �mierciono�nego chaosu.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//Staramy si� utrzyma� r�wnowag� w tym �wiecie - tylko w ten spos�b mo�e w nim istnie� �ycie.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == 0)
	{
		Info_AddChoice(dia_addon_vatras_tellme,"Hmm... A mo�e konkretniej?",dia_addon_vatras_tellme_konkret);
	};
};

func void dia_addon_vatras_tellme_konkret()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//Hmm... A mo�e konkretniej?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//Od upadku Bariery pojawi�o si� sporo nowych zagro�e�.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//Najoczywistszym z nich s� bandyci.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//Nie do��, �e spokojne podr�owanie przez wysp� sta�o si� niemal niemo�liwe...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//...to jeszcze wspomaga ich kto� w tym mie�cie!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//Ustalili�my, �e bandyci regularnie zaopatruj� si� w bro� u jednego z kupc�w z Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//Pr�bujemy dotrze� do takich os�b, aby uniemo�liwi� im dzia�anie na szkod� miasta.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//Daj zna�, gdy zechcesz zaj�� si� t� spraw�.
	MIS_VATRAS_FINDTHEBANDITTRADER = LOG_RUNNING;
	VATRAS_TOMARTIN = TRUE;
	Log_CreateTopic(TOPIC_ADDON_BANDITTRADER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITTRADER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITTRADER,"W Khorinis jest handlarz broni�, kt�ry zaopatruje bandyt�w. Vatras chce, �ebym sprawdzi� t� informacj�.");
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin, kwatermistrz paladyn�w, zajmuje si� sprawami handlarza broni�. Znajd� go w magazynach paladyn�w, w porcie.");
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Wodny Kr�g martwi si� bandytami w Khorinis.");
};

func void dia_addon_vatras_tellme_otherkdw()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//Gdzie s� Magowie Wody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//Badaj� ruiny prastarej kultury gdzie� na p�nocny wsch�d od Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//Zak�adamy, �e znajduj� si� tam wrota do nieznanej dotychczas cz�ci wyspy.
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KDW,"Pozostali Magowie Wody zbadaj� ruiny staro�ytnej kultury na p�nocny wsch�d od Khorinis. By� mo�e znajduje si� tam przej�cie do dotychczas niezbadanej cz�ci wyspy.");
	Info_AddChoice(dia_addon_vatras_tellme,"Opowiedz mi wi�cej o tym niezbadanym terenie.",dia_addon_vatras_tellme_unexplored);
};

func void dia_addon_vatras_tellme_unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//Opowiedz mi wi�cej o tym niezbadanym terenie.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//Mog� wys�a� ci� do Saturasa z listem polecaj�cym, je�li interesuje ci� do��czenie do ekspedycji.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//Rzecz jasna tylko wtedy, gdy b�dziesz jednym z nas.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//Rzecz jasna.
	b_logentry(TOPIC_ADDON_KDW,"Zanim do��cz� do ekspedycji Mag�w Wody, Vatras chce, abym zosta� cz�onkiem Wodnego Kr�gu.");
};

func void dia_addon_vatras_tellme_wernoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//Kim s� cz�onkowie Wodnego Kr�gu?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//Tego dowiesz si�, gdy ju� sam w nim b�dziesz.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//Z pewno�ci� spotkasz niekt�rych z nas...
};


instance DIA_ADDON_VATRAS_WANNABERANGER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_wannaberanger_condition;
	information = dia_addon_vatras_wannaberanger_info;
	description = "Chc� si� przy��czy� do Wodnego Kr�gu!";
};


func int dia_addon_vatras_wannaberanger_condition()
{
	if(SC_KNOWSRANGER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wannaberanger_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//Chc� si� przy��czy� do Wodnego Kr�gu!
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//Doskonale. Pierwsze wymaganie ju� spe�niasz.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//O co ci chodzi?
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//Przynajmniej jeden z nas ci ufa - inaczej by� si� o nas nie dowiedzia�.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//Ale ja nic o tobie nie wiem...
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//A co chcia�by� wiedzie�?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Powiedz mi, sk�d pochodzisz... i co sprowadza ci� do tego miasta.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Mam wa�n� wiadomo�� dla przyw�dcy paladyn�w.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Co to za wiadomo��?
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Przyby�y smoki...",dia_vatras_influence_first_truth);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Wkr�tce wydarz� si� straszliwe rzeczy.",dia_vatras_influence_first_lie);
};

func void dia_vatras_influence_first_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Niedaleko st�d zbiera si� pot�na armia. Jej przyw�dcami s� smoki, a celem podb�j ca�ego kraju.
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Hmmm. Je�li m�wisz prawd�, to r�wnowaga na tych ziemiach zosta�a zak��cona. Kto ci o tym powiedzia�?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//Smoki? M�wisz o istotach, o kt�rych zwykle wspominaj� tylko legendy. Kto ci o tym powiedzia�?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Ach, s�ysza�em jakie� plotki...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Powiedzia� mi o tym mag Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = TRUE;
};

func void dia_vatras_influence_first_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Wkr�tce wydarz� si� straszliwe rzeczy.
	if(VATRAS_FIRST == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//Aha! A kto ci o tym powiedzia�?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Straszliwe rzeczy, tak? A sk�d to przypuszczenie?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Ach, s�ysza�em jakie� plotki...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Powiedzia� mi o tym mag Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = 2;
};

func void dia_vatras_influence_second_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Powiedzia� mi o tym mag Xardas. To on wys�a� mnie, bym ostrzeg� paladyn�w.
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Wiem, �e jest on m�drym i pot�nym mistrzem magii. Powiedz mi jeszcze, sk�d przybywasz?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Ten nekromanta... A wi�c �yje... i on ci� tu przys�a�? Kim jeste� naprawd�?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Podr�nikiem z dalekiego po�udnia...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Dawnym skaza�cem...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = TRUE;
};

func void dia_vatras_influence_second_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//Ach, s�ysza�em jakie� plotki...
	if(VATRAS_SECOND == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//A pami�tasz chocia�, GDZIE je s�ysza�e�?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Tak... I dlatego wyruszy�e� w t� podr�? Kim jeste� naprawd�?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Podr�nikiem z dalekiego po�udnia...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Dawnym skaza�cem...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = 2;
};

func void b_vatras_influence_repeat()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Dobrze, podsumujmy:
	if(VATRAS_THIRD == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Jeste� zbieg�ym wi�niem...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Jeste� podr�nikiem z dalekiego po�udnia...
	};
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//...kt�remu nekromanta Xardas powiedzia�...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//...kt�ry us�ysza� plotki...
	};
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//...�e armia smok�w zamierza podbi� ca�y kraj.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//...�e wydarz� si� wkr�tce straszliwe rzeczy.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//I zamierzasz ostrzec o tym paladyn�w.
	if((VATRAS_FIRST == TRUE) && (VATRAS_SECOND == TRUE) && (VATRAS_THIRD == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//Brzmi to do�� niewiarygodnie, ale nie wyczuwam, by� pr�bowa� mnie ok�ama�.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Dlatego musz� przyj��, �e kieruj� tob� szlachetne pobudki.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//Dostaniesz szans� na do��czenie do Wodnego Kr�gu.
		Info_ClearChoices(dia_addon_vatras_wannaberanger);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//My�l�, �e co� przede mn� ukrywasz.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Je�li obawiasz si�, �e przeka�� komu� to, co mi powiesz, mo�esz by� spokojny.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Przysi�g�em zachowywa� wszystkie powierzane mi tajemnice dla siebie.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//A co z tymi wszystkimi lud�mi?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Oni nie rozumiej� nawet po�owy z tego, czego ich nauczam. Nie musisz si� obawia�.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Zacznijmy jeszcze raz, od pocz�tku. Co to za wiadomo��?
		Info_ClearChoices(dia_addon_vatras_wannaberanger);
		Info_AddChoice(dia_addon_vatras_wannaberanger,"Przyby�y smoki...",dia_vatras_influence_first_truth);
		Info_AddChoice(dia_addon_vatras_wannaberanger,"Wkr�tce wydarz� si� straszliwe rzeczy.",dia_vatras_influence_first_lie);
	};
};

func void dia_vatras_influence_third_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Dawnym skaza�cem z kolonii wi�ziennej Khorinis.
	VATRAS_THIRD = TRUE;
	b_vatras_influence_repeat();
};

func void dia_vatras_influence_third_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Podr�nikiem z dalekiego po�udnia...
	VATRAS_THIRD = FALSE;
	b_vatras_influence_repeat();
};


instance DIA_ADDON_VATRAS_HOWTOJOIN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_howtojoin_condition;
	information = dia_addon_vatras_howtojoin_info;
	description = "Co musz� zrobi�, aby do was do��czy�?";
};


func int dia_addon_vatras_howtojoin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_howtojoin_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//Co musz� zrobi�, aby do was do��czy�?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//Przede wszystkim musisz mie� �wiadomo��, �e bierzesz na swe barki wielk� odpowiedzialno��.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//Nie przyjmuj� zg�osze� ka�dego.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//Chcesz by� jednym z nas? Udowodnij, �e twoje post�powanie przystaje do naszego.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//A konkretniej?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//Ka�dy kandydat musi wykona� wa�kie zadanie, zanim otrzyma zgod� na przy��czenie si� do nas.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//Dopiero po tym mog� rozwa�y� twoj� pro�b� o zgod� na do��czenie do naszej walki o utrzymanie r�wnowagi na tej wyspie.
	Info_ClearChoices(dia_addon_vatras_howtojoin);
	Info_AddChoice(dia_addon_vatras_howtojoin,"To jak mog� ci� przekona�?",dia_addon_vatras_howtojoin_whatsgreat);
	Info_AddChoice(dia_addon_vatras_howtojoin,"Uwolni�em wielu ludzi. Bariera zosta�a zniszczona...",dia_addon_vatras_howtojoin_freedmen);
	Info_AddChoice(dia_addon_vatras_howtojoin,"Pokona�em �ni�cego. To chyba dosy� znacz�ce osi�gni�cie?",dia_addon_vatras_howtojoin_sleeper);
};

func void dia_addon_vatras_howtojoin_sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//Pokona�em �ni�cego. To chyba dosy� znacz�ce osi�gni�cie?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//Du�o opowie�ci si� ostatnio s�yszy...
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//Nawet historie o wyp�dzeniu z tego �wiata potwora znanego jako �ni�cy.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//Nie s�ysza�em jednak, aby by�a to wy��cznie twoja zas�uga - cho� widz�, �e wierzysz w swe s�owa.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//Troch� mnie to denerwuje, ale nie mog� mie� pewno�ci, �e zmys�y mnie nie zwodz�.
};

func void dia_addon_vatras_howtojoin_freedmen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//Uwolni�em wielu ludzi. Bariera zosta�a zniszczona...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//No, je�li to naprawd� twoja zas�uga...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//Ludzie, kt�rych uwolni�e�... To nie byli tylko Magowie Wody i niewinni osadnicy.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//Po ca�ej krainie rozpanoszyli si� r�wnie� r�noracy bandyci, kt�rzy zagra�aj� teraz obywatelom tego miasta.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//Zaj�li ju� cz�� teren�w okalaj�cych miasto - niemal nie da si� bezpiecznie opu�ci� Khorinis.
};

func void dia_addon_vatras_howtojoin_whatsgreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//To jak mog� ci� przekona�?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//Ostatnio w Khorinis dzieje si� co� dziwnego.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//Niemal codziennie znikaj� kolejni mieszka�cy.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//Gdyby uda�o ci si� ustali�, co si� z nimi sta�o, miejsce w Wodnym Kr�gu masz zapewnione.
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,LOGTEXT_ADDON_KDWRIGHT);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras nie pozwoli mi wst�pi� do Wodnego Kr�gu, je�li nie rozwi��� zagadki zaginionych ludzi.");
	if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
	};
	MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE = LOG_RUNNING;
	SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//Tylko �e...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//Tak?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//...najpierw musisz skontaktowa� si� z paladynami i przekaza� im t� wiadomo��.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//S�dz�, �e to bardzo wa�ne.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Pom�w z Lordem Hagenem.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Mam dostarczy� Lordowi Hagenowi wa�n� wiadomo�� od Vatrasa.");
	Info_ClearChoices(dia_addon_vatras_howtojoin);
};


instance DIA_ADDON_VATRAS_GUILDBYPASS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_guildbypass_condition;
	information = dia_addon_vatras_guildbypass_info;
	description = "Ale przecie� mnie do niego nie dopuszcz�!";
};


func int dia_addon_vatras_guildbypass_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildbypass_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//Ale przecie� mnie do niego nie dopuszcz�!
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//Ale� dopuszcz�, dopuszcz�. Je�li b�dziesz cz�onkiem wp�ywowej organizacji...
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//Kr�g ma swoje kontakty, czasem do�� przydatne.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//Postaramy si� zadba�, aby� m�g� dostarczy� wiadomo�� Hagenowi jak najszybciej.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//Pom�w o tym z moim zaufanym towarzyszem, Laresem. Mo�e on zdo�a ci pom�c.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Aby zosta� wpuszczonym na dw�r Lorda Hagena, musz� wst�pi� do jednej z pot�nych gildii w Khorinis.");
	Info_ClearChoices(dia_addon_vatras_guildbypass);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Tak zrobi�.",dia_addon_vatras_guildbypass_back);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Do kt�rej gildii mam si� przy��czy�?",dia_addon_vatras_guildbypass_whichguild);
};

func void dia_addon_vatras_guildbypass_back()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//Tak zrobi�.
	VATRAS_GEHZULARES = TRUE;
	Info_ClearChoices(dia_addon_vatras_guildbypass);
};

func void dia_addon_vatras_guildbypass_whichguild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//Do kt�rej gildii mam si� przy��czy�?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//Jedynie trzy s� do�� pot�ne i wp�ywowe, aby si� liczy�.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//To stra�, Magowie Ognia i najemnicy z farmy Onara.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//Wyb�r nale�y do ciebie.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//Lares mo�e pom�c ci w podj�ciu tej trudnej decyzji - lepiej z nim pom�w.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Istniej� trzy pot�ne gildie, do kt�rych mo�na wst�pi�: Magowie Ognia, stra� miejska oraz najemnicy przebywaj�cy w pobli�u posiad�o�ci w�a�ciciela ziemskiego.");
	Info_ClearChoices(dia_addon_vatras_guildbypass);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Tak zrobi�.",dia_addon_vatras_guildbypass_back);
};


instance DIA_ADDON_VATRAS_NOWRANGER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_nowranger_condition;
	information = dia_addon_vatras_nowranger_info;
	permanent = TRUE;
	description = "Jestem got�w wst�pi� w szeregi Wodnego Kr�gu!";
};


func int dia_addon_vatras_nowranger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (SC_ISRANGER == FALSE) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_nowranger_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//Jestem got�w wst�pi� w szeregi Wodnego Kr�gu!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Dostarczy�e� sw� wiadomo�� Lordowi Hagenowi?
	if(KAPITEL >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Owszem.
		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Nakaza� mi jednak uda� si� do G�rniczej Doliny i dostarczy� mu dow�d na potwierdzenie moich s��w!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//Sam musisz zdecydowa�, co dalej.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Dla mnie liczy�o si� dostarczenie wiadomo�ci. To, czy paladyni podejm� jakie� dzia�ania, czy b�d� czeka� na dodatkowe dowody, zale�y ju� od Hagena.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Co do ciebie...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Dobrze.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//Dowiod�e� swej warto�ci - zostaniesz jednym z nas. B�dziesz podr�owa� po tej krainie i wype�nia� wol� Adanosa.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//Niniejszym daj� ci Pier�cie� Wody - oby pom�g� ci znale�� sojusznik�w i utrzyma� wraz z nimi r�wnowag� tego �wiata.
		CreateInvItems(self,itri_ranger_addon,1);
		b_giveinvitems(self,other,itri_ranger_addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//Szczeg�lnie cieszy mnie fakt, �e jeste� pierwszym Magiem Ognia w�r�d nas.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//Niech ci� Adanos chroni. Id� teraz pozna� swych wsp�braci.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//Czekaj� na ciebie w gospodzie 'Martwa Harpia', gdzie powitaj� ci� w�r�d nas.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//Chyba znasz to miejsce? Znajduje si� na drodze do farmy Onara.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//Nie zapomnij za�o�y� pier�cienia, tak aby twoi bracia mogli ci� po nim rozpozna�.
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Nale�� teraz do Wodnego Kr�gu i powinienem spotka� si� z mymi bra�mi w gospodzie 'Martwa Harpia'.");
		SC_ISRANGER = TRUE;
		LARES_CANBRINGSCTOPLACES = TRUE;
		MIS_ADDON_LARES_COMETORANGERMEETING = LOG_RUNNING;
		b_giveplayerxp(XP_ADDON_SC_ISRANGER);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Nie, jeszcze nie.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//Wi�c si� pospiesz! To wiadomo�� ogromnej wagi!
	};
};


instance DIA_ADDON_VATRAS_CLOSEMEETING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_closemeeting_condition;
	information = dia_addon_vatras_closemeeting_info;
	description = "Przysy�aj� mnie cz�onkowie Kr�gu.";
};


func int dia_addon_vatras_closemeeting_condition()
{
	if(LARES_TAKEFIRSTMISSIONFROMVATRAS == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_closemeeting_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//Przysy�aj� mnie cz�onkowie Kr�gu.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Doskonale - i tak ju� na ciebie czeka�em.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Zaraz wy�l� ci� na drug� stron� portalu wraz z innymi Magami Wody.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Masz tropi� Magnata imieniem Kruk i ustali�, czemu porywa mieszka�c�w Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//My spr�bujemy rozwi�za� problem okolicznych bandyt�w.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Daj t� notk� Saturasowi - od tej pory to on jest twoim zwierzchnikiem.
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//Lares doprowadzi ci� do niego, o ile sam nie dostarczy� jeszcze ornamentu.
	};
	CreateInvItems(self,itwr_vatras2saturas_findraven,1);
	b_giveinvitems(self,other,itwr_vatras2saturas_findraven,1);
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Niech ci� Adanos prowadzi.
	b_logentry(TOPIC_ADDON_KDW,"Vatras wys�a� mnie z listem do Saturasa. Powinienem teraz przej�� przez portal z pozosta�ymi Magami Wody i wy�ledzi� Kruka, dawnego magnata.");
	Log_CreateTopic(TOPIC_ADDON_SKLAVEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKLAVEN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SKLAVEN,"Powinienem dowiedzie� si�, dlaczego Kruk kaza� porwa� mieszka�c�w Khorinis.");
	RANGERMEETINGRUNNING = LOG_SUCCESS;
	b_schlussmitrangermeeting();
	b_giveplayerxp(XP_AMBIENT);
};



var int missingpeopleinfo[20];

instance DIA_ADDON_VATRAS_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_missingpeople_condition;
	information = dia_addon_vatras_missingpeople_info;
	permanent = TRUE;
	description = "Co do tych znikaj�cych ludzi...";
};


func int dia_addon_vatras_missingpeople_condition()
{
	if(MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int dia_addon_vatras_missingpeople_wo_noperm;

func void dia_addon_vatras_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//Co do tych znikaj�cych ludzi...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Tak?
	Info_ClearChoices(dia_addon_vatras_missingpeople);
	Info_AddChoice(dia_addon_vatras_missingpeople,DIALOG_BACK,dia_addon_vatras_missingpeople_back);
	if(SCKNOWSMISSINGPEOPLEAREINADDONWORLD == TRUE)
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Wiem, gdzie przebywaj� zaginieni.",dia_addon_vatras_missingpeople_success);
	}
	else
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Powiem ci, co uda�o mi si� do tej pory ustali�.",dia_addon_vatras_missingpeople_report);
	};
	if(DIA_ADDON_VATRAS_MISSINGPEOPLE_WO_NOPERM == FALSE)
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Gdzie szuka� ich �ladu?",dia_addon_vatras_missingpeople_wo);
	};
};

func void dia_addon_vatras_missingpeople_back()
{
	Info_ClearChoices(dia_addon_vatras_missingpeople);
};

func void dia_addon_vatras_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//Gdzie szuka� ich �ladu?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//Wi�kszo�� z nich zagin�a w porcie - to chyba dobre miejsce do rozpocz�cia poszukiwa�.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"W porcie w Khorinis zagin�o najwi�cej os�b. Tam powinienem zacz�� swoje poszukiwania.");
	dia_addon_vatras_missingpeople_wo_noperm = TRUE;
};

func void dia_addon_vatras_missingpeople_report()
{
	var int vatras_missingpeoplereports;
	var int xp_vatras_missingpeoplereports;
	vatras_missingpeoplereports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//Powiem ci, co uda�o mi si� do tej pory ustali�.
	if(((MIS_AKIL_BRINGMISSPEOPLEBACK != 0) || (MIS_BENGAR_BRINGMISSPEOPLEBACK != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//Zagin�o r�wnie� paru farmer�w.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((ELVRICH_GOESBACK2THORBEN == TRUE) || (ELVRICH_SCKNOWSPIRATS == TRUE) || (SC_KNOWSDEXTERASKIDNAPPER == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//Podobno odpowiedzialni za to s� bandyci.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//Elvrich - czeladnik Thorbena - powiedzia� mi, �e to w�a�nie oni transportuj� porwanych drog� morsk�.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//Wydaje si�, �e zamieszani s� w to jacy� piraci, cho� nie wiem jeszcze na pewno, jak� odgrywaj� w tym wszystkim rol�.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//Uwolni�em Elvricha z �ap bandyt�w.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//Bandyci porwali dziewczyn� imieniem Lucia.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,itwr_luciasloveletter_addon) || (MIS_LUCIASLETTER == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//Porwana dziewczyna, Lucia, zadawa�a si� p�niej z bandytami.
		if(MIS_LUCIASLETTER == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//Jak si� wydaje, ju� z w�asnej woli.
		};
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KNOWSDEXTERASKIDNAPPER == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//Szajce przewodzi niejaki Dexter i to on odpowiada za porwania.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//Pami�tam Dextera z kolonii karnej... Pracowa� wtedy dla innego magnata, Gomeza.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//On ciebie te� z pewno�ci� zapami�ta� - miej si� na baczno�ci.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(vatras_missingpeoplereports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//Chyba jeste� na dobrym tropie - oby tak dalej.
		xp_vatras_missingpeoplereports = XP_ADDON_VATRAS_MISSINGPEOPLEREPORT * vatras_missingpeoplereports;
		b_giveplayerxp(xp_vatras_missingpeoplereports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//Czego si� dowiedzia�e�?
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_14");	//Niestety - niczego wa�nego.
	};
};

func void dia_addon_vatras_missingpeople_success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//Wiem, gdzie przebywaj� zaginieni.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//Czego uda�o ci si� dowiedzie�?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//Porwano ich i zabrano w odleg�y kraniec wyspy Khorinis. Zrobi� to niejaki Kruk.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//Co daje ci pewno��, �e tak rzeczywi�cie by�o?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	//Czyta�em jego rozkazy. Okoliczni bandyci pracuj� dla niego.
	if(Npc_HasItems(other,itwr_ravenskidnappermission_addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Patrz.
		b_usefakescroll();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//Dobra robota - a ju� zaczyna�em si� ba�, �e nigdy nie zdo�amy odkry� prawdy.
	MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_VATRAS_WHEREAREMISSINGPEOPLE);
};


instance DIA_ADDON_VATRAS_FREE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_free_condition;
	information = dia_addon_vatras_free_info;
	permanent = FALSE;
	description = "Zaginieni powr�cili.";
};


func int dia_addon_vatras_free_condition()
{
	if(MISSINGPEOPLERETURNEDHOME == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_free_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//Zaginieni powr�cili.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//Tak, uda�o ci si�! Nie ma to jak szcz�liwe zako�czenie.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//Jednak twoja podr� nie dobieg�a jeszcze ko�ca... Niech ci� Adanos b�ogos�awi.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//Adanosie, b�ogos�aw temu m�owi. O�wie� �cie�k�, po kt�rej st�pa, i daj mu si��, aby opar� si� wszystkim zagro�eniom.
	b_raiseattribute(other,ATR_MANA_MAX,3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("Levelup");
};


instance DIA_ADDON_VATRAS_WAFFEN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_waffen_condition;
	information = dia_addon_vatras_waffen_info;
	permanent = TRUE;
	description = "Co do tego handlarza broni�...";
};


func int dia_addon_vatras_waffen_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_waffen_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//Co do tego handlarza broni�...
	Info_ClearChoices(dia_addon_vatras_waffen);
	Info_AddChoice(dia_addon_vatras_waffen,DIALOG_BACK,dia_addon_vatras_waffen_back);
	if((FERNANDO_IMKNAST == TRUE) || (FERNANDO_HATSZUGEGEBEN == TRUE))
	{
		Info_AddChoice(dia_addon_vatras_waffen,"Wiem, kto dostarcza uzbrojenie bandytom!",dia_addon_vatras_waffen_success);
	}
	else
	{
		Info_AddChoice(dia_addon_vatras_waffen,"Co wiesz o handlarzu broni�?",dia_addon_vatras_waffen_tomartin);
	};
};

func void dia_addon_vatras_waffen_back()
{
	Info_ClearChoices(dia_addon_vatras_waffen);
};

func void dia_addon_vatras_waffen_tomartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//Co wiesz o handlarzu broni�?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//Pom�w z Martinem, kwatermistrzem paladyn�w. Mo�e on dysponuje informacjami w tej sprawie.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//Powierzono mu zadanie zdemaskowania handlarza broni�.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//Znajdziesz go w porcie. Jak zobaczysz par� skrzy�, �ywno�� i paladyn�w, to i on b�dzie si� tam gdzie� kr�ci�.
	VATRAS_TOMARTIN = TRUE;
};

func void dia_addon_vatras_waffen_success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//Wiem, kto dostarcza uzbrojenie bandytom!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//Nazywa si� Fernando.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//Doskonale. Martin podj�� odpowiednie kroki, aby zako�czy� ten proceder?
	if(FERNANDO_IMKNAST == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//Tak. Zadba, aby dra� nie wyszed� za szybko z lochu.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//Dobra robota, synu.
		if(Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger) && (SC_ISRANGER == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//To co, jestem ju� got�w na zostanie cz�onkiem Wodnego Kr�gu?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//Nie tak si� um�wili�my i dobrze o tym wiesz.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//Oby Adanos o�wietli� �cie�k�, po kt�rej kroczysz.
		MIS_VATRAS_FINDTHEBANDITTRADER = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_VATRAS_FINDTHEBANDITTRADER);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//Jeszcze nie.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//Pospiesz si� i mu o tym donie�! Trzeba jak najszybciej z tym sko�czy�!
	};
};


instance DIA_ADDON_VATRAS_WISP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_wisp_condition;
	information = dia_addon_vatras_wisp_info;
	description = "M�g�by� mi jako� pom�c w poszukiwaniach?";
};


func int dia_addon_vatras_wisp_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER != 0)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wisp_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//M�g�by� mi jako� pom�c w poszukiwaniach?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//Strasznie uparty z ciebie cz�owiek. Prawd� m�wi�c... Chyba w czym� mog� ci pom�c.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//Dam ci ten amulet z rudy - z pewno�ci� ci si� przyda.
	CreateInvItems(self,itam_addon_wispdetector,1);
	b_giveinvitems(self,other,itam_addon_wispdetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//To amulet ognika.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//Istnieje ich tylko kilka - zakl�ty w nim ognik ma specjalne zdolno�ci.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//Dzi�ki niemu mo�na widzie� rzeczy dla oka niewidoczne.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//Aby z niego skorzysta�, trzeba go za�o�y�.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//Je�li ognik s�abnie lub w og�le zniknie, za�� amulet ponownie, aby go zregenerowa�.
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Vatras da� mi 'Amulet szukaj�cego ognika', kt�ry przyda mi si� w poszukiwaniach handlarza broni�.");
	Log_CreateTopic(TOPIC_WISPDETECTOR,LOG_NOTE);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_NF);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_08");	//Ognik umie r�wnie� wykrywa� bro�.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_09");	//Mo�e ci si� to przyda� w zadaniu zdemaskowania sprzedawcy mieczy.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//Dbaj o amulet, a na pewno ci si� przyda.
	Info_ClearChoices(dia_addon_vatras_wisp);
	Info_AddChoice(dia_addon_vatras_wisp,"Dzi�kuj�! B�d� o tym pami�ta�.",dia_addon_vatras_wisp_thanks);
	Info_AddChoice(dia_addon_vatras_wisp,"To wszystko, co ten ognik umie?",dia_addon_vatras_wisp_morewisp);
	Info_AddChoice(dia_addon_vatras_wisp,"W tym amulecie jest ognik?",dia_addon_vatras_wisp_amulett);
	SC_GOTWISP = TRUE;
};

func void dia_addon_vatras_wisp_thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//Dzi�kuj�! B�d� o tym pami�ta�.
	Info_ClearChoices(dia_addon_vatras_wisp);
};

func void dia_addon_vatras_wisp_morewisp()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//To wszystko, co ten ognik umie?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_01");	//Poza wykrywaniem uzbrojenia? Tylko je�li go nauczysz.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//O ile mi wiadomo, to Riordan potrafi uczy� te stworki nowych sztuczek. Przebywa teraz z Saturasem.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//Mo�e on ci wi�cej o nim opowie.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		b_logentry(TOPIC_ADDON_BANDITTRADER,"Ogniki potrafi� znajdowa� nie tylko bro� bia��. Mag Wody, Riordian, mo�e nauczy� moje ogniki szukania innych przedmiot�w.");
	};
};

func void dia_addon_vatras_wisp_amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//W tym amulecie jest ognik?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//Ogniki to urocze stworzonka sk�adaj�ce si� z czystej energii magicznej.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//S� zwi�zane z magiczn� rud� tego �wiata - ona stanowi �r�d�o ich istnienia i ich mocy.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//Nie dziwi mnie, �e wcze�niej o nich nie s�ysza�e� - ujawniaj� si� tylko tym, kt�rzy przynosz� odpowiadaj�c� im rud�.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//Dzikie ogniki zosta�y brutalnie wyrwane ze swego �rodowiska i atakuj� ka�de stworzenie, kt�re si� do nich zbli�y.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//Tym �a�osnym istotom nie mo�na ju� pom�c - lepiej ich unika�.
};


instance DIA_ADDON_VATRAS_STONEPLATE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_stoneplate_condition;
	information = dia_addon_vatras_stoneplate_info;
	description = "Znalaz�em t� kamienn� tabliczk�...";
};


func int dia_addon_vatras_stoneplate_condition()
{
	if((c_schasmagicstoneplate() == TRUE) && (Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_stoneplate_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//Znalaz�em t� kamienn� tabliczk�. Mo�esz mi co� o niej powiedzie�?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//To artefakt prastarej kultury, kt�r� badamy ju� od d�u�szego czasu.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//Jest ich kilka rodzaj�w - cz�� zawiera informacje o historii tego dawnego ludu.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//I te mnie w�a�nie interesuj�. Przynie� mi wszystkie, kt�re uda ci si� znale��.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//Czeka ci� za to nagroda.
	Log_CreateTopic(TOPIC_ADDON_STONEPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATES,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATES,LOGTEXT_ADDON_VATRASTRADE);
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,LOGTEXT_ADDON_VATRASTRADE);
};


instance DIA_ADDON_VATRAS_SELLSTONPLATE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_sellstonplate_condition;
	information = dia_addon_vatras_sellstonplate_info;
	permanent = TRUE;
	description = "Mam dla ciebie kolejn� kamienn� tabliczk�...";
};


func int dia_addon_vatras_sellstonplate_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_stoneplate) && (Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_sellstonplate_info()
{
	var int anzahl;
	anzahl = Npc_HasItems(other,itwr_stoneplatecommon_addon);
	if(anzahl == 1)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_SellStonplate_15_00");	//Mam dla ciebie kolejn� kamienn� tabliczk�...
	}
	else
	{
	};
	b_giveinvitems(other,self,itwr_stoneplatecommon_addon,anzahl);
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//�wietnie!
	if(anzahl >= 10)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_02");	//Zwi�ksz� tw� moc magiczn�.
		b_raiseattribute(other,ATR_MANA_MAX,anzahl);
		Npc_ChangeAttribute(other,ATR_MANA,anzahl);
	}
	else if(anzahl >= 5)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_04");	//Przyjmij w nagrod� te kilka zwoj�w...
		b_giveinvitems(self,other,itsc_instantfireball,anzahl);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_03");	//Przyjmij w nagrod� te kilka eliksir�w...
		b_giveinvitems(self,other,itpo_health_03,anzahl + 1);
	};
	b_giveplayerxp(XP_ADDON_VATRASSTONPLATE * anzahl);
};


var int vatras_senttodaron;

instance DIA_ADDON_VATRAS_GUILDHELP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_guildhelp_condition;
	information = dia_addon_vatras_guildhelp_info;
	description = "Lares wspomnia�, �e mo�esz pom�c mi dosta� si� do klasztoru Mag�w Ognia.";
};


func int dia_addon_vatras_guildhelp_condition()
{
	if(RANGERHELP_GILDEKDF == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//Lares wspomnia�, �e mo�esz pom�c mi dosta� si� do klasztoru Mag�w Ognia.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//Taki jest tw�j wyb�r? �cie�ka ognia?
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//Owszem, mam zamiar zosta� Magiem Ognia.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//O ile pami�tam, to oni ch�tnie przyjmuj� nowicjuszy... Po co ci moja pomoc?
	if(SC_KNOWSKLOSTERTRIBUT == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//Potrzebna jest danina - owca i z�oto.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//Lares wspomina�, �e w celu przyst�pienia do klasztoru trzeba wnie�� jak�� danin�.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//Bezpo�rednio pom�c ci nie mog� - jak zapewne wiesz, jestem Magiem Wody. Znam jednak do�� dobrze Maga Ognia imieniem Daron.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//Z regu�y zbiera datki w pobli�u targowiska.
	VATRAS_SENTTODARON = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//S�ysza�em ponadto, �e to nie jedyne jego zadanie w tamtej okolicy...
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//Powiedzia� mi kiedy� o pos��ku, kt�ry mu ukradziono.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//Sprawa jest dla niego bardzo wa�na i z pewno�ci� wesprze ci�, je�li odzyskasz dla niego ten pos��ek.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//Rzecz jasna fakt zostania Magiem Ognia nie oznacza, �e nie mo�esz do��czy� do Kr�gu.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//Warunek jest jednak jasny - musisz dowie�� swej warto�ci.
	MIS_ADDON_VATRAS_GO2DARON = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Mag Ognia z targowiska, Daron, pomo�e mi wst�pi� do klasztoru, je�li odzyskam dla niego ma�y pos��ek, kt�ry mu skradziono.");
};


instance DIA_VATRAS_MORE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 998;
	condition = dia_vatras_more_condition;
	information = dia_vatras_more_info;
	permanent = TRUE;
	description = "(DALEJ)";
};


func int dia_vatras_more_condition()
{
	if(VATRAS_MORE == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_more_info()
{
	VATRAS_MORE = TRUE;
};


instance DIA_VATRAS_INFLUENCE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 92;
	condition = dia_vatras_influence_condition;
	information = dia_vatras_influence_info;
	permanent = FALSE;
	description = "Przybywam, by prosi� ci� o b�ogos�awie�stwo.";
};


func int dia_vatras_influence_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_influence_info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Przybywam, by prosi� ci� o b�ogos�awie�stwo.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//Dlaczeg� mia�bym ci� pob�ogos�awi�, nieznajomy?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Chc� zosta� czeladnikiem u jednego z mistrz�w w dolnej cz�ci miasta.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Id� wi�c z b�ogos�awie�stwem Adanosa, m�j synu!
	Snd_Play("LevelUp");
	b_giveplayerxp(XP_VATRASTRUTH);
	VATRAS_SEGEN = TRUE;
	b_logentry(TOPIC_THORBEN,"Vatras, Mag Wody, udzieli� mi b�ogos�awie�stwa.");
};


instance DIA_VATRAS_WOKDF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 93;
	condition = dia_vatras_wokdf_condition;
	information = dia_vatras_wokdf_info;
	permanent = FALSE;
	description = "Gdzie mog� znale�� jakiego� kap�ana Innosa?";
};


func int dia_vatras_wokdf_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (VATRAS_SEGEN == TRUE) && (VATRAS_SENTTODARON == FALSE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_wokdf_info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Gdzie mog� znale�� jakiego� kap�ana Innosa?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Najlepiej rozejrzyj si� po targowisku. Znajdziesz tam wys�annika klasztoru.
};


instance DIA_VATRAS_SPENDE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 94;
	condition = dia_vatras_spende_condition;
	information = dia_vatras_spende_info;
	permanent = TRUE;
	description = "Chcia�bym przekaza� datek na �wi�tyni� Adanosa!";
};


func int dia_vatras_spende_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_spende_info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Chcia�bym przekaza� datek na �wi�tyni� Adanosa!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Datek na �wi�tyni� Adanosa mo�e zmaza� cz�� przewin, kt�re pope�ni�e� w przesz�o�ci, m�j synu.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Jak� sum� zechcesz przekaza�?
	Info_ClearChoices(dia_vatras_spende);
	Info_AddChoice(dia_vatras_spende,"Chwilowo nie mam pieni�dzy...",dia_vatras_spende_back);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_vatras_spende,"Mam 50 sztuk z�ota...",dia_vatras_spende_50);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_vatras_spende,"Mam 100 sztuk z�ota...",dia_vatras_spende_100);
	};
};

func void dia_vatras_spende_back()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Chwilowo nie mam pieni�dzy...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//Nic si� nie sta�o. Adanos zawsze ucieszy si� z twojej ofiary.
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//Mam 50 sztuk z�ota...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Dzi�kuj� ci w imieniu Adanosa, m�j synu. Twoje z�oto zostanie przekazane potrzebuj�cym.
	b_giveinvitems(other,self,itmi_gold,50);
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//Mam 100 sztuk z�ota...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//B�d� b�ogos�awiony, m�j synu! Dzi�ki ci za tw� hojno��.
	Snd_Play("LevelUp");
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Niech Adanos strze�e ci� zawsze od z�ej przygody.
	b_giveinvitems(other,self,itmi_gold,100);
	VATRAS_SEGEN = TRUE;
	Info_ClearChoices(dia_vatras_spende);
	if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
	{
		b_logentry(TOPIC_THORBEN,"Vatras, Mag Wody, udzieli� mi b�ogos�awie�stwa.");
	};
};


instance DIA_VATRAS_CANTEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 95;
	condition = dia_vatras_canteach_condition;
	information = dia_vatras_canteach_info;
	permanent = FALSE;
	description = "Mo�esz nauczy� mnie czego� o magii?";
};


func int dia_vatras_canteach_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_canteach_info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Mo�esz nauczy� mnie czego� o magii?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Tylko Wybra�cy Innosa i Wybra�cy Adanosa mog� pos�ugiwa� si� magi� run.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Ale magia dost�pna jest tak�e zwyk�ym �miertelnikom, pod postaci� magicznych zwoj�w.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Mog� ci� nauczy�, jak lepiej wykorzystywa� dost�pn� ci magiczn� moc.
	VATRAS_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Vatras, Mag Wody, mo�e pom�c mi w zwi�kszeniu magicznych zdolno�ci.");
};


instance DIA_VATRAS_TEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 100;
	condition = dia_vatras_teach_condition;
	information = dia_vatras_teach_info;
	permanent = TRUE;
	description = "Chc� zwi�kszy� moj� magiczn� moc.";
};


func int dia_vatras_teach_condition()
{
	if((VATRAS_TEACHMANA == TRUE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_teach_info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Chc� zwi�kszy� moj� magiczn� moc.
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Jeste� ju� zbyt pot�ny, bym m�g� ci� czego� nauczy�.
	};
	Info_ClearChoices(dia_vatras_teach);
};

func void dia_vatras_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};


instance DIA_VATRAS_GODS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 98;
	condition = dia_vatras_gods_condition;
	information = dia_vatras_gods_info;
	permanent = TRUE;
	description = "Opowiedz mi o bogach.";
};


func int dia_vatras_gods_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_gods_info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Opowiedz mi o bogach.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//A co dok�adnie chcia�by� o nich wiedzie�?
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_back()
{
	Info_ClearChoices(dia_vatras_gods);
};

func void dia_vatras_gods_innos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Opowiedz mi o Innosie.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Dobrze. Innos jest pierwszym i najpot�niejszym z bog�w. To on da� �wiatu S�o�ce.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//W jego w�adaniu znajduj� si� �wiat�o i ogie�, kt�re podarowa� ludzko�ci. Innos jest te� sprawiedliwo�ci� i prawem.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Jego kap�anami s� Magowie Ognia, a wojownikami - m�ni paladyni.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_adanos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Opowiedz mi o Adanosie.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos jest bogiem harmonii. To boski stra�nik r�wnowagi pomi�dzy Innosem a Beliarem.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Jest te� wielkim sprawc� zmian i panem w�d wszystkich m�rz, rzek i jezior.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Jego oddanymi s�ugami s� moi bracia, Magowie Wody.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_beliar()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Opowiedz mi o Beliarze.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar jest mrocznym bogiem �mierci, zniszczenia i wszystkich rzeczy nienaturalnych.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Toczy on wieczn� wojn� z Innosem, ale Adanos dba, by ich si�y zawsze by�y wyr�wnane.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Niewielu ludzi pozostaje w s�u�bie Beliara, ale s� oni niezwykle pot�ni.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};


instance DIA_VATRAS_HEAL(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 99;
	condition = dia_vatras_heal_condition;
	information = dia_vatras_heal_info;
	permanent = TRUE;
	description = "Mo�esz mnie uzdrowi�?";
};


func int dia_vatras_heal_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Mo�esz mnie uzdrowi�?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//Adanosie, pob�ogos�aw to cia�o, uwolnij je od ran i tchnij w nie nowe �ycie!
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Nie potrzebujesz pomocy uzdrowiciela.
	};
};


instance DIA_VATRAS_MISSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_vatras_mission_condition;
	information = dia_vatras_mission_info;
	important = TRUE;
};


func int dia_vatras_mission_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_vatras_mission_info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//Mam wiadomo�� dla Mistrza Isgarotha. Strze�e on kaplicy przed klasztorem.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Je�li podejmiesz si� wykona� to zadanie, b�dziesz m�g� sam sobie wybra� nagrod�.
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Nie teraz!",dia_vatras_mission_no);
	Info_AddChoice(dia_vatras_mission,"Jasne.",dia_vatras_mission_yes);
};

func void b_sayvatrasgo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Dobrze. Ruszaj teraz w drog� do Mistrza Isgarotha.
};

func void dia_vatras_mission_yes()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Mo�esz na mnie liczy�.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//�wietnie. Zabierz zatem t� wiadomo�� i wybierz jeden ze zwoj�w z zakl�ciami.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//Gdy dostarczysz wiadomo��, otrzymasz odpowiedni� nagrod�.
	b_giveinvitems(self,hero,itwr_vatrasmessage,1);
	MIS_VATRAS_MESSAGE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOTSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOTSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_BOTSCHAFT,"Vatras da� mi wiadomo�� dla Mistrza Isgarotha, kt�rego znajd� w kaplicy przed klasztorem.");
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Wezm� zakl�cie �wiat�a.",dia_vatras_mission_light);
	Info_AddChoice(dia_vatras_mission,"Wybieram zakl�cie uzdrawiaj�ce.",dia_vatras_mission_heal);
	Info_AddChoice(dia_vatras_mission,"Daj mi Lodow� Strza��.",dia_vatras_mission_ice);
};

func void dia_vatras_mission_no()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Nie teraz!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//Nie ma sprawy - po�l� kogo� innego.
	MIS_VATRAS_MESSAGE = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_heal()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Wybieram zakl�cie uzdrawiaj�ce.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_lightheal,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_ice()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Daj mi Lodow� Strza��.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_icebolt,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_light()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Wezm� zakl�cie �wiat�a.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_light,1);
	Info_ClearChoices(dia_vatras_mission);
};


instance DIA_VATRAS_MESSAGE_SUCCESS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_vatras_message_success_condition;
	information = dia_vatras_message_success_info;
	description = "Dostarczy�em twoj� wiadomo��.";
};


func int dia_vatras_message_success_condition()
{
	if((MIS_VATRAS_MESSAGE == LOG_RUNNING) && (VATRAS_RETURN == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_message_success_info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Dostarczy�em twoj� wiadomo��.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Przyjmij wi�c moje podzi�kowanie. Mo�esz teraz wybra� swoj� nagrod�.
	MIS_VATRAS_MESSAGE = LOG_SUCCESS;
	b_giveplayerxp(XP_VATRAS_MESSAGE);
	Info_ClearChoices(dia_vatras_message_success);
	Info_AddChoice(dia_vatras_message_success,"1 szczaw kr�lewski",dia_vatras_message_success_plant);
	Info_AddChoice(dia_vatras_message_success,"Pier�cie� zr�czno�ci",dia_vatras_message_success_ring);
	Info_AddChoice(dia_vatras_message_success,"1 bry�ka rudy",dia_vatras_message_success_ore);
};

func void dia_vatras_message_success_plant()
{
	b_giveinvitems(self,hero,itpl_perm_herb,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ring()
{
	b_giveinvitems(self,hero,itri_dex_01,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ore()
{
	b_giveinvitems(self,hero,itmi_nugget,1);
	Info_ClearChoices(dia_vatras_message_success);
};


const int KURZ = 0;
const int LANG = 1;
var int vatras_einmallangweg;

func void b_vatras_geheweg(var int dauer)
{
	if(VATRAS_EINMALLANGWEG == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,zs_preach_vatras))
	{
		b_stoplookat(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//S�uchajcie, moi drodzy! Jestem potrzebny gdzie indziej.
		if(dauer == KURZ)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//To nie potrwa d�ugo. Po powrocie opowiem wam reszt� tej historii.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Nie wiem, kiedy powr�c�. Je�li chcecie pozna� zako�czenie tej historii, przeczytajcie odpowiednie pisma.
			VATRAS_EINMALLANGWEG = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Niech Adanos b�dzie z wami!
		b_turntonpc(self,other);
	};
	VATRAS_SCHICKELEUTEWEG = TRUE;
};


instance DIA_ADDON_VATRAS_ABLOESEPRE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_abloesepre_condition;
	information = dia_addon_vatras_abloesepre_info;
	description = "Mam pewien problem z Okiem Innosa.";
};


func int dia_addon_vatras_abloesepre_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3) && (VATRASCANLEAVETOWN_KAP3 == FALSE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_abloesepre_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//Mam pewien problem z Okiem Innosa - by� mo�e b�dzie mi potrzebna twoja pomoc.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//A b�d� musia� w tym celu opu�ci� miasto?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//Nie wiem. By� mo�e.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//Od kilku dni czekam na zmiennika. Inni Magowie Wody powinni byli wr�ci� tu ju� jaki� czas temu.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//Postaraj si�, aby przys�ali mi zmiennika, a ja pomog� ci w rozwi�zaniu twojego problemu.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	Log_CreateTopic(TOPIC_ADDON_VATRASABLOESUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_VATRASABLOESUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_VATRASABLOESUNG,"Vatras nie mo�e mi pom�c z Okiem Innosa, dop�ki inny Mag Wody nie zajmie jego miejsca w mie�cie.");
};


instance DIA_ADDON_VATRAS_ADDONSOLVED(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_addonsolved_condition;
	information = dia_addon_vatras_addonsolved_info;
	description = "Przyby� zmiennik.";
};


func int dia_addon_vatras_addonsolved_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_addonsolved_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//Przyby� zmiennik.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_01");	//Czy sprawy spoza g�r na p�nocnym wschodzie zosta�y rozwi�zane?
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_02");	//Tak. Kruk nie �yje i nie stanowi ju� zagro�enia.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//To doskona�e wie�ci. Mam nadziej�, �e podobne rzeczy ju� si� nie powt�rz�.
	if(Npc_KnowsInfo(other,dia_addon_vatras_abloesepre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//Teraz mog� ci pom�c rozwi�za� problem.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//O ile dobrze pami�tam, wi�za� si� on z Okiem Innosa?
	};
	VATRASCANLEAVETOWN_KAP3 = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_VATRAS_INNOSEYEKAPUTT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_innoseyekaputt_condition;
	information = dia_vatras_innoseyekaputt_info;
	description = "Oko Innosa zosta�o uszkodzone.";
};


func int dia_vatras_innoseyekaputt_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3) && (VATRASCANLEAVETOWN_KAP3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_innoseyekaputt_info()
{
	if(MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Przysy�a mnie Pyrokar.
	}
	else if(MIS_XARDAS_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Przysy�a mnie Xardas.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Oko Innosa zosta�o uszkodzone.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Wiem. Donie�li mi o tym napotkani nowicjusze.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Poszukiwacze wykorzystali w tym celu �wi�ty S�oneczny Kr�g Mag�w Ognia.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//To znak, �e nieprzyjaciel znacznie ur�s� w si��.
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Wie�ci szybko si� roznosz�.",dia_vatras_innoseyekaputt_schnellenachrichten);
	if((hero.guild == GIL_KDF) && (MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING))
	{
		Info_AddChoice(dia_vatras_innoseyekaputt,"Dlaczego Pyrokar przys�a� mnie w�a�nie do ciebie - Maga Wody?",dia_vatras_innoseyekaputt_warumdu);
	};
	Info_AddChoice(dia_vatras_innoseyekaputt,"Co si� teraz stanie z Okiem?",dia_vatras_innoseyekaputt_auge);
};

func void dia_vatras_innoseyekaputt_auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Co si� teraz stanie z Okiem?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Musimy spr�bowa� je naprawi�. Nie b�dzie to jednak �atwe zadanie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Oprawa p�k�a na dwie cz�ci. Zr�czny kowal zdo�a zapewne po��czy� je z powrotem.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Ale to mniejsza cz�� problemu. Bardziej martwi mnie sam klejnot.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Jest matowy, pozbawiony blasku. Nieprzyjaciel dok�adnie wiedzia�, jak unieszkodliwi� amulet.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Gdzie znajd� kowala, kt�ry zdo�a naprawi� opraw� amuletu?",dia_vatras_innoseyekaputt_auge_schmied);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Czy mo�emy przywr�ci� klejnotowi dawn� moc?",dia_vatras_innoseyekaputt_auge_stein);
};

func void dia_vatras_innoseyekaputt_auge_stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Czy mo�emy przywr�ci� klejnotowi dawn� moc?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Jest tylko jeden na to spos�b - po��czone moce wszystkich trzech bog�w powinny tego dokona�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//W miejscu zniszczenia amuletu nale�y przeprowadzi� odpowiedni rytua� odwracaj�cy. Mo�e wtedy klejnot odzyska sw�j ogie�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Problem w tym, �e musisz sprowadzi� do tego miejsca ziemskich przedstawicieli wszystkich trzech bog�w.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Potrzebujemy te� znacznej ilo�ci bagiennego ziela. My�l�, �e nie mniej ni� 3 ro�liny.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Kim maj� by� ci trzej przedstawiciele bog�w?",dia_vatras_innoseyekaputt_auge_stein_wer);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Gdzie mog� znale�� to bagienne ziele?",dia_vatras_innoseyekaputt_auge_stein_kraut);
};

func void dia_vatras_innoseyekaputt_auge_stein_kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Gdzie mog� znale�� to bagienne ziele?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Podobno w tych lasach mieszka stara wied�ma imieniem Sagitta. Mo�e u niej znajdziesz takie ziele.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Ewentualnie rozejrzyj si� troch� na przystani.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Kim maj� by� ci trzej przedstawiciele bog�w?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Adanosa mog� reprezentowa� osobi�cie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Przedstawicielem Innosa powinien by� Pyrokar, najwy�szy z Mag�w Ognia.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Ale nie wiem, kto m�g�by reprezentowa� Beliara. Potrzebujemy prawdziwego mistrza czarnej magii.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Czarnej magii? Mo�e Xardas?",dia_vatras_innoseyekaputt_auge_stein_wer_xardas);
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Czarnej magii? Mo�e Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//Tak! To si� powinno uda�!
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Nie wiem tylko, czy uda ci si� sprowadzi� obydwu.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Ju� widz� wyraz twarzy Pyrokara, gdy dowie si�, �e musi wsp�pracowa� z Xardasem.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Musz� ju� i��.",dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter);
};

func void dia_vatras_innoseyekaputt_auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Gdzie znajd� kowala, kt�ry zdo�a naprawi� opraw� amuletu?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Musisz popyta� ludzi o kowala, kt�ry zna si� na jubilerstwie.
};

func void dia_vatras_innoseyekaputt_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Dlaczego Pyrokar przys�a� mnie w�a�nie do ciebie - Maga Wody?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Podejrzewa�em, �e pr�dzej czy p�niej dojdzie do czego� takiego.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar ma si� za tak pot�nego i niezwyci�onego, �e cz�sto zachowuje si� wr�cz nieodpowiedzialnie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//I zosta� za to ukarany - straci� Oko Innosa.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//My�l� jednak, �e pod�wiadomie polega na mocy powierzonej mi przez Adanosa.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Lepiej nie my�le�, co by si� sta�o, gdyby mnie teraz zabrak�o.
};

func void dia_vatras_innoseyekaputt_schnellenachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Wie�ci szybko si� rozchodz�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//I bardzo dobrze. Nieprzyjaciel te� nie b�dzie czeka� bezczynnie.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Musz� ju� i��.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Ja te� wyrusz� w drog�, by przygotowa� S�oneczny Kr�g do ceremonii.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Przy�lij do mnie Xardasa i Pyrokara. I nie zapomnij o bagiennym zielu! Licz� na ciebie.
	b_logentry(TOPIC_INNOSEYE,"Vatras chce odprawi� rytua� w S�onecznym Kr�gu, aby uzdrowi� Oko. Musz� przekona� Xardasa i Pyrokara, aby wzi�li udzia� w tym przedsi�wzi�ciu. Powinienem tak�e znale�� kowala, kt�ry naprawi p�kni�t� opraw� amuletu.");
	MIS_RITUALINNOSEYEREPAIR = LOG_RUNNING;
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	b_vatras_geheweg(KURZ);
	dmt_1201.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1202.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1203.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1204.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1205.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1206.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1207.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1208.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1209.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1210.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1211.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_startotherroutine(dmt_1201,"AfterRitual");
	b_startotherroutine(dmt_1202,"AfterRitual");
	b_startotherroutine(dmt_1203,"AfterRitual");
	b_startotherroutine(dmt_1204,"AfterRitual");
	b_startotherroutine(dmt_1205,"AfterRitual");
	b_startotherroutine(dmt_1206,"AfterRitual");
	b_startotherroutine(dmt_1207,"AfterRitual");
	b_startotherroutine(dmt_1208,"AfterRitual");
	b_startotherroutine(dmt_1209,"AfterRitual");
	b_startotherroutine(dmt_1210,"AfterRitual");
	b_startotherroutine(dmt_1211,"AfterRitual");
};


instance DIA_VATRAS_RITUALINNOSEYEREPAIR(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_ritualinnoseyerepair_condition;
	information = dia_vatras_ritualinnoseyerepair_info;
	permanent = TRUE;
	description = "Co z Okiem Innosa?";
};


func int dia_vatras_ritualinnoseyerepair_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_vatras_ritualinnoseyerepair_info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Co z Okiem Innosa?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Tylko rytua� odwr�cenia odprawiony w S�onecznym Kr�gu przeze mnie, Xardasa i Pyrokara mo�e przywr�ci� Oku dawn� moc.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//Pami�taj, �eby przynie�� Oko z naprawion� opraw�.
};


instance DIA_VATRAS_BEGINN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 31;
	condition = dia_vatras_beginn_condition;
	information = dia_vatras_beginn_info;
	description = "Zrobi�em wszystko, o co prosi�e�.";
};


func int dia_vatras_beginn_condition()
{
	if((KAPITEL == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_vatras_beginn_info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Zrobi�em wszystko, o co prosi�e�. Oto naprawione Oko.
	b_giveplayerxp(XP_RITUALINNOSEYERUNS);
	b_giveinvitems(other,self,itmi_innoseye_broken_mis,1);
	Npc_RemoveInvItem(self,itmi_innoseye_broken_mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//�wietnie. Mo�emy zatem przyst�pi� do odprawienia rytua�u.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//A co z bagiennym zielem?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Ach, tak. Przynios�e� dla mnie trzy ro�liny?
	if(b_giveinvitems(other,self,itpl_swampherb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Tak. Oto one.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Znakomicie.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Nie. Niestety, nie.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Trudno. Poradzimy sobie jako� bez nich.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Dobrze si� spisa�e�, ale teraz odsu� si� na bok, by�my mogli przyst�pi� do ceremonii. Niech zjednocz� si� nasze si�y!
	Info_ClearChoices(dia_vatras_beginn);
	Info_AddChoice(dia_vatras_beginn,DIALOG_ENDE,dia_vatras_beginn_los);
};

func void dia_vatras_beginn_los()
{
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	b_startotherroutine(xardas,"RITUALINNOSEYE");
	b_startotherroutine(pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RITUALINNOSEYERUNS = LOG_RUNNING;
};


instance DIA_VATRAS_AUGEGEHEILT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_augegeheilt_condition;
	information = dia_vatras_augegeheilt_info;
	important = TRUE;
};


func int dia_vatras_augegeheilt_condition()
{
	if((KAPITEL == 3) && (RITUALINNOSEYERUNS == LOG_RUNNING) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_augegeheilt_info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Ju� po wszystkim. Uda�o si� nam pokrzy�owa� plan nieprzyjaciela. Oko odzyska�o sw� moc!
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Pyrokar wyja�ni ci, jak u�ywa� Oka.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Mam nadziej�, �e spotkamy si� jeszcze, gdy wype�nisz ju� swoj� misj�. Bywaj!
	b_logentry(TOPIC_INNOSEYE,"Oko zosta�o uzdrowione. Kiedy Pyrokar mi je wr�czy, udam si� na polowanie na smoki.");
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	RITUALINNOSEYERUNS = LOG_SUCCESS;
	MIS_RITUALINNOSEYEREPAIR = LOG_SUCCESS;
	b_startotherroutine(pyrokar,"RitualInnosEyeRepair");
	b_startotherroutine(xardas,"RitualInnosEyeRepair");
	b_startotherroutine(vlk_455_buerger,"START");
	b_startotherroutine(vlk_454_buerger,"START");
	b_startotherroutine(vlk_428_buergerin,"START");
	b_startotherroutine(vlk_450_buerger,"START");
	b_startotherroutine(vlk_426_buergerin,"START");
	b_startotherroutine(vlk_421_valentino,"START");
};


instance DIA_VATRAS_PERMKAP3(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_permkap3_condition;
	information = dia_vatras_permkap3_info;
	description = "Dzi�ki ci za pomoc w naprawieniu Oka Innosa.";
};


func int dia_vatras_permkap3_condition()
{
	if(MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_vatras_permkap3_info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Dzi�ki ci za pomoc w naprawieniu Oka Innosa.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Zachowaj podzi�kowania na p�niej. Czeka ci� teraz najwi�ksze wyzwanie.
	if(MIS_READYFORCHAPTER4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Porozmawiaj z Pyrokarem. On ci wszystko wyt�umaczy.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Mam nadziej�, �e jeszcze si� kiedy� spotkamy, m�j synu.
};


instance DIA_VATRAS_HILDAKRANK(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 34;
	condition = dia_vatras_hildakrank_condition;
	information = dia_vatras_hildakrank_info;
	description = "�ona Lobarta, Hilda, zachorowa�a.";
};


func int dia_vatras_hildakrank_condition()
{
	if((MIS_HEALHILDA == LOG_RUNNING) && Npc_KnowsInfo(other,dia_vatras_greet))
	{
		return TRUE;
	};
};

func void dia_vatras_hildakrank_info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//�ona Lobarta, Hilda, zachorowa�a.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Co? Znowu? Ta biedna kobieta powinna bardziej na siebie uwa�a�.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Jeszcze jedna ci�ka zima, a odejdzie z tego �wiata. Dobrze. Dam jej lekarstwo, kt�re zmniejszy gor�czk�.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//Hmmm... Skoro ju� tu jeste�, m�g�by� jej zanie�� lekarstwo?
	CreateInvItems(self,itpo_healhilda_mis,1);
	b_giveinvitems(self,other,itpo_healhilda_mis,1);
};


instance DIA_VATRAS_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 35;
	condition = dia_vatras_obsession_condition;
	information = dia_vatras_obsession_info;
	description = "Chyba mam dreszcze.";
};


func int dia_vatras_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1))
	{
		return TRUE;
	};
};

func void dia_vatras_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//Chyba mam dreszcze.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Nie wygl�dasz najlepiej. Chyba zbyt d�ugo wystawia�e� si� na czarne spojrzenia Poszukiwaczy.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Mog� uzdrowi� twoje cia�o, ale spok�j duszy odzyskasz jedynie w klasztorze. Porozmawiaj z Pyrokarem. On ci pomo�e.
};


instance DIA_VATRAS_ALLDRAGONSDEAD(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 59;
	condition = dia_vatras_alldragonsdead_condition;
	information = dia_vatras_alldragonsdead_info;
	description = "Nie musimy ju� obawia� si� smok�w.";
};


func int dia_vatras_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vatras_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Nie musimy ju� obawia� si� smok�w.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Wiedzia�em, �e wr�cisz ca�y i zdrowy! Jednak najwi�ksze wyzwanie dopiero przed tob�.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Tak, wiem.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Zatem wyposa� si� odpowiednio i przyjd� do mnie, gdyby� potrzebowa� pomocy. Zawsze miej przy sobie Oko Innosa! Niech Adanos b�dzie z tob�.
};


instance DIA_VATRAS_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_knowwhereenemy_condition;
	information = dia_vatras_knowwhereenemy_info;
	permanent = TRUE;
	description = "Wiem, gdzie czai si� nasz nieprzyjaciel.";
};


func int dia_vatras_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (VATRAS_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Wiem, gdzie czai si� nasz nieprzyjaciel.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Zatem nie tra�my czasu i pierwsi si� z nim rozprawmy.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Chcesz mi towarzyszy�?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//D�ugo si� nad tym zastanawia�em, ale teraz nie mam w�tpliwo�ci. Chc� wyruszy� z tob�.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Vatras, ku mojemu zaskoczeniu, chce mi towarzyszy� w mojej wyprawie. Tak do�wiadczony towarzysz by�by dla mnie prawdziwym skarbem.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//Moja za�oga jest i tak bardzo liczna. Obawiam si�, �e mo�e dla ciebie zabrakn�� miejsca.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Zatem zwolnij dla mnie miejsce. B�d� ci potrzebny.
	}
	else
	{
		Info_ClearChoices(dia_vatras_knowwhereenemy);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Musz� to sobie jeszcze przemy�le�.",dia_vatras_knowwhereenemy_no);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Jestem zaszczycony twoj� propozycj�.",dia_vatras_knowwhereenemy_yes);
	};
};

func void dia_vatras_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Jestem zaszczycony twoj� propozycj�. Spotkamy si� na przystani.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Spiesz si�. Nieprzyjaciel nie zasypia gruszek w popiele.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	b_vatras_geheweg(LANG);
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};

func void dia_vatras_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Musz� to sobie jeszcze przemy�le�.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Jak uwa�asz. Wr�� do mnie, gdy ju� podejmiesz decyzj�.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};


instance DIA_VATRAS_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_leavemyship_condition;
	information = dia_vatras_leavemyship_info;
	permanent = TRUE;
	description = "Lepiej b�dzie, je�li tu zostaniesz. To miasto ci� potrzebuje.";
};


func int dia_vatras_leavemyship_condition()
{
	if((VATRAS_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_leavemyship_info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Lepiej b�dzie, je�li tu zostaniesz. To miasto ci� potrzebuje.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Mo�e masz racj�... Mimo to, je�li zechcesz, wyrusz� z tob�! Pami�taj o tym.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_VATRAS_STILLNEEDYOU(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_stillneedyou_condition;
	information = dia_vatras_stillneedyou_info;
	permanent = TRUE;
	description = "Chc� ci� zabra� na wysp� nieprzyjaciela.";
};


func int dia_vatras_stillneedyou_condition()
{
	if(((VATRAS_ISONBOARD == LOG_OBSOLETE) || (VATRAS_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_vatras_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Chc� ci� zabra� na wysp� nieprzyjaciela.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//M�dra decyzja. Mam nadziej�, �e ostateczna?
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_vatras_geheweg(LANG);
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_ADDON_VATRAS_PISSOFFFOREVVER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_pissoffforevver_condition;
	information = dia_addon_vatras_pissoffforevver_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_vatras_pissoffforevver_condition()
{
	if((VATRASPISSEDOFFFOREVER == TRUE) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_pissoffforevver_info()
{
	b_vatraspissedoff();
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
};

