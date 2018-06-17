
instance DIA_VALENTINO_EXIT(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 999;
	condition = dia_valentino_exit_condition;
	information = dia_valentino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_valentino_exit_condition()
{
	return TRUE;
};

func void dia_valentino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VALENTINO_HALLO(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 1;
	condition = dia_valentino_hallo_condition;
	information = dia_valentino_hallo_info;
	permanent = FALSE;
	description = "No prosz�, co my tu mamy?";
};


func int dia_valentino_hallo_condition()
{
	return TRUE;
};

func void dia_valentino_hallo_info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//No prosz�, co my tu mamy?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//Nazywam si� Valentino. Staram si� nie splami� prac� kolejnego dnia ofiarowanego mi przez Innosa.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//Uwa�aj na s�owa.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//Wybacz, Panie, nie mia�em nic z�ego na my�li.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//Czy nikt nie nauczy� ci� manier? To oburzaj�ce!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//Ci�gle tylko ta paplanina. Nie powiniene� by� teraz w pracy?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//Ale, z drugiej strony, kt�by t�skni� za takim �mieciem, co?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//Gdyby� mia� tyle z�ota co ja, te� nie musia�by� pracowa�. Ty jednak nigdy nie b�dziesz tak bogaty.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//Widz�, �e czeka mnie z tob� du�o dobrej zabawy.
	};
};


instance DIA_VALENTINO_WHOAGAIN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 2;
	condition = dia_valentino_whoagain_condition;
	information = dia_valentino_whoagain_info;
	permanent = FALSE;
	description = "Pyta�em, kim jeste�!";
};


func int dia_valentino_whoagain_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_valentino_whoagain_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//Pyta�em, kim jeste�!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//Jestem Valentino Przystojniak. Lekkoduch i bawidamek.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//Te wszystkie beztroskie, bogate kobiety wr�cz si� na mnie rzucaj�.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//Swoje k�opoty zachowaj dla siebie, mnie one nie interesuj�.
};


instance DIA_VALENTINO_MANIEREN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 3;
	condition = dia_valentino_manieren_condition;
	information = dia_valentino_manieren_info;
	permanent = FALSE;
	description = "Wygl�da na to, �e to ciebie nale�a�oby nauczy� dobrych manier!";
};


func int dia_valentino_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_valentino_manieren_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//Wygl�da na to, �e to ciebie nale�a�oby nauczy� dobrych manier!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//Nic mnie to nie obchodzi! Mo�esz mi nawet da� w pysk, jutro wstan� �wie�y jak skowronek.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//Ty za� b�dziesz si� w��czy� z t� szpetn� g�b� po kres swych dni.
};


var int valentino_lo_perm;
var int valentino_hi_perm;

instance DIA_VALENTINO_WASNUETZLICHES(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 4;
	condition = dia_valentino_wasnuetzliches_condition;
	information = dia_valentino_wasnuetzliches_info;
	permanent = TRUE;
	description = "Masz jeszcze co� ciekawego do powiedzenia?";
};


func int dia_valentino_wasnuetzliches_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo))
	{
		return TRUE;
	};
};

func void dia_valentino_wasnuetzliches_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//Masz mo�e jeszcze co� ciekawego do powiedzenia?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if((VALENTINO_LO_PERM == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//Dbaj o popularno��, nigdy nic nikomu nie obiecuj, bierz, co daj� i uwa�aj, by nie popa�� w konflikt ze stra��.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//No... i z zazdrosnymi m�ami. Ci s� najgorsi, m�wi� ci.
		VALENTINO_LO_PERM = TRUE;
	}
	else if((VALENTINO_HI_PERM == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//W przypadku kogo� takiego jak ty, mo�liwo�ci s� nieograniczone. Musisz umie� rozpozna� sytuacj� i wiedzie�, kiedy zacz�� dzia�a�.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//Nie marnuj wi�c mojego czasu, bierz si� do roboty!
		VALENTINO_HI_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//Powiedzia�em ci ju� wszystko, co powiniene� wiedzie� - reszta nale�y do ciebie.
	};
};


instance DIA_VALENTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 900;
	condition = dia_valentino_pickpocket_condition;
	information = dia_valentino_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego klucza b�dzie do�� �atwa)";
};


func int dia_valentino_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_valentino) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_valentino_pickpocket_info()
{
	Info_ClearChoices(dia_valentino_pickpocket);
	Info_AddChoice(dia_valentino_pickpocket,DIALOG_BACK,dia_valentino_pickpocket_back);
	Info_AddChoice(dia_valentino_pickpocket,DIALOG_PICKPOCKET,dia_valentino_pickpocket_doit);
};

func void dia_valentino_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_valentino,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_valentino_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_valentino_pickpocket_back()
{
	Info_ClearChoices(dia_valentino_pickpocket);
};

