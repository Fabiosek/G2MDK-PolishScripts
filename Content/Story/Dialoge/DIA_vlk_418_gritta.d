
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
	AI_Output(self,other,"DIA_Gritta_Hello_16_00");	//Czego tutaj chcesz? Jeœli przyszed³eœ na ¿ebry, to muszê ciê rozczarowaæ. Jestem biedn¹ wdow¹.
	AI_Output(self,other,"DIA_Gritta_Hello_16_01");	//Nazywam siê Gritta. Od kiedy umar³ mój m¹¿, prowadzê gospodarstwo mojego wuja, Thorbena.
};


instance DIA_GRITTA_WANTSMONEY(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wantsmoney_condition;
	information = dia_gritta_wantsmoney_info;
	permanent = FALSE;
	description = "Przysy³a mnie Matteo. Wci¹¿ jesteœ mu winna z³oto.";
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
	AI_Output(other,self,"DIA_Gritta_WantsMoney_15_00");	//Przysy³a mnie Matteo. Wci¹¿ jesteœ mu winna z³oto.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_01");	//Chce dostaæ pieni¹dze? Niby za co? Dostarczone ubrania by³y wadliwe, wykonane z kiepskich materia³ów i Ÿle skrojone.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_02");	//A widzia³eœ te kolory? To nie jest towar, który zamówi³am. To jest zwyczajne wy³udzenie!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_03");	//Kiedy jeszcze mój m¹¿ chodzi³ po tym œwiecie, ta gnida nigdy by siê na to nie odwa¿y³a. Och, mój biedny m¹¿...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Doœæ tego. Gdzie z³oto?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Kontynuuj...",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_continue01()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue01_16_00");	//By³ takim dobrym cz³owiekiem. Przystojny, pracowity, sympatyczny. Mieliœmy wszystko - pieni¹dze, szczêœcie...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_01");	//Czasami dostawaliœmy nawet zaproszenia na przeró¿ne imprezy organizowane przez arystokracjê. Ach, te wszystkie piêkne ubrania, te fryzury...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_02");	//Te wykwintne potrawy i kulturalne rozmowy. Kiedyœ wszystko by³o lepsze. Nikt nie odwa¿y³by siê poni¿aæ biednej wdowy tak idiotycznymi roszczeniami.
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Doœæ tego. Gdzie z³oto?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Kontynuuj...",dia_gritta_wantsmoney_continue02);
};

func void dia_gritta_wantsmoney_continue02()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue02_16_00");	//Co mam teraz zrobiæ? Moje zarobki pokrywaj¹ jedynie najbardziej podstawowe potrzeby, a i to z ledwoœci¹. Na ulicach widzi siê coraz wiêcej biedy...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_01");	//Ludzie musz¹ sobie wszystkiego odmawiaæ. Od tygodni nie przyp³yn¹³ tu ¿aden statek. Mój m¹¿ by³ kapitanem statku handlowego - a raczej jego w³aœcicielem...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_02");	//Z dalekich podró¿y zawsze przywozi³ mi jakieœ prezenty - kosztowne tkaniny z kontynentu, drogie przyprawy z po³udniowych krain...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Doœæ tego. Gdzie z³oto?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Kontynuuj...",dia_gritta_wantsmoney_continue03);
};

func void dia_gritta_wantsmoney_continue03()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue03_16_00");	//Wiêkszoœæ ludzi nawet nie s³ysza³a o takich rzeczach. Jednak pewnego dnia dosta³am wiadomoœæ, ¿e Gritta zatonê³a. Tak siê nazywa³ statek mojego mê¿a. Nazwa³ go moim imieniem...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue03_16_01");	//...z mi³oœci do mnie. P³aka³am i modli³am siê, aby mój m¹¿ prze¿y³ tê katastrofê, ka¿dego dnia wygl¹da³am jego powrotu, albo chocia¿ jakiejœ wiadomoœci, ale na pró¿no...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_02");	//Niech Innos zlituje siê nad jego dusz¹. Niech spoczywa w pokoju. Od czasu jego œmierci mam tylko same problemy, a teraz jeszcze ten bezduszny, chciwy Matteo...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_03");	//...chce odebraæ mi resztki moich oszczêdnoœci. Proszê, zlituj siê nad nieszczêsn¹ kobiet¹. Gdyby mój m¹¿ nadal ¿y³, ta gnida nigdy by siê na to nie odwa¿y³a... Och, mój biedny m¹¿...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Doœæ tego. Gdzie z³oto?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Kontynuuj...",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_wheremoney()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_WhereMoney_15_00");	//Doœæ tego. Gdzie z³oto?
	AI_Output(self,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01");	//Ale ja nie mam ¿adnych pieniêdzy, jestem tylko biedn¹ wdow¹!
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Dawaj kasê albo oberwiesz...",dia_gritta_wantsmoney_beatup);
	Info_AddChoice(dia_gritta_wantsmoney,"Wygl¹da wiêc na to, ¿e bêdziemy musieli sprzedaæ twoje graty...",dia_gritta_wantsmoney_enoughstuff);
	Info_AddChoice(dia_gritta_wantsmoney,"Zap³acê za ciebie.",dia_gritta_wantsmoney_iwillpay);
};

func void dia_gritta_wantsmoney_enoughstuff()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_00");	//Sprzedamy po prostu kilka twoich ubrañ. Jestem pewien, ¿e masz jeszcze jakieœ drogie suknie w swojej garderobie...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01");	//Jak œmiesz, troglodyto! Dobrze, weŸ to z³oto.
	b_giveinvitems(self,other,itmi_gold,100);
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_02");	//Widzisz, to nie by³o takie trudne.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03");	//A teraz wynoœ siê z mojego domu.
	GRITTA_GOLDGIVEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_gritta_wantsmoney_iwillpay()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_00");	//Zap³acê za ciebie.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_01");	//Zrobi³byœ to? Och, wiedzia³am, ¿e nie jesteœ takim chciwym draniem jak Matteo!
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_02");	//Tak, tak, to drobiazg.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_03");	//Wróæ tutaj, kiedy ju¿ to za³atwisz. Chcia³abym ci okazaæ swoj¹ wdziêcznoœæ.
	Info_ClearChoices(dia_gritta_wantsmoney);
	GRITTA_WANTPAY = TRUE;
};

func void dia_gritta_wantsmoney_beatup()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_BeatUp_15_00");	//Dawaj kasê albo oberwiesz...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_BeatUp_16_01");	//Jesteœ zwyk³ym oprychem. No dalej, siêgnij po broñ, a wezwê stra¿!
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
	AI_Output(self,other,"DIA_Gritta_WINE_16_00");	//To by³o bardzo szlachetne, ¿e zgodzi³eœ siê za mnie zap³aciæ. Chcia³abym okazaæ ci moj¹ wdziêcznoœæ.
	AI_Output(self,other,"DIA_Gritta_WINE_16_01");	//Oto butelka wina, któr¹ mój m¹¿, niechaj Innos przyjmie do siebie jego duszê, przywióz³ z po³udniowych wysp.
	AI_Output(self,other,"DIA_Gritta_WINE_16_02");	//Opowiem o tym, co dla mnie zrobi³eœ, wszystkim moim znajomym. Jest jeszcze na tym œwiecie ktoœ, kto wie co to honor, i kto...
	AI_Output(other,self,"DIA_Gritta_WINE_15_03");	//Tak, oczywiœcie, to drobiazg.
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
		AI_Output(self,other,"DIA_Gritta_PERM_16_00");	//Dopóki w tym mieœcie s¹ tacy jak ty, wierzê, ¿e przyjd¹ jeszcze lepsze czasy.
	}
	else if((GRITTA_WANTPAY == TRUE) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_01");	//Wróæ, kiedy ju¿ za³atwisz sprawê z tym niegodziwcem.
	}
	else if((GRITTA_THREATENED == TRUE) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_02");	//Czemu tak stoisz jak kompletny idiota? I tak nie odwa¿ysz siê mnie zaatakowaæ!
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_03");	//Czego jeszcze chcesz? Dosta³eœ ju¿ z³oto, wiêc wynoœ siê st¹d!
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
	description = "Co s³ychaæ?";
};


func int dia_gritta_perm3u4u5_condition()
{
	return TRUE;
};

func void dia_gritta_perm3u4u5_info()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_00");	//Co s³ychaæ?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_01");	//Wszystko tutaj schodzi na psy. Gdziekolwiek siê cz³owiek nie obejrzy, wszêdzie przemoc i grabie¿e. WyobraŸ sobie, ¿e zamordowali nawet jednego paladyna.
			Info_ClearChoices(dia_gritta_perm3u4u5);
			Info_AddChoice(dia_gritta_perm3u4u5,DIALOG_BACK,dia_gritta_perm3u4u5_back);
			Info_AddChoice(dia_gritta_perm3u4u5,"Takich rzeczy nie mo¿na unikn¹æ w czasie wojny.",dia_gritta_perm3u4u5_war);
			Info_AddChoice(dia_gritta_perm3u4u5,"Wszystko bêdzie dobrze.",dia_gritta_perm3u4u5_turnsgood);
			Info_AddChoice(dia_gritta_perm3u4u5,"Co s³ysza³aœ?",dia_gritta_perm3u4u5_rumors);
		}
		else
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_02");	//Och, tak siê cieszê, ¿e Lord Hagen wypuœci³ tego najemnika.
			AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_03");	//A jakie to ma znaczenie?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_04");	//Zastanów siê przez chwilê. Czy s¹dzisz, ¿e najemnicy staliby spokojnie i przygl¹dali siê, jak wieszaj¹ jednego z nich?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_05");	//Nie! Próbowaliby go uwolniæ, a wtedy na pewno dosz³oby do rozlewu krwi.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_06");	//Paladyni przygotowuj¹ siê chyba do opuszczenia tego miejsca.
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_07");	//Wszystko po staremu, ale nie chcê narzekaæ.
	};
};

func void dia_gritta_perm3u4u5_back()
{
	Info_ClearChoices(dia_gritta_perm3u4u5);
};

func void dia_gritta_perm3u4u5_war()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_War_15_00");	//Takich rzeczy nie mo¿na unikn¹æ w czasie wojny.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_01");	//Tak, to wszystko wina tej okropnej wojny. Wszyscy cierpi¹ i zastanawiaj¹ siê, jak uda im siê przetrwaæ.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_02");	//Czasami zadajê sobie pytanie, za jakie grzechy Innos zes³a³ na mnie tak straszliw¹ karê.
};

func void dia_gritta_perm3u4u5_turnsgood()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00");	//Wszystko bêdzie dobrze.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01");	//Próbujesz mnie pocieszyæ. Dziêkujê, to mi³e.
	if(GRITTAXP_ONCE == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		GRITTAXP_ONCE = TRUE;
	};
};

func void dia_gritta_perm3u4u5_rumors()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_Rumors_15_00");	//Co s³ysza³aœ?
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01");	//Tylko to, co ludzie powtarzaj¹ sobie na ulicach.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02");	//Podobno ju¿ schwytali mordercê, ale nie wiem, czy to prawda.
};

