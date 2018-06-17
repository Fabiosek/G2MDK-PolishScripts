
func int c_hp_artefaktvalue()
{
	var int hp_artefakt_value;
	hp_artefakt_value = 0;
	if(HP_AMULETT_EQUIPPED == TRUE)
	{
		if(HP_RING_1_EQUIPPED == TRUE)
		{
			if(HP_RING_2_EQUIPPED == TRUE)
			{
				if(HP_ARTEFAKT_EFFEKT == FALSE)
				{
					Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
					Snd_Play("MFX_LIGHT_CAST");
					HP_ARTEFAKT_EFFEKT = TRUE;
				};
				hp_artefakt_value = HP_AMULETT_ARTEFAKT_BONUS;
			}
			else
			{
				hp_artefakt_value = HP_AMULETT_EINRING_BONUS;
			};
		}
		else if(HP_RING_2_EQUIPPED == TRUE)
		{
			hp_artefakt_value = HP_AMULETT_EINRING_BONUS;
		}
		else
		{
			hp_artefakt_value = HP_AMULETT_SOLO_BONUS;
		};
	}
	else if(HP_RING_1_EQUIPPED == TRUE)
	{
		if(HP_RING_2_EQUIPPED == TRUE)
		{
			hp_artefakt_value = HP_RING_DOUBLE_BONUS;
		}
		else
		{
			hp_artefakt_value = HP_RING_SOLO_BONUS;
		};
	}
	else if(HP_RING_2_EQUIPPED == TRUE)
	{
		hp_artefakt_value = HP_RING_SOLO_BONUS;
	};
	return hp_artefakt_value;
};

func int c_ma_artefaktvalue()
{
	var int ma_artefakt_value;
	ma_artefakt_value = 0;
	if(MA_AMULETT_EQUIPPED == TRUE)
	{
		if(MA_RING_1_EQUIPPED == TRUE)
		{
			if(MA_RING_2_EQUIPPED == TRUE)
			{
				if(MA_ARTEFAKT_EFFEKT == FALSE)
				{
					Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
					Snd_Play("MFX_LIGHT_CAST");
					MA_ARTEFAKT_EFFEKT = TRUE;
				};
				ma_artefakt_value = MA_AMULETT_ARTEFAKT_BONUS;
			}
			else
			{
				ma_artefakt_value = MA_AMULETT_EINRING_BONUS;
			};
		}
		else if(MA_RING_2_EQUIPPED == TRUE)
		{
			ma_artefakt_value = MA_AMULETT_EINRING_BONUS;
		}
		else
		{
			ma_artefakt_value = MA_AMULETT_SOLO_BONUS;
		};
	}
	else if(MA_RING_1_EQUIPPED == TRUE)
	{
		if(MA_RING_2_EQUIPPED == TRUE)
		{
			ma_artefakt_value = MA_RING_DOUBLE_BONUS;
		}
		else
		{
			ma_artefakt_value = MA_RING_SOLO_BONUS;
		};
	}
	else if(MA_RING_2_EQUIPPED == TRUE)
	{
		ma_artefakt_value = MA_RING_SOLO_BONUS;
	};
	return ma_artefakt_value;
};

func int c_str_artefaktvalue()
{
	var int str_artefakt_value;
	str_artefakt_value = 0;
	if(STR_AMULETT_EQUIPPED == TRUE)
	{
		if(STR_RING_1_EQUIPPED == TRUE)
		{
			if(STR_RING_2_EQUIPPED == TRUE)
			{
				if(STR_ARTEFAKT_EFFEKT == FALSE)
				{
					Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
					Snd_Play("MFX_LIGHT_CAST");
					STR_ARTEFAKT_EFFEKT = TRUE;
				};
				str_artefakt_value = STR_AMULETT_ARTEFAKT_BONUS;
			}
			else
			{
				str_artefakt_value = STR_AMULETT_EINRING_BONUS;
			};
		}
		else if(STR_RING_2_EQUIPPED == TRUE)
		{
			str_artefakt_value = STR_AMULETT_EINRING_BONUS;
		}
		else
		{
			str_artefakt_value = STR_AMULETT_SOLO_BONUS;
		};
	}
	else if(STR_RING_1_EQUIPPED == TRUE)
	{
		if(STR_RING_2_EQUIPPED == TRUE)
		{
			str_artefakt_value = STR_RING_DOUBLE_BONUS;
		}
		else
		{
			str_artefakt_value = STR_RING_SOLO_BONUS;
		};
	}
	else if(STR_RING_2_EQUIPPED == TRUE)
	{
		str_artefakt_value = STR_RING_SOLO_BONUS;
	};
	return str_artefakt_value;
};

