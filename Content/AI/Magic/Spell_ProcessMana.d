
func int spell_processmana(var int manainvested)
{
	var int activespell;
	activespell = Npc_GetActiveSpell(self);
	if(activespell == SPL_PALLIGHT)
	{
		return spell_logic_pallight(manainvested);
	};
	if(activespell == SPL_PALLIGHTHEAL)
	{
		return spell_logic_pallightheal(manainvested);
	};
	if(activespell == SPL_PALHOLYBOLT)
	{
		return spell_logic_palholybolt(manainvested);
	};
	if(activespell == SPL_PALMEDIUMHEAL)
	{
		return spell_logic_palmediumheal(manainvested);
	};
	if(activespell == SPL_PALREPELEVIL)
	{
		return spell_logic_palrepelevil(manainvested);
	};
	if(activespell == SPL_PALFULLHEAL)
	{
		return spell_logic_palfullheal(manainvested);
	};
	if(activespell == SPL_PALDESTROYEVIL)
	{
		return spell_logic_paldestroyevil(manainvested);
	};
	if(activespell == SPL_PALTELEPORTSECRET)
	{
		return spell_logic_palteleportsecret(manainvested);
	};
	if(activespell == SPL_TELEPORTSEAPORT)
	{
		return spell_logic_teleportseaport(manainvested);
	};
	if(activespell == SPL_TELEPORTMONASTERY)
	{
		return spell_logic_teleportmonastery(manainvested);
	};
	if(activespell == SPL_TELEPORTFARM)
	{
		return spell_logic_teleportfarm(manainvested);
	};
	if(activespell == SPL_TELEPORTXARDAS)
	{
		return spell_logic_teleportxardas(manainvested);
	};
	if(activespell == SPL_TELEPORTPASSNW)
	{
		return spell_logic_teleportpassnw(manainvested);
	};
	if(activespell == SPL_TELEPORTPASSOW)
	{
		return spell_logic_teleportpassow(manainvested);
	};
	if(activespell == SPL_TELEPORTOC)
	{
		return spell_logic_teleportoc(manainvested);
	};
	if(activespell == SPL_TELEPORTOWDEMONTOWER)
	{
		return spell_logic_teleportowdemontower(manainvested);
	};
	if(activespell == SPL_TELEPORTTAVERNE)
	{
		return spell_logic_teleporttaverne(manainvested);
	};
	if(activespell == SPL_LIGHT)
	{
		return spell_logic_light(manainvested);
	};
	if(activespell == SPL_FIREBOLT)
	{
		return spell_logic_firebolt(manainvested);
	};
	if(activespell == SPL_ICEBOLT)
	{
		return spell_logic_icebolt(manainvested);
	};
	if(activespell == SPL_ZAP)
	{
		return spell_logic_zap(manainvested);
	};
	if(activespell == SPL_LIGHTHEAL)
	{
		return spell_logic_lightheal(manainvested);
	};
	if(activespell == SPL_SUMMONGOBLINSKELETON)
	{
		return spell_logic_summongoblinskeleton(manainvested);
	};
	if(activespell == SPL_INSTANTFIREBALL)
	{
		return spell_logic_instantfireball(manainvested);
	};
	if(activespell == SPL_SUMMONWOLF)
	{
		return spell_logic_summonwolf(manainvested);
	};
	if(activespell == SPL_WINDFIST)
	{
		return spell_logic_windfist(manainvested);
	};
	if(activespell == SPL_SLEEP)
	{
		return spell_logic_sleep(manainvested);
	};
	if(activespell == SPL_MEDIUMHEAL)
	{
		return spell_logic_mediumheal(manainvested);
	};
	if(activespell == SPL_LIGHTNINGFLASH)
	{
		return spell_logic_lightningflash(manainvested);
	};
	if(activespell == SPL_CHARGEFIREBALL)
	{
		return spell_logic_chargefireball(manainvested);
	};
	if(activespell == SPL_CHARGEZAP)
	{
		return spell_logic_chargezap(manainvested);
	};
	if(activespell == SPL_SUMMONSKELETON)
	{
		return spell_logic_summonskeleton(manainvested);
	};
	if(activespell == SPL_FEAR)
	{
		return spell_logic_fear(manainvested);
	};
	if(activespell == SPL_ICECUBE)
	{
		return spell_logic_icecube(manainvested);
	};
	if(activespell == SPL_CHARGEZAP)
	{
		return spell_logic_chargezap(manainvested);
	};
	if(activespell == SPL_SUMMONGOLEM)
	{
		return spell_logic_summongolem(manainvested);
	};
	if(activespell == SPL_DESTROYUNDEAD)
	{
		return spell_logic_destroyundead(manainvested);
	};
	if(activespell == SPL_PYROKINESIS)
	{
		return spell_logic_pyrokinesis(manainvested);
	};
	if(activespell == SPL_FIRESTORM)
	{
		return spell_logic_firestorm(manainvested);
	};
	if(activespell == SPL_ICEWAVE)
	{
		return spell_logic_icewave(manainvested);
	};
	if(activespell == SPL_SUMMONDEMON)
	{
		return spell_logic_summondemon(manainvested);
	};
	if(activespell == SPL_FULLHEAL)
	{
		return spell_logic_fullheal(manainvested);
	};
	if(activespell == SPL_FIRERAIN)
	{
		return spell_logic_firerain(manainvested);
	};
	if(activespell == SPL_BREATHOFDEATH)
	{
		return spell_logic_breathofdeath(manainvested);
	};
	if(activespell == SPL_MASSDEATH)
	{
		return spell_logic_massdeath(manainvested);
	};
	if(activespell == SPL_ARMYOFDARKNESS)
	{
		return spell_logic_armyofdarkness(manainvested);
	};
	if(activespell == SPL_SHRINK)
	{
		return spell_logic_shrink(manainvested);
	};
	if(activespell == SPL_TRFSHEEP)
	{
		return spell_logic_trfsheep(manainvested);
	};
	if(activespell == SPL_TRFSCAVENGER)
	{
		return spell_logic_trfscavenger(manainvested);
	};
	if(activespell == SPL_TRFGIANTRAT)
	{
		return spell_logic_trfgiantrat(manainvested);
	};
	if(activespell == SPL_TRFGIANTBUG)
	{
		return spell_logic_trfgiantbug(manainvested);
	};
	if(activespell == SPL_TRFWOLF)
	{
		return spell_logic_trfwolf(manainvested);
	};
	if(activespell == SPL_TRFWARAN)
	{
		return spell_logic_trfwaran(manainvested);
	};
	if(activespell == SPL_TRFSNAPPER)
	{
		return spell_logic_trfsnapper(manainvested);
	};
	if(activespell == SPL_TRFWARG)
	{
		return spell_logic_trfwarg(manainvested);
	};
	if(activespell == SPL_TRFFIREWARAN)
	{
		return spell_logic_trffirewaran(manainvested);
	};
	if(activespell == SPL_TRFLURKER)
	{
		return spell_logic_trflurker(manainvested);
	};
	if(activespell == SPL_TRFSHADOWBEAST)
	{
		return spell_logic_trfshadowbeast(manainvested);
	};
	if(activespell == SPL_TRFDRAGONSNAPPER)
	{
		return spell_logic_trfdragonsnapper(manainvested);
	};
	if(activespell == SPL_CHARM)
	{
		return spell_logic_charm(manainvested);
	};
	if(activespell == SPL_MASTEROFDISASTER)
	{
		return spell_logic_masterofdisaster(manainvested);
	};
	if(activespell == SPL_CONCUSSIONBOLT)
	{
		return spell_logic_concussionbolt(manainvested);
	};
	if(activespell == SPL_DEATHBOLT)
	{
		return spell_logic_deathbolt(manainvested);
	};
	if(activespell == SPL_DEATHBALL)
	{
		return spell_logic_deathball(manainvested);
	};
	if(activespell == SPL_THUNDERSTORM)
	{
		return spell_logic_thunderstorm(manainvested);
	};
	if(activespell == SPL_WATERFIST)
	{
		return spell_logic_waterfist(manainvested);
	};
	if(activespell == SPL_WHIRLWIND)
	{
		return spell_logic_whirlwind(manainvested);
	};
	if(activespell == SPL_GEYSER)
	{
		return spell_logic_geyser(manainvested);
	};
	if(activespell == SPL_INFLATE)
	{
		return spell_logic_inflate(manainvested);
	};
	if(activespell == SPL_ICELANCE)
	{
		return spell_logic_icelance(manainvested);
	};
	if(activespell == SPL_SWARM)
	{
		return spell_logic_swarm(manainvested);
	};
	if(activespell == SPL_GREENTENTACLE)
	{
		return spell_logic_greententacle(manainvested);
	};
	if(activespell == SPL_SUMMONGUARDIAN)
	{
		return spell_logic_summonguardian(manainvested);
	};
	if(activespell == SPL_ENERGYBALL)
	{
		return spell_logic_energyball(manainvested);
	};
	if(activespell == SPL_SUCKENERGY)
	{
		return spell_logic_suckenergy(manainvested);
	};
	if(activespell == SPL_SKULL)
	{
		return spell_logic_skull(manainvested);
	};
	if(activespell == SPL_SUMMONZOMBIE)
	{
		return spell_logic_summonzombie(manainvested);
	};
	if(activespell == SPL_SUMMONMUD)
	{
		return spell_logic_summonmud(manainvested);
	};
};

