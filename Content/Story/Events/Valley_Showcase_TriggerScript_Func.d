
var int valley_showcase_triggerscript_func_onetime;

func void valley_showcase_triggerscript_func()
{
	if(valley_showcase_triggerscript_func_onetime == FALSE)
	{
		b_giveplayerxp(XP_ADDON_WACKELBAUM);
		valley_showcase_triggerscript_func_onetime = TRUE;
	};
};

