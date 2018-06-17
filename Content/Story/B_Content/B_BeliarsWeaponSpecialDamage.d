
var int ravenblitz;

func void b_beliarsweaponspecialdamage(var C_NPC oth,var C_NPC slf)
{
	var int ravenrandy;
	var int damagerandy;
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raven))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",slf,slf,0,0,0,FALSE);
		if(RAVENBLITZ <= 0)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
			b_magichurtnpc(slf,oth,50);
			RAVENBLITZ += 1;
		}
		else if(RAVENBLITZ >= 3)
		{
			ravenrandy = Hlp_Random(3);
			if(ravenrandy <= 50)
			{
				RAVENBLITZ = 0;
			};
		}
		else
		{
			RAVENBLITZ += 1;
		};
	}
	else if(Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		damagerandy = Hlp_Random(100);
		if(c_schasreadiedbeliarsweapon() && (damagerandy <= BELIARDAMAGECHANCE))
		{
			if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
				b_magichurtnpc(slf,oth,100);
			}
			else if(slf.flags != NPC_FLAG_IMMORTAL)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
				b_magichurtnpc(oth,slf,100);
			};
			Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",hero,hero,0,0,0,FALSE);
		};
		if(c_schasreadiedbeliarsweapon() && (damagerandy <= 50))
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",hero,hero,0,0,0,FALSE);
		};
	};
};

