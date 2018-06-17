
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
	AI_Output(self,other,"DIA_Dragon_Ice_Exit_20_00");	//W�adza Oka nade mn� dobieg�a ko�ca. Tw�j czas na tym �wiecie r�wnie�.
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
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_00");	//Dlaczego zak��casz m�j odpoczynek? Czy mam si� zakopa� jeszcze g��biej, by�cie mnie wreszcie zostawili w spokoju?
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_01");	//Gadaj�cy smok. Chwa�a niech b�dzie Oku Innosa.
	};
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_02");	//Zaprawd�, jeste�cie niezwyk�ymi istotami. Niewa�ne, ile razy przetoczy si� przez was lodowaty wicher �mierci, zawsze znajdzie si� jeden, kt�ry powstanie z popio��w, my�l�c, �e s�dzone mu by� bohaterem.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_03");	//Ale to si� wkr�tce zmieni. Osobi�cie dopilnuj�, by tym razem �aden z was nie powsta�.
	AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_04");	//Milcz! Na moc �wi�tego Oka, kt�re powierzono w moje r�ce, zaklinam ci�: odpowiedz na moje pytania!
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_05");	//Ha, ha, ha. Pytaj wi�c. Twoja wiedza i tak na nic ci si� nie zda.
};


instance DIA_DRAGON_ICE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_ice_werbistdu_condition;
	information = dia_dragon_ice_werbistdu_info;
	description = "Kim jeste�?";
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
	AI_Output(other,self,"DIA_Dragon_Ice_WERBISTDU_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Dragon_Ice_WERBISTDU_20_01");	//Jestem Finkregh, pan lodu i �niegu, Stra�nik Spotkania, i ten, kt�ry zako�czy tw�j n�dzny �ywot.
};


instance DIA_DRAGON_ICE_BELIAR(C_INFO)
{
	nr = 6;
	condition = dia_dragon_ice_beliar_condition;
	information = dia_dragon_ice_beliar_info;
	description = "Kt�remu bogu s�u�ysz?";
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
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_00");	//Kt�remu bogu s�u�ysz?
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_01");	//Jakie� to przekl�te b�stwo pozwala, by tak odra�aj�ce istoty jak ty chodzi�y po naszym �wiecie?
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_02");	//Pr�no si� trudzisz, pr�buj�c ogarn�� znaczenie naszego spotkania, ma�y bohaterze.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_03");	//Beliar nie tylko pozwoli� na nasze przybycie. On KAZA� nam tutaj przyby�!
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_04");	//Ws�uchani w jego �wi�te s�owa, nie spoczniemy, p�ki nie spe�ni si� jego wola.
};

func void b_assigndragontalk_ice(var C_NPC slf)
{
	dia_dragon_ice_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_beliar.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

