
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
	AI_Output(self,other,"DIA_Fajeth_First_12_00");	//Kim jesteœ i co tutaj robisz?
	AI_Output(other,self,"DIA_Fajeth_First_15_01");	//Przybywam z rozkazu Lorda Hagena...
	AI_Output(self,other,"DIA_Fajeth_First_12_02");	//S¹dzê, ¿e powinieneœ spróbowaæ dotrzeæ do zamku. Przebywa tam kapitan Garond, g³ównodowodz¹cy tej ekspedycji.
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
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_00");	//Sk¹d przybywasz?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_01");	//Jestem tutaj w imieniu Garonda...
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_02");	//Dobrze. Potrzebujemy nowych r¹k do pracy.
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_03");	//Nie przyby³em tu pomagaæ w wydobyciu.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_04");	//Nie? A po co?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_05");	//Kazano mi dowiedzieæ siê, ile rudy zdo³aliœcie wydobyæ.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_06");	//Wielki magu, twoja obecnoœæ nape³nia mnie i moich ludzi odwag¹.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_07");	//Z pewnoœci¹ móg³byœ nam pomóc, gdybyœ zechcia³ u¿yæ mocy, któr¹ obdarzy³ ciê Innos.
		Info_AddChoice(dia_fajeth_hallo,"Co mogê dla ciebie zrobiæ?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"Moja misja jest wa¿niejsza.",dia_fajeth_hallo_kdfnein);
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_08");	//Moje zadanie polega na wydobywaniu rudy i chronieniu naszych zapasów.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_09");	//Do tego potrzebujê ludzi. Jesteœ s³ug¹ Innosa - a zatem musisz s³uchaæ moich poleceñ.
		Info_AddChoice(dia_fajeth_hallo,"Co mogê dla ciebie zrobiæ?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"Ale ja otrzyma³em ju¿ rozkazy i to od Garonda.",dia_fajeth_hallo_milnein);
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_10");	//S³uchaj, nie wiem, czemu Garond przys³a³ tu najemnika, ale z pewnoœci¹ mia³ w tym jakiœ cel.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_11");	//Zanim ciê odeœlê, chcia³bym ci zleciæ jedno zadanie.
		Info_AddChoice(dia_fajeth_hallo,"Wszystko ma swoj¹ cenê.",dia_fajeth_hallo_sldja);
		Info_AddChoice(dia_fajeth_hallo,"Nie, nie mam czasu...",dia_fajeth_hallo_sldnein);
	};
};

func void dia_fajeth_hallo_tun()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_Tun_15_00");	//Co mogê dla ciebie zrobiæ?
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_01");	//Horda zêbaczy ju¿ od dawna grasuje w tej okolicy. Ostatnio kr¹¿¹ dooko³a naszego obozu, jakby czekaj¹c na okazjê do ataku.
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_02");	//Nie wiem dok³adnie, o co mo¿e im chodziæ, ale dopóki tu s¹, w obozie nie zapanuje spokój.
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_03");	//Najwiêcej problemów sprawia Fed. Nie doœæ, ¿e sam jest œmiertelnie przera¿ony, to jeszcze rozsiewa panikê wœród pozosta³ych skazañców.
	};
	if(Npc_IsDead(bilgot) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_04");	//Bilgot te¿ siê do niczego nie nadaje.
	};
	if(Npc_IsDead(tengron) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_05");	//Tengron co prawda potrafi walczyæ, ale brakuje mu sprytu.
	};
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_06");	//Chcê, ¿ebyœ znalaz³ te bestie i zabi³ je. Tylko ty mo¿esz podj¹æ siê tego zadania.
	Wld_InsertNpc(newmine_snapper7,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper8,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	MIS_FAJETH_KILL_SNAPPER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FAJETHKILLSNAPPER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FAJETHKILLSNAPPER,LOG_RUNNING);
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"Fajeth kaza³ mi siê zaj¹æ zêbaczami, które ju¿ od jakiegoœ czasu kr¹¿¹ w okolicach obozu.");
	Info_ClearChoices(dia_fajeth_hallo);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

func void dia_fajeth_hallo_kdfnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDFNein_15_00");	//Moja misja jest wa¿niejsza. Nie mogê ci pomóc.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDFNein_12_01");	//Oczywiœcie, o wielki. Odpowiem na wszystkie twoje pytania.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};

func void dia_fajeth_hallo_milnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_MILNein_15_00");	//Ale ja otrzyma³em ju¿ rozkazy i to od Garonda.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_01");	//I wype³nisz je. Ale dopiero po tym, jak ciê odprawiê.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_02");	//Od tej chwili odzywasz siê tylko po to, ¿eby zapytaæ: 'Co mogê dla pana zrobiæ?' Jasne?!
};

func void dia_fajeth_hallo_sldja()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDJa_15_00");	//Wszystko ma swoj¹ cenê. Jeœli mi zap³acisz, mo¿e siê nad tym zastanowiê.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_01");	//Nie jestem przyzwyczajony do ubijania interesów z najemnikami. Nie znoszê siê targowaæ.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_02");	//Jednak na znak mojej przychylnoœci zap³acê ci za twoj¹ pracê 100 sztuk z³ota.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_03");	//Zgoda?
	FAJETH_PAY = TRUE;
	Info_ClearChoices(dia_fajeth_hallo);
	Info_AddChoice(dia_fajeth_hallo,"Co mogê dla ciebie zrobiæ?",dia_fajeth_hallo_tun);
	Info_AddChoice(dia_fajeth_hallo,"Nie, nie mam czasu...",dia_fajeth_hallo_sldnein);
};

func void dia_fajeth_hallo_sldnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDNein_15_00");	//Nie, nie mam czasu zajmowaæ siê waszym problemem.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_01");	//Gardzisz ³atwym zarobkiem? Nigdy bym siê tego nie spodziewa³ po najemniku.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_02");	//Ale skoro nie chcesz nam pomóc, to pytaj, o co chcesz, i wynoœ siê st¹d jak najszybciej.
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
	description = "Zabi³em przywódcê stada.";
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
	AI_Output(other,self,"DIA_Fajeth_Leader_15_00");	//Zabi³em przywódcê stada.
	AI_Output(self,other,"DIA_Fajeth_Leader_12_01");	//Dobrze. Pozbawione przywódcy bestie nie s¹ nawet w po³owie tak groŸne. Nie s¹dzê, ¿eby mia³y nas jeszcze zaatakowaæ.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_Leader_12_02");	//Oto twoje z³oto, zgodnie z umow¹.
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
	description = "Zêbacze ju¿ nie sprawi¹ wam problemów.";
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
	AI_Output(hero,self,"DIA_Fajeth_SNAPPER_KILLED_15_00");	//Zêbacze ju¿ nie sprawi¹ wam problemów.
	AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_01");	//Dobra robota. Powinniœmy poradziæ sobie z reszt¹ tych bestii.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_02");	//Zas³ugujesz na nagrodê - oto 100 sztuk z³ota, tak jak siê umawialiœmy.
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
	AI_Output(self,other,"DIA_Fajeth_Running_12_01");	//Naprawdê chcesz wiedzieæ? S¹ tak przera¿eni, ¿e w ogóle nie nadaj¹ siê do pracy!
	AI_Output(self,other,"DIA_Fajeth_Running_12_02");	//Za³atw jakoœ ten problem z zêbaczami albo czekaj¹ nas powa¿ne k³opoty!
};


instance DIA_FAJETH_BELOHNUNG(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 3;
	condition = dia_fajeth_belohnung_condition;
	information = dia_fajeth_belohnung_info;
	permanent = FALSE;
	description = "Powiedz mi, ile rudy uda³o wam siê wydobyæ do tej pory.";
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
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_00");	//Powiedz mi, ile rudy uda³o wam siê wydobyæ do tej pory.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_01");	//Zamelduj Garondowi, ¿e uda³o nam siê wydobyæ jedynie DWIE skrzynie rudy.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_02");	//Z powodu ci¹g³ych ataków ponios³em spore straty.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_03");	//Jeœli Garond przyœle mi wiêcej ludzi, bêdziemy mogli dalej wydobywaæ rudê.
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_04");	//Rozumiem. Zawiadomiê go.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_05");	//Dobrze. Reszta nale¿y do ciebie. My postaramy siê jak najd³u¿ej utrzymaæ pozycje.
	FAJETH_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Górnicy Fajetha wydobyli do tej pory DWIE skrzynie rudy.");
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
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_01");	//Nie za dobrze. Czynimy niewielkie postêpy.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_02");	//Kiedy tu przybyliœmy, sz³o nam znacznie lepiej, jednak ostatnio moi ch³opcy wydobywaj¹ same od³amki. Nic, co mog³oby nam siê przydaæ.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_03");	//Ale nie poddamy siê - przynajmniej dopóki ja tutaj dowodzê.
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
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_01");	//Ostatnio zrobi³o siê tu trochê ciszej. Zastanawiam siê dlaczego.
		AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_02");	//Wszystkie smoki nie ¿yj¹.
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_03");	//Mam nadziejê, ¿e wkrótce nas ktoœ zast¹pi. Powoli popadam tu w ob³êd.
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

