
const int SPL_COST_INFLATE = 10;
const int SPL_INFLATE_DAMAGE = 5;
const int SPL_TIME_INFLATE = 19;

instance SPELL_INFLATE(C_SPELL_PROTO)
{
	time_per_mana = 0;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
};


func int spell_logic_inflate(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_INFLATE))
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_INFLATE;
		};
		if(!c_bodystatecontains(other,BS_SWIM) && !c_bodystatecontains(other,BS_DIVE) && !c_npcisdown(other) && (other.guild < GIL_SEPERATOR_HUM) && (other.flags != NPC_FLAG_IMMORTAL) && (Npc_GetDistToNpc(self,other) <= 1000) && (other.guild != GIL_KDF) && (other.guild != GIL_DMT) && (other.guild != GIL_PAL))
		{
			Npc_ClearAIQueue(other);
			b_clearperceptions(other);
			AI_StartState(other,zs_inflate,0,"");
		};
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_inflate()
{
	self.aivar[AIV_SELECTSPELL] += 1;
};

