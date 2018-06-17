
instance DIA_ADDON_GIVEPOTION(C_INFO)
{
	nr = 777;
	condition = dia_addon_givepotion_condition;
	information = dia_addon_givepotion_info;
	permanent = TRUE;
	description = "(Daj miksturê lecznicz¹)";
};


func int dia_addon_givepotion_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (self.flags != NPC_FLAG_IMMORTAL))
	{
		if((Npc_HasItems(other,itpo_health_01) >= 1) || (Npc_HasItems(other,itpo_health_02) >= 1) || (Npc_HasItems(other,itpo_health_03) >= 1))
		{
			return TRUE;
		};
	};
};

func void dia_addon_givepotion_info()
{
	Info_ClearChoices(dia_addon_givepotion);
	Info_AddChoice(dia_addon_givepotion,DIALOG_BACK,dia_addon_givepotion_back);
	if(Npc_HasItems(other,itpo_health_03) >= 1)
	{
		Info_AddChoice(dia_addon_givepotion,"(Daj eliksir leczniczy)",dia_addon_givepotion_itpo_health_03);
	};
	if(Npc_HasItems(other,itpo_health_02) >= 1)
	{
		Info_AddChoice(dia_addon_givepotion,"(Daj ekstrakt leczniczy)",dia_addon_givepotion_itpo_health_02);
	};
	if(Npc_HasItems(other,itpo_health_01) >= 1)
	{
		Info_AddChoice(dia_addon_givepotion,"(Daj esencjê lecznicz¹)",dia_addon_givepotion_itpo_health_01);
	};
};

func void b_addon_drinkpotion()
{
	AI_Output(other,self,"DIA_Addon_Brandon_GivePotion_15_00");	//Proszê, weŸ tê miksturê uzdrawiaj¹c¹.
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		if(Npc_HasItems(self,itpo_health_03) > 0)
		{
			b_useitem(self,itpo_health_03);
		}
		else if(Npc_HasItems(self,itpo_health_02) > 0)
		{
			b_useitem(self,itpo_health_02);
		}
		else if(Npc_HasItems(self,itpo_health_01) > 0)
		{
			b_useitem(self,itpo_health_01);
		};
	};
	Info_ClearChoices(dia_addon_givepotion);
};

func void dia_addon_givepotion_back()
{
	Info_ClearChoices(dia_addon_givepotion);
};

func void dia_addon_givepotion_itpo_health_03()
{
	b_giveinvitems(other,self,itpo_health_03,1);
	b_addon_drinkpotion();
};

func void dia_addon_givepotion_itpo_health_02()
{
	b_giveinvitems(other,self,itpo_health_02,1);
	b_addon_drinkpotion();
};

func void dia_addon_givepotion_itpo_health_01()
{
	b_giveinvitems(other,self,itpo_health_01,1);
	b_addon_drinkpotion();
};

func void b_addon_givepotion(var C_NPC slf)
{
	dia_addon_givepotion.npc = Hlp_GetInstanceID(slf);
};

