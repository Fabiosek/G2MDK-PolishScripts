
var int b_greg_comestodexter_onetime;

func void b_greg_comestodexter()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dexter))
	{
		if(b_greg_comestodexter_onetime == FALSE)
		{
			dexter.aivar[AIV_ENEMYOVERRIDE] = FALSE;
			GREGLOCATION = GREG_DEXTER;
			b_startotherroutine(greg_nw,"Dexter");
			b_greg_comestodexter_onetime = TRUE;
		};
	};
};

