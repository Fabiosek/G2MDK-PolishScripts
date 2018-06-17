
func void zs_commentfakeguild()
{
	var C_ITEM itm;
	perception_set_minimal();
	AI_Standup(self);
	if(!c_bodystatecontains(self,BS_SIT))
	{
		b_turntonpc(self,other);
	};
	if(!c_bodystatecontains(other,BS_SIT))
	{
		b_turntonpc(other,self);
		if(Npc_GetDistToNpc(other,self) < 80)
		{
			AI_Dodge(other);
		};
	};
	if(Npc_HasEquippedArmor(other) == TRUE)
	{
		itm = Npc_GetEquippedArmor(other);
		if((self.guild == GIL_MIL) || (self.guild == GIL_PAL))
		{
			b_say(self,other,"$ADDON_WRONGARMOR_MIL");
		}
		else if((self.guild == GIL_NOV) || (self.guild == GIL_KDF))
		{
			b_say(self,other,"$ADDON_WRONGARMOR_KDF");
		}
		else if((self.guild == GIL_SLD) || (self.guild == GIL_DJG))
		{
			b_say(self,other,"$ADDON_WRONGARMOR_SLD");
		}
		else
		{
			b_say(self,other,"$ADDON_WRONGARMOR");
		};
	}
	else if(self.guild == GIL_BDT)
	{
		b_say(self,other,"$ADDON_NOARMOR_BDT");
	};
};

