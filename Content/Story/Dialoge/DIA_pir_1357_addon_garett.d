
instance DIA_ADDON_GARETT_EXIT(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 999;
	condition = dia_addon_garett_exit_condition;
	information = dia_addon_garett_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_garett_exit_condition()
{
	return TRUE;
};

func void dia_addon_garett_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GARETT_PICKPOCKET(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 900;
	condition = dia_addon_garett_pickpocket_condition;
	information = dia_addon_garett_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_garett_pickpocket_condition()
{
	return c_beklauen(36,55);
};

func void dia_addon_garett_pickpocket_info()
{
	Info_ClearChoices(dia_addon_garett_pickpocket);
	Info_AddChoice(dia_addon_garett_pickpocket,DIALOG_BACK,dia_addon_garett_pickpocket_back);
	Info_AddChoice(dia_addon_garett_pickpocket,DIALOG_PICKPOCKET,dia_addon_garett_pickpocket_doit);
};

func void dia_addon_garett_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_garett_pickpocket);
};

func void dia_addon_garett_pickpocket_back()
{
	Info_ClearChoices(dia_addon_garett_pickpocket);
};


instance DIA_ADDON_GARETT_ANHEUERN(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 1;
	condition = dia_addon_garett_anheuern_condition;
	information = dia_addon_garett_anheuern_info;
	important = TRUE;
};


func int dia_addon_garett_anheuern_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_00");	//Jeœli chcesz zapytaæ, czy do ciebie do³¹czê, to mo¿esz sobie darowaæ.
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_01");	//Jak s¹dzisz, co ch³opaki zrobi¹, kiedy sobie pójdê?
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_02");	//Po powrocie nie znalaz³bym ani jednej pe³nej skrzynki w swojej chacie!
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_03");	//Nie ma mowy. Zostanê tutaj i bêdê pilnowa³ zapasów.
};


instance DIA_ADDON_GARETT_HELLO(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 1;
	condition = dia_addon_garett_hello_condition;
	information = dia_addon_garett_hello_info;
	important = TRUE;
};


func int dia_addon_garett_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_00");	//Kogo my tu mamy? Ha, mam nadziejê, ¿e to nie kolejny bandzior na przeszpiegach.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_01");	//Nazywam siê Garett. Jeœli masz na coœ ochotê, najlepiej zwróæ siê do mnie.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_02");	//Mam tu wszystko, czego móg³byœ potrzebowaæ - wino, broñ i sporo innych rzeczy.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_03");	//Jeœli jednak szukasz dobrego trunku, lepiej zg³oœ siê do Samuela.
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_GARETTTRADE);
};


instance DIA_ADDON_GARETT_SAMUEL(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 2;
	condition = dia_addon_garett_samuel_condition;
	information = dia_addon_garett_samuel_info;
	permanent = FALSE;
	description = "Kim jest Samuel?";
};


func int dia_addon_garett_samuel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_hello) && (samuel.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_garett_samuel_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Samuel_15_00");	//Kim jest Samuel?
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_01");	//To nasz gorzelnik. Rezyduje w jaskini przy pla¿y.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_02");	//Nietrudno do niego trafiæ. Po prostu pod¹¿aj ca³y czas na pó³noc.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_03");	//Radzê zrobiæ ma³y zapas grogu.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_04");	//Niektórzy ch³opcy nie s¹ zbyt przyjaŸni w stosunku do nowych, ¿e siê tak wyra¿ê.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_05");	//A w takim wypadku grog mo¿e zdzia³aæ cuda.
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_SAMUELTRADE);
};


instance DIA_ADDON_GARETT_WAREZ(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 3;
	condition = dia_addon_garett_warez_condition;
	information = dia_addon_garett_warez_info;
	description = "Sk¹d bierzesz swoje towary?";
};


func int dia_addon_garett_warez_condition()
{
	return TRUE;
};

func void dia_addon_garett_warez_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Warez_15_00");	//Sk¹d bierzesz swoje towary?
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_01");	//Skip przynosi je z Khorinis, gdzie czasami bywa.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_02");	//Do niedawna sprzedawa³ je bandytom.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_03");	//Ale od czasu, gdy toczymy z nimi wojnê, wszystko trafia do mnie.
};


instance DIA_ADDON_GARETT_BANDITS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 3;
	condition = dia_addon_garett_bandits_condition;
	information = dia_addon_garett_bandits_info;
	description = "Co wiesz na temat bandytów?";
};


func int dia_addon_garett_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_warez))
	{
		return TRUE;
	};
};

func void dia_addon_garett_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Bandits_15_00");	//Co wiesz na temat bandytów?
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_01");	//Najlepiej zapytaj o to Skipa.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_02");	//Czêsto siê z nimi kontaktowa³, wiêc powinien sporo wiedzieæ o tych draniach.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_03");	//Greg rozkaza³ ostro reagowaæ na pojawienie siê choæby jednego bandyty w tym rejonie.
};


instance DIA_ADDON_GARETT_GREG(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 4;
	condition = dia_addon_garett_greg_condition;
	information = dia_addon_garett_greg_info;
	permanent = FALSE;
	description = "A ten wasz kapitan... Jaki on jest?";
};


func int dia_addon_garett_greg_condition()
{
	return TRUE;
};

func void dia_addon_garett_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Greg_15_00");	//A ten wasz kapitan... Jaki on jest?
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_01");	//Twarda z niego sztuka, bez dwóch zdañ.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_02");	//I sk¹py jak diabli.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_03");	//Pozwala naszemu skarbnikowi, Francisowi, p³aciæ nam tylko tyle, byœmy siê nie zbuntowali.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_04");	//A kiedy któryœ z nas zdobêdzie coœ naprawdê cennego, Greg przyw³aszcza to sobie.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_05");	//Kiedyœ zabra³em kompas z królewskiej fregaty.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_06");	//A Greg, rzecz jasna, odebra³ mi go.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_07");	//Ech... Pewnie go gdzieœ zakopa³ jak resztê swoich skarbów.
};


instance DIA_ADDON_GARETT_TIPS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 5;
	condition = dia_addon_garett_tips_condition;
	information = dia_addon_garett_tips_info;
	description = "Gdzie Greg móg³ zakopaæ kompas?";
};


func int dia_addon_garett_tips_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_greg))
	{
		return TRUE;
	};
};

func void dia_addon_garett_tips_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_00");	//Gdzie Greg móg³ zakopaæ kompas?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_01");	//Greg powiedzia³ mi, ¿e w ten kompas zagl¹da³a sama œmieræ. A potem mnie wyœmia³.
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_02");	//Coœ jeszcze?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_03");	//Wzd³u¿ po³udniowego wybrze¿a ci¹gnie siê pla¿a, do której mo¿na siê dostaæ wy³¹cznie drog¹ morsk¹.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_04");	//Podobno czêsto widywano na niej Grega. Mo¿e tam uda ci siê coœ znaleŸæ.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_05");	//Kiedyœ sam siê wybra³em w te rejony, ale za du¿o tam potworów.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_06");	//Jeœli chcesz mimo wszystko zaryzykowaæ, nie zapomnij wzi¹æ kilofa.
	MIS_ADDON_GARETT_BRINGKOMPASS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KOMPASS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KOMPASS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KOMPASS,"Greg zabra³ Garretowi cenny kompas. Garett podejrzewa, ¿e zakopa³ go gdzieœ na po³udniowej pla¿y.");
};


instance DIA_ADDON_GARETT_GIVEKOMPASS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 6;
	condition = dia_addon_garett_givekompass_condition;
	information = dia_addon_garett_givekompass_info;
	permanent = FALSE;
	description = "Oto twój kompas.";
};


func int dia_addon_garett_givekompass_condition()
{
	if((Npc_HasItems(other,itmi_addon_kompass_mis) >= 1) && (MIS_ADDON_GARETT_BRINGKOMPASS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_givekompass_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_GiveKompass_15_00");	//Oto twój kompas.
	if(b_giveinvitems(other,self,itmi_addon_kompass_mis,1))
	{
		Npc_RemoveInvItems(self,itmi_addon_kompass_mis,1);
	};
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_01");	//Ha, to rzeczywiœcie on! Nie spodziewa³em siê, ¿e ujrzê go ponownie.
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_02");	//Wielkie dziêki!
	if(Npc_HasItems(self,itbe_addon_prot_edgpoi) > 0)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_03");	//Tym razem Greg ju¿ go nie dostanie.
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_04");	//WeŸ w nagrodê ten pas. Jest sporo wart.
		b_giveinvitems(self,other,itbe_addon_prot_edgpoi,1);
	}
	else if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_05");	//Pamiêtasz ten pas, który ode mnie kupi³eœ?
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_06");	//Zap³aci³eœ za niego sporo, choæ, zwa¿ywszy na jego wartoœæ, na pewno nie przep³aci³eœ. Proszê, weŸ swoje pieni¹dze z powrotem i potraktuj go jako prezent.
		b_giveinvitems(self,other,itmi_gold,VALUE_ITBE_ADDON_PROT_EDGPOI);
	};
	b_logentry(TOPIC_ADDON_KOMPASS,"Garret by³ bardzo zadowolony, gdy odda³em mu kompas.");
	MIS_ADDON_GARETT_BRINGKOMPASS = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_GARETT_BRING_KOMPASS);
};


instance DIA_ADDON_GARETT_FRANCIS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 7;
	condition = dia_addon_garett_francis_condition;
	information = dia_addon_garett_francis_info;
	permanent = FALSE;
	description = "Co mo¿esz mi powiedzieæ o Francisie?";
};


func int dia_addon_garett_francis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_greg))
	{
		return TRUE;
	};
};

func void dia_addon_garett_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Francis_15_00");	//Co mo¿esz mi powiedzieæ o Francisie?
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_01");	//Greg mianowa³ go zastêpc¹ na czas swojej nieobecnoœci.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_02");	//Niestety, Francis w ogóle nie sprawdza siê w roli kapitana.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_03");	//Nie potrafi nawet œci¹gn¹æ Morgana z ³ó¿ka.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_04");	//Tylko Henry i jego ch³opaki w ogóle coœ robi¹.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_05");	//Reszta obija siê, zamiast pracowaæ.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_06");	//Mam nadziejê, ¿e Greg szybko wróci.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_07");	//I porozstawia towarzystwo po k¹tach.
	};
};


instance DIA_ADDON_GARETT_PERM(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 99;
	condition = dia_addon_garett_perm_condition;
	information = dia_addon_garett_perm_info;
	permanent = TRUE;
	description = "Jakieœ wieœci?";
};


func int dia_addon_garett_perm_condition()
{
	return TRUE;
};

func void dia_addon_garett_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_PERM_15_00");	//Jakieœ wieœci?
	if((GREGISBACK == FALSE) || Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_02");	//Od kiedy Greg znikn¹³, nic tu siê nie dzieje.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_01");	//Od czasu powrotu kapitana wszystko wróci³o do normy.
	};
};


instance DIA_ADDON_GARETT_TRADE(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 888;
	condition = dia_addon_garett_trade_condition;
	information = dia_addon_garett_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE;
	trade = TRUE;
};


func int dia_addon_garett_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_garett_trade_info()
{
	var int garett_random;
	var int mcbolzenamount;
	var int mcarrowamount;
	garett_random = Hlp_Random(3);
	if(garett_random == 0)
	{
		b_say(other,self,"$TRADE_1");
	}
	else if(garett_random == 1)
	{
		b_say(other,self,"$TRADE_2");
	}
	else
	{
		b_say(other,self,"$TRADE_3");
	};
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 25;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 25;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
};

