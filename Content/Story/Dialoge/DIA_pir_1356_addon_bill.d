
instance DIA_ADDON_BILL_EXIT(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 999;
	condition = dia_addon_bill_exit_condition;
	information = dia_addon_bill_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bill_exit_condition()
{
	return TRUE;
};

func void dia_addon_bill_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BILL_PICKPOCKET(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 900;
	condition = dia_addon_bill_pickpocket_condition;
	information = dia_addon_bill_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_bill_pickpocket_condition()
{
	return c_beklauen(80,205);
};

func void dia_addon_bill_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bill_pickpocket);
	Info_AddChoice(dia_addon_bill_pickpocket,DIALOG_BACK,dia_addon_bill_pickpocket_back);
	Info_AddChoice(dia_addon_bill_pickpocket,DIALOG_PICKPOCKET,dia_addon_bill_pickpocket_doit);
};

func void dia_addon_bill_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bill_pickpocket);
};

func void dia_addon_bill_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bill_pickpocket);
};


instance DIA_ADDON_BILL_HELLO(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 1;
	condition = dia_addon_bill_hello_condition;
	information = dia_addon_bill_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bill_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Hello_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_01");	//Co siê dzieje? Henry ciê tu przys³a³?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_02");	//Powiedz mu, ¿e nied³ugo dostanie swoje deski.
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_03");	//Jeœli go to nie urz¹dza, to niech sam je sobie pi³uje.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BILL_PLANKS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 2;
	condition = dia_addon_bill_planks_condition;
	information = dia_addon_bill_planks_info;
	description = "Co robisz z tymi deskami?";
};


func int dia_addon_bill_planks_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_bill_planks_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Planks_15_00");	//Co robisz z tymi deskami?
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_01");	//A jak s¹dzisz? S¹ potrzebne do budowy palisady, oœle!
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_02");	//Greg uzna³, ¿e warto lepiej ufortyfikowaæ nasz obóz.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_03");	//Ale uwa¿am, ¿e nie ma to wiêkszego sensu.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_04");	//Jeœli bandyci nas zaatakuj¹, to ta œmieszna palisada ich nie zatrzyma.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_05");	//Powinniœmy byli pozbyæ siê ich dawno temu.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_06");	//Gdybym wiedzia³, co tu siê bêdzie dzia³o, zosta³bym w Khorinis.
};


var int bill_perm_once;

instance DIA_ADDON_BILL_PERM(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 4;
	condition = dia_addon_bill_perm_condition;
	information = dia_addon_bill_perm_info;
	permanent = TRUE;
	description = "Mogê ci pomóc w pi³owaniu?";
};


func int dia_addon_bill_perm_condition()
{
	if((GREGISBACK == FALSE) && Npc_WasInState(self,zs_saw))
	{
		return TRUE;
	};
};

func void dia_addon_bill_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm_15_00");	//Mogê ci pomóc w pi³owaniu?
	AI_Output(self,other,"DIA_Addon_Bill_Perm_03_01");	//Nie trzeba, dam sobie radê.
	if(BILL_PERM_ONCE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm_03_02");	//Niedawno przy³¹czy³em siê do obozu i jeœli pozwolê, ¿eby inni za mnie pracowali, bêd¹ mieli mnie za lenia, rozumiesz?
		BILL_PERM_ONCE = TRUE;
	};
};


instance DIA_ADDON_BILL_PERM2(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 5;
	condition = dia_addon_bill_perm2_condition;
	information = dia_addon_bill_perm2_info;
	permanent = TRUE;
	description = "Co teraz bêdziesz robiæ?";
};


func int dia_addon_bill_perm2_condition()
{
	if(GREGISBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bill_perm2_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm2_15_00");	//Co teraz bêdziesz robiæ?
	AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_01");	//Muszê chwilê odpocz¹æ.
	if(!Npc_IsDead(francis))
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_02");	//Francis zajmuje siê moj¹ dawn¹ robot¹.
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_03");	//Jeœli o mnie chodzi, to mo¿e pi³owaæ a¿ do koñca œwiata.
	};
};


instance DIA_ADDON_BILL_ANGUSNHANK(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 11;
	condition = dia_addon_bill_angusnhank_condition;
	information = dia_addon_bill_angusnhank_info;
	permanent = FALSE;
	description = "Szukam Angusa i Hanka.";
};


func int dia_addon_bill_angusnhank_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_angushank) && Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_bill_angusnhank_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_00");	//Szukam Angusa i Hanka.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_01");	//Nie mam pojêcia, gdzie teraz s¹ - mo¿e dopadli ich bandyci?
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_02");	//Byliœcie przyjació³mi, prawda?
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_03");	//Wiem tylko, ¿e chcieli spotkaæ siê z bandytami w jednej z pobliskich jaskiñ.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_04");	//Pewnie gdzieœ na wschód od obozu.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_05");	//Ale nie wiem dok³adnie gdzie. Nigdy tam nie by³em.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_06");	//Najlepiej bêdzie, jeœli zapytasz o to Jacka Aligatora. On wie wszystko o okolicy.
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Angus i Hank siedzieli w jaskini na wschód od obozu. Jack Aligator mo¿e wiedzieæ wiêcej na ten temat.");
};


instance DIA_ADDON_BILL_FOUNDFRIENDS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 12;
	condition = dia_addon_bill_foundfriends_condition;
	information = dia_addon_bill_foundfriends_info;
	permanent = FALSE;
	description = "Znalaz³em twoich przyjació³.";
};


func int dia_addon_bill_foundfriends_condition()
{
	if(!Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_bill_foundfriends_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_00");	//Znalaz³em twoich przyjació³.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_01");	//No i? Gdzie s¹?
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_02");	//Nie ¿yj¹.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_03");	//To sprawka tych cholernych bandytów!
	if(SC_KNOWS_JUANMURDEREDANGUS == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_06");	//Byæ mo¿e.
	};
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_04");	//Przeklête ³otry! Niech ich piek³o poch³onie!
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_05");	//Du¿o bym da³, ¿eby dowiedzieæ siê, kto jest temu winien...
	MIS_ADDON_BILL_SEARCHANGUSMURDER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KILLJUAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KILLJUAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLJUAN,"Bill by³ wœciek³y, kiedy powiedzia³em mu o œmierci Angusa i Hanka. Chce znaæ imiê mordercy.");
};


instance DIA_ADDON_BILL_JUANMURDER(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 13;
	condition = dia_addon_bill_juanmurder_condition;
	information = dia_addon_bill_juanmurder_info;
	description = "Wiem, kto zamordowa³ Angusa i Hanka.";
};


func int dia_addon_bill_juanmurder_condition()
{
	if((MIS_ADDON_BILL_SEARCHANGUSMURDER == LOG_RUNNING) && (SC_KNOWS_JUANMURDEREDANGUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_juanmurder_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_00");	//Wiem, kto zamordowa³ Angusa i Hanka.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_01");	//Kto? Mów, kto to zrobi³!
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_02");	//To jeden z bandytów - Juan.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_03");	//Musisz siê go pozbyæ, rozumiesz?
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_04");	//Ta zbrodnia nie mo¿e ujœæ mu p³azem!
	b_logentry(TOPIC_ADDON_KILLJUAN,"Mam zabiæ Juana, ¿eby pomœciæ Angusa i Hanka.");
};


instance DIA_ADDON_BILL_KILLEDESTEBAN(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 14;
	condition = dia_addon_bill_killedesteban_condition;
	information = dia_addon_bill_killedesteban_info;
	description = "Juan ju¿ nie bêdzie sprawia³ k³opotów.";
};


func int dia_addon_bill_killedesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_juanmurder) && Npc_IsDead(juan))
	{
		return TRUE;
	};
};

func void dia_addon_bill_killedesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_00");	//Juan ju¿ nie bêdzie sprawia³ k³opotów.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_01");	//Mów, jak to siê sta³o? Bardzo cierpia³?
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_02");	//Lepiej o tym nie mówmy.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_03");	//W sumie racja. Wa¿ne, ¿e ta œwinia niczego ju¿ nie zrobi.
	b_logentry(TOPIC_ADDON_KILLJUAN,"Juan zosta³ za³atwiony, co ucieszy³o Billa.");
	MIS_ADDON_BILL_SEARCHANGUSMURDER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_BILL_KILLANGUSMURDER);
};


instance DIA_ADDON_BILL_KHORINIS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 21;
	condition = dia_addon_bill_khorinis_condition;
	information = dia_addon_bill_khorinis_info;
	description = "By³eœ w Khorinis?";
};


func int dia_addon_bill_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_planks))
	{
		return TRUE;
	};
};

func void dia_addon_bill_khorinis_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Khorinis_15_00");	//By³eœ w Khorinis?
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_01");	//Tak. Trochê tam siê krêci³em, podcinaj¹c sakiewki i zajmuj¹c siê drobnym szwindlem.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_02");	//Ale im mniej statków zawija³o do portu, tym gorzej szed³ interes.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_03");	//Zabawa ze stra¿¹ przesta³a siê op³acaæ.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_04");	//I tak do³¹czy³em do Grega, a teraz siedzê tutaj.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_05");	//Ca³y dzieñ pi³ujê drewno na palisadê, która i tak jest bezu¿yteczna.
	};
};


instance DIA_ADDON_BILL_TEACHPLAYER(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 22;
	condition = dia_addon_bill_teachplayer_condition;
	information = dia_addon_bill_teachplayer_info;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_addon_bill_teachplayer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_khorinis))
	{
		return TRUE;
	};
};

func void dia_addon_bill_teachplayer_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_TeachPlayer_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_01");	//Mogê ci pokazaæ, jak opró¿niaæ ludziom kieszenie tak, aby tego nie zauwa¿yli.
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_02");	//Ale musisz byæ co najmniej œrednio zrêczny, bo inaczej nie ma sensu zaczynaæ nauki.
	BILL_ADDON_TEACHPICKPOCKET = TRUE;
};


instance DIA_ADDON_BILL_LEARNTALENT(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 23;
	condition = dia_addon_bill_learntalent_condition;
	information = dia_addon_bill_learntalent_info;
	permanent = TRUE;
	description = "Poka¿ mi, jak okradaæ innych. (10 PN)";
};


func int dia_addon_bill_learntalent_condition()
{
	if((BILL_ADDON_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_learntalent_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_00");	//Poka¿ mi, jak okradaæ innych.
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_01");	//Jeœli chcesz kogoœ okraœæ, musisz sprawiæ, by poczu³ siê bezpiecznie.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_02");	//Zawsze wci¹gam ofiarê w pogawêdkê. Dzia³a bez pud³a.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_03");	//Kiedy zabierasz siê za kradzie¿, upewnij siê, ¿e ofiara niczego nie zauwa¿y³a.
			AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_05");	//Coœ jeszcze?
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_06");	//Tak. Potrenuj trochê zrêcznoœæ, jako ¿e zrêczniejszemu z³odziejowi ³atwiej spostrzec dobr¹ okazjê.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_07");	//I ³atwiej unikn¹æ z³apania na gor¹cym uczynku.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_08");	//Przynajmniej w teorii.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_09");	//Zapomnij o tym. Jesteœ zbyt niezdarny!
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_10");	//Potrenuj zrêcznoœæ albo znajdŸ sobie lepszego nauczyciela.
	};
};

