
instance DIA_ADDON_GREG_EXIT(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 999;
	condition = dia_addon_greg_exit_condition;
	information = dia_addon_greg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_greg_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_PICKPOCKET(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 900;
	condition = dia_addon_greg_pickpocket_condition;
	information = dia_addon_greg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_addon_greg_pickpocket_condition()
{
	return c_beklauen(111,666);
};

func void dia_addon_greg_pickpocket_info()
{
	Info_ClearChoices(dia_addon_greg_pickpocket);
	Info_AddChoice(dia_addon_greg_pickpocket,DIALOG_BACK,dia_addon_greg_pickpocket_back);
	Info_AddChoice(dia_addon_greg_pickpocket,DIALOG_PICKPOCKET,dia_addon_greg_pickpocket_doit);
};

func void dia_addon_greg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_greg_pickpocket);
};

func void dia_addon_greg_pickpocket_back()
{
	Info_ClearChoices(dia_addon_greg_pickpocket);
};


instance DIA_ADDON_GREG_IMNEW(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 1;
	condition = dia_addon_greg_imnew_condition;
	information = dia_addon_greg_imnew_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_greg_imnew_condition()
{
	return TRUE;
};

func void dia_addon_greg_imnew_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//Ej, ty! Co robisz w mojej chacie?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//Ja...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//Nie ma mnie parê dni, a ka¿dy myœli, ¿e mo¿e robiæ, co mu siê ¿ywnie podoba?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//Dobrze, ale co tu siê dzieje?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//A co, palisada jest skoñczona? A mo¿e w kanionie nie roi siê ju¿ od potworów? Wszyscy maj¹ to gdzieœ i le¿¹ brzuchem do góry!
	GREGISBACK = TRUE;
	if(!Npc_IsDead(francis))
	{
		AI_TurnToNPC(self,francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//To wszystko, co uda³o ci siê zrobiæ, Francis?
		if(c_bodystatecontains(francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//Z³aŸ z mojej ³awki! I to ju¿!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//A ty? Co takiego zrobi³eœ?
	Info_ClearChoices(dia_addon_greg_imnew);
	Info_AddChoice(dia_addon_greg_imnew,"Nie by³o tego zbyt wiele.",dia_addon_greg_imnew_nich);
	if((Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1) && Npc_IsDead(beachshadowbeast1) && (MIS_ADDON_MORGANLURKER != 0)) || (c_towerbanditsdead() == TRUE))
	{
		Info_AddChoice(dia_addon_greg_imnew,"Pracowa³em.",dia_addon_greg_imnew_turm);
	};
};

func void b_userakebilanz()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//Nie myœl, ¿e zapomnê o tym, co jesteœ mi winien!
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//Na ca³ej wyspie zakopa³em rzeczy warte parê setek sztuk z³ota.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//A ty oczywiœcie wszystko sobie przyw³aszczy³eœ, co?
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//Bêdziesz musia³ odpracowaæ swój d³ug.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//Teraz poznasz prawdziwe znaczenie s³owa "praca".
	};
	if(!Npc_IsDead(francis))
	{
		Npc_ExchangeRoutine(francis,"GREGISBACK");
		AI_StartState(francis,zs_saw,1,"ADW_PIRATECAMP_BEACH_19");
		FRANCIS_AUSGESCHISSEN = TRUE;
	};
	Info_ClearChoices(dia_addon_greg_imnew);
};

func void dia_addon_greg_imnew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//Nie by³o tego zbyt wiele.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//Niewa¿ne. Nied³ugo ci coœ wynajdê, ch³opcze.
	b_userakebilanz();
};

func void dia_addon_greg_imnew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//Pracowa³em.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//Co takiego?
	if(c_towerbanditsdead() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//Pozby³em siê bandytów z wie¿y.
	};
	if(Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1) && (MIS_ADDON_MORGANLURKER != 0))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//Pla¿a na pó³nocy jest ju¿ bezpieczna.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//Dobrze. Ale to i tak dopiero pocz¹tek.
	b_userakebilanz();
};


instance DIA_ADDON_GREG_JOINPIRATES(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_joinpirates_condition;
	information = dia_addon_greg_joinpirates_info;
	permanent = FALSE;
	description = "Co mam zrobiæ?";
};


func int dia_addon_greg_joinpirates_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_imnew) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_joinpirates_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//Co mam zrobiæ?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//Najpierw musimy doprowadziæ to miejsce do porz¹dku.
	if(Npc_IsDead(morgan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//Morgan, ten obibok, bêdzie pi³owa³ deski.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//A ty przejmiesz jego robotê i oczyœcisz kanion z tych cholernych stworów.
	MIS_ADDON_GREG_CLEARCANYON = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_CLEARCANYON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CLEARCANYON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg chce, ¿ebym przej¹³ robotê po Morganie i oczyœci³ kanion z potworów.");
	Info_ClearChoices(dia_addon_greg_joinpirates);
	Info_AddChoice(dia_addon_greg_joinpirates,"No to idê.",dia_addon_greg_joinpirates_leave);
	if((Npc_IsDead(brandon) == FALSE) || (Npc_IsDead(matt) == FALSE))
	{
		Info_AddChoice(dia_addon_greg_joinpirates,"Mam tam pójœæ sam?",dia_addon_greg_joinpirates_compadres);
	};
	Info_AddChoice(dia_addon_greg_joinpirates,"O jakich stworach mówi³eœ?",dia_addon_greg_joinpirates_clearcanyon);
};

func void dia_addon_greg_joinpirates_leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//No to idê.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//Chwila. Od teraz jesteœ jednym z nas.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//Za³ó¿ jakiœ porz¹dny strój, zanim ruszysz na polowanie.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//To jeden z naszych pancerzy. Powinien pasowaæ na ciebie.
	CreateInvItems(self,itar_pir_m_addon,1);
	b_giveinvitems(self,other,itar_pir_m_addon,1);
	AI_EquipArmor(hero,itar_pir_m_addon);
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//I nie oci¹gaj siê z robot¹.
	Info_ClearChoices(dia_addon_greg_joinpirates);
};

func void dia_addon_greg_joinpirates_compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//Mam tam pójœæ sam?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//Mo¿esz wzi¹æ paru ch³opaków, jeœli chcesz.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//Powinni uczciwie popracowaæ, zamiast siê leniæ.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg powiedzia³, ¿e mogê wzi¹æ z sob¹ czêœæ ch³opaków.");
};

func void dia_addon_greg_joinpirates_clearcanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//O jakich stworach mówi³eœ?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//O brzytwiakach. Co prawda siedz¹ w kanionie, ale czasami podchodz¹ pod nasz obóz.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//Nie chcê, ¿eby któryœ z moich ludzi zosta³ po¿arty.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Œcigamy tylko brzytwiaki.");
};


instance DIA_ADDON_GREG_ABOUTCANYON(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_aboutcanyon_condition;
	information = dia_addon_greg_aboutcanyon_info;
	permanent = TRUE;
	description = "W sprawie kanionu...";
};


func int dia_addon_greg_aboutcanyon_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_greg_aboutcanyon_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//W sprawie kanionu...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Tak, o co chodzi?
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
	if(c_allcanyonrazordead() == FALSE)
	{
		Info_AddChoice(dia_addon_greg_aboutcanyon,DIALOG_BACK,dia_addon_greg_aboutcanyon_back);
		if((Npc_IsDead(brandon) == FALSE) || (Npc_IsDead(matt) == FALSE))
		{
			Info_AddChoice(dia_addon_greg_aboutcanyon,"Ktoœ mo¿e mi w tym pomóc?",dia_addon_greg_aboutcanyon_compadres);
		};
		Info_AddChoice(dia_addon_greg_aboutcanyon,"Jakich stworów mam siê pozbyæ?",dia_addon_greg_aboutcanyon_job);
	}
	else
	{
		Info_AddChoice(dia_addon_greg_aboutcanyon,"Pozby³em siê wszystkich brzytwiaków.",dia_addon_greg_aboutcanyon_razorsdead);
	};
};

func void dia_addon_greg_aboutcanyon_back()
{
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//Ktoœ mo¿e mi w tym pomóc?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//WeŸ paru ch³opaków ze sob¹.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//I tak tylko siê obijaj¹.
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//Jakich stworów mam siê pozbyæ?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//Przede wszystkim zabij brzytwiaki. Reszta mena¿erii jest stosunkowo bezpieczna.
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_razorsdead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//Pozby³em siê wszystkich brzytwiaków.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//Dobrze, bardzo dobrze... Widaæ, ¿e potrafisz to i owo.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg by³ prawie pod wra¿eniem, kiedy dowiedzia³ siê, ¿e zabi³em wszystkie brzytwiaki w kanionie.");
	MIS_ADDON_GREG_CLEARCANYON = LOG_SUCCESS;
	b_addon_piratesgohome();
	b_giveplayerxp(XP_ADDON_CLEARCANYON);
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};


instance DIA_ADDON_GREG_BANDITARMOR(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditarmor_condition;
	information = dia_addon_greg_banditarmor_info;
	permanent = TRUE;
	description = "Potrzebujê pancerza, jaki nosz¹ bandyci.";
};


func int dia_addon_greg_banditarmor_condition()
{
	if(MIS_GREG_SCOUTBANDITS == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditarmor_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//Potrzebujê pancerza, jaki nosz¹ bandyci.
	if(MIS_ADDON_GREG_CLEARCANYON != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//Musisz na niego zas³u¿yæ. Poka¿, co potrafisz, to pogadamy.
		if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//Najpierw za³atw wszystkie brzytwiaki.
		};
		b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Greg chce, ¿ebym pomóg³ mu wprowadziæ trochê wigoru do obozu. Potem mo¿emy porozmawiaæ o zbroi.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//NieŸle ci idzie.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//Chcia³em, ¿eby Bones za³o¿y³ bandycki pancerz i szpiegowa³ tych psubratów...
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//Ale s¹dzê, ¿e ty siê lepiej nadasz do takiej roboty.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//Mo¿e nawet uda ci siê wyjœæ stamt¹d w jednym kawa³ku.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//Pogadaj z Bonesem, to da ci pancerz. Na³ó¿ go i idŸ do obozu bandytów.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//Chcia³bym wiedzieæ, po co te œwinie sprowadzi³y siê do doliny.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//Tak jest, kapitanie!
		b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Po zabiciu wszystkich brzytwiaków w kanionie mogê odebraæ moj¹ zbrojê od Bonesa.");
		Log_CreateTopic(TOPIC_ADDON_SCOUTBANDITS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_SCOUTBANDITS,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,"Mam siê dowiedzieæ dla Grega, dlaczego w³aœciwie bandyci przybyli do doliny.");
		MIS_GREG_SCOUTBANDITS = LOG_RUNNING;
	};
};


instance DIA_ADDON_GREG_AUFTRAEGE2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_auftraege2_condition;
	information = dia_addon_greg_auftraege2_info;
	description = "Masz dla mnie jeszcze jakieœ zadanie?";
};


func int dia_addon_greg_auftraege2_condition()
{
	if((MIS_GREG_SCOUTBANDITS != 0) && ((c_towerbanditsdead() == FALSE) || ((Npc_IsDead(beachlurker1) == FALSE) && (Npc_IsDead(beachlurker2) == FALSE) && (Npc_IsDead(beachlurker3) == FALSE) && (Npc_IsDead(beachwaran1) == FALSE) && (Npc_IsDead(beachwaran2) == FALSE) && (Npc_IsDead(beachshadowbeast1) == FALSE))))
	{
		return TRUE;
	};
};

func void dia_addon_greg_auftraege2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//Masz dla mnie jeszcze jakieœ zadanie?
	if((Npc_IsDead(beachlurker1) == FALSE) && (Npc_IsDead(beachlurker2) == FALSE) && (Npc_IsDead(beachlurker3) == FALSE) && (Npc_IsDead(beachwaran1) == FALSE) && (Npc_IsDead(beachwaran2) == FALSE) && (Npc_IsDead(beachshadowbeast1) == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//Pla¿a na pó³nocy wci¹¿ jest pe³na stworów.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//Morgan jak zwykle siê obija.
		Log_CreateTopic(TOPIC_ADDON_MORGANBEACH,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_MORGANBEACH,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Greg chce, ¿ebym siê zaj¹³ pla¿¹. Pe³no na niej ró¿nych stworów i trzeba j¹ oczyœciæ.");
		MIS_ADDON_MORGANLURKER = LOG_RUNNING;
	};
	if(c_towerbanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//W wie¿y stoj¹cej wœród po³udniowych klifów wci¹¿ gnie¿d¿¹ siê bandyci.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//W sumie to Francis mia³ siê tym zaj¹æ.
		Log_CreateTopic(TOPIC_ADDON_BANDITSTOWER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_BANDITSTOWER,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_BANDITSTOWER,"Greg chce, ¿ebym przepêdzi³ bandytów z wie¿y na po³udnie od obozu.");
		MIS_HENRY_FREEBDTTOWER = LOG_RUNNING;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//Ale jeœli chcesz, to mo¿esz za³atwiæ i tê sprawê.
};


instance DIA_ADDON_GREG_SAUBER2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_sauber2_condition;
	information = dia_addon_greg_sauber2_info;
	description = "Pó³nocna pla¿a jest ju¿ bezpieczna.";
};


func int dia_addon_greg_sauber2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_auftraege2) && Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1))
	{
		return TRUE;
	};
};

func void dia_addon_greg_sauber2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//Pó³nocna pla¿a jest ju¿ bezpieczna.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//Wspaniale. Oto twoja nagroda.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	b_logentry(TOPIC_ADDON_MORGANBEACH,"Powiedzia³em Gregowi, ¿e oczyœci³em pó³nocn¹ pla¿ê.");
	MIS_ADDON_MORGANLURKER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MORGAN_LURKERPLATT);
};


instance DIA_ADDON_GREG_BANDITPLATT2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditplatt2_condition;
	information = dia_addon_greg_banditplatt2_info;
	description = "Bandyci ju¿ nie wróc¹ do wie¿y.";
};


func int dia_addon_greg_banditplatt2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_auftraege2) && (c_towerbanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditplatt2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//Bandyci ju¿ nie wróc¹ do wie¿y.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//Doskonale. Œwietnie siê spisa³eœ. Oto zap³ata za twój trud.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	b_logentry(TOPIC_ADDON_BANDITSTOWER,"Bandyci w wie¿y nie ¿yj¹. Greg jest bardzo zadowolony.");
	MIS_HENRY_FREEBDTTOWER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HENRY_FREEBDTTOWER);
};


instance DIA_ADDON_GREG_BANDITGOLDMINE(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditgoldmine_condition;
	information = dia_addon_greg_banditgoldmine_info;
	permanent = TRUE;
	description = "Bandyci odkryli kopalniê z³ota.";
};


func int dia_addon_greg_banditgoldmine_condition()
{
	if((SC_KNOWSRAVENSGOLDMINE == TRUE) && (MIS_GREG_SCOUTBANDITS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditgoldmine_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//Bandyci odkryli kopalniê z³ota.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//Wiedzia³em! Dlatego tylu ich tu przylaz³o!
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//Nikt nie mieszka³by wœród tych bagien roj¹cych siê od potworów, jeœli nie mia³by naprawdê solidnego powodu.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//Dobra robota. Tu jest coœ dla ciebie.
	b_giveinvitems(self,other,itri_addon_str_01,1);
	b_logentry(TOPIC_ADDON_SCOUTBANDITS,"Poinformowa³em Grega o kopalni z³ota.");
	MIS_GREG_SCOUTBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_GREG_SCOUTBANDITS);
};


instance DIA_ADDON_GREG_WHOAREYOU(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 2;
	condition = dia_addon_greg_whoareyou_condition;
	information = dia_addon_greg_whoareyou_info;
	permanent = FALSE;
	description = "Kim jesteœ?";
};


func int dia_addon_greg_whoareyou_condition()
{
	if((PLAYERTALKEDTOGREGNW == FALSE) && (SC_MEETSGREGTIME == 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_whoareyou_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//Mam na imiê Greg i jestem przywódc¹ tej garstki ludzi.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//Zadowolony?
};


instance DIA_ADDON_GREG_NICETOSEEYOU(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_nicetoseeyou_condition;
	information = dia_addon_greg_nicetoseeyou_info;
	permanent = FALSE;
	description = "Jak siê tu dosta³eœ?";
};


func int dia_addon_greg_nicetoseeyou_condition()
{
	if((PLAYERTALKEDTOGREGNW == TRUE) && (MIS_GREG_SCOUTBANDITS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nicetoseeyou_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//Jak siê tu dosta³eœ?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//Nie spodziewa³eœ siê mnie, co?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//¯eby nie by³o niedomówieñ - ja jestem Greg, a to jest mój obóz.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//Wszystko gra?
};


instance DIA_ADDON_GREG_STORY(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 99;
	condition = dia_addon_greg_story_condition;
	information = dia_addon_greg_story_info;
	permanent = TRUE;
	description = "Interesuje mnie jeszcze jedna rzecz.";
};


func int dia_addon_greg_story_condition()
{
	if(((Npc_KnowsInfo(other,dia_addon_greg_whoareyou) == TRUE) || (Npc_KnowsInfo(other,dia_addon_greg_nicetoseeyou) == TRUE)) && (MIS_GREG_SCOUTBANDITS != 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_story_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//Interesuje mnie jeszcze jedna rzecz.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//Co znowu?
	Info_ClearChoices(dia_addon_greg_story);
	Info_AddChoice(dia_addon_greg_story,DIALOG_BACK,dia_addon_greg_story_back);
	Info_AddChoice(dia_addon_greg_story,"Jak siê tu dosta³eœ?",dia_addon_greg_story_way);
	Info_AddChoice(dia_addon_greg_story,"Gdzie jest twój statek?",dia_addon_greg_story_ship);
	if(RAVENISDEAD == FALSE)
	{
		Info_AddChoice(dia_addon_greg_story,"Co wiesz o Kruku?",dia_addon_greg_story_raven);
	};
};

func void dia_addon_greg_story_back()
{
	Info_ClearChoices(dia_addon_greg_story);
};

func void dia_addon_greg_story_way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//Jak siê tu dosta³eœ?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//Uda³o mi siê znaleŸæ tunel. W starej piramidzie pilnowanej przez dwóch magów.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//Niby magowie, ale nawet nie zorientowali siê, ¿e tam by³em.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//Najpierw myœla³em, ¿e to grobowiec. Chcia³em sprawdziæ, czy nie ma w nim czegoœ wartoœciowego.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//I tak sobie szed³em, a¿ nagle znalaz³em siê w mojej ukochanej dolinie.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//A ju¿ myœla³em, ¿e przez resztê ¿ycia bêdê siê ukrywa³ przed stra¿¹.
};

func void dia_addon_greg_story_ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//Gdzie jest twój statek?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//Nie uwierzysz. Od miesiêcy nie widzia³em w okolicy ¿adnego statku.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//Od miesiêcy, wyobra¿asz sobie? I kiedy wreszcie jakiœ siê pojawi³, to królewski okrêt wojenny!
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//Pe³en paladynów, od topu po kil.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//Jeœli ju¿ mieæ pecha, to na ca³ego...
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//£atwo ci mówiæ. Roznieœli nas w drzazgi jak pust¹ skrzyniê po owocach. Z ca³ej za³ogi tylko ja dotar³em ¿ywy do brzegu.
};

func void dia_addon_greg_story_raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//Co wiesz o Kruku?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//Z tego, co mi wiadomo, by³ jednym z magnatów. Wielka szycha w Kolonii.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//Nie mam pojêcia, co teraz porabia, ani czemu jego ludzie poszli za nim.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//Ale wierz mi, na pewno coœ knuje. Nie nale¿y do tych, co zaszywaj¹ siê na bagnach i chc¹, ¿eby œwiat o nich zapomnia³.
};


instance DIA_ADDON_GREG_RAVENDEAD(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 2;
	condition = dia_addon_greg_ravendead_condition;
	information = dia_addon_greg_ravendead_info;
	description = "Kruk jest histori¹.";
};


func int dia_addon_greg_ravendead_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_ravendead_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//Kruk jest histori¹.
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//Niech mnie diabli porw¹! Nie spodziewa³em siê tego. Musia³eœ go nieŸle zaskoczyæ!
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//Oto 500 sztuk z³ota. Nale¿¹ ci siê.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//Masz charakter. Podobasz mi siê.
	b_giveplayerxp(XP_ADDON_GREGRAVENLOHN);
};

