
instance DIA_KARDIF_EXIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 999;
	condition = dia_kardif_exit_condition;
	information = dia_kardif_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kardif_exit_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARDIF_PICKPOCKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 900;
	condition = dia_kardif_pickpocket_condition;
	information = dia_kardif_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kardif_pickpocket_condition()
{
	return c_beklauen(55,85);
};

func void dia_kardif_pickpocket_info()
{
	Info_ClearChoices(dia_kardif_pickpocket);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_BACK,dia_kardif_pickpocket_back);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_PICKPOCKET,dia_kardif_pickpocket_doit);
};

func void dia_kardif_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kardif_pickpocket);
};

func void dia_kardif_pickpocket_back()
{
	Info_ClearChoices(dia_kardif_pickpocket);
};


instance DIA_KARDIF_HI(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hi_condition;
	information = dia_kardif_hi_info;
	permanent = FALSE;
	description = "Jak leci?";
};


func int dia_kardif_hi_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_hi_info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//Jeœli chcesz coœ do picia, to bêdziesz musia³ sobie zamówiæ.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif sprzedaje napoje w portowej knajpie.");
};


instance DIA_KARDIF_HALLO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hallo_condition;
	information = dia_kardif_hallo_info;
	permanent = FALSE;
	description = "Za³o¿ê siê, ¿e s³yszysz tu wiele rzeczy...";
};


func int dia_kardif_hallo_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_hi) && (KARDIF_DEAL == 0))
	{
		return TRUE;
	};
};

func void dia_kardif_hallo_info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//Za³o¿ê siê, ¿e s³yszysz tu wiele rzeczy...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//No i co z tego?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//Interesuj¹ mnie najnowsze wieœci.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//Nie widzê w twoim rêku sakiewki...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Za ka¿d¹ informacjê, któr¹ ode mnie uzyskasz, bêdziesz musia³ zap³aciæ 10 sztuk z³ota.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif, w³aœciciel portowej knajpy, sprzedaje informacje.");
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Za twoje informacje nie dam ci wiêcej ni¿ 5 sztuk z³ota.",dia_kardif_hallo_angebot);
	Info_AddChoice(dia_kardif_hallo,"Nie ma mowy. Znajdê sobie inne Ÿród³o informacji.",dia_kardif_hallo_hart);
	Info_AddChoice(dia_kardif_hallo,"Dobrze, zgadzam siê.",dia_kardif_hallo_zehn);
};

func void dia_kardif_hallo_zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//Dobrze, zgadzam siê.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//Ubi³eœ dobry interes. Jestem do twojej dyspozycji.
	KARDIF_DEAL = 10;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//Nie dam ci wiêcej ni¿ 5.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//Co, 5 sztuk z³ota? Chcesz mnie zrujnowaæ? Dobra, niech bêdzie 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Nie, nic z tego. A co powiesz na 6?",dia_kardif_hallo_keindeal);
	Info_AddChoice(dia_kardif_hallo,"Dobrze, 7 sztuk z³ota to uczciwa cena.",dia_kardif_hallo_sieben);
};

func void dia_kardif_hallo_hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//Zapomnij o tym - zdobêdê informacje w inny sposób.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//Dobra, dobra... Obni¿ê cenê do 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Dobrze, 7 sztuk z³ota to uczciwa cena.",dia_kardif_hallo_sieben);
	Info_AddChoice(dia_kardif_hallo,"A¿ tak strasznie nie potrzebujê twoich informacji.",dia_kardif_hallo_ablehnen);
};

func void dia_kardif_hallo_sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//Dobrze, 7 sztuk z³ota to uczciwa cena.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//M¹dra decyzja. Jeœli chcesz coœ wiedzieæ, pytaj.
	KARDIF_DEAL = 7;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//A¿ tak strasznie nie potrzebujê twoich informacji.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//Hej, zaczekaj... No dobrze, niech bêdzie 5 monet. Ale to moje ostatnie s³owo!
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Nie lepiej by³o tak od razu?",dia_kardif_hallo_fuenf);
};

func void dia_kardif_hallo_fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//Nie lepiej by³o tak od razu?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//Hm, po prostu nie jestem dziœ w formie. Ale niewa¿ne - umowa stoi.
	KARDIF_DEAL = 5;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_keindeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//Nie, nic z tego. A co powiesz na 6?
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//Ale z ciebie drañ. Dobrze, jeœli nalegasz, niech bêdzie - 6 sztuk z³ota za ka¿d¹ informacjê.
	KARDIF_DEAL = 6;
	Info_ClearChoices(dia_kardif_hallo);
};


instance DIA_KARDIF_TRADE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_trade_condition;
	information = dia_kardif_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Daj mi coœ do picia.";
};


func int dia_kardif_trade_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//Daj mi coœ do picia.
};


instance DIA_KARDIF_TRADEINFO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_tradeinfo_condition;
	information = dia_kardif_tradeinfo_info;
	permanent = TRUE;
	description = "Potrzebujê informacji.";
};


func int dia_kardif_tradeinfo_condition()
{
	if((KARDIF_ONEQUESTION == FALSE) && (KARDIF_DEAL > 0))
	{
		return TRUE;
	};
};

func void dia_kardif_tradeinfo_info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//Potrzebujê informacji.
	KARDIF_ONEQUESTION = TRUE;
};

func void b_saykardifzuweniggold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//Wróæ tutaj, jak bêdziesz mia³ doœæ pieniêdzy.
};


instance DIA_KARDIF_BUERGER(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_buerger_condition;
	information = dia_kardif_buerger_info;
	permanent = TRUE;
	description = "Kto zalicza siê do najbardziej wp³ywowych obywateli w mieœcie?";
};


var int dia_kardif_buerger_permanent;

func int dia_kardif_buerger_condition()
{
	if((DIA_KARDIF_BUERGER_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_buerger_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//Kto zalicza siê do najbardziej wp³ywowych obywateli w mieœcie?
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//Tutaj, w porcie, trudno znaleŸæ wielkie szychy. Tylko jeden jedyny Lehmar posiada ogromne wp³ywy.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//Ma du¿o pieniêdzy, które po¿ycza na procent. Zajêcie to nie zyska³o mu wielu zwolenników, ale wielu wp³ywowych obywateli zapo¿ycza siê u niego.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//Handlarze i rzemieœlnicy równie¿ maj¹ du¿e wp³ywy - uwa¿am nawet, ¿e ZBYT du¿e.
		DIA_KARDIF_BUERGER_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LEHMAR(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lehmar_condition;
	information = dia_kardif_lehmar_info;
	permanent = TRUE;
	description = "Kto jest winien pieni¹dze Lehmarowi?";
};


var int dia_kardif_lehmar_permanent;

func int dia_kardif_lehmar_condition()
{
	if((DIA_KARDIF_LEHMAR_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_BUERGER_PERMANENT == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lehmar_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Add_15_00");	//Kto jest winien pieni¹dze Lehmarowi?
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//Jeœli naprawdê chcesz wiedzieæ, powinieneœ zajrzeæ do jego ksiêgi rachunkowej.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//Chocia¿ podejrzewam, ¿e nie zdo³asz tego zrobiæ w taki sposób, ¿eby niczego nie zauwa¿y³.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//Z tego co wiem, zawsze nosi j¹ przy sobie...
		DIA_KARDIF_LEHMAR_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ARBEIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_arbeit_condition;
	information = dia_kardif_arbeit_info;
	permanent = TRUE;
	description = "Gdzie mogê znaleŸæ pracê?";
};


var int dia_kardif_arbeit_permanent;

func int dia_kardif_arbeit_condition()
{
	if((DIA_KARDIF_ARBEIT_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_arbeit_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//Gdzie mogê znaleŸæ pracê?
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//W porcie bêdzie ciê¿ko. Najlepiej, jeœli udasz siê do rzemieœlników zamieszkuj¹cych doln¹ czêœæ miasta.
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//Jeœli posiadasz w miarê przyzwoity miecz, mo¿esz spróbowaæ pojedynku z Alrikiem. Walczy za pieni¹dze. Znajdziesz go za magazynem.
		DIA_KARDIF_ARBEIT_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_ADDON_KARDIF_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_addon_kardif_missingpeople_condition;
	information = dia_addon_kardif_missingpeople_info;
	permanent = TRUE;
	description = "Co wiesz o zaginionych mieszkañcach?";
};


var int dia_addon_kardif_missingpeople_permanent;

func int dia_addon_kardif_missingpeople_condition()
{
	if((DIA_ADDON_KARDIF_MISSINGPEOPLE_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_kardif_missingpeople_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Addon_Kardif_MissingPeople_15_00");	//Co wiesz o zaginionych mieszkañcach?
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_01");	//Tylko tyle, ¿e ostatnio znikaj¹ w mieœcie ludzie.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_02");	//Wydaje siê, ¿e najbardziej dotyczy to obszaru portu - na twoim miejscu tam bym o to popyta³.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_03");	//Podobno niektóre przypadki dotycz¹ te¿ osób z dolnego miasta.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_04");	//Coragon powinien wiedzieæ wiêcej na ten temat.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_05");	//Prowadzi gospodê w dolnym mieœcie i na pewno s³yszy wiele ciekawych opowieœci.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_06");	//Coœ w tej sprawie mo¿e wiedzieæ równie¿ Halvor, sprzedawca ryb z nadbrze¿a - choæby tylko z powodu du¿ej liczby klientów, których obs³uguje.
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Kardif uwa¿a, ¿e w sprawie zaginionych ludzi powinienem przepytaæ Coragona, kupca z dolnego miasta, i handlarza rybami z portu, Halvora.");
		DIA_ADDON_KARDIF_MISSINGPEOPLE_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LERNEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lernen_condition;
	information = dia_kardif_lernen_info;
	permanent = TRUE;
	description = "Kto mo¿e mnie czegoœ tutaj nauczyæ?";
};


var int dia_kardif_lernen_permanent;

func int dia_kardif_lernen_condition()
{
	if((DIA_KARDIF_LERNEN_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lernen_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//Kto mo¿e mnie czegoœ tutaj nauczyæ?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//Tu, w porcie, mo¿esz znaleŸæ kilku niez³ych nauczycieli.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//Kowal Carl to bardzo silny mê¿czyzna. Z pewnoœci¹ zna siê na treningu si³owym.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//Wie równie¿ wiele na temat walki. Lares z kolei to przebieg³y opryszek. Jego te¿ czasami mo¿na znaleŸæ w porcie.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//Jeœli jesteœ na tyle szalony, mo¿esz odwiedziæ starego Ignaza - podobno wie on co nieco na temat alche... alchi... mikstur.
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//Gdzie mogê ich wszystkich znaleŸæ?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//Ch³opcze, prêdzej Król wygra wojnê z orkami, ni¿ ja zdo³am ci to wyt³umaczyæ.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//Po prostu rozejrzyj siê po dzielnicy, a prêdzej czy póŸniej natkniesz siê na nich. A jeœli nie znasz tego miejsca, udaj siê do Brahima i kup sobie mapê.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//Jego z kolei nietrudno odnaleŸæ. Ma chatê tu¿ obok mojej knajpy. Za to powinienem za¿¹daæ podwójnej ceny.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Carl, kowal z dzielnicy portowej, mo¿e mi pokazaæ, jak staæ siê silniejszym.");
		b_logentry(TOPIC_CITYTEACHER,"Lares mo¿e mi pomóc w zwiêkszeniu zrêcznoœci.");
		b_logentry(TOPIC_CITYTEACHER,"Alrik, który krêci siê za magazynem w dzielnicy portowej, mo¿e mnie nauczyæ walki orê¿em jednorêcznym.");
		b_logentry(TOPIC_CITYTEACHER,"Igaraz, który mieszka w dzielnicy portowej, zna przepisy na przeró¿ne mikstury.");
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Brahim sprzedaje mapy w dzielnicy portowej.");
		DIA_KARDIF_LERNEN_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk_condition;
	information = dia_kardif_diebeswerk_info;
	permanent = TRUE;
	description = "Czy w okolicy mo¿na znaleŸæ jakieœ 'specjalne' zlecenia...?";
};


var int dia_kardif_diebeswerk_permanent;

func int dia_kardif_diebeswerk_condition()
{
	if((DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//Czy w okolicy mo¿na dostaæ jakieœ 'specjalne' zlecenia? Chodzi mi o jak najszybszy zarobek.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//Coœ specjalnego, mówisz... hm...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//...idŸ porozmawiaæ z Nagurem. Mo¿e on bêdzie w stanie ci pomóc.
		DIA_KARDIF_DIEBESWERK_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK2(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk2_condition;
	information = dia_kardif_diebeswerk2_info;
	permanent = TRUE;
	description = "Czy masz dla mnie jakieœ 'specjalne' zadanie?";
};


var int dia_kardif_diebeswerk2_permanent;

func int dia_kardif_diebeswerk2_condition()
{
	if((DIA_KARDIF_DIEBESWERK2_PERMANENT == FALSE) && (DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk2_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//Czy masz dla mnie jakieœ 'specjalne' zadanie?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//Mam pewne zlecenie - ale jest to zadanie dla kogoœ o wielu talentach.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//Co masz?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//Zuris, sprzedawca mikstur z targowiska, przyjmuje w³aœnie goœcia - Maga Ognia, Darona.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//I?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//Specjalnie dla niego zamówi³ kufer u stolarza Thorbena.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//Powiadaj¹, ¿e Daron przywióz³ ze sob¹ sporo kosztownoœci. Ale tego ode mnie nie s³ysza³eœ, jasne?
		DIA_KARDIF_DIEBESWERK2_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ZURUECK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_zurueck_condition;
	information = dia_kardif_zurueck_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int dia_kardif_zurueck_condition()
{
	if(KARDIF_ONEQUESTION == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zurueck_info()
{
	KARDIF_ONEQUESTION = FALSE;
	Info_ClearChoices(dia_kardif_zurueck);
};


instance DIA_KARDIF_DOPE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_dope_condition;
	information = dia_kardif_dope_info;
	permanent = TRUE;
	description = "Gdzie mogê kupiæ ziele?";
};


var int dia_kardif_dope_perm;

func int dia_kardif_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_DOPE_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_dope_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//Gdzie mogê kupiæ ziele?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//Na pewno nie tutaj - nie mam nic wspólnego z tym towarem.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//Z pewnoœci¹ nie tutaj.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//Dobrze, wiêc gdzie?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//Na twoim miejscu pogada³bym z Meldorem - on pali przez ca³y czas.
		DIA_KARDIF_DOPE_PERM = TRUE;
	};
};


instance DIA_KARDIF_PAKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 3;
	condition = dia_kardif_paket_condition;
	information = dia_kardif_paket_info;
	permanent = TRUE;
	description = "Co wiesz na temat paczki bagiennego ziela?";
};


var int dia_kardif_paket_perm;

func int dia_kardif_paket_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_PAKET_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_paket_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//Co wiesz na temat paczki bagiennego ziela?
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//Ktokolwiek posiada tak¹ paczkê, jest bogatym cz³owiekiem. I prawdopodobnie nie musi siê o nic martwiæ!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//Nie próbuj mnie oszukaæ. Wiesz coœ na ten temat, i lepiej to z siebie wyduœ!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//Dobrze, dobrze - jakiœ czas temu w mojej knajpie pojawi³ siê pewien cz³owiek. Najemnik.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//Powiedzia³, ¿e sprzeda³ w porcie paczkê ziela. Kto wie, jak by³o naprawdê, facet by³ kompletnie zamroczony. To wszystko co wiem.
		DIA_KARDIF_PAKET_PERM = TRUE;
		b_logentry(TOPIC_WAREHOUSE,"Kardif rozmawia³ z jakimœ najemnikiem, który mia³ do sprzedania paczkê bagiennego ziela.");
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_SENDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_sendattila_condition;
	information = dia_kardif_sendattila_info;
	important = TRUE;
};


func int dia_kardif_sendattila_condition()
{
	if((MIS_THIEFGUILD_SUCKED == TRUE) || ((DIEBESGILDE_OKAY >= 3) && Npc_IsInState(self,zs_talk)))
	{
		return TRUE;
	};
};

func void dia_kardif_sendattila_info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//Hej, podejdŸ tutaj. Mam coœ dla ciebie.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//By³ tutaj jeden cz³owiek, chcia³ z tob¹ koniecznie porozmawiaæ.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//Poniewa¿ ciê tu nie by³o, poprosi³ mnie o przekazanie ci wiadomoœci.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//Chce siê z tob¹ spotkaæ za sklepem rybnym Halvora.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//Ta informacja by³a darmowa - ale siê za bardzo nie przyzwyczajaj! Nic wiêcej nie powiem, jeœli mi nie zap³acisz.
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//Jak wygl¹da³ ten cz³owiek?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//Móg³bym ci odpowiedzieæ na to pytanie, ale musisz mi najpierw zap³aciæ, przyjacielu.
	if(KARDIF_DEAL == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Za ka¿d¹ informacjê, któr¹ ode mnie uzyskasz, bêdziesz musia³ zap³aciæ 10 sztuk z³ota.
		KARDIF_DEAL = 10;
	};
	Wld_InsertNpc(vlk_494_attila,"NW_CITY_ENTRANCE_01");
};


instance DIA_KARDIF_KERL(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_kerl_condition;
	information = dia_kardif_kerl_info;
	permanent = TRUE;
	description = "Jak wygl¹da³ ten cz³owiek?";
};


var int dia_kardif_kerl_permanent;

func int dia_kardif_kerl_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_sendattila) && (attila.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_KERL_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_kerl_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//Jak wygl¹da³ ten cz³owiek?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//Wysoki, raczej ciemna karnacja, wygl¹da³ na silnego. Nie mia³ na sobie ¿adnego munduru. Wygl¹da³ jakoœ tak... z³owrogo.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//A jego twarz?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//Jego twarz? Kiedy na mnie popatrzy³, szczerze siê ucieszy³em, ¿e to nie do mnie przyszed³.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//Mia³ takie dziwne, niepokoj¹ce spojrzenie - s¹dzê jednak, ¿e powinieneœ siê z nim zobaczyæ. Z pewnoœci¹ bêdzie to interesuj¹ce spotkanie.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//Tak... Pytanie tylko, dla kogo bardziej...
		DIA_KARDIF_KERL_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DEFEATEDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_defeatedattila_condition;
	information = dia_kardif_defeatedattila_info;
	permanent = FALSE;
	description = "Ten drañ próbowa³ mnie zabiæ!";
};


func int dia_kardif_defeatedattila_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_hallo))
	{
		return TRUE;
	};
};

func void dia_kardif_defeatedattila_info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//Ten drañ próbowa³ mnie zabiæ!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//Hej, czy to moja wina? Ja tylko przekaza³em ci wiadomoœæ od niego.
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//Jeœli ktoœ ma coœ przeciwko tobie, to podejrzewam, ¿e mo¿e te¿ mieæ swoje powody.
	b_giveplayerxp(XP_KARDIF_BLAME4ATTILA);
	b_killnpc(attila);
	Npc_RemoveInvItem(attila,itmi_oldcoin);
};


instance DIA_KARDIF_ZEICHEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_zeichen_condition;
	information = dia_kardif_zeichen_info;
	permanent = FALSE;
	description = "(Poka¿ z³odziejski gest)";
};


func int dia_kardif_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//Ach, jesteœ cz³onkiem gangu. W takim wypadku mam tu coœ dla ciebie.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//Jeœli bêd¹ ci kiedyœ potrzebne jakieœ wytrychy, zg³oœ siê do mnie. Mam jeszcze parê na zbyciu. Wystarczy, ¿e poprosisz o coœ do picia.
	CreateInvItems(self,itke_lockpick,20);
};


instance DIA_KARDIF_CREW(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 51;
	condition = dia_kardif_crew_condition;
	information = dia_kardif_crew_info;
	permanent = FALSE;
	description = "Brakuje mi jeszcze paru marynarzy.";
};


func int dia_kardif_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_crew_info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//Brakuje mi jeszcze paru marynarzy.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//Marne czasy nasta³y, przyjacielu. W ca³ym Khorinis nie ma wystarczaj¹cej iloœci marynarzy. Wiêkszoœæ z nich opuœci³a miasto.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//Ale dobry kapitan nie powinien mieæ wielkich problemów z zebraniem za³ogi. Potrzebujemy jeszcze paru ch³opaków.
	AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//Gdzie mogê znaleŸæ kapitana?
	AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//Pytasz nieodpowiedni¹ osobê. Ja tylko prowadzê knajpê.
	if(Npc_IsDead(jack) == FALSE)
	{
		if(SCGOTCAPTAIN == FALSE)
		{
			Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
			b_logentry(TOPIC_CAPTAIN,"Kardif wys³a³ mnie do starego Jacka, który podobno bêdzie móg³ udzieliæ mi pomocy.");
		};
		AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//IdŸ do Starego Jacka. Krêci siê po porcie, od kiedy siêgam pamiêci¹. Nie znajdziesz nikogo lepszego.
	};
};

