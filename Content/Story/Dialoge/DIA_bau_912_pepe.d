
instance DIA_PEPE_EXIT(C_INFO)
{
	npc = bau_912_pepe;
	nr = 999;
	condition = dia_pepe_exit_condition;
	information = dia_pepe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pepe_exit_condition()
{
	return TRUE;
};

func void dia_pepe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEPE_HALLO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 1;
	condition = dia_pepe_hallo_condition;
	information = dia_pepe_hallo_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_pepe_hallo_condition()
{
	return TRUE;
};

func void dia_pepe_hallo_info()
{
	AI_Output(other,self,"DIA_Pepe_Hallo_15_00");	//Co porabiasz?
	AI_Output(self,other,"DIA_Pepe_Hallo_03_01");	//Pilnujê owiec! I unikam k³opotów.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pepe_Hallo_15_02");	//Nie zawsze siê udaje, co?
		AI_Output(self,other,"DIA_Pepe_Hallo_03_03");	//No, szczególnie gdy wokó³ tylu najemników. Cieszê siê, ¿e jestem na pastwisku. Choæ i tu bywa niebezpiecznie.
	};
};


instance DIA_PEPE_DANGER(C_INFO)
{
	npc = bau_912_pepe;
	nr = 2;
	condition = dia_pepe_danger_condition;
	information = dia_pepe_danger_info;
	permanent = FALSE;
	description = "A jakie¿ to niebezpieczeñstwa czyhaj¹ na pastwisku?";
};


func int dia_pepe_danger_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_danger_info()
{
	AI_Output(other,self,"DIA_Pepe_Danger_15_00");	//Jakie to niebezpieczeñstwa czyhaj¹ na pastwisku?
	AI_Output(self,other,"DIA_Pepe_Danger_03_01");	//Po okolicy w³óczy siê niewielka wataha wilków. Ostatnio cholerne bestie prawie ka¿dego dnia porywaj¹ jedn¹ owcê.
	AI_Output(self,other,"DIA_Pepe_Danger_03_02");	//Jeszcze kilka dni temu mia³em ze dwa razy wiêcej owiec. Kiedy Onar siê o tym dowie, chyba mnie zat³ucze.
};


instance DIA_PEPE_WHYNOTSLD(C_INFO)
{
	npc = bau_912_pepe;
	nr = 3;
	condition = dia_pepe_whynotsld_condition;
	information = dia_pepe_whynotsld_info;
	permanent = FALSE;
	description = "Dlaczego nie powiedzia³eœ o wilkach najemnikom?";
};


func int dia_pepe_whynotsld_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_pepe_whynotsld_info()
{
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_00");	//Dlaczego nie powiedzia³eœ o wilkach najemnikom? Mogliby siê ich przecie¿ pozbyæ.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_01");	//Taa, wiem. Powinienem by³ im powiedzieæ. Ale nie powiedzia³em.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_02");	//Teraz, kiedy tyle owiec zosta³o porwanych, wolê ju¿ nic nie gadaæ.
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_03");	//Przecie¿ w³aœnie powiedzia³eœ MNIE...
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_04");	//W³aœnie zaczynam tego ¿a³owaæ.
};


instance DIA_PEPE_KILLWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 4;
	condition = dia_pepe_killwolves_condition;
	information = dia_pepe_killwolves_info;
	permanent = FALSE;
	description = "A gdybym zabi³ te wilki?";
};


func int dia_pepe_killwolves_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger))
	{
		return TRUE;
	};
};

func void dia_pepe_killwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_00");	//A gdybym zabi³ te wilki?
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_01");	//Ty, sam? Ha, ha. Nie wierzê. Ju¿ chyba prêdzej zrobi³by to któryœ z moich baranów.
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_02");	//Zapomnij. To by³a tylko taka sugestia. Przejdê siê do ch³opaków i zapytam, co oni na to.
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_03");	//Zaraz... A zreszt¹ dobrze, w porz¹dku! Ehm... jesteœ wielki i silny, móg³byœ pokonaæ i setkê wilków. Bardzo proszê!
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_04");	//Na ogó³ czaj¹ siê w krzakach, na obrze¿ach pastwiska. Myœlê, ¿e s¹ tylko cztery...
	AI_StopProcessInfos(self);
	Wld_InsertNpc(pepes_ywolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(pepes_ywolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(pepes_ywolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(pepes_ywolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_PEPE_KILLWOLVES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PEPEWOLVES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PEPEWOLVES,LOG_RUNNING);
	b_logentry(TOPIC_PEPEWOLVES,"Owcom Pepe zagra¿aj¹ kr¹¿¹ce po okolicy stada wilków. Powinienem siê nimi zaj¹æ.");
};


instance DIA_PEPE_KILLEDWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_killedwolves_condition;
	information = dia_pepe_killedwolves_info;
	permanent = TRUE;
	description = "Pozby³em siê wilków.";
};


func int dia_pepe_killedwolves_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_pepe_killedwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KilledWolves_15_00");	//Pozby³em siê wilków.
	if(Npc_IsDead(pepes_ywolf1) && Npc_IsDead(pepes_ywolf2) && Npc_IsDead(pepes_ywolf3) && Npc_IsDead(pepes_ywolf4))
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_01");	//Naprawdê? Innosowi niech bêd¹ dziêki!
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_02");	//Dalej jednak nie wiem, jak powiedzieæ Onarowi o tych wszystkich porwanych owcach.
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_03");	//To wszystko wina tego przeklêtego Bullka!
		MIS_PEPE_KILLWOLVES = LOG_SUCCESS;
		b_giveplayerxp(XP_PEPEWOLVES);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_04");	//Nie rób ze mnie idioty, wiem, ¿e bestie ci¹gle ¿yj¹.
	};
};


instance DIA_PEPE_BULLCO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullco_condition;
	information = dia_pepe_bullco_info;
	permanent = FALSE;
	description = "Dlaczego wspomnia³eœ Bullka?";
};


func int dia_pepe_bullco_condition()
{
	if((MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && !Npc_IsDead(bullco) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_pepe_bullco_info()
{
	AI_Output(other,self,"DIA_Pepe_Bullco_15_00");	//Dlaczego wspomnia³eœ Bullka?
	AI_Output(self,other,"DIA_Pepe_Bullco_03_01");	//To jeden z najemników. W³aœciwie to on mia³ siê zajmowaæ ochron¹ stada.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_02");	//Zamiast tego on i jego kumpel Sylvio przesiaduj¹ ca³ymi dniami z Thekl¹ w kuchni.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_03");	//Jeœli nie dostanê zap³aty, to bêdzie wina tego drania.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_04");	//Gdybym chocia¿ móg³ mu spuœciæ porz¹dne lanie. Jednak wszyscy siê go boj¹, to prawdziwy morderca.
	MIS_PEPE_KICKBULLCO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KICKBULLCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KICKBULLCO,LOG_RUNNING);
	b_logentry(TOPIC_KICKBULLCO,"Pepe jest niezadowolony, ¿e Bullko poœwiêca jego owcom tak ma³o uwagi, i szuka kogoœ, kto da³by mu nauczkê.");
};


instance DIA_PEPE_BULLCODEFEATED(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullcodefeated_condition;
	information = dia_pepe_bullcodefeated_info;
	permanent = FALSE;
	description = "Bullko dosta³ to, na co zas³ugiwa³. ";
};


func int dia_pepe_bullcodefeated_condition()
{
	if(MIS_PEPE_KICKBULLCO == LOG_RUNNING)
	{
		if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (djg_bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_pepe_bullcodefeated_info()
{
	AI_Output(other,self,"DIA_Pepe_BullcoDefeated_15_00");	//Bullko dosta³ to, na co zas³ugiwa³. Da³em mu porz¹dn¹ nauczkê.
	AI_Output(self,other,"DIA_Pepe_BullcoDefeated_03_01");	//Ta œwinia zas³u¿y³a sobie na to.
	MIS_PEPE_KICKBULLCO = LOG_SUCCESS;
	b_giveplayerxp(XP_KICKBULLCO);
};


instance DIA_PEPE_PERM(C_INFO)
{
	npc = bau_912_pepe;
	nr = 6;
	condition = dia_pepe_perm_condition;
	information = dia_pepe_perm_info;
	permanent = TRUE;
	description = "Co tam u ciebie? Jak owce?";
};


func int dia_pepe_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_perm_info()
{
	AI_Output(other,self,"DIA_Pepe_PERM_15_00");	//Co tam u ciebie? Jak owce?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_01");	//Wszystko w porz¹dku i ze mn¹, i z owcami. Przynajmniej z tymi, które pozosta³y przy ¿yciu.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_02");	//Na razie dobrze. Ale obawiam siê, ¿e pewnego dnia wilki wróc¹ i bêdzie ich jeszcze wiêcej.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_03");	//Dosz³y mnie dziwne wieœci. Podobno jakieœ wrogo nastawione typki zajê³y farmê Sekoba. Nie ruszaj¹ siê stamt¹d na krok.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_04");	//S³ysza³em, ¿e jacyœ ludzie zajêli farmê Lobarta. Mo¿e ktoœ powinien mu pomóc.
	};
};


instance DIA_PEPE_LIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 7;
	condition = dia_pepe_liesel_condition;
	information = dia_pepe_liesel_info;
	permanent = FALSE;
	description = "Czy móg³bym kupiæ owcê?";
};


func int dia_pepe_liesel_condition()
{
	if(Npc_KnowsInfo(hero,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_liesel_info()
{
	AI_Output(other,self,"DIA_Pepe_Liesel_15_00");	//Czy móg³bym kupiæ owcê?
	AI_Output(self,other,"DIA_Pepe_Liesel_03_01");	//Oczywiœcie, pod warunkiem, ¿e masz pieni¹dze. Owca bêdzie ciê kosztowa³a 100 sztuk z³ota.
	AI_Output(self,other,"DIA_Pepe_Liesel_03_02");	//Jeœli zap³acisz, dostaniesz owcê. Ale pamiêtaj, by dobrze j¹ traktowaæ.
};


var int pepe_schafgekauft;

instance DIA_PEPE_BUYLIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 8;
	condition = dia_pepe_buyliesel_condition;
	information = dia_pepe_buyliesel_info;
	permanent = TRUE;
	description = "Proszê, oto 100 sztuk z³ota. A teraz daj mi owcê.";
};


func int dia_pepe_buyliesel_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_liesel))
	{
		return TRUE;
	};
};

func void dia_pepe_buyliesel_info()
{
	AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_00");	//Proszê, oto 100 sztuk z³ota. A teraz daj mi owcê.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(PEPE_SCHAFGEKAUFT == 0)
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_01");	//Œwietnie. WeŸ sobie Betsy, znajdziesz j¹ na pastwisku.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_02");	//Powiedz jej tylko, ¿eby za tob¹ posz³a. Jak na owcê, jest ca³kiem sprytna. I pamiêtaj, opiekuj siê ni¹.
		}
		else
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_03");	//Znowu? Dobrze, weŸ Betsy.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_04");	//Betsy? Jak to? Poprzednia te¿ nazywa³a siê Betsy...
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_05");	//Wszystkie owce nazywaj¹ siê Betsy.
			if(PEPE_SCHAFGEKAUFT == 3)
			{
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_06");	//Oczywiœcie, nie dotyczy to baranów.
				AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_07");	//A one jak siê nazywaj¹?
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//Bruce.
			};
		};
		PEPE_SCHAFGEKAUFT = PEPE_SCHAFGEKAUFT + 1;
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_09");	//Nie masz dostatecznie du¿o pieniêdzy. Nie mogê ci sprzedaæ owcy po ni¿szej cenie.
	};
};


instance DIA_PEPE_PICKPOCKET(C_INFO)
{
	npc = bau_912_pepe;
	nr = 900;
	condition = dia_pepe_pickpocket_condition;
	information = dia_pepe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_pepe_pickpocket_condition()
{
	return c_beklauen(15,25);
};

func void dia_pepe_pickpocket_info()
{
	Info_ClearChoices(dia_pepe_pickpocket);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_BACK,dia_pepe_pickpocket_back);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_PICKPOCKET,dia_pepe_pickpocket_doit);
};

func void dia_pepe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pepe_pickpocket);
};

func void dia_pepe_pickpocket_back()
{
	Info_ClearChoices(dia_pepe_pickpocket);
};

