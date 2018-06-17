
instance DIA_MILTEN_DI_EXIT(C_INFO)
{
	npc = pc_mage_di;
	nr = 999;
	condition = dia_milten_di_exit_condition;
	information = dia_milten_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_milten_di_exit_condition()
{
	return TRUE;
};

func void dia_milten_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTEN_DI_HELLO(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_hello_condition;
	information = dia_milten_di_hello_info;
	description = "Zupe�nie jak za dawnych czas�w.";
};


func int dia_milten_di_hello_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_milten_di_hello_info()
{
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_00");	//Zupe�nie jak za dawnych czas�w.
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_01");	//�wi�te s�owa. Ciekawe, czy i tym razem ci si� uda...
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_02");	//Co takiego?
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_03");	//Uratowa� sw�j ty�ek, gdy wok� rozp�ta si� prawdziwe piek�o.
};


instance DIA_MILTEN_DI_TRADE(C_INFO)
{
	npc = pc_mage_di;
	nr = 12;
	condition = dia_milten_di_trade_condition;
	information = dia_milten_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Nie masz paru mikstur na sprzeda�?";
};


func int dia_milten_di_trade_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_milten_di_hello))
	{
		return TRUE;
	};
};

func void dia_milten_di_trade_info()
{
	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//Nie masz paru mikstur na sprzeda�?
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itpo_health_02,Npc_HasItems(self,itpo_health_02));
	CreateInvItems(self,itpo_health_02,15);
	Npc_RemoveInvItems(self,itpo_mana_02,Npc_HasItems(self,itpo_mana_02));
	CreateInvItems(self,itpo_mana_02,15);
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//Troch� zapas�w jeszcze mi zosta�o.
};


instance DIA_MILTEN_DI_RAT(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_rat_condition;
	information = dia_milten_di_rat_info;
	description = "Masz dla mnie jakie� rady?";
};


func int dia_milten_di_rat_condition()
{
	if(Npc_KnowsInfo(other,dia_milten_di_hello) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_milten_di_rat_info()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_15_00");	//Masz dla mnie jakie� rady?
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_01");	//Hmmm... To mi�o, �e pytasz o rad� w�a�nie mnie. Przyznam, �e jedna rzecz nie daje mi od pewnego czasu spokoju.
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_02");	//Masz ze sob� Oko Innosa?
	Info_ClearChoices(dia_milten_di_rat);
	if(SC_INNOSEYEVERGESSEN_DI == TRUE)
	{
		Info_AddChoice(dia_milten_di_rat,"Nie.",dia_milten_di_rat_nein);
	}
	else
	{
		Info_AddChoice(dia_milten_di_rat,"Oczywi�cie.",dia_milten_di_rat_ja);
	};
};

func void dia_milten_di_rat_nein()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_nein_15_00");	//Nie.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_01");	//Jak mo�na by� tak... A co zamierzasz zrobi�, gdy natkniesz si� na jakiego� smoka?
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_02");	//Widz�, �e nie zm�drza�e� od naszego ostatniego spotkania. Mamy tutaj nawet pracowni� alchemiczn�, w kt�rej mo�na by nape�ni� amulet energi�!
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_03");	//Co ty sobie wyobra�asz?! Ech, mam nadziej�, �e twoja g�upota nie b�dzie nas zbyt drogo kosztowa�.
	Info_ClearChoices(dia_milten_di_rat);
};

func void dia_milten_di_rat_ja()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_ja_15_00");	//Oczywi�cie, �e tak!
	AI_Output(self,other,"DIA_Milten_DI_Rat_ja_03_01");	//Wybacz, g�upie pytanie. Robi� si� troch� nerwowy.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_milten_di_rat);
};


instance DIA_MILTEN_DI_PEDROTOT(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_pedrotot_condition;
	information = dia_milten_di_pedrotot_info;
	description = "Spotka�em Pedra.";
};


func int dia_milten_di_pedrotot_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you))
	{
		return TRUE;
	};
};

func void dia_milten_di_pedrotot_info()
{
	AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_00");	//Spotka�em Pedra.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_01");	//Co?! Gdzie?! Tu, na wyspie? Niech go szlag. Ten cz�owiek jest niesamowity.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_02");	//Nie przypuszcza�em, �e taka z niego twarda sztuka.
	b_giveplayerxp(XP_AMBIENT);
	if(Npc_IsDead(pedro_di))
	{
		AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_03");	//Ju� nie �yje.
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_04");	//Tak? Trudno, pok�j jego duszy. Nie powiem, �eby mi go brakowa�o, ale ch�tnie zamieni�bym z nim s�owo.
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_05");	//Mam z nim niewyr�wnane rachunki.
	};
};


instance DIA_MILTEN_DI_TEACHMAGIC(C_INFO)
{
	npc = pc_mage_di;
	nr = 31;
	condition = dia_milten_di_teachmagic_condition;
	information = dia_milten_di_teachmagic_info;
	permanent = TRUE;
	description = "Chc� popracowa� nad moimi zdolno�ciami magicznymi.";
};


func int dia_milten_di_teachmagic_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_milten_di_hello))
	{
		return TRUE;
	};
};


var int dia_milten_di_teachmagic_onetime;

func void dia_milten_di_teachmagic_info()
{
	AI_Output(other,self,"DIA_Milten_DI_TeachMagic_15_00");	//Chc� popracowa� nad moimi zdolno�ciami magicznymi.
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_01");	//Zrobi�, co w mojej mocy.
	}
	else if(DIA_MILTEN_DI_TEACHMAGIC_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_02");	//Pomog� ci, ale pod jednym warunkiem: postarasz si�, �eby orkowie zostali tam, gdzie s�.
		DIA_MILTEN_DI_TEACHMAGIC_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_03");	//W porz�dku. Czego potrzebujesz?
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_milten_di_teachmagic_mana_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Tworzenie run",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_mana_1()
{
	if(b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_HIGH))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//Niech Innos wskazuje ci w�a�ciw� drog�.
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_milten_di_teachmagic_mana_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Tworzenie run",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_mana_5()
{
	if(b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_HIGH))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//Niech �wiat�o Innosa roz�wietla tw� drog�.
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_milten_di_teachmagic_mana_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Tworzenie run",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_runes()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//Nie jest to moja specjalno��, ale jako� sobie poradzimy.
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Runy paladyna",dia_milten_di_teachmagic_runen_paladin);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_milten_di_teachmagic," czwarty kr�g",dia_milten_di_teachmagic_runen_circle_4);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_milten_di_teachmagic," pi�ty kr�g",dia_milten_di_teachmagic_runen_circle_5);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
	{
		Info_AddChoice(dia_milten_di_teachmagic," sz�sty kr�g",dia_milten_di_teachmagic_runen_circle_6);
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01");	//Nie jeste� jeszcze got�w. Musisz pozna� wy�sze kr�gi. Dopiero potem b�d� m�g� ci pom�c.
	};
};

func void dia_milten_di_teachmagic_runen_paladin()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHT] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("�wiat�o",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALLIGHT)),dia_milten_di_teachmagic_runen_paladin_spl_pallight);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("Pomniejsze uleczenie",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALLIGHTHEAL)),dia_milten_di_teachmagic_runen_paladin_spl_pallightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("�wi�ty pocisk",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALHOLYBOLT)),dia_milten_di_teachmagic_runen_paladin_spl_palholybolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("�rednie uleczenie",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALMEDIUMHEAL)),dia_milten_di_teachmagic_runen_paladin_spl_palmediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("Szkodzenie z�u",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALREPELEVIL)),dia_milten_di_teachmagic_runen_paladin_spl_palrepelevil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALFULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("Wi�ksze uleczenie",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALFULLHEAL)),dia_milten_di_teachmagic_runen_paladin_spl_palfullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALDESTROYEVIL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring("Zniszczenie z�a",b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALDESTROYEVIL)),dia_milten_di_teachmagic_runen_paladin_spl_paldestroyevil);
	};
};

func void dia_milten_di_teachmagic_runen_paladin_spl_pallight()
{
	b_teachplayertalentrunes(self,other,SPL_PALLIGHT);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_pallightheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALLIGHTHEAL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palholybolt()
{
	b_teachplayertalentrunes(self,other,SPL_PALHOLYBOLT);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palmediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALMEDIUMHEAL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palrepelevil()
{
	b_teachplayertalentrunes(self,other,SPL_PALREPELEVIL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palfullheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALFULLHEAL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_paldestroyevil()
{
	b_teachplayertalentrunes(self,other,SPL_PALDESTROYEVIL);
};

func void dia_milten_di_teachmagic_runen_circle_4()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),dia_milten_di_teachmagic_runen_circle_4_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),dia_milten_di_teachmagic_runen_circle_4_spl_destroyundead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTNINGFLASH)),dia_milten_di_teachmagic_runen_circle_4_spl_lightningflash);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),dia_milten_di_teachmagic_runen_circle_4_spl_chargefireball);
	};
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_milten_di_teachmagic_runen_circle_5()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEWAVE)),dia_milten_di_teachmagic_runen_circle_5_spl_icewave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),dia_milten_di_teachmagic_runen_circle_5_spl_summondemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),dia_milten_di_teachmagic_runen_circle_5_spl_fullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),dia_milten_di_teachmagic_runen_circle_5_spl_pyrokinesis);
	};
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};

func void dia_milten_di_teachmagic_runen_circle_6()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_milten_di_teachmagic_runen_circle_6_spl_firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_BREATHOFDEATH)),dia_milten_di_teachmagic_runen_circle_6_spl_breathofdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MASSDEATH)),dia_milten_di_teachmagic_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),dia_milten_di_teachmagic_runen_circle_6_spl_armyofdarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SHRINK)),dia_milten_di_teachmagic_runen_circle_6_spl_shrink);
	};
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};

func void dia_milten_di_teachmagic_back()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
};


instance DIA_MILTEN_DI_DEMENTOROBSESSIONBOOK(C_INFO)
{
	npc = pc_mage_di;
	nr = 99;
	condition = dia_milten_di_dementorobsessionbook_condition;
	information = dia_milten_di_dementorobsessionbook_info;
	description = "Co mo�esz mi powiedzie� na temat tego almanachu op�tanych?";
};


func int dia_milten_di_dementorobsessionbook_condition()
{
	if(Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};

func void dia_milten_di_dementorobsessionbook_info()
{
	AI_Output(other,self,"DIA_Milten_DI_DementorObsessionBook_15_00");	//Co mo�esz mi powiedzie� na temat tego almanachu op�tanych?
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_01");	//W takich sprawach ekspertem jest Pyrokar.
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_02");	//Przykro mi, ale zbyt ma�o wiem na ten temat.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MILTEN_DI_DRAGONEGG(C_INFO)
{
	npc = pc_mage_di;
	nr = 99;
	condition = dia_milten_di_dragonegg_condition;
	information = dia_milten_di_dragonegg_info;
	description = "Co mo�esz mi powiedzie� o smoczych jajach?";
};


func int dia_milten_di_dragonegg_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_milten_di_dragonegg_info()
{
	AI_Output(other,self,"DIA_Milten_DI_DragonEgg_15_00");	//Co mo�esz mi powiedzie� o smoczych jajach?
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_01");	//Niewiele. S�ysza�em, �e pewnemu alchemikowi uda�o si� pozyska� z nich pot�n� mikstur�.
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_02");	//Ale nie znam szczeg��w ani - tym bardziej - receptury.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MILTEN_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_mage_di;
	nr = 31;
	condition = dia_milten_di_undeaddragondead_condition;
	information = dia_milten_di_undeaddragondead_info;
	permanent = TRUE;
	description = "To ju� koniec.";
};


func int dia_milten_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_milten_di_undeaddragondead_onetime;

func void dia_milten_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_00");	//�wietnie! �wi�tynia straci�a teraz swoj� moc!
	if(DIA_MILTEN_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_01");	//Powiesz mi, jak ty to robisz?
		AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_02");	//Cholera, sam nie wiem!
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_03");	//Czy my nigdy nie zaznamy spokoju? Innos �wiadkiem - zas�u�yli�my na odpoczynek.
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_04");	//Co zamierzasz teraz robi�?
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_05");	//Zastanawia�em si� nad za�o�eniem w�asnej akademii, w kt�rej naucza�bym naszej wiary. Ale kto wie, co przyniesie przysz�o��?
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_06");	//Nigdy nie �a�owa�em, �e zosta�em Magiem Ognia. A ty?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_07");	//Nie jestem taki pewien.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_08");	//Pow�ci�gliwy jak zwykle. Uratowa�e� �wiat od niechybnej zguby! To chyba jest jaki� pow�d do rado�ci?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_09");	//Hmmm... Mo�e.
		};
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_10");	//A niech ci�, marudo. My�l�, �e na pocz�tek przyda ci si� troch� snu.
		DIA_MILTEN_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_11");	//Id� do kapitana i ka� mu podnosi� kotwic�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_MAGE_DI_PICKPOCKET(C_INFO)
{
	npc = pc_mage_di;
	nr = 900;
	condition = dia_mage_di_pickpocket_condition;
	information = dia_mage_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_di_pickpocket_condition()
{
	return c_beklauen(45,120);
};

func void dia_mage_di_pickpocket_info()
{
	Info_ClearChoices(dia_mage_di_pickpocket);
	Info_AddChoice(dia_mage_di_pickpocket,DIALOG_BACK,dia_mage_di_pickpocket_back);
	Info_AddChoice(dia_mage_di_pickpocket,DIALOG_PICKPOCKET,dia_mage_di_pickpocket_doit);
};

func void dia_mage_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_di_pickpocket);
};

func void dia_mage_di_pickpocket_back()
{
	Info_ClearChoices(dia_mage_di_pickpocket);
};

