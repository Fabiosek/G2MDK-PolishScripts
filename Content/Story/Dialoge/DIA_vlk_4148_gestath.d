
instance DIA_GESTATH_EXIT(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 999;
	condition = dia_gestath_exit_condition;
	information = dia_gestath_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gestath_exit_condition()
{
	return TRUE;
};

func void dia_gestath_exit_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroarmor,itar_djg_crawler) == TRUE)
	{
		AI_Output(self,other,"DIA_Gestath_EXIT_09_00");	//Niez³a zbroja!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GESTATH_HALLO(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 3;
	condition = dia_gestath_hallo_condition;
	information = dia_gestath_hallo_info;
	description = "Co s³ychaæ?";
};


func int dia_gestath_hallo_condition()
{
	return TRUE;
};

func void dia_gestath_hallo_info()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Gestath_HALLO_09_01");	//Przyjœcie tutaj jest prawdziwym aktem odwagi. Pewnie siê zgubi³eœ, co?
	GESTATH_TEACHANIMALTROPHY = TRUE;
	Info_ClearChoices(dia_gestath_hallo);
	Info_AddChoice(dia_gestath_hallo,"Jest tu coœ wartego zobaczenia?",dia_gestath_hallo_waszusehen);
	Info_AddChoice(dia_gestath_hallo,"Co tutaj robisz?",dia_gestath_hallo_was);
};

func void dia_gestath_hallo_plate()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_15_00");	//Niez³a zbroja.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_01");	//Taak. Ciê¿ko coœ takiego dostaæ. Jest zrobiona z pancerza pe³zacza. Zrobi³ j¹ dla mnie pewien cz³owiek imieniem Wilk.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_02");	//Wtedy by³em wiêŸniem w Kolonii. Da³em mu kilka ³usek pe³zacza, a parê dni póŸniej zbroja by³a ju¿ gotowa. Facet jest w porz¹dku.
	WOLF_PRODUCECRAWLERARMOR = TRUE;
	Info_AddChoice(dia_gestath_hallo,DIALOG_BACK,dia_gestath_hallo_back);
	Info_AddChoice(dia_gestath_hallo,"Gdzie teraz przebywa Wilk?",dia_gestath_hallo_plate_wowolf);
};

func void dia_gestath_hallo_plate_wowolf()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_woWolf_15_00");	//Gdzie teraz przebywa Wilk?
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_01");	//Nie widzia³em go od czasu, kiedy by³ najemnikiem w Kolonii.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_02");	//Przypuszczam, ¿e wci¹¿ obraca siê w tym samym towarzystwie.
};

func void dia_gestath_hallo_was()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_01");	//Zarabiam.
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_02");	//W takim miejscu?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_03");	//Jestem myœliwym. Specjalizujê siê w trudnych zadaniach.
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_04");	//Ogniste jaszczury, pe³zacze, zêbacze... Jednym s³owem - wszystko, na co nikt inny nie zechcia³by zapolowaæ.
	Info_AddChoice(dia_gestath_hallo,"Niez³a zbroja.",dia_gestath_hallo_plate);
};

func void dia_gestath_hallo_waszusehen()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_waszusehen_15_00");	//Jest tu coœ wartego zobaczenia?
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_01");	//Trochê ognistych jaszczurów, orków i cholera wie, czego jeszcze. Nie by³em jeszcze na wy¿ynach.
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_02");	//Nie radzê jednak próbowaæ. Stworzenia, które ¿yj¹ tam na górze, nie wygl¹daj¹ zbyt przyjaŸnie.
};

func void dia_gestath_hallo_back()
{
	Info_ClearChoices(dia_gestath_hallo);
};


instance DIA_GESTATH_DRACHEN(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 3;
	condition = dia_gestath_drachen_condition;
	information = dia_gestath_drachen_info;
	permanent = TRUE;
	description = "Potrafisz oprawiaæ smoki?";
};


var int gestath_dragontrophy;

func int dia_gestath_drachen_condition()
{
	if((GESTATH_DRAGONTROPHY == FALSE) && (GESTATH_TEACHANIMALTROPHY == TRUE))
	{
		return TRUE;
	};
};

func void dia_gestath_drachen_info()
{
	AI_Output(other,self,"DIA_Gestath_Drachen_15_00");	//Potrafisz oprawiaæ smoki?
	if(KAPITEL < 4)
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_01");	//Kiedyœ, kiedy nabierzesz doœwiadczenia, mo¿e nawet nauczê ciê tej sztuki!
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_02");	//Jasne.
		GESTATH_DRAGONTROPHY = TRUE;
	};
};


instance DIA_GESTATH_TEACHHUNTING(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 12;
	condition = dia_gestath_teachhunting_condition;
	information = dia_gestath_teachhunting_info;
	permanent = TRUE;
	description = "Naucz mnie sprawiaæ zwierzêta.";
};


func int dia_gestath_teachhunting_condition()
{
	if(GESTATH_TEACHANIMALTROPHY == TRUE)
	{
		return TRUE;
	};
};


var int dia_gestath_teachhunting_onetime;

func void dia_gestath_teachhunting_info()
{
	AI_Output(other,self,"DIA_Gestath_TEACHHUNTING_15_00");	//Naucz mnie sprawiaæ zwierzêta.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) || ((GESTATH_DRAGONTROPHY == TRUE) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE))))
	{
		if(DIA_GESTATH_TEACHHUNTING_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_01");	//Czemu nie? I tak mam chwilowo dosyæ wra¿eñ.
			DIA_GESTATH_TEACHHUNTING_ONETIME = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_02");	//Co chcesz wiedzieæ?
		};
		Info_AddChoice(dia_gestath_teachhunting,DIALOG_BACK,dia_gestath_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Jêzyk ognistego jaszczura",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FIRETONGUE)),dia_gestath_teachhunting_firetongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Usuñ p³yty pancerza pe³zacza",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE)),dia_gestath_teachhunting_crawlerplate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Usuñ ¿uwaczkê",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_gestath_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Róg smoczego zêbacza",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRGSNAPPERHORN)),dia_gestath_teachhunting_drgsnapperhorn);
		};
		if(GESTATH_DRAGONTROPHY == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
			{
				Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Usuñ smocze ³uski",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONSCALE)),dia_gestath_teachhunting_dragonscale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
			{
				Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Zbieraj smocz¹ krew",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONBLOOD)),dia_gestath_teachhunting_dragonblood);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_03");	//Nie wiem, czego jeszcze móg³bym ciê nauczyæ.
	};
};

func void dia_gestath_teachhunting_back()
{
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_firetongue()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FIRETONGUE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_FireTongue_09_00");	//Musisz przytrzymaæ jêzyk ognistego jaszczura rêk¹. Teraz odcinasz go jednym sprawnym ruchem.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_crawlerplate()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00");	//¯eby zerwaæ pancerze pe³zaczy, potrzebujesz naprawdê ostrego no¿a.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_Mandibles_09_00");	//¯uwaczki przytwierdzone s¹ doœæ mocno do czaszki polnej bestii lub pe³zacza. Usuniêcie ich wymaga trochê wysi³ku.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00");	//Aby odci¹æ zêbaczowi jego róg, potrzebujesz naprawdê mocnego no¿a. Wbij go w sam czubek g³owy.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_dragonscale()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonScale_09_00");	//Smocze ³uski s¹ naprawdê trudne do wyrwania, ale te na plecach s¹ stosunkowo p³ytko osadzone.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_dragonblood()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonBlood_09_00");	//Krew naj³atwiej spuœcisz, przecinaj¹c brzuch lub gard³o zwierzêcia ostrym no¿em.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};


instance DIA_GESTATH_PICKPOCKET(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 900;
	condition = dia_gestath_pickpocket_condition;
	information = dia_gestath_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_gestath_pickpocket_condition()
{
	return c_beklauen(81,350);
};

func void dia_gestath_pickpocket_info()
{
	Info_ClearChoices(dia_gestath_pickpocket);
	Info_AddChoice(dia_gestath_pickpocket,DIALOG_BACK,dia_gestath_pickpocket_back);
	Info_AddChoice(dia_gestath_pickpocket,DIALOG_PICKPOCKET,dia_gestath_pickpocket_doit);
};

func void dia_gestath_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gestath_pickpocket);
};

func void dia_gestath_pickpocket_back()
{
	Info_ClearChoices(dia_gestath_pickpocket);
};

