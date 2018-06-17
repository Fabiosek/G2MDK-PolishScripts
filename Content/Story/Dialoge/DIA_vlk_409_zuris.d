
instance DIA_ZURIS_EXIT(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 999;
	condition = dia_zuris_exit_condition;
	information = dia_zuris_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_zuris_exit_condition()
{
	return TRUE;
};

func void dia_zuris_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ZURIS_PICKPOCKET(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 900;
	condition = dia_zuris_pickpocket_condition;
	information = dia_zuris_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tej mikstury bêdzie ³atwa)";
};


func int dia_zuris_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_zuris_pickpocket_info()
{
	Info_ClearChoices(dia_zuris_pickpocket);
	Info_AddChoice(dia_zuris_pickpocket,DIALOG_BACK,dia_zuris_pickpocket_back);
	Info_AddChoice(dia_zuris_pickpocket,DIALOG_PICKPOCKET,dia_zuris_pickpocket_doit);
};

func void dia_zuris_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		CreateInvItems(self,itpo_health_03,1);
		b_giveinvitems(self,other,itpo_health_03,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_zuris_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_zuris_pickpocket_back()
{
	Info_ClearChoices(dia_zuris_pickpocket);
};


instance DIA_ZURIS_SPERRE(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_sperre_condition;
	information = dia_zuris_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_zuris_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_zuris_sperre_info()
{
	AI_Output(self,other,"DIA_Zuris_Sperre_14_00");	//Jesteœ skazañcem z kolonii górniczej! Wynocha!
	AI_StopProcessInfos(self);
};


instance DIA_ZURIS_GREET(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_greet_condition;
	information = dia_zuris_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_zuris_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_zuris_greet_info()
{
	AI_Output(self,other,"DIA_Zuris_GREET_14_00");	//Jestem Zuris, Mistrz Mikstur.
	AI_Output(self,other,"DIA_Zuris_GREET_14_01");	//Mo¿e potrzebujesz esencji leczniczej lub magicznego eliksiru? Jeœli tak, to trafi³eœ w odpowiednie miejsce.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Zuris sprzedaje na targowisku mikstury.");
};


var int zuris_einmal;

instance DIA_ZURIS_WAREZ(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_warez_condition;
	information = dia_zuris_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka¿ mi swoje towary.";
};


func int dia_zuris_warez_condition()
{
	return TRUE;
};

func void dia_zuris_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Zuris_WAREZ_15_00");	//Poka¿ mi swoje towary.
	if((ZURIS_EINMAL == FALSE) && !Npc_KnowsInfo(other,dia_zuris_potions))
	{
		AI_Output(self,other,"DIA_Zuris_GREET_14_02");	//W³aœnie otrzyma³em now¹ dostawê mikstur. Mistrz Daron, Mag Ognia, przywióz³ je ze sob¹ z klasztoru.
		ZURIS_EINMAL = TRUE;
	};
};


instance DIA_ZURIS_POTIONS(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_potions_condition;
	information = dia_zuris_potions_info;
	permanent = FALSE;
	description = "Czy sam przygotowujesz swoje mikstury?";
};


func int dia_zuris_potions_condition()
{
	if(Npc_KnowsInfo(hero,dia_zuris_greet))
	{
		return TRUE;
	};
};

func void dia_zuris_potions_info()
{
	AI_Output(other,self,"DIA_Zuris_POTIONS_15_00");	//Czy sam przygotowujesz swoje mikstury?
	AI_Output(self,other,"DIA_Zuris_POTIONS_14_01");	//Nie, na ogó³ kupujê je w klasztorze lub dostajê od alchemika Constantina.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_02");	//Jeœli interesuje ciê proces przygotowania mikstur, mo¿esz z nim porozmawiaæ. Z tego co wiem, potrzebuje asystenta.
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_03");	//Jest jednak zbyt dumny, by spróbowaæ go znaleŸæ. G³upiec - bardziej uparty ni¿ osio³.
	};
	AI_Output(self,other,"DIA_Zuris_Add_14_00");	//Przechodzi têdy, gdy wychodzi wschodni¹ bram¹, by nazbieraæ zió³ na swoje mikstury.
};


instance DIA_ZURIS_KRAUT(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_kraut_condition;
	information = dia_zuris_kraut_info;
	permanent = FALSE;
	description = "Gdzie dok³adnie Constantino zbiera zio³a?";
};


func int dia_zuris_kraut_condition()
{
	if(Npc_KnowsInfo(other,dia_zuris_potions))
	{
		return TRUE;
	};
};

func void dia_zuris_kraut_info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_01");	//Gdzie dok³adnie Constantino zbiera zio³a?
	AI_Output(self,other,"DIA_Zuris_Add_14_02");	//Przechodzi przez wschodni¹ bramê i znika gdzieœ w gêstwinie na lewo.
	AI_Output(self,other,"DIA_Zuris_Add_14_03");	//Powiedzia³ mi raz, ¿e rosn¹ tam wszystkie sk³adniki prócz królewskiego szczawiu.
	Wld_InsertItem(itpl_mana_herb_01,"FP_ITEM_HERB_01");
	Wld_InsertItem(itpl_mana_herb_02,"FP_ITEM_HERB_02");
	Wld_InsertItem(itpl_mana_herb_03,"FP_ITEM_HERB_03");
	Wld_InsertItem(itpl_health_herb_01,"FP_ITEM_HERB_04");
	Wld_InsertItem(itpl_health_herb_02,"FP_ITEM_HERB_05");
	Wld_InsertItem(itpl_health_herb_03,"FP_ITEM_HERB_06");
	Wld_InsertItem(itpl_speed_herb_01,"FP_ITEM_HERB_07");
	Wld_InsertItem(itpl_temp_herb,"FP_ITEM_HERB_08");
	Wld_InsertItem(itpl_strength_herb_01,"FP_ITEM_HERB_09");
	Wld_InsertItem(itpl_dex_herb_01,"FP_ITEM_HERB_10");
};


instance DIA_ZURIS_KRONSTOECKEL(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_kronstoeckel_condition;
	information = dia_zuris_kronstoeckel_info;
	permanent = FALSE;
	description = "Czy Constantino powiedzia³ ci kiedyœ, gdzie szukaæ królewskiego szczawiu?";
};


func int dia_zuris_kronstoeckel_condition()
{
	if(Npc_KnowsInfo(other,dia_zuris_kraut))
	{
		return TRUE;
	};
};

func void dia_zuris_kronstoeckel_info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_04");	//Czy Constantino powiedzia³ ci kiedyœ, gdzie szukaæ szczawiu?
	AI_Output(self,other,"DIA_Zuris_Add_14_05");	//Raz s³ysza³em, jak mówi³, ¿e ow¹ roœlinê mo¿na znaleŸæ jedynie w pobli¿u kamiennych krêgów.
	AI_Output(self,other,"DIA_Zuris_Add_14_06");	//Niedaleko farmy Lobarta, to ta przy bramie. Tam w³aœnie znajdziesz jeden z kamiennych krêgów.
	AI_Output(self,other,"DIA_Zuris_Add_14_07");	//Z tego co wiem, znajduje siê na wzgórzu. Kiedyœ by³ tam chyba grobowiec.
	Wld_InsertItem(itpl_perm_herb,"FP_ITEM_HERB_11");
};


instance DIA_ZURIS_WHERE(C_INFO)
{
	npc = vlk_409_zuris;
	condition = dia_zuris_where_condition;
	information = dia_zuris_where_info;
	permanent = FALSE;
	description = "Gdzie mogê znaleŸæ Constantina?";
};


func int dia_zuris_where_condition()
{
	if(Npc_KnowsInfo(hero,dia_zuris_potions) && (constantino.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_zuris_where_info()
{
	AI_Output(other,self,"DIA_Zuris_WHERE_15_00");	//Gdzie mogê znaleŸæ Constantina?
	AI_Output(self,other,"DIA_Zuris_WHERE_14_01");	//Jego komnaty znajduj¹ siê w tunelu, niedaleko kuŸni Harada. £atwo je znaleŸæ.
};


instance DIA_ZURIS_KLOSTER(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_kloster_condition;
	information = dia_zuris_kloster_info;
	description = "Powiedz proszê coœ wiêcej o klasztorze.";
};


func int dia_zuris_kloster_condition()
{
	if(ZURIS_EINMAL == TRUE)
	{
		return FALSE;
	};
};

func void dia_zuris_kloster_info()
{
	AI_Output(other,self,"DIA_Zuris_Kloster_14_00");	//Powiedz proszê coœ wiêcej o klasztorze.
	AI_Output(self,other,"DIA_Zuris_Kloster_14_01");	//Najlepiej bêdzie, jeœli osobiœcie porozmawiasz z Mistrzem Daronem. On wie na ten temat wiêcej ni¿ ja.
};


instance DIA_ZURIS_MINENANTEIL(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 3;
	condition = dia_zuris_minenanteil_condition;
	information = dia_zuris_minenanteil_info;
	description = "To ty sprzedajesz udzia³y w kopalni?";
};


func int dia_zuris_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_zuris_minenanteil_info()
{
	AI_Output(other,self,"DIA_Zuris_Minenanteil_15_00");	//To ty sprzedajesz udzia³y w kopalni?
	AI_Output(self,other,"DIA_Zuris_Minenanteil_14_01");	//Tak, choæ sam nie wiem dlaczego. Ostatni raz da³em siê wpl¹taæ w interes tak w¹tpliwej natury.
	b_giveplayerxp(XP_AMBIENT);
};

