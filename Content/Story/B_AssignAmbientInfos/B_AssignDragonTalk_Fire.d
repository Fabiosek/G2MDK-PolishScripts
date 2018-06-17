
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
	AI_Output(self,other,"DIA_Dragon_Fire_Exit_20_00");	//Oko straci�o swoj� moc. Naciesz si� ostatnimi chwilami �ycia.
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
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_00");	//Trudno uwierzy�, �e nadal znajduj� si� ludzie gotowi po�wi�ci� w�asne �ycie, byle tylko zobaczy� prawdziwego smoka.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_01");	//Jak na wielkiego, o�liz�ego jaszczura, jeste� strasznie wygadany.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_02");	//Nie przyszed�em tu z wizyt� towarzysk�. Uprzejmo�ci musimy chwilowo od�o�y� na bok.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_03");	//Chyba nie chcesz mi powiedzie�, �e zamierzasz rzuci� mi wyzwanie?
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_04");	//Ha, ha, ha! Skr�c� ci kark, cz�owieczku!
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_05");	//Nie tak szybko, przyjacielu. Mam ze sob� Oko Innosa! Nie masz wyboru - odpowiesz na moje pytania albo zdechniesz w m�czarniach.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_06");	//Aaarh. Zatem pytaj, p�ki jeszcze mo�esz. Twoja w�adza nade mn� wkr�tce si� sko�czy.
};


instance DIA_DRAGON_FIRE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_werbistdu_condition;
	information = dia_dragon_fire_werbistdu_info;
	description = "Kim jeste�?";
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
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_01");	//Nazywam si� Feomathar. To wszystko, czego si� o mnie dowiesz.
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_02");	//Spal� ci� na popi�, gdy tylko wyrw� si� spod w�adzy Oka!
};


instance DIA_DRAGON_FIRE_HORT(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_hort_condition;
	information = dia_dragon_fire_hort_info;
	description = "Gdzie jest tw�j skarb?";
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
	AI_Output(other,self,"DIA_Dragon_Fire_HORT_15_00");	//Ka�dy smok ma miejsce, w kt�rym przechowuje swoje skarby. Gdzie jest tw�j skarb?
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_01");	//W miejscu, do kt�rego nigdy nie dotrzesz. Postaram si� o to, gdy moc Oka os�abnie.
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_02");	//Ukry�em swoje skarby wysoko na rozgrzanych ska�ach, gdzie nie dotrze �adna pozbawiona skrzyde� istota!
};

func void b_assigndragontalk_fire(var C_NPC slf)
{
	dia_dragon_fire_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hort.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

