
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
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Hej, myœla³em, ¿e nie ¿yjesz.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Taa... te¿ tak myœla³em.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//Ale wróci³em i szukam dowodu na pojawienie siê smoków.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Czy¿by? A dla kogo pracujesz?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//Dla Lorda Hagena. Tylko paladyni mog¹ powstrzymaæ smoki.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//Paladyni?! Coœ ci powiem. Kiedy uda³o mi siê st¹d uciec, poszed³em do Khorinis.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//Zamierza³em uprzedziæ paladynów o smokach. Nie wiem, po co w ogóle próbowa³em.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//Ten nadêty g³upiec, Lothar, nawet nie chcia³ mnie wys³uchaæ, a ju¿ na pewno nie zamierza³ dopuœciæ mnie przed oblicze Hagena.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//Wys³ali mnie tylko ze swoj¹ ekspedycj¹. Wiêc nie mów mi, jakim to wybawieniem s¹ paladyni...
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//Tak czy inaczej - smoki trzeba powstrzymaæ, póki jeszcze jest czas. Niewa¿ne, kto tego dokona.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Powstrzymaæ? Chyba ¿artujesz? Musimy siê wynosiæ z tej doliny, ot co!
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Powiedz, jak uda³o ci siê przejœæ przez prze³êcz? Myœla³em, ¿e a¿ roi siê od orków.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Przez opuszczon¹ kopalniê prowadzi œcie¿ka, na której nie ma orków.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//Dobrze wiedzieæ. Zatem nied³ugo wyruszê do Khorinis. Mam tam parê rachunków do wyrównania.
};


instance DIA_DIEGOOW_BEWEISE(C_INFO)
{
	npc = pc_thiefow;
	nr = 2;
	condition = dia_diegoow_beweise_condition;
	information = dia_diegoow_beweise_info;
	description = "Potrzebujê dowodu na ich istnienie.";
};


func int dia_diegoow_beweise_condition()
{
	return TRUE;
};

func void dia_diegoow_beweise_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Potrzebujê dowodu na ich istnienie.
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Dobra, pomogê ci w miarê mo¿liwoœci. Ale nie zamierzam za nikogo nadstawiaæ karku, jasne?
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//Có¿, skoro nalegasz. Porozmawiaj z kapitanem Garondem.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Jeœli ktoœ mo¿e potwierdziæ obecnoœæ smoków, to w³aœnie ch³opcy z zamku.
	};
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Garond wys³a³ mnie z pewn¹ misj¹. Chce wiedzieæ, ile rudy wydobyto do tej pory.
		AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//A potem da ci dowód, którego tak potrzebujesz?
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//W³aœnie. Wiêc jak, mo¿esz mi coœ powiedzieæ?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Garond_11_01");	//Jak ju¿ bêdziesz na zamku, to daj znaæ Garondowi o pewnej sprawie, która go chyba bardzo zainteresuje...
	};
	if(Npc_GetDistToWP(self,"LOCATION_02_05") <= 1000)
	{
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Na dnie tej jaskini s¹ CZTERY skrzynie rudy. Wydobyli j¹ ludzie Silvestra.
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Jeœli Garond zechce, mo¿e tu przyjœæ i je sobie wzi¹æ, ale mnie tu ju¿ wtedy nie bêdzie.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_01");	//Niedaleko od jaskini, w której siê ukrywa³em, znajduj¹ siê a¿ CZTERY skrzynie pe³ne rudy. Wydobyli j¹ ludzie Silvestro.
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_02");	//Niech je sobie Garond bierze - mnie siê i tak nie przydadz¹.
	};
	SILVESTRO_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Diego zabezpieczy³ CZTERY skrzynie rudy wydobytej przez górników Silvestra.");
};


instance DIA_DIEGOOW_MINE(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_mine_condition;
	information = dia_diegoow_mine_info;
	permanent = FALSE;
	description = "W jaki sposób zdoby³eœ tê rudê?";
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
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//W jaki sposób zdoby³eœ tê rudê?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//By³em w oddziale Silvestra. Przez kilka dni prowadziliœmy wydobycie, a¿ Silvestro zrobi³ siê nagle strasznie nerwowy.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Powiedzia³, ¿e musimy zabraæ urobek w bezpieczne miejsce.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//Jako ¿e od pewnego czasu planowa³em daæ nogê, zg³osi³em siê na ochotnika.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//I dobrze zrobi³em, bo górnicy wpadli wkrótce potem na stado pe³zaczy. Nikt nie prze¿y³.
};


instance DIA_DIEGOOW_RITTER(C_INFO)
{
	npc = pc_thiefow;
	nr = 4;
	condition = dia_diegoow_ritter_condition;
	information = dia_diegoow_ritter_info;
	permanent = FALSE;
	description = "Przed twoj¹ kryjówk¹ le¿¹ zw³oki dwóch rycerzy...";
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
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//Przed twoj¹ kryjówk¹ le¿¹ zw³oki dwóch rycerzy...
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Polegli bohatersko w walce ze stadem zêbaczy.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//Górnicza Dolina rz¹dzi siê w³asnymi prawami. Ostrzega³em ich, ale nie chcieli mnie s³uchaæ.
};


instance DIA_DIEGOOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 5;
	condition = dia_diegoow_perm_condition;
	information = dia_diegoow_perm_info;
	permanent = FALSE;
	description = "Co powinienem wiedzieæ o dolinie?";
};


func int dia_diegoow_perm_condition()
{
	return TRUE;
};

func void dia_diegoow_perm_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Co powinienem wiedzieæ o dolinie?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Od upadku Bariery sporo siê pozmienia³o. Teraz rz¹dz¹ tu orkowie.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//A ludzie s¹ tylko ¿yw¹ karm¹ dla prawdziwych w³adców doliny: smoków.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Trzymaj siê z dala od wszystkiego, co jest silniejsze od ciebie, zw³aszcza jeœli przypomina z wygl¹du smoka.
};


instance DIA_DIEGOOW_GORN(C_INFO)
{
	npc = pc_thiefow;
	nr = 6;
	condition = dia_diegoow_gorn_condition;
	information = dia_diegoow_gorn_info;
	permanent = FALSE;
	description = "Chcia³bym wykupiæ Gorna...";
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
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Chcia³bym wykupiæ Gorna, ale Garond domaga siê za niego 1000 sztuk z³ota.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Niez³a sumka. Mam przy sobie 300 sztuk, mo¿esz je wzi¹æ, jeœli chcesz. Resztê musisz zdobyæ sam.
	b_giveinvitems(self,other,itmi_gold,300);
	b_logentry(TOPIC_RESCUEGORN,"Diego przekaza³ 300 sztuk z³ota na uwolnienie Gorna.");
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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_diegoow_teach_condition()
{
	return TRUE;
};

func void dia_diegoow_teach_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//Jasne. W czym mogê ci pomóc?
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
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_02");	//Nabierasz zrêcznoœci.
	};
	if(other.attribute[ATR_STRENGTH] > DIEGO_MERKESTR)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//Dobrze - twoja si³a wzrasta.
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
	description = "ChodŸ ze mn¹.";
};


func int dia_addon_thiefow_together_condition()
{
	return TRUE;
};

func void dia_addon_thiefow_together_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_Together_15_00");	//ChodŸ ze mn¹.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_01");	//Na prze³êcz? Czemu nie...
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_02");	//IdŸ. W koñcu w³aœnie stamt¹d przybywasz.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_03");	//Nie wa¿ siê jednak podejœæ zbyt blisko do zamku lub orkowej palisady.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_04");	//Rozs¹dnie te¿ bêdzie unikaæ obozu paladynów.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_05");	//Dopiero co z jednego z nich uciek³em - nie mam ochoty znów zostaæ niewolnikiem tyraj¹cym w kopalniach.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_06");	//Rzecz jasna nale¿y unikaæ równie¿ spotkañ ze smokiem.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_07");	//Daj znaæ, gdy wszystko bêdzie gotowe.
};


instance DIA_ADDON_THIEFOW_COMEON(C_INFO)
{
	npc = pc_thiefow;
	nr = 12;
	condition = dia_addon_thiefow_comeon_condition;
	information = dia_addon_thiefow_comeon_info;
	permanent = TRUE;
	description = "ChodŸmy.";
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
	AI_Output(other,self,"DIA_Addon_Diego_ComeOn_15_00");	//ChodŸmy.
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
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_02");	//Poczekam przed wejœciem do wie¿y.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(Npc_GetDistToWP(self,"OW_NEWMINE_11") < (4000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_03");	//Zaczekam w pobli¿u kopalni.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"FAJETH");
	}
	else if(Npc_GetDistToWP(self,"OW_MINE3_OUT") < (1200 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_04");	//Bêdê czekaæ przed kopalni¹.
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
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_07");	//Zajrzyj do mnie, gdy ju¿ za³atwisz swoje sprawy.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_08");	//Jeœli jednak zamarudzisz zbyt d³ugo, zajmê siê w³asnymi sprawami.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_09");	//Chyba sobie kpisz! Rozstaæ siê? Tutaj?!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_10");	//Nie ma mowy!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_11");	//Musimy iœæ razem na prze³êcz i tyle.
	};
};

func void b_addon_diego_willwaitoutside()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_00");	//Chcesz siê tutaj rozejrzeæ? Dobra, ja poczekam na zewn¹trz.
};

func void b_addon_diego_passotherdirection()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_01");	//Prze³êcz le¿y w przeciwnym kierunku...
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
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_02");	//Nie podoba mi siê ten grób.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_03");	//Chyba lepiej to obejœæ.
	}
	else if(c_diegotoofar(1000) == LOC_ICE)
	{
		if(DIEGO_ICEVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_04");	//To wejœcie do dawnego Nowego Obozu.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_05");	//Jestem przekonany, ¿e osiedli³ siê tu smok.
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
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_06");	//To bagno to œlepy zau³ek.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_07");	//Nie zdziwiê siê, jeœli bêdzie tu na nas czeka³ smok...
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//Lepiej siê tam nie zapuszczaæ.
	}
	else if(c_diegotoofar(1000) == LOC_FIRE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//Za³o¿ê siê, ¿e w razie dalszej wspinaczki wpadniemy na smoka.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_10");	//A nie wiem jak ty, ale ja wola³bym dostaæ siê do Khorinis w jednym kawa³ku.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_11");	//Wybierzmy lepiej inn¹ drogê.
	}
	else if(c_diegotoofar(1000) == LOC_LAKE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_12");	//To jezioro nigdzie nas nie doprowadzi.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_13");	//Prze³êcz le¿y w przeciwnym kierunku...
	}
	else if(c_diegotoofar(1000) == LOC_XARDAS)
	{
		if(DIEGO_XARDASVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_14");	//To stara wie¿a Xardasa, choæ opuœci³ j¹ ju¿ jakiœ czas temu.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_15");	//Nie zdziwi³bym siê, gdyby wewn¹trz czeka³y na nas jakieœ nieprzyjemne niespodzianki...
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
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_17");	//Tam chcesz iœæ? Beze mnie!
			DIEGO_FAJETHVARIATION = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_18");	//Wola³bym raczej obejœæ tê kopalniê!
		};
	}
	else if(c_diegotoofar(1000) == LOC_SILVESTROMINE)
	{
		if(DIEGO_SILVESTROVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_19");	//To w tej kopalni przymusowo pracowa³em.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_20");	//Jestem ca³kowicie pewien, ¿e nie pozosta³ tam nikt ¿ywy.
			b_addon_diego_willwaitoutside();
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_20");	//Wrócê do siebie, jeœli za d³ugo bêdziesz tam siedzia³.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_21");	//Chyba ¿e wolisz, abym tu poczeka³ na twój powrót.
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
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_21");	//To jedna z nowych kopalñ paladynów.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_22");	//Nigdy tu nie by³em - i chcia³bym, aby tak zosta³o.
			DIEGO_GRIMESVARIATION = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_23");	//Wolê nie zapuszczaæ siê do tej kopalni.
		};
	}
	else if(c_diegotoofar(1000) == LOC_BURG)
	{
		if(DIEGO_BURGVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_24");	//Odwali³o ci? Nie zbli¿aj siê do tego zamku!
			DIEGO_BURGVARIATION = 1;
		}
		else if(DIEGO_BURGVARIATION == 1)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_25");	//W ogóle mnie nie s³uchasz? Nie zbli¿aj siê do tego zamku!
			DIEGO_BURGVARIATION = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_26");	//Cholera - naprawdê nie rozumiesz prostego zdania?! NIE ZBLI¯AJ SIÊ DO ZAMKU!
			DIEGO_BURGVARIATION = 1;
		};
	}
	else if(c_diegotoofar(1000) == LOC_ORCBARRIER)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_27");	//Nie mo¿emy dalej iœæ w tym kierunku! Przy orkowym murze jest zbyt niebezpiecznie.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_28");	//Lepiej chyba zwróciæ siê na zachód i tam poszukaæ dogodnego przejœcia.
	}
	else if(c_diegotoofar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_29");	//Id¹c dalej t¹ œcie¿k¹, zbli¿ymy siê tylko ponownie do orkowego muru.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_30");	//Ruszajmy ku prze³êczy!
	};
	DIEGO_TOOFARCOMMENT = TRUE;
};

func void b_diego_wirsindda()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_02");	//Pozosta³¹ czêœæ drogi zaliczê ju¿ sam.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_03");	//Muszê za³atwiæ parê spraw, zanim pójdê do Khorinis.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_04");	//Dziêkujê ci, przyjacielu - do zobaczenia w mieœcie.
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
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_01");	//Jesteœmy na miejscu.
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
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_01");	//Pamiêtasz?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_02");	//To miejsce, w którym po raz pierwszy siê spotkaliœmy.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_03");	//To by³o tak dawno...
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_04");	//Hmm... By³o jeszcze coœ wyj¹tkowego w tej okolicy, tylko nie pamiêtam dok³adnie co.
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
	description = "Wszystko w porz¹dku?";
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
	AI_Output(other,self,"DIA_Addon_Diego_PERM_15_00");	//Wszystko w porz¹dku?
	if(self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_01");	//Przyda³by mi siê eliksir leczniczy. Nie masz przypadkiem jakiegoœ na zbyciu?
	}
	else if((diegoow.aivar[AIV_PARTYMEMBER] == FALSE) && (DIEGO_ANGEKOMMEN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_02");	//Daj znaæ, gdy trzeba ju¿ bêdzie ruszaæ.
	}
	else if(DIEGO_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_03");	//Tak sobie tylko odpoczywam.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_04");	//Œwietnie.
	};
};

