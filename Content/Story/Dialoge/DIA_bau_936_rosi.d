
instance DIA_ROSI_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_exit_condition;
	information = dia_rosi_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_rosi_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_HALLO(C_INFO)
{
	npc = bau_936_rosi;
	nr = 3;
	condition = dia_rosi_hallo_condition;
	information = dia_rosi_hallo_info;
	description = "Wszystko w porz�dku?";
};


func int dia_rosi_hallo_condition()
{
	return TRUE;
};

func void dia_rosi_hallo_info()
{
	AI_Output(other,self,"DIA_Rosi_HALLO_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Rosi_HALLO_17_01");	//C�, w�a�ciwie nie do ko�ca. Kr�gos�up strasznie mnie boli od ci�kiej pracy. Co ci� tu sprowadza? Tak rzadko miewam go�ci.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_HALLO_17_02");	//Na og� odwiedzaj� mnie albo zbiry z g�r, albo ci okropni stra�nicy miejscy.
		AI_Output(self,other,"DIA_Rosi_HALLO_17_03");	//Ostatnio do�� cz�sto nachodz� farmy, ale ty nie wygl�dasz jak jeden z nich.
	};
};


instance DIA_ROSI_WASMACHSTDU(C_INFO)
{
	npc = bau_936_rosi;
	nr = 4;
	condition = dia_rosi_wasmachstdu_condition;
	information = dia_rosi_wasmachstdu_info;
	description = "Co tu porabiasz?";
};


func int dia_rosi_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_rosi_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rosi_WASMACHSTDU_15_00");	//Czym si� zajmujesz?
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_01");	//Od lat sama si� o to pytam. M�j m��, Sekob, ma na pie�ku ju� chyba ze wszystkimi w okolicy.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_02");	//Jest zad�u�ony po uszy. Dlatego te� podkrada r�ne towary Onarowi, sprzedaj�c je p�niej w mie�cie.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_03");	//Dzi�ki tym machlojkom uda�o mu si� zbi� fortun�.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_04");	//Ka�e ludziom pracowa� tak d�ugo, a� biedakom zaczynaj� si� �ama� kr�gos�upy. Dosz�o do tego, �e nazywaj� go nadzorc� niewolnik�w.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_05");	//Nie jestem specjalnie dumna z tego, �e Sekob jest moim m�em, uwierz mi. Czasem �a�uj�, �e nie ma ju� Bariery.
	};
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_06");	//Mo�e chcia�by� kupi� co� do jedzenia albo bro� do polowania w lesie?
	Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
	b_logentry(TOPIC_OUTTRADER,"Rosi sprzedaje na farmie Sekoba przer�ne towary.");
};


instance DIA_ROSI_WAREZ(C_INFO)
{
	npc = bau_936_rosi;
	nr = 2;
	condition = dia_rosi_warez_condition;
	information = dia_rosi_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Co mo�esz mi zaoferowa�?";
};


func int dia_rosi_warez_condition()
{
	if((Npc_KnowsInfo(other,dia_rosi_wasmachstdu) || ((KAPITEL >= 5) && Npc_KnowsInfo(other,dia_rosi_fleefromsekob)) || Npc_IsDead(sekob)) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_rosi_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Rosi_WAREZ_15_00");	//Co mo�esz mi zaoferowa�?
	AI_Output(self,other,"DIA_Rosi_WAREZ_17_01");	//A czego potrzebujesz?
};


instance DIA_ROSI_BARRIERE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 6;
	condition = dia_rosi_barriere_condition;
	information = dia_rosi_barriere_info;
	description = "Bariery?";
};


func int dia_rosi_barriere_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rosi_barriere_info()
{
	AI_Output(other,self,"DIA_Rosi_BARRIERE_15_00");	//Bariery?
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_01");	//No wiesz, kopu�y otaczaj�cej do niedawna G�rnicz� Dolin�.
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_02");	//Wielu robotnik�w i farmer�w, kt�rzy pope�nili jakie� przest�pstwa, po prostu tam wrzucano, ju� nigdy nie wracali.
};


instance DIA_ROSI_DUINBARRIERE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 10;
	condition = dia_rosi_duinbarriere_condition;
	information = dia_rosi_duinbarriere_info;
	description = "Widzia�a� kiedykolwiek Barier�?";
};


func int dia_rosi_duinbarriere_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_barriere))
	{
		return TRUE;
	};
};

func void dia_rosi_duinbarriere_info()
{
	AI_Output(other,self,"DIA_Rosi_DuInBarriere_15_00");	//Widzia�a� kiedykolwiek Barier�?
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_01");	//Nie. Jedynie o niej s�ysza�am. Bengar, farmer z pastwisk po�o�onych nieco wy�ej, na pewno b�dzie m�g� powiedzie� ci wi�cej.
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_02");	//Jego farma znajduje si� niedaleko prze��czy prowadz�cej do G�rniczej Doliny.
};


instance DIA_ROSI_BENGAR(C_INFO)
{
	npc = bau_936_rosi;
	nr = 11;
	condition = dia_rosi_bengar_condition;
	information = dia_rosi_bengar_info;
	description = "Jak doj�� do farmy Bengara?";
};


func int dia_rosi_bengar_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_duinbarriere) && (Npc_IsDead(balthasar) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rosi_bengar_info()
{
	AI_Output(other,self,"DIA_Rosi_BENGAR_15_00");	//Jak doj�� do farmy Bengara?
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_01");	//Zapytaj o to Balthasara. To nasz pasterz. Czasem prowadzi stado na pastwiska Bengara.
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_02");	//Jestem pewna, �e powie ci, jak tam doj��.
};


instance DIA_ROSI_MILIZ(C_INFO)
{
	npc = bau_936_rosi;
	nr = 7;
	condition = dia_rosi_miliz_condition;
	information = dia_rosi_miliz_info;
	description = "Dlaczego stra� atakuje wasze farmy?";
};


func int dia_rosi_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) && (hero.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_rosi_miliz_info()
{
	AI_Output(other,self,"DIA_Rosi_Miliz_15_00");	//Dlaczego stra� miejska atakuje wasze farmy?
	AI_Output(self,other,"DIA_Rosi_Miliz_17_01");	//Poniewa� nie ma ich kto chroni�, �atwiej jest je spl�drowa� i okra��, ni� kupowa� towary.
	AI_Output(self,other,"DIA_Rosi_Miliz_17_02");	//Kr�l jest daleko st�d, musimy wi�c pracowa� dla Onara i mie� nadziej�, �e przy�le na czas swoich ludzi, �eby uchronili nas przed atakami.
};


instance DIA_ROSI_ONAR(C_INFO)
{
	npc = bau_936_rosi;
	nr = 8;
	condition = dia_rosi_onar_condition;
	information = dia_rosi_onar_info;
	description = "Jak wygl�da pomoc ze strony Onara?";
};


func int dia_rosi_onar_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_miliz))
	{
		return TRUE;
	};
};

func void dia_rosi_onar_info()
{
	AI_Output(other,self,"DIA_Rosi_ONAR_15_00");	//Jak wygl�da pomoc ze strony Onara?
	AI_Output(self,other,"DIA_Rosi_ONAR_17_01");	//Czasami wiemy wcze�niej o planowanym przez stra� ataku.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_02");	//Wtedy wysy�amy kogo� na farm� w�a�ciciela ziemskiego i prosimy o pomoc.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_03");	//Z regu�y najemnicy, kt�rych op�aca, przybywaj� tu na czas, by rozprawi� si� ze stra�nikami.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_04");	//Ale tak po prawdzie, najemnicy wcale nie s� du�o lepsi od naje�d�c�w.
};


instance DIA_ROSI_PERMKAP1(C_INFO)
{
	npc = bau_936_rosi;
	nr = 80;
	condition = dia_rosi_permkap1_condition;
	information = dia_rosi_permkap1_info;
	permanent = TRUE;
	description = "G�owa do g�ry.";
};


func int dia_rosi_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) || ((KAPITEL >= 5) && Npc_KnowsInfo(other,dia_rosi_fleefromsekob)))
	{
		return TRUE;
	};
};

func void dia_rosi_permkap1_info()
{
	AI_Output(other,self,"DIA_Rosi_PERMKAP1_15_00");	//G�owa do g�ry.
	if(MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_01");	//Id� si� utop w jeziorze!
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_02");	//Uwa�aj na siebie i nie pozw�l, by ci� dopadli.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP3_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap3_exit_condition;
	information = dia_rosi_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_rosi_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP4_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap4_exit_condition;
	information = dia_rosi_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_rosi_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP5_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap5_exit_condition;
	information = dia_rosi_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_rosi_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_FLEEFROMSEKOB(C_INFO)
{
	npc = bau_936_rosi;
	nr = 50;
	condition = dia_rosi_fleefromsekob_condition;
	information = dia_rosi_fleefromsekob_info;
	description = "Co robisz w tej dziczy?";
};


func int dia_rosi_fleefromsekob_condition()
{
	if((KAPITEL == 5) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_fleefromsekob_info()
{
	AI_Output(other,self,"DIA_Rosi_FLEEFROMSEKOB_15_00");	//Co robisz w tej dziczy?
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_01");	//Nie mog�am ju� d�u�ej wytrzyma� na farmie Sekoba. Kl�� jak szewc.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_02");	//Krzycza� i krzycza�, w ko�cu w og�le nie da�o si� z nim rozmawia�.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_03");	//Musz� si� st�d wynosi�, ale nie wiem, dok�d i��.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_04");	//Mo�e zechcia�by� mi pom�c?
	b_giveplayerxp(XP_AMBIENT);
	ROSIFOUNDKAP5 = TRUE;
};


instance DIA_ROSI_HILFE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 51;
	condition = dia_rosi_hilfe_condition;
	information = dia_rosi_hilfe_info;
	description = "Chc� ci� st�d zabra�.";
};


func int dia_rosi_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_fleefromsekob) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_hilfe_info()
{
	AI_Output(other,self,"DIA_Rosi_HILFE_15_00");	//Chc� ci� st�d zabra�.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	till.aivar[AIV_PARTYMEMBER] = TRUE;
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_01");	//M�g�bym odprowadzi� ci� do miasta.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_02");	//Zaprowadz� ci� na farm� w�a�ciciela.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_03");	//Chod� ze mn� do klasztoru, znajdziesz tam gor�ce przyj�cie.
	};
	AI_Output(self,other,"DIA_Rosi_HILFE_17_04");	//Nigdy nie zapomn� co dla mnie zrobi�e� i oczywi�cie zap�ac�.
	if(Npc_IsDead(till))
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_05");	//Id� przodem, b�d� sz�a za tob�.
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_06");	//Id� przodem, b�dziemy szli za tob�
	};
	AI_StopProcessInfos(self);
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		Npc_ExchangeRoutine(self,"FollowCity");
		b_startotherroutine(till,"FollowCity");
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Npc_ExchangeRoutine(self,"FollowBigfarm");
		b_startotherroutine(till,"FollowBigfarm");
	};
	if(hero.guild == GIL_KDF)
	{
		Npc_ExchangeRoutine(self,"FollowKloster");
		b_startotherroutine(till,"FollowKloster");
	};
	Log_CreateTopic(TOPIC_ROSISFLUCHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ROSISFLUCHT,LOG_RUNNING);
	b_logentry(TOPIC_ROSISFLUCHT,"Rosi nie mog�a wytrzyma� na farmie Sekoba, ale teraz nie wie, gdzie si� uda�. Wyprowadz� j� z tej g�uszy.");
	MIS_ROSISFLUCHT = LOG_RUNNING;
};


instance DIA_ROSI_ANGEKOMMEN(C_INFO)
{
	npc = bau_936_rosi;
	nr = 55;
	condition = dia_rosi_angekommen_condition;
	information = dia_rosi_angekommen_info;
	important = TRUE;
};


func int dia_rosi_angekommen_condition()
{
	if((KAPITEL == 5) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE) && (((Npc_GetDistToWP(self,"CITY2") < 6000) && (hero.guild == GIL_PAL)) || ((Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 6000) && (hero.guild == GIL_DJG)) || ((Npc_GetDistToWP(self,"KLOSTER") < 6000) && (hero.guild == GIL_KDF))))
	{
		return TRUE;
	};
};

func void dia_rosi_angekommen_info()
{
	var int xpforboth;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_00");	//Dalej ju� sobie poradz�.
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_01");	//Bardzo ci dzi�kuj�. C� ja bym bez ciebie zrobi�a.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_BRINGROSIBACKTOSEKOB = LOG_OBSOLETE;
	MIS_ROSISFLUCHT = LOG_SUCCESS;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_02");	//Prosz�, przyjmij w podzi�ce ten skromny podarek.
	CreateInvItems(rosi,itmi_gold,650);
	b_giveinvitems(self,other,itmi_gold,450);
	if(Npc_IsDead(till))
	{
		b_giveplayerxp(XP_SAVEDROSI);
	}
	else
	{
		xpforboth = XP_SAVEDROSI + XP_AMBIENT;
		b_giveplayerxp(xpforboth);
	};
	AI_StopProcessInfos(self);
	if(Npc_GetDistToWP(self,"CITY2") < 8000)
	{
		Npc_ExchangeRoutine(self,"CITY");
		b_startotherroutine(till,"CITY");
	}
	else if(Npc_GetDistToWP(self,"BIGFARM") < 8000)
	{
		Npc_ExchangeRoutine(self,"BIGFARM");
		b_startotherroutine(till,"BIGFARM");
	}
	else if(Npc_GetDistToWP(self,"KLOSTER") < 8000)
	{
		Npc_ExchangeRoutine(self,"KLOSTER");
		b_startotherroutine(till,"KLOSTER");
	};
};


instance DIA_ROSI_TRAIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 55;
	condition = dia_rosi_trait_condition;
	information = dia_rosi_trait_info;
	description = "Widzisz, jeste�my w domu.";
};


func int dia_rosi_trait_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_trait_info()
{
	AI_Output(other,self,"DIA_Rosi_TRAIT_15_00");	//Widzisz, jeste�my w domu.
	AI_Output(self,other,"DIA_Rosi_TRAIT_17_01");	//Ty brudna �winio, jeste� najgorszym chamem, jakiego spotka�am w �yciu.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_ROSISFLUCHT = LOG_FAILED;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ROSI_MINENANTEIL(C_INFO)
{
	npc = bau_936_rosi;
	nr = 3;
	condition = dia_rosi_minenanteil_condition;
	information = dia_rosi_minenanteil_info;
	description = "Sprzedajesz nielegalne udzia�y w kopalni, nie wstyd ci?";
};


func int dia_rosi_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_rosi_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rosi_minenanteil_info()
{
	AI_Output(other,self,"DIA_Rosi_Minenanteil_15_00");	//Sprzedajesz nielegalne udzia�y w kopalni, nie wstyd ci?
	AI_Output(self,other,"DIA_Rosi_Minenanteil_17_01");	//Nie. Ja te� musz� z czego� �y�. Nie ja, zreszt�, wprowadzi�am je do obiegu.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ROSI_KAP6_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap6_exit_condition;
	information = dia_rosi_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_rosi_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_PICKPOCKET(C_INFO)
{
	npc = bau_936_rosi;
	nr = 900;
	condition = dia_rosi_pickpocket_condition;
	information = dia_rosi_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_rosi_pickpocket_condition()
{
	return c_beklauen(30,75);
};

func void dia_rosi_pickpocket_info()
{
	Info_ClearChoices(dia_rosi_pickpocket);
	Info_AddChoice(dia_rosi_pickpocket,DIALOG_BACK,dia_rosi_pickpocket_back);
	Info_AddChoice(dia_rosi_pickpocket,DIALOG_PICKPOCKET,dia_rosi_pickpocket_doit);
};

func void dia_rosi_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rosi_pickpocket);
};

func void dia_rosi_pickpocket_back()
{
	Info_ClearChoices(dia_rosi_pickpocket);
};

