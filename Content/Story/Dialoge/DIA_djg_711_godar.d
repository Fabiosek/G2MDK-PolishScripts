
instance DIA_GODAR_EXIT(C_INFO)
{
	npc = djg_711_godar;
	nr = 999;
	condition = dia_godar_exit_condition;
	information = dia_godar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_godar_exit_condition()
{
	return TRUE;
};

func void dia_godar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GODAR_HELLO(C_INFO)
{
	npc = djg_711_godar;
	nr = 4;
	condition = dia_godar_hello_condition;
	information = dia_godar_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_godar_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_godar_hello_info()
{
	AI_Output(self,other,"DIA_Godar_Hello_13_00");	//Hê? Co?
};


instance DIA_GODAR_COMEFROM(C_INFO)
{
	npc = djg_711_godar;
	nr = 4;
	condition = dia_godar_comefrom_condition;
	information = dia_godar_comefrom_info;
	permanent = FALSE;
	description = "Sk¹d pochodzisz?";
};


func int dia_godar_comefrom_condition()
{
	return TRUE;
};

func void dia_godar_comefrom_info()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");	//Sk¹d pochodzisz?
	AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");	//Pochodzimy z... Eeem, z miasta.
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Jesteœcie bandytami!",dia_godar_comefrom_bandits);
	Info_AddChoice(dia_godar_comefrom,"Dlaczego nigdy wczeœniej nie widzia³em ciê w mieœcie?",dia_godar_comefrom_notcity);
	Info_AddChoice(dia_godar_comefrom,"Rozumiem. Z miasta.",dia_godar_comefrom_understand);
};

func void dia_godar_comefrom_bandits()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");	//Jesteœcie bandytami!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");	//Ostro¿nie! ¯ebyœ siê nie zad³awi³!
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Spokojnie, nie doniosê na ciebie.",dia_godar_comefrom_bandits_keepcalm);
	Info_AddChoice(dia_godar_comefrom,"Nie przestraszysz mnie.",dia_godar_comefrom_bandits_nofear);
};

func void dia_godar_comefrom_bandits_keepcalm()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");	//Spokojnie, nie doniosê na ciebie.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");	//Mam nadziejê, dla twojego w³asnego dobra. Inaczej zginiesz.
	Info_ClearChoices(dia_godar_comefrom);
};

func void dia_godar_comefrom_bandits_nofear()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");	//Nie przestraszysz mnie.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");	//To siê jeszcze oka¿e.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_godar_comefrom_notcity()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");	//Nigdy wczeœniej nie widzia³em ciê w mieœcie.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");	//Nie znoszê, jak ktoœ za bardzo siê interesuje cudzymi sprawami.
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Nie.",dia_godar_comefrom_notcity_cutthroat);
	Info_AddChoice(dia_godar_comefrom,"Ach tak, z miasta.",dia_godar_comefrom_notcity_forget);
};

func void dia_godar_comefrom_notcity_forget()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");	//A tak, z miasta.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");	//W³aœnie tak.
	Info_ClearChoices(dia_godar_comefrom);
};

func void dia_godar_comefrom_notcity_cutthroat()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");	//Nie.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");	//Wiêc bêdê musia³ spuœciæ wam lanie.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_godar_comefrom_understand()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");	//Rozumiem. Z miasta.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");	//No widzisz!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");	//Masz, ³yknij sobie.
	CreateInvItems(self,itfo_beer,1);
	b_giveinvitems(self,other,itfo_beer,1);
	b_useitem(other,itfo_beer);
	Info_ClearChoices(dia_godar_comefrom);
};


instance DIA_GODAR_PLAN(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_plan_condition;
	information = dia_godar_plan_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_godar_plan_condition()
{
	return TRUE;
};

func void dia_godar_plan_info()
{
	AI_Output(other,self,"DIA_Godar_Plan_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Godar_Plan_13_01");	//S³yszeliœmy o polowaniu na smoki. Wiêc spakowaliœmy nasz dobytek i czym prêdzej tu przybyliœmy.
	AI_Output(self,other,"DIA_Godar_Plan_13_02");	//Ale jeœli mam byæ szczery, to smoki nic mnie nie obchodz¹. Chcê tylko zarobiæ.
	AI_Output(self,other,"DIA_Godar_Plan_13_03");	//Smoki maj¹ z³oto, prawda?
	AI_Output(other,self,"DIA_Godar_Plan_15_04");	//Z pewnoœci¹.
};


instance DIA_GODAR_DRAGONLORE(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_dragonlore_condition;
	information = dia_godar_dragonlore_info;
	permanent = FALSE;
	description = "Co wiesz na temat smoków?";
};


func int dia_godar_dragonlore_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_plan))
	{
		return TRUE;
	};
};

func void dia_godar_dragonlore_info()
{
	AI_Output(other,self,"DIA_Godar_DragonLore_15_00");	//Co wiesz na temat smoków?
	AI_Output(self,other,"DIA_Godar_DragonLore_13_01");	//Znam jedynie bajki, opowiadane dzieciom.
	AI_Output(self,other,"DIA_Godar_DragonLore_13_02");	//Wiesz, dziewice, z³oto, zianie ogniem, te sprawy.
};


instance DIA_GODAR_DESTINATION(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_destination_condition;
	information = dia_godar_destination_info;
	permanent = FALSE;
	description = "Dok¹d zamierzasz siê teraz udaæ?";
};


func int dia_godar_destination_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_plan))
	{
		return TRUE;
	};
};

func void dia_godar_destination_info()
{
	AI_Output(other,self,"DIA_Godar_Destination_15_00");	//Dok¹d zamierzasz siê teraz udaæ?
	AI_Output(self,other,"DIA_Godar_Destination_13_01");	//Nie mam pojêcia. Ci¹gle siê jeszcze zastanawiamy.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other,self,"DIA_Godar_Destination_15_02");	//Móg³byœ udaæ siê do zamku.
		AI_Output(self,other,"DIA_Godar_Destination_13_03");	//Za nic w œwiecie. Nie do paladynów.
		AI_Output(self,other,"DIA_Godar_Destination_13_04");	//Nie zamierzam wyl¹dowaæ z powrotem w wiêzieniu. Ju¿ raz tam by³em, i wystarczy.
	};
};


instance DIA_GODAR_ORKS(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_orks_condition;
	information = dia_godar_orks_info;
	permanent = FALSE;
	description = "A co z orkami?";
};


func int dia_godar_orks_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_destination))
	{
		return TRUE;
	};
};

func void dia_godar_orks_info()
{
	AI_Output(other,self,"DIA_Godar_Orks_15_00");	//A co z orkami?
	AI_Output(self,other,"DIA_Godar_Orks_13_01");	//Ca³y zamek jest otoczony.
	AI_Output(self,other,"DIA_Godar_Orks_13_02");	//Próba przedarcia siê to szaleñstwo. Wdaj siê w walkê, a ju¿ po tobie.
	AI_Output(self,other,"DIA_Godar_Orks_13_03");	//Nikt siê tam nie przedostanie.
	AI_Output(other,self,"DIA_Godar_Orks_15_04");	//Doprawdy?
};


instance DIA_GODAR_PRISON(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_prison_condition;
	information = dia_godar_prison_info;
	permanent = FALSE;
	description = "Za co siedzia³eœ w wiêzieniu?";
};


func int dia_godar_prison_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_godar_prison_info()
{
	AI_Output(other,self,"DIA_Godar_Prison_15_00");	//Za co siedzia³eœ w wiêzieniu?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_01");	//Akurat ci powiem. Niedoczekanie twoje.
		AI_Output(self,other,"DIA_Godar_Prison_13_02");	//Wy, magowie, macie jakieœ konszachty z paladynami. Nic wiêcej nie powiem. Zapomnij o ca³ej sprawie.
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_03");	//Zosta³em aresztowany za k³usownictwo. Za dwa nêdzne króliki!
		AI_Output(self,other,"DIA_Godar_Prison_13_04");	//Dosta³em za to 10 lat.
		AI_Output(other,self,"DIA_Godar_Prison_15_05");	//I to wszystko?
		AI_Output(self,other,"DIA_Godar_Prison_13_06");	//No... nie, broni³em siê, kiedy mnie schwytali.
		AI_Output(other,self,"DIA_Godar_Prison_15_07");	//I?
		AI_Output(self,other,"DIA_Godar_Prison_13_08");	//Nic na to nie mog³em poradziæ, ten facet siê potkn¹³ i sam skrêci³ sobie kark. Naprawdê!
		Info_ClearChoices(dia_godar_prison);
		Info_AddChoice(dia_godar_prison,"Sk¹d ja to znam?",dia_godar_prison_court);
		Info_AddChoice(dia_godar_prison,"Nie powinieneœ by³ pozwoliæ, aby ciê z³apali.",dia_godar_prison_pissoff);
	};
};

func void dia_godar_prison_court()
{
	AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");	//Brzmi znajomo.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");	//Rozumiesz, o czym mówiê. Te bogate œwinie nie maj¹ w ogóle pojêcia o tym, jak jesteœmy traktowani.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");	//W ogóle siê tym nie przejmuj¹.
	Info_ClearChoices(dia_godar_prison);
	GODARLIKESYOU = TRUE;
};

func void dia_godar_prison_pissoff()
{
	AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00");	//Nie powinieneœ by³ pozwoliæ, aby ciê z³apali.
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01");	//Za³o¿ê siê, ¿e ty nigdy nie by³eœ w wiêzieniu, co?
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02");	//Pozwól wiêc, ¿e poka¿ê ci, co mo¿e ciê spotkaæ w pierdlu.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_GODAR_HUNTING(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_hunting_condition;
	information = dia_godar_hunting_info;
	permanent = FALSE;
	description = "Mo¿esz mnie nauczyæ polowaæ?";
};


func int dia_godar_hunting_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_godar_hunting_info()
{
	AI_Output(other,self,"DIA_Godar_Hunting_15_00");	//Mo¿esz mnie nauczyæ polowaæ?
	if(GODARLIKESYOU == FALSE)
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_01");	//Chyba nie mówisz powa¿nie, co? Spadaj st¹d!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_03");	//Zwierzê to znacznie wiêcej ni¿ tylko miêso. Jeœli sprzedasz jego skórê lub pazury, mo¿esz na tym sporo zarobiæ.
		AI_Output(self,other,"DIA_Godar_Hunting_13_04");	//Ju¿ siê nie mogê doczekaæ, a¿ dorwê jakiegoœ smoka.
		GODAR_TEACHANIMALTROPHY = TRUE;
	};
};


instance DIA_GODAR_DRAGONSTUFF(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_dragonstuff_condition;
	information = dia_godar_dragonstuff_info;
	permanent = TRUE;
	description = "Poka¿ mi, jak siê patroszy smoka.";
};


var int godar_teachdragonstuff;

func int dia_godar_dragonstuff_condition()
{
	if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)) && (GODAR_TEACHDRAGONSTUFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_godar_dragonstuff_info()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");	//Poka¿ mi, jak siê patroszy smoka.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");	//¯ebyœ móg³ zgarn¹æ ca³¹ kasê dla siebie, co?
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");	//No dobrze, ale to ciê bêdzie kosztowa³o 1000 sztuk z³ota.
	Info_ClearChoices(dia_godar_dragonstuff);
	Info_AddChoice(dia_godar_dragonstuff,"Ta wiedza nie jest dla mnie tyle warta.",dia_godar_dragonstuff_nein);
	Info_AddChoice(dia_godar_dragonstuff,"W porz¹dku.",dia_godar_dragonstuff_fair);
};

func void dia_godar_dragonstuff_fair()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");	//W porz¹dku.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		GODAR_TEACHDRAGONSTUFF = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");	//Nie do koñca. Najpierw przynieœ mi pieni¹dze.
	};
	Info_ClearChoices(dia_godar_dragonstuff);
};

func void dia_godar_dragonstuff_nein()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");	//Ta wiedza nie jest dla mnie tyle warta.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");	//Bardzo proszê.
	Info_ClearChoices(dia_godar_dragonstuff);
};


instance DIA_GODAR_TEACH(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_teach_condition;
	information = dia_godar_teach_info;
	permanent = TRUE;
	description = "Poka¿ mi, jak nale¿y polowaæ.";
};


func int dia_godar_teach_condition()
{
	if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_godar_teach_info()
{
	AI_Output(other,self,"DIA_Godar_Teach_15_00");	//Poka¿ mi, jak nale¿y polowaæ.
	if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE))
	{
		Info_AddChoice(dia_godar_teach,DIALOG_BACK,dia_godar_teach_back);
		if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Skradaj siê",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),dia_godar_teach_thief_sneak);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Usuñ k³y",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_godar_teach_trophys_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("¯¹d³o krwiopijcy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_godar_teach_trophys_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Skrzyd³a krwiopijcy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_godar_teach_trophys_bfwing);
		};
		if(GODAR_TEACHDRAGONSTUFF == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
			{
				Info_AddChoice(dia_godar_teach,b_buildlearnstring("Usuñ smocze ³uski",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONSCALE)),dia_godar_teach_trophys_dragonscale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
			{
				Info_AddChoice(dia_godar_teach,b_buildlearnstring("Zbieraj smocz¹ krew",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONBLOOD)),dia_godar_teach_trophys_dragonblood);
			};
		};
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void dia_godar_teach_back()
{
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");	//Zêby naj³atwiej usun¹æ przy pomocy mocnego no¿a.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");	//Jeœli naciœniesz na odpowiednie miejsce, ¿¹d³o krwiopijcy wysunie siê i bêdziesz móg³ je odci¹æ.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");	//Skrzyd³a krwiopijcy s¹ bardzo delikatne, dlatego musisz uwa¿aæ przy ich usuwaniu.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_thief_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");	//Podczas polowania u¿ywaj obuwia na miêkkiej podeszwie. Twarde buty robi¹ strasznie du¿o ha³asu.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_dragonscale()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");	//Bêdziesz potrzebowa³ du¿o si³y, aby wyrwaæ smocze ³uski. Zapewniam ciê jednak, ¿e da siê to zrobiæ.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_dragonblood()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");	//Aby utoczyæ smoczej krwi, znajdŸ ods³oniête miejsce na brzuchu i wbij tam nó¿.
	};
	Info_ClearChoices(dia_godar_teach);
};


instance DIA_GODAR_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_alldragonsdead_condition;
	information = dia_godar_alldragonsdead_info;
	permanent = FALSE;
	description = "Zabi³em wszystkie smoki.";
};


func int dia_godar_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_godar_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00");	//Zabi³em wszystkie smoki.
	AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01");	//I co z tego? Tu w dolinie jest ich ca³y czas pod dostatkiem.
};


instance DIA_GODAR_PICKPOCKET(C_INFO)
{
	npc = djg_711_godar;
	nr = 900;
	condition = dia_godar_pickpocket_condition;
	information = dia_godar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_godar_pickpocket_condition()
{
	return c_beklauen(16,160);
};

func void dia_godar_pickpocket_info()
{
	Info_ClearChoices(dia_godar_pickpocket);
	Info_AddChoice(dia_godar_pickpocket,DIALOG_BACK,dia_godar_pickpocket_back);
	Info_AddChoice(dia_godar_pickpocket,DIALOG_PICKPOCKET,dia_godar_pickpocket_doit);
};

func void dia_godar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_godar_pickpocket);
};

func void dia_godar_pickpocket_back()
{
	Info_ClearChoices(dia_godar_pickpocket);
};

