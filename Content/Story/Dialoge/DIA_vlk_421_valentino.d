
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
	description = "No proszê, co my tu mamy?";
};


func int dia_valentino_hallo_condition()
{
	return TRUE;
};

func void dia_valentino_hallo_info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//No proszê, co my tu mamy?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//Nazywam siê Valentino. Staram siê nie splamiæ prac¹ kolejnego dnia ofiarowanego mi przez Innosa.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//Uwa¿aj na s³owa.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//Wybacz, Panie, nie mia³em nic z³ego na myœli.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//Czy nikt nie nauczy³ ciê manier? To oburzaj¹ce!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//Ci¹gle tylko ta paplanina. Nie powinieneœ byæ teraz w pracy?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//Ale, z drugiej strony, któ¿by têskni³ za takim œmieciem, co?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//Gdybyœ mia³ tyle z³ota co ja, te¿ nie musia³byœ pracowaæ. Ty jednak nigdy nie bêdziesz tak bogaty.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//Widzê, ¿e czeka mnie z tob¹ du¿o dobrej zabawy.
	};
};


instance DIA_VALENTINO_WHOAGAIN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 2;
	condition = dia_valentino_whoagain_condition;
	information = dia_valentino_whoagain_info;
	permanent = FALSE;
	description = "Pyta³em, kim jesteœ!";
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
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//Pyta³em, kim jesteœ!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//Jestem Valentino Przystojniak. Lekkoduch i bawidamek.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//Te wszystkie beztroskie, bogate kobiety wrêcz siê na mnie rzucaj¹.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//Swoje k³opoty zachowaj dla siebie, mnie one nie interesuj¹.
};


instance DIA_VALENTINO_MANIEREN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 3;
	condition = dia_valentino_manieren_condition;
	information = dia_valentino_manieren_info;
	permanent = FALSE;
	description = "Wygl¹da na to, ¿e to ciebie nale¿a³oby nauczyæ dobrych manier!";
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
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//Wygl¹da na to, ¿e to ciebie nale¿a³oby nauczyæ dobrych manier!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//Nic mnie to nie obchodzi! Mo¿esz mi nawet daæ w pysk, jutro wstanê œwie¿y jak skowronek.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//Ty zaœ bêdziesz siê w³óczy³ z t¹ szpetn¹ gêb¹ po kres swych dni.
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
	description = "Masz jeszcze coœ ciekawego do powiedzenia?";
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
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//Masz mo¿e jeszcze coœ ciekawego do powiedzenia?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if((VALENTINO_LO_PERM == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//Dbaj o popularnoœæ, nigdy nic nikomu nie obiecuj, bierz, co daj¹ i uwa¿aj, by nie popaœæ w konflikt ze stra¿¹.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//No... i z zazdrosnymi mê¿ami. Ci s¹ najgorsi, mówiê ci.
		VALENTINO_LO_PERM = TRUE;
	}
	else if((VALENTINO_HI_PERM == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//W przypadku kogoœ takiego jak ty, mo¿liwoœci s¹ nieograniczone. Musisz umieæ rozpoznaæ sytuacjê i wiedzieæ, kiedy zacz¹æ dzia³aæ.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//Nie marnuj wiêc mojego czasu, bierz siê do roboty!
		VALENTINO_HI_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//Powiedzia³em ci ju¿ wszystko, co powinieneœ wiedzieæ - reszta nale¿y do ciebie.
	};
};


instance DIA_VALENTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 900;
	condition = dia_valentino_pickpocket_condition;
	information = dia_valentino_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie doœæ ³atwa)";
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

