
instance DIA_PECK_EXIT(C_INFO)
{
	npc = mil_324_peck;
	nr = 999;
	condition = dia_peck_exit_condition;
	information = dia_peck_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_peck_exit_condition()
{
	return TRUE;
};

func void dia_peck_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PECK_PICKPOCKET(C_INFO)
{
	npc = mil_324_peck;
	nr = 900;
	condition = dia_peck_pickpocket_condition;
	information = dia_peck_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie doœæ ryzykownym zadaniem)";
};


func int dia_peck_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_05) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_peck_pickpocket_info()
{
	Info_ClearChoices(dia_peck_pickpocket);
	Info_AddChoice(dia_peck_pickpocket,DIALOG_BACK,dia_peck_pickpocket_back);
	Info_AddChoice(dia_peck_pickpocket,DIALOG_PICKPOCKET,dia_peck_pickpocket_doit);
};

func void dia_peck_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itke_city_tower_05,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_peck_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_peck_pickpocket_back()
{
	Info_ClearChoices(dia_peck_pickpocket);
};


instance DIA_PECK_HEY(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_hey_condition;
	information = dia_peck_hey_info;
	permanent = TRUE;
	description = "Hej, co s³ychaæ?";
};


func int dia_peck_hey_condition()
{
	if((MIS_ANDRE_PECK != LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void dia_peck_hey_info()
{
	AI_Output(other,self,"DIA_Peck_HEY_15_00");	//Hej, co s³ychaæ?
	AI_Output(self,other,"DIA_Peck_HEY_12_01");	//Cz³owieku, jestem zajêty. Zostaw mnie w spokoju.
	AI_StopProcessInfos(self);
};


instance DIA_PECK_FOUND_PECK(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_found_peck_condition;
	information = dia_peck_found_peck_info;
	permanent = FALSE;
	description = "Hej, czas ju¿ ruszaæ w drogê.";
};


func int dia_peck_found_peck_condition()
{
	if((MIS_ANDRE_PECK == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void dia_peck_found_peck_info()
{
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_00");	//Hej, czas ju¿ ruszaæ w drogê.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_01");	//Czego chcesz? Nie widzisz, ¿e jestem zajêty?
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_02");	//Potrzebujê broni, wracaj wiêc do koszar.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_03");	//Do cholery, twoja broñ mo¿e poczekaæ.
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_04");	//No dalej, Andre ju¿ siê za tob¹ stêskni³.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_05");	//Hmmm... cholera. W porz¹dku, ju¿ idê - ale kiedy zameldujesz siê u Andre, nie wspominaj, ¿e mnie tu widzia³eœ.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STORAGE");
	Npc_ExchangeRoutine(vanja,"ALONE");
};


instance DIA_PECK_WEAPON(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_weapon_condition;
	information = dia_peck_weapon_info;
	permanent = TRUE;
	description = "Potrzebujê broni.";
};


var int dia_peck_weapon_perm;

func int dia_peck_weapon_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_found_peck) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (KAPITEL < 3) && (DIA_PECK_WEAPON_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_peck_weapon_info()
{
	AI_Output(other,self,"DIA_Peck_WEAPON_15_00");	//Potrzebujê broni.
	if(MIS_ANDRE_PECK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//Najpierw zamelduj siê u Andre.
	}
	else
	{
		if(MIS_ANDRE_PECK == LOG_OBSOLETE)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_02");	//Kogó¿ my tu mamy. To nasz nowy towarzysz. I szuka sobie miecza.
			AI_Output(self,other,"DIA_Peck_WEAPON_12_03");	//Nie powiedzia³eœ Andre, ¿e by³em w Czerwonej Latarni. Jesteœ w porz¹dku. Proszê, weŸ swój miecz.
			AI_Output(self,other,"DIA_Peck_Add_12_00");	//To najlepszy, jaki mam.
			b_giveinvitems(self,hero,itmw_schwert1,1);
		}
		else if(MIS_ANDRE_PECK == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_04");	//Pamiêtam ciê dok³adnie. Kto doniós³ Andre, ¿e by³em w Czerwonej Latarni, co?
			AI_Output(self,other,"DIA_Peck_WEAPON_12_05");	//A teraz chcesz jeszcze ode mnie miecz... dobra, dostaniesz go. Proszê, a teraz zejdŸ mi z oczu.
			b_giveinvitems(self,hero,itmw_1h_misc_sword,1);
		};
		DIA_PECK_WEAPON_PERM = TRUE;
		AI_Output(self,other,"DIA_Peck_WEAPON_12_06");	//Jeœli ta broñ ci nie odpowiada, idŸ do kupców na placu targowym.
	};
	AI_StopProcessInfos(self);
};

func void b_peck_leckmich()
{
	AI_Output(self,other,"DIA_Peck_Add_12_07");	//Poca³uj mnie w ty³ek!
};


instance DIA_PECK_WEAPON2(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_weapon2_condition;
	information = dia_peck_weapon2_info;
	permanent = TRUE;
	description = "Masz dla mnie jak¹œ lepsz¹ broñ?";
};


var int dia_peck_weapon2_perm;

func int dia_peck_weapon2_condition()
{
	if((other.guild == GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (ENTEROW_KAPITEL2 == TRUE) && (DIA_PECK_WEAPON_PERM == TRUE) && (DIA_PECK_WEAPON2_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_peck_weapon2_info()
{
	AI_Output(self,other,"DIA_Peck_Add_15_01");	//Masz dla mnie jak¹œ lepsz¹ broñ?
	if(MIS_ANDRE_PECK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_06");	//Nie zapomnia³em o tym, ¿e donios³eœ na mnie Lordowi Andre.
		b_peck_leckmich();
	}
	else if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//W tej chwili nie...
	}
	else
	{
		AI_Output(self,other,"DIA_Peck_Add_12_03");	//Dobrze, ¿e pytasz. Tak siê sk³ada, ¿e mamy tu kilka niez³ych ostrzy po najemnikach Onara.
		AI_Output(self,other,"DIA_Peck_Add_12_04");	//Im ju¿ siê nie przydadz¹.
		AI_Output(self,other,"DIA_Peck_Add_12_05");	//Proszê, bierz.
		b_giveinvitems(self,other,itmw_rubinklinge,1);
		DIA_PECK_WEAPON2_PERM = TRUE;
	};
};


instance DIA_PECK_PERM(C_INFO)
{
	npc = mil_324_peck;
	nr = 998;
	condition = dia_peck_perm_condition;
	information = dia_peck_perm_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_peck_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_peck_weapon) || ((other.guild != GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_peck_perm_info()
{
	AI_Output(other,self,"DIA_Peck_PERM_15_00");	//Wszystko gra?
	if(MIS_ANDRE_PECK == LOG_SUCCESS)
	{
		b_peck_leckmich();
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Peck_PERM_12_01");	//Taa, a u ciebie?
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_02");	//Nie do koñca. Martwi¹ mnie najemnicy, a szczególnie pog³oska, ¿e chc¹ odbiæ swojego z wiêzienia.
				AI_Output(self,other,"DIA_Peck_PERM_12_03");	//Nie mam zamiaru przeciwstawiaæ siê grupie doœwiadczonych wojowników.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_04");	//Oczywiœcie. Mamy oczy szeroko otwarte. Magowie mog¹ spaæ spokojnie, wiêzieñ nie ma najmniejszej szansy ucieczki.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_05");	//Wiem, co planujesz, ale nie uda ci siê odbiæ wiêŸnia.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Peck_PERM_12_06");	//Cieszê siê, ¿e sprawa morderstwa zosta³a wyjaœniona.
			AI_Output(other,self,"DIA_Peck_PERM_15_07");	//Dlaczego?
			AI_Output(self,other,"DIA_Peck_PERM_12_08");	//Nie myœlisz chyba, ¿e najemnicy patrzyliby bezczynnie na to, jak wieszamy jednego z nich.
			AI_Output(self,other,"DIA_Peck_PERM_12_09");	//W najgorszym wypadku mogliby nas zaatakowaæ. Nie chcê nawet myœleæ, co by siê wtedy dzia³o.
		};
	};
};

