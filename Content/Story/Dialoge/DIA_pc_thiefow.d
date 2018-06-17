
instance DIA_DIEGOOW_EXIT(C_INFO)
{
	npc = pc_thiefow;
	nr = 999;
	condition = dia_diegoow_exit_condition;
	information = dia_diegoow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegoow_exit_condition()
{
	return TRUE;
};

func void dia_diegoow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGOOW_HALLO(C_INFO)
{
	npc = pc_thiefow;
	nr = 1;
	condition = dia_diegoow_hallo_condition;
	information = dia_diegoow_hallo_info;
	important = TRUE;
};


func int dia_diegoow_hallo_condition()
{
	return TRUE;
};

func void dia_diegoow_hallo_info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Hej, my�la�em, �e nie �yjesz.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Taa... te� tak my�la�em.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//Ale wr�ci�em i szukam dowodu na pojawienie si� smok�w.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Czy�by? A dla kogo pracujesz?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//Dla Lorda Hagena. Tylko paladyni mog� powstrzyma� smoki.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//Paladyni?! Co� ci powiem. Kiedy uda�o mi si� st�d uciec, poszed�em do Khorinis.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//Zamierza�em uprzedzi� paladyn�w o smokach. Nie wiem, po co w og�le pr�bowa�em.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//Ten nad�ty g�upiec, Lothar, nawet nie chcia� mnie wys�ucha�, a ju� na pewno nie zamierza� dopu�ci� mnie przed oblicze Hagena.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//Wys�ali mnie tylko ze swoj� ekspedycj�. Wi�c nie m�w mi, jakim to wybawieniem s� paladyni...
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//Tak czy inaczej - smoki trzeba powstrzyma�, p�ki jeszcze jest czas. Niewa�ne, kto tego dokona.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Powstrzyma�? Chyba �artujesz? Musimy si� wynosi� z tej doliny, ot co!
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Powiedz, jak uda�o ci si� przej�� przez prze��cz? My�la�em, �e a� roi si� od ork�w.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Przez opuszczon� kopalni� prowadzi �cie�ka, na kt�rej nie ma ork�w.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//Dobrze wiedzie�. Zatem nied�ugo wyrusz� do Khorinis. Mam tam par� rachunk�w do wyr�wnania.
};


instance DIA_DIEGOOW_BEWEISE(C_INFO)
{
	npc = pc_thiefow;
	nr = 2;
	condition = dia_diegoow_beweise_condition;
	information = dia_diegoow_beweise_info;
	description = "Potrzebuj� dowodu na ich istnienie.";
};


func int dia_diegoow_beweise_condition()
{
	return TRUE;
};

func void dia_diegoow_beweise_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Potrzebuj� dowodu na ich istnienie.
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Dobra, pomog� ci w miar� mo�liwo�ci. Ale nie zamierzam za nikogo nadstawia� karku, jasne?
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//C�, skoro nalegasz. Porozmawiaj z kapitanem Garondem.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Je�li kto� mo�e potwierdzi� obecno�� smok�w, to w�a�nie ch�opcy z zamku.
	};
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Garond wys�a� mnie z pewn� misj�. Chce wiedzie�, ile rudy wydobyto do tej pory.
		AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//A potem da ci dow�d, kt�rego tak potrzebujesz?
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//W�a�nie. Wi�c jak, mo�esz mi co� powiedzie�?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Garond_11_01");	//Jak ju� b�dziesz na zamku, to daj zna� Garondowi o pewnej sprawie, kt�ra go chyba bardzo zainteresuje...
	};
	if(Npc_GetDistToWP(self,"LOCATION_02_05") <= 1000)
	{
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Na dnie tej jaskini s� CZTERY skrzynie rudy. Wydobyli j� ludzie Silvestra.
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Je�li Garond zechce, mo�e tu przyj�� i je sobie wzi��, ale mnie tu ju� wtedy nie b�dzie.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_01");	//Niedaleko od jaskini, w kt�rej si� ukrywa�em, znajduj� si� a� CZTERY skrzynie pe�ne rudy. Wydobyli j� ludzie Silvestro.
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_02");	//Niech je sobie Garond bierze - mnie si� i tak nie przydadz�.
	};
	SILVESTRO_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Diego zabezpieczy� CZTERY skrzynie rudy wydobytej przez g�rnik�w Silvestra.");
};


instance DIA_DIEGOOW_MINE(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_mine_condition;
	information = dia_diegoow_mine_info;
	permanent = FALSE;
	description = "W jaki spos�b zdoby�e� t� rud�?";
};


func int dia_diegoow_mine_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_beweise))
	{
		return TRUE;
	};
};

func void dia_diegoow_mine_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//W jaki spos�b zdoby�e� t� rud�?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//By�em w oddziale Silvestra. Przez kilka dni prowadzili�my wydobycie, a� Silvestro zrobi� si� nagle strasznie nerwowy.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Powiedzia�, �e musimy zabra� urobek w bezpieczne miejsce.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//Jako �e od pewnego czasu planowa�em da� nog�, zg�osi�em si� na ochotnika.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//I dobrze zrobi�em, bo g�rnicy wpadli wkr�tce potem na stado pe�zaczy. Nikt nie prze�y�.
};


instance DIA_DIEGOOW_RITTER(C_INFO)
{
	npc = pc_thiefow;
	nr = 4;
	condition = dia_diegoow_ritter_condition;
	information = dia_diegoow_ritter_info;
	permanent = FALSE;
	description = "Przed twoj� kryj�wk� le�� zw�oki dw�ch rycerzy...";
};


func int dia_diegoow_ritter_condition()
{
	if((Npc_HasItems(pal_leiche4,itmi_oldcoin) == 0) || (Npc_HasItems(pal_leiche5,itmi_oldcoin) == 0))
	{
		return TRUE;
	};
};

func void dia_diegoow_ritter_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//Przed twoj� kryj�wk� le�� zw�oki dw�ch rycerzy...
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Polegli bohatersko w walce ze stadem z�baczy.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//G�rnicza Dolina rz�dzi si� w�asnymi prawami. Ostrzega�em ich, ale nie chcieli mnie s�ucha�.
};


instance DIA_DIEGOOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 5;
	condition = dia_diegoow_perm_condition;
	information = dia_diegoow_perm_info;
	permanent = FALSE;
	description = "Co powinienem wiedzie� o dolinie?";
};


func int dia_diegoow_perm_condition()
{
	return TRUE;
};

func void dia_diegoow_perm_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Co powinienem wiedzie� o dolinie?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Od upadku Bariery sporo si� pozmienia�o. Teraz rz�dz� tu orkowie.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//A ludzie s� tylko �yw� karm� dla prawdziwych w�adc�w doliny: smok�w.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Trzymaj si� z dala od wszystkiego, co jest silniejsze od ciebie, zw�aszcza je�li przypomina z wygl�du smoka.
};


instance DIA_DIEGOOW_GORN(C_INFO)
{
	npc = pc_thiefow;
	nr = 6;
	condition = dia_diegoow_gorn_condition;
	information = dia_diegoow_gorn_info;
	permanent = FALSE;
	description = "Chcia�bym wykupi� Gorna...";
};


func int dia_diegoow_gorn_condition()
{
	if(MIS_RESCUEGORN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_diegoow_gorn_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Chcia�bym wykupi� Gorna, ale Garond domaga si� za niego 1000 sztuk z�ota.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Niez�a sumka. Mam przy sobie 300 sztuk, mo�esz je wzi��, je�li chcesz. Reszt� musisz zdoby� sam.
	b_giveinvitems(self,other,itmi_gold,300);
	b_logentry(TOPIC_RESCUEGORN,"Diego przekaza� 300 sztuk z�ota na uwolnienie Gorna.");
};


var int diego_merkedex;
var int diego_merkestr;

instance DIA_DIEGOOW_TEACH(C_INFO)
{
	npc = pc_thiefow;
	nr = 100;
	condition = dia_diegoow_teach_condition;
	information = dia_diegoow_teach_info;
	permanent = TRUE;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_diegoow_teach_condition()
{
	return TRUE;
};

func void dia_diegoow_teach_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//Jasne. W czym mog� ci pom�c?
	DIEGO_MERKEDEX = other.attribute[ATR_DEXTERITY];
	DIEGO_MERKESTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > DIEGO_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_02");	//Nabierasz zr�czno�ci.
	};
	if(other.attribute[ATR_STRENGTH] > DIEGO_MERKESTR)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//Dobrze - twoja si�a wzrasta.
	};
	Info_ClearChoices(dia_diegoow_teach);
};

func void dia_diegoow_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_diegoow_teachstr_5);
};


instance DIA_THIEFOW_PICKPOCKET(C_INFO)
{
	npc = pc_thiefow;
	nr = 900;
	condition = dia_thiefow_pickpocket_condition;
	information = dia_thiefow_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thiefow_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thiefow_pickpocket_info()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_BACK,dia_thiefow_pickpocket_back);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_PICKPOCKET,dia_thiefow_pickpocket_doit);
};

func void dia_thiefow_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thiefow_pickpocket);
};

func void dia_thiefow_pickpocket_back()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
};


instance DIA_ADDON_THIEFOW_TOGETHER(C_INFO)
{
	npc = pc_thiefow;
	nr = 11;
	condition = dia_addon_thiefow_together_condition;
	information = dia_addon_thiefow_together_info;
	description = "Chod� ze mn�.";
};


func int dia_addon_thiefow_together_condition()
{
	return TRUE;
};

func void dia_addon_thiefow_together_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_Together_15_00");	//Chod� ze mn�.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_01");	//Na prze��cz? Czemu nie...
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_02");	//Id�. W ko�cu w�a�nie stamt�d przybywasz.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_03");	//Nie wa� si� jednak podej�� zbyt blisko do zamku lub orkowej palisady.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_04");	//Rozs�dnie te� b�dzie unika� obozu paladyn�w.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_05");	//Dopiero co z jednego z nich uciek�em - nie mam ochoty zn�w zosta� niewolnikiem tyraj�cym w kopalniach.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_06");	//Rzecz jasna nale�y unika� r�wnie� spotka� ze smokiem.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_07");	//Daj zna�, gdy wszystko b�dzie gotowe.
};


instance DIA_ADDON_THIEFOW_COMEON(C_INFO)
{
	npc = pc_thiefow;
	nr = 12;
	condition = dia_addon_thiefow_comeon_condition;
	information = dia_addon_thiefow_comeon_info;
	permanent = TRUE;
	description = "Chod�my.";
};


func int dia_addon_thiefow_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(other,dia_addon_thiefow_together) && (DIEGO_ANGEKOMMEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_ComeOn_15_00");	//Chod�my.
	if(c_diegotoofar(0))
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_01");	//To nie ten kierunek!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_02");	//Dobrze.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_THIEFOW_GOHOME(C_INFO)
{
	npc = pc_thiefow;
	nr = 13;
	condition = dia_addon_thiefow_gohome_condition;
	information = dia_addon_thiefow_gohome_info;
	permanent = TRUE;
	description = "Poczekaj tutaj!";
};


func int dia_addon_thiefow_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_WarteHier_15_00");	//Poczekaj tutaj!
	if(Npc_GetDistToWP(self,"LOCATION_02_05") < 2000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_01");	//Dobra.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else if(Npc_GetDistToWP(self,"DT_E1_04") < (1500 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_02");	//Poczekam przed wej�ciem do wie�y.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(Npc_GetDistToWP(self,"OW_NEWMINE_11") < (4000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_03");	//Zaczekam w pobli�u kopalni.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"FAJETH");
	}
	else if(Npc_GetDistToWP(self,"OW_MINE3_OUT") < (1200 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_04");	//B�d� czeka� przed kopalni�.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"SILVESTRO");
	}
	else if(Npc_GetDistToWP(self,"OW_PATH_266") < (3000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_05");	//Poczekam tu w okolicy.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"GRIMES");
	}
	else if(Npc_GetDistToWP(self,"LOCATION_02_05") < 15000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_06");	//Nie - wracam do jaskini.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_07");	//Zajrzyj do mnie, gdy ju� za�atwisz swoje sprawy.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_08");	//Je�li jednak zamarudzisz zbyt d�ugo, zajm� si� w�asnymi sprawami.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_09");	//Chyba sobie kpisz! Rozsta� si�? Tutaj?!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_10");	//Nie ma mowy!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_11");	//Musimy i�� razem na prze��cz i tyle.
	};
};

func void b_addon_diego_willwaitoutside()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_00");	//Chcesz si� tutaj rozejrze�? Dobra, ja poczekam na zewn�trz.
};

func void b_addon_diego_passotherdirection()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_01");	//Prze��cz le�y w przeciwnym kierunku...
};


var int diego_toofarcomment;
var int diego_burgvariation;
var int diego_fajethvariation;
var int diego_silvestrovariation;
var int diego_grimesvariation;
var int diego_xardasvariation;
var int diego_icevariation;

instance DIA_ADDON_THIEFOW_TOOFAR(C_INFO)
{
	npc = pc_thiefow;
	nr = 14;
	condition = dia_addon_thiefow_toofar_condition;
	information = dia_addon_thiefow_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_thiefow_toofar_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(c_diegotoofar(0))
		{
			if(DIEGO_TOOFARCOMMENT == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			DIEGO_TOOFARCOMMENT = FALSE;
		};
	};
};

func void dia_addon_thiefow_toofar_info()
{
	if(c_diegotoofar(1000) == LOC_ANGAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_02");	//Nie podoba mi si� ten gr�b.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_03");	//Chyba lepiej to obej��.
	}
	else if(c_diegotoofar(1000) == LOC_ICE)
	{
		if(DIEGO_ICEVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_04");	//To wej�cie do dawnego Nowego Obozu.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_05");	//Jestem przekonany, �e osiedli� si� tu smok.
			b_addon_diego_passotherdirection();
			DIEGO_ICEVARIATION = 1;
		}
		else
		{
			b_addon_diego_passotherdirection();
		};
	}
	else if(c_diegotoofar(1000) == LOC_SWAMP)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_06");	//To bagno to �lepy zau�ek.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_07");	//Nie zdziwi� si�, je�li b�dzie tu na nas czeka� smok...
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//Lepiej si� tam nie zapuszcza�.
	}
	else if(c_diegotoofar(1000) == LOC_FIRE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//Za�o�� si�, �e w razie dalszej wspinaczki wpadniemy na smoka.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_10");	//A nie wiem jak ty, ale ja wola�bym dosta� si� do Khorinis w jednym kawa�ku.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_11");	//Wybierzmy lepiej inn� drog�.
	}
	else if(c_diegotoofar(1000) == LOC_LAKE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_12");	//To jezioro nigdzie nas nie doprowadzi.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_13");	//Prze��cz le�y w przeciwnym kierunku...
	}
	else if(c_diegotoofar(1000) == LOC_XARDAS)
	{
		if(DIEGO_XARDASVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_14");	//To stara wie�a Xardasa, cho� opu�ci� j� ju� jaki� czas temu.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_15");	//Nie zdziwi�bym si�, gdyby wewn�trz czeka�y na nas jakie� nieprzyjemne niespodzianki...
			b_addon_diego_willwaitoutside();
			DIEGO_XARDASVARIATION = 1;
		}
		else
		{
			b_addon_diego_willwaitoutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self,"XARDAS");
		};
	}
	else if(c_diegotoofar(1000) == LOC_FAJETHMINE)
	{
		if(DIEGO_FAJETHVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_16");	//Tam jest kopalnia Fajetha.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_17");	//Tam chcesz i��? Beze mnie!
			DIEGO_FAJETHVARIATION = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_18");	//Wola�bym raczej obej�� t� kopalni�!
		};
	}
	else if(c_diegotoofar(1000) == LOC_SILVESTROMINE)
	{
		if(DIEGO_SILVESTROVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_19");	//To w tej kopalni przymusowo pracowa�em.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_20");	//Jestem ca�kowicie pewien, �e nie pozosta� tam nikt �ywy.
			b_addon_diego_willwaitoutside();
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_20");	//Wr�c� do siebie, je�li za d�ugo b�dziesz tam siedzia�.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_21");	//Chyba �e wolisz, abym tu poczeka� na tw�j powr�t.
			DIEGO_SILVESTROVARIATION = 1;
		}
		else
		{
			b_addon_diego_willwaitoutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self,"SILVESTRO");
		};
	}
	else if(c_diegotoofar(1000) == LOC_GRIMESMINE)
	{
		if(DIEGO_GRIMESVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_21");	//To jedna z nowych kopal� paladyn�w.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_22");	//Nigdy tu nie by�em - i chcia�bym, aby tak zosta�o.
			DIEGO_GRIMESVARIATION = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_23");	//Wol� nie zapuszcza� si� do tej kopalni.
		};
	}
	else if(c_diegotoofar(1000) == LOC_BURG)
	{
		if(DIEGO_BURGVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_24");	//Odwali�o ci? Nie zbli�aj si� do tego zamku!
			DIEGO_BURGVARIATION = 1;
		}
		else if(DIEGO_BURGVARIATION == 1)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_25");	//W og�le mnie nie s�uchasz? Nie zbli�aj si� do tego zamku!
			DIEGO_BURGVARIATION = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_26");	//Cholera - naprawd� nie rozumiesz prostego zdania?! NIE ZBLI�AJ SI� DO ZAMKU!
			DIEGO_BURGVARIATION = 1;
		};
	}
	else if(c_diegotoofar(1000) == LOC_ORCBARRIER)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_27");	//Nie mo�emy dalej i�� w tym kierunku! Przy orkowym murze jest zbyt niebezpiecznie.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_28");	//Lepiej chyba zwr�ci� si� na zach�d i tam poszuka� dogodnego przej�cia.
	}
	else if(c_diegotoofar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_29");	//Id�c dalej t� �cie�k�, zbli�ymy si� tylko ponownie do orkowego muru.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_30");	//Ruszajmy ku prze��czy!
	};
	DIEGO_TOOFARCOMMENT = TRUE;
};

func void b_diego_wirsindda()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_02");	//Pozosta�� cz�� drogi zalicz� ju� sam.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_03");	//Musz� za�atwi� par� spraw, zanim p�jd� do Khorinis.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_04");	//Dzi�kuj� ci, przyjacielu - do zobaczenia w mie�cie.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"PASS");
	DIEGO_ANGEKOMMEN = TRUE;
};


instance DIA_ADDON_THIEFOW_ANGEKOMMEN(C_INFO)
{
	npc = pc_thiefow;
	nr = 1;
	condition = dia_addon_thiefow_angekommen_condition;
	information = dia_addon_thiefow_angekommen_info;
	important = TRUE;
};


func int dia_addon_thiefow_angekommen_condition()
{
	if(Npc_GetDistToWP(self,"OW_VM_ENTRANCE") < 800)
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_angekommen_info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_01");	//Jeste�my na miejscu.
	b_giveplayerxp(500);
	b_diego_wirsindda();
};


instance DIA_ADDON_THIEFOW_NOSTALGIE(C_INFO)
{
	npc = pc_thiefow;
	nr = 1;
	condition = dia_addon_thiefow_nostalgie_condition;
	information = dia_addon_thiefow_nostalgie_info;
	important = TRUE;
};


func int dia_addon_thiefow_nostalgie_condition()
{
	if(Npc_GetDistToWP(self,"WP_INTRO14") < 2000)
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_nostalgie_info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_01");	//Pami�tasz?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_02");	//To miejsce, w kt�rym po raz pierwszy si� spotkali�my.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_03");	//To by�o tak dawno...
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_04");	//Hmm... By�o jeszcze co� wyj�tkowego w tej okolicy, tylko nie pami�tam dok�adnie co.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_05");	//Skoro tak twierdzisz...
	b_giveplayerxp(500);
	hero.exp = hero.exp + 500;
	PrintScreen(ConcatStrings(NAME_ADDON_NOSTALGIEBONUS,IntToString(500)),-1,60,FONT_SCREEN,2);
	b_diego_wirsindda();
};


instance DIA_ADDON_THIEFOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 10;
	condition = dia_addon_thiefow_perm_condition;
	information = dia_addon_thiefow_perm_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int dia_addon_thiefow_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_perm) && Npc_KnowsInfo(other,dia_addon_thiefow_together))
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_PERM_15_00");	//Wszystko w porz�dku?
	if(self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_01");	//Przyda�by mi si� eliksir leczniczy. Nie masz przypadkiem jakiego� na zbyciu?
	}
	else if((diegoow.aivar[AIV_PARTYMEMBER] == FALSE) && (DIEGO_ANGEKOMMEN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_02");	//Daj zna�, gdy trzeba ju� b�dzie rusza�.
	}
	else if(DIEGO_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_03");	//Tak sobie tylko odpoczywam.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_04");	//�wietnie.
	};
};

