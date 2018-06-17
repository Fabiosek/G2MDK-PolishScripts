
instance DIA_RENGARU_EXIT(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 999;
	condition = dia_rengaru_exit_condition;
	information = dia_rengaru_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rengaru_exit_condition()
{
	return TRUE;
};

func void dia_rengaru_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_PICKPOCKET(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 900;
	condition = dia_rengaru_pickpocket_condition;
	information = dia_rengaru_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rengaru_pickpocket_condition()
{
	return c_beklauen(20,5);
};

func void dia_rengaru_pickpocket_info()
{
	Info_ClearChoices(dia_rengaru_pickpocket);
	Info_AddChoice(dia_rengaru_pickpocket,DIALOG_BACK,dia_rengaru_pickpocket_back);
	Info_AddChoice(dia_rengaru_pickpocket,DIALOG_PICKPOCKET,dia_rengaru_pickpocket_doit);
};

func void dia_rengaru_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rengaru_pickpocket);
};

func void dia_rengaru_pickpocket_back()
{
	Info_ClearChoices(dia_rengaru_pickpocket);
};


instance DIA_RENGARU_HAUAB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hauab_condition;
	information = dia_rengaru_hauab_info;
	permanent = TRUE;
	description = "Co tu porabiasz?";
};


func int dia_rengaru_hauab_condition()
{
	if((JORA_DIEB != LOG_RUNNING) && (Npc_KnowsInfo(other,dia_rengaru_gotyou) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rengaru_hauab_info()
{
	AI_Output(other,self,"DIA_Rengaru_Hauab_15_00");	//Co tu porabiasz?
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//A niby dlaczego mia³bym ci mówiæ. Spadaj!
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_HALLODIEB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hallodieb_condition;
	information = dia_rengaru_hallodieb_info;
	permanent = FALSE;
	description = "Jora mówi, ¿e masz jego pieni¹dze.";
};


func int dia_rengaru_hallodieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_rengaru_hallodieb_info()
{
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//Jora mówi, ¿e masz jego pieni¹dze.
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//Cholera! Spadam st¹d!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunAway");
};


instance DIA_RENGARU_GOTYOU(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 3;
	condition = dia_rengaru_gotyou_condition;
	information = dia_rengaru_gotyou_info;
	permanent = FALSE;
	description = "Mam ciê!";
};


func int dia_rengaru_gotyou_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		return TRUE;
	};
};

func void dia_rengaru_gotyou_info()
{
	b_giveplayerxp(XP_RENGARUGOTTHIEF);
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//Mam ciê!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//Czego ode mnie chcesz?
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//Okrad³eœ Jorê w bia³y dzieñ, widzia³ nawet, jak to robi³eœ.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//Przyszed³em ci wiêc powiedzieæ, ¿e jesteœ zawszonym z³odziejem i...
	Info_ClearChoices(dia_rengaru_gotyou);
	Info_AddChoice(dia_rengaru_gotyou,"...Zas³ugujê na udzia³.",dia_rengaru_gotyou_anteil);
	Info_AddChoice(dia_rengaru_gotyou,"...¿ebyœ lepiej zwróci³ Jorze skradzione pieni¹dze, natychmiast.",dia_rengaru_gotyou_youthief);
	Info_AddChoice(dia_rengaru_gotyou,"...Teraz gadaj, kim jesteœ?",dia_rengaru_gotyou_whoareyou);
};

func void dia_rengaru_gotyou_youthief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//...¿ebyœ lepiej zwróci³ Jorze skradzione pieni¹dze, natychmiast.
	if(Npc_HasItems(self,itmi_gold) >= 1)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//Oto kasa! A teraz pozwól mi odejœæ, obiecujê, ¿e ju¿ nigdy nic nie ukradnê.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//Nie mam ju¿ tego z³ota.
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//Zreszt¹, po co ja ci to w³aœciwie mówiê? Ju¿ mnie przecie¿ obrobi³eœ!
		};
	};
	Info_ClearChoices(dia_rengaru_gotyou);
};

func void dia_rengaru_gotyou_anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//...Zas³ugujê na udzia³.
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (Npc_HasItems(self,itmi_gold) < 1))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//Poturbowa³eœ mnie, wzi¹³eœ wszystko, co mia³em! Pozwól mi po prostu odejœæ!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//Trudno, wygl¹da na to, ¿e nie mam wyboru. Podzielimy siê po po³owie.
		Info_ClearChoices(dia_rengaru_gotyou);
		Info_AddChoice(dia_rengaru_gotyou,"O nie! Oddasz mi wszystko!",dia_rengaru_gotyou_anteil_alles);
		Info_AddChoice(dia_rengaru_gotyou,"W porz¹dku, oddaj mi po³owê.",dia_rengaru_gotyou_anteil_gehtklar);
	};
};

func void dia_rengaru_gotyou_anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//O nie! Oddasz mi wszystko!
	if(Npc_HasItems(self,itmi_gold) >= 2)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//Postanowi³eœ mnie obrobiæ do cna. A bierz sobie ca³e z³oto i zostaw mnie w spokoju.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//Odda³bym ci z³oto, ale ju¿ go nie mam.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_anteil_gehtklar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//W porz¹dku, oddaj mi po³owê.
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold) / 2))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//Oto po³owa z³ota! A teraz zostaw mnie w spokoju!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//Chêtnie odda³bym ci po³owê z³ota, ale nie mam go ju¿ przy sobie.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_whoareyou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//...Teraz gadaj, kim jesteœ?
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//Jestem tylko nêdzarzem, staraj¹cym siê zwi¹zaæ koniec z koñcem, w taki czy inny sposób.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//Có¿ innego mi pozosta³o, w mieœcie pracy nie znajdê...
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//...Dobra, rozumiem. OszczêdŸ mi tych jêków.
};


instance DIA_RENGARU_INKNAST(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 4;
	condition = dia_rengaru_inknast_condition;
	information = dia_rengaru_inknast_info;
	permanent = FALSE;
	description = "Powinienem wydaæ ciê stra¿y.";
};


func int dia_rengaru_inknast_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_gotyou))
	{
		return TRUE;
	};
};

func void dia_rengaru_inknast_info()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//Powinienem wydaæ ciê stra¿y.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//Czego jeszcze ode mnie chcesz? Nie mam ju¿ nic! Zostaw mnie w spokoju!
	Info_AddChoice(dia_rengaru_inknast,"Dlaczego mia³bym chcieæ to zrobiæ?",dia_rengaru_inknast_keinknast);
	Info_AddChoice(dia_rengaru_inknast,"Dopilnujê, byœ trafi³ za kratki.",dia_rengaru_inknast_knast);
	Info_AddChoice(dia_rengaru_inknast,"Won st¹d! Nie chcê wiêcej ogl¹daæ twojej gêby!",dia_rengaru_inknast_hauab);
};

func void dia_rengaru_inknast_hauab()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//Won st¹d! Nie chcê wiêcej ogl¹daæ twojej gêby!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//Nie po¿a³ujesz tego! Dziêki, stary!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
};

func void dia_rengaru_inknast_knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//Dopilnujê, byœ trafi³ za kratki.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//Nie chcê wiêcej k³opotów, jeœli uwa¿asz, ¿e tak w³aœnie powinieneœ post¹piæ, proszê bardzo.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//Uwa¿aj jednak, moim przyjacio³om nie spodoba siê to, jak mnie potraktowa³eœ...
	RENGARU_INKNAST = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_rengaru_inknast_keinknast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//Dlaczego mia³bym chcieæ to zrobiæ?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//W mieœcie dobrze jest znaæ pewnych ludzi, i zawsze staæ po ich stronie.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//Mogê szepn¹æ dobre s³ówko na twój temat tu i tam. Reszta zale¿y od ciebie.
};


instance DIA_RENGARU_LASTINFOKAP1(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 6;
	condition = dia_rengaru_lastinfokap1_condition;
	information = dia_rengaru_lastinfokap1_info;
	permanent = TRUE;
	description = "I jak? Wszystko w porz¹dku?";
};


func int dia_rengaru_lastinfokap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_inknast))
	{
		return TRUE;
	};
};

func void dia_rengaru_lastinfokap1_info()
{
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//I jak? Wszystko w porz¹dku?
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//No dalej, nabijaj siê ze mnie. W koñcu ci siê oberwie, przysiêgam!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//Czego jeszcze chcesz? Niczego wiêcej nie ukrad³em, jak babciê kocham!
	};
};


instance DIA_RENGARU_ZEICHEN(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_zeichen_condition;
	information = dia_rengaru_zeichen_info;
	permanent = FALSE;
	description = "(Poka¿ z³odziejski gest)";
};


func int dia_rengaru_zeichen_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (RENGARU_INKNAST == FALSE) && Npc_KnowsInfo(other,dia_rengaru_gotyou))
	{
		return TRUE;
	};
};

func void dia_rengaru_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//Hej, jesteœ jednym z nas.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//Pozwól, ¿e coœ ci powiem. Jeœli chcesz obrobiæ parê kieszonek w mieœcie, to uwa¿aj na kupców!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//Te psubraty nieŸle pilnuj¹ swojego towaru. Dam ci jednak wskazówkê.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//Kiedy bêdziesz ³apa³ przedmiot, który chcesz ukraœæ, jedn¹ rêk¹, machaj drug¹. To ich rozprasza.
	b_raiseattribute(other,ATR_DEXTERITY,1);
	Snd_Play("LEVELUP");
};

