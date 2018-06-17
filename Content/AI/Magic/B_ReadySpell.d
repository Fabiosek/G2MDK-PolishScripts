
func void b_readyspell(var C_NPC slf,var int spell,var int mana)
{
	if(slf.attribute[ATR_MANA_MAX] < mana)
	{
		Npc_ChangeAttribute(slf,ATR_MANA_MAX,mana);
	};
	if(slf.attribute[ATR_MANA] < mana)
	{
		Npc_ChangeAttribute(slf,ATR_MANA,mana);
	};
	if(Npc_IsDrawingSpell(slf) == spell)
	{
		return;
	};
	if(Npc_GetActiveSpell(slf) == spell)
	{
		return;
	}
	else if(Npc_GetActiveSpell(slf) != -1)
	{
		AI_RemoveWeapon(slf);
	};
	AI_ReadySpell(slf,spell,mana);
};

