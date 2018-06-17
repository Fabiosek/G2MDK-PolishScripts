
instance DIA_PAL_205_TORWACHE_EXIT(C_INFO)
{
	npc = pal_205_torwache;
	nr = 999;
	condition = dia_pal_205_torwache_exit_condition;
	information = dia_pal_205_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_205_torwache_exit_condition()
{
	return TRUE;
};

func void dia_pal_205_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string PAL_205_CHECKPOINT = "NW_CITY_CITYHALL_IN";

var int pal_205_schonmalreingelassen;

instance DIA_PAL_205_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = pal_205_torwache;
	nr = 1;
	condition = dia_pal_205_torwache_firstwarn_condition;
	information = dia_pal_205_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_205_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,PAL_205_CHECKPOINT) <= 550)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (PAL_205_SCHONMALREINGELASSEN == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(PAL_205_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_firstwarn_info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_00");	//ST�J!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_01");	//Sprzeniewierzy�bym si� swoim zasadom, gdybym wpu�ci� morderc�.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_02");	//Jeste� oskar�ony o kradzie�. Dop�ki nie oczy�cisz si� z zarzut�w, nie wpuszcz� ci� do �rodka.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_03");	//Twoje zami�owanie do awantur jest powszechnie znane. Nie wpuszcz� ci� do �rodka.
		};
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_04");	//Udaj si� do Lorda Andre i wyja�nij spraw�.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_05");	//Tylko osoby w s�u�bie u Kr�la mog� wej�� do ratusza.
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_205_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};


instance DIA_PAL_205_TORWACHE_SECONDWARN(C_INFO)
{
	npc = pal_205_torwache;
	nr = 2;
	condition = dia_pal_205_torwache_secondwarn_condition;
	information = dia_pal_205_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_205_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_SecondWarn_12_00");	//Jeszcze jeden krok, a kln� si� na Innosa, �e oberwiesz.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_205_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_ATTACK(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_attack_condition;
	information = dia_pal_205_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_205_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_PAL_205_TORWACHE_HAGEN(C_INFO)
{
	npc = pal_205_torwache;
	nr = 2;
	condition = dia_pal_205_torwache_hagen_condition;
	information = dia_pal_205_torwache_hagen_info;
	permanent = TRUE;
	description = "Musz� porozmawia� z Lordem Hagenem!";
};


func int dia_pal_205_torwache_hagen_condition()
{
	if(PAL_205_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_hagen_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_Hagen_15_00");	//Musz� porozmawia� z Lordem Hagenem!
	AI_Output(self,other,"DIA_PAL_205_Torwache_Hagen_12_01");	//Czy wiesz, ile razy dziennie s�ysz� te s�owa? Nie mo�esz wej��. Je�li spr�bujesz, b�d� musia� ci� zabi�.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASMIL(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passasmil_condition;
	information = dia_pal_205_torwache_passasmil_info;
	permanent = TRUE;
	description = "Nale�� do stra�y miejskiej.";
};


func int dia_pal_205_torwache_passasmil_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_MIL) && (PAL_205_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passasmil_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMil_15_00");	//Nale�� do stra�y miejskiej.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//W porz�dku, mo�esz wej��.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASMAGE(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passasmage_condition;
	information = dia_pal_205_torwache_passasmage_info;
	permanent = TRUE;
	description = "Jestem Magiem Ognia.";
};


func int dia_pal_205_torwache_passasmage_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_KDF) && (PAL_205_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passasmage_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMage_15_00");	//Jestem Magiem Ognia.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMage_12_01");	//Tak, oczywi�cie. Wybacz mi, Wybra�cze, wykonuj� tylko polecenia.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASSLD(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passassld_condition;
	information = dia_pal_205_torwache_passassld_info;
	permanent = TRUE;
	description = "Przepu�� mnie, przynosz� wie�ci od najemnik�w.";
};


func int dia_pal_205_torwache_passassld_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_SLD) && (PAL_205_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passassld_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsSld_15_00");	//Przepu�� mnie, przynosz� wie�ci od najemnik�w.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsSld_12_01");	//Dobrze, ale ostrzegam ci�. Je�li b�dziesz sprawia� k�opoty, nie zd��ysz tego nawet po�a�owa�.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PERM(C_INFO)
{
	npc = pal_205_torwache;
	nr = 2;
	condition = dia_pal_205_torwache_perm_condition;
	information = dia_pal_205_torwache_perm_info;
	permanent = TRUE;
	description = "Jak tam na s�u�bie?";
};


func int dia_pal_205_torwache_perm_condition()
{
	if((PAL_205_SCHONMALREINGELASSEN == TRUE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_perm_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PERM_15_00");	//Jak tam na s�u�bie?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_01");	//Wszystko pod kontrol�.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_02");	//Jestem zadowolony ze swojej pracy, Wybra�cze.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_03");	//Zamknij si� i wchod�.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_04");	//Czego chcesz?
	};
	AI_StopProcessInfos(self);
};

