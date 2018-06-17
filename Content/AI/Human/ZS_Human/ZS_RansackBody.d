
func void zs_ransackbody()
{
	perception_set_normal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
};

func int zs_ransackbody_loop()
{
	return LOOP_END;
};

func void zs_ransackbody_end()
{
	var int x;
	b_turntonpc(self,other);
	AI_PlayAni(self,"T_PLUNDER");
	if((Npc_HasItems(other,holy_hammer_mis) > 0) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(garwig)))
	{
		CreateInvItems(self,holy_hammer_mis,1);
		Npc_RemoveInvItems(other,holy_hammer_mis,1);
	};
	if((Npc_HasItems(other,itmw_2h_rod) > 0) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rod)))
	{
		CreateInvItems(self,itmw_2h_rod,1);
		Npc_RemoveInvItems(other,itmw_2h_rod,1);
		AI_EquipBestMeleeWeapon(self);
	};
	if(Npc_HasItems(other,itke_greg_addon_mis) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(francis)))
	{
		CreateInvItems(self,itke_greg_addon_mis,1);
		Npc_RemoveInvItems(other,itke_greg_addon_mis,1);
	};
	if(Npc_HasItems(other,itmi_gold) > 0)
	{
		x = Npc_HasItems(other,itmi_gold);
		CreateInvItems(self,itmi_gold,x);
		Npc_RemoveInvItems(other,itmi_gold,x);
		b_say(self,other,"$ITOOKYOURGOLD");
	}
	else
	{
		b_say(self,other,"$SHITNOGOLD");
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item))
		{
			if(Npc_GetDistToItem(self,item) < 500)
			{
				AI_TakeItem(self,item);
				b_say(self,self,"$ITAKEYOURWEAPON");
				AI_EquipBestMeleeWeapon(self);
				AI_EquipBestRangedWeapon(self);
			};
		};
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,zs_healself,0,"");
		return;
	};
};

func void zs_getmeat()
{
	var int x;
	perception_set_minimal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_PLUNDER");
	x = Npc_HasItems(other,itfomuttonraw);
	CreateInvItems(self,itfomuttonraw,x);
	Npc_RemoveInvItems(other,itfomuttonraw,x);
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,zs_healself,0,"");
		return;
	};
};

