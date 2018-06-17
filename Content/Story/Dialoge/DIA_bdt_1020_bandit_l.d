
instance DIA_BDT_1020_WEGELAGERER_EXIT(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 999;
	condition = dia_wegelagerer_exit_condition;
	information = dia_wegelagerer_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wegelagerer_exit_condition()
{
	return TRUE;
};

func void dia_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1020_WEGELAGERER_CHECKPOINT = "NW_TROLLAREA_PATH_46";

instance DIA_BDT_1020_WEGELAGERER_FIRSTWARN(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 1;
	condition = dia_bdt_1020_wegelagerer_firstwarn_condition;
	information = dia_bdt_1020_wegelagerer_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1020_wegelagerer_firstwarn_condition()
{
	if((other.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void dia_bdt_1020_wegelagerer_firstwarn_info()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_00");	//Hej ty, natychmiast siê zatrzymaj!
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_15_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_02");	//Jeœli nie chcesz, bym poharata³ ci buŸkê, opró¿nij kieszenie i oddaj ca³e z³oto - i streszczaj siê!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Ile chcesz?",dia_bdt_1020_wegelagerer_firstwarn_howmuch);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Chyba ¿artujesz.",dia_bdt_1020_wegelagerer_firstwarn_joke);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"ZejdŸ mi z drogi.",dia_bdt_1020_wegelagerer_pissoff);
	if(MIS_SCHNITZELJAGD == LOG_RUNNING)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Nie widzia³eœ mo¿e jakiegoœ nowicjusza?",dia_bdt_1020_wegelagerer_agon);
	};
};

func void dia_bdt_1020_wegelagerer_agon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_AGON_15_00");	//Nie widzia³eœ mo¿e jakiegoœ nowicjusza?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_01");	//Em - ¿e co? Hmmm... Mo¿liwe.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_02");	//Za 20 sztuk z³ota mo¿emy porozmawiaæ!
	WEGELAGERER_SURPRISE = TRUE;
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Proszê, oto twoje pieni¹dze.",dia_bdt_1020_wegelagerer_firstwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Wybacz, jestem sp³ukany.",dia_bdt_1020_wegelagerer_firstwarn_nomoney);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"ZejdŸ mi z drogi.",dia_bdt_1020_wegelagerer_firstwarn_never);
};

func void dia_bdt_1020_wegelagerer_firstwarn_howmuch()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00");	//Ile chcesz?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01");	//Za dwie dychy mo¿emy byæ kumplami.
	Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Proszê, oto twoje pieni¹dze.",dia_bdt_1020_wegelagerer_firstwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Wybacz, jestem sp³ukany.",dia_bdt_1020_wegelagerer_firstwarn_nomoney);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"ZejdŸ mi z drogi.",dia_bdt_1020_wegelagerer_firstwarn_never);
};

func void dia_bdt_1020_wegelagerer_firstwarn_joke()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00");	//Chyba ¿artujesz.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01");	//A wygl¹dam na b³azna?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02");	//Jeœli nie zobaczê 20 sztuk z³ota, a ty zbli¿ysz siê chocia¿ o centymetr...
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03");	//Rozgniotê ciê jak robaka. Wyskakuj z kasy, i to ju¿!
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Proszê, oto twoje pieni¹dze.",dia_bdt_1020_wegelagerer_firstwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Wybacz, jestem sp³ukany.",dia_bdt_1020_wegelagerer_firstwarn_nomoney);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"ZejdŸ mi z drogi.",dia_bdt_1020_wegelagerer_firstwarn_never);
};

func void dia_bdt_1020_wegelagerer_pissoff()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_PissOff_15_00");	//ZejdŸ mi z drogi.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_01");	//No, no. Pyskaty jesteœ, jak na takie ma³e, parszywe byle co.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_02");	//Czas siê zamkn¹æ!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bdt_1020_wegelagerer_firstwarn_givemoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00");	//Proszê, oto twoje pieni¹dze.
	if(WEGELAGERER_SURPRISE == FALSE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01");	//20 sztuk z³ota to chyba niewygórowana cena za ¿ycie. Mo¿esz przejœæ.
	};
	if(WEGELAGERER_SURPRISE == TRUE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02");	//Aha, ten nowicjusz przechodzi³ têdy ju¿ prawie godzinê temu.
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03");	//Wygl¹da na to, ¿e bardzo mu by³o pilno, ci¹gle ogl¹da³ siê za siebie. A teraz spadaj.
	};
	b_giveinvitems(other,self,itmi_gold,20);
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_bdt_1020_wegelagerer_firstwarn_nomoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00");	//Wybacz, jestem sp³ukany.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01");	//Taa, ciê¿kie mamy czasy, co?
	if(Npc_HasEquippedMeleeWeapon(other))
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02");	//No, a teraz oddaj mi swoj¹ broñ, a pozwolê ci przejœæ.
		Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Zapomnij o tym.",dia_bdt_1020_wegelagerer_firstwarn_noweapon);
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Proszê, weŸ moj¹ broñ.",dia_bdt_1020_wegelagerer_firstwarn_giveweapon);
	}
	else
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03");	//S³uchaj no, wróæ, kiedy zdobêdziesz pieni¹dze. Nie ma kasy, nie ma przejœcia.
		self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
		AI_StopProcessInfos(self);
	};
};

func void dia_bdt_1020_wegelagerer_firstwarn_never()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00");	//ZejdŸ mi z drogi.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01");	//Chcesz zgrywaæ twardziela? Twoja sprawa...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bdt_1020_wegelagerer_firstwarn_noweapon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00");	//Zapomnij o tym.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01");	//Jak chcesz, niech bêdzie po twojemu.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bdt_1020_wegelagerer_firstwarn_giveweapon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00");	//Proszê, weŸ moj¹ broñ.
	AI_DrawWeapon(other);
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01");	//£apska precz od broni. Zaczekaj tylko!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
};


instance DIA_BDT_1020_WEGELAGERER_SECONDWARN(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 2;
	condition = dia_bdt_1020_wegelagerer_secondwarn_condition;
	information = dia_bdt_1020_wegelagerer_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1020_wegelagerer_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_bdt_1020_wegelagerer_secondwarn_info()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_06_00");	//Jeœli naprawdê chcesz spróbowaæ szczêœcia, twoja sprawa.
	Info_ClearChoices(dia_bdt_1020_wegelagerer_secondwarn);
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_secondwarn,"Oto pieni¹dze.",dia_bdt_1020_wegelagerer_secondwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_secondwarn,"Nie dam ci ani grosza.",dia_bdt_1020_wegelagerer_secondwarn_nomoney);
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
};

func void dia_bdt_1020_wegelagerer_secondwarn_givemoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00");	//Oto twoje pieni¹dze.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01");	//No, tak mo¿emy rozmawiaæ.
	b_giveinvitems(other,self,itmi_gold,20);
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_bdt_1020_wegelagerer_secondwarn_nomoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00");	//Nie dostaniesz ani grosza.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01");	//Sam wiêc j¹ sobie wezmê.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BDT_1020_WEGELAGERER_ATTACK(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 3;
	condition = dia_bdt_1020_wegelagerer_attack_condition;
	information = dia_bdt_1020_wegelagerer_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1020_wegelagerer_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_bdt_1020_wegelagerer_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

