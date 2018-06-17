
instance DIA_GRITTA_EXIT(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 999;
	condition = dia_gritta_exit_condition;
	information = dia_gritta_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gritta_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_gritta_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_PICKPOCKET(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 900;
	condition = dia_gritta_pickpocket_condition;
	information = dia_gritta_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_gritta_pickpocket_condition()
{
	return c_beklauen(20,20);
};

func void dia_gritta_pickpocket_info()
{
	Info_ClearChoices(dia_gritta_pickpocket);
	Info_AddChoice(dia_gritta_pickpocket,DIALOG_BACK,dia_gritta_pickpocket_back);
	Info_AddChoice(dia_gritta_pickpocket,DIALOG_PICKPOCKET,dia_gritta_pickpocket_doit);
};

func void dia_gritta_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gritta_pickpocket);
};

func void dia_gritta_pickpocket_back()
{
	Info_ClearChoices(dia_gritta_pickpocket);
};


instance DIA_GRITTA_HELLO(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 10;
	condition = dia_gritta_hello_condition;
	information = dia_gritta_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_gritta_hello_info()
{
	AI_Output(self,other,"DIA_Gritta_Hello_16_00");	//Czego tutaj chcesz? Je�li przyszed�e� na �ebry, to musz� ci� rozczarowa�. Jestem biedn� wdow�.
	AI_Output(self,other,"DIA_Gritta_Hello_16_01");	//Nazywam si� Gritta. Od kiedy umar� m�j m��, prowadz� gospodarstwo mojego wuja, Thorbena.
};


instance DIA_GRITTA_WANTSMONEY(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wantsmoney_condition;
	information = dia_gritta_wantsmoney_info;
	permanent = FALSE;
	description = "Przysy�a mnie Matteo. Wci�� jeste� mu winna z�oto.";
};


func int dia_gritta_wantsmoney_condition()
{
	if(MIS_MATTEO_GOLD == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int gritta_wantpay;
var int gritta_threatened;

func void dia_gritta_wantsmoney_info()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_15_00");	//Przysy�a mnie Matteo. Wci�� jeste� mu winna z�oto.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_01");	//Chce dosta� pieni�dze? Niby za co? Dostarczone ubrania by�y wadliwe, wykonane z kiepskich materia��w i �le skrojone.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_02");	//A widzia�e� te kolory? To nie jest towar, kt�ry zam�wi�am. To jest zwyczajne wy�udzenie!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_03");	//Kiedy jeszcze m�j m�� chodzi� po tym �wiecie, ta gnida nigdy by si� na to nie odwa�y�a. Och, m�j biedny m��...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Do�� tego. Gdzie z�oto?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Kontynuuj...",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_continue01()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue01_16_00");	//By� takim dobrym cz�owiekiem. Przystojny, pracowity, sympatyczny. Mieli�my wszystko - pieni�dze, szcz�cie...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_01");	//Czasami dostawali�my nawet zaproszenia na przer�ne imprezy organizowane przez arystokracj�. Ach, te wszystkie pi�kne ubrania, te fryzury...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_02");	//Te wykwintne potrawy i kulturalne rozmowy. Kiedy� wszystko by�o lepsze. Nikt nie odwa�y�by si� poni�a� biednej wdowy tak idiotycznymi roszczeniami.
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Do�� tego. Gdzie z�oto?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Kontynuuj...",dia_gritta_wantsmoney_continue02);
};

func void dia_gritta_wantsmoney_continue02()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue02_16_00");	//Co mam teraz zrobi�? Moje zarobki pokrywaj� jedynie najbardziej podstawowe potrzeby, a i to z ledwo�ci�. Na ulicach widzi si� coraz wi�cej biedy...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_01");	//Ludzie musz� sobie wszystkiego odmawia�. Od tygodni nie przyp�yn�� tu �aden statek. M�j m�� by� kapitanem statku handlowego - a raczej jego w�a�cicielem...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_02");	//Z dalekich podr�y zawsze przywozi� mi jakie� prezenty - kosztowne tkaniny z kontynentu, drogie przyprawy z po�udniowych krain...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Do�� tego. Gdzie z�oto?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Kontynuuj...",dia_gritta_wantsmoney_continue03);
};

func void dia_gritta_wantsmoney_continue03()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue03_16_00");	//Wi�kszo�� ludzi nawet nie s�ysza�a o takich rzeczach. Jednak pewnego dnia dosta�am wiadomo��, �e Gritta zaton�a. Tak si� nazywa� statek mojego m�a. Nazwa� go moim imieniem...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue03_16_01");	//...z mi�o�ci do mnie. P�aka�am i modli�am si�, aby m�j m�� prze�y� t� katastrof�, ka�dego dnia wygl�da�am jego powrotu, albo chocia� jakiej� wiadomo�ci, ale na pr�no...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_02");	//Niech Innos zlituje si� nad jego dusz�. Niech spoczywa w pokoju. Od czasu jego �mierci mam tylko same problemy, a teraz jeszcze ten bezduszny, chciwy Matteo...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_03");	//...chce odebra� mi resztki moich oszcz�dno�ci. Prosz�, zlituj si� nad nieszcz�sn� kobiet�. Gdyby m�j m�� nadal �y�, ta gnida nigdy by si� na to nie odwa�y�a... Och, m�j biedny m��...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Do�� tego. Gdzie z�oto?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Kontynuuj...",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_wheremoney()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_WhereMoney_15_00");	//Do�� tego. Gdzie z�oto?
	AI_Output(self,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01");	//Ale ja nie mam �adnych pieni�dzy, jestem tylko biedn� wdow�!
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Dawaj kas� albo oberwiesz...",dia_gritta_wantsmoney_beatup);
	Info_AddChoice(dia_gritta_wantsmoney,"Wygl�da wi�c na to, �e b�dziemy musieli sprzeda� twoje graty...",dia_gritta_wantsmoney_enoughstuff);
	Info_AddChoice(dia_gritta_wantsmoney,"Zap�ac� za ciebie.",dia_gritta_wantsmoney_iwillpay);
};

func void dia_gritta_wantsmoney_enoughstuff()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_00");	//Sprzedamy po prostu kilka twoich ubra�. Jestem pewien, �e masz jeszcze jakie� drogie suknie w swojej garderobie...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01");	//Jak �miesz, troglodyto! Dobrze, we� to z�oto.
	b_giveinvitems(self,other,itmi_gold,100);
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_02");	//Widzisz, to nie by�o takie trudne.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03");	//A teraz wyno� si� z mojego domu.
	GRITTA_GOLDGIVEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_gritta_wantsmoney_iwillpay()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_00");	//Zap�ac� za ciebie.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_01");	//Zrobi�by� to? Och, wiedzia�am, �e nie jeste� takim chciwym draniem jak Matteo!
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_02");	//Tak, tak, to drobiazg.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_03");	//Wr�� tutaj, kiedy ju� to za�atwisz. Chcia�abym ci okaza� swoj� wdzi�czno��.
	Info_ClearChoices(dia_gritta_wantsmoney);
	GRITTA_WANTPAY = TRUE;
};

func void dia_gritta_wantsmoney_beatup()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_BeatUp_15_00");	//Dawaj kas� albo oberwiesz...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_BeatUp_16_01");	//Jeste� zwyk�ym oprychem. No dalej, si�gnij po bro�, a wezw� stra�!
	GRITTA_THREATENED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_WINE(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wine_condition;
	information = dia_gritta_wine_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_wine_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GRITTA_WANTPAY == TRUE) && (MIS_MATTEO_GOLD == LOG_SUCCESS) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		return TRUE;
	};
};

func void dia_gritta_wine_info()
{
	AI_Output(self,other,"DIA_Gritta_WINE_16_00");	//To by�o bardzo szlachetne, �e zgodzi�e� si� za mnie zap�aci�. Chcia�abym okaza� ci moj� wdzi�czno��.
	AI_Output(self,other,"DIA_Gritta_WINE_16_01");	//Oto butelka wina, kt�r� m�j m��, niechaj Innos przyjmie do siebie jego dusz�, przywi�z� z po�udniowych wysp.
	AI_Output(self,other,"DIA_Gritta_WINE_16_02");	//Opowiem o tym, co dla mnie zrobi�e�, wszystkim moim znajomym. Jest jeszcze na tym �wiecie kto�, kto wie co to honor, i kto...
	AI_Output(other,self,"DIA_Gritta_WINE_15_03");	//Tak, oczywi�cie, to drobiazg.
	b_giveplayerxp(XP_PAYFORGRITTA);
	b_giveinvitems(self,other,itfo_wine,1);
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_PERM(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 3;
	condition = dia_gritta_perm_condition;
	information = dia_gritta_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gritta_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_gritta_wantsmoney) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_gritta_perm_info()
{
	if(Npc_KnowsInfo(other,dia_gritta_wine) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_00");	//Dop�ki w tym mie�cie s� tacy jak ty, wierz�, �e przyjd� jeszcze lepsze czasy.
	}
	else if((GRITTA_WANTPAY == TRUE) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_01");	//Wr��, kiedy ju� za�atwisz spraw� z tym niegodziwcem.
	}
	else if((GRITTA_THREATENED == TRUE) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_02");	//Czemu tak stoisz jak kompletny idiota? I tak nie odwa�ysz si� mnie zaatakowa�!
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_03");	//Czego jeszcze chcesz? Dosta�e� ju� z�oto, wi�c wyno� si� st�d!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_KAP3_EXIT(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 999;
	condition = dia_gritta_kap3_exit_condition;
	information = dia_gritta_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gritta_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_gritta_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int grittaxp_once;

instance DIA_GRITTA_PERM3U4U5(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 31;
	condition = dia_gritta_perm3u4u5_condition;
	information = dia_gritta_perm3u4u5_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_gritta_perm3u4u5_condition()
{
	return TRUE;
};

func void dia_gritta_perm3u4u5_info()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_00");	//Co s�ycha�?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_01");	//Wszystko tutaj schodzi na psy. Gdziekolwiek si� cz�owiek nie obejrzy, wsz�dzie przemoc i grabie�e. Wyobra� sobie, �e zamordowali nawet jednego paladyna.
			Info_ClearChoices(dia_gritta_perm3u4u5);
			Info_AddChoice(dia_gritta_perm3u4u5,DIALOG_BACK,dia_gritta_perm3u4u5_back);
			Info_AddChoice(dia_gritta_perm3u4u5,"Takich rzeczy nie mo�na unikn�� w czasie wojny.",dia_gritta_perm3u4u5_war);
			Info_AddChoice(dia_gritta_perm3u4u5,"Wszystko b�dzie dobrze.",dia_gritta_perm3u4u5_turnsgood);
			Info_AddChoice(dia_gritta_perm3u4u5,"Co s�ysza�a�?",dia_gritta_perm3u4u5_rumors);
		}
		else
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_02");	//Och, tak si� ciesz�, �e Lord Hagen wypu�ci� tego najemnika.
			AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_03");	//A jakie to ma znaczenie?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_04");	//Zastan�w si� przez chwil�. Czy s�dzisz, �e najemnicy staliby spokojnie i przygl�dali si�, jak wieszaj� jednego z nich?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_05");	//Nie! Pr�bowaliby go uwolni�, a wtedy na pewno dosz�oby do rozlewu krwi.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_06");	//Paladyni przygotowuj� si� chyba do opuszczenia tego miejsca.
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_07");	//Wszystko po staremu, ale nie chc� narzeka�.
	};
};

func void dia_gritta_perm3u4u5_back()
{
	Info_ClearChoices(dia_gritta_perm3u4u5);
};

func void dia_gritta_perm3u4u5_war()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_War_15_00");	//Takich rzeczy nie mo�na unikn�� w czasie wojny.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_01");	//Tak, to wszystko wina tej okropnej wojny. Wszyscy cierpi� i zastanawiaj� si�, jak uda im si� przetrwa�.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_02");	//Czasami zadaj� sobie pytanie, za jakie grzechy Innos zes�a� na mnie tak straszliw� kar�.
};

func void dia_gritta_perm3u4u5_turnsgood()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00");	//Wszystko b�dzie dobrze.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01");	//Pr�bujesz mnie pocieszy�. Dzi�kuj�, to mi�e.
	if(GRITTAXP_ONCE == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		GRITTAXP_ONCE = TRUE;
	};
};

func void dia_gritta_perm3u4u5_rumors()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_Rumors_15_00");	//Co s�ysza�a�?
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01");	//Tylko to, co ludzie powtarzaj� sobie na ulicach.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02");	//Podobno ju� schwytali morderc�, ale nie wiem, czy to prawda.
};

