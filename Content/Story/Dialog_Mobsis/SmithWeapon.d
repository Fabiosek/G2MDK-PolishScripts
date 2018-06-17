
var int erzwaffen;
var int normalwaffen;

instance PC_SMITHWEAPON_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_smithweapon_end_condition;
	information = pc_smithweapon_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_smithweapon_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	{
		return TRUE;
	};
};

func void pc_smithweapon_end_info()
{
	CreateInvItems(self,itmiswordraw,1);
	b_endproductiondialog();
	ERZWAFFEN = FALSE;
	NORMALWAFFEN = FALSE;
};


instance PC_COMMON(C_INFO)
{
	npc = pc_hero;
	condition = pc_common_condition;
	information = pc_common_info;
	permanent = TRUE;
	description = "Wykuj zwyk³¹ broñ";
};


func int pc_common_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (NORMALWAFFEN == FALSE) && (ERZWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void pc_common_info()
{
	NORMALWAFFEN = TRUE;
};


instance PC_ORE(C_INFO)
{
	npc = pc_hero;
	condition = pc_ore_condition;
	information = pc_ore_info;
	permanent = TRUE;
	description = "Wykuj broñ z rudy";
};


func int pc_ore_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (NORMALWAFFEN == FALSE) && (ERZWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void pc_ore_info()
{
	ERZWAFFEN = TRUE;
};


instance PC_COMMONBACK(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_commonback_condition;
	information = pc_commonback_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_commonback_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (NORMALWAFFEN == TRUE) && (ERZWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void pc_commonback_info()
{
	NORMALWAFFEN = FALSE;
};


instance PC_OREBACK(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_oreback_condition;
	information = pc_oreback_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_oreback_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (NORMALWAFFEN == FALSE) && (ERZWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_oreback_info()
{
	ERZWAFFEN = FALSE;
};


instance PC_ITMW_1H_COMMON(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_1h_common_condition;
	information = pc_itmw_1h_common_info;
	permanent = TRUE;
};


func int pc_itmw_1h_common_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE) && (NORMALWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_common_info()
{
	CreateInvItems(hero,itmw_1h_common_01,1);
	Print(PRINT_SMITHSUCCESS);
	b_endproductiondialog();
	NORMALWAFFEN = FALSE;
};


instance PC_WEAPON_1H_HARAD_01(C_INFO)
{
	npc = pc_hero;
	condition = pc_weapon_1h_harad_01_condition;
	information = pc_weapon_1h_harad_01_info;
	permanent = TRUE;
};


func int pc_weapon_1h_harad_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] == TRUE) && (NORMALWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_weapon_1h_harad_01_info()
{
	CreateInvItems(hero,itmw_schwert1,1);
	Print(PRINT_SMITHSUCCESS);
	b_endproductiondialog();
	NORMALWAFFEN = FALSE;
};


instance PC_WEAPON_1H_HARAD_02(C_INFO)
{
	npc = pc_hero;
	condition = pc_weapon_1h_harad_02_condition;
	information = pc_weapon_1h_harad_02_info;
	permanent = TRUE;
};


func int pc_weapon_1h_harad_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] == TRUE) && (NORMALWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_weapon_1h_harad_02_info()
{
	CreateInvItems(hero,itmw_schwert4,1);
	Print(PRINT_SMITHSUCCESS);
	b_endproductiondialog();
	NORMALWAFFEN = FALSE;
};


instance PC_WEAPON_1H_HARAD_03(C_INFO)
{
	npc = pc_hero;
	condition = pc_weapon_1h_harad_03_condition;
	information = pc_weapon_1h_harad_03_info;
	permanent = TRUE;
};


func int pc_weapon_1h_harad_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] == TRUE) && (NORMALWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_weapon_1h_harad_03_info()
{
	CreateInvItems(hero,itmw_rubinklinge,1);
	Print(PRINT_SMITHSUCCESS);
	b_endproductiondialog();
	NORMALWAFFEN = FALSE;
};


instance PC_WEAPON_1H_HARAD_04(C_INFO)
{
	npc = pc_hero;
	condition = pc_weapon_1h_harad_04_condition;
	information = pc_weapon_1h_harad_04_info;
	permanent = TRUE;
};


func int pc_weapon_1h_harad_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] == TRUE) && (NORMALWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_weapon_1h_harad_04_info()
{
	CreateInvItems(hero,itmw_elbastardo,1);
	Print(PRINT_SMITHSUCCESS);
	b_endproductiondialog();
	NORMALWAFFEN = FALSE;
};


instance PC_ITMW_1H_SPECIAL_01(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_1h_special_01_condition;
	information = pc_itmw_1h_special_01_info;
	permanent = TRUE;
};


func int pc_itmw_1h_special_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == TRUE) && (ERZWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_special_01_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 1)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,1);
		CreateInvItems(hero,itmw_1h_special_01,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
	ERZWAFFEN = FALSE;
};


instance PC_ITMW_2H_SPECIAL_01(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_2h_special_01_condition;
	information = pc_itmw_2h_special_01_info;
	permanent = TRUE;
};


func int pc_itmw_2h_special_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == TRUE) && (ERZWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_2h_special_01_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 2)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,2);
		CreateInvItems(hero,itmw_2h_special_01,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
	ERZWAFFEN = FALSE;
};


instance PC_ITMW_1H_SPECIAL_02(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_1h_special_02_condition;
	information = pc_itmw_1h_special_02_info;
	permanent = TRUE;
};


func int pc_itmw_1h_special_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == TRUE) && (ERZWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_special_02_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 2)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,2);
		CreateInvItems(hero,itmw_1h_special_02,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
	ERZWAFFEN = FALSE;
};


instance PC_ITMW_2H_SPECIAL_02(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_2h_special_02_condition;
	information = pc_itmw_2h_special_02_info;
	permanent = TRUE;
};


func int pc_itmw_2h_special_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == TRUE) && (ERZWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_2h_special_02_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 3)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,3);
		CreateInvItems(hero,itmw_2h_special_02,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
	ERZWAFFEN = FALSE;
};


instance PC_ITMW_1H_SPECIAL_03(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_1h_special_03_condition;
	information = pc_itmw_1h_special_03_info;
	permanent = TRUE;
};


func int pc_itmw_1h_special_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == TRUE) && (ERZWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_special_03_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 3)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,3);
		CreateInvItems(hero,itmw_1h_special_03,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
	ERZWAFFEN = FALSE;
};


instance PC_ITMW_2H_SPECIAL_03(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_2h_special_03_condition;
	information = pc_itmw_2h_special_03_info;
	permanent = TRUE;
};


func int pc_itmw_2h_special_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == TRUE) && (ERZWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_2h_special_03_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 4)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,4);
		CreateInvItems(hero,itmw_2h_special_03,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
	ERZWAFFEN = FALSE;
};


instance PC_ITMW_1H_SPECIAL_04(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_1h_special_04_condition;
	information = pc_itmw_1h_special_04_info;
	permanent = TRUE;
};


func int pc_itmw_1h_special_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] == TRUE) && (ERZWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_special_04_info()
{
	if((Npc_HasItems(hero,itmi_nugget) >= 4) && (Npc_HasItems(hero,itat_dragonblood) >= 5))
	{
		Npc_RemoveInvItems(hero,itmi_nugget,4);
		Npc_RemoveInvItems(hero,itat_dragonblood,5);
		CreateInvItems(hero,itmw_1h_special_04,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
	ERZWAFFEN = FALSE;
};


instance PC_ITMW_2H_SPECIAL_04(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_2h_special_04_condition;
	information = pc_itmw_2h_special_04_info;
	permanent = TRUE;
};


func int pc_itmw_2h_special_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] == TRUE) && (ERZWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_2h_special_04_info()
{
	if((Npc_HasItems(hero,itmi_nugget) >= 5) && (Npc_HasItems(hero,itat_dragonblood) >= 5))
	{
		Npc_RemoveInvItems(hero,itmi_nugget,5);
		Npc_RemoveInvItems(hero,itat_dragonblood,5);
		CreateInvItems(hero,itmw_2h_special_04,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
	ERZWAFFEN = FALSE;
};

func void smithweapon_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SMITHWEAPON;
		AI_ProcessInfos(her);
	};
	pc_itmw_1h_common.description = NAME_ITMW_1H_COMMON_01;
	pc_itmw_1h_special_01.description = ConcatStrings(NAME_ITMW_1H_SPECIAL_01,PRINT_SMITH_1H_SPECIAL_01);
	pc_itmw_2h_special_01.description = ConcatStrings(NAME_ITMW_2H_SPECIAL_01,PRINT_SMITH_2H_SPECIAL_01);
	pc_itmw_1h_special_02.description = ConcatStrings(NAME_ITMW_1H_SPECIAL_02,PRINT_SMITH_1H_SPECIAL_02);
	pc_itmw_2h_special_02.description = ConcatStrings(NAME_ITMW_2H_SPECIAL_02,PRINT_SMITH_2H_SPECIAL_02);
	pc_itmw_1h_special_03.description = ConcatStrings(NAME_ITMW_1H_SPECIAL_03,PRINT_SMITH_1H_SPECIAL_03);
	pc_itmw_2h_special_03.description = ConcatStrings(NAME_ITMW_2H_SPECIAL_03,PRINT_SMITH_2H_SPECIAL_03);
	pc_itmw_1h_special_04.description = ConcatStrings(NAME_ITMW_1H_SPECIAL_04,PRINT_SMITH_1H_SPECIAL_04);
	pc_itmw_2h_special_04.description = ConcatStrings(NAME_ITMW_2H_SPECIAL_04,PRINT_SMITH_2H_SPECIAL_04);
	pc_weapon_1h_harad_01.description = NAME_ADDON_HARAD_01;
	pc_weapon_1h_harad_02.description = NAME_ADDON_HARAD_02;
	pc_weapon_1h_harad_03.description = NAME_ADDON_HARAD_03;
	pc_weapon_1h_harad_04.description = NAME_ADDON_HARAD_04;
};

