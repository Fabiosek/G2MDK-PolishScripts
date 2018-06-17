
func int spell_processmana_release(var int manainvested)
{
	var int activespell;
	activespell = Npc_GetActiveSpell(self);
	if(activespell == SPL_PYROKINESIS)
	{
		return SPL_SENDCAST;
	};
	if(activespell == SPL_CHARGEFIREBALL)
	{
		return SPL_SENDCAST;
	};
	if(activespell == SPL_CHARGEZAP)
	{
		return SPL_SENDCAST;
	};
	if(activespell == SPL_WINDFIST)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

