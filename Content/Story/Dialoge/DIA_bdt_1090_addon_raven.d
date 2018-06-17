
instance DIA_ADDON_RAVEN_EXIT(C_INFO)
{
	npc = bdt_1090_addon_raven;
	nr = 999;
	condition = dia_addon_raven_exit_condition;
	information = dia_addon_raven_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_raven_exit_condition()
{
	return TRUE;
};

func void dia_addon_raven_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAVEN_HI(C_INFO)
{
	npc = bdt_1090_addon_raven;
	nr = 1;
	condition = dia_addon_raven_hi_condition;
	information = dia_addon_raven_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_raven_hi_condition()
{
	return TRUE;
};

func void dia_addon_raven_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//Patrzcie, kto przyszed�.
	if(c_bodystatecontains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//M�j mistrz ostrzega�, �e Innos przy�le swoje s�ugi.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//Jednak nie spodziewa�em si� ciebie tak szybko.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//No, skoro by�e� taki szybki, zadbam o to, by� r�wnie szybko umar�.
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"To TY zginiesz.",dia_addon_raven_hi_du);
	Info_AddChoice(dia_addon_raven_hi,"Zaprzeda�e� dusz� Beliarowi!",dia_addon_raven_hi_soul);
};

func void dia_addon_raven_hi_du()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//To TY zginiesz.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//Nie jeste� dla mnie �adnym wyzwaniem. Mam miecz Beliara.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//Poprowadz� smoki na kontynent. Razem sprowadzimy na �wiat ludzi ciemno��.
};

func void dia_addon_raven_hi_soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//Zaprzeda�e� dusz� Beliarowi!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//To by� dobry uk�ad. B�d� dowodzi� jego armiami.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//A co z tob�? Jaka jest cena za TWOJ� dusz�?
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Dobra, do�� ju� si� nas�ucha�em. Poka�, co umiesz...",dia_addon_raven_hi_attack);
	Info_AddChoice(dia_addon_raven_hi,"Robi� tylko to, co trzeba zrobi�.",dia_addon_raven_hi_only);
};

func void dia_addon_raven_hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//Robi� tylko to, co trzeba zrobi�.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//Pos�uchajcie go. Innos przys�a� nam pokornego s�ug�!
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Dobra, do�� ju� si� nas�ucha�em. Poka�, co umiesz...",dia_addon_raven_hi_attack);
	Info_AddChoice(dia_addon_raven_hi,"Jeste� pewien, �e s�u�� Innosowi?",dia_addon_raven_hi_sure);
};

func void dia_addon_raven_hi_sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//Jeste� pewien, �e s�u�� Innosowi?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//Co? O czym ty m�wisz?
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//A je�li s�u�� Adanosowi?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//Nonsens!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//A mo�e *ja* te� s�u�� Beliarowi - albo samemu sobie.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//Nie b�dziesz wi�c dla mnie godnym przeciwnikiem!
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Dobra, do�� ju� si� nas�ucha�em. Poka�, co umiesz...",dia_addon_raven_hi_attack);
};

func void dia_addon_raven_hi_attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//Dobra, do�� ju� si� nas�ucha�em. Poka�, co umiesz...
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//Tak ci spieszno do ziemi? Dobra, sam tego chcia�e�...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

