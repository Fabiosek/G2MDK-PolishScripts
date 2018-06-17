
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
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_00");	//Co tu si� dzieje?
	AI_Output(other,self,"DIA_Landstreicher_HALLO_15_01");	//Co masz na my�li?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_02");	//Jeste� ju� drug� osob�, kt�ra przebiega t�dy, jakby j� goni�o stado krwiopijc�w.
	Info_ClearChoices(dia_landstreicher_hallo);
	Info_AddChoice(dia_landstreicher_hallo,"Musz� rusza� w drog�.",dia_landstreicher_hallo_weg);
	Info_AddChoice(dia_landstreicher_hallo,"A dok�d pobieg� m�j poprzednik?",dia_landstreicher_hallo_wo);
	Info_AddChoice(dia_landstreicher_hallo,"Kim by� ten cz�owiek?",dia_landstreicher_hallo_wer);
};

func void dia_landstreicher_hallo_wo()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wo_15_00");	//A dok�d pobieg� m�j poprzednik?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wo_09_01");	//Na g�r�.
};

func void dia_landstreicher_hallo_wer()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_15_00");	//Kim by� ten cz�owiek?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_01");	//Wygl�da� jak jeden z tych nowicjuszy z pobliskiego klasztoru.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_02");	//M�w sobie co chcesz, ale ci kolesie na pewno nie maj� do ko�ca po kolei w g�owach.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_03");	//Popatrz tylko na te ich krety�skie ciuchy. Gdyby kto� mnie kiedy� zobaczy� w czym� takim, chyba bym si� spali� ze wstydu.
		Info_AddChoice(dia_landstreicher_hallo,"Uwa�aj, co m�wisz.",dia_landstreicher_hallo_wer_vorsicht);
	};
};

func void dia_landstreicher_hallo_wer_vorsicht()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_15_00");	//Uwa�aj, co m�wisz. Sam kiedy� by�em nowicjuszem w klasztorze.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_01");	//Biedaku. Tak, to z pewno�ci� t�umaczy kilka spraw.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");	//Bez obrazy. Ruszaj dalej w swoj� drog�. Jeste� zaj�ty, nie chc� ci� zatrzymywa�.
	Info_AddChoice(dia_landstreicher_hallo,"Kto� powinien ci� nauczy� dobrych manier.",dia_landstreicher_hallo_wer_vorsicht_manieren);
};

func void dia_landstreicher_hallo_wer_vorsicht_manieren()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00");	//Kto� powinien ci� nauczy� dobrych manier.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01");	//No, nie obra�aj si� tak �atwo. Zreszt� dobrze, je�li koniecznie chcesz b�jki, to prosz� bardzo.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02");	//Poka� mi na co ci� sta�, nowicjuszu.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_landstreicher_hallo_weg()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_weg_15_00");	//Musz� rusza� w drog�.
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
		AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_01");	//Zadajesz cholernie du�o pyta�.
	};
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_02");	//Powiedz mi tylko, jak si� nazywasz, a zdradz� ci wszystkie swoje sekrety.
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_03");	//Czemu nie przestaniesz wsadza� nosa w nie swoje sprawy?
	AI_StopProcessInfos(self);
};

