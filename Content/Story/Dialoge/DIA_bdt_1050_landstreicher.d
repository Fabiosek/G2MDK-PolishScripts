
instance DIA_LANDSTREICHER_EXIT(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 999;
	condition = dia_landstreicher_exit_condition;
	information = dia_landstreicher_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_landstreicher_exit_condition()
{
	return TRUE;
};

func void dia_landstreicher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LANDSTREICHER_HALLO(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 5;
	condition = dia_landstreicher_hallo_condition;
	information = dia_landstreicher_hallo_info;
	important = TRUE;
};


func int dia_landstreicher_hallo_condition()
{
	return TRUE;
};

func void dia_landstreicher_hallo_info()
{
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_00");	//Co tu siê dzieje?
	AI_Output(other,self,"DIA_Landstreicher_HALLO_15_01");	//Co masz na myœli?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_02");	//Jesteœ ju¿ drug¹ osob¹, która przebiega têdy, jakby j¹ goni³o stado krwiopijców.
	Info_ClearChoices(dia_landstreicher_hallo);
	Info_AddChoice(dia_landstreicher_hallo,"Muszê ruszaæ w drogê.",dia_landstreicher_hallo_weg);
	Info_AddChoice(dia_landstreicher_hallo,"A dok¹d pobieg³ mój poprzednik?",dia_landstreicher_hallo_wo);
	Info_AddChoice(dia_landstreicher_hallo,"Kim by³ ten cz³owiek?",dia_landstreicher_hallo_wer);
};

func void dia_landstreicher_hallo_wo()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wo_15_00");	//A dok¹d pobieg³ mój poprzednik?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wo_09_01");	//Na górê.
};

func void dia_landstreicher_hallo_wer()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_15_00");	//Kim by³ ten cz³owiek?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_01");	//Wygl¹da³ jak jeden z tych nowicjuszy z pobliskiego klasztoru.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_02");	//Mów sobie co chcesz, ale ci kolesie na pewno nie maj¹ do koñca po kolei w g³owach.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_03");	//Popatrz tylko na te ich kretyñskie ciuchy. Gdyby ktoœ mnie kiedyœ zobaczy³ w czymœ takim, chyba bym siê spali³ ze wstydu.
		Info_AddChoice(dia_landstreicher_hallo,"Uwa¿aj, co mówisz.",dia_landstreicher_hallo_wer_vorsicht);
	};
};

func void dia_landstreicher_hallo_wer_vorsicht()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_15_00");	//Uwa¿aj, co mówisz. Sam kiedyœ by³em nowicjuszem w klasztorze.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_01");	//Biedaku. Tak, to z pewnoœci¹ t³umaczy kilka spraw.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");	//Bez obrazy. Ruszaj dalej w swoj¹ drogê. Jesteœ zajêty, nie chcê ciê zatrzymywaæ.
	Info_AddChoice(dia_landstreicher_hallo,"Ktoœ powinien ciê nauczyæ dobrych manier.",dia_landstreicher_hallo_wer_vorsicht_manieren);
};

func void dia_landstreicher_hallo_wer_vorsicht_manieren()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00");	//Ktoœ powinien ciê nauczyæ dobrych manier.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01");	//No, nie obra¿aj siê tak ³atwo. Zreszt¹ dobrze, jeœli koniecznie chcesz bójki, to proszê bardzo.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02");	//Poka¿ mi na co ciê staæ, nowicjuszu.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_landstreicher_hallo_weg()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_weg_15_00");	//Muszê ruszaæ w drogê.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_weg_09_01");	//Jasne. Nie ma sprawy.
	AI_StopProcessInfos(self);
};


instance DIA_LANDSTREICHER_WASMACHSTDU(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 6;
	condition = dia_landstreicher_wasmachstdu_condition;
	information = dia_landstreicher_wasmachstdu_info;
	permanent = TRUE;
	description = "Czego tu szukasz?";
};


func int dia_landstreicher_wasmachstdu_condition()
{
	return TRUE;
};

func void dia_landstreicher_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Landstreicher_WASMACHSTDU_15_00");	//Czego tu szukasz?
	if(Npc_KnowsInfo(other,dia_landstreicher_hallo))
	{
		AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_01");	//Zadajesz cholernie du¿o pytañ.
	};
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_02");	//Powiedz mi tylko, jak siê nazywasz, a zdradzê ci wszystkie swoje sekrety.
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_03");	//Czemu nie przestaniesz wsadzaæ nosa w nie swoje sprawy?
	AI_StopProcessInfos(self);
};

