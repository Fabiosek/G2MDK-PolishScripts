
instance DIA_DRAGON_FIRE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_fire_exit_condition;
	information = dia_dragon_fire_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Fire_Exit_20_00");	//Oko straci³o swoj¹ moc. Naciesz siê ostatnimi chwilami ¿ycia.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
};


instance DIA_DRAGON_FIRE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_fire_hello_condition;
	information = dia_dragon_fire_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_fire_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_fire_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_00");	//Trudno uwierzyæ, ¿e nadal znajduj¹ siê ludzie gotowi poœwiêciæ w³asne ¿ycie, byle tylko zobaczyæ prawdziwego smoka.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_01");	//Jak na wielkiego, oœliz³ego jaszczura, jesteœ strasznie wygadany.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_02");	//Nie przyszed³em tu z wizyt¹ towarzysk¹. Uprzejmoœci musimy chwilowo od³o¿yæ na bok.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_03");	//Chyba nie chcesz mi powiedzieæ, ¿e zamierzasz rzuciæ mi wyzwanie?
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_04");	//Ha, ha, ha! Skrêcê ci kark, cz³owieczku!
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_05");	//Nie tak szybko, przyjacielu. Mam ze sob¹ Oko Innosa! Nie masz wyboru - odpowiesz na moje pytania albo zdechniesz w mêczarniach.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_06");	//Aaarh. Zatem pytaj, póki jeszcze mo¿esz. Twoja w³adza nade mn¹ wkrótce siê skoñczy.
};


instance DIA_DRAGON_FIRE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_werbistdu_condition;
	information = dia_dragon_fire_werbistdu_info;
	description = "Kim jesteœ?";
};


func int dia_dragon_fire_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_01");	//Nazywam siê Feomathar. To wszystko, czego siê o mnie dowiesz.
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_02");	//Spalê ciê na popió³, gdy tylko wyrwê siê spod w³adzy Oka!
};


instance DIA_DRAGON_FIRE_HORT(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_hort_condition;
	information = dia_dragon_fire_hort_info;
	description = "Gdzie jest twój skarb?";
};


func int dia_dragon_fire_hort_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_hort_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_HORT_15_00");	//Ka¿dy smok ma miejsce, w którym przechowuje swoje skarby. Gdzie jest twój skarb?
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_01");	//W miejscu, do którego nigdy nie dotrzesz. Postaram siê o to, gdy moc Oka os³abnie.
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_02");	//Ukry³em swoje skarby wysoko na rozgrzanych ska³ach, gdzie nie dotrze ¿adna pozbawiona skrzyde³ istota!
};

func void b_assigndragontalk_fire(var C_NPC slf)
{
	dia_dragon_fire_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hort.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

