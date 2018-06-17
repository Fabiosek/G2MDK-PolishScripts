
instance DIA_CANTHAR_PICKPOCKET(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 900;
	condition = dia_canthar_pickpocket_condition;
	information = dia_canthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_canthar_pickpocket_condition()
{
	return c_beklauen(20,25);
};

func void dia_canthar_pickpocket_info()
{
	Info_ClearChoices(dia_canthar_pickpocket);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_BACK,dia_canthar_pickpocket_back);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_PICKPOCKET,dia_canthar_pickpocket_doit);
};

func void dia_canthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_canthar_pickpocket);
};

func void dia_canthar_pickpocket_back()
{
	Info_ClearChoices(dia_canthar_pickpocket);
};


instance DIA_CANTHAR_EXIT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 999;
	condition = dia_canthar_exit_condition;
	information = dia_canthar_exit_info;
	permanent = TRUE;
	description = "Musz� i��!";
};


func int dia_canthar_exit_condition()
{
	return TRUE;
};

func void dia_canthar_exit_info()
{
	AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//Musz� i��!
	AI_Output(self,other,"DIA_Canthar_EXIT_09_01");	//Jak sobie chcesz.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PERSONALCRIMES(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_personalcrimes_condition;
	information = dia_canthar_personalcrimes_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_personalcrimes_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_canthar_personalcrimes_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_00");	//Atak na mnie to by�o g�upie posuni�cie.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_01");	//Wydawa�o ci si�, �e �atwo mnie pokonasz?
	};
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_02");	//Albo to naprawisz, albo zadbam, �eby� gorzko po�a�owa� swego czynu!
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_15_03");	//A co konkretnie mia�e� na my�li?
	b_say_gold(self,other,100);
	Info_ClearChoices(dia_canthar_personalcrimes);
	Info_AddChoice(dia_canthar_personalcrimes,"Nie mam tyle!",dia_canthar_personalcrimes_notenough);
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_canthar_personalcrimes,"Oto twoje z�oto - zapomnijmy o ca�ej sprawie!",dia_canthar_personalcrimes_pay);
	};
};

func void dia_canthar_personalcrimes_pay()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_Pay_15_00");	//Oto twoje z�oto - zapomnijmy o ca�ej sprawie!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_Pay_09_01");	//Bardzo rozs�dnie!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_canthar_personalcrimes_notenough()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00");	//Nie mam tyle!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01");	//To dlaczego marnujesz m�j czas?
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_HALLO(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_hallo_condition;
	information = dia_canthar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_hallo_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_00");	//Kogo my tu mamy?
		AI_Output(self,other,"DIA_Canthar_Hallo_09_01");	//Idziesz do miasta - mam racj�?
		AI_Output(other,self,"DIA_Canthar_Hallo_15_02");	//Mo�e.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_03");	//Hmmm! Wygl�dasz na zbiega! Wszyscy zbiegowie kieruj� si� do miasta.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_04");	//Mo�e nawet jeste� by�ym skaza�cem z kopalni.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_05");	//Nie obchodzi mnie, sk�d przyszed�e�. Wydaje mi si� jednak, �e mam dla ciebie interesuj�c� ofert�...
		CANTHAR_GOTME = TRUE;
	}
	else if(Hlp_IsItem(itm,itar_bau_l) || Hlp_IsItem(itm,itar_bau_m))
	{
		AI_Output(self,other,"DIA_Canthar_HelloArmor_09_06");	//Jak tam robota, wie�niaku?
		Info_ClearChoices(dia_canthar_hallo);
		Info_AddChoice(dia_canthar_hallo,"Czy ja wygl�dam na wie�niaka?",dia_canthar_hallo_nobauer);
		Info_AddChoice(dia_canthar_hallo,"Nie mog� narzeka�.",dia_canthar_hallo_bauer);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_07");	//Co mog� dla ciebie zrobi�?
	};
};

func void dia_canthar_hallo_bauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_Bauer_15_00");	//Nie mog� narzeka�.
	AI_Output(self,other,"DIA_Canthar_Hallo_Bauer_09_01");	//Mog� co� dla ciebie zrobi�?
	Info_ClearChoices(dia_canthar_hallo);
};

func void dia_canthar_hallo_nobauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_NoBauer_15_00");	//Czy ja wygl�dam na wie�niaka?
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_01");	//Wygl�dasz jak wie�niak. Ale m�wisz inaczej!
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_02");	//Je�eli si� nie myl�, to mam dla ciebie interesuj�c� ofert�...
	CANTHAR_GOTME = TRUE;
	Info_ClearChoices(dia_canthar_hallo);
};


instance DIA_CANTHAR_WHATOFFER(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_whatoffer_condition;
	information = dia_canthar_whatoffer_info;
	permanent = FALSE;
	description = "Co chcesz mi zaproponowa�?";
};


func int dia_canthar_whatoffer_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_hallo))
	{
		return TRUE;
	};
};

func void dia_canthar_whatoffer_info()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_15_00");	//Co chcesz mi zaproponowa�?
	if(CANTHAR_GOTME == TRUE)
	{
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_01");	//Z takim wygl�dem stra�nicy nigdy nie wpuszcz� ci� do miasta.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_02");	//Je�eli dla stra�nik�w przy bramie b�dziesz r�wnie przekonuj�cy, jak teraz, to nigdy nie wpuszcz� ci� do miasta.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_03");	//Mog� ci pom�c dosta� si� do miasta.
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_04");	//Mam tu taki ma�y kawa�ek papieru. Jest na nim kr�lewska piecz�� i podpis gubernatora. To glejt.
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_05");	//Maj�c ten papier w kieszeni, mo�esz si� p�ta�, gdzie ci si� tam podoba, a stra�nicy nie b�d� ci� niepokoi�.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_06");	//Zainteresowany?
		Info_ClearChoices(dia_canthar_whatoffer);
		Info_AddChoice(dia_canthar_whatoffer,"Nie! Zatrzymaj sobie ten papier!",dia_canthar_whatoffer_no);
		Info_AddChoice(dia_canthar_whatoffer,"Co chcesz w zamian?",dia_canthar_whatoffer_price);
		Info_AddChoice(dia_canthar_whatoffer,"A jak TY dostaniesz si� do miasta?",dia_canthar_whatoffer_howyouin);
		Info_AddChoice(dia_canthar_whatoffer,"Musi by� w tym jaki� haczyk...",dia_canthar_whatoffer_strings);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_07");	//Jestem w�drownym kupcem. Handluj� wszystkim po trochu.
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Canthar handluje wszystkimi rodzajami or�a.");
};

func void dia_canthar_whatoffer_strings()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Strings_15_00");	//Musi by� w tym jaki� haczyk...
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Strings_09_01");	//Nie. Nie ma �adnego haczyka. B�dziesz mi tylko winien przys�ug�.
};

func void dia_canthar_whatoffer_howyouin()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");	//A jak TY dostaniesz si� do miasta?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_HowYouIn_09_01");	//Stra�nicy mnie znaj�. Powiem im po prostu, �e zgubi�em sw�j glejt.
};

func void dia_canthar_whatoffer_price()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_00");	//Co chcesz w zamian?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_01");	//WIEDZIA�EM, �e jeste� odpowiednim cz�owiekiem.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_02");	//Pos�uchaj. Dostaniesz ode mnie ten glejt.
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_03");	//Tak po prostu?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_04");	//Je�li jednak spotkamy si� w mie�cie, to jeste� mi winien przys�ug�.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_05");	//Umowa stoi?
	Info_AddChoice(dia_canthar_whatoffer,"Pewnie. Dawaj ten papier.",dia_canthar_whatoffer_ok);
};

func void dia_canthar_whatoffer_ok()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Ok_15_00");	//Pewnie. Dawaj ten papier.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_01");	//Masz. Uwa�aj na niego, jest bardzo cenny.
	CreateInvItems(self,itwr_passierschein,1);
	b_giveinvitems(self,other,itwr_passierschein,1);
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_02");	//Jeszcze jedno: nawet nie my�l o z�amaniu danego s�owa!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_03");	//Jako kupiec mam spore wp�ywy w mie�cie - nie sko�czy�oby si� to dla ciebie za dobrze, wierz mi!
	CANTHAR_GEFALLEN = TRUE;
	Info_ClearChoices(dia_canthar_whatoffer);
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"Kupiec Canthar wr�czy� mi przepustk�, dzi�ki kt�rej uzyskam wst�p do miasta. Jestem mu za to winien przys�ug�.");
};

func void dia_canthar_whatoffer_no()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_No_15_00");	//Nie! Zatrzymaj sobie ten papier!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_01");	//Hmmm. Wygl�da na to, �e �le ci� oceni�em, co?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_02");	//No dobra. Chcesz jeszcze czego�? Mo�e zainteresuje ci� co� z moich towar�w?
	Info_ClearChoices(dia_canthar_whatoffer);
};


instance DIA_CANTHAR_TRADE(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 888;
	condition = dia_canthar_trade_condition;
	information = dia_canthar_trade_info;
	permanent = TRUE;
	description = "Poka� mi, co masz na sprzeda�!";
	trade = TRUE;
};


func int dia_canthar_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_trade_info()
{
	AI_Output(other,self,"DIA_Canthar_TRADE_15_00");	//Poka� mi, co masz na sprzeda�!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//Wybierz sobie.
};


instance DIA_CANTHAR_PAYPRICEINCITY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_paypriceincity_condition;
	information = dia_canthar_paypriceincity_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_canthar_paypriceincity_condition()
{
	if((CANTHAR_INSTADT == TRUE) && (Npc_IsDead(sarah) == FALSE) && (CANTHAR_GOTME == TRUE))
	{
		return TRUE;
	};
};

func void dia_canthar_paypriceincity_info()
{
	if(CANTHAR_GEFALLEN == TRUE)
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_00");	//Wci�� mi jeste� winien przys�ug�. Pora, �eby� sp�aci� sw�j d�ug.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_01");	//Hej, ty, mam dla ciebie propozycj�.
	};
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_02");	//Czego chcesz?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_03");	//Chc� mie� z powrotem moje stoisko na targu. Sara mnie z niego wygryz�a.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_04");	//Korzysta�a z niego ju� dostatecznie d�ugo. Chc�, �eby zrezygnowa�a.
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_05");	//A co ja mam z tym wsp�lnego?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_06");	//Dam ci list, kt�ry musisz wsun�� jej do kieszeni.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_07");	//Potem p�jdziesz do Andre i powiesz mu, �e Sara sprzedaje bro� Onarowi.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_08");	//Ona wyl�duje w wi�zieniu, ty dostaniesz nagrod�, a ja odzyskam stragan.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_09");	//Masz na to dwa dni.
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_10");	//A co JA b�d� z tego mia�?
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_11");	//Kiedy ju� b�d� mia� stragan, dostaniesz ode mnie bro� - i to nie byle jak�.
	};
	Info_ClearChoices(dia_canthar_paypriceincity);
	Info_AddChoice(dia_canthar_paypriceincity,"Nie, nie wezm� w tym udzia�u.",dia_canthar_paypriceincity_nein);
	Info_AddChoice(dia_canthar_paypriceincity,"Dobrze, zrobi� to.",dia_canthar_paypriceincity_ok);
	Info_AddChoice(dia_canthar_paypriceincity,"A co si� stanie, je�li odm�wi�?",dia_canthar_paypriceincity_if);
};

func void dia_canthar_paypriceincity_if()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_if_15_00");	//A co si� stanie, je�li odm�wi�?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_01");	//To by�oby bardzo g�upie. Widzisz, ja wiem, �e jeste� zbieg�ym skaza�cem.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_02");	//Je�eli to si� rozniesie, mo�esz mie� powa�ne problemy...
};

func void dia_canthar_paypriceincity_nein()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Nein_15_00");	//Nie, nie wezm� w tym udzia�u.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Nein_09_01");	//B��dna decyzja, ch�opcze. Jeszcze sobie pogadamy.
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	Info_ClearChoices(dia_canthar_paypriceincity);
};

func void dia_canthar_paypriceincity_ok()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_00");	//No dobra, wygl�da na to, �e nie mam wyboru.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_01");	//Bystry z ciebie ch�opak. Oto list.
	CreateInvItems(self,itwr_canthars_komprobrief_mis,1);
	b_giveinvitems(self,other,itwr_canthars_komprobrief_mis,1);
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_02");	//Jak mam go jej podrzuci�?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_03");	//Pozw�l, �eby pokaza�a ci sw�j towar - wtedy ukryjesz list w jej kieszeni.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_04");	//Pami�taj, �e jestem wp�ywowym cz�owiekiem, wi�c nie pr�buj mnie oszuka�.
	MIS_CANTHARS_KOMPROBRIEF = LOG_RUNNING;
	MIS_CANTHARS_KOMPROBRIEF_DAY = Wld_GetDay();
	Log_CreateTopic(TOPIC_CANTHAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CANTHAR,LOG_RUNNING);
	if(CANTHAR_GEFALLEN == TRUE)
	{
		b_logentry(TOPIC_CANTHAR,"Canthar chce, abym mu si� odwdzi�czy�.");
	}
	else
	{
		b_logentry(TOPIC_CANTHAR,"Canthar obieca� mi, �e w zamian za przys�ug� odda mi jedn� ze swoich broni.");
	};
	b_logentry(TOPIC_CANTHAR,"Mam pod�o�y� handlarce Sarze fa�szywy list, z kt�rego wynika, �e sprzedawa�a bro� Onarowi. Potem mam na ni� donie�� Lordowi Andre.");
	Info_ClearChoices(dia_canthar_paypriceincity);
};


instance DIA_CANTHAR_SARAHERLEDIGT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_saraherledigt_condition;
	information = dia_canthar_saraherledigt_info;
	permanent = TRUE;
	description = "Co do tej Sary...";
};


func int dia_canthar_saraherledigt_condition()
{
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_canthar_saraherledigt_info()
{
	if(Npc_IsDead(sarah) == FALSE)
	{
		if(MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() + 2))
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_00");	//Nie masz czego� do zrobienia?
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_01");	//Najpierw podrzu� list Sarze, a potem id� do Andre i j� oskar�.
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_02");	//Zr�b to - i nie pr�buj mnie oszuka�, bo po�a�ujesz.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_03");	//Twoja sprawa, kiedy to zrobisz. Id�!
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Canthar_SARAHERLEDIGT_15_04");	//Sara nie �yje.
		AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_05");	//Naprawd�? Wspaniale. Zatem wykona�e� ju� p� naszej umowy.
		MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
		Npc_ExchangeRoutine(self,"MARKTSTAND");
	};
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_SUCCESS(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_success_condition;
	information = dia_canthar_success_info;
	permanent = FALSE;
	description = "Co do tej Sary...";
};


func int dia_canthar_success_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && (Npc_IsDead(sarah) == FALSE))
	{
		return TRUE;
	};
};

func void dia_canthar_success_info()
{
	AI_Output(self,other,"DIA_Canthar_Success_09_00");	//Dobra robota. Sara jest tam, gdzie jej miejsce.
	AI_Output(self,other,"DIA_Canthar_Success_09_01");	//Przej��em jej maj�tek, wi�c przyjd� do mnie, je�li potrzebujesz broni.
	if(KAPITEL == 1)
	{
		CreateInvItems(self,itmw_shortsword3,1);
		CreateInvItems(self,itmw_shortsword4,1);
		CreateInvItems(self,itmw_shortsword5,1);
		CreateInvItems(self,itmw_kriegshammer1,1);
		CreateInvItems(self,itmw_1h_vlk_sword,1);
		CreateInvItems(self,itmw_1h_nov_mace,1);
	};
	if(KAPITEL == 2)
	{
		CreateInvItems(self,itmw_stabkeule,1);
		CreateInvItems(self,itmw_steinbrecher,1);
		CreateInvItems(self,itmw_schwert2,1);
		CreateInvItems(self,itmw_bartaxt,1);
	};
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_Success_15_02");	//Mia�e� da� mi bro�.
		AI_Output(self,other,"DIA_Canthar_Success_09_03");	//Dok�adnie. Masz, ta bro� to mistrzowskie dzie�o sztuki kowalskiej.
		b_giveinvitems(self,other,itmw_schiffsaxt,1);
	};
	b_giveplayerxp(XP_CANTHARS_KOMPROBRIEF);
};


instance DIA_CANTHAR_AGAIN(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_again_condition;
	information = dia_canthar_again_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_again_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_again_info()
{
	AI_Output(self,other,"DIA_Canthar_Again_09_00");	//Och, to znowu ty.
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_FAILED)
	{
		AI_Output(other,self,"DIA_Canthar_Again_15_01");	//Dlaczego nie siedzisz w wi�zieniu?
		AI_Output(self,other,"DIA_Canthar_Again_09_02");	//Zosta�em zwolniony. Ju� ci m�wi�em - mam spore wp�ywy w mie�cie.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_03");	//W mi�dzyczasie sam si� zaj��em Sar�. Mo�esz zapomnie� o tej sprawie z listem.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_04");	//Chyba ci� ostrzega�em? By�oby lepiej, gdyby� zrobi� to, co ci kaza�em.
	};
	AI_Output(self,other,"DIA_Canthar_Again_09_05");	//W�r�d kupc�w chodz� s�uchy, �e jeste� skaza�cem.
	AI_Output(self,other,"DIA_Canthar_Again_09_06");	//Przykra sprawa - teraz na targu nie kupisz ju� nawet bochenka chleba.
	AI_Output(self,other,"DIA_Canthar_Again_09_07");	//M�g�bym oczywi�cie rozwi�za� twoje problemy za, powiedzmy...
	b_say_gold(self,other,CANTHAR_GOLD);
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PAY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_pay_condition;
	information = dia_canthar_pay_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_pay_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_again) && (CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_pay_info()
{
	AI_Output(self,other,"DIA_Canthar_Pay_09_00");	//Przyszed�e� zap�aci�?
	Info_ClearChoices(dia_canthar_pay);
	if(Npc_HasItems(other,itmi_gold) >= CANTHAR_GOLD)
	{
		Info_AddChoice(dia_canthar_pay,"Dobrze, zap�ac�.",dia_canthar_pay_ja);
	};
	Info_AddChoice(dia_canthar_pay,"Nie mam przy sobie do�� pieni�dzy...",dia_canthar_pay_nein);
	Info_AddChoice(dia_canthar_pay,"Ile to mia�o by�?",dia_canthar_pay_wieviel);
};

func void dia_canthar_pay_ja()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Ja_15_00");	//Dobra, zap�ac�. Nie mam wyboru.
	b_giveinvitems(other,self,itmi_gold,CANTHAR_GOLD);
	AI_Output(self,other,"DIA_Canthar_Pay_Ja_09_01");	//Dobrze. Zadbam o to, �eby twoja reputacja u kupc�w si� poprawi�a.
	CANTHAR_SPERRE = FALSE;
	CANTHAR_PAY = TRUE;
	Info_ClearChoices(dia_canthar_pay);
};

func void dia_canthar_pay_nein()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Nein_15_00");	//Nie mam przy sobie do�� pieni�dzy...
	AI_Output(self,other,"DIA_Canthar_Pay_Nein_09_01");	//Bierz.
	Info_ClearChoices(dia_canthar_pay);
	AI_StopProcessInfos(self);
};

func void dia_canthar_pay_wieviel()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Wieviel_15_00");	//Ile to mia�o by�?
	b_say_gold(self,other,CANTHAR_GOLD);
};


instance DIA_CANTHAR_CANTHARANGEPISST(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_cantharangepisst_condition;
	information = dia_canthar_cantharangepisst_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_canthar_cantharangepisst_condition()
{
	if((CANTHAR_AUSGELIEFERT == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_cantharangepisst_info()
{
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_00");	//Ostrzega�em ci�, ale ty nie s�uchasz. Om�wmy to p�niej.
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_01");	//A teraz zje�d�aj, chc� odpocz��.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_MINENANTEIL(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 3;
	condition = dia_canthar_minenanteil_condition;
	information = dia_canthar_minenanteil_info;
	description = "Sprzedajesz nielegalne udzia�y w kopalni!";
};


func int dia_canthar_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_minenanteil_info()
{
	AI_Output(other,self,"DIA_Canthar_Minenanteil_15_00");	//Sprzedajesz nielegalne udzia�y w kopalni!
	AI_Output(self,other,"DIA_Canthar_Minenanteil_09_01");	//Tak, i co? Co z tego! Je�li ja tego nie zrobi�, zajmie si� tym kto� inny.
	b_giveplayerxp(XP_AMBIENT);
};

