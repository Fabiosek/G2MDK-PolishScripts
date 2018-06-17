
instance DIA_DRAGON_ICE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_ice_exit_condition;
	information = dia_dragon_ice_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_ice_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_ice_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Ice_Exit_20_00");	//W³adza Oka nade mn¹ dobieg³a koñca. Twój czas na tym œwiecie równie¿.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
	Wld_InsertNpc(draconian,"FP_ROAM_OW_ICEREGION_29_02");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_ICEREGION_30_01");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_05_01");
};


instance DIA_DRAGON_ICE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_ice_hello_condition;
	information = dia_dragon_ice_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_ice_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_ice_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_00");	//Dlaczego zak³ócasz mój odpoczynek? Czy mam siê zakopaæ jeszcze g³êbiej, byœcie mnie wreszcie zostawili w spokoju?
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_01");	//Gadaj¹cy smok. Chwa³a niech bêdzie Oku Innosa.
	};
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_02");	//Zaprawdê, jesteœcie niezwyk³ymi istotami. Niewa¿ne, ile razy przetoczy siê przez was lodowaty wicher œmierci, zawsze znajdzie siê jeden, który powstanie z popio³ów, myœl¹c, ¿e s¹dzone mu byæ bohaterem.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_03");	//Ale to siê wkrótce zmieni. Osobiœcie dopilnujê, by tym razem ¿aden z was nie powsta³.
	AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_04");	//Milcz! Na moc œwiêtego Oka, które powierzono w moje rêce, zaklinam ciê: odpowiedz na moje pytania!
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_05");	//Ha, ha, ha. Pytaj wiêc. Twoja wiedza i tak na nic ci siê nie zda.
};


instance DIA_DRAGON_ICE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_ice_werbistdu_condition;
	information = dia_dragon_ice_werbistdu_info;
	description = "Kim jesteœ?";
};


func int dia_dragon_ice_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_ice_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_ice_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_WERBISTDU_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Dragon_Ice_WERBISTDU_20_01");	//Jestem Finkregh, pan lodu i œniegu, Stra¿nik Spotkania, i ten, który zakoñczy twój nêdzny ¿ywot.
};


instance DIA_DRAGON_ICE_BELIAR(C_INFO)
{
	nr = 6;
	condition = dia_dragon_ice_beliar_condition;
	information = dia_dragon_ice_beliar_info;
	description = "Któremu bogu s³u¿ysz?";
};


func int dia_dragon_ice_beliar_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_ice_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_ice_beliar_info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_00");	//Któremu bogu s³u¿ysz?
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_01");	//Jakie¿ to przeklête bóstwo pozwala, by tak odra¿aj¹ce istoty jak ty chodzi³y po naszym œwiecie?
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_02");	//Pró¿no siê trudzisz, próbuj¹c ogarn¹æ znaczenie naszego spotkania, ma³y bohaterze.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_03");	//Beliar nie tylko pozwoli³ na nasze przybycie. On KAZA£ nam tutaj przybyæ!
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_04");	//Ws³uchani w jego œwiête s³owa, nie spoczniemy, póki nie spe³ni siê jego wola.
};

func void b_assigndragontalk_ice(var C_NPC slf)
{
	dia_dragon_ice_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_beliar.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

