
var int victimcount;
var int victimlevel;
var int thieflevel;
const int THIEFXP = 50;

func void b_givethiefxp()
{
	VICTIMCOUNT = VICTIMCOUNT + 1;
	if(VICTIMLEVEL == 0)
	{
		VICTIMLEVEL = 2;
	};
	if(VICTIMCOUNT >= VICTIMLEVEL)
	{
		THIEFLEVEL = THIEFLEVEL + 1;
		VICTIMLEVEL = VICTIMCOUNT + THIEFLEVEL;
	};
	b_giveplayerxp(THIEFXP + (THIEFLEVEL * 10));
};

func void b_resetthieflevel()
{
	if(VICTIMCOUNT > THIEFLEVEL)
	{
		VICTIMCOUNT = VICTIMCOUNT - 1;
	};
};

