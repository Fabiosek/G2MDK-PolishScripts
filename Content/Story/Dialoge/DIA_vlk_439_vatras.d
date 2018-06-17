
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
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//Du¿o plotek kr¹¿y w Khorinis na twój temat.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//Podobno jesteœ zamieszany w mordowanie niewinnych...
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//Ostrzegam ciê - jeœli to oka¿e siê prawd¹...
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//Nie schodŸ ze œcie¿ki równowagi i ocalenia tego œwiata - w przeciwnym wypadku czekaj¹ ciê powa¿ne konsekwencje.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//Czym mogê s³u¿yæ?
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
	Info_AddChoice(dia_addon_vatras_lastwarning,"Odwal siê.",dia_addon_vatras_lastwarning_arsch);
	Info_AddChoice(dia_addon_vatras_lastwarning,"Przykro mi... Nie wiedzia³em, co robiê.",dia_addon_vatras_lastwarning_reue);
};

func void dia_addon_vatras_lastwarning_arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Odwal siê.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//Nie s³yszê w twoich s³owach skruchy.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//Nie pozostawiasz mi ¿adnego wyboru.
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	b_vatraspissedoff();
};

func void dia_addon_vatras_lastwarning_reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//Przykro mi... Nie wiedzia³em, co robiê.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//Bêdê siê za ciebie modliæ w nadziei, ¿e odnajdziesz jeszcze kiedyœ równowagê.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//Nie wa¿ siê ju¿ jednak nigdy pope³niæ ¿adnego mordu.
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
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//Twe s³owa s¹ równie z³e, jak twoje uczynki.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//Twoim bezsensownym morderstwom nie ma koñca.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//Nie pozostawiasz mi ¿adnego wyboru.
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
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//Jeœli wpadniesz przypadkiem na Laresa...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//Jest coœ, co mo¿esz dla mnie zrobiæ.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//IdŸ do portu - znajdziesz tam niejakiego Laresa.
			VATRAS_GEHZULARES = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//Przeka¿ mu ten ornament i ka¿ mu go oddaæ. Bêdzie wiedzia³ co zrobiæ.
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
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Niech ³aska Adanosa bêdzie z tob¹.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Nazywam siê Vatras. Jestem s³ug¹ Adanosa, stra¿nika niebiañskiej i ziemskiej harmonii.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Co mogê dla ciebie zrobiæ?
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
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//Owszem. Tylko... By³ otwarty. Mam nadziejê, ¿e nie przeczyta³ go nikt niepowo³any.
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//Tak... To naprawdê wa¿na wiadomoœæ.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//Ciekawi mnie, jak wszed³eœ w jej posiadanie?
	Info_ClearChoices(dia_addon_vatras_cavalorn);
	Info_AddChoice(dia_addon_vatras_cavalorn,"Zabra³em j¹ bandytom.",dia_addon_vatras_cavalorn_bandit);
	if(MIS_ADDON_CAVALORN_KILLBRAGO == LOG_SUCCESS)
	{
		Info_AddChoice(dia_addon_vatras_cavalorn,"Od Cavalorna, myœliwego.",dia_addon_vatras_cavalorn_cavalorn);
	};
	MIS_ADDON_CAVALORN_LETTER2VATRAS = LOG_SUCCESS;
};

func void dia_addon_vatras_cavalorn_bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//Zabra³em j¹ bandytom.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//Och! Adanosie! Niedobrze, bardzo niedobrze.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//Jeœli mówisz prawdê, to mamy ogromny problem.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//Trzeba siê tym jak najszybciej zaj¹æ.
	Info_ClearChoices(dia_addon_vatras_cavalorn);
};

func void dia_addon_vatras_cavalorn_cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//Od Cavalorna, myœliwego.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//Cavalorn? A gdzie on siê podziewa?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//Poleci³ mi przekazaæ, ¿e nie zd¹¿y³ na czas i ¿e zmierza na miejsce spotkania - gdziekolwiek by to nie by³o.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//Widzê, ¿e zas³u¿y³eœ sobie na jego zaufanie... Ja równie¿ bêdê ci chyba musia³ zaufaæ.
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
	description = "Przysy³a mnie Cavalorn!";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//Przysy³a mnie Cavalorn!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//Naprawdê? I co powiedzia³?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//¯e nie wzgardzisz pomoc¹ osób wszechstronnie uzdolnionych.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//A wiêc chcesz siê do nas przy³¹czyæ - czy tak, mój synu?
};


instance DIA_ADDON_VATRAS_TELLME(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_tellme_condition;
	information = dia_addon_vatras_tellme_info;
	permanent = TRUE;
	description = "Powiedz mi coœ o Wodnym Krêgu.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//Powiedz mi coœ o Wodnym Krêgu.
	if(!Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//A czemu mia³bym to zrobiæ?
		VATRAS_WHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//Nie musisz wiedzieæ wszystkiego, dopóki nie staniesz siê jednym z nas.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//Co nieco mogê ci jednak opowiedzieæ...
		Info_ClearChoices(dia_addon_vatras_tellme);
		Info_AddChoice(dia_addon_vatras_tellme,DIALOG_BACK,dia_addon_vatras_tellme_back);
		Info_AddChoice(dia_addon_vatras_tellme,"Czym siê tak w zasadzie zajmujecie?",dia_addon_vatras_tellme_philo);
		Info_AddChoice(dia_addon_vatras_tellme,"Gdzie s¹ Magowie Wody?",dia_addon_vatras_tellme_otherkdw);
		Info_AddChoice(dia_addon_vatras_tellme,"Kim s¹ cz³onkowie Wodnego Krêgu?",dia_addon_vatras_tellme_wernoch);
	};
};

func void dia_addon_vatras_tellme_back()
{
	Info_ClearChoices(dia_addon_vatras_tellme);
};

func void dia_addon_vatras_tellme_philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//Czym siê tak w zasadzie zajmujecie?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//Stoimy pomiêdzy porz¹dkiem symbolizowanym przez Innosa i chaosem, którego reprezentantem jest Beliar.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//Gdyby któraœ ze stron zatryumfowa³a, oznacza³oby to albo utratê wolnoœci, albo rz¹dy œmiercionoœnego chaosu.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//Staramy siê utrzymaæ równowagê w tym œwiecie - tylko w ten sposób mo¿e w nim istnieæ ¿ycie.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == 0)
	{
		Info_AddChoice(dia_addon_vatras_tellme,"Hmm... A mo¿e konkretniej?",dia_addon_vatras_tellme_konkret);
	};
};

func void dia_addon_vatras_tellme_konkret()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//Hmm... A mo¿e konkretniej?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//Od upadku Bariery pojawi³o siê sporo nowych zagro¿eñ.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//Najoczywistszym z nich s¹ bandyci.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//Nie doœæ, ¿e spokojne podró¿owanie przez wyspê sta³o siê niemal niemo¿liwe...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//...to jeszcze wspomaga ich ktoœ w tym mieœcie!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//Ustaliliœmy, ¿e bandyci regularnie zaopatruj¹ siê w broñ u jednego z kupców z Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//Próbujemy dotrzeæ do takich osób, aby uniemo¿liwiæ im dzia³anie na szkodê miasta.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//Daj znaæ, gdy zechcesz zaj¹æ siê t¹ spraw¹.
	MIS_VATRAS_FINDTHEBANDITTRADER = LOG_RUNNING;
	VATRAS_TOMARTIN = TRUE;
	Log_CreateTopic(TOPIC_ADDON_BANDITTRADER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITTRADER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITTRADER,"W Khorinis jest handlarz broni¹, który zaopatruje bandytów. Vatras chce, ¿ebym sprawdzi³ tê informacjê.");
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin, kwatermistrz paladynów, zajmuje siê sprawami handlarza broni¹. Znajdê go w magazynach paladynów, w porcie.");
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Wodny Kr¹g martwi siê bandytami w Khorinis.");
};

func void dia_addon_vatras_tellme_otherkdw()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//Gdzie s¹ Magowie Wody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//Badaj¹ ruiny prastarej kultury gdzieœ na pó³nocny wschód od Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//Zak³adamy, ¿e znajduj¹ siê tam wrota do nieznanej dotychczas czêœci wyspy.
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KDW,"Pozostali Magowie Wody zbadaj¹ ruiny staro¿ytnej kultury na pó³nocny wschód od Khorinis. Byæ mo¿e znajduje siê tam przejœcie do dotychczas niezbadanej czêœci wyspy.");
	Info_AddChoice(dia_addon_vatras_tellme,"Opowiedz mi wiêcej o tym niezbadanym terenie.",dia_addon_vatras_tellme_unexplored);
};

func void dia_addon_vatras_tellme_unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//Opowiedz mi wiêcej o tym niezbadanym terenie.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//Mogê wys³aæ ciê do Saturasa z listem polecaj¹cym, jeœli interesuje ciê do³¹czenie do ekspedycji.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//Rzecz jasna tylko wtedy, gdy bêdziesz jednym z nas.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//Rzecz jasna.
	b_logentry(TOPIC_ADDON_KDW,"Zanim do³¹czê do ekspedycji Magów Wody, Vatras chce, abym zosta³ cz³onkiem Wodnego Krêgu.");
};

func void dia_addon_vatras_tellme_wernoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//Kim s¹ cz³onkowie Wodnego Krêgu?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//Tego dowiesz siê, gdy ju¿ sam w nim bêdziesz.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//Z pewnoœci¹ spotkasz niektórych z nas...
};


instance DIA_ADDON_VATRAS_WANNABERANGER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_wannaberanger_condition;
	information = dia_addon_vatras_wannaberanger_info;
	description = "Chcê siê przy³¹czyæ do Wodnego Krêgu!";
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
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//Chcê siê przy³¹czyæ do Wodnego Krêgu!
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//Doskonale. Pierwsze wymaganie ju¿ spe³niasz.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//O co ci chodzi?
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//Przynajmniej jeden z nas ci ufa - inaczej byœ siê o nas nie dowiedzia³.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//Ale ja nic o tobie nie wiem...
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//A co chcia³byœ wiedzieæ?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Powiedz mi, sk¹d pochodzisz... i co sprowadza ciê do tego miasta.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Mam wa¿n¹ wiadomoœæ dla przywódcy paladynów.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Co to za wiadomoœæ?
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Przyby³y smoki...",dia_vatras_influence_first_truth);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Wkrótce wydarz¹ siê straszliwe rzeczy.",dia_vatras_influence_first_lie);
};

func void dia_vatras_influence_first_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Niedaleko st¹d zbiera siê potê¿na armia. Jej przywódcami s¹ smoki, a celem podbój ca³ego kraju.
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Hmmm. Jeœli mówisz prawdê, to równowaga na tych ziemiach zosta³a zak³ócona. Kto ci o tym powiedzia³?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//Smoki? Mówisz o istotach, o których zwykle wspominaj¹ tylko legendy. Kto ci o tym powiedzia³?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Ach, s³ysza³em jakieœ plotki...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Powiedzia³ mi o tym mag Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = TRUE;
};

func void dia_vatras_influence_first_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Wkrótce wydarz¹ siê straszliwe rzeczy.
	if(VATRAS_FIRST == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//Aha! A kto ci o tym powiedzia³?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Straszliwe rzeczy, tak? A sk¹d to przypuszczenie?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Ach, s³ysza³em jakieœ plotki...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Powiedzia³ mi o tym mag Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = 2;
};

func void dia_vatras_influence_second_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Powiedzia³ mi o tym mag Xardas. To on wys³a³ mnie, bym ostrzeg³ paladynów.
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Wiem, ¿e jest on m¹drym i potê¿nym mistrzem magii. Powiedz mi jeszcze, sk¹d przybywasz?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Ten nekromanta... A wiêc ¿yje... i on ciê tu przys³a³? Kim jesteœ naprawdê?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Podró¿nikiem z dalekiego po³udnia...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Dawnym skazañcem...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = TRUE;
};

func void dia_vatras_influence_second_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//Ach, s³ysza³em jakieœ plotki...
	if(VATRAS_SECOND == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//A pamiêtasz chocia¿, GDZIE je s³ysza³eœ?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Tak... I dlatego wyruszy³eœ w tê podró¿? Kim jesteœ naprawdê?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Podró¿nikiem z dalekiego po³udnia...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Dawnym skazañcem...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = 2;
};

func void b_vatras_influence_repeat()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Dobrze, podsumujmy:
	if(VATRAS_THIRD == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Jesteœ zbieg³ym wiêŸniem...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Jesteœ podró¿nikiem z dalekiego po³udnia...
	};
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//...któremu nekromanta Xardas powiedzia³...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//...który us³ysza³ plotki...
	};
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//...¿e armia smoków zamierza podbiæ ca³y kraj.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//...¿e wydarz¹ siê wkrótce straszliwe rzeczy.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//I zamierzasz ostrzec o tym paladynów.
	if((VATRAS_FIRST == TRUE) && (VATRAS_SECOND == TRUE) && (VATRAS_THIRD == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//Brzmi to doœæ niewiarygodnie, ale nie wyczuwam, byœ próbowa³ mnie ok³amaæ.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Dlatego muszê przyj¹æ, ¿e kieruj¹ tob¹ szlachetne pobudki.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//Dostaniesz szansê na do³¹czenie do Wodnego Krêgu.
		Info_ClearChoices(dia_addon_vatras_wannaberanger);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Myœlê, ¿e coœ przede mn¹ ukrywasz.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Jeœli obawiasz siê, ¿e przeka¿ê komuœ to, co mi powiesz, mo¿esz byæ spokojny.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Przysi¹g³em zachowywaæ wszystkie powierzane mi tajemnice dla siebie.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//A co z tymi wszystkimi ludŸmi?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Oni nie rozumiej¹ nawet po³owy z tego, czego ich nauczam. Nie musisz siê obawiaæ.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Zacznijmy jeszcze raz, od pocz¹tku. Co to za wiadomoœæ?
		Info_ClearChoices(dia_addon_vatras_wannaberanger);
		Info_AddChoice(dia_addon_vatras_wannaberanger,"Przyby³y smoki...",dia_vatras_influence_first_truth);
		Info_AddChoice(dia_addon_vatras_wannaberanger,"Wkrótce wydarz¹ siê straszliwe rzeczy.",dia_vatras_influence_first_lie);
	};
};

func void dia_vatras_influence_third_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Dawnym skazañcem z kolonii wiêziennej Khorinis.
	VATRAS_THIRD = TRUE;
	b_vatras_influence_repeat();
};

func void dia_vatras_influence_third_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Podró¿nikiem z dalekiego po³udnia...
	VATRAS_THIRD = FALSE;
	b_vatras_influence_repeat();
};


instance DIA_ADDON_VATRAS_HOWTOJOIN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_howtojoin_condition;
	information = dia_addon_vatras_howtojoin_info;
	description = "Co muszê zrobiæ, aby do was do³¹czyæ?";
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
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//Co muszê zrobiæ, aby do was do³¹czyæ?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//Przede wszystkim musisz mieæ œwiadomoœæ, ¿e bierzesz na swe barki wielk¹ odpowiedzialnoœæ.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//Nie przyjmujê zg³oszeñ ka¿dego.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//Chcesz byæ jednym z nas? Udowodnij, ¿e twoje postêpowanie przystaje do naszego.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//A konkretniej?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//Ka¿dy kandydat musi wykonaæ wa¿kie zadanie, zanim otrzyma zgodê na przy³¹czenie siê do nas.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//Dopiero po tym mogê rozwa¿yæ twoj¹ proœbê o zgodê na do³¹czenie do naszej walki o utrzymanie równowagi na tej wyspie.
	Info_ClearChoices(dia_addon_vatras_howtojoin);
	Info_AddChoice(dia_addon_vatras_howtojoin,"To jak mogê ciê przekonaæ?",dia_addon_vatras_howtojoin_whatsgreat);
	Info_AddChoice(dia_addon_vatras_howtojoin,"Uwolni³em wielu ludzi. Bariera zosta³a zniszczona...",dia_addon_vatras_howtojoin_freedmen);
	Info_AddChoice(dia_addon_vatras_howtojoin,"Pokona³em Œni¹cego. To chyba dosyæ znacz¹ce osi¹gniêcie?",dia_addon_vatras_howtojoin_sleeper);
};

func void dia_addon_vatras_howtojoin_sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//Pokona³em Œni¹cego. To chyba dosyæ znacz¹ce osi¹gniêcie?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//Du¿o opowieœci siê ostatnio s³yszy...
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//Nawet historie o wypêdzeniu z tego œwiata potwora znanego jako Œni¹cy.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//Nie s³ysza³em jednak, aby by³a to wy³¹cznie twoja zas³uga - choæ widzê, ¿e wierzysz w swe s³owa.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//Trochê mnie to denerwuje, ale nie mogê mieæ pewnoœci, ¿e zmys³y mnie nie zwodz¹.
};

func void dia_addon_vatras_howtojoin_freedmen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//Uwolni³em wielu ludzi. Bariera zosta³a zniszczona...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//No, jeœli to naprawdê twoja zas³uga...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//Ludzie, których uwolni³eœ... To nie byli tylko Magowie Wody i niewinni osadnicy.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//Po ca³ej krainie rozpanoszyli siê równie¿ ró¿noracy bandyci, którzy zagra¿aj¹ teraz obywatelom tego miasta.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//Zajêli ju¿ czêœæ terenów okalaj¹cych miasto - niemal nie da siê bezpiecznie opuœciæ Khorinis.
};

func void dia_addon_vatras_howtojoin_whatsgreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//To jak mogê ciê przekonaæ?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//Ostatnio w Khorinis dzieje siê coœ dziwnego.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//Niemal codziennie znikaj¹ kolejni mieszkañcy.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//Gdyby uda³o ci siê ustaliæ, co siê z nimi sta³o, miejsce w Wodnym Krêgu masz zapewnione.
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,LOGTEXT_ADDON_KDWRIGHT);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras nie pozwoli mi wst¹piæ do Wodnego Krêgu, jeœli nie rozwi¹¿ê zagadki zaginionych ludzi.");
	if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
	};
	MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE = LOG_RUNNING;
	SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//Tylko ¿e...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//Tak?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//...najpierw musisz skontaktowaæ siê z paladynami i przekazaæ im tê wiadomoœæ.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//S¹dzê, ¿e to bardzo wa¿ne.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Pomów z Lordem Hagenem.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Mam dostarczyæ Lordowi Hagenowi wa¿n¹ wiadomoœæ od Vatrasa.");
	Info_ClearChoices(dia_addon_vatras_howtojoin);
};


instance DIA_ADDON_VATRAS_GUILDBYPASS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_guildbypass_condition;
	information = dia_addon_vatras_guildbypass_info;
	description = "Ale przecie¿ mnie do niego nie dopuszcz¹!";
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
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//Ale przecie¿ mnie do niego nie dopuszcz¹!
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//Ale¿ dopuszcz¹, dopuszcz¹. Jeœli bêdziesz cz³onkiem wp³ywowej organizacji...
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//Kr¹g ma swoje kontakty, czasem doœæ przydatne.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//Postaramy siê zadbaæ, abyœ móg³ dostarczyæ wiadomoœæ Hagenowi jak najszybciej.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//Pomów o tym z moim zaufanym towarzyszem, Laresem. Mo¿e on zdo³a ci pomóc.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Aby zostaæ wpuszczonym na dwór Lorda Hagena, muszê wst¹piæ do jednej z potê¿nych gildii w Khorinis.");
	Info_ClearChoices(dia_addon_vatras_guildbypass);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Tak zrobiê.",dia_addon_vatras_guildbypass_back);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Do której gildii mam siê przy³¹czyæ?",dia_addon_vatras_guildbypass_whichguild);
};

func void dia_addon_vatras_guildbypass_back()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//Tak zrobiê.
	VATRAS_GEHZULARES = TRUE;
	Info_ClearChoices(dia_addon_vatras_guildbypass);
};

func void dia_addon_vatras_guildbypass_whichguild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//Do której gildii mam siê przy³¹czyæ?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//Jedynie trzy s¹ doœæ potê¿ne i wp³ywowe, aby siê liczyæ.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//To stra¿, Magowie Ognia i najemnicy z farmy Onara.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//Wybór nale¿y do ciebie.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//Lares mo¿e pomóc ci w podjêciu tej trudnej decyzji - lepiej z nim pomów.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Istniej¹ trzy potê¿ne gildie, do których mo¿na wst¹piæ: Magowie Ognia, stra¿ miejska oraz najemnicy przebywaj¹cy w pobli¿u posiad³oœci w³aœciciela ziemskiego.");
	Info_ClearChoices(dia_addon_vatras_guildbypass);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Tak zrobiê.",dia_addon_vatras_guildbypass_back);
};


instance DIA_ADDON_VATRAS_NOWRANGER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_nowranger_condition;
	information = dia_addon_vatras_nowranger_info;
	permanent = TRUE;
	description = "Jestem gotów wst¹piæ w szeregi Wodnego Krêgu!";
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
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//Jestem gotów wst¹piæ w szeregi Wodnego Krêgu!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Dostarczy³eœ sw¹ wiadomoœæ Lordowi Hagenowi?
	if(KAPITEL >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Owszem.
		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Nakaza³ mi jednak udaæ siê do Górniczej Doliny i dostarczyæ mu dowód na potwierdzenie moich s³ów!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//Sam musisz zdecydowaæ, co dalej.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Dla mnie liczy³o siê dostarczenie wiadomoœci. To, czy paladyni podejm¹ jakieœ dzia³ania, czy bêd¹ czekaæ na dodatkowe dowody, zale¿y ju¿ od Hagena.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Co do ciebie...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Dobrze.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//Dowiod³eœ swej wartoœci - zostaniesz jednym z nas. Bêdziesz podró¿owa³ po tej krainie i wype³nia³ wolê Adanosa.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//Niniejszym dajê ci Pierœcieñ Wody - oby pomóg³ ci znaleŸæ sojuszników i utrzymaæ wraz z nimi równowagê tego œwiata.
		CreateInvItems(self,itri_ranger_addon,1);
		b_giveinvitems(self,other,itri_ranger_addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//Szczególnie cieszy mnie fakt, ¿e jesteœ pierwszym Magiem Ognia wœród nas.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//Niech ciê Adanos chroni. IdŸ teraz poznaæ swych wspó³braci.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//Czekaj¹ na ciebie w gospodzie 'Martwa Harpia', gdzie powitaj¹ ciê wœród nas.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//Chyba znasz to miejsce? Znajduje siê na drodze do farmy Onara.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//Nie zapomnij za³o¿yæ pierœcienia, tak aby twoi bracia mogli ciê po nim rozpoznaæ.
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Nale¿ê teraz do Wodnego Krêgu i powinienem spotkaæ siê z mymi braæmi w gospodzie 'Martwa Harpia'.");
		SC_ISRANGER = TRUE;
		LARES_CANBRINGSCTOPLACES = TRUE;
		MIS_ADDON_LARES_COMETORANGERMEETING = LOG_RUNNING;
		b_giveplayerxp(XP_ADDON_SC_ISRANGER);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Nie, jeszcze nie.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//Wiêc siê pospiesz! To wiadomoœæ ogromnej wagi!
	};
};


instance DIA_ADDON_VATRAS_CLOSEMEETING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_closemeeting_condition;
	information = dia_addon_vatras_closemeeting_info;
	description = "Przysy³aj¹ mnie cz³onkowie Krêgu.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//Przysy³aj¹ mnie cz³onkowie Krêgu.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Doskonale - i tak ju¿ na ciebie czeka³em.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Zaraz wyœlê ciê na drug¹ stronê portalu wraz z innymi Magami Wody.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Masz tropiæ Magnata imieniem Kruk i ustaliæ, czemu porywa mieszkañców Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//My spróbujemy rozwi¹zaæ problem okolicznych bandytów.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Daj tê notkê Saturasowi - od tej pory to on jest twoim zwierzchnikiem.
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//Lares doprowadzi ciê do niego, o ile sam nie dostarczy³ jeszcze ornamentu.
	};
	CreateInvItems(self,itwr_vatras2saturas_findraven,1);
	b_giveinvitems(self,other,itwr_vatras2saturas_findraven,1);
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Niech ciê Adanos prowadzi.
	b_logentry(TOPIC_ADDON_KDW,"Vatras wys³a³ mnie z listem do Saturasa. Powinienem teraz przejœæ przez portal z pozosta³ymi Magami Wody i wyœledziæ Kruka, dawnego magnata.");
	Log_CreateTopic(TOPIC_ADDON_SKLAVEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKLAVEN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SKLAVEN,"Powinienem dowiedzieæ siê, dlaczego Kruk kaza³ porwaæ mieszkañców Khorinis.");
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
	description = "Co do tych znikaj¹cych ludzi...";
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
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//Co do tych znikaj¹cych ludzi...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Tak?
	Info_ClearChoices(dia_addon_vatras_missingpeople);
	Info_AddChoice(dia_addon_vatras_missingpeople,DIALOG_BACK,dia_addon_vatras_missingpeople_back);
	if(SCKNOWSMISSINGPEOPLEAREINADDONWORLD == TRUE)
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Wiem, gdzie przebywaj¹ zaginieni.",dia_addon_vatras_missingpeople_success);
	}
	else
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Powiem ci, co uda³o mi siê do tej pory ustaliæ.",dia_addon_vatras_missingpeople_report);
	};
	if(DIA_ADDON_VATRAS_MISSINGPEOPLE_WO_NOPERM == FALSE)
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Gdzie szukaæ ich œladu?",dia_addon_vatras_missingpeople_wo);
	};
};

func void dia_addon_vatras_missingpeople_back()
{
	Info_ClearChoices(dia_addon_vatras_missingpeople);
};

func void dia_addon_vatras_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//Gdzie szukaæ ich œladu?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//Wiêkszoœæ z nich zaginê³a w porcie - to chyba dobre miejsce do rozpoczêcia poszukiwañ.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"W porcie w Khorinis zaginê³o najwiêcej osób. Tam powinienem zacz¹æ swoje poszukiwania.");
	dia_addon_vatras_missingpeople_wo_noperm = TRUE;
};

func void dia_addon_vatras_missingpeople_report()
{
	var int vatras_missingpeoplereports;
	var int xp_vatras_missingpeoplereports;
	vatras_missingpeoplereports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//Powiem ci, co uda³o mi siê do tej pory ustaliæ.
	if(((MIS_AKIL_BRINGMISSPEOPLEBACK != 0) || (MIS_BENGAR_BRINGMISSPEOPLEBACK != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//Zaginê³o równie¿ paru farmerów.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((ELVRICH_GOESBACK2THORBEN == TRUE) || (ELVRICH_SCKNOWSPIRATS == TRUE) || (SC_KNOWSDEXTERASKIDNAPPER == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//Podobno odpowiedzialni za to s¹ bandyci.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//Elvrich - czeladnik Thorbena - powiedzia³ mi, ¿e to w³aœnie oni transportuj¹ porwanych drog¹ morsk¹.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//Wydaje siê, ¿e zamieszani s¹ w to jacyœ piraci, choæ nie wiem jeszcze na pewno, jak¹ odgrywaj¹ w tym wszystkim rolê.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//Uwolni³em Elvricha z ³ap bandytów.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//Bandyci porwali dziewczynê imieniem Lucia.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,itwr_luciasloveletter_addon) || (MIS_LUCIASLETTER == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//Porwana dziewczyna, Lucia, zadawa³a siê póŸniej z bandytami.
		if(MIS_LUCIASLETTER == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//Jak siê wydaje, ju¿ z w³asnej woli.
		};
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KNOWSDEXTERASKIDNAPPER == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//Szajce przewodzi niejaki Dexter i to on odpowiada za porwania.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//Pamiêtam Dextera z kolonii karnej... Pracowa³ wtedy dla innego magnata, Gomeza.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//On ciebie te¿ z pewnoœci¹ zapamiêta³ - miej siê na bacznoœci.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(vatras_missingpeoplereports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//Chyba jesteœ na dobrym tropie - oby tak dalej.
		xp_vatras_missingpeoplereports = XP_ADDON_VATRAS_MISSINGPEOPLEREPORT * vatras_missingpeoplereports;
		b_giveplayerxp(xp_vatras_missingpeoplereports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//Czego siê dowiedzia³eœ?
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_14");	//Niestety - niczego wa¿nego.
	};
};

func void dia_addon_vatras_missingpeople_success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//Wiem, gdzie przebywaj¹ zaginieni.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//Czego uda³o ci siê dowiedzieæ?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//Porwano ich i zabrano w odleg³y kraniec wyspy Khorinis. Zrobi³ to niejaki Kruk.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//Co daje ci pewnoœæ, ¿e tak rzeczywiœcie by³o?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	//Czyta³em jego rozkazy. Okoliczni bandyci pracuj¹ dla niego.
	if(Npc_HasItems(other,itwr_ravenskidnappermission_addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Patrz.
		b_usefakescroll();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//Dobra robota - a ju¿ zaczyna³em siê baæ, ¿e nigdy nie zdo³amy odkryæ prawdy.
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
	description = "Zaginieni powrócili.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//Zaginieni powrócili.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//Tak, uda³o ci siê! Nie ma to jak szczêœliwe zakoñczenie.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//Jednak twoja podró¿ nie dobieg³a jeszcze koñca... Niech ciê Adanos b³ogos³awi.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//Adanosie, b³ogos³aw temu mê¿owi. Oœwieæ œcie¿kê, po której st¹pa, i daj mu si³ê, aby opar³ siê wszystkim zagro¿eniom.
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
	description = "Co do tego handlarza broni¹...";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//Co do tego handlarza broni¹...
	Info_ClearChoices(dia_addon_vatras_waffen);
	Info_AddChoice(dia_addon_vatras_waffen,DIALOG_BACK,dia_addon_vatras_waffen_back);
	if((FERNANDO_IMKNAST == TRUE) || (FERNANDO_HATSZUGEGEBEN == TRUE))
	{
		Info_AddChoice(dia_addon_vatras_waffen,"Wiem, kto dostarcza uzbrojenie bandytom!",dia_addon_vatras_waffen_success);
	}
	else
	{
		Info_AddChoice(dia_addon_vatras_waffen,"Co wiesz o handlarzu broni¹?",dia_addon_vatras_waffen_tomartin);
	};
};

func void dia_addon_vatras_waffen_back()
{
	Info_ClearChoices(dia_addon_vatras_waffen);
};

func void dia_addon_vatras_waffen_tomartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//Co wiesz o handlarzu broni¹?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//Pomów z Martinem, kwatermistrzem paladynów. Mo¿e on dysponuje informacjami w tej sprawie.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//Powierzono mu zadanie zdemaskowania handlarza broni¹.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//Znajdziesz go w porcie. Jak zobaczysz parê skrzyñ, ¿ywnoœæ i paladynów, to i on bêdzie siê tam gdzieœ krêci³.
	VATRAS_TOMARTIN = TRUE;
};

func void dia_addon_vatras_waffen_success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//Wiem, kto dostarcza uzbrojenie bandytom!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//Nazywa siê Fernando.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//Doskonale. Martin podj¹³ odpowiednie kroki, aby zakoñczyæ ten proceder?
	if(FERNANDO_IMKNAST == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//Tak. Zadba, aby drañ nie wyszed³ za szybko z lochu.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//Dobra robota, synu.
		if(Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger) && (SC_ISRANGER == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//To co, jestem ju¿ gotów na zostanie cz³onkiem Wodnego Krêgu?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//Nie tak siê umówiliœmy i dobrze o tym wiesz.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//Oby Adanos oœwietli³ œcie¿kê, po której kroczysz.
		MIS_VATRAS_FINDTHEBANDITTRADER = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_VATRAS_FINDTHEBANDITTRADER);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//Jeszcze nie.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//Pospiesz siê i mu o tym donieœ! Trzeba jak najszybciej z tym skoñczyæ!
	};
};


instance DIA_ADDON_VATRAS_WISP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_wisp_condition;
	information = dia_addon_vatras_wisp_info;
	description = "Móg³byœ mi jakoœ pomóc w poszukiwaniach?";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//Móg³byœ mi jakoœ pomóc w poszukiwaniach?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//Strasznie uparty z ciebie cz³owiek. Prawdê mówi¹c... Chyba w czymœ mogê ci pomóc.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//Dam ci ten amulet z rudy - z pewnoœci¹ ci siê przyda.
	CreateInvItems(self,itam_addon_wispdetector,1);
	b_giveinvitems(self,other,itam_addon_wispdetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//To amulet ognika.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//Istnieje ich tylko kilka - zaklêty w nim ognik ma specjalne zdolnoœci.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//Dziêki niemu mo¿na widzieæ rzeczy dla oka niewidoczne.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//Aby z niego skorzystaæ, trzeba go za³o¿yæ.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//Jeœli ognik s³abnie lub w ogóle zniknie, za³ó¿ amulet ponownie, aby go zregenerowaæ.
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Vatras da³ mi 'Amulet szukaj¹cego ognika', który przyda mi siê w poszukiwaniach handlarza broni¹.");
	Log_CreateTopic(TOPIC_WISPDETECTOR,LOG_NOTE);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_NF);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_08");	//Ognik umie równie¿ wykrywaæ broñ.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_09");	//Mo¿e ci siê to przydaæ w zadaniu zdemaskowania sprzedawcy mieczy.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//Dbaj o amulet, a na pewno ci siê przyda.
	Info_ClearChoices(dia_addon_vatras_wisp);
	Info_AddChoice(dia_addon_vatras_wisp,"Dziêkujê! Bêdê o tym pamiêtaæ.",dia_addon_vatras_wisp_thanks);
	Info_AddChoice(dia_addon_vatras_wisp,"To wszystko, co ten ognik umie?",dia_addon_vatras_wisp_morewisp);
	Info_AddChoice(dia_addon_vatras_wisp,"W tym amulecie jest ognik?",dia_addon_vatras_wisp_amulett);
	SC_GOTWISP = TRUE;
};

func void dia_addon_vatras_wisp_thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//Dziêkujê! Bêdê o tym pamiêtaæ.
	Info_ClearChoices(dia_addon_vatras_wisp);
};

func void dia_addon_vatras_wisp_morewisp()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//To wszystko, co ten ognik umie?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_01");	//Poza wykrywaniem uzbrojenia? Tylko jeœli go nauczysz.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//O ile mi wiadomo, to Riordan potrafi uczyæ te stworki nowych sztuczek. Przebywa teraz z Saturasem.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//Mo¿e on ci wiêcej o nim opowie.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		b_logentry(TOPIC_ADDON_BANDITTRADER,"Ogniki potrafi¹ znajdowaæ nie tylko broñ bia³¹. Mag Wody, Riordian, mo¿e nauczyæ moje ogniki szukania innych przedmiotów.");
	};
};

func void dia_addon_vatras_wisp_amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//W tym amulecie jest ognik?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//Ogniki to urocze stworzonka sk³adaj¹ce siê z czystej energii magicznej.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//S¹ zwi¹zane z magiczn¹ rud¹ tego œwiata - ona stanowi Ÿród³o ich istnienia i ich mocy.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//Nie dziwi mnie, ¿e wczeœniej o nich nie s³ysza³eœ - ujawniaj¹ siê tylko tym, którzy przynosz¹ odpowiadaj¹c¹ im rudê.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//Dzikie ogniki zosta³y brutalnie wyrwane ze swego œrodowiska i atakuj¹ ka¿de stworzenie, które siê do nich zbli¿y.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//Tym ¿a³osnym istotom nie mo¿na ju¿ pomóc - lepiej ich unikaæ.
};


instance DIA_ADDON_VATRAS_STONEPLATE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_stoneplate_condition;
	information = dia_addon_vatras_stoneplate_info;
	description = "Znalaz³em tê kamienn¹ tabliczkê...";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//Znalaz³em tê kamienn¹ tabliczkê. Mo¿esz mi coœ o niej powiedzieæ?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//To artefakt prastarej kultury, któr¹ badamy ju¿ od d³u¿szego czasu.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//Jest ich kilka rodzajów - czêœæ zawiera informacje o historii tego dawnego ludu.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//I te mnie w³aœnie interesuj¹. Przynieœ mi wszystkie, które uda ci siê znaleŸæ.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//Czeka ciê za to nagroda.
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
	description = "Mam dla ciebie kolejn¹ kamienn¹ tabliczkê...";
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
		AI_Output(other,self,"DIA_Addon_Vatras_SellStonplate_15_00");	//Mam dla ciebie kolejn¹ kamienn¹ tabliczkê...
	}
	else
	{
	};
	b_giveinvitems(other,self,itwr_stoneplatecommon_addon,anzahl);
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//Œwietnie!
	if(anzahl >= 10)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_02");	//Zwiêkszê tw¹ moc magiczn¹.
		b_raiseattribute(other,ATR_MANA_MAX,anzahl);
		Npc_ChangeAttribute(other,ATR_MANA,anzahl);
	}
	else if(anzahl >= 5)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_04");	//Przyjmij w nagrodê te kilka zwojów...
		b_giveinvitems(self,other,itsc_instantfireball,anzahl);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_03");	//Przyjmij w nagrodê te kilka eliksirów...
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
	description = "Lares wspomnia³, ¿e mo¿esz pomóc mi dostaæ siê do klasztoru Magów Ognia.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//Lares wspomnia³, ¿e mo¿esz pomóc mi dostaæ siê do klasztoru Magów Ognia.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//Taki jest twój wybór? Œcie¿ka ognia?
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//Owszem, mam zamiar zostaæ Magiem Ognia.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//O ile pamiêtam, to oni chêtnie przyjmuj¹ nowicjuszy... Po co ci moja pomoc?
	if(SC_KNOWSKLOSTERTRIBUT == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//Potrzebna jest danina - owca i z³oto.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//Lares wspomina³, ¿e w celu przyst¹pienia do klasztoru trzeba wnieœæ jak¹œ daninê.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//Bezpoœrednio pomóc ci nie mogê - jak zapewne wiesz, jestem Magiem Wody. Znam jednak doœæ dobrze Maga Ognia imieniem Daron.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//Z regu³y zbiera datki w pobli¿u targowiska.
	VATRAS_SENTTODARON = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//S³ysza³em ponadto, ¿e to nie jedyne jego zadanie w tamtej okolicy...
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//Powiedzia³ mi kiedyœ o pos¹¿ku, który mu ukradziono.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//Sprawa jest dla niego bardzo wa¿na i z pewnoœci¹ wesprze ciê, jeœli odzyskasz dla niego ten pos¹¿ek.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//Rzecz jasna fakt zostania Magiem Ognia nie oznacza, ¿e nie mo¿esz do³¹czyæ do Krêgu.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//Warunek jest jednak jasny - musisz dowieœæ swej wartoœci.
	MIS_ADDON_VATRAS_GO2DARON = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Mag Ognia z targowiska, Daron, pomo¿e mi wst¹piæ do klasztoru, jeœli odzyskam dla niego ma³y pos¹¿ek, który mu skradziono.");
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
	description = "Przybywam, by prosiæ ciê o b³ogos³awieñstwo.";
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
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Przybywam, by prosiæ ciê o b³ogos³awieñstwo.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//Dlaczegó¿ mia³bym ciê pob³ogos³awiæ, nieznajomy?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Chcê zostaæ czeladnikiem u jednego z mistrzów w dolnej czêœci miasta.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//IdŸ wiêc z b³ogos³awieñstwem Adanosa, mój synu!
	Snd_Play("LevelUp");
	b_giveplayerxp(XP_VATRASTRUTH);
	VATRAS_SEGEN = TRUE;
	b_logentry(TOPIC_THORBEN,"Vatras, Mag Wody, udzieli³ mi b³ogos³awieñstwa.");
};


instance DIA_VATRAS_WOKDF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 93;
	condition = dia_vatras_wokdf_condition;
	information = dia_vatras_wokdf_info;
	permanent = FALSE;
	description = "Gdzie mogê znaleŸæ jakiegoœ kap³ana Innosa?";
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
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Gdzie mogê znaleŸæ jakiegoœ kap³ana Innosa?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Najlepiej rozejrzyj siê po targowisku. Znajdziesz tam wys³annika klasztoru.
};


instance DIA_VATRAS_SPENDE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 94;
	condition = dia_vatras_spende_condition;
	information = dia_vatras_spende_info;
	permanent = TRUE;
	description = "Chcia³bym przekazaæ datek na œwi¹tyniê Adanosa!";
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
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Chcia³bym przekazaæ datek na œwi¹tyniê Adanosa!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Datek na œwi¹tyniê Adanosa mo¿e zmazaæ czêœæ przewin, które pope³ni³eœ w przesz³oœci, mój synu.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Jak¹ sumê zechcesz przekazaæ?
	Info_ClearChoices(dia_vatras_spende);
	Info_AddChoice(dia_vatras_spende,"Chwilowo nie mam pieniêdzy...",dia_vatras_spende_back);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_vatras_spende,"Mam 50 sztuk z³ota...",dia_vatras_spende_50);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_vatras_spende,"Mam 100 sztuk z³ota...",dia_vatras_spende_100);
	};
};

func void dia_vatras_spende_back()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Chwilowo nie mam pieniêdzy...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//Nic siê nie sta³o. Adanos zawsze ucieszy siê z twojej ofiary.
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//Mam 50 sztuk z³ota...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Dziêkujê ci w imieniu Adanosa, mój synu. Twoje z³oto zostanie przekazane potrzebuj¹cym.
	b_giveinvitems(other,self,itmi_gold,50);
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//Mam 100 sztuk z³ota...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//B¹dŸ b³ogos³awiony, mój synu! Dziêki ci za tw¹ hojnoœæ.
	Snd_Play("LevelUp");
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Niech Adanos strze¿e ciê zawsze od z³ej przygody.
	b_giveinvitems(other,self,itmi_gold,100);
	VATRAS_SEGEN = TRUE;
	Info_ClearChoices(dia_vatras_spende);
	if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
	{
		b_logentry(TOPIC_THORBEN,"Vatras, Mag Wody, udzieli³ mi b³ogos³awieñstwa.");
	};
};


instance DIA_VATRAS_CANTEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 95;
	condition = dia_vatras_canteach_condition;
	information = dia_vatras_canteach_info;
	permanent = FALSE;
	description = "Mo¿esz nauczyæ mnie czegoœ o magii?";
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
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Mo¿esz nauczyæ mnie czegoœ o magii?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Tylko Wybrañcy Innosa i Wybrañcy Adanosa mog¹ pos³ugiwaæ siê magi¹ run.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Ale magia dostêpna jest tak¿e zwyk³ym œmiertelnikom, pod postaci¹ magicznych zwojów.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Mogê ciê nauczyæ, jak lepiej wykorzystywaæ dostêpn¹ ci magiczn¹ moc.
	VATRAS_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Vatras, Mag Wody, mo¿e pomóc mi w zwiêkszeniu magicznych zdolnoœci.");
};


instance DIA_VATRAS_TEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 100;
	condition = dia_vatras_teach_condition;
	information = dia_vatras_teach_info;
	permanent = TRUE;
	description = "Chcê zwiêkszyæ moj¹ magiczn¹ moc.";
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
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Chcê zwiêkszyæ moj¹ magiczn¹ moc.
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Jesteœ ju¿ zbyt potê¿ny, bym móg³ ciê czegoœ nauczyæ.
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
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//A co dok³adnie chcia³byœ o nich wiedzieæ?
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
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Dobrze. Innos jest pierwszym i najpotê¿niejszym z bogów. To on da³ œwiatu S³oñce.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//W jego w³adaniu znajduj¹ siê œwiat³o i ogieñ, które podarowa³ ludzkoœci. Innos jest te¿ sprawiedliwoœci¹ i prawem.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Jego kap³anami s¹ Magowie Ognia, a wojownikami - mê¿ni paladyni.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_adanos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Opowiedz mi o Adanosie.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos jest bogiem harmonii. To boski stra¿nik równowagi pomiêdzy Innosem a Beliarem.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Jest te¿ wielkim sprawc¹ zmian i panem wód wszystkich mórz, rzek i jezior.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Jego oddanymi s³ugami s¹ moi bracia, Magowie Wody.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_beliar()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Opowiedz mi o Beliarze.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar jest mrocznym bogiem œmierci, zniszczenia i wszystkich rzeczy nienaturalnych.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Toczy on wieczn¹ wojnê z Innosem, ale Adanos dba, by ich si³y zawsze by³y wyrównane.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Niewielu ludzi pozostaje w s³u¿bie Beliara, ale s¹ oni niezwykle potê¿ni.
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
	description = "Mo¿esz mnie uzdrowiæ?";
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
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Mo¿esz mnie uzdrowiæ?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//Adanosie, pob³ogos³aw to cia³o, uwolnij je od ran i tchnij w nie nowe ¿ycie!
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
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//Mam wiadomoœæ dla Mistrza Isgarotha. Strze¿e on kaplicy przed klasztorem.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Jeœli podejmiesz siê wykonaæ to zadanie, bêdziesz móg³ sam sobie wybraæ nagrodê.
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Nie teraz!",dia_vatras_mission_no);
	Info_AddChoice(dia_vatras_mission,"Jasne.",dia_vatras_mission_yes);
};

func void b_sayvatrasgo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Dobrze. Ruszaj teraz w drogê do Mistrza Isgarotha.
};

func void dia_vatras_mission_yes()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Mo¿esz na mnie liczyæ.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Œwietnie. Zabierz zatem tê wiadomoœæ i wybierz jeden ze zwojów z zaklêciami.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//Gdy dostarczysz wiadomoœæ, otrzymasz odpowiedni¹ nagrodê.
	b_giveinvitems(self,hero,itwr_vatrasmessage,1);
	MIS_VATRAS_MESSAGE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOTSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOTSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_BOTSCHAFT,"Vatras da³ mi wiadomoœæ dla Mistrza Isgarotha, którego znajdê w kaplicy przed klasztorem.");
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Wezmê zaklêcie œwiat³a.",dia_vatras_mission_light);
	Info_AddChoice(dia_vatras_mission,"Wybieram zaklêcie uzdrawiaj¹ce.",dia_vatras_mission_heal);
	Info_AddChoice(dia_vatras_mission,"Daj mi Lodow¹ Strza³ê.",dia_vatras_mission_ice);
};

func void dia_vatras_mission_no()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Nie teraz!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//Nie ma sprawy - poœlê kogoœ innego.
	MIS_VATRAS_MESSAGE = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_heal()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Wybieram zaklêcie uzdrawiaj¹ce.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_lightheal,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_ice()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Daj mi Lodow¹ Strza³ê.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_icebolt,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_light()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Wezmê zaklêcie œwiat³a.
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
	description = "Dostarczy³em twoj¹ wiadomoœæ.";
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
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Dostarczy³em twoj¹ wiadomoœæ.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Przyjmij wiêc moje podziêkowanie. Mo¿esz teraz wybraæ swoj¹ nagrodê.
	MIS_VATRAS_MESSAGE = LOG_SUCCESS;
	b_giveplayerxp(XP_VATRAS_MESSAGE);
	Info_ClearChoices(dia_vatras_message_success);
	Info_AddChoice(dia_vatras_message_success,"1 szczaw królewski",dia_vatras_message_success_plant);
	Info_AddChoice(dia_vatras_message_success,"Pierœcieñ zrêcznoœci",dia_vatras_message_success_ring);
	Info_AddChoice(dia_vatras_message_success,"1 bry³ka rudy",dia_vatras_message_success_ore);
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
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//S³uchajcie, moi drodzy! Jestem potrzebny gdzie indziej.
		if(dauer == KURZ)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//To nie potrwa d³ugo. Po powrocie opowiem wam resztê tej historii.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Nie wiem, kiedy powrócê. Jeœli chcecie poznaæ zakoñczenie tej historii, przeczytajcie odpowiednie pisma.
			VATRAS_EINMALLANGWEG = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Niech Adanos bêdzie z wami!
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
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//Mam pewien problem z Okiem Innosa - byæ mo¿e bêdzie mi potrzebna twoja pomoc.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//A bêdê musia³ w tym celu opuœciæ miasto?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//Nie wiem. Byæ mo¿e.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//Od kilku dni czekam na zmiennika. Inni Magowie Wody powinni byli wróciæ tu ju¿ jakiœ czas temu.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//Postaraj siê, aby przys³ali mi zmiennika, a ja pomogê ci w rozwi¹zaniu twojego problemu.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	Log_CreateTopic(TOPIC_ADDON_VATRASABLOESUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_VATRASABLOESUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_VATRASABLOESUNG,"Vatras nie mo¿e mi pomóc z Okiem Innosa, dopóki inny Mag Wody nie zajmie jego miejsca w mieœcie.");
};


instance DIA_ADDON_VATRAS_ADDONSOLVED(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_addonsolved_condition;
	information = dia_addon_vatras_addonsolved_info;
	description = "Przyby³ zmiennik.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//Przyby³ zmiennik.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_01");	//Czy sprawy spoza gór na pó³nocnym wschodzie zosta³y rozwi¹zane?
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_02");	//Tak. Kruk nie ¿yje i nie stanowi ju¿ zagro¿enia.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//To doskona³e wieœci. Mam nadziejê, ¿e podobne rzeczy ju¿ siê nie powtórz¹.
	if(Npc_KnowsInfo(other,dia_addon_vatras_abloesepre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//Teraz mogê ci pomóc rozwi¹zaæ problem.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//O ile dobrze pamiêtam, wi¹za³ siê on z Okiem Innosa?
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
	description = "Oko Innosa zosta³o uszkodzone.";
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
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Przysy³a mnie Pyrokar.
	}
	else if(MIS_XARDAS_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Przysy³a mnie Xardas.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Oko Innosa zosta³o uszkodzone.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Wiem. Donieœli mi o tym napotkani nowicjusze.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Poszukiwacze wykorzystali w tym celu œwiêty S³oneczny Kr¹g Magów Ognia.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//To znak, ¿e nieprzyjaciel znacznie urós³ w si³ê.
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Wieœci szybko siê roznosz¹.",dia_vatras_innoseyekaputt_schnellenachrichten);
	if((hero.guild == GIL_KDF) && (MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING))
	{
		Info_AddChoice(dia_vatras_innoseyekaputt,"Dlaczego Pyrokar przys³a³ mnie w³aœnie do ciebie - Maga Wody?",dia_vatras_innoseyekaputt_warumdu);
	};
	Info_AddChoice(dia_vatras_innoseyekaputt,"Co siê teraz stanie z Okiem?",dia_vatras_innoseyekaputt_auge);
};

func void dia_vatras_innoseyekaputt_auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Co siê teraz stanie z Okiem?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Musimy spróbowaæ je naprawiæ. Nie bêdzie to jednak ³atwe zadanie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Oprawa pêk³a na dwie czêœci. Zrêczny kowal zdo³a zapewne po³¹czyæ je z powrotem.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Ale to mniejsza czêœæ problemu. Bardziej martwi mnie sam klejnot.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Jest matowy, pozbawiony blasku. Nieprzyjaciel dok³adnie wiedzia³, jak unieszkodliwiæ amulet.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Gdzie znajdê kowala, który zdo³a naprawiæ oprawê amuletu?",dia_vatras_innoseyekaputt_auge_schmied);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Czy mo¿emy przywróciæ klejnotowi dawn¹ moc?",dia_vatras_innoseyekaputt_auge_stein);
};

func void dia_vatras_innoseyekaputt_auge_stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Czy mo¿emy przywróciæ klejnotowi dawn¹ moc?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Jest tylko jeden na to sposób - po³¹czone moce wszystkich trzech bogów powinny tego dokonaæ.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//W miejscu zniszczenia amuletu nale¿y przeprowadziæ odpowiedni rytua³ odwracaj¹cy. Mo¿e wtedy klejnot odzyska swój ogieñ.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Problem w tym, ¿e musisz sprowadziæ do tego miejsca ziemskich przedstawicieli wszystkich trzech bogów.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Potrzebujemy te¿ znacznej iloœci bagiennego ziela. Myœlê, ¿e nie mniej ni¿ 3 roœliny.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Kim maj¹ byæ ci trzej przedstawiciele bogów?",dia_vatras_innoseyekaputt_auge_stein_wer);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Gdzie mogê znaleŸæ to bagienne ziele?",dia_vatras_innoseyekaputt_auge_stein_kraut);
};

func void dia_vatras_innoseyekaputt_auge_stein_kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Gdzie mogê znaleŸæ to bagienne ziele?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Podobno w tych lasach mieszka stara wiedŸma imieniem Sagitta. Mo¿e u niej znajdziesz takie ziele.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Ewentualnie rozejrzyj siê trochê na przystani.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Kim maj¹ byæ ci trzej przedstawiciele bogów?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Adanosa mogê reprezentowaæ osobiœcie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Przedstawicielem Innosa powinien byæ Pyrokar, najwy¿szy z Magów Ognia.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Ale nie wiem, kto móg³by reprezentowaæ Beliara. Potrzebujemy prawdziwego mistrza czarnej magii.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Czarnej magii? Mo¿e Xardas?",dia_vatras_innoseyekaputt_auge_stein_wer_xardas);
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Czarnej magii? Mo¿e Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//Tak! To siê powinno udaæ!
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Nie wiem tylko, czy uda ci siê sprowadziæ obydwu.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Ju¿ widzê wyraz twarzy Pyrokara, gdy dowie siê, ¿e musi wspó³pracowaæ z Xardasem.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Muszê ju¿ iœæ.",dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter);
};

func void dia_vatras_innoseyekaputt_auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Gdzie znajdê kowala, który zdo³a naprawiæ oprawê amuletu?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Musisz popytaæ ludzi o kowala, który zna siê na jubilerstwie.
};

func void dia_vatras_innoseyekaputt_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Dlaczego Pyrokar przys³a³ mnie w³aœnie do ciebie - Maga Wody?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Podejrzewa³em, ¿e prêdzej czy póŸniej dojdzie do czegoœ takiego.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar ma siê za tak potê¿nego i niezwyciê¿onego, ¿e czêsto zachowuje siê wrêcz nieodpowiedzialnie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//I zosta³ za to ukarany - straci³ Oko Innosa.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Myœlê jednak, ¿e podœwiadomie polega na mocy powierzonej mi przez Adanosa.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Lepiej nie myœleæ, co by siê sta³o, gdyby mnie teraz zabrak³o.
};

func void dia_vatras_innoseyekaputt_schnellenachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Wieœci szybko siê rozchodz¹.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//I bardzo dobrze. Nieprzyjaciel te¿ nie bêdzie czeka³ bezczynnie.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Muszê ju¿ iœæ.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Ja te¿ wyruszê w drogê, by przygotowaæ S³oneczny Kr¹g do ceremonii.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Przyœlij do mnie Xardasa i Pyrokara. I nie zapomnij o bagiennym zielu! Liczê na ciebie.
	b_logentry(TOPIC_INNOSEYE,"Vatras chce odprawiæ rytua³ w S³onecznym Krêgu, aby uzdrowiæ Oko. Muszê przekonaæ Xardasa i Pyrokara, aby wziêli udzia³ w tym przedsiêwziêciu. Powinienem tak¿e znaleŸæ kowala, który naprawi pêkniêt¹ oprawê amuletu.");
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
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Tylko rytua³ odwrócenia odprawiony w S³onecznym Krêgu przeze mnie, Xardasa i Pyrokara mo¿e przywróciæ Oku dawn¹ moc.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//Pamiêtaj, ¿eby przynieœæ Oko z naprawion¹ opraw¹.
};


instance DIA_VATRAS_BEGINN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 31;
	condition = dia_vatras_beginn_condition;
	information = dia_vatras_beginn_info;
	description = "Zrobi³em wszystko, o co prosi³eœ.";
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
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Zrobi³em wszystko, o co prosi³eœ. Oto naprawione Oko.
	b_giveplayerxp(XP_RITUALINNOSEYERUNS);
	b_giveinvitems(other,self,itmi_innoseye_broken_mis,1);
	Npc_RemoveInvItem(self,itmi_innoseye_broken_mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Œwietnie. Mo¿emy zatem przyst¹piæ do odprawienia rytua³u.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//A co z bagiennym zielem?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Ach, tak. Przynios³eœ dla mnie trzy roœliny?
	if(b_giveinvitems(other,self,itpl_swampherb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Tak. Oto one.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Znakomicie.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Nie. Niestety, nie.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Trudno. Poradzimy sobie jakoœ bez nich.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Dobrze siê spisa³eœ, ale teraz odsuñ siê na bok, byœmy mogli przyst¹piæ do ceremonii. Niech zjednocz¹ siê nasze si³y!
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
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Ju¿ po wszystkim. Uda³o siê nam pokrzy¿owaæ plan nieprzyjaciela. Oko odzyska³o sw¹ moc!
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Pyrokar wyjaœni ci, jak u¿ywaæ Oka.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Mam nadziejê, ¿e spotkamy siê jeszcze, gdy wype³nisz ju¿ swoj¹ misjê. Bywaj!
	b_logentry(TOPIC_INNOSEYE,"Oko zosta³o uzdrowione. Kiedy Pyrokar mi je wrêczy, udam siê na polowanie na smoki.");
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
	description = "Dziêki ci za pomoc w naprawieniu Oka Innosa.";
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
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Dziêki ci za pomoc w naprawieniu Oka Innosa.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Zachowaj podziêkowania na póŸniej. Czeka ciê teraz najwiêksze wyzwanie.
	if(MIS_READYFORCHAPTER4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Porozmawiaj z Pyrokarem. On ci wszystko wyt³umaczy.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Mam nadziejê, ¿e jeszcze siê kiedyœ spotkamy, mój synu.
};


instance DIA_VATRAS_HILDAKRANK(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 34;
	condition = dia_vatras_hildakrank_condition;
	information = dia_vatras_hildakrank_info;
	description = "¯ona Lobarta, Hilda, zachorowa³a.";
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
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//¯ona Lobarta, Hilda, zachorowa³a.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Co? Znowu? Ta biedna kobieta powinna bardziej na siebie uwa¿aæ.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Jeszcze jedna ciê¿ka zima, a odejdzie z tego œwiata. Dobrze. Dam jej lekarstwo, które zmniejszy gor¹czkê.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//Hmmm... Skoro ju¿ tu jesteœ, móg³byœ jej zanieœæ lekarstwo?
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
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Nie wygl¹dasz najlepiej. Chyba zbyt d³ugo wystawia³eœ siê na czarne spojrzenia Poszukiwaczy.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Mogê uzdrowiæ twoje cia³o, ale spokój duszy odzyskasz jedynie w klasztorze. Porozmawiaj z Pyrokarem. On ci pomo¿e.
};


instance DIA_VATRAS_ALLDRAGONSDEAD(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 59;
	condition = dia_vatras_alldragonsdead_condition;
	information = dia_vatras_alldragonsdead_info;
	description = "Nie musimy ju¿ obawiaæ siê smoków.";
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
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Nie musimy ju¿ obawiaæ siê smoków.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Wiedzia³em, ¿e wrócisz ca³y i zdrowy! Jednak najwiêksze wyzwanie dopiero przed tob¹.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Tak, wiem.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Zatem wyposa¿ siê odpowiednio i przyjdŸ do mnie, gdybyœ potrzebowa³ pomocy. Zawsze miej przy sobie Oko Innosa! Niech Adanos bêdzie z tob¹.
};


instance DIA_VATRAS_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_knowwhereenemy_condition;
	information = dia_vatras_knowwhereenemy_info;
	permanent = TRUE;
	description = "Wiem, gdzie czai siê nasz nieprzyjaciel.";
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
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Wiem, gdzie czai siê nasz nieprzyjaciel.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Zatem nie traæmy czasu i pierwsi siê z nim rozprawmy.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Chcesz mi towarzyszyæ?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//D³ugo siê nad tym zastanawia³em, ale teraz nie mam w¹tpliwoœci. Chcê wyruszyæ z tob¹.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Vatras, ku mojemu zaskoczeniu, chce mi towarzyszyæ w mojej wyprawie. Tak doœwiadczony towarzysz by³by dla mnie prawdziwym skarbem.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//Moja za³oga jest i tak bardzo liczna. Obawiam siê, ¿e mo¿e dla ciebie zabrakn¹æ miejsca.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Zatem zwolnij dla mnie miejsce. Bêdê ci potrzebny.
	}
	else
	{
		Info_ClearChoices(dia_vatras_knowwhereenemy);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Muszê to sobie jeszcze przemyœleæ.",dia_vatras_knowwhereenemy_no);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Jestem zaszczycony twoj¹ propozycj¹.",dia_vatras_knowwhereenemy_yes);
	};
};

func void dia_vatras_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Jestem zaszczycony twoj¹ propozycj¹. Spotkamy siê na przystani.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Spiesz siê. Nieprzyjaciel nie zasypia gruszek w popiele.
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
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Muszê to sobie jeszcze przemyœleæ.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Jak uwa¿asz. Wróæ do mnie, gdy ju¿ podejmiesz decyzjê.
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
	description = "Lepiej bêdzie, jeœli tu zostaniesz. To miasto ciê potrzebuje.";
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
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Lepiej bêdzie, jeœli tu zostaniesz. To miasto ciê potrzebuje.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Mo¿e masz racjê... Mimo to, jeœli zechcesz, wyruszê z tob¹! Pamiêtaj o tym.
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
	description = "Chcê ciê zabraæ na wyspê nieprzyjaciela.";
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
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Chcê ciê zabraæ na wyspê nieprzyjaciela.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//M¹dra decyzja. Mam nadziejê, ¿e ostateczna?
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

