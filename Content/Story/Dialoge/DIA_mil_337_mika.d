
instance DIA_MIKA_EXIT(C_INFO)
{
	npc = mil_337_mika;
	nr = 999;
	condition = dia_mika_exit_condition;
	information = dia_mika_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mika_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_mika_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_REFUSE(C_INFO)
{
	npc = mil_337_mika;
	nr = 1;
	condition = dia_mika_refuse_condition;
	information = dia_mika_refuse_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mika_refuse_condition()
{
	if(Npc_IsInState(self,zs_talk) && (lares.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_mika_refuse_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_WOHIN(C_INFO)
{
	npc = mil_337_mika;
	nr = 4;
	condition = dia_mika_wohin_condition;
	information = dia_mika_wohin_info;
	important = TRUE;
};


func int dia_mika_wohin_condition()
{
	if(lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mika_wohin_info()
{
	AI_Output(self,other,"DIA_Mika_WOHIN_12_00");	//Hej, czekaj, nie tak szybko. Samotna wêdrówka mo¿e siê dla ciebie Ÿle skoñczyæ, to niebezpieczne okolice. Sk¹d idziesz?
	Info_ClearChoices(dia_mika_wohin);
	Info_AddChoice(dia_mika_wohin,"Nie twój interes.",dia_mika_wohin_weg);
	Info_AddChoice(dia_mika_wohin,"Z jednej z farm.",dia_mika_wohin_bauern);
	Info_AddChoice(dia_mika_wohin,"Z miasta!",dia_mika_wohin_stadt);
};

func void dia_mika_wohin_stadt()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_stadt_15_00");	//Z miasta!
	AI_Output(self,other,"DIA_Mika_WOHIN_stadt_12_01");	//Proszê, proszê. I zapuœci³eœ siê a¿ tutaj, tak daleko od domu?
	Info_ClearChoices(dia_mika_wohin);
};

func void dia_mika_wohin_bauern()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_Bauern_15_00");	//Z jednej z farm.
	AI_Output(self,other,"DIA_Mika_WOHIN_Bauern_12_01");	//Farmer? Hmmm... Wiêc nie powinieneœ samotnie wêdrowaæ przez tak niebezpieczn¹ okolicê. Kto wie, co mo¿e ci siê przydarzyæ.
	Info_ClearChoices(dia_mika_wohin);
};

func void dia_mika_wohin_weg()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_weg_15_00");	//To nie twoja sprawa.
	AI_Output(self,other,"DIA_Mika_WOHIN_weg_12_01");	//Skoro tak twierdzisz. Tylko ¿ebyœ siê nie zdziwi³, jeœli przydarzy ci siê coœ bardzo niemi³ego. ¯yczê udanego spaceru.
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_WASGEFAEHRLICH(C_INFO)
{
	npc = mil_337_mika;
	nr = 5;
	condition = dia_mika_wasgefaehrlich_condition;
	information = dia_mika_wasgefaehrlich_info;
	description = "Co to za straszliwe niebezpieczeñstwa?";
};


func int dia_mika_wasgefaehrlich_condition()
{
	return TRUE;
};

func void dia_mika_wasgefaehrlich_info()
{
	AI_Output(other,self,"DIA_Mika_WASGEFAEHRLICH_15_00");	//Co to za straszliwe niebezpieczeñstwa?
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_01");	//Wiele rzeczy.
	if(other.protection[PROT_EDGE] < itar_leather_l.protection[PROT_EDGE])
	{
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_02");	//Na przyk³ad bandyci. Takiego s³abeusza jak ty zjedz¹ ¿ywcem na œniadanie.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_03");	//Jeœli nie wpadniesz w rêce bandytów, zajm¹ siê tob¹ dzikie bestie i najemnicy grasuj¹cy w tych lasach.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_04");	//ZnajdŸ sobie najpierw chocia¿ jak¹œ przyzwoit¹ zbrojê.
	};
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_05");	//Za³o¿ê siê, ¿e bêdziesz krzyczeæ o pomoc, jeszcze zanim dotrzesz do nastêpnego zakrêtu.
};


instance DIA_MIKA_WASKOSTETHILFE(C_INFO)
{
	npc = mil_337_mika;
	nr = 6;
	condition = dia_mika_waskostethilfe_condition;
	information = dia_mika_waskostethilfe_info;
	description = "Przypuœæmy, ¿e bêdê potrzebowa³ twojej pomocy.";
};


func int dia_mika_waskostethilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_mika_wasgefaehrlich))
	{
		return TRUE;
	};
};

func void dia_mika_waskostethilfe_info()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_15_00");	//Przypuœæmy, ¿e bêdê potrzebowa³ twojej pomocy. Ile bêdzie mnie ona kosztowa³a?
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_01");	//Jestem skromnym s³ug¹ naszego Króla i nie sprawia mi radoœci wyzyskiwanie bezbronnych obywateli.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_02");	//Jednak skoro stawiasz sprawê w ten sposób, niewielkie wsparcie finansowe mog³oby dobrze zrobiæ naszym przysz³ym kontaktom handlowym.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_03");	//Na pocz¹tek 10 z³otych monet. Co o tym myœlisz?
	Info_ClearChoices(dia_mika_waskostethilfe);
	Info_AddChoice(dia_mika_waskostethilfe,"Muszê siê zastanowiæ.",dia_mika_waskostethilfe_nochnicht);
	Info_AddChoice(dia_mika_waskostethilfe,"Czemu nie? Oto twoje 10 sztuk z³ota.",dia_mika_waskostethilfe_ja);
};

func void dia_mika_waskostethilfe_ja()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_ja_15_00");	//Czemu nie? Oto twoje 10 sztuk z³ota.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_01");	//Wspaniale. Jeœli bêdziesz potrzebowa³ mojej pomocy, wiesz, gdzie mnie znaleŸæ.
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_02");	//Mam tylko jedn¹ proœbê: nie przybiegaj do mnie z ka¿dym nieistotnym drobiazgiem, rozumiesz?
		MIKA_HELPS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_03");	//Nie masz pieniêdzy. Mo¿e wiêc powinieneœ siê zastanowiæ, czy faktycznie potrzebujesz mojej pomocy.
	};
	AI_StopProcessInfos(self);
};

func void dia_mika_waskostethilfe_nochnicht()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_nochnicht_15_00");	//Pomyœlê o tym.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_nochnicht_12_01");	//Bardzo proszê. Mi³ej œmierci.
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_UEBERLEGT(C_INFO)
{
	npc = mil_337_mika;
	nr = 7;
	condition = dia_mika_ueberlegt_condition;
	information = dia_mika_ueberlegt_info;
	permanent = TRUE;
	description = "Zmieni³em zdanie. Oto 10 z³otych monet.";
};


func int dia_mika_ueberlegt_condition()
{
	if(Npc_KnowsInfo(other,dia_mika_waskostethilfe) && (MIKA_HELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_mika_ueberlegt_info()
{
	AI_Output(other,self,"DIA_Mika_UEBERLEGT_15_00");	//Zmieni³em zdanie. Oto 10 z³otych monet.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_01");	//Doskonale. Lepiej póŸno ni¿ wcale. A teraz?
		MIKA_HELPS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_02");	//Wróæ, kiedy ju¿ bêdziesz mia³ pieni¹dze.
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIKA_HILFE(C_INFO)
{
	npc = mil_337_mika;
	nr = 8;
	condition = dia_mika_hilfe_condition;
	information = dia_mika_hilfe_info;
	permanent = TRUE;
	description = "Potrzebujê pomocy.";
};


func int dia_mika_hilfe_condition()
{
	if(MIKA_HELPS == TRUE)
	{
		return TRUE;
	};
};

func void dia_mika_hilfe_info()
{
	AI_Output(other,self,"DIA_Mika_HILFE_15_00");	//Potrzebujê pomocy.
	AI_Output(self,other,"DIA_Mika_HILFE_12_01");	//Skoro tak twierdzisz... Co siê sta³o?
	Info_ClearChoices(dia_mika_hilfe);
	Info_AddChoice(dia_mika_hilfe,"Goni¹ mnie bandyci.",dia_mika_hilfe_schongut);
	Info_AddChoice(dia_mika_hilfe,"Atakuj¹ mnie potwory.",dia_mika_hilfe_monster);
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && ((AKILS_SLDSTILLTHERE == TRUE) || Npc_KnowsInfo(other,dia_sarah_bauern)))
	{
		Info_AddChoice(dia_mika_hilfe,"Farmer Akil zosta³ zaatakowany przez najemników.",dia_mika_hilfe_akil);
	};
};

func void dia_mika_hilfe_akil()
{
	AI_Output(other,self,"DIA_Mika_HILFE_Akil_15_00");	//Farmer Akil zosta³ zaatakowany przez najemników.
	AI_Output(self,other,"DIA_Mika_HILFE_Akil_12_01");	//Co? Ta ho³ota panoszy siê na farmie Akila? A zatem nie traæmy wiêcej czasu. Za mn¹.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Mika chce mi pomóc w rozwi¹zaniu problemu Akila z najemnikami.");
	Npc_ExchangeRoutine(self,"Akil");
};

func void dia_mika_hilfe_monster()
{
	AI_Output(other,self,"DIA_Mika_HILFE_monster_15_00");	//Atakuj¹ mnie potwory.
	AI_Output(self,other,"DIA_Mika_HILFE_monster_12_01");	//Ale w tej chwili nie widzê tu ¿adnych potworów. Na pewno wszystko zmyœli³eœ.
	AI_StopProcessInfos(self);
};

func void dia_mika_hilfe_schongut()
{
	AI_Output(other,self,"DIA_Mika_HILFE_schongut_15_00");	//Goni¹ mnie bandyci.
	AI_Output(self,other,"DIA_Mika_HILFE_schongut_12_01");	//Doprawdy? A gdzie siê podziali? Gdyby naprawdê ciê gonili, chyba by³oby ich widaæ, nie?
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_ZACK(C_INFO)
{
	npc = mil_337_mika;
	nr = 8;
	condition = dia_mika_zack_condition;
	information = dia_mika_zack_info;
	important = TRUE;
};


func int dia_mika_zack_condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 500) && (!Npc_IsDead(alvares) || !Npc_IsDead(engardo)))
	{
		return TRUE;
	};
};

func void dia_mika_zack_info()
{
	AI_Output(self,other,"DIA_Mika_Zack_12_00");	//A teraz zobacz, jak to dzia³a.
	Info_AddChoice(dia_mika_zack,DIALOG_ENDE,dia_mika_zack_los);
};

func void dia_mika_zack_los()
{
	AI_StopProcessInfos(self);
	if(!Npc_IsDead(alvares))
	{
		alvares.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	if(!Npc_IsDead(engardo))
	{
		engardo.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_MIKA_WIEDERNACHHAUSE(C_INFO)
{
	npc = mil_337_mika;
	nr = 9;
	condition = dia_mika_wiedernachhause_condition;
	information = dia_mika_wiedernachhause_info;
	important = TRUE;
};


func int dia_mika_wiedernachhause_condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 10000) && Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_mika_wiedernachhause_info()
{
	AI_Output(self,other,"DIA_Mika_WIEDERNACHHAUSE_12_00");	//Dobrze, wystarczy. Bêdê siê zmywa³.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MIKA_KAP3_EXIT(C_INFO)
{
	npc = mil_337_mika;
	nr = 999;
	condition = dia_mika_kap3_exit_condition;
	information = dia_mika_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mika_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_mika_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_KAP3U4U5_PERM(C_INFO)
{
	npc = mil_337_mika;
	nr = 39;
	condition = dia_mika_kap3u4u5_perm_condition;
	information = dia_mika_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_mika_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_mika_wohin) && Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_mika_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Mika_Kap3u4u5_PERM_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Mika_Kap3u4u5_PERM_12_01");	//Wci¹¿ jesteœ ¿ywy. Zadziwiaj¹ce.
};


instance DIA_MIKA_PICKPOCKET(C_INFO)
{
	npc = mil_337_mika;
	nr = 900;
	condition = dia_mika_pickpocket_condition;
	information = dia_mika_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mika_pickpocket_condition()
{
	return c_beklauen(65,75);
};

func void dia_mika_pickpocket_info()
{
	Info_ClearChoices(dia_mika_pickpocket);
	Info_AddChoice(dia_mika_pickpocket,DIALOG_BACK,dia_mika_pickpocket_back);
	Info_AddChoice(dia_mika_pickpocket,DIALOG_PICKPOCKET,dia_mika_pickpocket_doit);
};

func void dia_mika_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mika_pickpocket);
};

func void dia_mika_pickpocket_back()
{
	Info_ClearChoices(dia_mika_pickpocket);
};

