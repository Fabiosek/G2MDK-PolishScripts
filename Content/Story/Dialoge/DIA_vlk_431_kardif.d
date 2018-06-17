
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
	AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//Je�li chcesz co� do picia, to b�dziesz musia� sobie zam�wi�.
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
	description = "Za�o�� si�, �e s�yszysz tu wiele rzeczy...";
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
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//Za�o�� si�, �e s�yszysz tu wiele rzeczy...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//No i co z tego?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//Interesuj� mnie najnowsze wie�ci.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//Nie widz� w twoim r�ku sakiewki...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Za ka�d� informacj�, kt�r� ode mnie uzyskasz, b�dziesz musia� zap�aci� 10 sztuk z�ota.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif, w�a�ciciel portowej knajpy, sprzedaje informacje.");
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Za twoje informacje nie dam ci wi�cej ni� 5 sztuk z�ota.",dia_kardif_hallo_angebot);
	Info_AddChoice(dia_kardif_hallo,"Nie ma mowy. Znajd� sobie inne �r�d�o informacji.",dia_kardif_hallo_hart);
	Info_AddChoice(dia_kardif_hallo,"Dobrze, zgadzam si�.",dia_kardif_hallo_zehn);
};

func void dia_kardif_hallo_zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//Dobrze, zgadzam si�.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//Ubi�e� dobry interes. Jestem do twojej dyspozycji.
	KARDIF_DEAL = 10;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//Nie dam ci wi�cej ni� 5.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//Co, 5 sztuk z�ota? Chcesz mnie zrujnowa�? Dobra, niech b�dzie 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Nie, nic z tego. A co powiesz na 6?",dia_kardif_hallo_keindeal);
	Info_AddChoice(dia_kardif_hallo,"Dobrze, 7 sztuk z�ota to uczciwa cena.",dia_kardif_hallo_sieben);
};

func void dia_kardif_hallo_hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//Zapomnij o tym - zdob�d� informacje w inny spos�b.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//Dobra, dobra... Obni�� cen� do 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Dobrze, 7 sztuk z�ota to uczciwa cena.",dia_kardif_hallo_sieben);
	Info_AddChoice(dia_kardif_hallo,"A� tak strasznie nie potrzebuj� twoich informacji.",dia_kardif_hallo_ablehnen);
};

func void dia_kardif_hallo_sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//Dobrze, 7 sztuk z�ota to uczciwa cena.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//M�dra decyzja. Je�li chcesz co� wiedzie�, pytaj.
	KARDIF_DEAL = 7;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//A� tak strasznie nie potrzebuj� twoich informacji.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//Hej, zaczekaj... No dobrze, niech b�dzie 5 monet. Ale to moje ostatnie s�owo!
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Nie lepiej by�o tak od razu?",dia_kardif_hallo_fuenf);
};

func void dia_kardif_hallo_fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//Nie lepiej by�o tak od razu?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//Hm, po prostu nie jestem dzi� w formie. Ale niewa�ne - umowa stoi.
	KARDIF_DEAL = 5;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_keindeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//Nie, nic z tego. A co powiesz na 6?
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//Ale z ciebie dra�. Dobrze, je�li nalegasz, niech b�dzie - 6 sztuk z�ota za ka�d� informacj�.
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
	description = "Daj mi co� do picia.";
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
	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//Daj mi co� do picia.
};


instance DIA_KARDIF_TRADEINFO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_tradeinfo_condition;
	information = dia_kardif_tradeinfo_info;
	permanent = TRUE;
	description = "Potrzebuj� informacji.";
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
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//Potrzebuj� informacji.
	KARDIF_ONEQUESTION = TRUE;
};

func void b_saykardifzuweniggold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//Wr�� tutaj, jak b�dziesz mia� do�� pieni�dzy.
};


instance DIA_KARDIF_BUERGER(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_buerger_condition;
	information = dia_kardif_buerger_info;
	permanent = TRUE;
	description = "Kto zalicza si� do najbardziej wp�ywowych obywateli w mie�cie?";
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
		AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//Kto zalicza si� do najbardziej wp�ywowych obywateli w mie�cie?
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//Tutaj, w porcie, trudno znale�� wielkie szychy. Tylko jeden jedyny Lehmar posiada ogromne wp�ywy.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//Ma du�o pieni�dzy, kt�re po�ycza na procent. Zaj�cie to nie zyska�o mu wielu zwolennik�w, ale wielu wp�ywowych obywateli zapo�ycza si� u niego.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//Handlarze i rzemie�lnicy r�wnie� maj� du�e wp�ywy - uwa�am nawet, �e ZBYT du�e.
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
	description = "Kto jest winien pieni�dze Lehmarowi?";
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
		AI_Output(other,self,"DIA_Kardif_Add_15_00");	//Kto jest winien pieni�dze Lehmarowi?
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//Je�li naprawd� chcesz wiedzie�, powiniene� zajrze� do jego ksi�gi rachunkowej.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//Chocia� podejrzewam, �e nie zdo�asz tego zrobi� w taki spos�b, �eby niczego nie zauwa�y�.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//Z tego co wiem, zawsze nosi j� przy sobie...
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
	description = "Gdzie mog� znale�� prac�?";
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
		AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//Gdzie mog� znale�� prac�?
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//W porcie b�dzie ci�ko. Najlepiej, je�li udasz si� do rzemie�lnik�w zamieszkuj�cych doln� cz�� miasta.
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//Je�li posiadasz w miar� przyzwoity miecz, mo�esz spr�bowa� pojedynku z Alrikiem. Walczy za pieni�dze. Znajdziesz go za magazynem.
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
	description = "Co wiesz o zaginionych mieszka�cach?";
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
		AI_Output(other,self,"DIA_Addon_Kardif_MissingPeople_15_00");	//Co wiesz o zaginionych mieszka�cach?
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_01");	//Tylko tyle, �e ostatnio znikaj� w mie�cie ludzie.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_02");	//Wydaje si�, �e najbardziej dotyczy to obszaru portu - na twoim miejscu tam bym o to popyta�.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_03");	//Podobno niekt�re przypadki dotycz� te� os�b z dolnego miasta.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_04");	//Coragon powinien wiedzie� wi�cej na ten temat.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_05");	//Prowadzi gospod� w dolnym mie�cie i na pewno s�yszy wiele ciekawych opowie�ci.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_06");	//Co� w tej sprawie mo�e wiedzie� r�wnie� Halvor, sprzedawca ryb z nadbrze�a - cho�by tylko z powodu du�ej liczby klient�w, kt�rych obs�uguje.
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Kardif uwa�a, �e w sprawie zaginionych ludzi powinienem przepyta� Coragona, kupca z dolnego miasta, i handlarza rybami z portu, Halvora.");
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
	description = "Kto mo�e mnie czego� tutaj nauczy�?";
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
		AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//Kto mo�e mnie czego� tutaj nauczy�?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//Tu, w porcie, mo�esz znale�� kilku niez�ych nauczycieli.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//Kowal Carl to bardzo silny m�czyzna. Z pewno�ci� zna si� na treningu si�owym.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//Wie r�wnie� wiele na temat walki. Lares z kolei to przebieg�y opryszek. Jego te� czasami mo�na znale�� w porcie.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//Je�li jeste� na tyle szalony, mo�esz odwiedzi� starego Ignaza - podobno wie on co nieco na temat alche... alchi... mikstur.
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//Gdzie mog� ich wszystkich znale��?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//Ch�opcze, pr�dzej Kr�l wygra wojn� z orkami, ni� ja zdo�am ci to wyt�umaczy�.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//Po prostu rozejrzyj si� po dzielnicy, a pr�dzej czy p�niej natkniesz si� na nich. A je�li nie znasz tego miejsca, udaj si� do Brahima i kup sobie map�.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//Jego z kolei nietrudno odnale��. Ma chat� tu� obok mojej knajpy. Za to powinienem za��da� podw�jnej ceny.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Carl, kowal z dzielnicy portowej, mo�e mi pokaza�, jak sta� si� silniejszym.");
		b_logentry(TOPIC_CITYTEACHER,"Lares mo�e mi pom�c w zwi�kszeniu zr�czno�ci.");
		b_logentry(TOPIC_CITYTEACHER,"Alrik, kt�ry kr�ci si� za magazynem w dzielnicy portowej, mo�e mnie nauczy� walki or�em jednor�cznym.");
		b_logentry(TOPIC_CITYTEACHER,"Igaraz, kt�ry mieszka w dzielnicy portowej, zna przepisy na przer�ne mikstury.");
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
	description = "Czy w okolicy mo�na znale�� jakie� 'specjalne' zlecenia...?";
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
		AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//Czy w okolicy mo�na dosta� jakie� 'specjalne' zlecenia? Chodzi mi o jak najszybszy zarobek.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//Co� specjalnego, m�wisz... hm...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//...id� porozmawia� z Nagurem. Mo�e on b�dzie w stanie ci pom�c.
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
	description = "Czy masz dla mnie jakie� 'specjalne' zadanie?";
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
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//Czy masz dla mnie jakie� 'specjalne' zadanie?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//Mam pewne zlecenie - ale jest to zadanie dla kogo� o wielu talentach.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//Co masz?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//Zuris, sprzedawca mikstur z targowiska, przyjmuje w�a�nie go�cia - Maga Ognia, Darona.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//I?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//Specjalnie dla niego zam�wi� kufer u stolarza Thorbena.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//Powiadaj�, �e Daron przywi�z� ze sob� sporo kosztowno�ci. Ale tego ode mnie nie s�ysza�e�, jasne?
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
	description = "Gdzie mog� kupi� ziele?";
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
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//Gdzie mog� kupi� ziele?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//Na pewno nie tutaj - nie mam nic wsp�lnego z tym towarem.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//Z pewno�ci� nie tutaj.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//Dobrze, wi�c gdzie?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//Na twoim miejscu pogada�bym z Meldorem - on pali przez ca�y czas.
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
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//Ktokolwiek posiada tak� paczk�, jest bogatym cz�owiekiem. I prawdopodobnie nie musi si� o nic martwi�!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//Nie pr�buj mnie oszuka�. Wiesz co� na ten temat, i lepiej to z siebie wydu�!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//Dobrze, dobrze - jaki� czas temu w mojej knajpie pojawi� si� pewien cz�owiek. Najemnik.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//Powiedzia�, �e sprzeda� w porcie paczk� ziela. Kto wie, jak by�o naprawd�, facet by� kompletnie zamroczony. To wszystko co wiem.
		DIA_KARDIF_PAKET_PERM = TRUE;
		b_logentry(TOPIC_WAREHOUSE,"Kardif rozmawia� z jakim� najemnikiem, kt�ry mia� do sprzedania paczk� bagiennego ziela.");
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
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//Hej, podejd� tutaj. Mam co� dla ciebie.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//By� tutaj jeden cz�owiek, chcia� z tob� koniecznie porozmawia�.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//Poniewa� ci� tu nie by�o, poprosi� mnie o przekazanie ci wiadomo�ci.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//Chce si� z tob� spotka� za sklepem rybnym Halvora.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//Ta informacja by�a darmowa - ale si� za bardzo nie przyzwyczajaj! Nic wi�cej nie powiem, je�li mi nie zap�acisz.
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//Jak wygl�da� ten cz�owiek?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//M�g�bym ci odpowiedzie� na to pytanie, ale musisz mi najpierw zap�aci�, przyjacielu.
	if(KARDIF_DEAL == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Za ka�d� informacj�, kt�r� ode mnie uzyskasz, b�dziesz musia� zap�aci� 10 sztuk z�ota.
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
	description = "Jak wygl�da� ten cz�owiek?";
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
		AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//Jak wygl�da� ten cz�owiek?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//Wysoki, raczej ciemna karnacja, wygl�da� na silnego. Nie mia� na sobie �adnego munduru. Wygl�da� jako� tak... z�owrogo.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//A jego twarz?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//Jego twarz? Kiedy na mnie popatrzy�, szczerze si� ucieszy�em, �e to nie do mnie przyszed�.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//Mia� takie dziwne, niepokoj�ce spojrzenie - s�dz� jednak, �e powiniene� si� z nim zobaczy�. Z pewno�ci� b�dzie to interesuj�ce spotkanie.
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
	description = "Ten dra� pr�bowa� mnie zabi�!";
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
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//Ten dra� pr�bowa� mnie zabi�!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//Hej, czy to moja wina? Ja tylko przekaza�em ci wiadomo�� od niego.
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//Je�li kto� ma co� przeciwko tobie, to podejrzewam, �e mo�e te� mie� swoje powody.
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
	description = "(Poka� z�odziejski gest)";
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
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//Ach, jeste� cz�onkiem gangu. W takim wypadku mam tu co� dla ciebie.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//Je�li b�d� ci kiedy� potrzebne jakie� wytrychy, zg�o� si� do mnie. Mam jeszcze par� na zbyciu. Wystarczy, �e poprosisz o co� do picia.
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
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//Marne czasy nasta�y, przyjacielu. W ca�ym Khorinis nie ma wystarczaj�cej ilo�ci marynarzy. Wi�kszo�� z nich opu�ci�a miasto.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//Ale dobry kapitan nie powinien mie� wielkich problem�w z zebraniem za�ogi. Potrzebujemy jeszcze paru ch�opak�w.
	AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//Gdzie mog� znale�� kapitana?
	AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//Pytasz nieodpowiedni� osob�. Ja tylko prowadz� knajp�.
	if(Npc_IsDead(jack) == FALSE)
	{
		if(SCGOTCAPTAIN == FALSE)
		{
			Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
			b_logentry(TOPIC_CAPTAIN,"Kardif wys�a� mnie do starego Jacka, kt�ry podobno b�dzie m�g� udzieli� mi pomocy.");
		};
		AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//Id� do Starego Jacka. Kr�ci si� po porcie, od kiedy si�gam pami�ci�. Nie znajdziesz nikogo lepszego.
	};
};

