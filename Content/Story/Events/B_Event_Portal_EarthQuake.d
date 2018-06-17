
func void b_event_portal_earthquake()
{
	var int randy;
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	randy = Hlp_Random(4);
	if(randy == 0)
	{
		Snd_Play("Ravens_Earthquake4");
	};
	if(randy == 1)
	{
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
	};
	if(randy == 2)
	{
		Snd_Play("Ravens_Earthquake3");
		Snd_Play("Ravens_Earthquake1");
	};
	if(randy == 3)
	{
		Snd_Play("Ravens_Earthquake3");
	};
};


var int b_event_portal_first_earthquake_onetime;

func void b_event_portal_first_earthquake()
{
	if(b_event_portal_first_earthquake_onetime == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		b_event_portal_first_earthquake_onetime = TRUE;
	};
};

