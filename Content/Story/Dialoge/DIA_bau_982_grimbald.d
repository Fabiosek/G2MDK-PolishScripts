
instance DIA_GRIMBALD_EXIT(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 999;
	condition = dia_grimbald_exit_condition;
	information = dia_grimbald_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_grimbald_exit_condition()
{
	return TRUE;
};

func void dia_grimbald_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRIMBALD_HALLO(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_hallo_condition;
	information = dia_grimbald_hallo_info;
	description = "Czekasz tu na kogoœ?";
};


func int dia_grimbald_hallo_condition()
{
	return TRUE;
};


var int grimbald_pissoff;

func void dia_grimbald_hallo_info()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_15_00");	//Czekasz tu na kogoœ?
	if(Npc_IsDead(grimbald_snapper1) && Npc_IsDead(grimbald_snapper2) && Npc_IsDead(grimbald_snapper3))
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_01");	//Polujê. To chyba oczywiste.
		GRIMBALD_PISSOFF = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_02");	//Ju¿ nie. Przecie¿ przyszed³eœ, prawda?
		Info_ClearChoices(dia_grimbald_hallo);
		Info_AddChoice(dia_grimbald_hallo,"Muszê siê zaj¹æ kilkoma sprawami.",dia_grimbald_hallo_nein);
		Info_AddChoice(dia_grimbald_hallo,"Czym siê zajmujesz?",dia_grimbald_hallo_was);
		Info_AddChoice(dia_grimbald_hallo,"Dlaczego czeka³eœ na mnie?",dia_grimbald_hallo_ich);
	};
};

func void dia_grimbald_hallo_ich()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_ich_15_00");	//Dlaczego czeka³eœ na mnie?
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_01");	//Wygl¹dasz na silnego. Przyda mi siê pomoc kogoœ takiego jak ty.
};

func void dia_grimbald_hallo_was()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_15_00");	//Co chcesz zrobiæ?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_07_01");	//Chcê zapolowaæ na zêbacze, ale obawiam siê, ¿e mo¿e ich byæ zbyt du¿o jak na si³y jednego myœliwego.
	Info_AddChoice(dia_grimbald_hallo,"Na mnie nie licz.",dia_grimbald_hallo_was_neinnein);
	Info_AddChoice(dia_grimbald_hallo,"Dobrze, pomogê ci. IdŸ przodem.",dia_grimbald_hallo_was_ja);
};

func void dia_grimbald_hallo_was_neinnein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_neinnein_15_00");	//Na mnie nie licz.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_neinnein_07_01");	//Tchórz!
	GRIMBALD_PISSOFF = TRUE;
	Info_ClearChoices(dia_grimbald_hallo);
};

func void dia_grimbald_hallo_was_ja()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_ja_15_00");	//Dobrze, pomogê ci. IdŸ przodem.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_01");	//Tylko nie zbli¿aj siê za bardzo do czarnego trolla. Rozerwa³by ciê na strzêpy, jasne?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_02");	//Biada ci, jeœli stchórzysz.
	b_startotherroutine(self,"Jagd");
	AI_StopProcessInfos(self);
};

func void dia_grimbald_hallo_nein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_nein_15_00");	//Muszê siê zaj¹æ kilkoma sprawami.
	AI_Output(self,other,"DIA_Grimbald_HALLO_nein_07_01");	//Nie pleæ bzdur. Co to za wa¿ne sprawy, które masz niby za³atwiæ w tej g³uszy?
};


instance DIA_GRIMBALD_JAGD(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_jagd_condition;
	information = dia_grimbald_jagd_info;
	permanent = TRUE;
	description = "Mo¿esz mnie nauczyæ polowaæ?";
};


func int dia_grimbald_jagd_condition()
{
	if(Npc_KnowsInfo(other,dia_grimbald_hallo) && (GRIMBALD_TEACHANIMALTROPHY == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimbald_jagd_info()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_15_00");	//Mo¿esz mnie nauczyæ czegoœ o polowaniu?
	if((Npc_IsDead(grimbald_snapper1) && Npc_IsDead(grimbald_snapper2) && Npc_IsDead(grimbald_snapper3)) || (GRIMBALD_PISSOFF == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_01");	//Hmmm. Dobrze. Co prawda do tej pory nie bardzo mi pomog³eœ, ale nie zamierzam ciê od razu skreœlaæ.
		GRIMBALD_TEACHANIMALTROPHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_02");	//Pewnie. Ale to bêdzie trochê kosztowaæ.
		b_say_gold(self,other,200);
		Info_ClearChoices(dia_grimbald_jagd);
		Info_AddChoice(dia_grimbald_jagd,"Muszê siê zastanowiæ.",dia_grimbald_jagd_zuviel);
		Info_AddChoice(dia_grimbald_jagd,"W porz¹dku.",dia_grimbald_jagd_ja);
	};
};

func void dia_grimbald_jagd_ja()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_ja_15_00");	//Dobrze. Oto pieni¹dze.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_01");	//W porz¹dku. Powiedz mi, kiedy bêdziesz chcia³ siê czegoœ nauczyæ.
		GRIMBALD_TEACHANIMALTROPHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_02");	//Przynieœ pieni¹dze, a mo¿e siê czegoœ nauczysz.
	};
	Info_ClearChoices(dia_grimbald_jagd);
};

func void dia_grimbald_jagd_zuviel()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_zuviel_15_00");	//Pomyœlê o tym.
	AI_Output(self,other,"DIA_Grimbald_Jagd_zuviel_07_01");	//Skoro tak mówisz.
	Info_ClearChoices(dia_grimbald_jagd);
};


instance DIA_GRIMBALD_TEACHHUNTING(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 12;
	condition = dia_grimbald_teachhunting_condition;
	information = dia_grimbald_teachhunting_info;
	permanent = TRUE;
	description = "Naucz mnie, jak powinno siê polowaæ.";
};


func int dia_grimbald_teachhunting_condition()
{
	if(GRIMBALD_TEACHANIMALTROPHY == TRUE)
	{
		return TRUE;
	};
};


var int dia_grimbald_teachhunting_onetime;

func void dia_grimbald_teachhunting_info()
{
	AI_Output(other,self,"DIA_Grimbald_TEACHHUNTING_15_00");	//Naucz mnie, jak powinno siê polowaæ.
	if(DIA_GRIMBALD_TEACHHUNTING_ONETIME == FALSE)
	{
		b_startotherroutine(self,"JagdOver");
		DIA_GRIMBALD_TEACHHUNTING_ONETIME = TRUE;
	};
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_01");	//Czego konkretnie chcia³byœ siê dowiedzieæ?
		Info_AddChoice(dia_grimbald_teachhunting,DIALOG_BACK,dia_grimbald_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("¯¹d³o krwiopijcy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_grimbald_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Skrzyd³a krwiopijcy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_grimbald_teachhunting_bfwing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Usuñ pazury",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_grimbald_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Usuñ ¿uwaczkê",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_grimbald_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Usuñ p³yty pancerza zêbacza",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE)),dia_grimbald_teachhunting_crawlerplate);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//Wiesz ju¿ wszystko, czego móg³bym ciê nauczyæ.
	};
};

func void dia_grimbald_teachhunting_back()
{
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFSting_07_00");	//Usuniêcie ¿¹d³a krwiopijcy nie powinno ci nastrêczaæ problemów. Wystarczy mocny nó¿.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFWing_07_00");	//Skrzyd³a krwiopijcy mo¿na urwaæ lub obci¹æ ostrym no¿em.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Claws_07_00");	//Istniej¹ ró¿ne sposoby usuwania pazurów. W przypadku niektórych zwierz¹t bêdziesz potrzebowaæ naprawdê du¿o si³y, kiedy indziej wystarczy jedynie ostry nó¿.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Mandibles_07_00");	//Pe³zacze i polne bestie maj¹ mocne ¿uwaczki, które mo¿na wyrwaæ z ich czaszek za pomoc¹ silnego szarpniêcia.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_crawlerplate()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00");	//Pancerz pe³zacza przylega œciœle do jego cia³a, jednak mo¿na go podwa¿yæ jakimœ p³askim narzêdziem.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};


instance DIA_GRIMBALD_NOVCHASE(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_novchase_condition;
	information = dia_grimbald_novchase_info;
	description = "Czy nie przechodzi³ têdy jakiœ nowicjusz?";
};


func int dia_grimbald_novchase_condition()
{
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_grimbald_novchase_info()
{
	AI_Output(other,self,"DIA_Grimbald_NovChase_15_00");	//Czy nie przechodzi³ têdy jakiœ nowicjusz?
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_01");	//Przesz³o têdy dzisiaj wielu dziwnych ludzi, w³¹czaj¹c tych dwóch ¿artownisiów przy kamiennym ³uku.
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_02");	//Faktycznie, by³ z nimi pewien nowicjusz z Klasztoru Magów Ognia.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GRIMBALD_TROLLTOT(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_trolltot_condition;
	information = dia_grimbald_trolltot_info;
	important = TRUE;
};


func int dia_grimbald_trolltot_condition()
{
	if(Npc_IsDead(troll_black))
	{
		return TRUE;
	};
};

func void dia_grimbald_trolltot_info()
{
	AI_Output(self,other,"DIA_Grimbald_Trolltot_07_00");	//Czarny troll nie ¿yje. Dobra robota. Nigdy nie s¹dzi³em, ¿e zabicie tych bestii jest w ogóle mo¿liwe.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GRIMBALD_PICKPOCKET(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 900;
	condition = dia_grimbald_pickpocket_condition;
	information = dia_grimbald_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_grimbald_pickpocket_condition()
{
	return c_beklauen(85,250);
};

func void dia_grimbald_pickpocket_info()
{
	Info_ClearChoices(dia_grimbald_pickpocket);
	Info_AddChoice(dia_grimbald_pickpocket,DIALOG_BACK,dia_grimbald_pickpocket_back);
	Info_AddChoice(dia_grimbald_pickpocket,DIALOG_PICKPOCKET,dia_grimbald_pickpocket_doit);
};

func void dia_grimbald_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grimbald_pickpocket);
};

func void dia_grimbald_pickpocket_back()
{
	Info_ClearChoices(dia_grimbald_pickpocket);
};

