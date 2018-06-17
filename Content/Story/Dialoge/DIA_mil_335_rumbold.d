
instance DIA_RUMBOLD_EXIT(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 999;
	condition = dia_rumbold_exit_condition;
	information = dia_rumbold_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rumbold_exit_condition()
{
	return TRUE;
};

func void dia_rumbold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUMBOLD_PREPERM(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_preperm_condition;
	information = dia_rumbold_preperm_info;
	permanent = TRUE;
	description = "Co tu porabiasz?";
};


func int dia_rumbold_preperm_condition()
{
	if(!Npc_KnowsInfo(other,dia_bengar_milizklatschen))
	{
		return TRUE;
	};
};

func void dia_rumbold_preperm_info()
{
	AI_Output(other,self,"DIA_Rumbold_PrePerm_15_00");	//Co tu robicie?
	AI_Output(self,other,"DIA_Rumbold_PrePerm_10_01");	//Wynoœ siê! Rozumiesz?
	AI_StopProcessInfos(self);
};


instance DIA_RUMBOLD_HALLO(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_hallo_condition;
	information = dia_rumbold_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rumbold_hallo_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_milizklatschen))
	{
		return TRUE;
	};
};

func void dia_rumbold_hallo_info()
{
	AI_Output(self,other,"DIA_Rumbold_Hallo_10_00");	//Spójrz na tego. Co za pokraka. Hej, co ciê tu sprowadza?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_01");	//Kim u diab³a jesteœ?
	}
	else
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_02");	//Nale¿ysz do tych zawszonych najemników!
	};
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"Jestem nikim.",dia_rumbold_hallo_schwanzeinziehen);
	Info_AddChoice(dia_rumbold_hallo,"Znikajcie st¹d, ale ju¿.",dia_rumbold_hallo_verschwindet);
	Info_AddChoice(dia_rumbold_hallo,"Jestem twoim najgorszym koszmarem.",dia_rumbold_hallo_attack);
};

func void dia_rumbold_hallo_attack()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_Attack_15_00");	//Jestem twoim najgorszym koszmarem.
	AI_Output(self,other,"DIA_Rumbold_HALLO_Attack_10_01");	//Raczej trupem!
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,DIALOG_ENDE,dia_rumbold_hallo_endattack);
};

func void dia_rumbold_hallo_verschwindet()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_verschwindet_15_00");	//Znikajcie st¹d, ale ju¿.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_01");	//No, no. Chcesz, byœmy zniknêli.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_02");	//A co jeœli nic z tego, hê?
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"Ile mam zap³aciæ, ¿ebyœcie siê st¹d wynieœli?",dia_rumbold_hallo_geld);
	Info_AddChoice(dia_rumbold_hallo,"Jeœli tak, to ju¿ ostatni raz utrudniacie farmerom ¿ycie.",dia_rumbold_hallo_aufsmaul);
};

func void dia_rumbold_hallo_aufsmaul()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_AufsMaul_15_00");	//Jeœli tak, to ju¿ ostatni raz utrudniacie farmerom ¿ycie.
	AI_Output(self,other,"DIA_Rumbold_HALLO_AufsMaul_10_01");	//Porywasz siê z motyk¹ na s³oñce, pacanie!
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,DIALOG_ENDE,dia_rumbold_hallo_endattack);
};

func void dia_rumbold_hallo_geld()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_15_00");	//Ile mam zap³aciæ, ¿ebyœcie siê st¹d wynieœli?
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_01");	//Chcesz sp³aciæ Bengara? A, to zupe³nie inna sprawa.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_02");	//Niech no pomyœlê. Bengar nigdy nie oszczêdza³, jest winien jeszcze 65 sztuk z³ota.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_03");	//Dawaj kasê, albo spadaj.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_04");	//Jesteœ skarbnikiem Bengara, czy co?
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"Oszala³eœ? To o wiele za du¿o.",dia_rumbold_hallo_geld_toomuch);
	if(Npc_HasItems(other,itmi_gold) >= 65)
	{
		Info_AddChoice(dia_rumbold_hallo,"Oto twoja forsa, a teraz spadaj.",dia_rumbold_hallo_geld_ok);
	};
};

func void dia_rumbold_hallo_geld_ok()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_ok_15_00");	//Oto wasze pieni¹dze, a teraz wynoœcie siê.
	b_giveinvitems(other,self,itmi_gold,65);
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_ok_10_01");	//Nie interesuje mnie, kto p³aci za Bengara. ¯yczê mi³ego dnia. Dureñ!
	AI_StopProcessInfos(self);
	RUMBOLD_BEZAHLT = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
	{
		Npc_ExchangeRoutine(rick,"Start");
		AI_ContinueRoutine(rick);
	};
	if(Hlp_IsValidNpc(bengar) && !Npc_IsDead(bengar))
	{
		Npc_ExchangeRoutine(bengar,"Start");
		AI_ContinueRoutine(bengar);
	};
};

func void dia_rumbold_hallo_geld_toomuch()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_TooMuch_15_00");	//Oszala³eœ? To o wiele za du¿o.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_TooMuch_10_01");	//W takim razie... spadaj!
	AI_StopProcessInfos(self);
};

func void dia_rumbold_hallo_schwanzeinziehen()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_schwanzeinziehen_15_00");	//Jestem nikim.
	AI_Output(self,other,"DIA_Rumbold_HALLO_schwanzeinziehen_10_01");	//W takim razie... zejdŸ mi z oczu!
	AI_StopProcessInfos(self);
};

func void dia_rumbold_hallo_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_FIGHTNOW(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_fightnow_condition;
	information = dia_rumbold_fightnow_info;
	permanent = TRUE;
	description = "Zostawcie farmera w spokoju!";
};


func int dia_rumbold_fightnow_condition()
{
	if(Npc_KnowsInfo(other,dia_rumbold_hallo) && (RUMBOLD_BEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_rumbold_fightnow_info()
{
	AI_Output(other,self,"DIA_Rumbold_FightNow_15_00");	//Zostawcie farmera w spokoju!
	AI_Output(self,other,"DIA_Rumbold_FightNow_10_01");	//Koleœ, masz jakieœ problemy ze s³uchem?
	Info_ClearChoices(dia_rumbold_fightnow);
	Info_AddChoice(dia_rumbold_fightnow,DIALOG_ENDE,dia_rumbold_fightnow_endattack);
};

func void dia_rumbold_fightnow_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_STILLTHERE(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_stillthere_condition;
	information = dia_rumbold_stillthere_info;
	permanent = TRUE;
	description = "Hej, ci¹gle tutaj?";
};


func int dia_rumbold_stillthere_condition()
{
	if(Npc_KnowsInfo(other,dia_rumbold_hallo) && (RUMBOLD_BEZAHLT == TRUE))
	{
		return TRUE;
	};
};

func void dia_rumbold_stillthere_info()
{
	AI_Output(other,self,"DIA_Rumbold_StillThere_15_00");	//Hej, ci¹gle tutaj?
	AI_Output(self,other,"DIA_Rumbold_StillThere_10_01");	//Mam ciê ju¿ doœæ!
	Info_ClearChoices(dia_rumbold_stillthere);
	Info_AddChoice(dia_rumbold_stillthere,DIALOG_ENDE,dia_rumbold_stillthere_endattack);
};

func void dia_rumbold_stillthere_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_PICKPOCKET(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 900;
	condition = dia_rumbold_pickpocket_condition;
	information = dia_rumbold_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_rumbold_pickpocket_condition()
{
	return c_beklauen(24,45);
};

func void dia_rumbold_pickpocket_info()
{
	Info_ClearChoices(dia_rumbold_pickpocket);
	Info_AddChoice(dia_rumbold_pickpocket,DIALOG_BACK,dia_rumbold_pickpocket_back);
	Info_AddChoice(dia_rumbold_pickpocket,DIALOG_PICKPOCKET,dia_rumbold_pickpocket_doit);
};

func void dia_rumbold_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rumbold_pickpocket);
};

func void dia_rumbold_pickpocket_back()
{
	Info_ClearChoices(dia_rumbold_pickpocket);
};

