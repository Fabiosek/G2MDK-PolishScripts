
instance DIA_ROD_EXIT(C_INFO)
{
	npc = sld_804_rod;
	nr = 999;
	condition = dia_rod_exit_condition;
	information = dia_rod_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rod_exit_condition()
{
	return TRUE;
};

func void dia_rod_exit_info()
{
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};


instance DIA_ROD_HELLO(C_INFO)
{
	npc = sld_804_rod;
	nr = 1;
	condition = dia_rod_hello_condition;
	information = dia_rod_hello_info;
	permanent = FALSE;
	description = "Jak leci?";
};


func int dia_rod_hello_condition()
{
	return TRUE;
};

func void dia_rod_hello_info()
{
	AI_Output(other,self,"DIA_Rod_Hello_15_00");	//Co s³ychaæ?
	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other,"DIA_Rod_Hello_06_01");	//Czego ode mnie chcesz, miêczaku?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Rod_Hello_06_02");	//Nie znaleŸli ci milutkiego pokoiku w klasztorze?
		};
	};
};


var int rod_schwachgesagt;

instance DIA_ROD_WANNALEARN(C_INFO)
{
	npc = sld_804_rod;
	nr = 2;
	condition = dia_rod_wannalearn_condition;
	information = dia_rod_wannalearn_info;
	permanent = TRUE;
	description = "Czy móg³byœ mnie nauczyæ, jak walczyæ broni¹ dwurêczn¹?";
};


func int dia_rod_wannalearn_condition()
{
	if(ROD_TEACH2H == FALSE)
	{
		return TRUE;
	};
};

func void dia_rod_wannalearn_info()
{
	AI_Output(other,self,"DIA_Rod_WannaLearn_15_00");	//Czy móg³byœ mnie nauczyæ, jak walczyæ broni¹ dwurêczn¹?
	if((ROD_WETTEGEWONNEN == TRUE) || (self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_01");	//Jestem niezgorszym wojownikiem, co nie znaczy - dobrym nauczycielem.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_02");	//Chocia¿ pewnie móg³bym ci pokazaæ podstawy walki t¹ broni¹.
		if(Npc_HasItems(self,itmw_2h_rod) == 0)
		{
			AI_Output(self,other,"DIA_Rod_WannaLearn_06_03");	//Pod warunkiem, oczywiœcie, ¿e mi zwrócisz mój miecz.
		}
		else
		{
			ROD_TEACH2H = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_04");	//Pos³uchaj ch³opcze. Potrzeba wiele si³y, by w ogóle udŸwign¹æ broñ dwurêczn¹.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_05");	//Skocz ch³opcze lepiej na pastwisko i pobaw siê w ciuciubabkê z owieczkami!
		ROD_SCHWACHGESAGT = TRUE;
	};
};


var int rod_merke_2h;

instance DIA_ROD_TEACH(C_INFO)
{
	npc = sld_804_rod;
	nr = 3;
	condition = dia_rod_teach_condition;
	information = dia_rod_teach_info;
	permanent = TRUE;
	description = "Chcê poprawiæ swoje umiejêtnoœci w walce broni¹ dwurêczn¹!";
};


func int dia_rod_teach_condition()
{
	if(ROD_TEACH2H == TRUE)
	{
		return TRUE;
	};
};

func void dia_rod_teach_info()
{
	AI_Output(other,self,"DIA_Rod_Teach_15_00");	//Chcê poprawiæ swoje umiejêtnoœci w walce broni¹ dwurêczn¹!
	ROD_MERKE_2H = other.hitchance[NPC_TALENT_2H];
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};

func void dia_rod_teach_back()
{
	if(ROD_MERKE_2H < other.hitchance[NPC_TALENT_2H])
	{
		AI_Output(self,other,"DIA_Rod_Teach_BACK_06_00");	//Ju¿ ca³kiem nieŸle sobie radzisz.
	};
	Info_ClearChoices(dia_rod_teach);
};

func void dia_rod_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};

func void dia_rod_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};


instance DIA_ROD_WANNAJOIN(C_INFO)
{
	npc = sld_804_rod;
	nr = 4;
	condition = dia_rod_wannajoin_condition;
	information = dia_rod_wannajoin_info;
	permanent = TRUE;
	description = "Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?";
};


func int dia_rod_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rod_wannajoin_info()
{
	AI_Output(other,self,"DIA_Rod_WannaJoin_15_00");	//Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?
	if(Npc_HasItems(self,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_01");	//Mo¿e najpierw oddasz mi miecz, co?
	}
	else if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_02");	//W porz¹dku, nie chowam urazy.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_03");	//Dobrze walczysz, a to jest najwa¿niejsze.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_04");	//Bójki miêdzy przyjació³mi to tutaj normalka. Przyzwyczaisz siê.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_05");	//No proszê, masz ju¿ ca³kiem przyzwoity miecz. Reszty te¿ siê nauczysz.
		};
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_06");	//Jeœli o mnie chodzi, nie ma sprawy.
		b_logentry(TOPIC_SLDRESPEKT,"Rod poprze mnie, jeœli zechcê siê przy³¹czyæ do najemników.");
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_07");	//Nie mamy tu miejsca dla miêczaków.
		ROD_SCHWACHGESAGT = TRUE;
	};
};


instance DIA_ROD_DUELL(C_INFO)
{
	npc = sld_804_rod;
	nr = 6;
	condition = dia_rod_duell_condition;
	information = dia_rod_duell_info;
	permanent = TRUE;
	description = "Chyba przyda³aby ci siê lekcja dobrych manier, co?";
};


func int dia_rod_duell_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		if((ROD_WETTEGEWONNEN == FALSE) && (ROD_SCHWACHGESAGT == TRUE))
		{
			return TRUE;
		};
		if(MIS_JARVIS_SLDKO == LOG_RUNNING)
		{
			return TRUE;
		};
	};
};

func void dia_rod_duell_info()
{
	AI_Output(other,self,"DIA_Rod_Duell_15_00");	//Chyba przyda³aby ci siê lekcja dobrych manier, co?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_01");	//Dalej, spróbuj!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_02");	//Chyba nigdy siê nie nauczysz!
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ROD_STARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_starkgenug_condition;
	information = dia_rod_starkgenug_info;
	permanent = FALSE;
	description = "Jestem raczej silny!";
};


func int dia_rod_starkgenug_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && (ROD_SCHWACHGESAGT == TRUE))
	{
		return TRUE;
	};
};

func void dia_rod_starkgenug_info()
{
	AI_Output(other,self,"DIA_Rod_StarkGenug_15_00");	//Jestem doœæ silny!
	AI_Output(self,other,"DIA_Rod_StarkGenug_06_01");	//Nonsens! Nie uniós³byœ nawet przyzwoitego miecza, takiego jak choæby mój.
	Log_CreateTopic(TOPIC_RODWETTE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RODWETTE,LOG_RUNNING);
	b_logentry(TOPIC_RODWETTE,"Najemnik Rod twierdzi, ¿e nie zdo³am udŸwign¹æ jego miecza.");
};


instance DIA_ROD_BINSTARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_binstarkgenug_condition;
	information = dia_rod_binstarkgenug_info;
	permanent = FALSE;
	description = "Powiedzia³em, ¿e JESTEM dostatecznie silny.";
};


func int dia_rod_binstarkgenug_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && Npc_KnowsInfo(other,dia_rod_starkgenug))
	{
		return TRUE;
	};
};

func void dia_rod_binstarkgenug_info()
{
	AI_Output(other,self,"DIA_Rod_BINStarkGenug_15_00");	//Powiedzia³em, ¿e JESTEM dostatecznie silny.
	AI_Output(self,other,"DIA_Rod_BINStarkGenug_06_01");	//Jesteœ rozbrajaj¹cy. Zaryzykujesz zak³adzik?
};


var int rod_wettegewonnen;
var int rod_wetteangenommen;

instance DIA_ROD_WETTE(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_wette_condition;
	information = dia_rod_wette_info;
	permanent = TRUE;
	description = "Za³o¿ê siê, ¿e spokojnie dam sobie radê z twoim mieczem!";
};


func int dia_rod_wette_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && Npc_KnowsInfo(other,dia_rod_binstarkgenug) && (Npc_HasItems(self,itmw_2h_rod) > 0) && (ROD_WETTEANGENOMMEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_rod_wette_info()
{
	AI_Output(other,self,"DIA_Rod_Wette_15_00");	//Za³o¿ê siê, ¿e spokojnie dam sobie radê z twoim mieczem!
	AI_Output(self,other,"DIA_Rod_Wette_06_01");	//Naprawdê? Hmmm... Ile chcesz przegraæ?
	AI_Output(self,other,"DIA_Rod_Wette_06_02");	//No có¿, wygl¹dasz raczej na biednego durnia. Powiedzmy - 30 sztuk z³ota! Masz chocia¿ tyle?
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"Nie.",dia_rod_wette_no);
	Info_AddChoice(dia_rod_wette,"Jasne.",dia_rod_wette_yes);
	b_logentry(TOPIC_RODWETTE,"Rod gotów jest za³o¿yæ siê o 30 sztuk z³ota, ¿e nie udŸwignê jego miecza.");
};

func void dia_rod_wette_no()
{
	AI_Output(other,self,"DIA_Rod_Wette_No_15_00");	//Nie.
	AI_Output(self,other,"DIA_Rod_Wette_No_06_01");	//Ach, odejdŸ.
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_yes()
{
	AI_Output(other,self,"DIA_Rod_Wette_Yes_15_00");	//Jasne.
	AI_Output(self,other,"DIA_Rod_Wette_Yes_06_01");	//Niech no spojrzê...
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		ROD_WETTEANGENOMMEN = TRUE;
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_02");	//Proszê!
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_03");	//W porz¹dku, zobaczmy, na co ciê staæ...
		b_giveinvitems(self,other,itmw_2h_rod,1);
		if(other.attribute[ATR_STRENGTH] >= 30)
		{
			AI_UnequipWeapons(other);
			AI_EquipBestMeleeWeapon(other);
			AI_ReadyMeleeWeapon(other);
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_04");	//Choæby na to?!
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_05");	//No có¿, wygl¹da na to, ¿e wygra³eœ.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_06");	//Kto by przypuszcza³. Naprawdê nie wygl¹dasz mi na kogoœ, kto mia³by tyle krzepy.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_07");	//Wygl¹da na to, ¿e w³aœnie straci³em 30 sztuk z³ota. Oto pieni¹dze.
			b_giveinvitems(self,other,itmi_gold,60);
			ROD_WETTEGEWONNEN = TRUE;
			b_giveplayerxp(XP_ROD);
		}
		else
		{
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_08");	//Nie udŸwignê tej broni!
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_09");	//To w³aœnie próbujê ci uœwiadomiæ!
		};
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_10");	//A teraz oddaj miecz.
		Info_ClearChoices(dia_rod_wette);
		Info_AddChoice(dia_rod_wette,"Raczej nie...",dia_rod_wette_keepit);
		Info_AddChoice(dia_rod_wette,"Proszê!",dia_rod_wette_giveback);
	}
	else
	{
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_11");	//Chwileczkê, gdzie¿ ja go po³o¿y³em...
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_12");	//Hmmm... Wróæ, kiedy bêdziesz mia³ pieni¹dze na zak³ad.
		Info_ClearChoices(dia_rod_wette);
	};
};

func void dia_rod_wette_giveback()
{
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Rod_Wette_GiveBack_15_00");	//Proszê!
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"(Oddaj broñ)",dia_rod_wette_giveback2);
};

func void dia_rod_wette_giveback2()
{
	b_giveinvitems(other,self,itmw_2h_rod,1);
	if(ROD_WETTEGEWONNEN == FALSE)
	{
		AI_Output(self,other,"DIA_Rod_Wette_GiveBack_06_01");	//Mimo wszystko jesteœ miêczak i tyle.
	};
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_keepit()
{
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_00");	//Raczej nie...
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_01");	//S³ucham?
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//Chyba zatrzymam go na jakiœ czas.
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_03");	//Zaczekaj no, skurczybyku!
	Info_ClearChoices(dia_rod_wette);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


var int rod_schwertxpgiven;

instance DIA_ROD_GIVEITBACK(C_INFO)
{
	npc = sld_804_rod;
	nr = 7;
	condition = dia_rod_giveitback_condition;
	information = dia_rod_giveitback_info;
	permanent = TRUE;
	description = "Proszê, oto twój miecz!";
};


func int dia_rod_giveitback_condition()
{
	if(Npc_HasItems(other,itmw_2h_rod) > 0)
	{
		return TRUE;
	};
};

func void dia_rod_giveitback_info()
{
	b_giveinvitems(other,self,itmw_2h_rod,1);
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//Proszê, oto twój miecz!
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Czas najwy¿szy!
	if(ROD_SCHWERTXPGIVEN == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		ROD_SCHWERTXPGIVEN = TRUE;
	};
};


instance DIA_ROD_PERM(C_INFO)
{
	npc = sld_804_rod;
	nr = 1;
	condition = dia_rod_perm_condition;
	information = dia_rod_perm_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_rod_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rod_hello))
	{
		return TRUE;
	};
};

func void dia_rod_perm_info()
{
	AI_Output(other,self,"DIA_Rod_PERM_15_00");	//Jak leci?
	if(KAPITEL <= 2)
	{
		if(other.guild == GIL_NONE)
		{
			if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE))
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_01");	//Nie twoja sprawa, koleœ.
				ROD_SCHWACHGESAGT = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_02");	//Ciekawe czy pozwol¹ ci siê przy³¹czyæ.
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_03");	//Jesteœ teraz jednym z nas, ch³opcze. Chyba siê jakoœ dogadamy.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_04");	//Nie ma tu dla ciebie miejsca. IdŸ siê lepiej powa³êsaæ gdzie indziej.
		};
	};
	if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Rod_PERM_06_05");	//Jeœli opowieœci o smokach s¹ prawdziwe, powinniœmy zebraæ paru ludzi i pokazaæ tym bestiom, gdzie ich miejsce!
	};
};


instance DIA_RODSLD_PICKPOCKET(C_INFO)
{
	npc = sld_804_rod;
	nr = 900;
	condition = dia_rodsld_pickpocket_condition;
	information = dia_rodsld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rodsld_pickpocket_condition()
{
	return c_beklauen(15,35);
};

func void dia_rodsld_pickpocket_info()
{
	Info_ClearChoices(dia_rodsld_pickpocket);
	Info_AddChoice(dia_rodsld_pickpocket,DIALOG_BACK,dia_rodsld_pickpocket_back);
	Info_AddChoice(dia_rodsld_pickpocket,DIALOG_PICKPOCKET,dia_rodsld_pickpocket_doit);
};

func void dia_rodsld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rodsld_pickpocket);
};

func void dia_rodsld_pickpocket_back()
{
	Info_ClearChoices(dia_rodsld_pickpocket);
};

