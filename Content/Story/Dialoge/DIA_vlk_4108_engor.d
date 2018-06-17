
instance DIA_ENGOR_EXIT(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 999;
	condition = dia_engor_exit_condition;
	information = dia_engor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engor_exit_condition()
{
	return TRUE;
};

func void dia_engor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ENGOR_HALLO(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_hallo_condition;
	information = dia_engor_hallo_info;
	important = TRUE;
};


func int dia_engor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_engor_hallo_info()
{
	AI_Output(self,other,"DIA_Engor_HALLO_13_00");	//Ach, wi�c to ty jeste� tym cz�owiekiem, kt�ry przekroczy� prze��cz.
	AI_Output(other,self,"DIA_Engor_HALLO_15_01");	//Tak.
	AI_Output(self,other,"DIA_Engor_HALLO_13_02");	//Wspaniale - jestem Engor. Zajmuj� si� t� ekspedycj�.
	AI_Output(self,other,"DIA_Engor_HALLO_13_03");	//Tylko sobie nie my�l, �e mo�esz dosta� cokolwiek za darmo!
	AI_Output(self,other,"DIA_Engor_HALLO_13_04");	//Z drugiej strony, je�li masz w kieszeniach troch� z�ota, zawsze jestem got�w ubi� jaki� interes.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Engor zarz�dza zapasami na zamku. Od czasu do czasu zdarza mu si� robi� ma�e interesy na boku.");
};


instance DIA_ENGOR_HANDELN(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 10;
	condition = dia_engor_handeln_condition;
	information = dia_engor_handeln_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka� mi swoje towary.";
};


func int dia_engor_handeln_condition()
{
	if(Npc_KnowsInfo(hero,dia_engor_hallo))
	{
		return TRUE;
	};
};

func void dia_engor_handeln_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(other,self,"DIA_Engor_HANDELN_15_00");	//Poka� mi swoje towary.
};


instance DIA_ENGOR_ABOUTPARLAF(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_aboutparlaf_condition;
	information = dia_engor_aboutparlaf_info;
	description = "Podobno to ty jeste� odpowiedzialny za rozdzielanie racji.";
};


func int dia_engor_aboutparlaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlaf_engor))
	{
		return TRUE;
	};
};

func void dia_engor_aboutparlaf_info()
{
	AI_Output(other,self,"DIA_Engor_ABOUTPARLAF_15_00");	//Podobno to ty jeste� odpowiedzialny za rozdzielanie racji.
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_01");	//Zgadza si�. A co? Mo�e mam ci� jeszcze nakarmi�?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_02");	//Je�li czego� chcesz, musisz za to zap�aci� - jak ca�a reszta.
};


instance DIA_ENGOR_RUESTUNG(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_ruestung_condition;
	information = dia_engor_ruestung_info;
	permanent = FALSE;
	description = "Masz dla mnie co� ciekawego?";
};


func int dia_engor_ruestung_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_engor_ruestung_info()
{
	AI_Output(other,self,"DIA_Engor_Ruestung_15_00");	//Masz dla mnie co� ciekawego?
	AI_Output(self,other,"DIA_Engor_Ruestung_13_01");	//Mog� ci za�atwi� ci�k� zbroj�.
	AI_Output(self,other,"DIA_Engor_Ruestung_13_02");	//Oczywi�cie nie jest to tani towar. Przyjd� do mnie, kiedy ju� zdob�dziesz z�oto, a dobijemy interesu.
};


instance DIA_ENGOR_RSKAUFEN(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_rskaufen_condition;
	information = dia_engor_rskaufen_info;
	permanent = TRUE;
	description = "Kup ci�ki pancerz stra�y. Ochrona (bro� i strza�y) 70, 2500 sztuk z�ota.";
};


var int dia_engor_rskaufen_perm;

func int dia_engor_rskaufen_condition()
{
	if((other.guild == GIL_MIL) && Npc_KnowsInfo(other,dia_engor_ruestung) && (DIA_ENGOR_RSKAUFEN_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_engor_rskaufen_info()
{
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(other,self,"DIA_Engor_RSkaufen_15_00");	//Daj mi zbroj�.
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_01");	//Prosz�. Zapewnia doskona�� ochron�.
		b_giveinvitems(self,other,itar_mil_m,1);
		DIA_ENGOR_RSKAUFEN_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_02");	//Najpierw zdob�d� z�oto.
	};
};


instance DIA_ENGOR_HELP(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 3;
	condition = dia_engor_help_condition;
	information = dia_engor_help_info;
	description = "By� mo�e b�d� m�g� pom�c.";
};


func int dia_engor_help_condition()
{
	if(Npc_KnowsInfo(hero,dia_engor_aboutparlaf))
	{
		return TRUE;
	};
};

func void dia_engor_help_info()
{
	AI_Output(other,self,"DIA_Engor_HELP_15_00");	//By� mo�e b�d� m�g� pom�c.
	AI_Output(self,other,"DIA_Engor_HELP_13_01");	//Hmmm... Pewnie, czemu nie? Przyda mi si� pomoc.
	AI_Output(other,self,"DIA_Engor_HELP_15_02");	//Co jest do zrobienia?
	AI_Output(self,other,"DIA_Engor_HELP_13_03");	//Nasze zapasy �ywno�ci s� niewielkie. Szczeg�lnie potrzeba nam mi�sa.
	AI_Output(self,other,"DIA_Engor_HELP_13_04");	//Zatem je�li m�g�by� dostarczy� nam troch� mi�sa, surowego lub gotowanego, szynki lub kie�basy, byliby�my ci bardzo wdzi�czni. Co ty na to, pomo�esz nam?
	Info_ClearChoices(dia_engor_help);
	Info_AddChoice(dia_engor_help,"Nie mam na to czasu.",dia_engor_help_no);
	Info_AddChoice(dia_engor_help,"Nie martw si�, przynios� ci mi�so.",dia_engor_help_yes);
};

func void dia_engor_help_no()
{
	AI_Output(other,self,"DIA_Engor_HELP_NO_15_00");	//Nie mam na to czasu.
	AI_Output(self,other,"DIA_Engor_HELP_NO_13_01");	//Wi�c czemu marnujesz m�j?
	MIS_ENGOR_BRINGMEAT = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void dia_engor_help_yes()
{
	AI_Output(other,self,"DIA_Engor_HELP_YES_15_00");	//Nie martw si�, przynios� ci mi�so.
	AI_Output(self,other,"DIA_Engor_HELP_YES_13_01");	//Dwa tuziny sztuk mi�sa pozwoli�yby mi nape�ni� kilka g�odnych brzuch�w. Wr��, kiedy ju� zdob�dziesz mi�so. A teraz musz� wraca� do pracy.
	Log_CreateTopic(TOPIC_BRINGMEAT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRINGMEAT,LOG_RUNNING);
	b_logentry(TOPIC_BRINGMEAT,"Engor potrzebuje dw�ch tuzin�w kawa�k�w mi�sa, aby wy�ywi� swoich ludzi.");
	b_logentry(TOPIC_BRINGMEAT,"Niewa�ne, czy b�dzie to kie�basa, szynka, czy sma�one albo surowe mi�so. Chodzi tylko o to, �eby jego ch�opcy mogli co� wrzuci� na z�b.");
	MIS_ENGOR_BRINGMEAT = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_ENGOR_BRINGMEAT(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 4;
	condition = dia_engor_bringmeat_condition;
	information = dia_engor_bringmeat_info;
	permanent = TRUE;
	description = "Prosz�, przynios�em ci co� (oddaj mi�so).";
};


func int dia_engor_bringmeat_condition()
{
	if((MIS_ENGOR_BRINGMEAT == LOG_RUNNING) && (MEAT_COUNTER < MEAT_AMOUNT) && ((Npc_HasItems(hero,itfo_bacon) >= 1) || (Npc_HasItems(hero,itfomuttonraw) >= 1) || (Npc_HasItems(hero,itfomutton) >= 1) || (Npc_HasItems(hero,itfo_sausage) >= 1)))
	{
		return TRUE;
	};
};

func void dia_engor_bringmeat_info()
{
	var string concatraw;
	var string concatmutton;
	var string concatbacon;
	var string concatsausage;
	var string gesamtfleisch;
	AI_Output(other,self,"DIA_Engor_BRINGMEAT_15_00");	//Prosz�, przynios�em ci co�.
	if(Npc_HasItems(hero,itfomuttonraw) >= 1)
	{
		if((Npc_HasItems(hero,itfomuttonraw) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfomuttonraw,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfomuttonraw) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfomuttonraw);
			concatraw = IntToString(Npc_HasItems(other,itfomuttonraw));
			concatraw = ConcatStrings(concatraw,"Odda�e� surowe mi�so");
			AI_PrintScreen(concatraw,-1,35,FONT_SCREENSMALL,2);
			Npc_RemoveInvItems(other,itfomuttonraw,Npc_HasItems(other,itfomuttonraw));
		};
	};
	if(Npc_HasItems(hero,itfomutton) >= 1)
	{
		if((Npc_HasItems(hero,itfomutton) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfomutton,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfomutton) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfomutton);
			concatmutton = IntToString(Npc_HasItems(other,itfomutton));
			concatmutton = ConcatStrings(concatmutton,"Odda�e� sma�one mi�so");
			AI_PrintScreen(concatmutton,-1,38,FONT_SCREENSMALL,2);
			Npc_RemoveInvItems(other,itfomutton,Npc_HasItems(other,itfomutton));
		};
	};
	if(Npc_HasItems(hero,itfo_bacon) >= 1)
	{
		if((Npc_HasItems(hero,itfo_bacon) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfo_bacon,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfo_bacon) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfo_bacon);
			concatbacon = IntToString(Npc_HasItems(other,itfo_bacon));
			concatbacon = ConcatStrings(concatbacon,"Odda�e� szynk�");
			AI_PrintScreen(concatbacon,-1,41,FONT_SCREENSMALL,3);
			Npc_RemoveInvItems(other,itfo_bacon,Npc_HasItems(other,itfo_bacon));
		};
	};
	if(Npc_HasItems(hero,itfo_sausage) >= 1)
	{
		if((Npc_HasItems(hero,itfo_sausage) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfo_sausage,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfo_sausage) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfo_sausage);
			concatsausage = IntToString(Npc_HasItems(other,itfo_sausage));
			concatsausage = ConcatStrings(concatsausage,"Odda�e� kie�bas�");
			AI_PrintScreen(concatsausage,-1,44,FONT_SCREENSMALL,3);
			Npc_RemoveInvItems(other,itfo_sausage,Npc_HasItems(other,itfo_sausage));
		};
	};
	if(MEAT_AMOUNT > MEAT_COUNTER)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_01");	//Nie�le jak na pocz�tek, ale potrzeba mi wi�cej.
		gesamtfleisch = IntToString(MEAT_COUNTER);
		gesamtfleisch = ConcatStrings("Oddane mi�so:",gesamtfleisch);
		AI_PrintScreen(gesamtfleisch,-1,48,FONT_SCREENSMALL,3);
	};
	if(MEAT_COUNTER >= MEAT_AMOUNT)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_02");	//Przynios�e� wystarczaj�co du�o mi�sa. To powinno wystarczy� na jaki� czas.
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_03");	//Ale nie my�l sobie, �e cokolwiek dostaniesz za darmo!
		MIS_ENGOR_BRINGMEAT = LOG_SUCCESS;
		b_giveplayerxp(XP_BRINGMEAT);
		Log_AddEntry(TOPIC_BRINGMEAT,"Engor dosta� mi�so. Ma je rozdzieli� pomi�dzy swoich ludzi.");
	};
};


instance DIA_ENGOR_BUSINESS(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 1;
	condition = dia_engor_business_condition;
	information = dia_engor_business_info;
	permanent = FALSE;
	description = "Jak idzie interes?";
};


func int dia_engor_business_condition()
{
	if((KAPITEL >= 4) && (MIS_ENGOR_BRINGMEAT == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_engor_business_info()
{
	AI_Output(other,self,"DIA_Engor_Business_15_00");	//Jak interesy?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_01");	//No, no. Mam nadziej� �e �owcy smok�w s� r�wnie bogaci, co wygadani.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_02");	//Do niczego! Paladyni nic nie kupuj�.
	};
	AI_Output(self,other,"DIA_Engor_Business_13_03");	//Co z tob�, potrzebujesz jeszcze czego�?
};


instance DIA_ENGOR_PICKPOCKET(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 900;
	condition = dia_engor_pickpocket_condition;
	information = dia_engor_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tej mapy b�dzie ryzykowna)";
};


func int dia_engor_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_map_oldworld) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_engor_pickpocket_info()
{
	Info_ClearChoices(dia_engor_pickpocket);
	Info_AddChoice(dia_engor_pickpocket,DIALOG_BACK,dia_engor_pickpocket_back);
	Info_AddChoice(dia_engor_pickpocket,DIALOG_PICKPOCKET,dia_engor_pickpocket_doit);
};

func void dia_engor_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itwr_map_oldworld,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_engor_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_engor_pickpocket_back()
{
	Info_ClearChoices(dia_engor_pickpocket);
};

