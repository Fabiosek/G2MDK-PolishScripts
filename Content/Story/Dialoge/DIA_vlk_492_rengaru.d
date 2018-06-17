
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
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//A niby dlaczego mia�bym ci m�wi�. Spadaj!
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_HALLODIEB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hallodieb_condition;
	information = dia_rengaru_hallodieb_info;
	permanent = FALSE;
	description = "Jora m�wi, �e masz jego pieni�dze.";
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
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//Jora m�wi, �e masz jego pieni�dze.
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//Cholera! Spadam st�d!
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
	description = "Mam ci�!";
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
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//Mam ci�!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//Czego ode mnie chcesz?
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//Okrad�e� Jor� w bia�y dzie�, widzia� nawet, jak to robi�e�.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//Przyszed�em ci wi�c powiedzie�, �e jeste� zawszonym z�odziejem i...
	Info_ClearChoices(dia_rengaru_gotyou);
	Info_AddChoice(dia_rengaru_gotyou,"...Zas�uguj� na udzia�.",dia_rengaru_gotyou_anteil);
	Info_AddChoice(dia_rengaru_gotyou,"...�eby� lepiej zwr�ci� Jorze skradzione pieni�dze, natychmiast.",dia_rengaru_gotyou_youthief);
	Info_AddChoice(dia_rengaru_gotyou,"...Teraz gadaj, kim jeste�?",dia_rengaru_gotyou_whoareyou);
};

func void dia_rengaru_gotyou_youthief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//...�eby� lepiej zwr�ci� Jorze skradzione pieni�dze, natychmiast.
	if(Npc_HasItems(self,itmi_gold) >= 1)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//Oto kasa! A teraz pozw�l mi odej��, obiecuj�, �e ju� nigdy nic nie ukradn�.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//Nie mam ju� tego z�ota.
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//Zreszt�, po co ja ci to w�a�ciwie m�wi�? Ju� mnie przecie� obrobi�e�!
		};
	};
	Info_ClearChoices(dia_rengaru_gotyou);
};

func void dia_rengaru_gotyou_anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//...Zas�uguj� na udzia�.
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (Npc_HasItems(self,itmi_gold) < 1))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//Poturbowa�e� mnie, wzi��e� wszystko, co mia�em! Pozw�l mi po prostu odej��!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//Trudno, wygl�da na to, �e nie mam wyboru. Podzielimy si� po po�owie.
		Info_ClearChoices(dia_rengaru_gotyou);
		Info_AddChoice(dia_rengaru_gotyou,"O nie! Oddasz mi wszystko!",dia_rengaru_gotyou_anteil_alles);
		Info_AddChoice(dia_rengaru_gotyou,"W porz�dku, oddaj mi po�ow�.",dia_rengaru_gotyou_anteil_gehtklar);
	};
};

func void dia_rengaru_gotyou_anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//O nie! Oddasz mi wszystko!
	if(Npc_HasItems(self,itmi_gold) >= 2)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//Postanowi�e� mnie obrobi� do cna. A bierz sobie ca�e z�oto i zostaw mnie w spokoju.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//Odda�bym ci z�oto, ale ju� go nie mam.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_anteil_gehtklar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//W porz�dku, oddaj mi po�ow�.
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold) / 2))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//Oto po�owa z�ota! A teraz zostaw mnie w spokoju!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//Ch�tnie odda�bym ci po�ow� z�ota, ale nie mam go ju� przy sobie.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_whoareyou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//...Teraz gadaj, kim jeste�?
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//Jestem tylko n�dzarzem, staraj�cym si� zwi�za� koniec z ko�cem, w taki czy inny spos�b.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//C� innego mi pozosta�o, w mie�cie pracy nie znajd�...
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//...Dobra, rozumiem. Oszcz�d� mi tych j�k�w.
};


instance DIA_RENGARU_INKNAST(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 4;
	condition = dia_rengaru_inknast_condition;
	information = dia_rengaru_inknast_info;
	permanent = FALSE;
	description = "Powinienem wyda� ci� stra�y.";
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
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//Powinienem wyda� ci� stra�y.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//Czego jeszcze ode mnie chcesz? Nie mam ju� nic! Zostaw mnie w spokoju!
	Info_AddChoice(dia_rengaru_inknast,"Dlaczego mia�bym chcie� to zrobi�?",dia_rengaru_inknast_keinknast);
	Info_AddChoice(dia_rengaru_inknast,"Dopilnuj�, by� trafi� za kratki.",dia_rengaru_inknast_knast);
	Info_AddChoice(dia_rengaru_inknast,"Won st�d! Nie chc� wi�cej ogl�da� twojej g�by!",dia_rengaru_inknast_hauab);
};

func void dia_rengaru_inknast_hauab()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//Won st�d! Nie chc� wi�cej ogl�da� twojej g�by!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//Nie po�a�ujesz tego! Dzi�ki, stary!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
};

func void dia_rengaru_inknast_knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//Dopilnuj�, by� trafi� za kratki.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//Nie chc� wi�cej k�opot�w, je�li uwa�asz, �e tak w�a�nie powiniene� post�pi�, prosz� bardzo.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//Uwa�aj jednak, moim przyjacio�om nie spodoba si� to, jak mnie potraktowa�e�...
	RENGARU_INKNAST = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_rengaru_inknast_keinknast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//Dlaczego mia�bym chcie� to zrobi�?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//W mie�cie dobrze jest zna� pewnych ludzi, i zawsze sta� po ich stronie.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//Mog� szepn�� dobre s��wko na tw�j temat tu i tam. Reszta zale�y od ciebie.
};


instance DIA_RENGARU_LASTINFOKAP1(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 6;
	condition = dia_rengaru_lastinfokap1_condition;
	information = dia_rengaru_lastinfokap1_info;
	permanent = TRUE;
	description = "I jak? Wszystko w porz�dku?";
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
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//I jak? Wszystko w porz�dku?
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//No dalej, nabijaj si� ze mnie. W ko�cu ci si� oberwie, przysi�gam!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//Czego jeszcze chcesz? Niczego wi�cej nie ukrad�em, jak babci� kocham!
	};
};


instance DIA_RENGARU_ZEICHEN(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_zeichen_condition;
	information = dia_rengaru_zeichen_info;
	permanent = FALSE;
	description = "(Poka� z�odziejski gest)";
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
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//Hej, jeste� jednym z nas.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//Pozw�l, �e co� ci powiem. Je�li chcesz obrobi� par� kieszonek w mie�cie, to uwa�aj na kupc�w!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//Te psubraty nie�le pilnuj� swojego towaru. Dam ci jednak wskaz�wk�.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//Kiedy b�dziesz �apa� przedmiot, kt�ry chcesz ukra��, jedn� r�k�, machaj drug�. To ich rozprasza.
	b_raiseattribute(other,ATR_DEXTERITY,1);
	Snd_Play("LEVELUP");
};

