
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
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_00");	//Je�li chcesz zapyta�, czy do ciebie do��cz�, to mo�esz sobie darowa�.
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_01");	//Jak s�dzisz, co ch�opaki zrobi�, kiedy sobie p�jd�?
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_02");	//Po powrocie nie znalaz�bym ani jednej pe�nej skrzynki w swojej chacie!
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_03");	//Nie ma mowy. Zostan� tutaj i b�d� pilnowa� zapas�w.
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
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_00");	//Kogo my tu mamy? Ha, mam nadziej�, �e to nie kolejny bandzior na przeszpiegach.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_01");	//Nazywam si� Garett. Je�li masz na co� ochot�, najlepiej zwr�� si� do mnie.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_02");	//Mam tu wszystko, czego m�g�by� potrzebowa� - wino, bro� i sporo innych rzeczy.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_03");	//Je�li jednak szukasz dobrego trunku, lepiej zg�o� si� do Samuela.
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
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_01");	//To nasz gorzelnik. Rezyduje w jaskini przy pla�y.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_02");	//Nietrudno do niego trafi�. Po prostu pod��aj ca�y czas na p�noc.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_03");	//Radz� zrobi� ma�y zapas grogu.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_04");	//Niekt�rzy ch�opcy nie s� zbyt przyja�ni w stosunku do nowych, �e si� tak wyra��.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_05");	//A w takim wypadku grog mo�e zdzia�a� cuda.
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_SAMUELTRADE);
};


instance DIA_ADDON_GARETT_WAREZ(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 3;
	condition = dia_addon_garett_warez_condition;
	information = dia_addon_garett_warez_info;
	description = "Sk�d bierzesz swoje towary?";
};


func int dia_addon_garett_warez_condition()
{
	return TRUE;
};

func void dia_addon_garett_warez_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Warez_15_00");	//Sk�d bierzesz swoje towary?
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_01");	//Skip przynosi je z Khorinis, gdzie czasami bywa.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_02");	//Do niedawna sprzedawa� je bandytom.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_03");	//Ale od czasu, gdy toczymy z nimi wojn�, wszystko trafia do mnie.
};


instance DIA_ADDON_GARETT_BANDITS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 3;
	condition = dia_addon_garett_bandits_condition;
	information = dia_addon_garett_bandits_info;
	description = "Co wiesz na temat bandyt�w?";
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
	AI_Output(other,self,"DIA_Addon_Garett_Bandits_15_00");	//Co wiesz na temat bandyt�w?
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_01");	//Najlepiej zapytaj o to Skipa.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_02");	//Cz�sto si� z nimi kontaktowa�, wi�c powinien sporo wiedzie� o tych draniach.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_03");	//Greg rozkaza� ostro reagowa� na pojawienie si� cho�by jednego bandyty w tym rejonie.
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
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_01");	//Twarda z niego sztuka, bez dw�ch zda�.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_02");	//I sk�py jak diabli.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_03");	//Pozwala naszemu skarbnikowi, Francisowi, p�aci� nam tylko tyle, by�my si� nie zbuntowali.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_04");	//A kiedy kt�ry� z nas zdob�dzie co� naprawd� cennego, Greg przyw�aszcza to sobie.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_05");	//Kiedy� zabra�em kompas z kr�lewskiej fregaty.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_06");	//A Greg, rzecz jasna, odebra� mi go.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_07");	//Ech... Pewnie go gdzie� zakopa� jak reszt� swoich skarb�w.
};


instance DIA_ADDON_GARETT_TIPS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 5;
	condition = dia_addon_garett_tips_condition;
	information = dia_addon_garett_tips_info;
	description = "Gdzie Greg m�g� zakopa� kompas?";
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
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_00");	//Gdzie Greg m�g� zakopa� kompas?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_01");	//Greg powiedzia� mi, �e w ten kompas zagl�da�a sama �mier�. A potem mnie wy�mia�.
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_02");	//Co� jeszcze?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_03");	//Wzd�u� po�udniowego wybrze�a ci�gnie si� pla�a, do kt�rej mo�na si� dosta� wy��cznie drog� morsk�.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_04");	//Podobno cz�sto widywano na niej Grega. Mo�e tam uda ci si� co� znale��.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_05");	//Kiedy� sam si� wybra�em w te rejony, ale za du�o tam potwor�w.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_06");	//Je�li chcesz mimo wszystko zaryzykowa�, nie zapomnij wzi�� kilofa.
	MIS_ADDON_GARETT_BRINGKOMPASS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KOMPASS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KOMPASS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KOMPASS,"Greg zabra� Garretowi cenny kompas. Garett podejrzewa, �e zakopa� go gdzie� na po�udniowej pla�y.");
};


instance DIA_ADDON_GARETT_GIVEKOMPASS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 6;
	condition = dia_addon_garett_givekompass_condition;
	information = dia_addon_garett_givekompass_info;
	permanent = FALSE;
	description = "Oto tw�j kompas.";
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
	AI_Output(other,self,"DIA_Addon_Garett_GiveKompass_15_00");	//Oto tw�j kompas.
	if(b_giveinvitems(other,self,itmi_addon_kompass_mis,1))
	{
		Npc_RemoveInvItems(self,itmi_addon_kompass_mis,1);
	};
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_01");	//Ha, to rzeczywi�cie on! Nie spodziewa�em si�, �e ujrz� go ponownie.
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_02");	//Wielkie dzi�ki!
	if(Npc_HasItems(self,itbe_addon_prot_edgpoi) > 0)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_03");	//Tym razem Greg ju� go nie dostanie.
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_04");	//We� w nagrod� ten pas. Jest sporo wart.
		b_giveinvitems(self,other,itbe_addon_prot_edgpoi,1);
	}
	else if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_05");	//Pami�tasz ten pas, kt�ry ode mnie kupi�e�?
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_06");	//Zap�aci�e� za niego sporo, cho�, zwa�ywszy na jego warto��, na pewno nie przep�aci�e�. Prosz�, we� swoje pieni�dze z powrotem i potraktuj go jako prezent.
		b_giveinvitems(self,other,itmi_gold,VALUE_ITBE_ADDON_PROT_EDGPOI);
	};
	b_logentry(TOPIC_ADDON_KOMPASS,"Garret by� bardzo zadowolony, gdy odda�em mu kompas.");
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
	description = "Co mo�esz mi powiedzie� o Francisie?";
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
	AI_Output(other,self,"DIA_Addon_Garett_Francis_15_00");	//Co mo�esz mi powiedzie� o Francisie?
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_01");	//Greg mianowa� go zast�pc� na czas swojej nieobecno�ci.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_02");	//Niestety, Francis w og�le nie sprawdza si� w roli kapitana.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_03");	//Nie potrafi nawet �ci�gn�� Morgana z ��ka.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_04");	//Tylko Henry i jego ch�opaki w og�le co� robi�.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_05");	//Reszta obija si�, zamiast pracowa�.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_06");	//Mam nadziej�, �e Greg szybko wr�ci.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_07");	//I porozstawia towarzystwo po k�tach.
	};
};


instance DIA_ADDON_GARETT_PERM(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 99;
	condition = dia_addon_garett_perm_condition;
	information = dia_addon_garett_perm_info;
	permanent = TRUE;
	description = "Jakie� wie�ci?";
};


func int dia_addon_garett_perm_condition()
{
	return TRUE;
};

func void dia_addon_garett_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_PERM_15_00");	//Jakie� wie�ci?
	if((GREGISBACK == FALSE) || Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_02");	//Od kiedy Greg znikn��, nic tu si� nie dzieje.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_01");	//Od czasu powrotu kapitana wszystko wr�ci�o do normy.
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

