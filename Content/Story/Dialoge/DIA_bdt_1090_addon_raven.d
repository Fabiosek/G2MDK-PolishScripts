
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
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//Patrzcie, kto przyszed³.
	if(c_bodystatecontains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//Mój mistrz ostrzega³, ¿e Innos przyœle swoje s³ugi.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//Jednak nie spodziewa³em siê ciebie tak szybko.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//No, skoro by³eœ taki szybki, zadbam o to, byœ równie szybko umar³.
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"To TY zginiesz.",dia_addon_raven_hi_du);
	Info_AddChoice(dia_addon_raven_hi,"Zaprzeda³eœ duszê Beliarowi!",dia_addon_raven_hi_soul);
};

func void dia_addon_raven_hi_du()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//To TY zginiesz.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//Nie jesteœ dla mnie ¿adnym wyzwaniem. Mam miecz Beliara.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//Poprowadzê smoki na kontynent. Razem sprowadzimy na œwiat ludzi ciemnoœæ.
};

func void dia_addon_raven_hi_soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//Zaprzeda³eœ duszê Beliarowi!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//To by³ dobry uk³ad. Bêdê dowodzi³ jego armiami.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//A co z tob¹? Jaka jest cena za TWOJ¥ duszê?
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Dobra, doœæ ju¿ siê nas³ucha³em. Poka¿, co umiesz...",dia_addon_raven_hi_attack);
	Info_AddChoice(dia_addon_raven_hi,"Robiê tylko to, co trzeba zrobiæ.",dia_addon_raven_hi_only);
};

func void dia_addon_raven_hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//Robiê tylko to, co trzeba zrobiæ.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//Pos³uchajcie go. Innos przys³a³ nam pokornego s³ugê!
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Dobra, doœæ ju¿ siê nas³ucha³em. Poka¿, co umiesz...",dia_addon_raven_hi_attack);
	Info_AddChoice(dia_addon_raven_hi,"Jesteœ pewien, ¿e s³u¿ê Innosowi?",dia_addon_raven_hi_sure);
};

func void dia_addon_raven_hi_sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//Jesteœ pewien, ¿e s³u¿ê Innosowi?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//Co? O czym ty mówisz?
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//A jeœli s³u¿ê Adanosowi?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//Nonsens!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//A mo¿e *ja* te¿ s³u¿ê Beliarowi - albo samemu sobie.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//Nie bêdziesz wiêc dla mnie godnym przeciwnikiem!
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Dobra, doœæ ju¿ siê nas³ucha³em. Poka¿, co umiesz...",dia_addon_raven_hi_attack);
};

func void dia_addon_raven_hi_attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//Dobra, doœæ ju¿ siê nas³ucha³em. Poka¿, co umiesz...
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//Tak ci spieszno do ziemi? Dobra, sam tego chcia³eœ...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

