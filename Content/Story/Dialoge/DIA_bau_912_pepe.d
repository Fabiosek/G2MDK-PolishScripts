
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
	AI_Output(self,other,"DIA_Pepe_Hallo_03_01");	//Pilnuj� owiec! I unikam k�opot�w.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pepe_Hallo_15_02");	//Nie zawsze si� udaje, co?
		AI_Output(self,other,"DIA_Pepe_Hallo_03_03");	//No, szczeg�lnie gdy wok� tylu najemnik�w. Ciesz� si�, �e jestem na pastwisku. Cho� i tu bywa niebezpiecznie.
	};
};


instance DIA_PEPE_DANGER(C_INFO)
{
	npc = bau_912_pepe;
	nr = 2;
	condition = dia_pepe_danger_condition;
	information = dia_pepe_danger_info;
	permanent = FALSE;
	description = "A jakie� to niebezpiecze�stwa czyhaj� na pastwisku?";
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
	AI_Output(other,self,"DIA_Pepe_Danger_15_00");	//Jakie to niebezpiecze�stwa czyhaj� na pastwisku?
	AI_Output(self,other,"DIA_Pepe_Danger_03_01");	//Po okolicy w��czy si� niewielka wataha wilk�w. Ostatnio cholerne bestie prawie ka�dego dnia porywaj� jedn� owc�.
	AI_Output(self,other,"DIA_Pepe_Danger_03_02");	//Jeszcze kilka dni temu mia�em ze dwa razy wi�cej owiec. Kiedy Onar si� o tym dowie, chyba mnie zat�ucze.
};


instance DIA_PEPE_WHYNOTSLD(C_INFO)
{
	npc = bau_912_pepe;
	nr = 3;
	condition = dia_pepe_whynotsld_condition;
	information = dia_pepe_whynotsld_info;
	permanent = FALSE;
	description = "Dlaczego nie powiedzia�e� o wilkach najemnikom?";
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
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_00");	//Dlaczego nie powiedzia�e� o wilkach najemnikom? Mogliby si� ich przecie� pozby�.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_01");	//Taa, wiem. Powinienem by� im powiedzie�. Ale nie powiedzia�em.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_02");	//Teraz, kiedy tyle owiec zosta�o porwanych, wol� ju� nic nie gada�.
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_03");	//Przecie� w�a�nie powiedzia�e� MNIE...
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_04");	//W�a�nie zaczynam tego �a�owa�.
};


instance DIA_PEPE_KILLWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 4;
	condition = dia_pepe_killwolves_condition;
	information = dia_pepe_killwolves_info;
	permanent = FALSE;
	description = "A gdybym zabi� te wilki?";
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
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_00");	//A gdybym zabi� te wilki?
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_01");	//Ty, sam? Ha, ha. Nie wierz�. Ju� chyba pr�dzej zrobi�by to kt�ry� z moich baran�w.
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_02");	//Zapomnij. To by�a tylko taka sugestia. Przejd� si� do ch�opak�w i zapytam, co oni na to.
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_03");	//Zaraz... A zreszt� dobrze, w porz�dku! Ehm... jeste� wielki i silny, m�g�by� pokona� i setk� wilk�w. Bardzo prosz�!
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_04");	//Na og� czaj� si� w krzakach, na obrze�ach pastwiska. My�l�, �e s� tylko cztery...
	AI_StopProcessInfos(self);
	Wld_InsertNpc(pepes_ywolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(pepes_ywolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(pepes_ywolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(pepes_ywolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_PEPE_KILLWOLVES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PEPEWOLVES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PEPEWOLVES,LOG_RUNNING);
	b_logentry(TOPIC_PEPEWOLVES,"Owcom Pepe zagra�aj� kr���ce po okolicy stada wilk�w. Powinienem si� nimi zaj��.");
};


instance DIA_PEPE_KILLEDWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_killedwolves_condition;
	information = dia_pepe_killedwolves_info;
	permanent = TRUE;
	description = "Pozby�em si� wilk�w.";
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
	AI_Output(other,self,"DIA_Pepe_KilledWolves_15_00");	//Pozby�em si� wilk�w.
	if(Npc_IsDead(pepes_ywolf1) && Npc_IsDead(pepes_ywolf2) && Npc_IsDead(pepes_ywolf3) && Npc_IsDead(pepes_ywolf4))
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_01");	//Naprawd�? Innosowi niech b�d� dzi�ki!
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_02");	//Dalej jednak nie wiem, jak powiedzie� Onarowi o tych wszystkich porwanych owcach.
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_03");	//To wszystko wina tego przekl�tego Bullka!
		MIS_PEPE_KILLWOLVES = LOG_SUCCESS;
		b_giveplayerxp(XP_PEPEWOLVES);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_04");	//Nie r�b ze mnie idioty, wiem, �e bestie ci�gle �yj�.
	};
};


instance DIA_PEPE_BULLCO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullco_condition;
	information = dia_pepe_bullco_info;
	permanent = FALSE;
	description = "Dlaczego wspomnia�e� Bullka?";
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
	AI_Output(other,self,"DIA_Pepe_Bullco_15_00");	//Dlaczego wspomnia�e� Bullka?
	AI_Output(self,other,"DIA_Pepe_Bullco_03_01");	//To jeden z najemnik�w. W�a�ciwie to on mia� si� zajmowa� ochron� stada.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_02");	//Zamiast tego on i jego kumpel Sylvio przesiaduj� ca�ymi dniami z Thekl� w kuchni.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_03");	//Je�li nie dostan� zap�aty, to b�dzie wina tego drania.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_04");	//Gdybym chocia� m�g� mu spu�ci� porz�dne lanie. Jednak wszyscy si� go boj�, to prawdziwy morderca.
	MIS_PEPE_KICKBULLCO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KICKBULLCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KICKBULLCO,LOG_RUNNING);
	b_logentry(TOPIC_KICKBULLCO,"Pepe jest niezadowolony, �e Bullko po�wi�ca jego owcom tak ma�o uwagi, i szuka kogo�, kto da�by mu nauczk�.");
};


instance DIA_PEPE_BULLCODEFEATED(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullcodefeated_condition;
	information = dia_pepe_bullcodefeated_info;
	permanent = FALSE;
	description = "Bullko dosta� to, na co zas�ugiwa�. ";
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
	AI_Output(other,self,"DIA_Pepe_BullcoDefeated_15_00");	//Bullko dosta� to, na co zas�ugiwa�. Da�em mu porz�dn� nauczk�.
	AI_Output(self,other,"DIA_Pepe_BullcoDefeated_03_01");	//Ta �winia zas�u�y�a sobie na to.
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
		AI_Output(self,other,"DIA_Pepe_PERM_03_01");	//Wszystko w porz�dku i ze mn�, i z owcami. Przynajmniej z tymi, kt�re pozosta�y przy �yciu.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_02");	//Na razie dobrze. Ale obawiam si�, �e pewnego dnia wilki wr�c� i b�dzie ich jeszcze wi�cej.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_03");	//Dosz�y mnie dziwne wie�ci. Podobno jakie� wrogo nastawione typki zaj�y farm� Sekoba. Nie ruszaj� si� stamt�d na krok.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_04");	//S�ysza�em, �e jacy� ludzie zaj�li farm� Lobarta. Mo�e kto� powinien mu pom�c.
	};
};


instance DIA_PEPE_LIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 7;
	condition = dia_pepe_liesel_condition;
	information = dia_pepe_liesel_info;
	permanent = FALSE;
	description = "Czy m�g�bym kupi� owc�?";
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
	AI_Output(other,self,"DIA_Pepe_Liesel_15_00");	//Czy m�g�bym kupi� owc�?
	AI_Output(self,other,"DIA_Pepe_Liesel_03_01");	//Oczywi�cie, pod warunkiem, �e masz pieni�dze. Owca b�dzie ci� kosztowa�a 100 sztuk z�ota.
	AI_Output(self,other,"DIA_Pepe_Liesel_03_02");	//Je�li zap�acisz, dostaniesz owc�. Ale pami�taj, by dobrze j� traktowa�.
};


var int pepe_schafgekauft;

instance DIA_PEPE_BUYLIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 8;
	condition = dia_pepe_buyliesel_condition;
	information = dia_pepe_buyliesel_info;
	permanent = TRUE;
	description = "Prosz�, oto 100 sztuk z�ota. A teraz daj mi owc�.";
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
	AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_00");	//Prosz�, oto 100 sztuk z�ota. A teraz daj mi owc�.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(PEPE_SCHAFGEKAUFT == 0)
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_01");	//�wietnie. We� sobie Betsy, znajdziesz j� na pastwisku.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_02");	//Powiedz jej tylko, �eby za tob� posz�a. Jak na owc�, jest ca�kiem sprytna. I pami�taj, opiekuj si� ni�.
		}
		else
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_03");	//Znowu? Dobrze, we� Betsy.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_04");	//Betsy? Jak to? Poprzednia te� nazywa�a si� Betsy...
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_05");	//Wszystkie owce nazywaj� si� Betsy.
			if(PEPE_SCHAFGEKAUFT == 3)
			{
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_06");	//Oczywi�cie, nie dotyczy to baran�w.
				AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_07");	//A one jak si� nazywaj�?
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//Bruce.
			};
		};
		PEPE_SCHAFGEKAUFT = PEPE_SCHAFGEKAUFT + 1;
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_09");	//Nie masz dostatecznie du�o pieni�dzy. Nie mog� ci sprzeda� owcy po ni�szej cenie.
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

