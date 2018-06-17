
instance DIA_ADDON_CRIMSON_EXIT(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 999;
	condition = dia_addon_crimson_exit_condition;
	information = dia_addon_crimson_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_crimson_exit_condition()
{
	return TRUE;
};

func void dia_addon_crimson_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CRIMSON_PICKPOCKET(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 900;
	condition = dia_addon_crimson_pickpocket_condition;
	information = dia_addon_crimson_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_crimson_pickpocket_condition()
{
	return c_beklauen(66,66);
};

func void dia_addon_crimson_pickpocket_info()
{
	Info_ClearChoices(dia_addon_crimson_pickpocket);
	Info_AddChoice(dia_addon_crimson_pickpocket,DIALOG_BACK,dia_addon_crimson_pickpocket_back);
	Info_AddChoice(dia_addon_crimson_pickpocket,DIALOG_PICKPOCKET,dia_addon_crimson_pickpocket_doit);
};

func void dia_addon_crimson_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_crimson_pickpocket);
};

func void dia_addon_crimson_pickpocket_back()
{
	Info_ClearChoices(dia_addon_crimson_pickpocket);
};


instance DIA_ADDON_CRIMSON_HI(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_hi_condition;
	information = dia_addon_crimson_hi_info;
	permanent = FALSE;
	description = "Co robisz? Topisz z³oto?";
};


func int dia_addon_crimson_hi_condition()
{
	return TRUE;
};

func void dia_addon_crimson_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Hi_15_00");	//Co robisz? Topisz z³oto?
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_01");	//Nie, siekam cebulkê. Oczywiœcie, ¿e topiê z³oto i robiê z niego monety.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_02");	//Pewnego piêknego popo³udnia zza rogu wyszed³ Kruk i da³ mi matrycê do wybijania monet.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_03");	//Z jednego samorodka mogê wybiæ wiele monet - s¹ tak dobre, ¿e nikt nie zauwa¿y ró¿nicy.
};


instance DIA_ADDON_CRIMSON_HOW(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_how_condition;
	information = dia_addon_crimson_how_info;
	permanent = FALSE;
	description = "Ile monet dasz mi za samorodek?";
};


func int dia_addon_crimson_how_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_hi))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_how_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_How_15_00");	//Ile monet dasz mi za samorodek?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_01");	//Nie znam ciê za dobrze, ale dam ci cenê jak dla przyjaciela. Za samorodek dostaniesz....
	b_say_gold(self,other,10);
};


instance DIA_ADDON_CRIMSON_FEILSCH(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_feilsch_condition;
	information = dia_addon_crimson_feilsch_info;
	permanent = FALSE;
	description = "Umowa stoi!";
};


func int dia_addon_crimson_feilsch_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_feilsch_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_00");	//Umowa stoi!
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_01");	//Hmm. Nie. To normalna cena.
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_02");	//Myœla³em, ¿e to cena dla przyjació³.
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_03");	//Bo tak jest. Wszyscy tu jesteœmy przyjació³mi.
};


instance DIA_ADDON_CRIMSON_GOLD(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 99;
	condition = dia_addon_crimson_gold_condition;
	information = dia_addon_crimson_gold_info;
	permanent = TRUE;
	description = "Wymieñ samorodki z³ota...";
};


func int dia_addon_crimson_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_gold_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Gold_15_00");	//Pohandlujmy.
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Wymieñ wszystkie samorodki z³ota ",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Wymieñ 1 samorodek z³ota",dia_addon_crimson_gold_1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Gold_10_01");	//Ale nie masz ¿adnych samorodków.
	};
};

func void dia_addon_crimson_gold_back()
{
	Info_ClearChoices(dia_addon_crimson_gold);
};

func void dia_addon_crimson_gold_alle()
{
	var int currentnuggets;
	currentnuggets = Npc_HasItems(other,itmi_goldnugget_addon);
	b_giveinvitems(other,self,itmi_goldnugget_addon,currentnuggets);
	b_giveinvitems(self,other,itmi_gold,currentnuggets * 10);
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Wymieñ wszystkie samorodki z³ota ",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Wymieñ 1 samorodek z³ota",dia_addon_crimson_gold_1);
	};
};

func void dia_addon_crimson_gold_1()
{
	b_giveinvitems(other,self,itmi_goldnugget_addon,1);
	b_giveinvitems(self,other,itmi_gold,10);
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Wymieñ wszystkie samorodki z³ota ",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Wymieñ 1 samorodek z³ota",dia_addon_crimson_gold_1);
	};
};

func void b_say_crimsonbeliar()
{
	AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_LOS_10_00");	//KHARDIMON FATAGN SCHATAR FATAGN BELIAR.
};


instance DIA_ADDON_CRIMSON_RAVEN(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 9;
	condition = dia_addon_crimson_raven_condition;
	information = dia_addon_crimson_raven_info;
	permanent = FALSE;
	description = "Co wiesz o Kruku?";
};


func int dia_addon_crimson_raven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_raven_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Raven_15_00");	//Co wiesz o Kruku?
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_01");	//Nie uwierzysz w to... Widzia³em, co robi³ w krypcie!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_02");	//Mamrota³ i wypowiada³ dziwne s³owa... Powtarza³ wszystko wiele razy...
	b_say_crimsonbeliar();
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_03");	//Potem z krypty wystrzeli³o jaskrawe œwiat³o i us³ysza³em KRZYK.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_04");	//O bogowie, ten g³os! Brzmia³ niczym ryk koñca œwiata.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_05");	//Kruk z nim rozmawia³ - Kruk i TEN g³os!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_06");	//Nie pamiêtam, o czym mówili. Mog³em siê ruszyæ dopiero wiele godzin póŸniej.
};


instance DIA_ADDON_CRIMSON_FATAGN(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 98;
	condition = dia_addon_crimson_fatagn_condition;
	information = dia_addon_crimson_fatagn_info;
	permanent = TRUE;
	description = "Mo¿esz jeszcze raz powtórzyæ s³owa Kruka?";
};


func int dia_addon_crimson_fatagn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_raven) && (CRIMSON_SAYBELIAR < 4))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_fatagn_info()
{
	CRIMSON_SAYBELIAR = CRIMSON_SAYBELIAR + 1;
	AI_Output(other,self,"DIA_Addon_Crimson_FATAGN_15_00");	//Mo¿esz jeszcze raz powtórzyæ s³owa Kruka?
	if(CRIMSON_SAYBELIAR <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_01");	//Pewnie! Gotowy?
		Info_ClearChoices(dia_addon_crimson_fatagn);
		Info_AddChoice(dia_addon_crimson_fatagn,"Tak.",dia_addon_crimson_fatagn_los);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_02");	//Myœlê, ¿e lepiej daæ temu spokój.
	};
};

func void dia_addon_crimson_fatagn_los()
{
	Snd_Play("Mystery_09");
	b_say_crimsonbeliar();
	if(CRIMSON_SAYBELIAR == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
	};
	Info_ClearChoices(dia_addon_crimson_fatagn);
};

