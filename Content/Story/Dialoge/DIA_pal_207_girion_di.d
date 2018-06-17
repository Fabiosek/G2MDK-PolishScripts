
instance DIA_GIRION_DI_XIT(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 999;
	condition = dia_girion_di_exit_condition;
	information = dia_girion_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_girion_di_exit_condition()
{
	return TRUE;
};

func void dia_girion_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_DI_HALLO(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 2;
	condition = dia_girion_di_hallo_condition;
	information = dia_girion_di_hallo_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_girion_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_di_hallo_info()
{
	AI_Output(other,self,"DIA_Girion_DI_Hallo_15_00");	//Czy wszystko w porz¹dku?
	if(ORKSTURMDI == TRUE)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_01");	//Orkowie wykazali siê spor¹ odwag¹, staj¹c przeciwko mnie.
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_02");	//Wdanie siê w walkê z królewskim paladynem nie by³o z ich strony zbyt m¹dre.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_03");	//Tak myœlê. Jak du¿o czasu potrzeba ci na wype³nienie misji?
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_04");	//Nie traktuj mnie jak idioty. Rób, co musisz, a potem oddawaj statek.
	};
};


instance DIA_GIRION_DI_TEACH(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 5;
	condition = dia_girion_di_teach_condition;
	information = dia_girion_di_teach_info;
	permanent = TRUE;
	description = "Nauczaj mnie - szybciej siê st¹d wszyscy wydostaniemy!";
};


func int dia_girion_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_di_teach_info()
{
	AI_Output(other,self,"DIA_Girion_DI_Teach_15_00");	//Jeœli mnie wytrenujesz, bêdziemy mogli szybciej opuœciæ to miejsce.
	AI_Output(self,other,"DIA_Girion_DI_Teach_08_01");	//Wygl¹da na to, ¿e nie mam innego wyboru.
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_crossbow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00");	//Nigdy nie podnoœ ³okci. Powoduje to usztywnienie nadgarstków, co z kolei wp³ywa na obni¿enie celnoœci.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_crossbow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00");	//Zawsze przed strza³em rozluŸnij lewe ramiê. Dziêki temu bêdziesz móg³ lepiej wycelowaæ.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Twoje ostrze musi byæ szybkie niczym wiatr.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Pamiêtaj, ¿e rozwi¹zania si³owe z regu³y s¹ nieskuteczne. Zamiast machaæ mieczem na oœlep, musisz precyzyjnie wyliczyæ ka¿dy cios.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90))
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//Nie trzymaj rêkojeœci tak kurczowo, wtedy masz wiêksze szanse trafienia.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//Pamiêtaj o kontrataku. Najlepsz¹ obronê zapewni¹ ci uniki.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_back()
{
	Info_ClearChoices(dia_girion_di_teach);
};


instance DIA_GIRION_DI_ORCELITERING(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 99;
	condition = dia_girion_di_orcelitering_condition;
	information = dia_girion_di_orcelitering_info;
	permanent = TRUE;
	description = "Mam tu pierœcieñ orkowego herszta.";
};


func int dia_girion_di_orcelitering_condition()
{
	if(Npc_HasItems(other,itri_orcelitering))
	{
		return TRUE;
	};
};


var int dia_girion_di_orcelitering_onetime;

func void dia_girion_di_orcelitering_info()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_15_00");	//Mam tu pierœcieñ orkowego herszta.
	if(DIA_GIRION_DI_ORCELITERING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_01");	//Przypuszczam, ¿e móg³by siê przydaæ Lordowi Hagenowi.
		DIA_GIRION_DI_ORCELITERING_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_02");	//Daj go mnie, a ja dostarczê go Hagenowi.
	Info_ClearChoices(dia_girion_di_orcelitering);
	Info_AddChoice(dia_girion_di_orcelitering,"Wola³bym go raczej zatrzymaæ dla siebie.",dia_girion_di_orcelitering_behalten);
	Info_AddChoice(dia_girion_di_orcelitering,"Proszê, weŸ go.",dia_girion_di_orcelitering_geben);
};

func void dia_girion_di_orcelitering_geben()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_geben_15_00");	//Proszê, weŸ go.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_geben_08_01");	//Dziêkujê. I tak nie mam co z nim zrobiæ.
	Info_ClearChoices(dia_girion_di_orcelitering);
	b_giveinvitems(other,self,itri_orcelitering,1);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_girion_di_orcelitering_behalten()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_behalten_15_00");	//Wola³bym go raczej zatrzymaæ dla siebie.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_behalten_08_01");	//Bardzo proszê. I tak nic z nim nie zrobisz.
	Info_ClearChoices(dia_girion_di_orcelitering);
};


instance DIA_GIRION_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 2;
	condition = dia_girion_di_undeaddragondead_condition;
	information = dia_girion_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Mo¿emy odp³ywaæ.";
};


func int dia_girion_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_girion_di_undeaddragondead_onetime;

func void dia_girion_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_00");	//Mo¿emy odp³ywaæ.
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_01");	//Najwy¿szy czas. Ju¿ myœla³em, ¿e przyjdzie mi spêdziæ resztê ¿ycia na tym klifie.
	if(DIA_GIRION_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_02");	//A teraz przeka¿ mi dowodzenie nad okrêtem.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_03");	//Nie dotarliœmy jeszcze do Khorinis. A skoro ju¿ o tym mowa, to wcale nie mam ochoty tam wracaæ.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_04");	//Mam ju¿ doœæ tego miejsca.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_05");	//Te¿ o tym myœla³em. Ale to nie miejsce ani czas na takie dyskusje. Pogadamy na ten temat, kiedy znajdziemy siê na morzu.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_06");	//Niezale¿nie od wszystkiego cieszê siê, ¿e uda³o ci siê wróciæ na statek w jednym kawa³ku.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_07");	//Jesteœ prawdziwym wojownikiem Innosa. Nie mam co do tego ¿adnych w¹tpliwoœci. Cieszê siê, ¿e jesteœmy po tej samej stronie.
		}
		else
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_08");	//Nawet jeœli jesteœ draniem, tym razem post¹pi³eœ w³aœciwie.
		};
		DIA_GIRION_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_09");	//Dobrze. A teraz idŸ do kapitana i ka¿ mu odp³yn¹æ z tego miejsca.
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_DI_PICKPOCKET(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 900;
	condition = dia_girion_di_pickpocket_condition;
	information = dia_girion_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_girion_di_pickpocket_condition()
{
	return c_beklauen(71,260);
};

func void dia_girion_di_pickpocket_info()
{
	Info_ClearChoices(dia_girion_di_pickpocket);
	Info_AddChoice(dia_girion_di_pickpocket,DIALOG_BACK,dia_girion_di_pickpocket_back);
	Info_AddChoice(dia_girion_di_pickpocket,DIALOG_PICKPOCKET,dia_girion_di_pickpocket_doit);
};

func void dia_girion_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_girion_di_pickpocket);
};

func void dia_girion_di_pickpocket_back()
{
	Info_ClearChoices(dia_girion_di_pickpocket);
};

