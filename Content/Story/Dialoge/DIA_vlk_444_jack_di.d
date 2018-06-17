
instance DIA_JACK_DI_EXIT(C_INFO)
{
	npc = vlk_444_jack_di;
	nr = 999;
	condition = dia_jack_di_exit_condition;
	information = dia_jack_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_di_exit_condition()
{
	return TRUE;
};

func void dia_jack_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_DI_GREET(C_INFO)
{
	npc = vlk_444_jack_di;
	nr = 4;
	condition = dia_jack_di_greet_condition;
	information = dia_jack_di_greet_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_jack_di_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};


var int dia_jack_di_greet_onetime;

func void dia_jack_di_greet_info()
{
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_00");	//Mam nadziej�, �e wiesz, co robisz, ch�opcze.
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_01");	//To nie potrwa d�ugo.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_02");	//Miej g�ow� na karku i wracaj ca�y, i zdrowy.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(DIA_JACK_DI_GREET_ONETIME == FALSE)
		{
			AI_Output(other,self,"DIA_Jack_DI_GREET_15_03");	//Co tu robisz?
			b_giveplayerxp(XP_AMBIENT);
			DIA_JACK_DI_GREET_ONETIME = TRUE;
		};
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_04");	//Je�li znowu rozp�ta si� tu takie piek�o, wyprowadz� st�d statek. Z tob� czy bez ciebie! Jasne?
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_05");	//Spokojnie. Poradz� sobie.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_06");	//No to lepiej si� po�piesz.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_JACK_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_444_jack_di;
	nr = 4;
	condition = dia_jack_di_undeaddragondead_condition;
	information = dia_jack_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Zrobione! Wr�g pokonany.";
};


func int dia_jack_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_jack_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_15_00");	//Zrobione! Wr�g pokonany.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_01");	//Mia�em nadziej�, �e wszystko jako� si� u�o�y, ale przez ostatnie par� godzin troch� w to zw�tpi�em.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_02");	//Mo�emy wreszcie rusza� w drog�?
	Info_ClearChoices(dia_jack_di_undeaddragondead);
	Info_AddChoice(dia_jack_di_undeaddragondead,"Chwileczk�...",dia_jack_di_undeaddragondead_moment);
	Info_AddChoice(dia_jack_di_undeaddragondead,"Tak. Sko�czmy to wreszcie.",dia_jack_di_undeaddragondead_over);
};

func void dia_jack_di_undeaddragondead_moment()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_moment_15_00");	//Jeszcze chwila. Musz� najpierw co� za�atwi�.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_moment_14_01");	//Tylko si� po�piesz. Nie chc� tu zapu�ci� korzeni.
	AI_StopProcessInfos(self);
};

func void dia_jack_di_undeaddragondead_over()
{
	AI_StopProcessInfos(self);
	b_extro_avi();
};

