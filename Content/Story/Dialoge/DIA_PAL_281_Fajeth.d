
func int c_snapperdeath()
{
	if(Npc_IsDead(newmine_snapper1) && Npc_IsDead(newmine_snapper2) && Npc_IsDead(newmine_snapper3) && Npc_IsDead(newmine_snapper4) && Npc_IsDead(newmine_snapper5) && Npc_IsDead(newmine_snapper6) && Npc_IsDead(newmine_snapper7) && Npc_IsDead(newmine_snapper8))
	{
		return TRUE;
	};
};


instance DIA_FAJETH_EXIT(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 999;
	condition = dia_fajeth_exit_condition;
	information = dia_fajeth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fajeth_exit_condition()
{
	return TRUE;
};

func void dia_fajeth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_FIRST(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_first_condition;
	information = dia_fajeth_first_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fajeth_first_condition()
{
	if(garond.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_fajeth_first_info()
{
	AI_Output(self,other,"DIA_Fajeth_First_12_00");	//Kim jeste� i co tutaj robisz?
	AI_Output(other,self,"DIA_Fajeth_First_15_01");	//Przybywam z rozkazu Lorda Hagena...
	AI_Output(self,other,"DIA_Fajeth_First_12_02");	//S�dz�, �e powiniene� spr�bowa� dotrze� do zamku. Przebywa tam kapitan Garond, g��wnodowodz�cy tej ekspedycji.
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_HALLO(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_hallo_condition;
	information = dia_fajeth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fajeth_hallo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_fajeth_hallo_info()
{
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_00");	//Sk�d przybywasz?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_01");	//Jestem tutaj w imieniu Garonda...
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_02");	//Dobrze. Potrzebujemy nowych r�k do pracy.
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_03");	//Nie przyby�em tu pomaga� w wydobyciu.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_04");	//Nie? A po co?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_05");	//Kazano mi dowiedzie� si�, ile rudy zdo�ali�cie wydoby�.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_06");	//Wielki magu, twoja obecno�� nape�nia mnie i moich ludzi odwag�.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_07");	//Z pewno�ci� m�g�by� nam pom�c, gdyby� zechcia� u�y� mocy, kt�r� obdarzy� ci� Innos.
		Info_AddChoice(dia_fajeth_hallo,"Co mog� dla ciebie zrobi�?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"Moja misja jest wa�niejsza.",dia_fajeth_hallo_kdfnein);
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_08");	//Moje zadanie polega na wydobywaniu rudy i chronieniu naszych zapas�w.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_09");	//Do tego potrzebuj� ludzi. Jeste� s�ug� Innosa - a zatem musisz s�ucha� moich polece�.
		Info_AddChoice(dia_fajeth_hallo,"Co mog� dla ciebie zrobi�?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"Ale ja otrzyma�em ju� rozkazy i to od Garonda.",dia_fajeth_hallo_milnein);
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_10");	//S�uchaj, nie wiem, czemu Garond przys�a� tu najemnika, ale z pewno�ci� mia� w tym jaki� cel.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_11");	//Zanim ci� ode�l�, chcia�bym ci zleci� jedno zadanie.
		Info_AddChoice(dia_fajeth_hallo,"Wszystko ma swoj� cen�.",dia_fajeth_hallo_sldja);
		Info_AddChoice(dia_fajeth_hallo,"Nie, nie mam czasu...",dia_fajeth_hallo_sldnein);
	};
};

func void dia_fajeth_hallo_tun()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_Tun_15_00");	//Co mog� dla ciebie zrobi�?
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_01");	//Horda z�baczy ju� od dawna grasuje w tej okolicy. Ostatnio kr��� dooko�a naszego obozu, jakby czekaj�c na okazj� do ataku.
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_02");	//Nie wiem dok�adnie, o co mo�e im chodzi�, ale dop�ki tu s�, w obozie nie zapanuje spok�j.
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_03");	//Najwi�cej problem�w sprawia Fed. Nie do��, �e sam jest �miertelnie przera�ony, to jeszcze rozsiewa panik� w�r�d pozosta�ych skaza�c�w.
	};
	if(Npc_IsDead(bilgot) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_04");	//Bilgot te� si� do niczego nie nadaje.
	};
	if(Npc_IsDead(tengron) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_05");	//Tengron co prawda potrafi walczy�, ale brakuje mu sprytu.
	};
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_06");	//Chc�, �eby� znalaz� te bestie i zabi� je. Tylko ty mo�esz podj�� si� tego zadania.
	Wld_InsertNpc(newmine_snapper7,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper8,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	MIS_FAJETH_KILL_SNAPPER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FAJETHKILLSNAPPER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FAJETHKILLSNAPPER,LOG_RUNNING);
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"Fajeth kaza� mi si� zaj�� z�baczami, kt�re ju� od jakiego� czasu kr��� w okolicach obozu.");
	Info_ClearChoices(dia_fajeth_hallo);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

func void dia_fajeth_hallo_kdfnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDFNein_15_00");	//Moja misja jest wa�niejsza. Nie mog� ci pom�c.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDFNein_12_01");	//Oczywi�cie, o wielki. Odpowiem na wszystkie twoje pytania.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};

func void dia_fajeth_hallo_milnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_MILNein_15_00");	//Ale ja otrzyma�em ju� rozkazy i to od Garonda.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_01");	//I wype�nisz je. Ale dopiero po tym, jak ci� odprawi�.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_02");	//Od tej chwili odzywasz si� tylko po to, �eby zapyta�: 'Co mog� dla pana zrobi�?' Jasne?!
};

func void dia_fajeth_hallo_sldja()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDJa_15_00");	//Wszystko ma swoj� cen�. Je�li mi zap�acisz, mo�e si� nad tym zastanowi�.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_01");	//Nie jestem przyzwyczajony do ubijania interes�w z najemnikami. Nie znosz� si� targowa�.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_02");	//Jednak na znak mojej przychylno�ci zap�ac� ci za twoj� prac� 100 sztuk z�ota.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_03");	//Zgoda?
	FAJETH_PAY = TRUE;
	Info_ClearChoices(dia_fajeth_hallo);
	Info_AddChoice(dia_fajeth_hallo,"Co mog� dla ciebie zrobi�?",dia_fajeth_hallo_tun);
	Info_AddChoice(dia_fajeth_hallo,"Nie, nie mam czasu...",dia_fajeth_hallo_sldnein);
};

func void dia_fajeth_hallo_sldnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDNein_15_00");	//Nie, nie mam czasu zajmowa� si� waszym problemem.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_01");	//Gardzisz �atwym zarobkiem? Nigdy bym si� tego nie spodziewa� po najemniku.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_02");	//Ale skoro nie chcesz nam pom�c, to pytaj, o co chcesz, i wyno� si� st�d jak najszybciej.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};


instance DIA_FAJETH_LEADER(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_leader_condition;
	information = dia_fajeth_leader_info;
	permanent = FALSE;
	description = "Zabi�em przyw�dc� stada.";
};


func int dia_fajeth_leader_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper) && Npc_IsDead(newmine_leadsnapper) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_fajeth_leader_info()
{
	AI_Output(other,self,"DIA_Fajeth_Leader_15_00");	//Zabi�em przyw�dc� stada.
	AI_Output(self,other,"DIA_Fajeth_Leader_12_01");	//Dobrze. Pozbawione przyw�dcy bestie nie s� nawet w po�owie tak gro�ne. Nie s�dz�, �eby mia�y nas jeszcze zaatakowa�.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_Leader_12_02");	//Oto twoje z�oto, zgodnie z umow�.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	fajeth.flags = 0;
	MIS_FAJETH_KILL_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_FAJETHKILLSNAPPER);
};


instance DIA_FAJETH_SNAPPER_KILLED(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_snapper_killed_condition;
	information = dia_fajeth_snapper_killed_info;
	permanent = TRUE;
	description = "Z�bacze ju� nie sprawi� wam problem�w.";
};


func int dia_fajeth_snapper_killed_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING) && (c_snapperdeath() == TRUE))
	{
		return TRUE;
	};
};

func void dia_fajeth_snapper_killed_info()
{
	AI_Output(hero,self,"DIA_Fajeth_SNAPPER_KILLED_15_00");	//Z�bacze ju� nie sprawi� wam problem�w.
	AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_01");	//Dobra robota. Powinni�my poradzi� sobie z reszt� tych bestii.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_02");	//Zas�ugujesz na nagrod� - oto 100 sztuk z�ota, tak jak si� umawiali�my.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	fajeth.flags = 0;
	MIS_FAJETH_KILL_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_FAJETHKILLSNAPPER);
};


instance DIA_FAJETH_RUNNING(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_running_condition;
	information = dia_fajeth_running_info;
	permanent = TRUE;
	description = "Jak tam morale twoich ludzi?";
};


func int dia_fajeth_running_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_fajeth_running_info()
{
	AI_Output(other,self,"DIA_Fajeth_Running_15_00");	//Jak tam morale twoich ludzi?
	AI_Output(self,other,"DIA_Fajeth_Running_12_01");	//Naprawd� chcesz wiedzie�? S� tak przera�eni, �e w og�le nie nadaj� si� do pracy!
	AI_Output(self,other,"DIA_Fajeth_Running_12_02");	//Za�atw jako� ten problem z z�baczami albo czekaj� nas powa�ne k�opoty!
};


instance DIA_FAJETH_BELOHNUNG(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 3;
	condition = dia_fajeth_belohnung_condition;
	information = dia_fajeth_belohnung_info;
	permanent = FALSE;
	description = "Powiedz mi, ile rudy uda�o wam si� wydoby� do tej pory.";
};


func int dia_fajeth_belohnung_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) || (MIS_FAJETH_KILL_SNAPPER == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_fajeth_belohnung_info()
{
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_00");	//Powiedz mi, ile rudy uda�o wam si� wydoby� do tej pory.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_01");	//Zamelduj Garondowi, �e uda�o nam si� wydoby� jedynie DWIE skrzynie rudy.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_02");	//Z powodu ci�g�ych atak�w ponios�em spore straty.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_03");	//Je�li Garond przy�le mi wi�cej ludzi, b�dziemy mogli dalej wydobywa� rud�.
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_04");	//Rozumiem. Zawiadomi� go.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_05");	//Dobrze. Reszta nale�y do ciebie. My postaramy si� jak najd�u�ej utrzyma� pozycje.
	FAJETH_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"G�rnicy Fajetha wydobyli do tej pory DWIE skrzynie rudy.");
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_PERM2(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_perm2_condition;
	information = dia_fajeth_perm2_info;
	permanent = TRUE;
	description = "Jak idzie produkcja rudy?";
};


func int dia_fajeth_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_fajeth_belohnung) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_fajeth_perm2_info()
{
	AI_Output(other,self,"DIA_Fajeth_Perm2_15_00");	//Jak idzie produkcja rudy?
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_01");	//Nie za dobrze. Czynimy niewielkie post�py.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_02");	//Kiedy tu przybyli�my, sz�o nam znacznie lepiej, jednak ostatnio moi ch�opcy wydobywaj� same od�amki. Nic, co mog�oby nam si� przyda�.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_03");	//Ale nie poddamy si� - przynajmniej dop�ki ja tutaj dowodz�.
};


instance DIA_FAJETH_ERZABBAU(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 11;
	condition = dia_fajeth_erzabbau_condition;
	information = dia_fajeth_erzabbau_info;
	permanent = TRUE;
	description = "Jak idzie wydobycie?";
};


func int dia_fajeth_erzabbau_condition()
{
	if(Npc_KnowsInfo(other,dia_fajeth_belohnung) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_fajeth_erzabbau_info()
{
	AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_00");	//Jak idzie wydobycie?
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_01");	//Ostatnio zrobi�o si� tu troch� ciszej. Zastanawiam si� dlaczego.
		AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_02");	//Wszystkie smoki nie �yj�.
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_03");	//Mam nadziej�, �e wkr�tce nas kto� zast�pi. Powoli popadam tu w ob��d.
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_04");	//Sam zobacz. Beznadziejnie.
	};
};


instance DIA_FAJETH_PICKPOCKET(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 900;
	condition = dia_fajeth_pickpocket_condition;
	information = dia_fajeth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_fajeth_pickpocket_condition()
{
	return c_beklauen(56,95);
};

func void dia_fajeth_pickpocket_info()
{
	Info_ClearChoices(dia_fajeth_pickpocket);
	Info_AddChoice(dia_fajeth_pickpocket,DIALOG_BACK,dia_fajeth_pickpocket_back);
	Info_AddChoice(dia_fajeth_pickpocket,DIALOG_PICKPOCKET,dia_fajeth_pickpocket_doit);
};

func void dia_fajeth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fajeth_pickpocket);
};

func void dia_fajeth_pickpocket_back()
{
	Info_ClearChoices(dia_fajeth_pickpocket);
};

