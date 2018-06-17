
instance DIA_NAGUR_EXIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 999;
	condition = dia_nagur_exit_condition;
	information = dia_nagur_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nagur_exit_condition()
{
	return TRUE;
};

func void dia_nagur_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PICKPOCKET(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 900;
	condition = dia_nagur_pickpocket_condition;
	information = dia_nagur_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_nagur_pickpocket_condition()
{
	return c_beklauen(75,150);
};

func void dia_nagur_pickpocket_info()
{
	Info_ClearChoices(dia_nagur_pickpocket);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_BACK,dia_nagur_pickpocket_back);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_PICKPOCKET,dia_nagur_pickpocket_doit);
};

func void dia_nagur_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nagur_pickpocket);
};

func void dia_nagur_pickpocket_back()
{
	Info_ClearChoices(dia_nagur_pickpocket);
};


instance DIA_NAGUR_HALLO(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 2;
	condition = dia_nagur_hallo_condition;
	information = dia_nagur_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_hallo_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_00");	//Hej, nie mam czasu na pogawêdki. Jeœli szukasz informacji, porozmawiaj z Kardifem.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_01");	//Cz³owieku, zostaw mnie w spokoju, rozumiesz?!
		AI_StopProcessInfos(self);
	};
};


var int nagurhack;

func void b_nagur_abfertigen()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(heroarmor,itar_mil_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_mil_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_h) == FALSE) && (Hlp_IsItem(heroarmor,itar_nov_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_h) == FALSE))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_02");	//I nie myœl, ¿e ciê nie poznam tylko dlatego, ¿e za³o¿y³eœ inne szaty.
	};
	AI_Output(self,other,"DIA_Nagur_Add_08_03");	//Radzê ci jak przyjaciel, nie wtykaj nosa w cudze sprawy!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//Spadaj!
	MIS_NAGUR_BOTE = LOG_SUCCESS;
	NAGURHACK = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_JOB(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 3;
	condition = dia_nagur_job_condition;
	information = dia_nagur_job_info;
	permanent = FALSE;
	description = "Kardif powiedzia³, ¿e masz dla mnie pracê.";
};


func int dia_nagur_job_condition()
{
	if(DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_nagur_job_info()
{
	AI_Output(other,self,"DIA_Nagur_Job_15_00");	//Kardif powiedzia³, ¿e masz dla mnie pracê.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_00");	//NIE MA w porcie pracy dla ludzi z klasztoru!
		b_nagur_abfertigen();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_01");	//Jeœli nale¿ysz do ludzi Króla, to raczej nie licz na jak¹kolwiek pracê w porcie.
		b_nagur_abfertigen();
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Job_08_01");	//Proszê, proszê... Có¿, powiadasz, ¿e szukasz jakiegoœ specjalnego zajêcia? W porz¹dku, ale pamiêtaj - ja tu rz¹dzê.
		AI_Output(other,self,"DIA_Nagur_Job_15_02");	//Co masz na myœli?
		AI_Output(self,other,"DIA_Nagur_Job_08_03");	//Ano to, ¿e s³uchasz tylko mnie. Prócz tego przys³uguje ci jedna trzecia zysku.
		AI_Output(self,other,"DIA_Nagur_Job_08_04");	//Jeœli takie warunki ci nie odpowiadaj¹, poszukaj sobie innej pracy.
		Info_ClearChoices(dia_nagur_job);
		Info_AddChoice(dia_nagur_job,"Jesteœmy partnerami. Dzielimy siê po po³owie.",dia_nagur_job_halbe);
		Info_AddChoice(dia_nagur_job,"W porz¹dku, ty tu jesteœ szefem.",dia_nagur_job_klar);
	};
};

func void dia_nagur_job_klar()
{
	AI_Output(other,self,"DIA_Nagur_Job_Klar_15_00");	//W porz¹dku, ty tu jesteœ szefem.
	AI_Output(self,other,"DIA_Nagur_Job_Klar_08_01");	//Wszystko jasne. W takim razie przygotuj siê na ³atw¹ kasê.
	NAGUR_DEAL = 80;
	Info_ClearChoices(dia_nagur_job);
};

func void dia_nagur_job_halbe()
{
	AI_Output(other,self,"DIA_Nagur_Job_Halbe_15_00");	//Jesteœmy partnerami. Dzielimy siê po po³owie.
	AI_Output(self,other,"DIA_Nagur_Job_Halbe_08_01");	//No dobra ju¿, dobra. Tylko ciê sprawdza³em. Oczywiœcie, ¿e podzielimy siê zyskami sprawiedliwie.
	NAGUR_DEAL = 120;
	Info_ClearChoices(dia_nagur_job);
};


instance DIA_NAGUR_AUFTRAG(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 4;
	condition = dia_nagur_auftrag_condition;
	information = dia_nagur_auftrag_info;
	permanent = FALSE;
	description = "Dobra, wiêc jaki masz plan?";
};


func int dia_nagur_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_job) && (MIS_NAGUR_BOTE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_nagur_auftrag_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_15_00");	//Dobra, wiêc jaki masz plan?
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_01");	//Znasz chyba kupca Baltrama? Jeœli nie, to najwy¿szy czas byœ go pozna³ i porozmawia³ z nim.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_02");	//Baltram zatrudnia pos³añca, który dostarcza mu towary z farmy Akila.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_03");	//W³aœciwie to ZATRUDNIA£ pos³añca, póki nie poder¿n¹³em mu gard³a. Obecnie Baltram poszukuje kogoœ na to miejsce i tu zaczyna siê twoje zadanie.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_04");	//Zatrudnisz siê u Baltrama, a przesy³kê od Akila przyniesiesz do mnie.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_05");	//Ja zaœ sprzedam j¹ temu, kto zdecyduje siê zap³aciæ najwiêcej.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_06");	//I niech ci nie przyjdzie do g³owy sprzedaæ przesy³kê gdzieœ po drodze do mnie. Kapujesz?
	Info_ClearChoices(dia_nagur_auftrag);
	Info_AddChoice(dia_nagur_auftrag,"Ja jestem gotowy (KONIEC)",dia_nagur_auftrag_okay);
	Info_AddChoice(dia_nagur_auftrag,"Gdzie znajdê Baltrama?",dia_nagur_auftrag_baltram);
	Info_AddChoice(dia_nagur_auftrag,"Kiedy mam siê spotkaæ z Baltramem?",dia_nagur_auftrag_wann);
	Info_AddChoice(dia_nagur_auftrag,"Jak dojœæ do farmy Akila?",dia_nagur_auftrag_akil);
	Info_AddChoice(dia_nagur_auftrag,"A co ja bêdê z tego mia³?",dia_nagur_auftrag_gewinn);
};

func void dia_nagur_auftrag_akil()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Akil_15_00");	//Jak dojœæ do farmy Akila?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_01");	//WyjdŸ z placu targowego przez wschodni¹ bramê.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_02");	//Jeœli pod¹¿ysz œcie¿k¹ w prawo, wkrótce dojdziesz do kilku wykutych w skale stopni.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_03");	//WejdŸ na górê, a znajdziesz siê na farmie Akila.
};

func void dia_nagur_auftrag_gewinn()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Gewinn_15_00");	//A co ja bêdê z tego mia³?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Gewinn_08_01");	//Hmmm, dok³adnie ci teraz nie powiem. Myœlê jednak, ¿e mo¿esz liczyæ na 400 sztuk z³ota.
};

func void dia_nagur_auftrag_baltram()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Baltram_15_00");	//Gdzie znajdê Baltrama?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Baltram_08_01");	//Jego kram znajduje siê na placu targowym.
};

func void dia_nagur_auftrag_wann()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Wann_15_00");	//Kiedy mam siê spotkaæ z Baltramem?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01");	//W ka¿dej chwili. Chyba ju¿ siê domyœli³, ¿e jego poprzedni pos³aniec nie wróci.
};

func void dia_nagur_auftrag_okay()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Okay_15_00");	//W porz¹dku, zgadzam siê.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01");	//Doskonale, w takim razie ruszaj w drogê. Pamiêtaj jednak, ¿e nieuczciwy pos³aniec to martwy pos³aniec, jeœli wiesz, co mam na myœli!
	MIS_NAGUR_BOTE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NAGUR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NAGUR,LOG_RUNNING);
	b_logentry(TOPIC_NAGUR,"Kiedy Baltram zatrudni mnie jako ch³opca na posy³ki, odbiorê dostawê od farmera Akila i przeka¿ê j¹ Nagurowi.");
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SUCCESS(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 5;
	condition = dia_nagur_success_condition;
	information = dia_nagur_success_info;
	permanent = FALSE;
	description = "Przynios³em przesy³kê.";
};


func int dia_nagur_success_condition()
{
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (Npc_HasItems(other,itmi_baltrampaket) >= 1) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_success_info()
{
	AI_Output(other,self,"DIA_Nagur_Success_15_00");	//Przynios³em przesy³kê.
	AI_Output(self,other,"DIA_Nagur_Success_08_01");	//Doskonale, postaram siê wszystko sprzedaæ. Wróæ do mnie jutro.
	b_logentry(TOPIC_NAGUR,"Nagur odebra³ dostawê. Jutro wyp³aci mi moje z³oto.");
	AI_StopProcessInfos(self);
	if(b_giveinvitems(other,self,itmi_baltrampaket,1))
	{
		Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	};
	NAGURDAY = b_getdayplus();
};


instance DIA_NAGUR_DEAL(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 6;
	condition = dia_nagur_deal_condition;
	information = dia_nagur_deal_info;
	permanent = TRUE;
	description = "I co, sprzeda³eœ ju¿ ca³y towar?";
};


var int dia_nagur_deal_permanent;

func int dia_nagur_deal_condition()
{
	if((DIA_NAGUR_DEAL_PERMANENT == FALSE) && (MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE) && Npc_KnowsInfo(other,dia_nagur_success))
	{
		return TRUE;
	};
};

func void dia_nagur_deal_info()
{
	AI_Output(other,self,"DIA_Nagur_Deal_15_00");	//I co, sprzeda³eœ ju¿ ca³y towar?
	if(b_getdayplus() > NAGURDAY)
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_01");	//Tak, ale za mniej, ni¿ siê spodziewa³em. Za wszystko dosta³em jedynie 300 sztuk z³ota.
		AI_Output(self,other,"DIA_Nagur_Deal_08_02");	//A jeszcze czêœæ z tego musia³em oddaæ prze³o¿onym.
		AI_Output(self,other,"DIA_Nagur_Deal_08_03");	//Do tego jeszcze zwyczajowa premia dla Kardifa i op³ata za twoje zlecenie.
		AI_Output(self,other,"DIA_Nagur_Deal_08_04");	//W sumie dla mnie pozostaje 240 sztuk z³ota. Dzielimy siê wiêc wedle umowy, oto twoja czêœæ.
		AI_Output(self,other,"DIA_Nagur_Deal_08_05");	//Wykona³eœ kawa³ dobrej roboty, moi zwierzchnicy ju¿ o tym wiedz¹.
		AI_Output(self,other,"DIA_Nagur_Deal_08_06");	//Co bêdzie dalej... To ju¿ nie zale¿y ode mnie.
		b_giveinvitems(self,other,itmi_gold,NAGUR_DEAL);
		MIS_NAGUR_BOTE = LOG_SUCCESS;
		MIS_BALTRAM_SCOUTAKIL = LOG_FAILED;
		b_giveplayerxp(XP_NAGUR_BOTE);
		DIA_NAGUR_DEAL_PERMANENT = TRUE;
		DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_07");	//Nie, jeszcze nie. W handlu nie szybkoœæ jest najwa¿niejsza a osi¹gniêta cena.
	};
};


instance DIA_NAGUR_AUFTRAGGEBER(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_auftraggeber_condition;
	information = dia_nagur_auftraggeber_info;
	permanent = FALSE;
	description = "Kto jest twoim pracodawc¹?";
};


func int dia_nagur_auftraggeber_condition()
{
	if(MIS_NAGUR_BOTE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_nagur_auftraggeber_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftraggeber_15_00");	//Kto jest twoim pracodawc¹?
	AI_Output(self,other,"DIA_Nagur_Auftraggeber_08_01");	//Chyba nie s¹dzisz, ¿e odpowiem na to pytanie, hm?
};


instance DIA_NAGUR_FAZIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_fazit_condition;
	information = dia_nagur_fazit_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_fazit_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_auftraggeber) && Npc_IsInState(self,zs_talk) && (KNOWS_SECRETSIGN == FALSE) && (NAGURHACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_fazit_info()
{
	AI_Output(self,other,"DIA_Nagur_Fazit_08_00");	//Wszystko w porz¹dku, nic nie powiem moim prze³o¿onym. Mo¿esz byæ spokojny.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_KNAST(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_knast_condition;
	information = dia_nagur_knast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_knast_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000) && (NAGUR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_knast_info()
{
	AI_Output(self,other,"DIA_Nagur_Knast_08_00");	//Zdradzi³eœ mnie! To by³ wielki b³¹d - spieprzaj!
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SIGN(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_sign_condition;
	information = dia_nagur_sign_info;
	permanent = FALSE;
	description = "(Poka¿ z³odziejski gest)";
};


func int dia_nagur_sign_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && (KNOWS_SECRETSIGN == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Nagur_Sign_08_00");	//Zrobi³eœ, co mia³eœ zrobiæ. Wiêc musia³eœ poznaæ moich zwierzchników.
	AI_Output(self,other,"DIA_Nagur_Sign_08_01");	//Pamiêtaj, s³uchaj tego, co mówi ci Cassia - zreszt¹ nie obchodzi nas, kim jesteœ. Liczy siê tylko to, ¿e przy³¹czy³eœ siê do nas.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PERM(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_perm_condition;
	information = dia_nagur_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_perm_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_nagur_sign) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_nagur_perm_info()
{
	AI_Output(self,other,"DIA_Nagur_Perm_08_00");	//Poszukaj sobie kogoœ innego. Naoko³o jest sporo ludzi. My nie mamy ju¿ o czym rozmawiaæ.
	AI_StopProcessInfos(self);
};

