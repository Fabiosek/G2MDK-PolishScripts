
const int SPL_COST_SLEEP = 30;
const int SPL_TIME_SLEEP = 30;

instance SPELL_SLEEP(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
};


func int spell_logic_sleep(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_SLEEP))
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SLEEP;
		};
		if(!c_bodystatecontains(other,BS_SWIM) && !c_bodystatecontains(other,BS_DIVE) && !c_npcisdown(other) && (other.guild < GIL_SEPERATOR_HUM) && (other.flags != NPC_FLAG_IMMORTAL) && (Npc_GetDistToNpc(self,other) <= 1000) && (other.guild != GIL_KDF) && (other.guild != GIL_DMT) && (other.guild != GIL_PAL))
		{
			Npc_ClearAIQueue(other);
			b_clearperceptions(other);
			AI_StartState(other,zs_magicsleep,0,"");
		};
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_sleep()
{
	self.aivar[AIV_SELECTSPELL] += 1;
};

