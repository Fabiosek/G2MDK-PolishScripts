
instance DIA_ADDON_BL_BDT_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_bl_bdt_13_exit_condition;
	information = dia_addon_bl_bdt_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bl_bdt_13_exit_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_exit_info()
{
	BDT_13_NERVER = 0;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BL_BDT_13_CHEF(C_INFO)
{
	nr = 2;
	condition = dia_addon_bl_bdt_13_chef_condition;
	information = dia_addon_bl_bdt_13_chef_info;
	permanent = TRUE;
	description = "Kto tu jest szefem?";
};


func int dia_addon_bl_bdt_13_chef_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_chef_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Chef_15_00");	//Kto tu jest szefem?
	if(RAVENISDEAD == TRUE)
	{
		if(Npc_IsDead(thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_01");	//Nasz wspania�y przyw�dca Thorus. Dzi�ki niemu wszyscy b�dziemy bogaci.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_02");	//Nasz wspania�y przyw�dca.... Eee... Nie mam poj�cia...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_03");	//Nasz wspania�y przyw�dca, Kruk. Dzi�ki niemu wszyscy b�dziemy bogaci.
	};
};


instance DIA_ADDON_BL_BDT_13_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_13_lager_condition;
	information = dia_addon_bl_bdt_13_lager_info;
	permanent = TRUE;
	description = "Co wiesz o obozie?";
};


func int dia_addon_bl_bdt_13_lager_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_lager_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Lager_15_00");	//Co wiesz o obozie?
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_01");	//Porozmawiaj ze Snafem, je�li chcesz si� czego� dowiedzie�. Ten spasiony kucharz sporo wie.
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_02");	//Je�li chcesz co� kupi�, poszukaj Fiska. On mo�e za�atwi� niemal wszystko...
};


instance DIA_ADDON_BL_BDT_13_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_bl_bdt_13_news_condition;
	information = dia_addon_bl_bdt_13_news_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_addon_bl_bdt_13_news_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_news_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_News_15_00");	//Co nowego?
	if(RAVENISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_01");	//Kruk nie �yje. Teraz NIGDY nie wydostaniemy si� z tej wyspy.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_02");	//Piraci postawili �agle i zwiali.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_03");	//Na pla�y zosta�o tylko paru idiot�w, kt�rzy nie maj� nawet porz�dnego statku.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_04");	//Nawet Beliar nie wie, jak mo�na si� wydosta� z tej wyspy.
	};
};


instance DIA_ADDON_BL_BDT_13_GOLD(C_INFO)
{
	nr = 5;
	condition = dia_addon_bl_bdt_13_gold_condition;
	information = dia_addon_bl_bdt_13_gold_info;
	permanent = TRUE;
	description = "Jak mo�na si� szybko wzbogaci�?";
};


func int dia_addon_bl_bdt_13_gold_condition()
{
	if((MIS_SEND_BUDDLER != LOG_RUNNING) || (MIS_SEND_BUDDLER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_13_gold_info()
{
	BDT_13_NERVER = BDT_13_NERVER + 1;
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Gold_15_00");	//Jak mo�na si� szybko wzbogaci�?
	if(BDT_13_NERVER <= 2)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_01");	//Dobre pytanie. Czy� nie po to wszyscy tu jeste�my?
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_02");	//Zdob�d� czerwony kamie� i daj go Thorusowi, a b�dziesz m�g� wej�� do kopalni.
	}
	else if(BDT_13_KILL == FALSE)
	{
		BDT_13_NERVER = 0;
		BDT_13_KILL = TRUE;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_03");	//�arty sobie stroisz? Spadaj!
		AI_StopProcessInfos(self);
	}
	else
	{
		BDT_13_NERVER = 0;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_04");	//Koniec z uprzejmo�ciami!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void b_assignambientinfos_addon_bl_bdt_13(var C_NPC slf)
{
	dia_addon_bl_bdt_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_chef.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_news.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_gold.npc = Hlp_GetInstanceID(slf);
};

