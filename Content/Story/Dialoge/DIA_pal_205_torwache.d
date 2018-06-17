
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
	AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_00");	//STÓJ!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_01");	//Sprzeniewierzy³bym siê swoim zasadom, gdybym wpuœci³ mordercê.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_02");	//Jesteœ oskar¿ony o kradzie¿. Dopóki nie oczyœcisz siê z zarzutów, nie wpuszczê ciê do œrodka.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_03");	//Twoje zami³owanie do awantur jest powszechnie znane. Nie wpuszczê ciê do œrodka.
		};
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_04");	//Udaj siê do Lorda Andre i wyjaœnij sprawê.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_05");	//Tylko osoby w s³u¿bie u Króla mog¹ wejœæ do ratusza.
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
	AI_Output(self,other,"DIA_PAL_205_Torwache_SecondWarn_12_00");	//Jeszcze jeden krok, a klnê siê na Innosa, ¿e oberwiesz.
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
	description = "Muszê porozmawiaæ z Lordem Hagenem!";
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
	AI_Output(other,self,"DIA_PAL_205_Torwache_Hagen_15_00");	//Muszê porozmawiaæ z Lordem Hagenem!
	AI_Output(self,other,"DIA_PAL_205_Torwache_Hagen_12_01");	//Czy wiesz, ile razy dziennie s³yszê te s³owa? Nie mo¿esz wejœæ. Jeœli spróbujesz, bêdê musia³ ciê zabiæ.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASMIL(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passasmil_condition;
	information = dia_pal_205_torwache_passasmil_info;
	permanent = TRUE;
	description = "Nale¿ê do stra¿y miejskiej.";
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
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMil_15_00");	//Nale¿ê do stra¿y miejskiej.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//W porz¹dku, mo¿esz wejœæ.
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
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMage_12_01");	//Tak, oczywiœcie. Wybacz mi, Wybrañcze, wykonujê tylko polecenia.
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
	description = "Przepuœæ mnie, przynoszê wieœci od najemników.";
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
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsSld_15_00");	//Przepuœæ mnie, przynoszê wieœci od najemników.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsSld_12_01");	//Dobrze, ale ostrzegam ciê. Jeœli bêdziesz sprawia³ k³opoty, nie zd¹¿ysz tego nawet po¿a³owaæ.
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
	description = "Jak tam na s³u¿bie?";
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
	AI_Output(other,self,"DIA_PAL_205_Torwache_PERM_15_00");	//Jak tam na s³u¿bie?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_01");	//Wszystko pod kontrol¹.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_02");	//Jestem zadowolony ze swojej pracy, Wybrañcze.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_03");	//Zamknij siê i wchodŸ.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_04");	//Czego chcesz?
	};
	AI_StopProcessInfos(self);
};

