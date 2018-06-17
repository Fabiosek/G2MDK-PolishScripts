
instance DIA_AMBIENTDEMENTOR_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ambientdementor_exit_condition;
	information = dia_ambientdementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ambientdementor_exit_condition()
{
	return TRUE;
};

func void dia_ambientdementor_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	b_scisobsessed(self);
	Npc_SetRefuseTalk(self,5);
	Snd_Play("MFX_FEAR_CAST");
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino4)))
	{
		dmt_vino1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	}
	else
	{
		b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	};
};


instance DIA_AMBIENTDEMENTOR(C_INFO)
{
	nr = 1;
	condition = dia_ambientdementor_condition;
	information = dia_ambientdementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ambientdementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_ambientdementor_info()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	randy = Hlp_Random(4);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino4)))
	{
		AI_Output(self,other,"DIA_VinoDementor_19_00");	//Przyszed�e� tu, by przeszkodzi� nam w rytuale? Jego dusza nale�y do nas! Ju� mu nie pomo�esz, magu!
	}
	else if(CURRENTLEVEL == DRAGONISLAND_ZEN)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dragonisle_keymaster))
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_01");	//Spr�bujesz przeszkodzi� mi w moim zadaniu? Nie masz szans, �miertelniku!
			AI_Output(self,other,"DIA_AmbientDementor_19_02");	//Jeszcze nikomu nie uda�o si� przej�� przez moj� krypt�. Zawr��! Ty te� nigdy nie dotrzesz do �wi�tego Dworu Irdorath.
		}
		else
		{
			if(randy == 0)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_03");	//I tak dotar�e� zbyt daleko, n�dzny robaku. Nigdy nie zst�pisz do �wi�tego sanktuarium.
			};
			if(randy == 1)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_04");	//St�j! Ani kroku dalej!
			};
			if(randy == 2)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_05");	//Daleko zaszed�e�, ale to ju� koniec twojej drogi.
			};
			if(randy == 3)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_06");	//Je�li chcesz zmierzy� si� z moim Panem, musisz najpierw mnie pokona�!
			};
		};
	}
	else if(hero.guild == GIL_KDF)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_07");	//N�dzna namiastko maga, nigdy nie sprostasz boskiej mocy mego Pana i Mistrza!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_08");	//A wi�c wybra�e� �cie�k� magii, by nas pokona�? Sprytny ruch, ale nawet to ci� teraz nie uratuje.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_09");	//Nawet jako mag nie zdo�asz nas zniszczy�.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_10");	//M�j Pan pozbawi ci� �ycia. Twoje kuglarskie sztuczki w niczym ci nie pomog�.
		};
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_11");	//Poddaj si�, p�ki jeszcze mo�esz. St�d nie ma ucieczki.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_12");	//Teraz poznasz prawdziw� moc mego Pana. Nic ci� ju� nie uratuje!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_13");	//M�j Pan domaga si� twojej g�owy. Nie ma ju� dla ciebie ratunku.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_14");	//Wpad�e� w nasze sid�a. Po�egnaj si� z �yciem.
		};
	};
};

func void b_assigndementortalk(var C_NPC slf)
{
	if((slf.guild == GIL_DMT) && (slf.npctype == NPCTYPE_AMBIENT))
	{
		dia_ambientdementor_exit.npc = Hlp_GetInstanceID(slf);
		dia_ambientdementor.npc = Hlp_GetInstanceID(slf);
	};
};

